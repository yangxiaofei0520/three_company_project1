/*
��Ŀ:		IP��
��д:		������
ģ������:	ͨ�Ŷ�������
�ļ���:	meter.c
��ʼʱ��:	2015-8-20 14:53:41
*/
#include "Meter.h"
#include "ProtocolGlobal.h"
#include "JX_Math.h"
#include "DriverUart.h"
//#include <string.h>
#include "FileGlobal.h"
#include "ProtocolGlobal.h"
#include "STM8_Rtc.h"
#include "Pwrctr.h"
#include "GsmGlobal.h"
#include "CJ188.h"
#include "Alarm.h"


//����Ϊ����
u8 ucStatusMeter;		//״̬
u8 ucStepMeter;		//����ѹ����,����
//u8 ucTimerMeter;		//���ö�ʱ��,8.16ms

/* ������ Ĭ��15���� */
u16 g_wGMInterval = 15;

/* ʱ��ṹ�� */
volatile TypeTime tyTime;


/* �״��ϵ��־ */
u8 g_nGmFlg = TRUE;     

/* �����־ */
u8 g_nErrFlg = 0; /*  */

/* �����־ */
u8 g_nGatherMeterFlg = FALSE;

/* ����ִ������ */
u8 g_nOptValveTask = 0xFF;

/* ��ǰ����BIN */
u32 g_dwNowMeterVal = 0;

/* �½�Э�� */
#ifdef XINJIANG_PTR
/******************************************************************************
* �� �� ��: XJ_VavleErrorPro(void)
* ��������: �����쳣����
* ��ڲ���: ��
* ʱ	��: 2016��11��08��11:37:00
* �� �� ��: maronglang
* ˵    ��: 
*******************************************************************************/
void XJ_VavleErrorPro(u8 nVavleStat)
{
	if(VALVE_ERROR == nVavleStat)
	{
		if(tyParameter.RestoreStat[1]&0x40)
		{
			tyParameter.Status[1] |= (0x01<<6); 
			tyParameter.RestoreStat[1] &=(~0x40);
		}
	}
	else if((VALVE_CLOSE == nVavleStat)||(VALVE_OPEN == nVavleStat))
	{
		if(0x40 != (tyParameter.RestoreStat[1]&0x40))
		{
			tyParameter.Status[1] &= (~0x40); 
			tyParameter.RestoreStat[1] |=(0x40);
		}
		if(VALVE_CLOSE == nVavleStat)
		{
			tyParameter.Status[1] |= (0x01<<7); 
		}
		else
		{
			tyParameter.Status[1] &= (~(0x01<<7));	
		}
	}
}
/******************************************************************************
* �� �� ��: TimeGatherMeterProc(void)
* ��������: ��ʱ��������
* ��ڲ���: ��
* ʱ	��: 2016��6��22��11:37:00
* �� �� ��: maronglang
* ˵    ��: ������С����������
*******************************************************************************/
void TimeGatherMeterProc(void)
{
	ST_Time stLastTime;
	TM_Time stStar, stEnd;
	int32_t dwOffset   = 0;
	u8 nRepFlg = 0;
	static u8 nTimeOut = 0;
	
	nRepFlg = GetReportFailFlag();
	
#ifndef SAVE_TEST
	if((FALSE == g_nGmFlg)||(FALSE != (nRepFlg&REPORT_FAIL_FLG)))
	{
		LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
		return ;
	}
#if 1
	MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));
	if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord))))
	{
		MemcpyFunc(&tyTime, &tyRecord.Time, sizeof(TypeTime));
		JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
		MemcpyFunc(&stLastTime, &tyTime, sizeof(TypeTime));
		STM8_RTC_Get(&stTimeNow);
		TM_TimeChangeAToB(&stTimeNow, &stEnd);
		TM_TimeChangeAToB(&stLastTime, &stStar);
		dwOffset = TM_DiffSecond(&stStar, &stEnd);
				
		/* ʱ�ӷǷ����� ��������δ���ҳ����ϱ���־���ɹ����Ҳ��ǰ��������򲻽��г����� */
		if((2015 >= stEnd.wYear)||((0xFF != tyRecord.Time.Byte.Day) && (0 < dwOffset)
			&& (tyReport.nGatherCycle-3 > (u32)((dwOffset)/60))))
		{
			//g_nGmFlg = FALSE;
			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
			return ;
		}
	}
#endif
#endif

	/* ���ó���ӿڳ��� */
	if(TRUE == (g_nGatherMeterFlg = GatherMeterFun()))
	{
		/* ����ɹ���رյ�Դ���������� */
		SetPortMeterPowerOff();
		g_nGmFlg = FALSE;
		STM8_RTC_Get(&stTimeNow);
		MemcpyFunc(&tyTime, &stTimeNow, sizeof(TypeTime));
		JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
		tyRecord.Value = JX_DwordBcdToBin(tyParameter.Value);
		tyParameter.Value = tyRecord.Value;		
		MemcpyFunc((u8*)&tyRecord.Time, (TypeTime*)&tyTime, sizeof(TypeTime));

		XJ_VavleErrorPro(g_nValveStat);
		SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
		UC_SleepFunc(60);
		
		if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
		{
			AddRecord((u8*)&tyRecord, sizeof(tyRecord));
			UC_SleepFunc(60);
		}
		MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));
		ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord));
		LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
		
		/* ��������澯 */
		ALM_ClrAlmStatus(METER_ERROR);
	}		
	else /* ����ʧ������г�ʱͳ�� */
	{
		nTimeOut++;		
		UC_SleepFunc(1000);
		
		if(3 < nTimeOut)
		{
			g_nGmFlg = FALSE;					
			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
			MemsetFunc((u8*)&tyRecord, 0xFF, sizeof(tyRecord)); /* ����ʧ����ʾ0xEE */
			tyRecord.Value = INVALID_DATA;
			if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
			{
				AddRecord((u8*)&tyRecord, sizeof(tyRecord));
				UC_SleepFunc(60);
			}

			/* ���ü����澯 */
			ALM_SetAlmStatus(METER_ERROR);
			
			/* ����ʧ�����������ɸ澯���� */				
			stRepFail.wError |= (1<<GM_GATHERMETER_FAIL);
			STM8_RTC_Get(&stTimeNow);
			MemcpyFunc(&stRepFail.stTime, &stTimeNow, sizeof(stRepFail.stTime));
			stRepFail.nSigal = 0xFF;			//�źŴ�С,�̶�ֵ
			AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
			UC_SleepFunc(60);
		}
	}
	return ;
}
#endif

#ifdef PIEZOMETER
/******************************************************************************
* �� �� ��: JASON_GmPiezometer(void)
* ��������: ѹ����ֵ�ɼ�
* ��ڲ���: ��
* ʱ	��: 2017��5��21��15:37:00
* �� �� ��: maronglang
* ˵    ��: �ɼ����
*******************************************************************************/
void JASON_GmPiezometer(u8 nRepFlg)
{
	u8 nLoop = 0;
	u32 wPizeometerVol = 0; 
	static u8 nGmPiezoFlg = TRUE;

	if(FALSE == nGmPiezoFlg)
	{
		return ;
	}
	nGmPiezoFlg = FALSE;
	for(nLoop = 0; nLoop <3; nLoop++)
	{
		/* ���ó���ӿڳ��� */
		wPizeometerVol = MODBUS_GetPizeometer(READ_CMD);
#ifdef TEST_VISON
		wPizeometerVol = 12345678;
#endif
		if(INVALID_DATA  != wPizeometerVol)
		{		
			/* ����ɹ���رյ�Դ���������� */
			tyRecord.wPressure = wPizeometerVol;
			if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
			{
				AddRecord((u8*)&tyRecord, sizeof(tyRecord));
				UC_SleepFunc(60);
			}
			
			/* ��������澯 */
			ALM_ClrAlmStatus(PIEZOMETER_ERROR);
			break;
		}		
		else /* ����ʧ������г�ʱͳ�� */
		{			
			UC_SleepFunc(1000);
		}
	}
	if(3 <= nLoop)
	{
		tyRecord.wPressure = wPizeometerVol;
		if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
		{
			AddRecord((u8*)&tyRecord, sizeof(tyRecord));
			UC_SleepFunc(60);
		}		
		/* ���ü����澯 */
		ALM_SetAlmStatus(PIEZOMETER_ERROR);
	
		/* ����ʧ�����������ɸ澯���� */				
		//stRepFail.wError |= (1<<GM_PIEZOMETER_FAIL);
		//STM8_RTC_Get(&stTimeNow);
		//MemcpyFunc(&stRepFail.stTime, &stTimeNow, sizeof(stRepFail.stTime));
		//stRepFail.nSigal = 0xFF;			//�źŴ�С,�̶�ֵ
		//AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
		//UC_SleepFunc(60);
	}
	return ;
}
#endif

#ifdef JASON130_PTR
/******************************************************************************
* �� �� ��: JASON_130PurchasePro(void)
* ��������: ����Ԥ���Ѵ���
* ��ڲ���: ��
* ʱ	��: 2016��7��05��15:37:00
* �� �� ��: maronglang
* ˵    ��: Ԥ���Ѵ���ط�
*******************************************************************************/
void JASON_130PurchasePro(void)
{
#ifdef PURCHASE_MODE
	u8 nRepFlg = 0;
	u8 nEmergencyVal = 0;
	u32 dwPurchaseVal= 0, dwTmp = 0;
	
	g_dwNowMeterVal = JX_DwordBcdToBin(tyParameter.Value);
	g_dwNowMeterVal = (g_dwNowMeterVal/100);   // 100 Ϊ С��λȥ�� ��ǰ����
	
	/* Ӧ��ģʽ */
	if(OWED_USED_FLG == (tyParameter.nOverBuyFlg&OWED_USED_FLG))
	{
		if(0 > tyParameter.nEmergencyVal)
		{
			dwPurchaseVal = tyParameter.dwPurchaseVal;
		}
		else
		{
			nEmergencyVal = (u8)(tyParameter.nEmergencyVal);
			dwPurchaseVal = tyParameter.dwPurchaseVal+ nEmergencyVal;
		}
	}
	else 		/* ����ģʽ */
	{
		if(0 > tyParameter.nEmergencyVal)
		{
			nEmergencyVal = (u8)(-tyParameter.nEmergencyVal);

			/* �߽�ֵ���� */
			if(nEmergencyVal > tyParameter.dwPurchaseVal)
			{
				if(UP_LIMIT_DATA <= g_dwNowMeterVal)
				{
					dwTmp = nEmergencyVal;
					dwPurchaseVal = (u32)FULL_RANGE_METER - (dwTmp - tyParameter.dwPurchaseVal);
				}
				else /* Ԥ��������100������Ϊ0 */
				{
					dwPurchaseVal = 0;
				}
			}
			else
			{
				dwPurchaseVal = tyParameter.dwPurchaseVal - nEmergencyVal;
			}
		}
		else
		{
			dwPurchaseVal = tyParameter.dwPurchaseVal;
		}	
	}
	/* ������λ���� */
	if((UP_LIMIT_DATA <= g_dwNowMeterVal) && (HALF_FULL_RANGE >= dwPurchaseVal))
	{
		goto END_OpenVavle;
	}
	
	if((dwPurchaseVal <= g_dwNowMeterVal) /* ���Ԥ����Ϊ������ȫ9ʱ�����Ƕ����ܳ���Ϊ0-����ֵʱ */
	||((LIMIT_PURCHASE > g_dwNowMeterVal) && (UP_LIMIT_DATA < dwPurchaseVal)))
	{
		if(VALVE_OPEN == GetVavleStat())
		{
			VavleOperateFun(VALVECLOSE);
			LP_ClrLowPwrStartFlg(LP_GPRS_FLG_OK);
			tyParameter.nOverBuyFlg |= OWED_STAT_FLG;
			tyParameter.nOverBuyFlg &= (~(OWED_REP_SUCC|OWED_REP_FAIL));
			if(VALVE_CLOSE == g_nValveStat)
			{
				tyParameter.Status = OLD_VAVLE_CLOSE;	
			}
			else if(VALVE_ERROR == g_nValveStat)
			{
				tyParameter.Status = OLD_VAVLE_ERROR;	
			}
			else
			{
				tyParameter.Status = g_nValveStat;
			}
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
			UC_SleepFunc(60);
		}
		else
		{			
			nRepFlg = GetReportFailFlag();
			if((KEY_WUAKEUP_FLG == (nRepFlg&KEY_WUAKEUP_FLG))&&(OWED_USED_FLG != (tyParameter.nOverBuyFlg&OWED_USED_FLG)))
			{
				tyParameter.nOverBuyFlg |= OWED_USED_FLG;
				SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
				UC_SleepFunc(60);
				
				if(0 > tyParameter.nEmergencyVal)
				{
					dwPurchaseVal = tyParameter.dwPurchaseVal;
				}
				else
				{
					dwPurchaseVal = ((tyParameter.dwPurchaseVal+ (u8)(tyParameter.nEmergencyVal))%FULL_RANGE_METER);
				}

				/* ���Ԥ����Ϊ������ȫ9ʱ�����Ƕ����ܳ���Ϊ0-����ֵʱ */
				if((LIMIT_PURCHASE > g_dwNowMeterVal) && (UP_LIMIT_DATA < dwPurchaseVal))
				{
					return ;
				}
				
				if((g_dwNowMeterVal < dwPurchaseVal)
					||((UP_LIMIT_DATA <= g_dwNowMeterVal) && (HALF_FULL_RANGE >= dwPurchaseVal)))
				{
					goto END_OpenVavle;
				}
			}
		}
		return ;
	}

END_OpenVavle:
	if(0 != tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL))
	{
		tyParameter.nOverBuyFlg &= (~(OWED_REP_SUCC|OWED_REP_FAIL));
		SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
		UC_SleepFunc(60);
	}
	if(VALVE_OPEN != GetVavleStat())
	{
		/* �ɷѺ󿪷� */
		VavleOperateFun(VALVEOPEN);
		if(VALVE_CLOSE == g_nValveStat)
		{
			tyParameter.Status = OLD_VAVLE_CLOSE;	
		}
		else if(VALVE_ERROR == g_nValveStat)
		{
			tyParameter.Status = OLD_VAVLE_ERROR;	
		}
		else
		{
			tyParameter.Status = g_nValveStat;
		}
	}
	return ;
#endif
}

/******************************************************************************
* �� �� ��: JASON_130TaskMeter(void)
* ��������: ���ȳ������� ���г����EEPROM
* ��ڲ���: ��
* ʱ	��: 2015��8��04��15:37:00
* �� �� ��: maronglang
* ˵    ��: ������
*******************************************************************************/
void JASON_130TaskMeter(void)
{
	static u8 nTimeOut = 0;
	int32_t dwOffset   = 0;
	u8 nRepFlg = 0, nReadFlg = FALSE;
	u16 wGatherInterval = 0; 

#ifndef SAVE_TEST
	/* �ϵ������Ҫ�ϱ��������ӳ�6����г��� */
	if((GetReportFlag())&&g_dwSysTick<6000)
	{
		return ;
	}
#endif
	nRepFlg = GetReportFailFlag();
	if(TRUE == g_nGmFlg)
	{	
		MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));
		nReadFlg = ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord));
		dwOffset = ClaGatherMeterTime(tyRecord.Time);
#ifndef SAVE_TEST
		if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&(TRUE == nReadFlg))
		{
			wGatherInterval = tyReport.wGatherCycle;
			
			/* ʱ�ӷǷ����� ��������δ���ҳ����ϱ���־���ɹ����Ҳ��ǰ��������򲻽��г����� */
			if((0x15 >= stTimeNow.wYear)||((0xFF != tyRecord.Time.Byte.Day) && (0 < dwOffset)
				&& (wGatherInterval-1 > (u32)((dwOffset)/60)))) //(FALSE != tyRecord.nRepFlg)
			{
				//g_nGmFlg = FALSE;
				LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
				return ;
			}			
		}
		dwOffset = ClaGatherMeterTime(tyReport.Time);		

		/* ��ֹ�������ʱ��ƫ������ */
		if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&((0 > dwOffset)||(1 < (u32)((dwOffset/60)%(u32)wGatherInterval))))
		{
			//g_nGmFlg = FALSE;
			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
			return ;
		}

		/* ��ȡʧ������� */
		if(FALSE == nReadFlg)
		{
			ReWriteRepFlg();
		}
#endif

#ifdef PHOTOELECTRIC_METER
	    /* ���ó���ӿڳ��� */
		if(TRUE == (g_nGatherMeterFlg = GatherMeterFun()))
		{		
			/* ����ɹ���رյ�Դ���������� */
			SetPortMeterPowerOff();
#ifndef SAVE_TEST			
			g_nGmFlg = FALSE;
#endif
			/* ���ʱ�䲻׼�������⴦�� ��ǰʱ�� ���� �ϴ�ʱ�䣬С���´��ϱ�ʱ�� */			
			tyRecord.Time.Byte.Year = stTimeNow.wYear;
			tyRecord.Time.Byte.Month = stTimeNow.nMonth;
			tyRecord.Time.Byte.Day = stTimeNow.nDay;
			tyRecord.Time.Byte.Hour = stTimeNow.nHour;
			if(60 <= wGatherInterval)
			{
				tyRecord.Time.Byte.Minute = 0;
			}
			else
			{
				tyRecord.Time.Byte.Minute = stTimeNow.nMinute;
			}

			tyRecord.Time.Byte.Second = 0;               /* �洢ֻ��ȷ������ */
			tyRecord.Value = tyParameter.Value;
#ifdef	VAVLE_METER
			if(VALVE_CLOSE == g_nValveStat)
			{
				tyParameter.Status = OLD_VAVLE_CLOSE;	
			}
			else if(VALVE_ERROR == g_nValveStat)
			{
				tyParameter.Status = OLD_VAVLE_ERROR;	
			}
			else
			{
				tyParameter.Status = g_nValveStat;
			}
#else
			tyParameter.Status = 0x00;
#endif
			tyRecord.nStatus = tyParameter.Status;
			tyRecord.nRepFlg = TRUE;
#ifndef PIEZOMETER
			if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
			{
				AddRecord((u8*)&tyRecord, sizeof(tyRecord));
				UC_SleepFunc(60);
			}
#endif
#ifndef SAVE_TEST			
			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
#endif
			JASON_130PurchasePro();
			
			/* ��������澯 */
			ALM_ClrAlmStatus(METER_ERROR);
		}		
		else /* ����ʧ������г�ʱͳ�� */
		{			
			nTimeOut++;
			UC_SleepFunc(1000);
			if(3 < nTimeOut)
			{
				g_nGmFlg = FALSE;					
				LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
				MemsetFunc((u8*)&tyRecord, 0xFF, sizeof(tyRecord));
				tyRecord.Value = INVALID_DATA;
				tyRecord.nRepFlg = TRUE;
#ifndef PIEZOMETER
				if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
				{
					AddRecord((u8*)&tyRecord, sizeof(tyRecord));
					UC_SleepFunc(60);
				}
#endif				
				/* ���ü����澯 */
				ALM_SetAlmStatus(METER_ERROR);

				/* ����ʧ�����������ɸ澯���� */				
				stRepFail.wError |= (1<<GM_GATHERMETER_FAIL);
				STM8_RTC_Get(&stTimeNow);
				MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stTimeNow, sizeof(stRepFail.stTime));
				stRepFail.nSigal = 0xFF;			//�źŴ�С,�̶�ֵ
				AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
				UC_SleepFunc(60);
			}
			else   //add 2018032801 ����ɼ���������������ϱ����⣻
			{
				return ;
			}
		}
#ifdef PIEZOMETER
		if(FALSE == g_nGmFlg)
		{
			JASON_GmPiezometer(nRepFlg);
		}
#endif
#else				
		/* ���ʱ�䲻׼�������⴦�� ��ǰʱ�� ���� �ϴ�ʱ�䣬С���´��ϱ�ʱ�� */ 		
		tyRecord.Time.Byte.Year = stTimeNow.wYear;
		tyRecord.Time.Byte.Month = stTimeNow.nMonth;
		tyRecord.Time.Byte.Day = stTimeNow.nDay;
		tyRecord.Time.Byte.Hour = stTimeNow.nHour;
		if(60 <= wGatherInterval)
		{
			tyRecord.Time.Byte.Minute = 0;
		}
		else
		{
			tyRecord.Time.Byte.Minute = stTimeNow.nMinute;
		}
		tyRecord.Time.Byte.Second = 0;				 /* �洢ֻ��ȷ������ */
		tyRecord.Value = INVALID_DATA;
		tyParameter.Status = 0x00;
		tyRecord.nRepFlg = TRUE;
		g_nGmFlg = FALSE;	
		JASON_GmPiezometer(nRepFlg);
#endif
	}
	else
	{
		g_nGmFlg = FALSE; //�������ٳ���
		LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
	}
	return ;
}
#endif

/******************************************************************************
* �� �� ��: ClaGatherMeterTime(void)
* ��������: ������ʱ�����
* ��ڲ���: ��
* ʱ	��: 2016��8��30��15:37:00
* �� �� ��: maronglang
* ˵    ��: ���㳭��ʱ��
*******************************************************************************/
int32_t ClaGatherMeterTime(TypeTime stTime)
{
	ST_Time stLastTime;
	TM_Time stStar, stEnd;
	int32_t dwOffset = 0;

	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&stTime);
	MemcpyFunc((u8*)&stLastTime, (u8*)&stTime, sizeof(TypeTime));
	STM8_RTC_Get(&stTimeNow);
	TM_TimeChangeAToB(&stTimeNow, &stEnd);
	TM_TimeChangeAToB(&stLastTime, &stStar);
	dwOffset = TM_DiffSecond(&stStar, &stEnd);	
	
	return dwOffset;
}

/******************************************************************************
* �� �� ��: fixTaskVavle(void)
* ��������: ����������
* ��ڲ���: ��
* ʱ	��: 2016.06.29
* �� �� ��: maronglang
* ˵    ��: ���� ����״̬-D7�����ſ��ƶ����ɹ�������Ϊ1������Ϊ0�� D6D5D1D0����ʾ��ʼ����ǰ״̬00����01�أ�11�쳣��D4D3����ʾ���Ŷ�����״̬00����01�أ�11�쳣��
*******************************************************************************/
void fixTaskVavle(void)
{
	ST_Time  stTimeTmp;
	TM_Time  stStarTime,;

#ifdef VAVLE_METER
#ifdef XINJIANG_PTR
	if((0xFF != g_nOptValveTask)&&((VALVEOPEN == g_nOptValveTask)||(VALVECLOSE == g_nOptValveTask)))
	{
		/* �������Ǹ澯�����ط��� */
		VavleOperateFun(g_nOptValveTask);
		XJ_VavleErrorPro(g_nValveStat);
		g_nOptValveTask = 0xFF;
	}
#else
	if(CTL_VAVLE_ENABLE != stOptValve.nEnableFlg)
	{
		return ;
	}
	
	if(CTL_VALVE_OVER == stOptValve.nOptFlg)
	{
		return ;
	}
	
	STM8_RTC_Get(&stTimeNow);
	if((((0 != stOptValve.nVavleCycle)&&(stOptValve.nDay == stTimeNow.nDay)&&(stOptValve.nMonth == stTimeNow.nMonth))
		||((0 == stOptValve.nVavleCycle)&&((0x01 == stTimeNow.nDay)||(0x15 == stTimeNow.nDay))))	
		&&(stTimeNow.nHour >= stOptValve.nStartHour)&&(stTimeNow.nHour <= stOptValve.nEndHour))
	{
		if(0 == stOptValve.nOptFlg)
		{
			return ;
		}
		
		CJ_T188ProtocolGM();
		if((VALVE_CLOSE != g_nValveStat)&&(VALVE_OPEN != g_nValveStat))
		{
			stOptValve.nVavleStat = 0x78;
		}
		else
		{
			stOptValve.nVavleStat = g_nValveStat;
			stOptValve.nVavleStat|=(g_nValveStat<<5);
			if(VALVE_OPEN == g_nValveStat)
			{				
				if(TRUE == VavleOperateFun(VALVECLOSE))
				{
					if(TRUE == VavleOperateFun(VALVEOPEN))
					{
						stOptValve.nVavleStat |= 0x80;
					}
				}
				else
				{
					VavleOperateFun(VALVEOPEN);
				}
				stOptValve.nVavleStat |=(g_nValveStat<<3);
			}
			else
			{
				if(TRUE == VavleOperateFun(VALVEOPEN))
				{
					if(TRUE == VavleOperateFun(VALVECLOSE))
					{
						stOptValve.nVavleStat |= 0x80;
					}
				}
				else
				{
					VavleOperateFun(VALVECLOSE);
				}
				stOptValve.nVavleStat |=(g_nValveStat<<3);
			}
		}			
		g_OptValveRepFlg = TRUE;
		stOptValve.nRepFailCnt = 0;
		stOptValve.nOptFlg = CTL_VALVE_OVER;	
		stOptValve.nYear = stTimeNow.wYear;
		stOptValve.nMonth= stTimeNow.nMonth;
		stOptValve.nDay  = stTimeNow.nDay;
		stOptValve.nStartHour = stTimeNow.nHour;
		SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
	}
	else
	{
		if(CTL_VAVLE_ENABLE != stOptValve.nOptFlg)
		{
			stOptValve.nRepFailCnt = 0;
			stOptValve.nOptFlg = stOptValve.nEnableFlg;
#if  1
			if(0 != stOptValve.nVavleCycle)
			{
				stTimeTmp.wYear   = stOptValve.nYear;
				stTimeTmp.nMonth  = stOptValve.nMonth;
				stTimeTmp.nDay	  = stOptValve.nDay;
				stTimeTmp.nHour   = stOptValve.nStartHour;
				stTimeTmp.nMinute = 0;
				stTimeTmp.nSecond = 0;
				TM_TimeChangeAToB(&stTimeTmp, &stStarTime);
				TM_RTimeAddnDay(&stStarTime, stOptValve.nVavleCycle);
				TM_TimeChangeBToA(&stStarTime, &stTimeTmp);
				stOptValve.nYear = stTimeTmp.wYear;
				stOptValve.nMonth= stTimeTmp.nMonth;
				stOptValve.nDay  = stTimeTmp.nDay;
			}
#endif
			SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
		}
	}
#endif
#endif
	return ;
}
#ifndef  PIEZOMETER
/******************************************************************************
* �� �� ��: MonFreezeDatProc(void)
* ��������: �¶��ᴦ����
* ��ڲ���: ��
* ʱ	��: 2016��6��21��15:37:00
* �� �� ��: maronglang
* ˵    ��: �����ն������ݲ�ѯ�����¶�������
*******************************************************************************/
void MonFreezeDatProc(void)
{
	u8 i = 0, nMonFreeDay = 0;
	TypeRecordMon stMonFreeze;
	TypeRecordDay stDayRec;

	STM8_RTC_Get(&stTimeNow);
	nMonFreeDay = JX_BcdToByte(stTimeNow.nDay);
	if(nMonFreeDay < tyReport.nMonFreezeDay)
	{
		return ;
	}
	
	/* ����Ƿ��Ѿ����¶��� */
	if(TRUE == ReadMonFreezeRecord(0, (u8*)&stMonFreeze, sizeof(stMonFreeze)))
	{
		if((stMonFreeze.nYear == stTimeNow.wYear) && (stMonFreeze.nMon == stTimeNow.nMonth))
		{
			return ;
		}
	}
	
	MemsetFunc((u8*)&stMonFreeze, 0x00, sizeof(stMonFreeze));

	for(i = 0; i < NUMBER_RECORD_DAY; i++)
	{
		if(TRUE == ReadDayFreezeRecord(i, (u8*)&stDayRec, sizeof(stDayRec)))
		{
			if(stDayRec.Value == INVALID_DATA)
			{
				continue;
			}
			
			if((stDayRec.nYear == stTimeNow.wYear) && 	(stDayRec.nMon == stTimeNow.nMonth))
			{
				stMonFreeze.nYear = stDayRec.nYear;
				stMonFreeze.nMon = stDayRec.nMon;
				stMonFreeze.Value = stDayRec.Value;
				AddMonFreezeRecord((u8*)&stMonFreeze, RECORD_LEN_MON);
				UC_SleepFunc(60);
				return ;
			}
		}
		else
		{
			goto END_InvalidDatPro;
		}
		UC_SleepFunc(2);
	}

END_InvalidDatPro:
	stMonFreeze.nYear = stTimeNow.wYear;
	stMonFreeze.nMon = stTimeNow.nMonth;
	stMonFreeze.Value = INVALID_DATA;
	AddMonFreezeRecord((u8*)&stMonFreeze, RECORD_LEN_MON);
	UC_SleepFunc(60);
	return ;
}
/******************************************************************************
* �� �� ��: DayFreezeDatProc(void)
* ��������: �ն��ᴦ����
* ��ڲ���: ��
* ʱ	��: 2016��6��21��15:37:00
* �� �� ��: maronglang
* ˵    ��: ������ϸ���������ն�������
*******************************************************************************/
void DayFreezeDatProc(void)
{
	ST_Time stYesterDay;
	TM_Time stTmpTime;
	u8 i = 0;
	TypeRecordDay stDayFreeze;
	TypeRecord stNowRec;

	MemsetFunc((u8*)&stDayFreeze, 0x00, sizeof(stDayFreeze));	
	STM8_RTC_Get(&stTimeNow);
	TM_TimeChangeAToB(&stTimeNow, &stTmpTime);
	TM_RTimeDecnMinute(&stTmpTime, 1440);
	TM_TimeChangeBToA(&stTmpTime, &stYesterDay);

	/* ����Ƿ��Ѿ��������ն��� */
	if(TRUE == ReadDayFreezeRecord(0, (u8*)&stDayFreeze, sizeof(TypeRecordDay)))
	{
		if((stDayFreeze.nYear == stYesterDay.wYear) && 
			(stDayFreeze.nMon == stYesterDay.nMonth) && (stDayFreeze.nDay == stYesterDay.nDay))
		{
			return ;
		}
	}

	for(i = 0; i < NUMBER_RECORD; i++)
	{
		if(TRUE == ReadRecord(i, (u8*)&stNowRec, sizeof(stNowRec)))
		{
			if(stNowRec.Value == INVALID_DATA)
			{
				continue;
			}
			
			if((stNowRec.Time.Byte.Year == stYesterDay.wYear) && 
				(stNowRec.Time.Byte.Month == stYesterDay.nMonth) && (stNowRec.Time.Byte.Day == stYesterDay.nDay))
			{
				stDayFreeze.nYear = stNowRec.Time.Byte.Year;
				stDayFreeze.nMon = stNowRec.Time.Byte.Month;
				stDayFreeze.nDay = stNowRec.Time.Byte.Day;
				stDayFreeze.Value = stNowRec.Value;
				AddDayFreezeRecord((u8*)&stDayFreeze, RECORD_LEN_DAY);
				UC_SleepFunc(60);
				return ;
			}
		}
		else
		{
			goto END_InvalidDatPro;
		}
		UC_SleepFunc(2);
	}

END_InvalidDatPro:
	stDayFreeze.nYear = stYesterDay.wYear;
	stDayFreeze.nMon = stYesterDay.nMonth;
	stDayFreeze.nDay = stYesterDay.nDay;
	stDayFreeze.Value = INVALID_DATA;
	AddDayFreezeRecord((u8*)&stDayFreeze, RECORD_LEN_DAY);
	UC_SleepFunc(60);
	return ;
}
#endif
/******************************************************************************
* �� �� ��: GM_GetGatherMeterFlg(void)
* ��������: ��ȡ��ǰ����ɹ���־
* ��ڲ���: ��
* ʱ	��: 2015.12.28
* �� �� ��: maronglang
* ˵    ��: ��ȡ����ɹ���־���������ϴ�
*******************************************************************************/
u8 GM_GetGatherMeterFlg(void)
{
	return g_nGatherMeterFlg;
}

/******************************************************************************
* �� �� ��: fixTaskMeterTestCode(void)
* ��������: ���Բ��ִ���
* ��ڲ���: ��
* ʱ	��: 2016��8��23��20:37:00
* �� �� ��: maronglang
* ˵    ��: �������ڲ���
*******************************************************************************/
void fixTaskMeterTestCode(void)
{
#if 0			
	TM_Time stTime;
	STM8_RTC_Get(&stTimeNow);

	/* �¶������ */
	if((05 <= stTimeNow.nMinute)&&(0x18 >= stTimeNow.wYear)&&(0x23 != stTimeNow.nHour))
	{
		stTimeNow.nDay=0x19;
		TM_TimeChangeAToB(&stTimeNow, &stTime);
		stTime.nMonth++;
		if(13 <= stTime.nMonth)
		{
			stTime.nMonth = 1;
			stTime.wYear++;
		}
		TM_TimeChangeBToA(&stTime, &stTimeNow);
		stTimeNow.nHour   = 0x23;
		stTimeNow.nMinute = 0x50;
		STM8_RTC_Set(&stTimeNow);
	} 	/* �¶������ */
	else if((0x18 >= stTimeNow.wYear)&&(0x00 != stTimeNow.nHour))
	{
		stTimeNow.nDay=0x20;		
		stTimeNow.nHour   = 0x00;
		stTimeNow.nMinute = 0x50;
		STM8_RTC_Set(&stTimeNow);
	}
	else 	/* �ն������ */
	{
		if((05 <= stTimeNow.nMinute)&&(0x23 != stTimeNow.nHour))
		{
			TM_TimeChangeAToB(&stTimeNow, &stTime);
			TM_RTimeAddnDay(&stTime, 1);			
			TM_TimeChangeBToA(&stTime, &stTimeNow);
			stTimeNow.nHour   = 0x23;
			stTimeNow.nMinute = 0x50;
			STM8_RTC_Set(&stTimeNow);
		}
		else if((0x19 >= stTimeNow.wYear)&&(0x00 != stTimeNow.nHour))
		{
			TM_TimeChangeAToB(&stTimeNow, &stTime);
			TM_RTimeAddnDay(&stTime, 1);			
			TM_TimeChangeBToA(&stTime, &stTimeNow);
			stTimeNow.nHour   = 0x00;
			stTimeNow.nMinute = 0x50;
			STM8_RTC_Set(&stTimeNow);
		}
	}
#endif
/* �������� */
#if 0
	static u8 nOptRlt = 0, nTestVal = 0, nTimeOut = 0, nReadCnt = 0;
	TypeRecordDay stDayFreeze;
	TypeRecordMon stMonFreeze;
	u8 nBuf[13];

	STM8_RTC_Get(&stTimeNow);
	MemcpyFunc(&tyTime, &stTimeNow, sizeof(TypeTime));
	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
	MemcpyFunc((u8*)&tyRecord.Time, (TypeTime*)&tyTime, sizeof(TypeTime));
	tyRecord.Value = nReadCnt+10;		
	tyRecord.Time.Byte.Hour = JX_ByteToBcd(nReadCnt%24);
	tyRecord.Time.Byte.Minute = JX_ByteToBcd(nReadCnt%60);
	AddRecord((u8*)&tyRecord, sizeof(tyRecord));
	MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));	
	ReWriteRepFlg();		
	MemsetFunc(nBuf,0, 10);	
	SaveParameterForType(nBuf, 10, LT_REP_TIME);

	//if(TRUE == (g_nGatherMeterFlg = GatherMeterFun()))
	if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
	{
		nOptRlt++;
	}
	else
	{
		nTestVal++;
	}
	if(TRUE == ReadDayFreezeRecord(nReadCnt%NUMBER_RECORD_DAY, (u8*)&stDayFreeze, sizeof(stDayFreeze)))
		if(TRUE == ReadMonFreezeRecord(nReadCnt%NUMBER_RECORD_MON, (u8*)&stMonFreeze, sizeof(stMonFreeze)))
	
	UC_SleepFunc(1000);
	nReadCnt++;
	if(100 <= nReadCnt)
	{
		nTimeOut = nTestVal;
		nReadCnt = 0;
		nTestVal = 0;
	}
#endif

/* �½�Э����� */
#if  0
	static u8 nOptRlt = 0, nReadCnt = 0, nTestVal = 0, nFailCnt = 0, nDayFreeze = 0, nMonthFreeze = 0;
	TypeRecordDay stDayFreeze;
	TypeRecordMon stMonFreeze;

	if(NUMBER_RECORD > nOptRlt) // NUMBER_RECORD_DAY
	{
		nOptRlt++;
		nTestVal = nOptRlt;
		/* ����ɹ���رյ�Դ���������� */
		SetPortMeterPowerOff();
		STM8_RTC_Get(&stTimeNow);
		MemcpyFunc(&tyTime, &stTimeNow, sizeof(TypeTime));
		JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
		MemcpyFunc((u8*)&tyRecord.Time, (TypeTime*)&tyTime, sizeof(TypeTime));
		tyRecord.Value = nOptRlt+10;		
		tyRecord.Time.Byte.Hour = JX_ByteToBcd(nOptRlt%24);
		tyRecord.Time.Byte.Minute = JX_ByteToBcd(nOptRlt%60);
		AddRecord((u8*)&tyRecord, sizeof(tyRecord));
		MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));
		UC_SleepFunc(60);

		stDayFreeze.nYear = stTimeNow.wYear;
		stDayFreeze.nMon = stTimeNow.nMonth;
		stDayFreeze.nDay = JX_ByteToBcd(nOptRlt%30);		
		stDayFreeze.Value = nOptRlt+10;
		AddDayFreezeRecord((u8*)&stDayFreeze, sizeof(stDayFreeze));
		UC_SleepFunc(60);
		
		stMonFreeze.nYear = stTimeNow.wYear;
		stMonFreeze.nMon = JX_ByteToBcd(nOptRlt%12);
		stMonFreeze.Value = nOptRlt+10;
		AddMonFreezeRecord((u8*)&stMonFreeze, sizeof(stMonFreeze));	
		UC_SleepFunc(60);
	}		
	else /* ����ʧ������г�ʱͳ�� */
	{
		g_nGmFlg = FALSE;
		MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));
		if(TRUE == ReadRecord(nReadCnt, (u8*)&tyRecord, sizeof(tyRecord)))
		{
			if(tyRecord.Value == nTestVal+10)
			{
				nTestVal--;
			}
		}
		else
		{
		    nFailCnt++;
		}

		if(TRUE == ReadDayFreezeRecord(nReadCnt%NUMBER_RECORD_DAY, (u8*)&stDayFreeze, sizeof(stDayFreeze)))
		{
			nDayFreeze++;
		}
		else
		{
			nFailCnt++;
		}
	
		if(TRUE == ReadMonFreezeRecord(nReadCnt%NUMBER_RECORD_MON, (u8*)&stMonFreeze, sizeof(stMonFreeze)))
		{
			nMonthFreeze++;
		}		
		else
		{
			nFailCnt++;
		}
			
		nReadCnt++;
		if(NUMBER_RECORD <= nReadCnt)
		{
			nReadCnt = 0;
		}
	}
#endif

/* ����ӹط� */
#if 0
	if((VALVE_OPEN == GetVavleStat()) && (GUARD_KEY_UP == (GUARD_KEY_UP&ALM_GetBatStatus())))
	{
		/* �������Ǹ澯�����ط��� */
		VavleOperateFun(VALVECLOSE);
	}
#endif
	return ;
}

/******************************************************************************
* �� �� ��: fixTaskMeter(void)
* ��������: �������� ���г����EEPROM
* ��ڲ���: ��
* ʱ	��: 2015��8��04��15:37:00
* �� �� ��: maronglang
* ˵    ��: ������
*******************************************************************************/
void fixTaskMeter(void)
{
	/* �������� */
	/* �ն��� */
//	DayFreezeDatProc();

	/* �¶��� */
//	MonFreezeDatProc();
	
#ifdef  JASON130_PTR
	JASON_130TaskMeter();
#else
#ifndef SAVE_TEST
	/* �ϵ������Ҫ�ϱ��������ӳ�6����г��� */
	if((GetReportFlag())&&g_dwSysTick<6000)
	{
		return ;
	}
#endif
	/* ��ʱ���� */
	TimeGatherMeterProc();
#endif
#ifdef SAVE_TEST			
	fixTaskMeterTestCode();
#endif
	return ;
}

void InitializeMeter(void)
{
	MemsetFunc((u8*)&tyTime, 0x00, sizeof(tyTime));
	MemsetFunc((u8*)&tyRecord, 0xff, sizeof(tyRecord));
}



/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
