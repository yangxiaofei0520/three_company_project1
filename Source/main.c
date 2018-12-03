/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : main.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 主函数主流程
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
/* 主流程回调函数
函数名: SystemTask
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.10.31
*//*********************************************/
void SystemTask(void)
{
	static u32 dwGprsCnt = 0;
	
	/* 软件喂狗 */
	FeedSoftWareIwdg();

	/* 终端维护调试口 */
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

	/* 抄表模块EEPROM存储模块 */
	if(FALSE == CheckDebugInsertStat())
	{
		fixTaskMeter();
	}

	/* 阀控处理 特别注意此任务必须在低功耗管理之前 20170329 */
	if(FALSE == CheckDebugInsertStat())
	{
		fixTaskVavle();
	}

	/* 告警检测 特别注意此任务必须在低功耗管理之前 20170329 */
	if(FALSE == CheckDebugInsertStat())
	{
		ALM_TaskFunc();
	}

	/* 低功耗模块 */
	LP_LowPowerManage();

	/* LED灯闪烁 */
	fixTaskLed();
}


/**********************************************/
/* 初始化函数
函数名: Initialize
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.10.31
*//*********************************************/
void Initialize(void)
{
	/* BSP初始化 */
	InitializeBase();

	/* 抄表模块初始化 */
	InitializeMeter();

	/* GPRS模块 */
	InitializeGsm();

	/* 485参数设置处理调试口 */
	InitializeProtocol();

	/* EEPROM存储模块 */
	InitializeFile();
	
	///* RTC停走告警检测 */
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
/* 主函数函数入口
函数名: main
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.10.31
*//*********************************************/
void main(void)
{
	Initialize();			//初始化
	while (1)
	{
		SystemTask();		//主循环
	}	
}

/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/


