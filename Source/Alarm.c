/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : Alarm.c
* Author            : maronglang
* Date First Issued : 2015/12/23
* Description       : �澯��� ������ص�ѹ ������Ǧ��
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#include "global.h"
#include "Initialize.h"
#include "Alarm.h"
#include "GsmGlobal.h"
#include "Pwrctr.h"
#include "FileGlobal.h"
#include "STM8_Rtc.h"
//#include <stdio.h>
//#include "string.h"


/* Private defines   ----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private variables ----------------------------------------------------------*/
uint8_t  g_nAlmStat     = BATVOL_NORMAL;
uint16_t g_dwBatVol     = 0;
uint16_t g_dwBatNoLoadVol = 0;
uint16_t g_dwInnerVol   = 0;
uint8_t g_nGuardEnFlg   = FALSE;     //���𰴼�ʹ�ܱ�־
uint8_t g_nAlmRepFailCnt = 0;       //�ϱ�������ʱ

extern u8 g_nGmFlg;

/* Private functions ---------------------------------------------------------*/

#if 1
/**************************************************************/
/* ADC�����л�
������: ADC_OffToOnChange
��  ��: dwTime
��  ��: ��
����ֵ: void
�޸���: maronglang
��  ��: 2016.12.23
*//*************************************************************/
void ADC_OffToOnChange(void)
{
    ADC1->CR1 &= (uint8_t)~ADC_CR1_ADON;	
	/* Enable ADC1 */
    ADC1->CR1 |= ADC_CR1_ADON;
}

/**************************************************************/
/* ��ȡADC����ֵ
������: ADC_GetAdcVol
��  ��: dwTime
��  ��: ��
����ֵ: void
�޸���: maronglang
��  ��: 2015.12.25
*//*************************************************************/
u16 ADC_GetAdcVol(void)
{
	uint16_t tmpreg = 0;

	/* Start ADC1 Conversion using Software trigger*/
	ADC1->CR1 |= ADC_CR1_START; 	//ADC_SoftwareStartConv(ADC1);
	delay_us(10000);
	
	/* Wait until End-Of-Convertion */
	while ((ADC1->SR & ADC_FLAG_EOC) == (uint8_t)RESET) //(ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0)
	{;}
	
	/* Get conversion value */
	tmpreg = (uint16_t)(ADC1->DRH);
	tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADC1->DRL); //ADC_GetConversionValue(ADC1);
	ADC1->SR = (uint8_t)~ADC_FLAG_EOC;
	
	return tmpreg;
}
/**************************************************************/
/* ��ȡ���ع����ѹ����ֵ
������: ADC_GetVavleCtlVol
��  ��: dwTime
��  ��: ��
����ֵ: void
�޸���: maronglang
��  ��: 2016.12.21
*//*************************************************************/
u16 ADC_GetVavleCtlVol(void)
{
	uint16_t wRefAdc = 0, wIn2Adc = 0, wVin2 = 0;
	u32 dwTmp = 0;	

	//ADC_OffToOnChange();
	ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, DISABLE);
#ifdef IOT_DAT_DETECTOR
	ADC_ChannelCmd(ADC1, ADC_Channel_15, ENABLE);
#else
	ADC_ChannelCmd(ADC1, ADC_Channel_2, ENABLE);
#endif

	wIn2Adc = ADC_GetAdcVol();
	wIn2Adc = ADC_GetAdcVol();

	//ADC_OffToOnChange();	
#ifdef IOT_DAT_DETECTOR
	ADC_ChannelCmd(ADC1, ADC_Channel_15, DISABLE);
#else
	ADC_ChannelCmd(ADC1, ADC_Channel_2, DISABLE);
#endif
	ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
	wRefAdc = ADC_GetAdcVol();
	wRefAdc = ADC_GetAdcVol();
	dwTmp = 1220;
	dwTmp = dwTmp*wIn2Adc/wRefAdc;
	wVin2 = (u16)dwTmp;

	return wVin2;
}

/**************************************************************/
/* ���������Сֵ������ƽ��ֵ
������: ADC_ClaAvrVol
��  ��: ��
��  ��: ��
����ֵ: void
�޸���: maronglang
��  ��: 2016.01.18
*//*************************************************************/
u16 ADC_ClaAvrVol(u8 nLoadFLg)
{
	u32 dwTmp = 0;
	u16 wAdcVol = 0;
	u16 wAdcBuf[3] = {0}; //3
	u8 nLoop = 0;

	if(nLoadFLg)
	{
		SetPortBatGatEnable();
		UC_SleepFunc(1); 
#ifdef IOT_WATERMETER
		SetPortLoadOn();
#endif
		UC_SleepFunc(4); 
	}
	SetPortMeterPowerOff();
	SetPortGsmPowerOff();
	for(nLoop = 0; nLoop < 1; nLoop++) // 3
	{
#ifdef IOT_DAT_DETECTOR
		wAdcBuf[nLoop] = ADC_GetVavleCtlVol();
#else
		wAdcBuf[nLoop] = ADC_GetAdcVol();
#endif
	}
	if(nLoadFLg)
	{
#ifdef IOT_WATERMETER
		SetPortLoadOff();
#endif
		SetPortBatGatDisable(); 
	}

	/* ����ǰ��Ҫ�ϱ���ָ�GPRS���� */
	if(TRUE == GetReportFlag())
	{
		SetPortGsmPowerOn();
	}

	if(GetTmDebugModeStat())
	{
		SetPortMeterPowerOn();
	}
	
	//APP_InsertSort(wAdcBuf, 5);
	for(nLoop = 0; nLoop < 1; nLoop++)
	{
		dwTmp += wAdcBuf[nLoop];
	}
	wAdcVol = (u16)dwTmp;  // wAdcVol = dwTmp/2;

	return wAdcVol;	
}

#ifdef IOT_DAT_DETECTOR
/**************************************************************/
/* ��ȡ��ص�ѹ
������: ADC_GetAdcVol
��  ��: dwTime
��  ��: ��
����ֵ: void
�޸���: maronglang
��  ��: 2015.12.25
*//*************************************************************/
u16 BAT_GetBatVolExt(u8 nLoadFLg)
{
	u32 dwAdc = 0, dwTmp = 0;
	u16 wBatVol = 0;

	dwAdc = ADC_ClaAvrVol(nLoadFLg);
	dwTmp = dwAdc*6;
	
	if((5000 < dwTmp)&&(dwTmp<7500))
	{
		wBatVol = dwTmp;
	}
	else
	{
		wBatVol = 0;
	}

	return wBatVol;	
}
#else
/**************************************************************/
/* ��ȡ��ص�ѹ
������: ADC_GetAdcVol
��  ��: dwTime
��  ��: ��
����ֵ: void
�޸���: maronglang
��  ��: 2015.12.25
*//*************************************************************/
u16 BAT_GetBatVolExt(u8 nLoadFLg)
{
	u32 dwAdc = 0, dwTmp = 0;
	u16 wBatVol = 0;

	dwAdc = ADC_ClaAvrVol(nLoadFLg);
	dwTmp = 4096;
	dwTmp = dwTmp*1220;
	//dwTmp = dwTmp/dwAdc+300+60; //1.22 �ο���ѹ 0.060VΪOFFSET 0.300Ϊ�����ܽ�ѹ
	dwTmp = dwTmp/dwAdc+300; //1.22 �ο���ѹ 0.060VΪOFFSET 0.300Ϊ�����ܽ�ѹ
	
	if((2000 < dwTmp)&&(dwTmp<5000))
	{
		wBatVol = dwTmp;
	}
	else
	{
		wBatVol = 0;
	}

	return wBatVol;	
}
#endif

/**************************************************************/
/* ��ȡ��ص�ѹ
������: ADC_GetAdcVol
��  ��: dwTime
��  ��: ��
����ֵ: void
�޸���: maronglang
��  ��: 2015.12.25
*//*************************************************************/
u16 BAT_GetBatVol(void)
{
#ifndef IOT_DAT_DETECTOR
	g_dwBatNoLoadVol = BAT_GetBatVolExt(FALSE);
#endif
	return BAT_GetBatVolExt(TRUE);	
}

/**************************************************************/
/* ��ȡ��ص�ѹ
������: ADC_GetAdcVol
��  ��: ��
��  ��: ��
����ֵ: u8(0-������1-��ص�ѹ�ͣ�0xff-�޵��) 
�޸���: maronglang
��  ��: 2015.12.25
*//*************************************************************/
u8 BAT_ManageFunc(void)
{
	u16 wBatVol = 0;

	g_dwBatVol = BAT_GetBatVol();
	if(BATVOL_LOWLIMT >= g_dwBatVol)
	{
		/* ��ص�ѹ�����������ɸ澯���� */
		stRepFail.wError |= (1<<BT_POWERLOW);
		STM8_RTC_Get(&stTimeNow);
		MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stTimeNow, sizeof(stRepFail.stTime));
		stRepFail.nSigal = 0xFF;			//�źŴ�С,�̶�ֵ
		AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));	
		UC_SleepFunc(60);
		LP_ClrLowPwrStartFlg(LP_GPRS_FLG_OK);
#ifdef XINJIANG_PTR
		if(tyParameter.RestoreStat[1]&0x04)
		{
			tyParameter.Status[1]|=0x04;
			tyParameter.RestoreStat[1]&=(~0x04);
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
			UC_SleepFunc(60);
		}

		/* ��ص�ѹ���ڼ���˯�ߵ�ѹ���ֹGPRS�ϱ�����ֹѭ����λ���� 20170204 */
		if(BATVOL_SLEEP_LIMT >= g_dwBatVol)
		{
			LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
		}
#endif		
		return BATVOL_LOW; 
	}
	else if(BAT_NO_BAT_VOL >= g_dwBatVol)
	{
		return BATVOL_LOW; 
	}
	else if((BATVOL_HIGHLIMT > g_dwBatVol)&&(BATVOL_LOWLIMT < g_dwBatVol))
	{
#ifdef XINJIANG_PTR
		/* ���Ƿѹ�澯�ָ����� */
		if(0x04 != (tyParameter.RestoreStat[1]&0x04))
		{
			tyParameter.RestoreStat[1]|=0x04;
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
			UC_SleepFunc(60);
		}
#endif
		stRepFail.wError &= ~((u16)(1<<BT_POWERLOW));
		return BATVOL_NORMAL;
	}
	else
	{
		return BATVOL_NORMAL;
	}
}
#ifdef PIEZOMETER
/**************************************************************/
/* ѹ��Խ�޸澯����
������: ALM_PressureOverLimit
��  ��: ��
��  ��: ��
����ֵ: void
�޸���: maronglang
��  ��: 2017.5.22
*//*************************************************************/
void ALM_PressureOverLimit(void)
{
	static u8 nAlmPressChk = TRUE;

	if((FALSE == nAlmPressChk)||(0 == tyParameter.nAlmCtl[0]&0x01)||(0xFFFFFF00 <= tyRecord.wPressure))
	{
		return ;
	}
	/* Խ���� */
	if(tyParameter.wBasePress-(tyParameter.wBasePress*(u32)tyParameter.nDownLmtRate/100) >= tyRecord.wPressure)
	{
		ALM_SetAlmStatus(PRESS_DOWNLIMIT);
	}	
	else if(tyParameter.wBasePress <= tyRecord.wPressure-(tyParameter.wBasePress*(u32)tyParameter.nDownLmtRate/100))/* Խ���� */
	{
		ALM_SetAlmStatus(PRESS_UPLIMIT);
	}
	
	nAlmPressChk = FALSE;
	return ;
}
#endif

/**************************************************************/
/* �澯������
������: ALM_TaskFunc
��  ��: ��
��  ��: ��
����ֵ: �� 
�޸���: maronglang
��  ��: 2015.12.25
*//*************************************************************/
void ALM_TaskFunc(void)
{
	u8 nWakeUpFlg = 0;
	u8 nGuardKeyStat = 0;
	static u8 nBatAdcFlg = TRUE;

	//nWakeUpFlg = ReadReportFlag();
	//if(((0 == (GetTermReportTime())%10)||(GUARD_KEY_WP_FLG == nWakeUpFlg&GUARD_KEY_WP_FLG))
	//	&& (0 == g_dwBatVol))
	if(nBatAdcFlg)                      /* �޸�2017081401 */
	{
		g_nAlmStat |= BAT_ManageFunc();
		nBatAdcFlg = FALSE;
	}
	
#ifdef IOT_WATERMETER_NEW
	nGuardKeyStat = GPIO_ReadInputDataBit(CHK_GUARD_PORT, CHK_GUARD_PIN);
#ifdef XINJIANG_PTR
	if(FALSE == nGuardKeyStat)
	{
		if(tyParameter.RestoreStat[1]&0x02)
		{
			g_nAlmStat |= GUARD_KEY_UP; 
			tyParameter.Status[1] |= (0x01<<1); 
			tyParameter.RestoreStat[1]&=(~0x02);
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
			UC_SleepFunc(60);
		}	
	}
	else
	{
 		g_nAlmStat &= (~GUARD_KEY_UP);
		tyParameter.Status[1] &= (~(0x01<<1));	
		
		/* ����澯�ָ����� */
		if(0x02 != (tyParameter.RestoreStat[1]&0x02))
		{
			tyParameter.RestoreStat[1]|=0x02;
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
			UC_SleepFunc(60);
		}
	}
#else
#ifndef PIEZOMETER
	if((GUARD_KEY_EN_FLG == (g_nGuardEnFlg&GUARD_KEY_EN_FLG)) && (FALSE == nGuardKeyStat))
	{
		g_nAlmStat |= GUARD_KEY_UP; 
	}
	else
	{
 		g_nAlmStat &= (~GUARD_KEY_UP);
	}
#endif
#endif
#endif

#ifdef  PIEZOMETER
		ALM_PressureOverLimit();
#endif

	/* �澯�ָ�������ϱ�ʧ���ۻ����� */
	if((NO_ALARM == (g_nAlmStat & ALARM_MASK))&&(FALSE == g_nGmFlg))
	{
		g_nAlmRepFailCnt = 0;
		g_nGuardEnFlg &= ((~ALARM_REP_FLG)&0x3F);
		SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
	}
}

/**************************************************************/
/* ��ȡ��ص�ѹ״̬
������: ALM_GetBatStatus
��  ��: ��
��  ��: ��
����ֵ: �� 
�޸���: maronglang
��  ��: 2015.12.25
*//*************************************************************/
u8 ALM_GetBatStatus(void)
{
	return g_nAlmStat;
}

/**************************************************************/
/* ���ø澯״̬
������: ALM_SetAlmStatus
��  ��: ��
��  ��: ��
����ֵ: �� 
�޸���: maronglang
��  ��: 2016.08.20
*//*************************************************************/
u8 ALM_SetAlmStatus(u8 nNewAlmStat)
{
	LP_ClrLowPwrStartFlg(LP_GPRS_FLG_OK);
	g_nAlmStat|= nNewAlmStat;
#ifdef XINJIANG_PTR
	if(0xC0 == (tyParameter.RestoreStat[2]&0xC0))
	{
		tyParameter.Status[2] |= 0xC0; 
		tyParameter.RestoreStat[2]&=(~0xE0);
		SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
		UC_SleepFunc(60);		
	}
#endif
}

/**************************************************************/
/* ����澯״̬
������: ALM_ClrAlmStatus
��  ��: ��
��  ��: ��
����ֵ: �� 
�޸���: maronglang
��  ��: 2016.08.20
*//*************************************************************/
u8 ALM_ClrAlmStatus(u8 nNewAlmStat)
{
	g_nAlmStat &= (~nNewAlmStat);	
#ifdef XINJIANG_PTR	
	tyParameter.Status[2] &= (~0xE0); 
	/* ����澯�ָ����� */
	if(0xC0 != (tyParameter.RestoreStat[2]&0xC0))
	{
		tyParameter.RestoreStat[2]|=0xC0;
		SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
		UC_SleepFunc(60);
	}	
#endif
}

#endif

