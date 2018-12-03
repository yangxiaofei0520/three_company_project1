/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : Pwrctr.c
* Author            : maronglang
* Date First Issued : 2015/12/23
* Description       : 低功耗处理接口函数
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#include "global.h"
#include "Initialize.h"
#include "FileGlobal.h"
#include "STM8_Rtc.h"
//#include "string.h"
#include "GsmGlobal.h"
#include "Pwrctr.h"
#include "DriverUart.h"
#include "XinJiangProtocol.h"
#include "Meter.h"
#include "Alarm.h"


/* Private defines   ----------------------------------------------------------*/
#define WINDOW_VALUE        97
#define COUNTER_INIT       104
#define BIT_MASK          ((uint8_t)0x7F)

/* 按键唤醒标志 */
static uint8_t m_nKeyWuFlg = 0;
static uint8_t m_nPowrDown = 0; //D0-抄表模块 D1-GPRS模块
static uint8_t m_nWakeUpCnt = 0;
uint8_t m_nDebugFlg = FALSE;

TM_Time m_stStartTime;
ST_Time g_stPowrOnTime;
ST_Time g_stNextRepTime;        //下次上报时间
ST_Time g_stNextGmTime;        //下次抄表时间

uint32_t LP_XJ_CalReportConut(void);
uint32_t LP_130_CalReportConut(void);

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
#if 1
/**
  * @brief  Enables or Disables the RTC Wakeup Unit.
  * @param  NewState: new state of the Wakeup Unit. This parameter can 
  *                   be: ENABLE or DISABLE.
  * @retval An ErrorStatus enumeration value:
  *          - SUCCESS : RTC Wakeup Unit is enabled/disabled
  *          - ERROR    : RTC Wakeup Unit is not enabled/disabled
  */
ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
{
  ErrorStatus status = ERROR;
  uint16_t wutwfcount = 0;

  /* Check the parameters */
  assert_param(IS_FUNCTIONAL_STATE(NewState));

  /* Disable the write protection for RTC registers */
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;

  if (NewState != DISABLE)
  {
    /* Enable the Wakeup Timer */
    RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;

    status = SUCCESS;
  }
  else
  {
    /* Disable the Wakeup Timer */
    RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;

    /* Wait until WUTWF flag is set */
    while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
    {
      wutwfcount++;
    }

    /* Check WUTWF flag is set or not */
    if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
    {
      status = ERROR;
    }
    else
    {
      status = SUCCESS;
    }
  }

  /* Enable the write protection for RTC registers */
  RTC->WPR = 0xFF; 

  /* Return the status*/
  return (ErrorStatus)status;
}

#endif



#if 1
/**************************************************************/
/* 所有事件查询
函数名: LP_DelayMs
入  参: dwTime
出  参: 无
返回值: void
修改人: maronglang
日  期: 2015.01.17
*//*************************************************************/
void LP_DelayMs(uint32_t dwTime)
{
	int32_t dwCnt = 16000;
		
	while(dwTime--)
	{
		dwCnt = 16000;
		while(0 < dwCnt)
		{
			dwCnt--;
		}
		IWDG->KR = IWDG_KEY_REFRESH;
	}
}

/**************************************************************/
/* 设置按键唤醒标志
函数名: LP_SetKeyWuFlg
入  参: nFlg
出  参: 无
返回值: void
修改人: maronglang
日  期: 2015.01.19
*//*************************************************************/
void LP_SetKeyWuFlg(uint8_t nFlg)
{
  m_nKeyWuFlg = nFlg;
}

/**************************************************************/
/* 获取唤醒标志
函数名: LP_GetKeyWuFlg
入  参: nFlg
出  参: 无
返回值: void
修改人: maronglang
日  期: 2015.12.28
*//*************************************************************/
uint8_t LP_GetKeyWuFlg(void)
{
  return m_nKeyWuFlg;
}

/**************************************************************/
/* 低功耗接口
函数名: LP_LowPowerManage
入  参: 无
出  参: 无
返回值: int8_t
修改人: maronglang
日  期: 2015.01.19
*//*************************************************************/
void LP_GPIO_DefaultConfig(void)
{
	LP_DelayMs(10);
	
	/* 暂时不用IO处理 */
	GPIOA->DDR = 0xFF;
	GPIOB->DDR = 0xFF;
	GPIOC->DDR = 0xFF;
	GPIOD->DDR = 0xFF;

	GPIOA->ODR = 0;
	GPIOB->ODR = 0;
	GPIOC->ODR = 0;
	GPIOD->ODR = 0;
	
#ifdef IOT_WATERMETER_NEW
  	GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_In_FL_IT);// 上拉 输入，外部接入上拉电阻
#else
#ifdef IOT_DAT_DETECTOR
  	GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_In_FL_IT);// 上拉 输入，内部接入上拉电阻  GPIO_Mode_In_PU_IT
#else
	GPIO_Init(GPIOB, GPIO_Pin_2, GPIO_Mode_In_PU_IT);// 上拉 输入，内部接入上拉电阻
#endif
#endif
}

/**************************************************************/
/* 低功耗唤醒脚初始化
函数名: LP_LowPowerManage
入  参: 无
出  参: 无
返回值: int8_t
修改人: maronglang
日  期: 2015.01.19
*//*************************************************************/
void LP_EXTI_Configuration(void)
{	
	/* 配置外中断用于干簧管唤醒 */
	EXTI_SelectPort(WAKE_UP_PORT_EXTI);
	EXTI_SetPinSensitivity(WAKE_UP_PORT_PIN, EXTI_Trigger_Falling);
	EXTI_ClearITPendingBit(WAKE_UP_EXTIT_PIN);
}

/**************************************************************/
/*终端复位
函数名: LP_TermReset
入  参: 无
出  参: 无
返回值: void
修改人: maronglang
日  期: 2014.01.20
*//*************************************************************/
void LP_TermReset(void)
{
	WWDG->WR = WWDG_WR_RESET_VALUE;
	WWDG->CR = (uint8_t)(WWDG_CR_WDGA | COUNTER_INIT);
	WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WINDOW_VALUE);
	while (1);
}

/**************************************************************/
/* TIMER恢复默认状态
函数名: LP_TimeDeInit
入  参: 无
出  参: 无
返回值: int8_t
修改人: maronglang
日  期: 2016.01.04
*//*************************************************************/
int32_t LP_TimeDeInit(void)
{
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
	
	TIM1->CR1  = TIM1_CR1_RESET_VALUE;
	TIM1->CR2  = TIM1_CR2_RESET_VALUE;
	TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
	TIM1->ETR  = TIM1_ETR_RESET_VALUE;
	TIM1->IER  = TIM1_IER_RESET_VALUE;

	/* Disable channels */
	TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
	TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
	/* Configure channels as inputs: it is necessary if lock level is equal to 2 or 3 */
	TIM1->CCMR1 = 0x01;
	TIM1->CCMR2 = 0x01;
	TIM1->CCMR3 = 0x01;
	TIM1->CCMR4 = 0x01;
	/* Then reset channel registers: it also works if lock level is equal to 2 or 3 */
	TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
	TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
	TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
	TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
	TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
	TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
	TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
	TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
	TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
	TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
	TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
	TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
	TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
	TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
	TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
	TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
	TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
	TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
	TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
	TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
	TIM1->OISR  = TIM1_OISR_RESET_VALUE;
	TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
	TIM1->DTR   = TIM1_DTR_RESET_VALUE;
	TIM1->BKR   = TIM1_BKR_RESET_VALUE;
	TIM1->RCR   = TIM1_RCR_RESET_VALUE;
	TIM1->SR1   = TIM1_SR1_RESET_VALUE;
	TIM1->SR2   = TIM1_SR2_RESET_VALUE;	

	TIM4->CR1	= TIM4_CR1_RESET_VALUE;
	TIM4->CR2	= TIM4_CR2_RESET_VALUE;
	TIM4->SMCR	 = TIM4_SMCR_RESET_VALUE;
	TIM4->IER	= TIM4_IER_RESET_VALUE;
	TIM4->CNTR	 = TIM4_CNTR_RESET_VALUE;
	TIM4->PSCR	= TIM4_PSCR_RESET_VALUE;
	TIM4->ARR	= TIM4_ARR_RESET_VALUE;
	TIM4->SR1	= TIM4_SR1_RESET_VALUE;
	
	return (SUCCESS);
}

/**************************************************************/
/* ADC恢复默认状态
函数名: LP_LowPowerManage
入  参: 无
出  参: 无
返回值: int8_t
修改人: maronglang
日  期: 2015.01.19
*//*************************************************************/
int32_t  LP_UART_DeInit(void)
{
	TurnBusUartOff();
	(void) USART1->SR;
	(void) USART1->DR;
	
	USART1->BRR2 = USART_BRR2_RESET_VALUE;	/* Set USART_BRR2 to reset value 0x00 */
	USART1->BRR1 = USART_BRR1_RESET_VALUE;	/* Set USART_BRR1 to reset value 0x00 */
	
	USART1->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
	USART1->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
	USART1->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
	USART1->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
	
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);

	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
	return (SUCCESS);
}

/**************************************************************/
/* ADC恢复默认状态
函数名: LP_LowPowerManage
入  参: 无
出  参: 无
返回值: int8_t
修改人: maronglang
日  期: 2015.01.19
*//*************************************************************/
int32_t  LP_ADC_DeInit(void)
{
  	/* Enable ADC1 */
  	//ADC_Cmd(ADC1, DISABLE);
    ADC1->CR1 &= (uint8_t)~ADC_CR1_ADON;

	//ADC_DeInit(ADC1);
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);

	return (SUCCESS);
}

/**************************************************************/
/* 低功耗接口
函数名: LP_LowPowerManage
入  参: 无
出  参: 无
返回值: int8_t
修改人: maronglang
日  期: 2015.01.19
*//*************************************************************/
void  LP_BSP_DeInit(void)
{	
	/* 关闭ADC */
	LP_ADC_DeInit();

	/* 关闭USART */
	LP_UART_DeInit(); 

	/* 关闭T1 T4 */
	LP_TimeDeInit();
		
	/* 复位GPIO */
	LP_GPIO_DefaultConfig();
}

/**************************************************************/
/* 计算上报间隔及抄表间隔时间是否到达
函数名: LP_CalReportGatherTime
入  参: 无
出  参: 无
返回值: uint8_t
修改人: maronglang
日  期: 2016.01.14
*//*************************************************************/
uint8_t LP_CalReportGatherTime(void)
{
	uint16_t wCount = 0, wTmp = 0;
	int32_t  dwWorkTime = 0;
	ST_Time  stTimeNow;
	TM_Time  stRepTimeEnd, stStarTime,;

	/* 获取当前时间 */	
	STM8_RTC_Get(&stTimeNow);	
	TM_TimeChangeAToB(&stTimeNow, &stRepTimeEnd);
	
	TM_TimeChangeAToB(&g_stPowrOnTime, &stStarTime);
	dwWorkTime = TM_DiffSecond(&stStarTime, &stRepTimeEnd);
	MemcpyFunc((u8*)&g_stPowrOnTime, (u8*)&stTimeNow, sizeof(g_stPowrOnTime));;
	
	if(dwWorkTime < LP_KEYWU_TO)
	{
		return TRUE;
	}

	return FALSE;
}

/**************************************************************/
/* RTC唤醒配置
函数名: LP_RTC_Config
入  参: 无
出  参: 无
返回值: void
修改人: maronglang
日  期: 2015.01.21
*//*************************************************************/
void LP_RTC_Config(void)
{ 
	/* Configures the RTC wakeup timer_step = RTCCLK/16 = LSI/16 = 500 us */
	//RTC_WakeUpClockConfig(RTC_WakeUpClock_RTCCLK_Div16);
	/* Disable the write protection for RTC registers */
	RTC->WPR = 0xCA;
	RTC->WPR = 0x53;	
	/* Disable the Wakeup timer in RTC_CR2 register */
	RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;	
	/* Clear the Wakeup Timer clock source bits in CR1 register */
	RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;	
	/* Configure the clock source */
	RTC->CR1 |= (uint8_t)RTC_WakeUpClock_RTCCLK_Div16;	
	/* Enable the write protection for RTC registers */
	RTC->WPR = 0xFF;

	RTC_WaitForSynchro();

	/* 设置RTC时钟16分频后作为唤醒定时器时钟 */
	//RTC_SetWakeUpCounter(1889);// 63850-30s 1889-1s 2015-1s
	/* Disable the write protection for RTC registers */
	RTC->WPR = 0xCA;
	RTC->WPR = 0x53;	
	/* Configure the Wakeup Timer counter */
	RTC->WUTRH = (uint8_t)(2047 >> 8);
	RTC->WUTRL = (uint8_t)(2047);	
	/* Enable the write protection for RTC registers */
	RTC->WPR = 0xFF;
	
	RTC_WakeUpCmd(DISABLE);

	/* 使能唤醒中断 */
	//RTC_ITConfig(RTC_IT_WUT, ENABLE);
	/* Disable the write protection for RTC registers */
	RTC->WPR = 0xCA;
	RTC->WPR = 0x53;	
	/* Enable the Interrupts */
	RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT_WUT & (uint16_t)0x00F0);
	RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT_WUT & RTC_TCR1_TAMPIE);

	//RTC_ClearITPendingBit(RTC_IT_WUT);
	RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT_WUT >> 4);
}

/**************************************************************/
/* 低功耗启动标志设置
函数名: LP_SetLowPwrStartFlg
入  参: 无
出  参: 无
返回值: void
修改人: maronglang
日  期: 2015.12.26
*//*************************************************************/
void LP_SetLowPwrStartFlg(u8 nFlg)
{ 
	m_nPowrDown |= (1<<nFlg);
}

/**************************************************************/
/* 低功耗启动标志清除
函数名: LP_ClrLowPwrStartFlg
入  参: 无
出  参: 无
返回值: void
修改人: maronglang
日  期: 2015.12.26
*//*************************************************************/
void LP_ClrLowPwrStartFlg(u8 nFlg)
{ 
	m_nPowrDown &= (~(1<<nFlg));
}

/**************************************************************/
/* 防止外终端误触发检测
函数名: LP_ExitWakeUpProc
入  参: 无
出  参: 无
返回值: u8
修改人: maronglang
日  期: 2015.12.26
*//*************************************************************/
void LP_ExitWakeUpProc(void)
{ 
	int32_t  dwWorkTime = 0;
	TM_Time  stRepTimeEnd, stStarTime,;

	/* 获取当前时间 */	
	STM8_RTC_Get(&stTimeNow);		
	TM_TimeChangeAToB(&stTimeNow, &stRepTimeEnd);	
	TM_TimeChangeAToB(&g_stPowrOnTime, &stStarTime);
	dwWorkTime = TM_DiffSecond(&stStarTime, &stRepTimeEnd);
	MemcpyFunc((u8*)&g_stPowrOnTime, (u8*)&stTimeNow, sizeof(g_stPowrOnTime));

	if((0 == (m_nWakeUpCnt))||(LP_KEYWU_TO <= dwWorkTime))
	{
		m_nWakeUpCnt = 1;
		MemcpyFunc((u8*)&m_stStartTime, (u8*)&stRepTimeEnd, sizeof(m_stStartTime));
		return ;
	}
	
	if(dwWorkTime < LP_KEYWU_TO)
	{
		m_nWakeUpCnt++;
	}
	
	return ;	
}

/**************************************************************/
/* 计算是否达到上报时间
函数名: LP_ClaReportTime
入  参: 无
出  参: 无
返回值: u8
修改人: maronglang
日  期: 2016.01.30
*//*************************************************************/
u8 LP_ClaReportTime(void)
{ 
	ST_Time  stTime;

	/* 获取当前时间 */	
	STM8_RTC_Get(&stTime);
	
	/* 上报时间到 */
	if((g_stNextRepTime.nDay == stTime.nDay)&&(g_stNextRepTime.nHour == stTime.nHour)
		&&(g_stNextRepTime.nMinute == stTime.nMinute))
	{
		return TRUE;
	}
	
	/* 抄表时间到 */
	if((g_stNextGmTime.nDay == stTime.nDay)
		&&(g_stNextGmTime.nHour == stTime.nHour)&&(g_stNextGmTime.nMinute == stTime.nMinute))
	{
		return TRUE;
	}

#ifdef VAVLE_METER	
	/* 定时阀控 */
	if((CTL_VAVLE_ENABLE == stOptValve.nOptFlg)
		&&(((0 != stOptValve.nVavleCycle)&&(stOptValve.nDay == stTime.nDay)&&(stOptValve.nMonth == stTime.nMonth))
		||((0 == stOptValve.nVavleCycle)&&((0x01 == stTime.nDay)||(0x15 == stTime.nDay))))
		&&(stOptValve.nStartHour <= stTime.nHour)&&(stOptValve.nEndHour >= stTime.nHour))
	{
		return TRUE;
	}
#endif
	return FALSE;	
}

/**************************************************************/
/*  唤醒终端
函数名: LP_WakeUpTerm
入  参: 无
出  参: 无
返回值: void
修改人: maronglang
日  期: 2017.02.06
*//*************************************************************/
void LP_WakeUpTerm(void)
{
	u8 nRepFlg = 0;

	InitializeBase();
	InitializeFile();
	nRepFlg = ReadReportFlag();
	SaveReportFlag((nRepFlg|KEY_WUAKEUP_FLG));		
	SetIO_LEDOn();
	LP_DelayMs(100);	
	LP_TermReset();
	return ;
}

/**************************************************************/
/* 检测防拆除按键
函数名: LP_CheckGuardKeyStat
入  参: 无
出  参: 无
返回值: u8
修改人: maronglang
日  期: 2016.05.10
*//*************************************************************/
u8 LP_CheckGuardKeyStat(void)
{ 	
#ifdef IOT_WATERMETER_NEW
	static u8 nCnt = 0;

	if((GUARD_KEY_EN_FLG != (g_nGuardEnFlg&GUARD_KEY_EN_FLG))
		||(ALARM_REP_FLG == (g_nGuardEnFlg&ALARM_REP_FLG))
		||(0xC0 == (g_nGuardEnFlg&0xC0)))
	{
		return FALSE;		
	}
	
	GPIO_Init(GUARD_PORT, GUARD_PIN, GPIO_Mode_Out_PP_High_Slow);
	GPIO_Init(CHK_GUARD_PORT, CHK_GUARD_PIN, GPIO_Mode_In_FL_No_IT);
	if(FALSE == GPIO_ReadInputDataBit(CHK_GUARD_PORT, CHK_GUARD_PIN)) //==
	{
		if(2 <= nCnt++)
		{
			SetGuardPinOff();
			return TRUE;
		}
	}
	SetGuardPinOff();
#endif
	return FALSE;		
}

/**************************************************************/
/* 低功耗接口
函数名: LP_LowPowerManage
入  参: 无
出  参: 无
返回值: int8_t
修改人: maronglang
日  期: 2015.01.19
*//*************************************************************/
void LP_LowPowerManage(void)
{
	uint32_t dwCount = 0, dwCntTimeOut = LP_WAKEUP_TO;
	int32_t  dwTickOffset = 0;
	u8 nRepFlg = 0;	
	TM_Time  stTimeEnd;

	/* 不满足低功耗条件则直接退出 */
	if(LP_START_FLG_OK != m_nPowrDown)
	{
		return ;
	}
	
	/* 获取唤醒超时 */
#ifdef XINJIANG_PTR
	dwCntTimeOut = LP_XJ_CalReportConut();
#else ifdef JASON130_PTR
	dwCntTimeOut = LP_130_CalReportConut();
#endif

	LP_DelayMs(10);
	
	/* 喂狗 */
	IWDG->KR = IWDG_KEY_REFRESH;

	LP_BSP_DeInit();

	/* EXTI 终端唤醒配置 */
	LP_EXTI_Configuration();

	/* RTC 唤醒配置 */
	LP_RTC_Config(); //edit by maronglang 20150609

	while (1)
	{
		/* 喂狗 */
		IWDG->KR = IWDG_KEY_REFRESH;
		
		/* 使能唤醒计数器 */
		RTC_WakeUpCmd(ENABLE); 	//edit by maronglang

		/* 使能低功耗 */
		PWR->CSR2 = 0x2;

		/* 进入停机模式 */
		halt();
		nop();
		nop();
		nop();
		nop();
		nop();

		RTC_WakeUpCmd(DISABLE); 		
		
		if(WU_MODE_KEY == m_nKeyWuFlg)
		{
			LP_ExitWakeUpProc();
		}
#ifdef IOT_WATERMETER_NEW
#ifndef XINJIANG_PTR
		else if(LP_CheckGuardKeyStat())
		{
			LP_TermReset();
			return ;
		}
#endif		
#endif
		else
		{
#if 1
			dwCount++;

			/* 定时唤醒 */
			if((dwCount >= dwCntTimeOut)||(LP_ClaReportTime()))
			{
				LP_TermReset();
				return ;
			}	
#endif
		}

		if(3 <= m_nWakeUpCnt)
		{
#ifdef     IOT_DAT_DETECTOR
			LP_WakeUpTerm();
			return ;
#endif
#ifdef     IOT_WATERMETER
			LP_WakeUpTerm();
			return ;
#endif
			STM8_RTC_Get(&stTimeNow);		
			TM_TimeChangeAToB(&stTimeNow, &stTimeEnd);
			dwTickOffset = TM_DiffSecond(&m_stStartTime, &stTimeEnd);	
			if((LP_KEYWU_PRO_TO+1 >= dwTickOffset)&&(LP_KEYWU_PRO_TO <= dwTickOffset))
			{
				if(3 == m_nWakeUpCnt)
				{
					LP_WakeUpTerm();
					return ;
				}
				else
				{
					m_nWakeUpCnt = 0;
				}
			}
		}			
	}
}


#endif

#ifdef XINJIANG_PTR
/**************************************************************/
/* 新疆协议调试上报数据
函数名: LP_XJ_DebugReport
入  参: 无
出  参: 无
返回值: uint16_t
修改人: maronglang
日  期: 2016.06.23
*//*************************************************************/
u8  LP_XJ_GetDebugReportFlg(void)
{
	return m_nDebugFlg;
}

/**************************************************************/
/* 新疆计算定时唤醒间隔
函数名: LP_XJ_CalReportConut
入  参: 无
出  参: 无
返回值: uint16_t
修改人: maronglang
日  期: 2016.06.23
*//*************************************************************/
void LP_XJ_ReportTimeCla(u8 nTime, TM_Time* pstTmpTime)
{
	u16   wTmpVal  = 0;

	if(XJ_INTERVAL_HOUR == tyReport.nIntervalType)
	{
		wTmpVal = (u16)5*(nTime);
	}
	else
	{
		wTmpVal = (u16)180*(nTime);
	}
	TM_RTimeAddnMinute(pstTmpTime, wTmpVal);	
}

/**************************************************************/
/* 新疆计算定时唤醒间隔
函数名: LP_XJ_CalReportConut
入  参: 无
出  参: 无
返回值: uint16_t
修改人: maronglang
日  期: 2016.06.23
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

/**************************************************************/
/* 新疆计算定时唤醒间隔
函数名: LP_XJ_CalReportConut
入  参: 无
出  参: 无
返回值: uint16_t
修改人: maronglang
日  期: 2016.06.23
*//*************************************************************/
uint32_t LP_XJ_CalReportConut(void)
{
	u32 dwTmp = 0, dwCount;
	TM_Time  stTmpTime; //stStarTime, stEndTime, 
	ST_Time  stReportTime;

	STM8_RTC_Get(&stTimeNow);
	TM_TimeChangeAToB(&stTimeNow, &stTmpTime);
	LP_XJ_CalReportTime(NULL);
	
	/* 计算下次抄表时间 */
	if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
	{
		JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyRecord.Time);
		MemcpyFunc(&stReportTime, &tyRecord.Time, sizeof(TypeTime));
		TM_TimeChangeAToB(&stReportTime, &stTmpTime);
		TM_RTimeAddnMinute(&stTmpTime, tyReport.nGatherCycle);
		TM_TimeChangeBToA(&stTmpTime, &g_stNextGmTime);	
	}
	else
	{
		MemcpyFunc(&g_stNextGmTime, &g_stNextRepTime, sizeof(g_stNextGmTime));	
	}

	/* 计算抄表间隔 */
	ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
	if(0 < tyReport.nGatherCycle)
	{
		dwTmp = tyReport.nGatherCycle;
		dwCount = dwTmp*60;
	}
	else
	{
		return LP_WAKEUP_TO;
	}
	return dwCount;
}

#else
/**************************************************************/
/* 130计算定时唤醒间隔
函数名: LP_CalReportConut
入  参: 无
出  参: 无
返回值: uint16_t
修改人: maronglang
日  期: 2015.01.19
*//*************************************************************/
uint32_t LP_130_CalReportConut(void)
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
	dwTemp   = ClaReportTimeToSec(tyReport.cycle);
		
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
#ifdef TEST_VISON
			TM_RTimeAddnMinute(&stTmpTime, 9);
#else
			if(0x41 == tyReport.cycle)
			{
				TM_RTimeAddnMinute(&stTmpTime, 15);
			}
			else
			{
				TM_RTimeAddnMinute(&stTmpTime, 540);
			}
#endif
		}
		else if(nRepFlg&SECOND_REP_FAIL)
		{
#ifdef TEST_VISON
			TM_RTimeAddnMinute(&stTmpTime, 6);
#else
			if(0x41 == tyReport.cycle)
			{
				TM_RTimeAddnMinute(&stTmpTime, 10);
			}
			else
			{
				TM_RTimeAddnMinute(&stTmpTime, 360);
			}
#endif
		}
		else
		{
#ifdef TEST_VISON
			TM_RTimeAddnMinute(&stTmpTime, 3);
#else
			if(0x41 == tyReport.cycle)
			{
				TM_RTimeAddnMinute(&stTmpTime, 5);
			}
			else
			{
				TM_RTimeAddnMinute(&stTmpTime, 180);
			}
#endif
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

#endif


