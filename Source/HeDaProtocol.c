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
u8 g_Device_Info[15]={0}; 	//设备信息
TypeProtol_HD stDataPtrHD;





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
日  期: 2016.05.27
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
		pnBuf = stDataPtrXJ.Packet.Buf;
		stDataPtrXJ.Packet.CtrlB  = 0x10;
		stDataPtrXJ.Packet.ACtrlB = 0x02;
		MemcpyFunc(pnBuf,tyParameter.Status, XJ_METEST_LEN);
		nOffset += XJ_METEST_LEN;
			
		MemcpyFunc(&pnBuf[nOffset], (u8 *)&m_wSoftVison, 2);					                       /* 版本号 */
		JX_BL_Change(2, &pnBuf[nOffset]);
		pnBuf[nOffset+2] = m_wSubSwVison;
		nOffset += XJ_VISON_LEN;
		
		nTmpBuf[0] = '0';
		MemcpyFunc(&nTmpBuf[1], m_nImsiBuf, 15);					                                   /* IMSI */
		nTmpBuf[16] = 0;
		JX_AsciiToBuf(nTmpBuf, m_nImsiBufXJ);
		MemcpyFunc(&pnBuf[nOffset], m_nImsiBufXJ, 8);
		nOffset += XJ_IMSI_LEN;

		pnBuf[nOffset] = 2;
		if(FALSE == GM_GetGatherMeterFlg())
		{
			if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
			{
				tyParameter.Value = tyRecord.Value;
			}
			else
			{
				tyParameter.Value = INVALID_DATA;
			}
		}		
		dwMeterVal = tyParameter.Value;
		MemcpyFunc(&pnBuf[nOffset+1], (u8 *)&dwMeterVal, XJ_METERFLOW_LEN-1);				           /* 当前流量值 */
		nOffset += XJ_METERFLOW_LEN;

		JX_GetDayFreezeDat(&pnBuf[nOffset]);
		nOffset +=129;
		
		nSendLen = XJ_FRAME_FIX_LEN+nOffset;	
	}
	XJ_ProtolSend(nSendLen, COM_1);			//只有1组数据

	/* 等待数据发送完成 */
	if(FALSE == WatitDataSendOk())
	{
		return FALSE;
	}
	return TRUE;
}


#endif

