/******************** (C) COPYRIGHT 2016 jason ,LTD ***********************
* File Name         : XinJiangProtocol.c
* Author            : maronglang
* Date First Issued : 2016/05/26
* Description       : �½���������ͨѶЭ��
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


/*     ȫ�ֱ���λ��         */
u8 g_Device_Info[15]={0}; 	//�豸��Ϣ
TypeProtol_HD stDataPtrHD;





/**************************************************************/
/* �ʹ���㶨ʱ���Ѽ��
������: LP_HD_CalReportConut
��  ��: ��
��  ��: ��
����ֵ: uint16_t
�޸���: ������
��  ��: 2018.12.03
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

		/* ����ǿ�ָ�������ϱ���͹������� */
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
		
		/* β�����ߴ��� */
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
		m_nDebugFlg = TRUE;  /* ����ģʽ�ϱ���Ӱ�춨ʱ�ϱ� */
	}
	
	/* �ϱ�ʧ�ܲ��� */
	nRepFlg = GetReportFailFlag();
	if((XJ_INTERVAL_MIN != tyReport.nIntervalType)&&(nRepFlg&REPORT_FAIL_FLG))
	{
		MemcpyFunc(&stStarRepTime, &stLastReportT, sizeof(TM_Time));
		
		/* �ϱ�ʧ�ܴ�����ʾ 0x02:��һ��ʧ�� 0x04:�ڶ���ʧ�� 0x08:������ʧ�� */
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

	/* ���⴦���´��ϱ�ʱ��С�ڵ�ǰʱ��60S�������� */
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
/* ��ʱ��������
������: HD_TimeOutReUpLoad
��  ��: void
��  ��: void
����ֵ: u8
�޸���: ������
��  ��: 2018.12.03
*//*********************************************/
void HD_TimeOutReUpLoad(void)
{
	if (UP_Free_HD > ucLogonMode)
	{
		HD_OnlineCtl();
		UC_SleepFunc(1000);
	}
	
	/* ��ʱ���ƽ�ֹ��δ��ʱ��ֱ�ӷ��� */
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
/* �ʹ�Э����ս���
������: HD_ProtolProc
��  ��: void
��  ��: void
����ֵ: u8
�޸���: ������
��  ��: 2018.12.03
*//*********************************************/
void HD_ProtolProc(void)
{
	u8* pnRxAdd = GetUartRxBuf();
	u8  nRxLen  = 0, nSendLen = 0;

	nSendLen = XJ_DecodeParameter(pnRxAdd, CheckRevDataLen());

	/* ���ݷ��� */
	if(0 < nSendLen)
	{
		XJ_ProtolSend(nSendLen, COM_1);
	}
	UC_SleepFunc(50);
}


/**********************************************/
/* ���߿��Ƶ�¼��ʱ��������ʱ
������: HD_OnlineCtl
��  ��: void
��  ��: void
����ֵ: u8
�޸���: ������
��  ��: 2018.12.03
*//*********************************************/
void HD_OnlineCtl(void)
{
	static u8  nFirFlg= TRUE;

	if(nFirFlg)
	{
		nFirFlg = FALSE;
		tyGSMFlag = TRUE;
	}
	
	/* �����ϱ����� */
	if( (UP_Upload_HD == ucLogonMode) && (tyGSMFlag) )
	{
		if(TRUE == XJ_Online(ucLogonMode))
		{
			ucLogonMode = UP_FREE_XJ;
			g_dwRepTick = GetSysTemTick();
			
			/* �ϱ������ۼ� */
			g_nDatRepCnt++;
		}
	}
}


/**********************************************/
/* �ϱ�+����+ͻ���¼�,3��1
������: HD_Online
��  ��: void
��  ��: void
����ֵ: u8
�޸���: ������
��  ��: 2016.05.27
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
	
	/* ��������A */
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
			
		MemcpyFunc(&pnBuf[nOffset], (u8 *)&m_wSoftVison, 2);					                       /* �汾�� */
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
		MemcpyFunc(&pnBuf[nOffset+1], (u8 *)&dwMeterVal, XJ_METERFLOW_LEN-1);				           /* ��ǰ����ֵ */
		nOffset += XJ_METERFLOW_LEN;

		JX_GetDayFreezeDat(&pnBuf[nOffset]);
		nOffset +=129;
		
		nSendLen = XJ_FRAME_FIX_LEN+nOffset;	
	}
	XJ_ProtolSend(nSendLen, COM_1);			//ֻ��1������

	/* �ȴ����ݷ������ */
	if(FALSE == WatitDataSendOk())
	{
		return FALSE;
	}
	return TRUE;
}


#endif

