/******************** (C) COPYRIGHT 2016 jason ,LTD ***********************
* File Name         : XinJiangProtocol.c
* Author            : maronglang
* Date First Issued : 2016/05/26
* Description       : 新疆物联网表通讯协议
*******************************************************************************/
#include "Meter.h"
#include "DriverUart.h"
#include "GsmGlobal.h"
#include "FileGlobal.h"
#include "ProtocolGlobal.h"
#include "JX_Math.h"
#include "Pwrctr.h"
//#include <stdio.h>
#include "STM8_Rtc.h"
#include "Alarm.h"
#include "Initialize.h"
#include "CJ188.h"
//#include "string.h"
#include "STM8_Rtc.h"
#include "hedaProtocol.h"
#ifdef HEDA_PTR


/*     全局变量位置         */
//u8 g_Device_Info[15]={0};		//设备信息
TypeProtol_HD stDataPtrHD={0};		//接受发送结构体缓存
u8 g_HD_Ctrl=0;				//控制码 BIT7：1 → 数据加密；  0 → 数据不加密    				BIT6：1 → 有后续包；  0 → 无后续包
u16 g_HD_Msg_Tag=0;				//消息流水号
u16 g_HD_aralm_type=HeDa_Burst_Event_None;//突发事件类型
u16	g_HD_device_addr=0;		//设备地址



/**********************************************/
/* 计算上报间隔 秒为单位
函数名: HD_ClaReportTimeToSec
入  参: void
出  参: void
返回值: u32
修改人: 杨晓飞
日  期: 2018.12.06
*//*********************************************/
s32 HD_ClaReportTimeToSec(void)
{
	switch(tyReport.nIntervalType)
	{
		case HD_INTERVAL_MIN:return (s32)tyReport.cycle*60;
		case HD_INTERVAL_HOUR:return (s32)tyReport.cycle*3600;
		case HD_INTERVAL_DAY:return (s32)tyReport.cycle*3600*24;
		default:return (s32)24*3600;
	}
	return (s32)24*3600;
}


/**************************************************************/
/* 和达计算定时唤醒间隔
函数名: LP_HD_CalReportConut
入  参: 无
出  参: 无
返回值: uint16_t
修改人: 杨晓飞
日  期: 2018.12.06
*//*************************************************************/
uint32_t LP_HD_CalReportConut(void)
{
	uint32_t dwTmp = 0, dwCount = 0;
	int32_t  dwOffset = 0,dwTemp = 0;
	TM_Time  stTmpTime, stTime; //stStarTime, stEndTime, 
	u8       nRepFlg = 0;
	ST_Time stLastTime;
	TM_Time stStar, stEnd;

#if  1
	/* 计算下次抄表时间 */
	MemcpyFunc((u8*)&tyTime, (u8*)&tyReport.Time, sizeof(TypeTime));
	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
	MemcpyFunc((u8*)&stLastTime, (u8*)&tyTime, sizeof(TypeTime));
	STM8_RTC_Get(&stTimeNow);
	TM_TimeChangeAToB(&stTimeNow, &stEnd);
	TM_TimeChangeAToB(&stLastTime, &stStar);
	dwOffset = TM_DiffSecond(&stStar, &stEnd);	
	stEnd.nSecond = 0;	
	MemcpyFunc((u8*)&stTmpTime,  (u8*)&stEnd, sizeof(stTmpTime));
	
	/* 防止叠加误差时间偏移问题 */
	if(0 < dwOffset) 
	{
		TM_RTimeAddnMinute(&stEnd, (tyReport.wGatherCycle - (u16)((dwOffset/60)%(u32)tyReport.wGatherCycle)));
		TM_TimeChangeBToA(&stEnd, &g_stNextGmTime); 
	}
	else
	{
		MemcpyFunc((u8*)&g_stNextGmTime, (u8*)&stLastTime, sizeof(ST_Time));
	}
#endif
	
	/* 计算下次上报时间 */
	dwOffset = TM_DiffSecond(&stLastReportT, &stTmpTime);
	dwTemp   = HD_ClaReportTimeToSec();
		
	/* 防止叠加误差时间偏移问题 */
	if(0 < dwOffset) 
	{
		TM_RTimeAddnMinute(&stTmpTime, ((dwTemp - (u32)(dwOffset%dwTemp))/60));
		TM_TimeChangeBToA(&stTmpTime, &g_stNextRepTime);
	}
	else
	{
		TM_TimeChangeBToA(&stLastReportT, &g_stNextRepTime);
	}

	/* 上报失败补报 */
	nRepFlg = GetReportFailFlag();
	if(nRepFlg&REPORT_FAIL_FLG)
	{
		STM8_RTC_Get(&stTimeNow);		
		TM_TimeChangeAToB(&stTimeNow, &stTime);
		MemcpyFunc((u8*)&stTmpTime, (u8*)&stTime, sizeof(TM_Time));

		/* 上报失败次数表示 0x02:第一次失败 0x04:第二次失败 0x08:第三次失败 */
		if(nRepFlg&THIRD_REP_FAIL)
		{
			if(HD_INTERVAL_MIN == tyReport.nIntervalType)
			{
				TM_RTimeAddnMinute(&stTmpTime, 15);
			}
			else
			{
				TM_RTimeAddnMinute(&stTmpTime, 45);
			}
		}
		else if(nRepFlg&SECOND_REP_FAIL)
		{
			if(HD_INTERVAL_MIN == tyReport.nIntervalType)
			{
				TM_RTimeAddnMinute(&stTmpTime, 10);
			}
			else
			{
				TM_RTimeAddnMinute(&stTmpTime, 30);
			}
		}
		else
		{
			if(HD_INTERVAL_MIN == tyReport.nIntervalType)
			{
				TM_RTimeAddnMinute(&stTmpTime, 5);
			}
			else
			{
				TM_RTimeAddnMinute(&stTmpTime, 15);
			}
		}
		TM_TimeChangeBToA(&stTmpTime, &g_stNextRepTime);	
	}

	/* 计算抄表间隔 */
	ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
	if(0 < tyReport.wGatherCycle)
	{
		dwTmp = tyReport.wGatherCycle;
		dwCount = dwTmp*60;
	}
	else
	{
		return LP_WAKEUP_TO;
	}

	return dwCount;
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
	
	/*if((UP_Free_HD == ucLogonMode)&&(REPORT_CNT_TO > g_nDatRepCnt))
	{
		if((UP_UPLOAD_A == nLogonModeBk)||(UP_UPLOAD_B == nLogonModeBk))
		{
			ucLogonMode = nLogonModeBk;
		}
	}*/
	
	if(REPORT_CNT_TO <= g_nDatRepCnt)
	{
		SetLogonMode(UP_Upload_HD);
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

	nSendLen = HD_DecodeParameter(pnRxAdd, CheckRevDataLen());

	/* 数据发送 */
	if(0 < nSendLen)
	{
		HD_ProtolSend(nSendLen, COM_1,1);
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
		if(TRUE == HD_Online(ucLogonMode))
		{
			ucLogonMode = UP_Free_HD;
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
	
	/*if(HD_ONLINE != tyReport.nReportType)
	{
		return nSendLen;
	}*/
	
	//MemcpyFunc(&stDataPtrXJ.Packet.MeterType, &tyParameter.Type, 8);

	//tyParameter.Status[0]|=((g_nSignal<<3)&0xF8);
	
	/* 上线类型A */
	/*if(HD_ONLINE == tyReport.nReportType)
	{
		stDataPtrXJ.Packet.CtrlB  = 0x10;
		stDataPtrXJ.Packet.ACtrlB = 0x00;
		MemcpyFunc(stDataPtrXJ.Packet.Buf,tyParameter.Status, XJ_METEST_LEN);
		nSendLen = XJ_FRAME_FIX_LEN+XJ_METEST_LEN;	
	}
	else*/
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
		MemcpyFunc(pnBuf,(u8 *)&now_time, 5);							//终端时间：年-月-日-时-分 
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

	g_dwRepTick = GetSysTemTick();
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
			nOptRelt = M590_TcpSendDatLen(length); //0x0D不算入长度
			if(-1 == nOptRelt)
			{
				stRepFail.wError |= (1<<DATSEND_ERROR);
				M590_CloseConnect();
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
		//MemcpyFunc(Point, (u8 *)&g_Device_Info, sizeof(g_Device_Info) );	//复制设备信息到缓冲中
		MemsetFunc(Point,0, 15);
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
	if( stDataPtrHD.Buffer[wDataLen-3] != JX_AddSum8Bit(pnRxBuf+wLen, sizeof(tyProtolHead)+wDataLen+3))
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
			nSendLen=HeDa_Cmd_Set_Net_Param_Handle((HD_CmdSetNetParam *)&stDataPtrHD.Packet.Buf);
			break;
			
		case HeDa_Cmd_Set_Report_Cycle://设置上报周期（上行、下行）
			nSendLen==HeDa_Cmd_Set_Report_Cycle_Handle(stDataPtrHD.Packet.Buf);
			break;
			
		case HeDa_Cmd_Set_Pressure_Threshold://设置压力上下限阈值（上行、下行）
			nSendLen=HeDa_Cmd_Get_Pressure_Threshold_Handle(stDataPtrHD.Packet.Buf);
			break;
			
		case HeDa_Cmd_Set_Secret_Key://设置秘钥（上行、下行）——预留
			nSendLen=HeDa_Cmd_Set_Secret_Key_Handle(stDataPtrHD.Packet.Buf);
			break;
			
		case HeDa_Cmd_Set_Addr://-------设置表地址    	和达原协议没有，自己添加
			nSendLen=HeDa_Cmd_Get_Addr_Handle(stDataPtrHD.Packet.Buf);
			break;


		
		case HeDa_Cmd_Get_Sampling_Interval://查询采样间隔（上行、下行）
			nSendLen=HeDa_Cmd_Get_Sampling_Interval_Handle(stDataPtrHD.Packet.Buf);
			break;
		
		case HeDa_Cmd_Get_Net_Param://查询网络参数（上行、下行）
			nSendLen=HeDa_Cmd_Get_Net_Param_Handle(stDataPtrHD.Packet.Buf);
			break;
			
		case HeDa_Cmd_Get_Report_Cycle://查询上报周期（上行、下行）
			nSendLen=HeDa_Cmd_Get_Report_Cycle_Handle(stDataPtrHD.Packet.Buf);
			break;
			
		case HeDa_Cmd_Get_Pressure_Threshold://查询压力上下限阈值（上行、下行）
			nSendLen=HeDa_Cmd_Get_Pressure_Threshold_Handle(stDataPtrHD.Packet.Buf);
			break;
			
		case HeDa_Cmd_Get_Secret_Key://查询秘钥（上行、下行）——预留
			nSendLen=HeDa_Cmd_Get_Secret_Key_Handle(stDataPtrHD.Packet.Buf);
			break;
			
		case HeDa_Cmd_Get_Addr://-------查询表地址    	和达原协议没有，自己添加
			nSendLen=HeDa_Cmd_Get_Addr_Handle(stDataPtrHD.Packet.Buf);
			break;


		case HeDa_Cmd_Get_All_Param://获取所有参数（上行、下行）
			nSendLen=HeDa_Cmd_Get_All_Param_Handle(stDataPtrHD.Packet.Buf);
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
		return;
	}
	STM8_RTC_Set(&stTimeNow);	

	//设置上报模式为空闲状态
	m_nUploadMode = UP_Free_HD;

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
		*(pData+1)=tyReport.wGatherCycle;//终端当前采样间隔，分钟
	}
	else
	{	
		u8 hd_samling_interval=*pData;//采样间隔
		*pData=0x01;	  //设置成功
		*(pData+1)=hd_samling_interval;//终端当前采样间隔，分钟

		//保存数据
		tyReport.wGatherCycle = hd_samling_interval;
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
	*pData=tyReport.wGatherCycle;
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
u8 HeDa_Cmd_Set_Net_Param_Handle(HD_CmdSetNetParam *pData)
{
	u8 flag_change_response=0;//修改内容结果标志位
		
	if((stDataPtrHD.Packet.Data_Len-1) < sizeof(HD_CmdSetNetParam))//数据域长度不够
	{
		return 0;
	}

	//设置时IP和域名二选一   ，优先IP
	if(pData->flag_change & 0x01)//设置IP地址
	{
		flag_change_response |=0x01;
		tyReportParameter.Main_IP=pData->ip_addr;
		tyReportParameter.flag_Login_Mode=HD_Login_IP;
	}
	if(pData->flag_change & 0x04)//设置域名
	{
		if(pData->flag_change & 0x01)//如果设置了IP地址
		{
			flag_change_response |=0x40;
		}
		else
		{
			flag_change_response |=0x04;		
			MemcpyFunc((u8 *)&tyReportParameter.Main_domain_name, pData->domain_name, 32);
			tyReportParameter.flag_Login_Mode=HD_Login_Domain_Name;
		}
	}

	if(pData->flag_change & 0x02)//设置端口号
	{
		flag_change_response |=0x02;
		tyReportParameter.Main_Port=pData->port;
	}
	if(pData->flag_change & 0x08)//设置apn接入点
	{
		u8 apn_len=0;
		apn_len=HeDa_Get_String_len(pData->apn_point,20);
		if(apn_len>18 || apn_len==0)//设置apn失败
		{	
			flag_change_response |=0x80;
		}
		else						//设置apn成功
		{
			flag_change_response |=0x08;
			MemsetFunc((u8 *)&g_nApnBuf[1], 0,20-1);
			MemcpyFunc((u8 *)&g_nApnBuf[1],pData->apn_point,apn_len);
			JX_StringCat(g_nApnBuf, "\"", 2);
			SaveParameterForType((u8 *)&g_nApnType, APN_LEN, APN_PARA);
		}
	}
	SaveParameterForType((u8 *)&tyReportParameter, ADDRESS_IPPARA_LEN, IPANDPORT_PARA);
	
	pData->flag_change=flag_change_response;
	pData->ip_addr=tyReportParameter.Main_IP;
	pData->port=tyReportParameter.Main_Port;
	MemcpyFunc( pData->domain_name,(u8 *)&tyReportParameter.Main_domain_name, 32);
	MemcpyFunc( pData->apn_point, g_nApnBuf,20);
	
	return sizeof(HD_CmdSetNetParam);
}

/**********************************************/
/* 和达查询网络参数
函数名: HeDa_Cmd_Get_Net_Param_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Get_Net_Param_Handle(u8 *pData)
{
	HD_CmdSetNetParam temp;

	temp.ip_addr=tyReportParameter.Main_IP;
	temp.port=tyReportParameter.Main_Port;
	MemcpyFunc((u8 *)&temp.domain_name,(u8 *)&tyReportParameter.Main_domain_name,32);
	MemcpyFunc((u8 *)&temp.apn_point,g_nApnBuf,20);
	
	MemcpyFunc(pData,(u8 *)&temp.ip_addr,sizeof(HD_CmdSetNetParam)-1);
	return sizeof(HD_CmdSetNetParam)-1;
}

/**********************************************/
/* 和达设置上报周期
函数名: HeDa_Cmd_Set_Report_Cycle_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Set_Report_Cycle_Handle(u8 *pData)
{
	u8 hd_cycle=0;//上报周期缓存
	
	if((stDataPtrHD.Packet.Data_Len-1) < 1)//数据域长度不够
	{
		return 0;
	}

	hd_cycle=*pData;
	if( (hd_cycle<HeDa_Report_Cycle_Min) || (hd_cycle<HeDa_Report_Cycle_Max))
	{
		*pData=0x10;//设置失败
		*(pData+1)=HeDa_TypeAddCycle_To_ReportCycleType(tyReport.nIntervalType,tyReport.cycle);
	}
	else 
	{
		*pData=0x01;//设置成功
		HeDa_ReportCycleType_To_TypeAddCycle(hd_cycle,&tyReport.nIntervalType,&tyReport.cycle);
		*(pData+1)=hd_cycle;
		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);//保存到eeprom中

	}
	return 2;
}

/**********************************************/
/* 和达查询上报周期
函数名: HeDa_Cmd_Get_Report_Cycle_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Get_Report_Cycle_Handle(u8 *pData)
{
	*pData=HeDa_TypeAddCycle_To_ReportCycleType(tyReport.nIntervalType,tyReport.cycle);;
	return 1;
}

/**********************************************/
/* 和达上报周期类型          转变为 时间类型+周期数
函数名: HeDa_ReportCycleType_To_TypeAddCycle
入  参: u8 Report_Cycle_Type
出  参: u8 *Report_Time_Type,u8 *cycle_num	
返回值: void
修改人: 杨晓飞
日  期: 2018.12.06
*//*********************************************/
void HeDa_ReportCycleType_To_TypeAddCycle(u8 Report_Cycle_Type,u8 *Report_Time_Type,u8 *cycle_num)
{
	switch(Report_Cycle_Type)
	{
		case HeDa_Report_Cycle_Minute_1:
			*Report_Time_Type=HD_INTERVAL_MIN;
			*cycle_num=1;
			break;
		case HeDa_Report_Cycle_Minute_5:
			*Report_Time_Type=HD_INTERVAL_MIN;
			*cycle_num=5;
			break;
		case HeDa_Report_Cycle_Minute_10:
			*Report_Time_Type=HD_INTERVAL_MIN;
			*cycle_num=10;
			break;
		case HeDa_Report_Cycle_Minute_15:
			*Report_Time_Type=HD_INTERVAL_MIN;
			*cycle_num=15;
			break;
		case HeDa_Report_Cycle_Minute_30:
			*Report_Time_Type=HD_INTERVAL_MIN;
			*cycle_num=30;
			break;
		case HeDa_Report_Cycle_Hour_1:
			*Report_Time_Type=HD_INTERVAL_HOUR;
			*cycle_num=1;
			break;
		case HeDa_Report_Cycle_Hour_2:
			*Report_Time_Type=HD_INTERVAL_HOUR;
			*cycle_num=2;
			break;
		case HeDa_Report_Cycle_Hour_4:
			*Report_Time_Type=HD_INTERVAL_HOUR;
			*cycle_num=4;
			break;
		case HeDa_Report_Cycle_Hour_6:
			*Report_Time_Type=HD_INTERVAL_HOUR;
			*cycle_num=6;
			break;
		case HeDa_Report_Cycle_Hour_12:
			*Report_Time_Type=HD_INTERVAL_HOUR;
			*cycle_num=12;
			break;
		case HeDa_Report_Cycle_Hour_24:
			*Report_Time_Type=HD_INTERVAL_HOUR;
			*cycle_num=24;
			break;
		default:
			*Report_Time_Type=HD_INTERVAL_HOUR;
			*cycle_num=24;
			break;
	}
	return;
}

/**********************************************/
/*  时间类型+周期数 转变为 和达上报周期类型 
函数名: HeDa_ReportCycleType_To_TypeAddCycle
入  参: u8 Report_Time_Type,u8 cycle_num
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.06
*//*********************************************/
u8 HeDa_TypeAddCycle_To_ReportCycleType(u8 Report_Time_Type,u8 cycle_num)
{
	switch(Report_Time_Type)
	{
		case HD_INTERVAL_MIN:
			{
				switch(cycle_num)
				{
					case	1:	return HeDa_Report_Cycle_Minute_1;
					case	5:	return HeDa_Report_Cycle_Minute_5;
					case	10:	return HeDa_Report_Cycle_Minute_10;
					case	15:	return HeDa_Report_Cycle_Minute_15;
					case	30:	return HeDa_Report_Cycle_Minute_30;
					default:	return HeDa_Report_Cycle_Minute_30;
				}
			}
		case HD_INTERVAL_HOUR:
			{
				switch(cycle_num)
					{
					case	1:	return HeDa_Report_Cycle_Hour_1;
					case	2:	return HeDa_Report_Cycle_Hour_2;
					case	4:	return HeDa_Report_Cycle_Hour_4;
					case	6:	return HeDa_Report_Cycle_Hour_6;
					case	12:	return HeDa_Report_Cycle_Hour_12;
					case	24:	return HeDa_Report_Cycle_Hour_24;
					default:	return HeDa_Report_Cycle_Hour_24;
				}
			}
		default:
			return HeDa_Report_Cycle_Max;
	}
}


/**********************************************/
/* 和达设置压力上下限阈值
函数名: HeDa_Cmd_Set_Pressure_Threshold_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.04
*//*********************************************/
u8 HeDa_Cmd_Set_Pressure_Threshold_Handle(u8 *pData)
{
	u8 flag_change=0;//修改内容标志位
	u8 flag_change_response=0;//修改内容结果标志位
		
	if((stDataPtrHD.Packet.Data_Len-1) < 25)//数据域长度不够
	{
		return 0;
	}
	flag_change=*pData;

	if( (flag_change & 0x01) || (flag_change & 0x02)) //压力1上下限一起改
	{
		if((flag_change & 0x01) && (flag_change & 0x02))//压力1上下限要一起改
		{
			flag_change_response |=0x01;
			flag_change_response |=0x02;
			tyParameter.Pressure1_LimitUp=*(float *)(pData+1);
			tyParameter.Pressure1_LimitDown=*(float *)(pData+5);
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
		}
		else if(flag_change & 0x01)
		{
			flag_change_response |=0x10;
		}
		else if(flag_change & 0x02)
		{
			flag_change_response |=0x20;
		}
		
	}
	if( (flag_change & 0x04) || (flag_change & 0x08)) //压力2上下限一起改
	{
		if((flag_change & 0x04) && (flag_change & 0x08))//压力2上下限要一起改
		{
			flag_change_response |=0x04;
			flag_change_response |=0x08;		
			tyParameter.Pressure2_LimitUp=*(float *)(pData+9);
			tyParameter.Pressure2_LimitDown=*(float *)(pData+13);
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
		}
		else if(flag_change & 0x04)
		{
			flag_change_response |=0x40;
		}
		else if(flag_change & 0x08)
		{
			flag_change_response |=0x80;
		}
	}
	
	
	*pData=flag_change_response;
	MemcpyFunc(pData+1, (u8 *)&tyParameter.Pressure1_LimitUp, 16);
	
	return 25;
}

/**********************************************/
/* 和达查询压力上下限阈值
函数名: HeDa_Cmd_Get_Pressure_Threshold_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Get_Pressure_Threshold_Handle(u8 *pData)
{
	MemcpyFunc(pData, (u8 *)&tyParameter.Pressure1_LimitUp, 16);
	MemsetFunc(pData+16, 0, 8);
	return 24;
}

/**********************************************/
/* 和达设置密钥
函数名: HeDa_Cmd_Set_Secret_Key_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Set_Secret_Key_Handle(u8 *pData)
{
	if((stDataPtrHD.Packet.Data_Len-1) < 16)//数据域长度不够
	{
		return 0;
	}

	*pData=0x01;
	MemcpyFunc(pData+1, pData, 16);
	return 17;
}

/**********************************************/
/* 和达查询密钥
函数名: HeDa_Cmd_Get_Secret_Key_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Get_Secret_Key_Handle(u8 *pData)
{
	MemsetFunc(pData, 0, 16);
	return 16;
}

/**********************************************/
/* 和达设置表地址
函数名: HeDa_Cmd_Set_Addr_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Set_Addr_Handle(u8 *pData)
{
	u8 meter_addr[2]={0};//表地址缓存
	
	if((stDataPtrHD.Packet.Data_Len-1) < 2)//数据域长度不够
	{
		return 0;
	}
	meter_addr[0]=*pData;
	meter_addr[1]=*(pData+1);

	//表地址不为0和0xffff
	if((meter_addr[0]==0 && meter_addr[1]==0) || (meter_addr[0]==0xff && meter_addr[1]==0xff))
	{
		*pData=0x10;//设置失败
		*(pData+1)=tyParameter.Address[0];
		*(pData+2)=tyParameter.Address[1];
	}
	else
	{
		*pData=0x01;//设置成功
		tyParameter.Address[0]=meter_addr[0];
		tyParameter.Address[1]=meter_addr[1];
	}
	return 3;
}

/**********************************************/
/* 和达查询表地址
函数名: HeDa_Cmd_Set_Addr_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Get_Addr_Handle(u8 *pData)
{
	*pData=tyParameter.Address[0];
	*(pData+1)=tyParameter.Address[1];
	return 2;
}

/**********************************************/
/* 和达查询所有参数
函数名: HeDa_Cmd_Get_All_Param_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Get_All_Param_Handle(u8 *pData)
{
	return 0;
}

/**********************************************/
/* 和达获取指定数据
函数名: HeDa_Cmd_Get_Appoint_Data_Handle
入  参: u8 *pData 
出  参: void
返回值: u8
修改人: 杨晓飞
日  期: 2018.12.05
*//*********************************************/
u8 HeDa_Cmd_Get_Appoint_Data_Handle(u8 *pData)
{
	return 0;
}

/**********************************************/
/*  和达协议模块初始化函数
函数名: HD_InitializeGsm
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2018.12.05
*//*********************************************/
void HD_InitializeGsm(void)
{
	char nIPstr[32] = {0};
	u8 nPort[6]     = {0};
	u16 dwPortNum = 0;
	ST_Time stReportTime;
	u8 nBuf[10]     = {0};
	
	MemsetFunc(nPort, 0, sizeof(nPort));
	MemsetFunc(nIPstr, 0, sizeof(nIPstr));	
	SetLogonMode(UP_Upload_HD);
	
	/* 获取上报IP地址参数 */
	if(TRUE == ReadParameterForType((u8 *)&tyReportParameter, sizeof(tyReportParameter), IPANDPORT_PARA))
	{
		if(tyReportParameter.flag_Login_Mode==HD_Login_IP)//ip地址上报
		{	
			JX_IpAddrToStr(nIPstr, (u8*)&tyReportParameter.Main_IP);
		}
		else if(tyReportParameter.flag_Login_Mode==HD_Login_Domain_Name)//域名上报
		{
			MemcpyFunc(nIPstr, (u8*)&tyReportParameter.Main_domain_name, 32);
		}
		
		MemcpyFunc((u8*)&dwPortNum, (u8*)&tyReportParameter.Main_Port, 2);
		JX_BL_Change(2, (u8*)&dwPortNum);
		JX_U32ToStr(dwPortNum, nPort);
		MemsetFunc(&aucAtPServer1[1], 0, sizeof(aucAtPServer1)-1);
		MemsetFunc(&aucAtPPort1[1], 0, sizeof(aucAtPPort1)-1);
		
		MemcpyFunc((u8*)&aucAtPServer1[1], nIPstr, JX_Strlen(nIPstr));
		JX_StringCat(aucAtPServer1,"\"", 2);
		MemcpyFunc((u8*)&aucAtPPort1[1], nPort, JX_Strlen(nPort));
		JX_StringCat(aucAtPPort1,"\"", 2);
	}

	/* 获取APN */
	if(TRUE == ReadParameterForType(&g_nApnBuf[1], APN_LEN-1, APN_PARA))
	{
		JX_StringCat(g_nApnBuf, "\"", 2);
	}

	/* 获取上报周期上报时间抄表间隔 */
	if(FALSE == ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA))
	{
		tyReport.nIntervalType=HD_INTERVAL_HOUR;//默认上报类型按小时计算
		tyReport.cycle 	= 24;	 				//默认24小时上报一次	
		tyReport.wGatherCycle = 60; 			//默认采样间隔60分钟,即抄表间隔
		
		tyReport.Time.Byte.Year = 0x15;//默认上报时间
		tyReport.Time.Byte.Month = 0x12;
		tyReport.Time.Byte.Day = 0x28;
		tyReport.Time.Byte.Hour = 0x00;
		tyReport.Time.Byte.Minute= 0x00;
		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);		
		UC_SleepFunc(1);
	}
	/*if((0 == tyReport.nMonFreezeDay)||(28 < tyReport.nMonFreezeDay))
	{
		tyReport.nMonFreezeDay   = 20;
	}*/

	/* 获取上次上报时间及累计上报次数 */
	if(FALSE == ReadParameterForType(nBuf, 10, LT_REP_TIME))
	{
		g_wTmReportCnt = 0;
		MemcpyFunc((u8*)&stReportTime, (u8*)&tyReport.Time, sizeof(tyReport.Time));
		JX_BL_Change(6, (u8*)&stReportTime);
		stReportTime.nMonth = stReportTime.nMonth&0x1F;
		TM_TimeChangeAToB(&stReportTime,&stLastReportT);
		MemcpyFunc(nBuf, (u8*)&stLastReportT, 8);
		MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
		SaveParameterForType(nBuf, 10, LT_REP_TIME);
		UC_SleepFunc(1);
 	}
	else
	{
		MemcpyFunc((u8 *)&stLastReportT, nBuf, 8);
		MemcpyFunc((u8 *)&g_wTmReportCnt, &nBuf[8], 2);
	}

	return ;
}


#endif

