/******************** (C) COPYRIGHT 2016 jason ,LTD ***********************
* File Name         : XinJiangProtocol.c
* Author            : maronglang
* Date First Issued : 2016/05/26
* Description       : 新疆物联网表通讯协议
*******************************************************************************/
#include "XinJiangProtocol.h"
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

#ifdef  XINJIANG_PTR

/* 协议收发帧结构 */
TypeProtol_XJ stDataPtrXJ;

/* 软件版本号 */
u16 m_wSoftVison  = 1;
u8  m_wSubSwVison = 15; // 20170328乌鲁木齐送检版本

/* 水压 */
u16 m_wWaterGage    = 0;

u8 m_nUnicomApn[20] = {"\"UNINET\""};
u8 m_nChinaMobileApn[20] = {"\"CMNET\""};



/* 公用函数 */
#if 1
/**********************************************/
/* 获取日数据接口
函数名: JX_GetDayFreezeDat
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.06.03
*//*********************************************/
u8 JX_GetDayFreezeDat(u8* pnOutBuf)
{
	u8 i = 0;
	TypeRecordDay stRecord;
	u8 *pnBuf = NULL;
	TM_Time stTmpTime;
	
	pnOutBuf[4] = 2;
	pnBuf = pnOutBuf+5;
	for(i = 0; i < XJ_DAYFREEZE_NUM; i++)  //  wTemp
	{
		/* EEPROM无数据或记录时间为无效 */
		MemsetFunc((u8*)&stRecord, 0xFF, sizeof(stRecord));
		if((FALSE == ReadDayFreezeRecord(i, (u8*)&stRecord, sizeof(stRecord)))
			||(0xFF == stRecord.nMon)||(0xFF == stRecord.nDay))
		{
			stRecord.Value = INVALID_DATA;
		}		
		MemcpyFunc(&pnBuf[i*4], (u8*)&stRecord.Value, sizeof(stRecord.Value));
		pnOutBuf[1] = stRecord.nYear;
		pnOutBuf[2] = stRecord.nMon;
		pnOutBuf[3] = stRecord.nDay;
	}

	//if((0xFF == pnOutBuf[1])||(0xFF == pnOutBuf[2]))     /* 新疆联调时注释掉 */
	{	
		TM_TimeChangeAToB(&stTimeNow, &stTmpTime);
		TM_RTimeDecnDay(&stTmpTime, 1);                 /* 31新疆联调时注释掉 */
		pnOutBuf[2] = JX_ByteToBcd(stTmpTime.nMonth);
		pnOutBuf[1] = JX_ByteToBcd(stTmpTime.wYear%100);
		pnOutBuf[3] = JX_ByteToBcd(stTmpTime.nDay);
	}
	//JX_BL_DwordChange(XJ_DAYFREEZE_NUM, (uint32_t *)pnBuf); /* 新疆联调时注释掉 */
	pnOutBuf[0] = 0x20;
	return 129;	
}

/**********************************************/
/* 获取月数据接口
函数名: JX_GetMonFreezeDat
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.06.03
*//*********************************************/
u8 JX_GetMonFreezeDat(u8* pnOutBuf)
{
	u8 i = 0;
	TypeRecordMon stRecord;
	u8 *pnBuf = NULL;
	TM_Time stTmpTime;
	
	pnOutBuf[3] = 2;
	pnBuf = pnOutBuf+4;
	for(i = 0; i < XJ_MONFREEZE_NUM; i++)
	{
		/* EEPROM无数据或记录时间为无效 */
		MemsetFunc((u8*)&stRecord, 0xFF, sizeof(stRecord));
		if((FALSE == ReadMonFreezeRecord(i, (u8*)&stRecord, sizeof(stRecord)))
			||(0xFF == stRecord.nYear)||(0xFF == stRecord.nMon))
		{
			stRecord.Value = INVALID_DATA;
		}	
		MemcpyFunc(&pnBuf[i*4], (u8*)&stRecord.Value, sizeof(stRecord.Value));
		pnOutBuf[1] = stRecord.nYear;
		pnOutBuf[2] = stRecord.nMon;
	}

	//if((0xFF == pnOutBuf[1])||(0xFF == pnOutBuf[2]))
	{	
		TM_TimeChangeAToB(&stTimeNow, &stTmpTime);
		//TM_RTimeDecMonth(&stTmpTime, 18);
		pnOutBuf[2] = JX_ByteToBcd(stTmpTime.nMonth);
		pnOutBuf[1] = JX_ByteToBcd(stTmpTime.wYear%100);
	}
	//JX_BL_DwordChange(XJ_MONFREEZE_NUM, (uint32_t *)pnBuf);
	pnOutBuf[0] = 0x20;
	return 76;	
}

/**********************************************/
/* 获取明细数据接口
函数名: JX_GetDetailDat
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.06.03
*//*********************************************/
u8 JX_GetDetailDat(u8 nInterval, u8 nPointNum, u8* pnIoBuf)
{
	u8 i = 0, j = 0,nAtReportLen = 0;
	TypeRecord stRecord;
	u8 *pnBuf = NULL;
	ST_Time stReportTime;
	TM_Time stStar, stEnd;
	s32 dwRef = 0;
	u16 wIntervalTmp = 0;
	u8  nCnt = 0;

	MemcpyFunc(&stReportTime.wYear, &pnIoBuf[1], 5);
	stReportTime.nSecond = 0;
	TM_TimeChangeAToB(&stReportTime, &stStar);

	pnIoBuf[8] = 2;
	pnBuf = pnIoBuf+9;
	nPointNum = ((nPointNum>NUMBER_RECORD)?NUMBER_RECORD:nPointNum);
	
	for(i = 0; i < NUMBER_RECORD; i++)  //  wTemp
	{
		/* EEPROM无数据或记录时间为无效 */
		MemsetFunc((u8*)&stRecord, 0xFF, sizeof(stRecord));
		if((FALSE == ReadRecord(i, (u8*)&stRecord, sizeof(stRecord)))
			||(0xFF == stRecord.Time.Byte.Hour)||(0xFF == stRecord.Time.Byte.Day))
		{
			stRecord.Value = INVALID_DATA;
			break;
		}

		MemcpyFunc(&stReportTime, (u8*)&stRecord.Time, sizeof(stReportTime)); 
		JX_BL_Change(6, (u8*)&stReportTime);
		TM_TimeChangeAToB(&stReportTime, &stEnd);
		dwRef = TM_DiffSecond(&stStar, &stEnd);
		if(0 >= dwRef)
		{
			if(0 == i)
			{
				goto END_UnValidDat;
			}
			else    /* 找到起始时间介于两个存储时间点数据 */
			{
				break;
			}
		}
	}

	for(j = i-1; j >= 0;)
	{
		nCnt++;
		ReadRecord(j, (u8*)&stRecord, sizeof(stRecord));
		if(j == i-1)
		{
			MemcpyFunc(&stReportTime, (u8*)&stRecord.Time, sizeof(stReportTime)); 
			JX_BL_Change(6, (u8*)&stReportTime);
			stReportTime.nSecond = 0;
			MemcpyFunc(&pnIoBuf[1], &stReportTime, 5);
		}
		MemcpyFunc(&pnBuf[(nCnt-1)*4], &stRecord.Value, 4);
		
		wIntervalTmp = nInterval;
		wIntervalTmp =(wIntervalTmp*10);		
		if(0 == (wIntervalTmp%tyReport.nGatherCycle))
		{
			if(j >= wIntervalTmp/tyReport.nGatherCycle)
			{
				j = j - wIntervalTmp/tyReport.nGatherCycle;
			}
			else
			{
				break;
			}
		}
	}
END_UnValidDat:
	nAtReportLen = ((nPointNum-nCnt)*4);
	if(0 < nAtReportLen)
	{
		MemsetFunc(&pnBuf[(nCnt)*4], 0xFF, nAtReportLen);
	}
	return (nPointNum*4)+9;
}
#endif

/* 上报处理 */
#if 1
/**********************************************/
/* 注销+上报,2合1
函数名: JX_Online
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
u8 XJ_Online(u8 nLogonMode)
{
	u8  nSendLen = 0, nOffset = 0;
	u8 nTmpBuf[17]  = {0};
	u8 *pnBuf = NULL;
	u32 dwMeterVal = 0;
	
	if((XJ_ONLINE_A != tyReport.nReportType)&&(XJ_ONLINE_B!= tyReport.nReportType))
	{
		return nSendLen;
	}
	
	MemcpyFunc(&stDataPtrXJ.Packet.MeterType, &tyParameter.Type, 8);

	tyParameter.Status[0]|=((g_nSignal<<3)&0xF8);
	
	/* 上线类型A */
	if(XJ_ONLINE_A == tyReport.nReportType)
	{
		stDataPtrXJ.Packet.CtrlB  = 0x10;
		stDataPtrXJ.Packet.ACtrlB = 0x00;
		MemcpyFunc(stDataPtrXJ.Packet.Buf,tyParameter.Status, XJ_METEST_LEN);
		nSendLen = XJ_FRAME_FIX_LEN+XJ_METEST_LEN;	
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
/**********************************************/
/* 上线控制登录超时及心跳超时
函数名: XJ_OnlineCtl
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
void XJ_OnlineCtl(void)
{
	static u8  nFirFlg= TRUE;

	if(nFirFlg)
	{
		nFirFlg = FALSE;
		tyGSMFlag = TRUE;
	}
	
	/* 数据上报控制 */
	if(((UP_UPLOAD_A == ucLogonMode)||(UP_UPLOAD_B == ucLogonMode))&&(tyGSMFlag))
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
/* 超时补报控制
函数名: XJ_TimeOutReUpLoad
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
void XJ_TimeOutReUpLoad(void)
{
	if (UP_FREE_XJ > ucLogonMode)
	{
		XJ_OnlineCtl();
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
#endif

/* 参数设置被动处理部分 */
#if 1
/**********************************************/
/* 参数查询处理
函数名: XJ_ParaReadPro
入  参: wCommPid pnBuf
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
u8 XJ_ParaReadPro(u16 wCommPid, u8* pnBuf)
{
	u8 nLen         = 0;
	u8 nTmpBuf[17]  = {0};
	TM_Time  stTmpTime, stStarRepTime; //stStarTime, stEndTime, 
	u8 nOptRlt = 0, nCnt = 0;

	switch(wCommPid)
	{
		case 0x0001:
			nLen = XJ_IPADDR_LEN;
			MemcpyFunc(pnBuf, (u8 *)&tyReportParameter, nLen);	                //主站地址
			break;
			
		case 0x0002:
			nLen = XJ_VISON_LEN;
			MemcpyFunc(pnBuf, (u8 *)&m_wSoftVison, nLen);	                /* 版本号 */
			JX_BL_Change(2, pnBuf);
			pnBuf[2] = m_wSubSwVison;
			break;
			
		case 0x0003:
			nLen = XJ_GPRSTYPE_LEN;
			MemcpyFunc(pnBuf, (u8 *)&tyReport.nStartDay, nLen);	        /* 上线类型 */
			break;
			
		case 0x0004:
			nLen = XJ_GPRSTIME_LEN;
			MemcpyFunc(pnBuf, &tyReport.Time, nLen);	            /* 上线时间 */
			break;
			
		case 0x0006:
			nLen = XJ_METERTIME_LEN;
			pnBuf[0] = 0x20;
			STM8_RTC_Get(&stTimeNow);
			MemcpyFunc(&pnBuf[1], (u8 *)&stTimeNow, nLen-1);	            /* 当前时间 */
			break;
			
		case 0x0101:
			nLen = XJ_METERFLOW_LEN;
			pnBuf[0] = 2;
			if(FALSE == GatherMeterFun())
			{
			
				if(GetTmDebugModeStat())
				{
					tyParameter.Value = INVALID_DATA;
				}
				else
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
			}
			else
			{
				tyParameter.Value = JX_DwordBcdToBin(tyParameter.Value);
			}
			MemcpyFunc(&pnBuf[1], (u8 *)&tyParameter.Value, nLen-1);	            /* 当前流量值 */
			break;
			
		case 0x0102:
			nLen = XJ_M_FREEZEDAY_LEN;
			pnBuf[0] = tyReport.nMonFreezeDay;	                        /* 月结日 */
			break;
			
		case 0x0103:
			nLen = XJ_FLOW_INTERVAL_LEN;
			pnBuf[0] = tyReport.nGatherCycle;	                        /* 流量保存最小时间间隔 */
			break;
			
		case 0x0107:
			nLen = XJ_IMSI_LEN;
			nTmpBuf[0] = '0';
			GetIsmiCcidDat();
			MemcpyFunc(&nTmpBuf[1], m_nImsiBuf, 15);                      /* IMSI */
			nTmpBuf[16] = 0;
			JX_AsciiToBuf(nTmpBuf, m_nImsiBufXJ);
			MemcpyFunc(pnBuf, m_nImsiBufXJ, 8);
			break;
			
		case 0x0108:
			nLen = XJ_METEST_LEN;
			MemcpyFunc(pnBuf, tyParameter.Status, XJ_METEST_LEN);	                     /* 表状态 */		
			break;
			
		case 0x010C:
			nLen = XJ_STAGEFLOW_LEN;
			pnBuf[0] = 2;
			MemcpyFunc(&pnBuf[1], (u8 *)&tyParameter.Value, nLen-1);	            /* 当前流量值 */
			break;
			
		case 0x010D:			
			break;
			
		case 0x010E:
			nLen = XJ_FRAMETYPE_LEN;
			pnBuf[0] = tyReport.nReportType;
			break;
			
		case 0x0203:
			nLen = XJ_APN_LEN;
			pnBuf[0] = g_nApnType;
			break;
			
		case 0x0206:	            /* 清除标志不支持读取 */		
			break;
			
		case 0x020A:
			nLen = XJ_WATERGAGE_LEN;			
			MemcpyFunc(pnBuf, &m_wWaterGage, 2);                      /* IMSI */
			JX_BL_Change(2, pnBuf);
			break;					
	}

	return nLen;
}

/**********************************************/
/* 参数设置处理
函数名: XJ_ParaSetPro
入  参: wCommPid nParaLen
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
u8 XJ_ParaSetPro(u16 wCommPid, u8  nParaLen)
{
	TM_Time stEnd;
	u8 nBuf[12] = {0};

	switch(wCommPid)
	{
		case 0x0001:
			if(XJ_IPADDR_LEN != nParaLen)
			{
				return FALSE;
			}
			MemcpyFunc( (u8 *)&tyReportParameter, (u8 *)&stDataPtrXJ.Packet.Buf[3], XJ_IPADDR_LEN);	                //主站地址
			SaveParameterForType((u8 *)&tyReportParameter, ADDRESS_IPPARA_LEN, IPANDPORT_PARA);			
			break;
			
		case 0x0003:
			if((XJ_GPRSTYPE_LEN != nParaLen)||(stDataPtrXJ.Packet.Buf[3]>28))
			{
				return FALSE;
			}
			MemcpyFunc( (u8 *)&tyReport.nStartDay, (u8 *)&stDataPtrXJ.Packet.Buf[3], XJ_GPRSTYPE_LEN);           //上线类型
			SaveParameterForType((u8 *)&tyReport, REPOERCYCLE_LEN, REPORT_PARA);	

			TM_TimeChangeAToB(&stTimeNow,&stLastReportT);		
			stLastReportT.nDay = tyReport.nStartDay;
			stLastReportT.nHour = tyReport.nStartHour;
			stLastReportT.nMinute = tyReport.nStartMinute;
			stLastReportT.nSecond = 0;
			MemcpyFunc(nBuf, (u8 *)&stLastReportT,sizeof(stLastReportT));			
			MemcpyFunc(&nBuf[8], (u8 *)&g_wTmReportCnt, 2);
			SaveParameterForType(nBuf, 10, LT_REP_TIME); 
			break;
			
		case 0x0004:
			if(XJ_GPRSTIME_LEN != nParaLen)
			{
				return FALSE;
			}
			MemcpyFunc( (u8 *)&tyReport.Time, (u8 *)&stDataPtrXJ.Packet.Buf[3], XJ_GPRSTIME_LEN);	                //上线时间
			SaveParameterForType((u8 *)&tyReport, REPOERCYCLE_LEN, REPORT_PARA);					
			break;
			
		case 0x0006:
			if(XJ_METERTIME_LEN != nParaLen)
			{
				return FALSE;
			}			
			MemcpyFunc(&stTimeNow.wYear, &stDataPtrXJ.Packet.Buf[4], XJ_METERTIME_LEN-1);
			TM_TimeChangeAToB(&stTimeNow, &stEnd);
			if(FALSE == TM_IsValidTimePro(&stEnd))
			{
				return FALSE;
			}
			STM8_RTC_Set(&stTimeNow);				
			break;
			
		case 0x0101:	                /* 光电表暂时不可设置 */
			break;
			
		case 0x0102:
			if(XJ_M_FREEZEDAY_LEN != nParaLen)
			{
				return FALSE;
			}
			tyReport.nMonFreezeDay = stDataPtrXJ.Packet.Buf[3];
			SaveParameterForType((u8 *)&tyReport, REPOERCYCLE_LEN, REPORT_PARA);					
			break;
			
		case 0x0103:
			if(XJ_FLOW_INTERVAL_LEN != nParaLen)
			{
				return FALSE;
			}
			tyReport.nGatherCycle = stDataPtrXJ.Packet.Buf[3];
			SaveParameterForType((u8 *)&tyReport, REPOERCYCLE_LEN, REPORT_PARA);				
			break;
			
		case 0x010E:
			if(XJ_APN_LEN != nParaLen)
			{
				return FALSE;
			}		
			tyReport.nReportType = stDataPtrXJ.Packet.Buf[3];
			SaveParameterForType((u8 *)&tyReport, REPOERCYCLE_LEN, REPORT_PARA);
			break;
			
		case 0x0203:
			if(XJ_APN_LEN != nParaLen)
			{
				return FALSE;
			}
			
			if((XJ_CMNET_APN != stDataPtrXJ.Packet.Buf[3])&&(XJ_UNINET_APN != stDataPtrXJ.Packet.Buf[3]))
			{
				return FALSE;
			}
			g_nApnType = stDataPtrXJ.Packet.Buf[3];
			SaveParameterForType((u8 *)&g_nApnType, APN_LEN, APN_PARA);
			break;
		case 0x0206:
			if(XJ_ALM_CLR_LEN != nParaLen)
			{
				return FALSE;
			}
			tyParameter.Status[0]&=(~stDataPtrXJ.Packet.Buf[3]);
			tyParameter.Status[1]&=(~stDataPtrXJ.Packet.Buf[4]);			
			tyParameter.Status[2]&=(~stDataPtrXJ.Packet.Buf[5]);
			tyParameter.Status[3]&=(~stDataPtrXJ.Packet.Buf[6]);
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
			break;
		default:
			break;					
	}
	
	return TRUE;
}

/**********************************************/
/* 新疆协议处理
函数名: XJ_DecodeParameter
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
u8 XJ_ProtolHandle(void)
{
	u8 nSendLen    = 0;
	u16 wCommCtrlB = 0;
	u16 wCommPid   = 0;
	u8  nParaLen   = 0;
	ST_Time stReportTime;
	TM_Time stStar, stEnd;
	int32_t dwTimeOffset = 0; 
	u8 nCmdId  = 0;

	MemcpyFunc(&stDataPtrXJ.Packet.MeterType, &tyParameter.Type, 8);
	MemcpyFunc((u8*)&wCommCtrlB, &stDataPtrXJ.Packet.CtrlB, 2);
	MemcpyFunc((u8*)&wCommPid, stDataPtrXJ.Packet.Buf, 2);
	nParaLen = stDataPtrXJ.Packet.Buf[2];
	nCmdId   = stDataPtrXJ.Packet.Buf[0];

	if(0x8101 == wCommCtrlB)             /* 水表参数设置 */
	{
		if(XJ_ParaSetPro(wCommPid, nParaLen))
		{
			stDataPtrXJ.Packet.Buf[0]  = 0x01;
		}
		else
		{
			stDataPtrXJ.Packet.Buf[0]  = 0x00;
		}
		stDataPtrXJ.Packet.CtrlB  = 0x01;
		stDataPtrXJ.Packet.ACtrlB = 0x01;
		nSendLen = XJ_FRAME_FIX_LEN+1;		
	}
	else if(0x8100 == wCommCtrlB)       /* 水表参数查询 */
	{
		stDataPtrXJ.Packet.CtrlB  = 0x01;
		stDataPtrXJ.Packet.ACtrlB = 0x00;
		stDataPtrXJ.Packet.Buf[2] = XJ_ParaReadPro(wCommPid, &stDataPtrXJ.Packet.Buf[3]);
		nSendLen = stDataPtrXJ.Packet.Buf[2]+3+XJ_FRAME_FIX_LEN;
	}
	else if(0x8200 == wCommCtrlB)       /* 表地址的查询 */
	{
		stDataPtrXJ.Packet.CtrlB  = 0x02;
		stDataPtrXJ.Packet.ACtrlB = 0x00;
		stDataPtrXJ.Packet.Buf[0]  = 0x01;
		nSendLen = XJ_FRAME_FIX_LEN+1;				
	}
	else if(0x8201 == wCommCtrlB)       /* 表地址的设置 */
	{
		MemcpyFunc(&tyParameter.Type, stDataPtrXJ.Packet.Buf, 8);
		SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
		MemcpyFunc(&stDataPtrXJ.Packet.MeterType, &tyParameter.Type, 8);
		stDataPtrXJ.Packet.CtrlB  = 0x02;
		stDataPtrXJ.Packet.ACtrlB = 0x01;
		stDataPtrXJ.Packet.Buf[0]  = 0x01;
		nSendLen = XJ_FRAME_FIX_LEN+1;		
	}
	else if((0x9000 == wCommCtrlB)||(0x9002 == wCommCtrlB))
	{
		m_nRepEnableFlg = FALSE;
		SetIO_LEDOn();
		MemcpyFunc(&stTimeNow.nMonth, &stDataPtrXJ.Packet.Buf[2], 5);
		stTimeNow.wYear = stDataPtrXJ.Packet.Buf[1];
		TM_TimeChangeAToB(&stTimeNow, &stEnd);
		if(FALSE == TM_IsValidTimePro(&stEnd))
		{
			return nSendLen;
		}
		STM8_RTC_Get(&stReportTime);	
		STM8_RTC_Set(&stTimeNow);		
		TM_TimeChangeAToB(&stReportTime, &stStar);
		dwTimeOffset = TM_DiffSecond(&stStar, &stEnd);
		if((-3600 >= dwTimeOffset)||(3600 <= dwTimeOffset))
		{
			stRepFail.wError |= (1<<RTC_TIMEERROR);
			MemcpyFunc(&stRepFail.stTime, &stReportTime, sizeof(stRepFail.stTime));
			stRepFail.nSigal = 0xFF;		//信号大小,固定值
			AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
		}
	}
	else if(0xF900 == wCommCtrlB)
	{
		if(XJ_STAYONLINE == stDataPtrXJ.Packet.Buf[0])
		{
			g_dwCommDelay = 60000;
		}
		else if (XJ_OFFLINE == stDataPtrXJ.Packet.Buf[0])
		{
			g_dwCommDelay = 0;
			tyGSMFlag = FALSE;
		}
		stDataPtrXJ.Packet.CtrlB  = 0x79;
		stDataPtrXJ.Packet.ACtrlB = 0x00;
		stDataPtrXJ.Packet.Buf[0]  = 0x00;
		nSendLen = XJ_FRAME_FIX_LEN+1;	
	}
	else if(0x9201 == wCommCtrlB)
	{
		if(tyParameter.Status[1]&0x40)
		{
			stDataPtrXJ.Packet.Buf[0]  = 0x02;
		}
		else
		{
			stDataPtrXJ.Packet.Buf[0]  = 0x01;
		}
		
		if(0x55 == nCmdId)
		{
			g_nOptValveTask = VALVEOPEN;
		}
		else
		{
			g_nOptValveTask = VALVECLOSE;
		}
		stDataPtrXJ.Packet.CtrlB  = 0x12;
		stDataPtrXJ.Packet.ACtrlB = 0x01;
		nSendLen = XJ_FRAME_FIX_LEN+1;	
	}
	else if (0x9202 == wCommCtrlB)
	{
		stDataPtrXJ.Packet.CtrlB  = 0x12;
		stDataPtrXJ.Packet.ACtrlB = 0x02;
		if(XJ_DAYFREEZE_CMD == nCmdId)
		{
			JX_GetDayFreezeDat(&stDataPtrXJ.Packet.Buf[1]);
			nSendLen = XJ_FRAME_FIX_LEN+1+129;	
		}
		else if(XJ_MONFREEZE_CMD == nCmdId)
		{
			nSendLen = XJ_FRAME_FIX_LEN+1+JX_GetMonFreezeDat(&stDataPtrXJ.Packet.Buf[1]);
		}
		else if(XJ_DETAILDAT_CMD == nCmdId)
		{
			nSendLen = XJ_FRAME_FIX_LEN+1+JX_GetDetailDat(stDataPtrXJ.Packet.Buf[7], stDataPtrXJ.Packet.Buf[8], &stDataPtrXJ.Packet.Buf[1]);
		}
	}
	
	return nSendLen;
}

/**********************************************/
/* 上行协议处理,登录到服务器后,实际发送到服务器数据,和GPRS无关
函数名: XJ_ProtolSend
入  参: Size nComChannel
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
s8 XJ_ProtolSend(u8 Size, u8 nComChannel)
{
	u8 *Point, nX, checksum;
	u16 length = 0;
	TypeProtolHead_XJ tyProtolHead;
	s8 nFailCnt = 0, nOptRelt = FALSE;

	/* GPRS增加长度数据命令发送 */
	if(COM_1 == nComChannel)
	{
		/* 增加发送数据长度 */
		while(3 > nFailCnt++)
		{		
			nOptRelt = GPRS_TcpSendDatLen(Size + XJ_FRAME_OTHER_LEN); //0x0D不算入长度
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
	tyProtolHead.Head0 = XJ_MSG_HEAD_START;		//数据包头
	tyProtolHead.Length0[0] = ((length>>8)&0xFF);
	tyProtolHead.Length0[1] = (length&0xFF);
	tyProtolHead.Head1 = XJ_MSG_END_START;		//数据包头
	Point = aucUartTxBuffer;		//指针指向接收发送缓冲头

	MemcpyFunc(Point, (u8 *)&tyProtolHead, sizeof(tyProtolHead) );	//复制数据头到缓冲中
	Point += sizeof(tyProtolHead);			//指针向下
	checksum = 0;					//校验和是累加和
	for (nX = 0; nX < Size; nX++)
	{
		checksum += stDataPtrXJ.Buffer[nX];    //计算累加和
	}
	stDataPtrXJ.Buffer[length++] = checksum;
	stDataPtrXJ.Buffer[length++] = XJ_MSG_END;		//数据包尾
	MemcpyFunc(Point, (u8 *)&stDataPtrXJ, length);		//复制字符串到缓冲中
	Point += length;

	FrameSendFunc(Size+XJ_FRAME_OTHER_LEN, nComChannel, Point);
	return TRUE;
}

/**********************************************/
/* 地址判断
函数名: XJ_AddressComparePro
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
u8 XJ_AddressComparePro(u8 *pnAddr, u8 nLen)
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
/* 新疆协议接收解析
函数名: XJ_DecodeParameter
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
u8 XJ_DecodeParameter(u8* pnRxBuf, u8 nRxLen)
{
	u8 *Point = NULL;
	u16 wDataLen = 0, wLen = 0;	
	TypeProtolHead_XJ tyProtolHead;	
	u8 nSendLen = 0;
	
	if(NULL == pnRxBuf)
	{
		return nSendLen;
	}
    Point = pnRxBuf;

	/* 找包头 */
	while((XJ_MSG_HEAD_START != *Point)||(XJ_MSG_END_START != *(Point+3)))
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

	/* 帧数据长度 */
	MemcpyFunc((u8*)&wDataLen, tyProtolHead.Length0, 2);

	/* 帧数据长度 */
	if((wDataLen+2+wLen) > CheckRevDataLen()) //wLen为非法数据偏移量
	{
		return nSendLen;
	}
	
	/* 帧尾校验 */
	if(XJ_MSG_END != *(Point+wDataLen+sizeof(tyProtolHead)+1))
	{
		goto __UC_Pro_Exit;
	}

	/* CS校验 */
	if(*(Point+wDataLen+sizeof(tyProtolHead)) != JX_AddSum8Bit(Point+sizeof(tyProtolHead), wDataLen))
	{
		goto __UC_Pro_Exit;
	}
	
	Point += sizeof(tyProtolHead);
	MemcpyFunc( (u8 *)&stDataPtrXJ, Point, wDataLen);		//复制字符串到缓冲中

	/* 地址校验 */
	if(FALSE == XJ_AddressComparePro(&stDataPtrXJ.Packet.MeterType, 8))
	{
		goto __UC_Pro_Exit;
	}
	
	nSendLen = XJ_ProtolHandle();
	
__UC_Pro_Exit:

	/* add by maronglang clear RxBuf */
	ClearRxBuff();
	return nSendLen;
}


/**********************************************/
/* 新疆协议接收解析
函数名: XJ_ProtolProc
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.27
*//*********************************************/
void XJ_ProtolProc(void)
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
/*  新疆协议模块初始化函数
函数名: XJ_InitializeGsm
入  参: void
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.06.21
*//*********************************************/
void XJ_InitializeGsm(void)
{
	char nIPstr[32] = {0};
	u8 nPort[6]     = {0};
	u16 dwPortNum = 0;
	u8 nBuf[10]     = {0};
	
	MemsetFunc(nPort, 0, sizeof(nPort));
	MemsetFunc(nIPstr, 0, sizeof(nIPstr));		
	SetLogonMode(UP_UPLOAD_B);
	
	/* 获取上报IP地址参数 */
	if(TRUE == ReadParameterForType((u8 *)&tyReportParameter, sizeof(tyReportParameter), IPANDPORT_PARA))
	{
		JX_IpAddrToStr(nIPstr, (u8*)&tyReportParameter.Main_IP);
		MemcpyFunc((u8*)&dwPortNum, (u8*)&tyReportParameter.Main_Port, 2);
		JX_U32ToStr(dwPortNum, nPort);
		MemsetFunc(&aucAtPServer1[1], 0, sizeof(aucAtPServer1)-1);
		MemsetFunc(&aucAtPPort1[1], 0, sizeof(aucAtPPort1)-1);
		
		MemcpyFunc(&aucAtPServer1[1], nIPstr, strlen(nIPstr));
		JX_StringCat(aucAtPServer1,"\"");
		MemcpyFunc(&aucAtPPort1[1], nPort, strlen(nPort));
		JX_StringCat(aucAtPPort1,"\"");
	}

	/* 获取APN */
	if((TRUE == ReadParameterForType(&g_nApnType, APN_LEN, APN_PARA))&&(XJ_UNINET_APN == g_nApnType))
	{
		MemcpyFunc(g_nApnBuf, m_nUnicomApn, 20);
	}
	else
	{
		g_nApnType = XJ_CMNET_APN;
		MemcpyFunc(g_nApnBuf, m_nUnicomApn, 20);
	}

	/* 获取上报周期上报时间抄表间隔 */
	if(FALSE == ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA))
	{
		tyReport.cycle = 7;
		tyReport.nIntervalType = 1;		
		tyReport.nGatherCycle = 240;
		tyReport.nStartDay    = 1;
		tyReport.nStartHour   = 0;
		tyReport.nStartMinute = 0;
		tyReport.nTailCtl     = 1;
		tyReport.nTaiInterval = 1;
		tyReport.nMonFreezeDay = 25;
		tyReport.nReportType   = XJ_ONLINE_B;
			
		tyReport.Time.nYear = 15;
		tyReport.Time.nMonth = 12;
		tyReport.Time.nDay = 28;
		tyReport.Time.nHour = 0x00;
		tyReport.Time.nMinute= 0x00;
		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);		
		UC_SleepFunc(1);
	}
	if((0 == tyReport.nMonFreezeDay)||(28 < tyReport.nMonFreezeDay))
	{
		tyReport.nMonFreezeDay   = 25;
	}

	/* 获取上次上报时间及累计上报次数 */
	if(FALSE == ReadParameterForType(nBuf, 10, LT_REP_TIME))
	{
		g_wTmReportCnt = 0;
		MemcpyFunc(&stLastReportT.nMonth, &tyReport.Time.nMonth, sizeof(tyReport.Time)-1);
		stLastReportT.wYear = (u16)2000+tyReport.Time.nYear;
		MemcpyFunc(nBuf, &stLastReportT, 8);
		MemcpyFunc(&nBuf[8], &g_wTmReportCnt, 2);
		SaveParameterForType(nBuf, 10, LT_REP_TIME);
 	}
	else
	{
		MemcpyFunc((u8 *)&stLastReportT, nBuf, 8);
		MemcpyFunc((u8 *)&g_wTmReportCnt, &nBuf[8], 2);
	}
	
	return ;
}

#endif

#endif

