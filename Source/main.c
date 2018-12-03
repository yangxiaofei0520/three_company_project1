/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : main.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ������������
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/
#include "Initialize.h"
#include "DriverUart.h"
#include "JX_Math.h"
#include "Meter.h"
#include "GsmGlobal.h"
#include "ProtocolGlobal.h"
#include "FileGlobal.h"
#include "Pwrctr.h"
#include "Alarm.h"
#include "Initialize.h"
#include "DriverUart.h"
#include "STM8_Rtc.h"
#include "STM8_Rtc.h"
#include "GsmGlobal.h"
#include "global.h"
#include "Pwrctr.h"

#define CALL_10MS       10
#define CALL_100MS      100
#define CALL_200MS      200
#define CALL_1000MS     1000

#ifdef TEST_VISON
#define IWDG_RET        ADDRESS_REPORTFLG+1022
#define WWDGF_RET       ADDRESS_REPORTFLG+1021
#define ILLOPF_RET      ADDRESS_REPORTFLG+1020
#define SWIMF_RET       ADDRESS_REPORTFLG+1019
#define EMCF_RET        ADDRESS_REPORTFLG+1018
#define OTHER_RET       ADDRESS_REPORTFLG+1017

u8 g_nIwdg = 0;
u8 g_nWwdgf = 0;
u8 g_nIilopf = 0;
u8 g_nSwimf = 0;
u8 g_nEmcf = 0;
u8 g_nOthe = 0;
u8 g_nOhterRes = 0;

#endif

/**********************************************/
/* �����̻ص�����
������: SystemTask
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.10.31
*//*********************************************/
void SystemTask(void)
{
	static u32 dwGprsCnt = 0;
	
	/* ���ι�� */
	FeedSoftWareIwdg();

	/* �ն�ά�����Կ� */
	if(TRUE == CheckDebugInsertStat())
	{
		fixTaskProtocolDebug();
	}

	/* GPRS */
	if((FALSE == CheckDebugInsertStat())&&(CALL_10MS < GetSysTemTick() - dwGprsCnt))
	{
		dwGprsCnt = GetSysTemTick();
		fixTaskGsm();
	}

	/* ����ģ��EEPROM�洢ģ�� */
	if(FALSE == CheckDebugInsertStat())
	{
		fixTaskMeter();
	}

	/* ���ش��� �ر�ע�����������ڵ͹��Ĺ���֮ǰ 20170329 */
	if(FALSE == CheckDebugInsertStat())
	{
		fixTaskVavle();
	}

	/* �澯��� �ر�ע�����������ڵ͹��Ĺ���֮ǰ 20170329 */
	if(FALSE == CheckDebugInsertStat())
	{
		ALM_TaskFunc();
	}

	/* �͹���ģ�� */
	LP_LowPowerManage();

	/* LED����˸ */
	fixTaskLed();
}


/**********************************************/
/* ��ʼ������
������: Initialize
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.10.31
*//*********************************************/
void Initialize(void)
{
	/* BSP��ʼ�� */
	InitializeBase();

	/* ����ģ���ʼ�� */
	InitializeMeter();

	/* GPRSģ�� */
	InitializeGsm();

	/* 485�������ô�����Կ� */
	InitializeProtocol();

	/* EEPROM�洢ģ�� */
	InitializeFile();
	
	///* RTCͣ�߸澯��� */
	//STM8_RTC_ClkSwitchProc();
	
	//ClrSysTemTick();
#ifdef TEST_VISON
	ReadGroup(1, IWDG_RET, &g_nIwdg);
	ReadGroup(1, WWDGF_RET, &g_nWwdgf);
	ReadGroup(1, ILLOPF_RET, &g_nIilopf);
	ReadGroup(1, SWIMF_RET, &g_nSwimf);
	ReadGroup(1, EMCF_RET, &g_nEmcf);
	ReadGroup(1, OTHER_RET, &g_nOthe);

	if(RST_FLAG_IWDGF == (uint8_t)(RST->SR & RST_FLAG_IWDGF))
	{
		g_nIwdg++;
		SaveByte(IWDG_RET, g_nIwdg);
		RST->SR = 0x3F;

	}
	else if(RST_FLAG_WWDGF == (uint8_t)(RST->SR & RST_FLAG_WWDGF))
	{
		g_nWwdgf++;
		SaveByte(WWDGF_RET, g_nWwdgf);

	}
	else if(RST_FLAG_ILLOPF == (uint8_t)(RST->SR & RST_FLAG_ILLOPF))
	{
		g_nIilopf++;
		SaveByte(ILLOPF_RET, g_nIilopf);

	}
	else if(RST_FLAG_SWIMF == (uint8_t)(RST->SR & RST_FLAG_SWIMF))
	{
		g_nSwimf++;
		SaveByte(SWIMF_RET, g_nSwimf);

	}
	else if(RST_FLAG_PORF == (uint8_t)(RST->SR & RST_FLAG_PORF))
	{
		g_nEmcf++;
		SaveByte(EMCF_RET, g_nEmcf);

	}
	else if(RST_FLAG_BORF == (uint8_t)(RST->SR & RST_FLAG_BORF))
	{
		g_nOthe++;
		SaveByte(OTHER_RET, g_nOthe);

	}
	g_nOhterRes = g_nOthe+g_nEmcf+g_nIilopf;
	RST->SR = 0x3F;
#endif

	return ;
}

/**********************************************/
/* �������������
������: main
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.10.31
*//*********************************************/
void main(void)
{
	Initialize();			//��ʼ��
	while (1)
	{
		SystemTask();		//��ѭ��
	}	
}

/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/


