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


/**************************************************************/
/* �ʹ���㶨ʱ���Ѽ��
������: LP_HD_CalReportConut
��  ��: ��
��  ��: ��
����ֵ: uint16_t
�޸���: ������
��  ��: 2018.12.03
*//*************************************************************/
void LP_XJ_CalReportTime(TM_Time* pStNextTime)
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


#endif

