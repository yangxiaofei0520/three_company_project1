/**
  ******************************************************************************
  * @file    Project/STM8L15x_StdPeriph_Template/stm8l15x_it.c
  * @author  MCD Application Team
  * @version V1.6.1
  * @date    30-September-2014
  * @brief   Main Interrupt Service Routines.
  *          This file provides template for all peripherals interrupt service routine.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; COPYRIGHT 2014 STMicroelectronics</center></h2>
  *
  * Licensed under MCD-ST Liberty SW License Agreement V2, (the "License");
  * You may not use this file except in compliance with the License.
  * You may obtain a copy of the License at:
  *
  *        http://www.st.com/software_license_agreement_liberty_v2
  *
  * Unless required by applicable law or agreed to in writing, software 
  * distributed under the License is distributed on an "AS IS" BASIS, 
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  *
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8l15x_it.h"
#include "stm8l15x_conf.h"
#include "DriverUart.h"
#include "Pwrctr.h"
#include "Initialize.h"
#include "Alarm.h"
#include "GsmGlobal.h"

extern u16 g_wIwdgTickExt;
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
/* Public functions ----------------------------------------------------------*/

#ifdef _COSMIC_
/**
  * @brief Dummy interrupt routine
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT void TRAP_IRQHandler(void)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
}
#endif

/**
  * @brief NonHandledInterrupt
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT void NonHandledInterrupt(void)
{
;
}

/**
  * @brief RTC_CSSLSE_IRQHandler
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT void RTC_CSSLSE_IRQHandler(void)
{
	LP_SetKeyWuFlg(WU_MODE_AUTO);
	//RTC_ClearITPendingBit(RTC_IT_WUT);
	RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT_WUT >> 4);
}

/**
  * @brief EXTI0_IRQHandler
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT void EXTI0_IRQHandler(void)
{
	LP_SetKeyWuFlg(WU_MODE_KEY);
	EXTI_ClearITPendingBit(WAKE_UP_EXTIT_PIN);	
}

/**
  * @brief EXTI2_IRQHandler
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT void EXTI2_IRQHandler(void)
{
	LP_SetKeyWuFlg(WU_MODE_KEY);
	EXTI_ClearITPendingBit(WAKE_UP_EXTIT_PIN);
}

/**
  * @brief EXTI4_IRQHandler
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT void EXTI4_IRQHandler(void)
{
	nReceiveDataFlg = TRUE;	
	ucNumberBusUart2SoftReceive = 0;		//接收数据2位数
	//	DelayUs(100);			//延时100us
	if(!CheckUart2Rx())
	{
		ReceivedBusUart2();
		TurnOnTimerUart();
		//UartRxLock(COM_2);
	}
	EXTI_ClearITPendingBit(EXTI_IT_Pin4);
}

/**
  * @brief TIM1_UPD_OVF_TRG_COM_IRQHandler
  * @par Parameters:
  * None
  * @retval 
  * None
*/
INTERRUPT void TIM1_UPD_OVF_TRG_COM_IRQHandler(void)
{
	HandleBusUartSoft();		//软件UART处理
	TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG_Update));
	TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG_Update >> 8))) & (uint8_t)0x1E);
}


/**
  * @brief TIM4 Update/Overflow/Trigger Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT void TIM4_UPD_OVF_TRG_IRQHandler(void)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */

	if(SOLFDOG_TO < g_wIwdgTick++)
	{
		g_wIwdgTick = 0;
		LP_TermReset();
	}

	if(IWDG_FEED_TO < g_wIwdgTickExt++)
	{
		IWDG->KR = IWDG_KEY_REFRESH;
		g_wIwdgTickExt = 0;
	}
	
	g_dwSysTick++;
	TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT_Update);
}

/**
  * @brief USART1 TX / TIM5 Update/Overflow/Trigger/Break Interrupt  routine.
  * @param  None
  * @retval None
  */
INTERRUPT void USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler(void)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
	//USART_ClearITPendingBit(USART1, USART_IT_TC);
	USART1->SR &= (uint8_t)(~USART_SR_TC);
	SendBusUartOver();
}

/**
  * @brief USART1 RX / Timer5 Capture/Compare Interrupt routine.
  * @param  None
  * @retval None
  */
INTERRUPT void USART1_RX_TIM5_CC_IRQHandler(void)
{
    /* In order to detect unexpected events during development,
       it is recommended to set a breakpoint on the following instruction.
    */
    ReceivedBusUart();
	//USART_ClearITPendingBit(USART1, USART_IT_TC);	
	USART1->SR &= (uint8_t)(~USART_SR_TC);
}


/**
  * @}
  */ 

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
