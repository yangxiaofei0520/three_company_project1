/******************** (C) COPYRIGHT 2016 jason ,LTD ***********************
* File Name         : XinJiangProtocol.c
* Author            : maronglang
* Date First Issued : 2016/05/26
* Description       : 新疆物联网表通讯协议
*******************************************************************************/
#include "HeDaProtocol.h"
#include "Meter.h"
#include "DriverUart.h"
#include "GsmGlobal.h"
#include "FileGlobal.h"
#include "ProtocolGlobal.h"
#include "JX_Math.h"
//#include <stdio.h>
#include "STM8_Rtc.h"
#include "Alarm.h"
#include "Initialize.h"
#include "CJ188.h"
//#include "string.h"
#include "STM8_Rtc.h"

#ifdef HEDA_PTR


/*     全局变量位置         */
u8 g_Device_Info[15]={0}; 		//设备信息
TypeProtol_HD stDataPtrHD;		//接受发送结构体缓存
u8 g_HD_Ctrl=0;					//控制码 BIT7：1 → 数据加密；  0 → 数据不加密    				BIT6：1 → 有后续包；  0 → 无后续包
u16 g_HD_Msg_Tag=0;				//消息流水号
u16 g_HD_aralm_type=HeDa_Burst_Event_None;//突发事件类型
u16	g_HD_device_addr=0;		//设备地址



/**************************************************************/
/* 和达计算定时唤醒间隔
函数名: LP_HD_CalReportConut
入  参: 无
出  参: 无
返回值: uint16_t
修改人: 杨晓飞
日  期: 2018.12.03
*//*************************************************************/
void LP_HD_CalReportConut(TM_Time* pStNextTime)
{
	TM_Time  stTmpTime, stStarRepTime; //stStarTime, stEndTime, 
	ST_Time  stReportTime;
	s32  dwOffset = 0, dwOffsetNow = 0;
	u16  wTrail   = 0;
	u8   nRepFlg  = 0;

	STM8_RTC_Get(&stTimeNow);
	TM_TimeChangeAToB(&stTimeNow, &stTmpTime);

	MemcpyFunc(&stStarRepTime.nMonth, &tyReport.Time.nMonth, sizeof(TypeTime)-1);
	stStarRepTime.wYear = (u16)2000+tyReport.Time.nYear;
	
	if(10 > TM_DiffSecond(&stTmpTime, &stStarRepTime))
	{
		MemcpyFunc(&stStarRepTime, &stTmpTime, sizeof(TM_Time));
		if(XJ_INTERVAL_HOUR == tyReport.nIntervalType)
		{
			stStarRepTime.nHour= tyReport.nStartHour;
			stStarRepTime.nMinute= tyReport.nStartMinute;
		}
		else if(XJ_INTERVAL_MIN == tyReport.nIntervalType)
		{
			stStarRepTime.nMinute= tyReport.nStartMinute;
		}
		else
		{
			stStarRepTime.nDay = tyReport.nStartDay;
			stStarRepTime.nHour= tyReport.nStartHour;
			stStarRepTime.nMinute= tyReport.nStartMinute;
		}
		dwOffset    = TM_DiffSecond(&stStarRepTime, &stLastReportT);
		dwOffsetNow = TM_DiffSecond(&stStarRepTime, &stTmpTime);

		/* 空与非空指针区分上报与低功耗流程 */
		if(((0 < dwOffset)&&(NULL != pStNextTime))||((0 < dwOffsetNow)&&(NULL == pStNextTime)))
		{
			MemcpyFunc(&stStarRepTime, &stLastReportT, sizeof(TM_Time));
			switch(tyReport.nIntervalType)
			{
				case XJ_INTERVAL_MON:
					if(12 == stStarRepTime.nMonth)
					{
						stStarRepTime.wYear++;
						stStarRepTime.nMonth = 0x01;
					}
					else
					{
						stStarRepTime.nMonth++;
					}				
					break;
					
				case XJ_INTERVAL_DAY:			
					TM_RTimeAddnDay(&stStarRepTime, tyReport.cycle);
					if(stTmpTime.nMonth != stStarRepTime.nMonth)
					{
						stStarRepTime.nDay = tyReport.nStartDay;
					}							
					break;
			
				case XJ_INTERVAL_HOUR:
					TM_RTimeAddnMinute(&stStarRepTime, ((u16)60)*tyReport.cycle);
					if(stTmpTime.nDay != stStarRepTime.nDay)
					{
						stStarRepTime.nHour= tyReport.nStartHour;
					}								
					break;
			
				case XJ_INTERVAL_MIN:
					TM_RTimeAddnMinute(&stStarRepTime, tyReport.cycle);
					if(stTmpTime.nHour != stStarRepTime.nHour)
					{
						stStarRepTime.nMinute= tyReport.nStartMinute;
					}								
					break;			
				default:
					break;
			}
		}	
		
		/* 尾数上线处理 */
		if((0x01 == tyReport.nTailCtl) && 
			((XJ_INTERVAL_DAY == tyReport.nIntervalType)||(XJ_INTERVAL_MON == tyReport.nIntervalType)))
		{
			wTrail = JX_BcdToByte(tyParameter.Address[0]);
			wTrail = (wTrail*(u8)tyReport.nTaiInterval);
			stStarRepTime.nMinute = 0;
			TM_RTimeAddnMinute(&stStarRepTime, wTrail);
		}
	}
	else
	{
		m_nDebugFlg = TRUE;  /* 调试模式上报不影响定时上报 */
	}
	
	/* 上报失败补报 */
	nRepFlg = GetReportFailFlag();
	if((XJ_INTERVAL_MIN != tyReport.nIntervalType)&&(nRepFlg&REPORT_FAIL_FLG))
	{
		MemcpyFunc(&stStarRepTime, &stLastReportT, sizeof(TM_Time));
		
		/* 上报失败次数表示 0x02:第一次失败 0x04:第二次失败 0x08:第三次失败 */
		if(nRepFlg&THIRD_REP_FAIL)
		{
			LP_XJ_ReportTimeCla(3, &stStarRepTime);
		}
		else if(nRepFlg&SECOND_REP_FAIL)
		{
			LP_XJ_ReportTimeCla(2, &stStarRepTime);
		}
		else
		{
			LP_XJ_ReportTimeCla(1, &stStarRepTime);
		}
	}
	TM_RTimeDecnMinute(&stStarRepTime, 1);

	/* 特殊处理下次上报时间小于当前时间60S以上问题 */
	dwOffset = TM_DiffSecond(&stStarRepTime, &stTmpTime);
	if(XJ_ONLINE_TO < dwOffset)
	{
		switch(tyReport.nIntervalType)
		{
			case XJ_INTERVAL_MON:
				do{
					if(12 == stStarRepTime.nMonth)
					{
						stStarRepTime.wYear++;
						stStarRepTime.nMonth = 0x01;
					}
					else
					{
						stStarRepTime.nMonth++;
					}
				}while(0 < TM_DiffSecond(&stStarRepTime, &stTmpTime));
				break;
				
			case XJ_INTERVAL_DAY:
				do{
					TM_RTimeAddnDay(&stStarRepTime, tyReport.cycle);
					if(stTmpTime.nMonth != stStarRepTime.nMonth)
					{
						stStarRepTime.nDay = tyReport.nStartDay;
					}
				}while(0 < TM_DiffSecond(&stStarRepTime, &stTmpTime));						
				break;
		
			case XJ_INTERVAL_HOUR:
				do{
					TM_RTimeAddnMinute(&stStarRepTime, ((u16)60)*tyReport.cycle);
					if(stTmpTime.nDay != stStarRepTime.nDay)
					{
						stStarRepTime.nHour= tyReport.nStartHour;
					}
				}while(0 < TM_DiffSecond(&stStarRepTime, &stTmpTime));									
				break;
		
			case XJ_INTERVAL_MIN:
				do{
					TM_RTimeAddnMinute(&stStarRepTime, tyReport.cycle);
					if(stTmpTime.nHour != stStarRepTime.nHour)
					{
						stStarRepTime.nMinute= tyReport.nStartMinute;
					}
				}while(0 < TM_DiffSecond(&stStarRepTime, &stTmpTime));	
								
				break;			
			default:
				break;
		}

	}
	
	TM_TimeChangeBToA(&stStarRepTime, &g_stNextRepTime); 
	if(NULL != pStNextTime)
	{
		MemcpyFunc(pStNextTime, &stStarRepTime, sizeof(TM_Time));
	}	
	return ;
}

/**********************************************/
/* 超时补报控制
函数名: HD_TimeOutReUpLoad
入  参: void
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.03
*//*********************************************/
void HD_TimeOutReUpLoad(void)
{
	if (UP_Free_HD > ucLogonMode)
	{
		HD_OnlineCtl();
		UC_SleepFunc(1000);
	}
	
	/* 超时控制禁止或未超时则直接返回 */
	if((FALSE == m_nRepEnableFlg)||(REPDAT_TIMEOUT >= GetSysTemTick() - g_dwRepTick))
	{
		return ;
	}
	
	if((UP_FREE_XJ == ucLogonMode)&&(REPORT_CNT_TO > g_nDatRepCnt))
	{
		if((UP_UPLOAD_A == nLogonModeBk)||(UP_UPLOAD_B == nLogonModeBk))
		{
			ucLogonMode = nLogonModeBk;
		}
	}
	
	if(REPORT_CNT_TO <= g_nDatRepCnt)
	{
		SetLogonMode(UP_FREE_XJ);
		stRepFail.wError |= (1<<REP_RESPOND_FAIL);
		m_nRepFailFlg = TRUE;
		tyGSMFlag = FALSE;		
	}	
	return ;
}

/**********************************************/
/* 和达协议接收解析
函数名: HD_ProtolProc
入  参: void
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.03
*//*********************************************/
void HD_ProtolProc(void)
{
	u8* pnRxAdd = GetUartRxBuf();
	u8  nRxLen  = 0, nSendLen = 0;

	nSendLen = XJ_DecodeParameter(pnRxAdd, CheckRevDataLen());

	/* 数据发送 */
	if(0 < nSendLen)
	{
		XJ_ProtolSend(nSendLen, COM_1);
	}
	UC_SleepFunc(50);
}


/**********************************************/
/* 上线控制登录超时及心跳超时
函数名: HD_OnlineCtl
入  参: void
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.03
*//*********************************************/
void HD_OnlineCtl(void)
{
	static u8  nFirFlg= TRUE;

	if(nFirFlg)
	{
		nFirFlg = FALSE;
		tyGSMFlag = TRUE;
	}
	
	/* 数据上报控制 */
	if( (UP_Upload_HD == ucLogonMode) && (tyGSMFlag) )
	{
		if(TRUE == XJ_Online(ucLogonMode))
		{
			ucLogonMode = UP_FREE_XJ;
			g_dwRepTick = GetSysTemTick();
			
			/* 上报次数累加 */
			g_nDatRepCnt++;
		}
	}
}


/**********************************************/
/* 上报+心跳+突发事件,3合1
函数名: HD_Online
入  参: void
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.03
*//*********************************************/
u8 HD_Online(u8 nLogonMode)
{
	u8  nSendLen = 0, nOffset = 0;
	u8 nTmpBuf[17]  = {0};
	u8 *pnBuf = NULL;
	u32 dwMeterVal = 0;
	
	if(HD_ONLINE != tyReport.nReportType)
	{
		return nSendLen;
	}
	
	//MemcpyFunc(&stDataPtrXJ.Packet.MeterType, &tyParameter.Type, 8);

	//tyParameter.Status[0]|=((g_nSignal<<3)&0xF8);
	
	/* 上线类型A */
	if(HD_ONLINE == tyReport.nReportType)
	{
		/*stDataPtrXJ.Packet.CtrlB  = 0x10;
		stDataPtrXJ.Packet.ACtrlB = 0x00;
		MemcpyFunc(stDataPtrXJ.Packet.Buf,tyParameter.Status, XJ_METEST_LEN);
		nSendLen = XJ_FRAME_FIX_LEN+XJ_METEST_LEN;	*/
	}
	else
	{
		ST_Time now_time;
		u16 Bat_value=0;
		u8 i=0;
		
		pnBuf = stDataPtrHD.Packet.Buf;
		stDataPtrHD.Packet.Ctrl[0]=g_HD_Ctrl;
		g_HD_Msg_Tag++;
		stDataPtrHD.Packet.Ctrl[1]=(g_HD_Msg_Tag>>8)&0xff;		//帧流水号     高位在前
		stDataPtrHD.Packet.Ctrl[2]=g_HD_Msg_Tag&0xff;
		
		STM8_RTC_Get(&now_time);
		MemcpyFunc(pnBuf,&now_time, 5);							//终端时间：年-月-日-时-分 
		nOffset += 5;

		pnBuf[nOffset]=1;										//报文中的数据条数
		nOffset++;

		pnBuf[nOffset++]=0;										//报文中的数据间隔
		
		Bat_value=BAT_GetBatVol();
		pnBuf[nOffset++]=(Bat_value>>8)&0xff;					//电池电压，除以100后为电池电压实际数值                   高位在前
		pnBuf[nOffset++]=Bat_value&0xff;

		pnBuf[nOffset++]=(g_HD_Msg_Tag>>8)&0xff;				//帧流水号     高位在前
		pnBuf[nOffset++]=g_HD_Msg_Tag&0xff;

		pnBuf[nOffset++]=g_nSignal;								//信号强度

		pnBuf[nOffset++]=(g_HD_aralm_type>>8)&0xff;				//突发事件类型     高位在前
		pnBuf[nOffset++]=g_HD_aralm_type&0xff;

		for(i=0;i<6;i++)pnBuf[nOffset++]=0;						//保留字段

		pnBuf[nOffset++]=0x01;									//通道类型 
		pnBuf[nOffset++]=0x01;									//通道号 
		
		{														//昨日冻结数据
			ST_Time stYesterDay;
			TM_Time stTmpTime;
			TypeRecordDay stDayFreeze;
			TypeRecord stNowRec;
			
			if(TRUE == ReadDayFreezeRecord(0, (u8*)&stDayFreeze, sizeof(TypeRecordDay)))
			{
				STM8_RTC_Get(&now_time);
				TM_TimeChangeAToB(&now_time, &stTmpTime);
				TM_RTimeDecnMinute(&stTmpTime, 1440);
				TM_TimeChangeBToA(&stTmpTime, &stYesterDay);
				if((stDayFreeze.nYear == stYesterDay.wYear) && 
					(stDayFreeze.nMon == stYesterDay.nMonth) && (stDayFreeze.nDay == stYesterDay.nDay))
				{
					pnBuf[nOffset++]=stDayFreeze.Value&0xff;
					pnBuf[nOffset++]=(stDayFreeze.Value>>8)&0xff;
					pnBuf[nOffset++]=(stDayFreeze.Value>>16)&0xff;
					pnBuf[nOffset++]=(stDayFreeze.Value>>24)&0xff;
					
				}
				else
				{
					MemsetFunc(&pnBuf[nOffset], 0x00, 4);
					nOffset+=4;
				}
			}
		}
		{														//累计流量
			if(FALSE == GM_GetGatherMeterFlg())
			{
				if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
				{
					tyParameter.Value = tyRecord.Value;
				}
				else tyParameter.Value = INVALID_DATA;
			}
			pnBuf[nOffset++]=tyParameter.Value&0xff;
			pnBuf[nOffset++]=(tyParameter.Value>>8)&0xff;
			pnBuf[nOffset++]=(tyParameter.Value>>16)&0xff;
			pnBuf[nOffset++]=(tyParameter.Value>>24)&0xff;
		}	
		nSendLen =nOffset;	
	}
	HD_ProtolSend(nSendLen, COM_1,1);			//只有1组数据

	/* 等待数据发送完成 */
	if(FALSE == WatitDataSendOk())
	{
		return FALSE;
	}
	return TRUE;
}

/**********************************************/
/* 上行协议处理,登录到服务器后,实际发送到服务器数据,和GPRS无关
函数名: HD_ProtolSend
入  参: Size nComChannel
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.03
*//*********************************************/
s8 HD_ProtolSend(u8 Size, u8 nComChannel,u8 device_info_flag)
{
	u8 *Point, nX, checksum;
	u16 length = 0;
	TypeProtolHead_HD tyProtolHead;
	s8 nFailCnt = 0, nOptRelt = FALSE;

	if(device_info_flag)length=Size+15+HD_FRAME_OTHER_LEN;
	else length=Size+HD_FRAME_OTHER_LEN;
	
	/* GPRS增加长度数据命令发送 */
	if(COM_1 == nComChannel)
	{
		/* 增加发送数据长度 */
		while(3 > nFailCnt++)
		{		
			nOptRelt = GPRS_TcpSendDatLen(length); //0x0D不算入长度
			if(-1 == nOptRelt)
			{
				stRepFail.wError |= (1<<DATSEND_ERROR);
				GPRS_CloseConnect();
				ucStatusGsm = GSM_SHAKEHAND;
				return -1;
			}
			if(TRUE == nOptRelt)
			{
				break;
			}
		}
		if(nFailCnt >= 3 )
		{
			return FALSE;
		}
	}
	
	length = Size;		                   
	tyProtolHead.Head[0] = Packet_Head_0;				//数据包头
	tyProtolHead.Head[1] = Packet_Head_1;				//数据包头
	tyProtolHead.Addr[0] = Maker_Addr;					//厂商地址
	tyProtolHead.Addr[1] = (g_HD_device_addr&0xFF);		//设备地址
	tyProtolHead.Addr[2] = (g_HD_device_addr>>8)&0xFF;	//设备地址
	tyProtolHead.Version = Protocol_Version;			//协议版本号

	
	Point = aucUartTxBuffer;		//指针指向接收发送缓冲头

	MemcpyFunc(Point, (u8 *)&tyProtolHead, sizeof(tyProtolHead) );	//复制数据头到缓冲中
	Point += sizeof(tyProtolHead);									//指针向下
	if(device_info_flag)
	{
		MemcpyFunc(Point, (u8 *)&g_Device_Info, sizeof(g_Device_Info) );	//复制设备信息到缓冲中
		Point += sizeof(g_Device_Info);										//指针向下
		length +=sizeof(g_Device_Info);
	}

	MemcpyFunc(Point, (u8 *)&stDataPtrHD, Size );
	Point += Size;	
	length += Size;
	
	checksum = 0;					//校验和是累加和
	for (nX = 0; nX < length; nX++)
	{
		checksum += aucUartTxBuffer[nX];    //计算累加和
	}
	Point[length++] = checksum;
	Point[length++] = Packet_End_0;
	Point[length++] = Packet_End_1;

	FrameSendFunc(length, nComChannel, Point);
	return TRUE;
}


/**********************************************/
/*和达协议接收解析
函数名: HD_DecodeParameter
入  参: void
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.04
*//*********************************************/
u8 HD_DecodeParameter(u8* pnRxBuf, u8 nRxLen)
{
	u8 *Point = NULL;
	u16 wDataLen = 0, wLen = 0;	
	TypeProtolHead_HD tyProtolHead;	
	u8 nSendLen = 0;
	
	if(NULL == pnRxBuf)
	{
		return nSendLen;
	}
    Point = pnRxBuf;

	/* 找包头 */
	while((Packet_Head_0 != *Point)||(Packet_Head_1 != *(Point+1)))
	{
		Point++;
		wLen++;
		if(nRxLen <= wLen)
		{
		    if(NUMBER_UART_RX <= CheckRevDataLen())
		    {
			    goto __UC_Pro_Exit;
		    }
			return nSendLen;
		}
	}
	
	if(NUMBER_UART_RX <= CheckRevDataLen())
	{
		goto __UC_Pro_Exit;
	}
	
	MemcpyFunc((u8 *)&tyProtolHead, Point, sizeof(tyProtolHead));		//复制字符串到缓冲中
	Point += sizeof(tyProtolHead);
	
	if( (nRxLen-wLen) > (sizeof(tyProtolHead)+ 9) )//数据包的最小长度，包头结构体+3控制字+2长度+1命令+1校验+2包尾
	{
		u16 msg_len= (u16)*(Point+3)+sizeof(tyProtolHead)+ 8;//计算该消息的总长度 datalen+3控制字+2长度+1校验+2包尾
		if( msg_len <= (nRxLen-wLen) )
		{
			wDataLen=stDataPtrHD.Packet.Data_Len+8;
			MemcpyFunc((u8 *)&stDataPtrHD, Point, wDataLen);		//复制字符串到缓冲中
		}
		else//消息长度不够
		{
			goto __UC_Pro_Exit;
		}
	}
	else 
	{
		goto __UC_Pro_Exit;
	}	
	
	/* 帧尾校验 */
	if( (Packet_End_0!=stDataPtrHD.Buffer[wDataLen-2]) || (Packet_End_1!=stDataPtrHD.Buffer[wDataLen-1]))
	{
		goto __UC_Pro_Exit;
	}

	/* CS校验    从起始位到数据域*/
	if( stDataPtrHD.Buffer[wDataLen-3]) != JX_AddSum8Bit(pnRxBuf+wLen, sizeof(tyProtolHead)+wDataLen+3))
	{
		goto __UC_Pro_Exit;
	}
	
	/* 地址校验 */
	/*if(FALSE == HD_AddressComparePro(&tyProtolHead.Addr, 8))
	{
		goto __UC_Pro_Exit;
	}*/
	
	nSendLen = HD_ProtolHandle();
	
__UC_Pro_Exit:

	/* add by maronglang clear RxBuf */
	ClearRxBuff();
	return nSendLen;
}

/**********************************************/
/* 地址判断
函数名: HD_AddressComparePro
入  参: void
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2016.05.27
*//*********************************************/
u8 HD_AddressComparePro(u8 *pnAddr, u8 nLen)
{		
	u8 nAddBuf[12] = {0};
	u8 nLoop = 0;
	
	if(JX_IsAllFillDat(pnAddr, 0, nLen))
	{
		return TRUE;
	}

	MemcpyFunc(nAddBuf, &tyParameter.Type, nLen);

	/* 地址匹配 */
	for(nLoop = 0; nLoop < nLen; nLoop++)
	{
		if(nAddBuf[nLoop] != pnAddr[nLoop])
		{
			break;
		}
	}

	if(nLen > nLoop)
	{
		return FALSE;
	}

	return TRUE;	
}


/**********************************************/
/* 和达协议处理
函数名: HD_ProtolHandle
入  参: void
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.04
*//*********************************************/
u8 HD_ProtolHandle(void)
{
	u8 nSendLen    = 0;
	u16 wCommCtrlB = 0;
	u16 wCommPid   = 0;
	u8  nParaLen   = 0;
	ST_Time stReportTime;
	TM_Time stStar, stEnd;
	int32_t dwTimeOffset = 0; 
	u8 nCmdId  = 0;
	u8 nctrl  = 0;
	
	nCmdId   = stDataPtrHD.Packet.Cmd;
	nctrl	=  stDataPtrHD.Packet.Ctrl[0];
	g_HD_Msg_Tag = stDataPtrHD.Packet.Ctrl[1]<<8 | stDataPtrHD.Packet.Ctrl[2]+1;

	if(nctrl&Flag_Data_Is_Secret) //数据是否被加密
	{
		return 0;
	}
	/*else if(nctrl&Flag_Data_Is_Finish)//数据是否有后续包
	{
		return 0;
	}*/
	
	switch(nCmdId)
	{
		/*大用户远传大表常规数据平台应答（下行）、突发事件数据平台应答（下行）、心跳包数据平台应答（下行）*/
		case HeDa_Cmd_Reply_Upload:
			HeDa_Cmd_Reply_Upload_Handle(stDataPtrHD.Packet.Buf,nctrl);
			nSendLen=0;
			break;
			
		case HeDa_Cmd_Set_Sampling_Interval://设置采样间隔（上行、下行）
			nSendLen=HeDa_Cmd_Set_Sampling_Interval_Handle(stDataPtrHD.Packet.Buf);
			break;
		
		case HeDa_Cmd_Set_Net_Param://设置网络参数（上行、下行）
			break;
			
		case HeDa_Cmd_Set_Report_Cycle://设置上报周期（上行、下行）
			break;
			
		case HeDa_Cmd_Set_Pressure_Threshold://设置压力上下限阈值（上行、下行）
			break;
			
		case HeDa_Cmd_Set_Secret_Key://设置秘钥（上行、下行）——预留
			break;
			
		case HeDa_Cmd_Set_Addr://-------设置表地址    	和达原协议没有，自己添加
			break;


		
		case HeDa_Cmd_Get_Sampling_Interval://查询采样间隔（上行、下行）
			nSendLen=HeDa_Cmd_Get_Sampling_Interval_Handle(stDataPtrHD.Packet.Buf);
			break;
		
		case HeDa_Cmd_Get_Net_Param://查询网络参数（上行、下行）
			break;
			
		case HeDa_Cmd_Get_Report_Cycle://查询上报周期（上行、下行）
			break;
			
		case HeDa_Cmd_Get_Pressure_Threshold://查询压力上下限阈值（上行、下行）
			break;
			
		case HeDa_Cmd_Get_Secret_Key://查询秘钥（上行、下行）——预留
			break;
			
		case HeDa_Cmd_Get_Addr://-------查询表地址    	和达原协议没有，自己添加
			break;


		case HeDa_Cmd_Get_All_Param://获取所有参数（上行、下行）
			break;
		case HeDa_Cmd_Get_Appoint_Data://获取指定数据（上行、下行）
			break;

		default:break;
	}
		
	return nSendLen;
}

/**********************************************/
/* 和达平台应答包处理
函数名: HeDa_Cmd_Reply_Upload_Handle
入  参: u8 *pData , u8 ctrl
出  参: void
返回值: void
修改人: 杨晓飞
日  期: 2018.12.04
*//*********************************************/
void HeDa_Cmd_Reply_Upload_Handle(u8 *pData,u8 ctrl)
{
	TIME_BIN time_Server;//平台时间缓存  		用于校时
	u8 byte_manage=0;//管理字
	TM_Time stEnd;

	if((stDataPtrHD.Packet.Data_Len-1) < 9)//数据域长度不够
	{
		return;
	}
	
	MemcpyFunc((u8 *)&time_Server, pData, sizeof(TIME_BIN));
	byte_manage = *(pData+6);

	//时间校准
	MemcpyFunc(&stTimeNow.wYear, pData, 6);
	TM_TimeChangeAToB(&stTimeNow, &stEnd);
	if(FALSE == TM_IsValidTimePro(&stEnd))
	{
		return FALSE;
	}
	STM8_RTC_Set(&stTimeNow);	


	if(ctrl&Flag_Data_Is_Finish)
	{
		//byte_manage  等待秒数关机
	}
	else
	{
		if(0xFF == byte_manage)//表示该字段无效
		{
		}
		else if(0x00 == byte_manage)//可以结束本次通讯
		{

		}
	}
}

/**********************************************/
/* 和达设置采样间隔
函数名: HeDa_Cmd_Set_Sampling_Interval_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.04
*//*********************************************/
u8 HeDa_Cmd_Set_Sampling_Interval_Handle(u8 *pData)
{

	if((stDataPtrHD.Packet.Data_Len-1) < 2)//数据域长度不够
	{
		*pData=0x10;	  //设置失败
		*(pData+1)=tyReport.nGatherCycle;//终端当前采样间隔，分钟
	}
	else
	{	
		u8 hd_samling_interval=*pData;//采样间隔
		*pData=0x01;	  //设置成功
		*(pData+1)=hd_samling_interval;//终端当前采样间隔，分钟

		//保存数据
		tyReport.nGatherCycle = hd_samling_interval;
		SaveParameterForType((u8 *)&tyReport, REPOERCYCLE_LEN, REPORT_PARA);
	}

	return 2;
}


/**********************************************/
/* 和达查询采样间隔
函数名: HeDa_Cmd_Get_Sampling_Interval_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.04
*//*********************************************/
u8 HeDa_Cmd_Get_Sampling_Interval_Handle(u8 *pData)
{
	*pData=tyReport.nGatherCycle;
	return 1;
}


/**********************************************/
/* 和达设置网络参数
函数名: HeDa_Cmd_Set_Net_Param_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.04
*//*********************************************/
u8 HeDa_Cmd_Set_Net_Param_Handle(u8 *pData)
{
	if((stDataPtrHD.Packet.Data_Len-1) < 63)//数据域长度不够
	{
		return 0;
	}
	
	
}


#endif

