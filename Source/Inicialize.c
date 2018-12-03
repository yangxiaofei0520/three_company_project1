/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : Initialize.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ÖÕ¶ËIO¿ÚµÈ³õÊ¼»¯
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#include "Initialize.h"
#include "DriverUart.h"
#include "STM8_Rtc.h"
#include "STM8_Rtc.h"
#include "GsmGlobal.h"
#include "global.h"
#include "Pwrctr.h"
#include "FileGlobal.h"
#include "Alarm.h"

/* ÏµÍ³µÎ´ð1ms */
u32 g_dwSysTick = 0;

/* ¿´ÃÅ¹·Î¹¹·¼ÆÊý */
u16 g_wIwdgTick = 0;

/* ¿´ÃÅ¹·Î¹¹·¼ÆÊý */
u16 g_wIwdgTickExt = 0;

/* µ÷ÊÔÄ£Ê½±êÖ¾ */
static u8 nDebugFlg = FALSE;
u8 m_nWorkMode = NORMAL_MODE;


u32 m_dwSecTick   = 0;
u32 m_dw500MsTick = 0;


 /**
  * @}
  */
/** @defgroup ADC_Group4 Channels Configuration functions
 *  @brief   Channels Configuration functions
 *
@verbatim    
 ===============================================================================
                      Channels Configuration functions
 ===============================================================================  
  This section provides functions allowing to:
   - Enable or disable the ADC channel using ADC_ChannelCmd() function,
   - Configure the channels sampling times using ADC_SamplingTimeConfig() 
     function.
     Note: there are 2 sampling times configuration values : 
            - 1st Group value : for channels 0..23  
            - 2nd Group value : for channels 24..27 (depending on the MCU 
              package density) and Temperature Sensor and Vrefint channels. 
   - Configure the channels Schmitt Trigger for each channel using 
     ADC_SchmittTriggerConfig() function.
   - Get the current ADC conversion value.
   
 @endverbatim
  * @{
  */
    
/**
  * @brief  Enables or disables the selected ADC channel(s).
  * @param  ADCx where x can be 1 to select the specified ADC peripheral.
  * @param  ADC_Channels: specifies the ADC channels to be initialized
  *          This parameter can be one of the following values:
  *            @arg ADC_Channel_0: Channel 0
  *            @arg ADC_Channel_1: Channel 1
  *            @arg ADC_Channel_2: Channel 2
  *            @arg ADC_Channel_3: Channel 3
  *            @arg ADC_Channel_4: Channel 4
  *            @arg ADC_Channel_5: Channel 5
  *            @arg ADC_Channel_6: Channel 6
  *            @arg ADC_Channel_7: Channel 7
  *            @arg ADC_Channel_8: Channel 8
  *            @arg ADC_Channel_9: Channel 9
  *            @arg ADC_Channel_10: Channel 10
  *            @arg ADC_Channel_11: Channel 11
  *            @arg ADC_Channel_12: Channel 12
  *            @arg ADC_Channel_13: Channel 13
  *            @arg ADC_Channel_14: Channel 14
  *            @arg ADC_Channel_15: Channel 15
  *            @arg ADC_Channel_16: Channel 16
  *            @arg ADC_Channel_17: Channel 17
  *            @arg ADC_Channel_18: Channel 18
  *            @arg ADC_Channel_19: Channel 19
  *            @arg ADC_Channel_20: Channel 20
  *            @arg ADC_Channel_21: Channel 21
  *            @arg ADC_Channel_22: Channel 22
  *            @arg ADC_Channel_23: Channel 23
  *            @arg ADC_Channel_24: Channel 24
  *            @arg ADC_Channel_25: Channel 25
  *            @arg ADC_Channel_26: Channel 26
  *            @arg ADC_Channel_27: Channel 27
  *            @arg ADC_Channel_Vrefint: Vrefint Channel
  *            @arg ADC_Channel_TempSensor: Temperature sensor Channel
  *            @arg ADC_Channel_00To07: select from channel00 to channel07
  *            @arg ADC_Channel_08To15: select from channel08 to channel15
  *            @arg ADC_Channel_16To23: select from channel16 to channel23
  *            @arg ADC_Channel_24To27: select from channel24 to channel27
  * @param  NewState : new state of the specified ADC channel(s).
    *         This parameter can be: ENABLE or DISABLE.
  * @retval None
  */
void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
{
  uint8_t regindex = 0;

  regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);

  if (NewState != DISABLE)
  {
    /* Enable the selected ADC channel(s). */
    ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
  }
  else
  {
    /* Disable the selected ADC channel(s). */
    ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
  }
}

/***********************************************/
/* ÆôÓÃÄÚ²¿¿´ÃÅ¹·
º¯ÊýÃû: IWDG_Config
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: void
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2015.12.11
*//*********************************************/
void IWDG_Config(void)
{
	u8 nTemp = 0;
	
  /* Enable IWDG (the LSI oscillator will be enabled by hardware) */
  IWDG->KR = IWDG_KEY_ENABLE;
  
  /* IWDG timeout equal to 1724 ms (the timeout may varies due to LSI frequency
     dispersion) */
  /* Enable write access to IWDG_PR and IWDG_RLR registers */
  IWDG->KR = IWDG_WriteAccess_Enable; /* Write Access */
 
  /* IWDG configuration: IWDG is clocked by LSI = 38KHz */
  IWDG->PR = IWDG_Prescaler_256;

  /* IWDG timeout equal to 1724.7 ms (the timeout may varies due to LSI frequency dispersion) */
  /* IWDG timeout = (RELOAD_VALUE + 1) * Prescaler / LSI 
                  = (254 + 1) * 128 / 38 000 
                  = 1724.7 ms */
  IWDG->RLR = RELOAD_VALUE;

  /* Reload IWDG counter */
  IWDG->KR = IWDG_KEY_REFRESH;
}

/***********************************************/
/* ÖÕ¶ËÓÅÏÈ¼¶ÉèÖÃº¯Êý
º¯ÊýÃû: ITC_SetSoftwarePriority
Èë	²Î: ITC_PriorityLevel IRQn
³ö	²Î: void
·µ»ØÖµ: void
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2016.01.20
*//*********************************************/
void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
{
  uint8_t Mask = 0;
  uint8_t NewPriority = 0;

  /* Check function parameters */
  assert_param(IS_ITC_IRQ(IRQn));
  assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));

  /* Check if interrupts are disabled */
  assert_param(IS_ITC_INTERRUPTS_DISABLED);

  /* Define the mask corresponding to the bits position in the SPR register */
  /* The mask is reversed in order to clear the 2 bits after more easily */
  Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
  /* Define the new priority to write */
  NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));

  switch (IRQn)
  {
    case FLASH_IRQn:
    case DMA1_CHANNEL0_1_IRQn:
    case DMA1_CHANNEL2_3_IRQn:
      ITC->ISPR1 &= Mask;
      ITC->ISPR1 |= NewPriority;
      break;

    case EXTIE_F_PVD_IRQn:
#if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
    case RTC_IRQn:
    case EXTIB_IRQn:
    case EXTID_IRQn:
#elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
    case RTC_CSSLSE_IRQn:
    case EXTIB_IRQn:
    case EXTID_IRQn:
#elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
    case RTC_CSSLSE_IRQn:
    case EXTIB_G_IRQn:
    case EXTID_H_IRQn:
#endif  /* STM8L15X_MD */
      ITC->ISPR2 &= Mask;
      ITC->ISPR2 |= NewPriority;
      break;

    case EXTI0_IRQn:
    case EXTI1_IRQn:
    case EXTI2_IRQn:
    case EXTI3_IRQn:
      ITC->ISPR3 &= Mask;
      ITC->ISPR3 |= NewPriority;
      break;

    case EXTI4_IRQn:
    case EXTI5_IRQn:
    case EXTI6_IRQn:
    case EXTI7_IRQn:
      ITC->ISPR4 &= Mask;
      ITC->ISPR4 |= NewPriority;
      break;
#if !defined (STM8L15X_LD) && !defined (STM8L05X_LD_VL)
    case SWITCH_CSS_BREAK_DAC_IRQn:
#else
    case SWITCH_CSS_IRQn:
#endif /*	STM8L15X_LD	*/
    case ADC1_COMP_IRQn:
#if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
    case LCD_IRQn:
    case TIM2_UPD_OVF_TRG_BRK_IRQn:
#elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
    case TIM2_UPD_OVF_TRG_BRK_IRQn:
#elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
    case LCD_AES_IRQn:
    case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
#endif  /* STM8L15X_MD */
      ITC->ISPR5 &= Mask;
      ITC->ISPR5 |= NewPriority;
      break;
#if !defined (STM8L15X_LD) && !defined (STM8L05X_LD_VL)
    case TIM1_UPD_OVF_TRG_IRQn:
#endif  /* STM8L15X_LD */
#if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
    case TIM2_CC_IRQn:
    case TIM3_UPD_OVF_TRG_BRK_IRQn :
    case TIM3_CC_IRQn:
#elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
    case TIM2_CC_USART2_RX_IRQn:
    case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
    case TIM3_CC_USART3_RX_IRQn:
#endif  /* STM8L15X_MD */
      ITC->ISPR6 &= Mask;
      ITC->ISPR6 |= NewPriority;
      break;

#if !defined (STM8L15X_LD) && !defined (STM8L05X_LD_VL)
    case TIM1_CC_IRQn:
#endif  /* STM8L15X_LD */
    case TIM4_UPD_OVF_TRG_IRQn:
    case SPI1_IRQn:
#if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
    case USART1_TX_IRQn:
#elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
    case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
#endif  /* STM8L15X_MD */
      ITC->ISPR7 &= Mask;
      ITC->ISPR7 |= NewPriority;
      break;

#if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
    case USART1_RX_IRQn:
    case I2C1_IRQn:
#elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
    case USART1_RX_TIM5_CC_IRQn:
    case I2C1_SPI2_IRQn:
#endif  /* STM8L15X_MD */
      ITC->ISPR8 &= Mask;
      ITC->ISPR8 |= NewPriority;
      break;

    default:
      break;
  }
}

/***********************************************/
/* Èí¼þ¿´ÃÅ¹·Î¹¹·
º¯ÊýÃû: FeedSoftWareIwdg
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: void
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2016.01.20
*//*********************************************/
void FeedSoftWareIwdg(void)
{
	g_wIwdgTick = 0;
}

/***********************************************/
/* ADC³õÊ¼»¯
º¯ÊýÃû: ADC_Config
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: void
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2015.12.25
*//*********************************************/
void ADC_Config(void)
{
	uint8_t regindex = 0;

#if 1
	/* Enable ADC1 clock */
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);

	/* Initialize and configure ADC1 */
	ADC1->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);	
	ADC1->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode_Single | (uint8_t)ADC_Resolution_12Bit);	
	/*clear CR2 register */
	ADC1->CR2 &= (uint8_t)~(ADC_CR2_PRESC);	
	ADC1->CR2 |= (uint8_t) ADC_Prescaler_1;

	/* Configures the sampling time for the Fast ADC channel group. */
    ADC1->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
    ADC1->CR2 |= (uint8_t)ADC_SamplingTime_192Cycles;

    ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);

	/* Enable ADC1 */
    ADC1->CR1 |= ADC_CR1_ADON;

	/* Enable ADC1 ADC_Channel_Vrefint */
	//regindex = (uint8_t)((uint16_t)ADC_Channel_Vrefint >> 8);
    //ADC1->SQR[regindex] |= (uint8_t)(ADC_Channel_Vrefint);
	ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);

	/* Start ADC1 Conversion using Software trigger*/
	ADC1->CR1 |= ADC_CR1_START;
#endif
}

/**
  * @brief  Configure TIM1 peripheral   
  * @param  None
  * @retval None
  */
static void TIM1_Config(void)
{
	/* TIM1 configuration:
	- TIM1CLK is set to 8 MHz, the TIM2 Prescaler is equal to 0 so the TIM1 counter
	clock used is 16 MHz / (1+1) = 8 MHz */
	 
	/* 1.Time base configuration */
	/* Set the Autoreload value */
	TIM1->ARRH = (uint8_t)(TIM1_PERIOD >> 8);
	TIM1->ARRL = (uint8_t)(TIM1_PERIOD);
	
	/* Set the Prescaler value */
	TIM1->PSCRH = (uint8_t)(TIM1_PRESCALER >> 8);
	TIM1->PSCRL = (uint8_t)(TIM1_PRESCALER);
	
	/* Select the Counter Mode */
	TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
						  | (uint8_t)(TIM1_CounterMode_Up));
	
	/* Set the Repetition Counter value */
	TIM1->RCR = TIM1_REPTETION_COUNTER;	

	/* 2.Clear TIM1 update flag */
	/* Clear the flags (rc_w0) clear this bit by writing 0. Writing ‘1’ has no effect*/
	TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG_Update));
	TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG_Update >> 8))) & (uint8_t)0x1E);

	/* 3.Enable update interrupt */
	TIM1->IER |= (uint8_t)TIM1_IT_Update;
}

/**
  * @brief  Configure TIM4 peripheral   
  * @param  None
  * @retval None
  */
static void TIM4_Config(void)
{
  /* TIM4 configuration:
   - TIM4CLK is set to 16 MHz, the TIM4 Prescaler is equal to 128 so the TIM1 counter
   clock used is 16 MHz / 128 = 125 000 Hz
  - With 125 000 Hz we can generate time base:
      max time base is 2.048 ms if TIM4_PERIOD = 255 --> (255 + 1) / 125000 = 2.048 ms
      min time base is 0.016 ms if TIM4_PERIOD = 1   --> (  1 + 1) / 125000 = 0.016 ms
  - In this example we need to generate a time base equal to 1 ms
   so TIM4_PERIOD = (0.001 * 125000 - 1) = 124 */

  /* Time base configuration */
  TIM4->ARR = (uint8_t)(TIM4_PERIOD);
  TIM4->PSCR = (uint8_t)(TIM4_Prescaler_128);
  TIM4->EGR = TIM4_EventSource_Update;
  
  /* Clear TIM4 update flag */
  TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG_Update));
  
  /* Enable update interrupt */
  TIM4->IER |= (uint8_t)TIM4_IT_Update;
  
  /* Enable TIM4 */
  TIM4->CR1 |= TIM4_CR1_CEN ;
}

/**
  * @brief  Configure system clock to run at 16MHz
  * @param  None
  * @retval None
  */
void CLK_Config(void)
{
  /* High Speed Internal clock divider: 1 */
  CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);

  /* Enable LSI clock */
  CLK_LSICmd(ENABLE);
  
  /* Wait for LSI clock to be ready */
  while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET)
  {;}

  /* Wait for BEEP switch busy flag to be reset */
  while (CLK_GetFlagStatus(CLK_FLAG_BEEPSWBSY) == SET)
  {;}
}


/***********************************************/
/* IO¿Ú³õÊ¼»¯
º¯ÊýÃû: IoInit
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: u8
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2015.12.15
*//*********************************************/
void IoInit(void)
{
	/* ´®¿ÚRX TX IO¿ÚÉèÖÃ */
	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_In_FL_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_High_Fast);

	/* Ê±ÖÓ²âÊÔ */
	GPIO_Init(GPIOC, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Fast);
	
	/* ´®¿ÚRX2 TX2 IO¿ÚÉèÖÃ */
	GPIO_Init(UART2_RX_PORT, UART2_RX_PIN, GPIO_Mode_In_PU_IT);
	GPIO_Init(UART2_TX_PORT, UART2_TX_PIN, GPIO_Mode_Out_PP_High_Fast);

	/* ³­±í¿ÚµçÔ´¿ØÖÆ */
	GPIO_Init(GM_VCC_PORT, GM_VCC_PIN, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(GPRS_VCC_PORT, GPRS_VCC_PIN, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(SWITCHON_PORT, SWITCHON_PIN, GPIO_Mode_Out_PP_High_Slow);
	GPIO_Init(GPRS_RESET_PORT, GPRS_RESET_PIN, GPIO_Mode_Out_PP_High_Slow);

	/* µ÷ÊÔÄ£Ê½¼ì²â¿Ú */
	GPIO_Init(DEBUG_PORT, DEBUG_PIN, GPIO_Mode_In_PU_No_IT);

#ifdef IOT_DAT_DETECTOR
	GPIO_Init(GPRS_RX_PORT, GPRS_RX_PIN, GPIO_Mode_Out_PP_High_Slow);
	GPIO_Init(RS485_DE_PORT, RS485_DE_PIN, GPIO_Mode_In_FL_No_IT);
	//SetPortMeterPowerOn(); 
#endif
	//GPIO_Init(GM_TXEN_PORT, GM_TXEN_PIN, GPIO_Mode_Out_PP_High_Slow);

	SetPortSoftSwitchOff();
	SetPortGsmPowerOff();
	SetPortGsmResetEnable();
	//SetPortMeterTxDis();
	
	/* µç³Ø²ÉÑù¿Ú¿ØÖÆÒý½Å */
	GPIO_Init(BAT_GAT_PORT, BAT_GAT_PIN, GPIO_Mode_Out_PP_Low_Slow); 
	GPIO_Init(GPIOB, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT); 
#ifdef IOT_WATERMETER
	GPIO_Init(LOAD_PORT, LOAD_PIN, GPIO_Mode_Out_PP_Low_Slow); 
#endif
	/* IO¿ØÖÆLEDµÆ */
	GPIO_Init(IO_LED_PORT, IO_LED_PIN, GPIO_Mode_Out_PP_Low_Slow);
	
#ifdef IOT_GASMETER
	GPIO_Init(MCU_VCC_PORT, MCU_VCC_PIN, GPIO_Mode_Out_PP_High_Slow);
#endif

#ifdef IOT_WATERMETER_NEW
	GPIO_Init(GUARD_PORT, GUARD_PIN, GPIO_Mode_Out_PP_High_Slow);
	GPIO_Init(CHK_GUARD_PORT, CHK_GUARD_PIN, GPIO_Mode_In_FL_No_IT);
#endif

/* ´ó±íÊý¾Ý²É¼¯Æ÷  */
#ifdef IOT_DAT_DETECTOR
#ifdef VAVLE_METER
	/* ÎåÏß·§ */
	GPIO_Init(MOTO_VCC_PORT, MOTO_VCC_PIN, GPIO_Mode_Out_PP_Low_Slow); 
	GPIO_Init(MOTO_POSI_PORT, MOTO_POSI_PIN, GPIO_Mode_Out_PP_Low_Slow);
	GPIO_Init(MOTO_NEGA_PORT, MOTO_NEGA_PIN, GPIO_Mode_Out_PP_Low_Slow);
	
	GPIO_Init(MOTO_MS1_PORT, MOTO_MS1_PIN, GPIO_Mode_In_FL_No_IT); 
	GPIO_Init(MOTO_MS2_PORT, MOTO_MS2_PIN, GPIO_Mode_In_FL_No_IT);
#endif
#endif
}

/***********************************************/
/* ÏµÍ³³õÊ¼»¯
º¯ÊýÃû: InitializeBase
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: u8
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2015.12.11
*//*********************************************/
void InitializeBase(void)
{
	/* enable interrupts */
	disableInterrupts();

	/* ÅäÖÃÏµÍ³Ê±ÖÓÎª16M */
	CLK_Config();

	/* ¿ªÆôIWDG */
	IWDG_Config();
	
	/* Ê¹ÄÜ¸÷×ÜÏßÊ±ÖÓ */
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE); //
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE); //
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE); //
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE); //
	
	/* For test purpose output Fcpu on MCO pin */
	//CLK_CCOConfig(CLK_CCOSource_HSI, CLK_CCODiv_1);

	/* µ±Ç°Îª¿´ÃÅ¹·ÒýÆð¸´Î» */	
	if (((FlagStatus)(((uint8_t)(RST->SR & RST_FLAG_IWDGF) == (uint8_t)0x00) ? RESET : SET))!= RESET)
	{
		/* ³õÊ¼»¯´®¿Ú */
		//Usart1Initialize();
	}

	/* ³õÊ¼»¯IO */
	IoInit();

	ITC_SetSoftwarePriority(USART1_RX_IRQn, ITC_PriorityLevel_1);
	ITC_SetSoftwarePriority(USART1_TX_IRQn, ITC_PriorityLevel_2);
	ITC_SetSoftwarePriority(TIM4_UPD_OVF_TRG_IRQn, ITC_PriorityLevel_3);
	ITC_SetSoftwarePriority(EXTI4_IRQn, ITC_PriorityLevel_1);
	ITC_SetSoftwarePriority(TIM1_UPD_OVF_TRG_IRQn, ITC_PriorityLevel_2);
	
	/* ÅäÖÃÍâÖÐ¶ÏÓÃÓÚÄ£Äâ´®¿Ú½ÓÊÕÏß */
	EXTI_SelectPort(EXTI_Port_D);
	EXTI_SetPinSensitivity(UART2_RX_PIN, EXTI_Trigger_Falling);
	EXTI_ClearITPendingBit(EXTI_IT_Pin4);

	/* Ê±»ù¶¨Ê±Æ÷ */
	TIM4_Config();

	/* Ä£Äâ´®¿Ú¶¨Ê±Æ÷1ÅäÖÃ */
	TIM1_Config();

	/* ³õÊ¼»¯´®¿Ú */
	Usart1Initialize();

	/* ³õÊ¼»¯RTC */
	STM8_RTC_Init();
	
	/* ADC³õÊ¼»¯ */
	ADC_Config();
	
	/* enable interrupts */
	enableInterrupts();	
	
	STM8_RTC_Get(&stTimeNow);
	LP_DelayMs(20); // Ïàµ±ÓÚ1s
}


/***********************************************/
/* ¼ì²âµ÷ÊÔ¿ÚÊÇ·ñ²åÈë
º¯ÊýÃû: CheckDebugInsertStat
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: u8
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2015.12.28
*//*********************************************/
u8 CheckDebugInsertStat(void)
{
	static u8 nHighCnt = 0, nLowCnt = 0, nStat = TRUE;
	u8 nNowStat = FALSE;
	static u32 dwStartTime = 0;
	
	nNowStat = GetDebugMode();
	if((nNowStat == nStat)&&(30000 > GetSysTemTick() - dwStartTime))
	{
		return nDebugFlg;
	}
	
	if(FALSE == GetDebugMode())
	{
		nLowCnt = 0;
		if(3 <= nHighCnt++)
		{
			nHighCnt  = 3;
			nDebugFlg = TRUE;			
			dwStartTime = GetSysTemTick();
				
			/* ¹Ø±Õ±í¼°GPRSµçÔ´ */
			//SetPortMeterPowerOff();
			SetPortMeterPowerOn();
			SetPortGsmPowerOff();
			nStat = nNowStat;
		}
	}
	else
	{
		nHighCnt = 0;
		if(3 <= nLowCnt++)
		{
			nLowCnt = 3;
			nStat = nNowStat;
			dwStartTime = GetSysTemTick();
			
			/* ÉèÖÃÍê±ÏÔò¸´Î» */
			if(nDebugFlg)
			{			
				/* ÉèÖÃ²ÎÊýºóÔòÁ¢¼´Çå³ýÖ®Ç°µÄÉÏ±¨±êÖ¾ÎªFALSE */
				SetReportIndex(0);  // ×¢ÊÍµôÓÃÓÚ²âÊÔÊ§°Ü²¹±¨3
#ifndef XINJIANG_PTR
				ReWriteRepFlg();
#endif
				SaveReportFlag(FALSE);
				UC_SleepFunc(100);				
				LP_TermReset();
			}
			nDebugFlg = FALSE;
		}
	}
	return nDebugFlg;
}


/***********************************************/
/* »ñÈ¡µ÷ÊÔÄ£Ê½×´Ì¬
º¯ÊýÃû: GetTmDebugModeStat
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: u8
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2015.12.28
*//*********************************************/
u8 GetTmDebugModeStat(void)
{
	return nDebugFlg;
}

/***********************************************/
/* ÉèÖÃµ÷ÊÔÄ£Ê½×´Ì¬
º¯ÊýÃû: SetTmDebugModeStat
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: u8
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2015.12.28
*//*********************************************/
u8 SetTmDebugModeStat(u8 nMode)
{
	m_nWorkMode = nMode;
}

/*
ÃèÊö:		ÐèÒªÔÚ½áÊøÊ±ºò³õÊ¼»¯µÄÉè±¸
ÊäÈë:		ÎÞ
Êä³ö:		ÎÞ
*/
void InitializEnd(void)
{

}

/*
ÃèÊö:		´ò¿ªÍâ²¿ÖÐ¶Ï
ÊäÈë:		ÎÞ
Êä³ö:		ÎÞ
*/
void TurnOnExit(void)
{
	GPIO_Init(UART2_RX_PORT, UART2_RX_PIN, GPIO_Mode_In_PU_IT); // GPIO_Mode_In_FL_IT ¿ªÊ¼Ê×Ö¡Êý¾Ý¶ªÊ§ÎÊÌâ
	EXTI_ClearITPendingBit(EXTI_IT_Pin4);	
}

/*
ÃèÊö:	·¢ËÍÊ±ºò,½ÓÊÕÊý¾ÝÊ±,¹Ø±ÕÍâ²¿ÖÐ¶Ï
ÊäÈë:	ÎÞ
·µ»ØÖµ:	ÎÞ
*/
void TurnOffExit(void)
{
	GPIO_Init(UART2_RX_PORT, UART2_RX_PIN, GPIO_Mode_In_PU_No_IT);// GPIO_Mode_In_FL_No_IT
}

#if  0
/***********************************************/
/* ÄÚÍâÊ±ÖÓÇÐ»»
º¯ÊýÃû: STM8_RTC_ClkswitchProc
Èë	²Î: ÎÞ
³ö	²Î: ÎÞ
·µ»ØÖµ: ÎÞ
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2017.03.18
*//*********************************************/
u8  STM8_RTC_ClkSwitchProc(void)
{	
	ST_Time stTime;
	TM_Time stTmStarTime,stTmEndTime;

	STM8_RTC_Get(&stTime);
	TM_TimeChangeAToB(&stTime, &stTmStarTime);		

	delay_ms(400);	
	STM8_RTC_Get(&stTime);
	TM_TimeChangeAToB(&stTime, &stTmEndTime);		
	if(1 >= TM_DiffSecond(&stTmStarTime, &stTmEndTime))
	{
		/* RTC¸æ¾¯ */
		ALM_SetAlmStatus(RTC_ERROR);
	}
	else
	{
		ALM_ClrAlmStatus(RTC_ERROR);
	}
	
	return TRUE;
}

#endif

#ifdef IOT_DAT_DETECTOR
/***********************************************/
/* IO¿ÚÄ£Ê½ÇÐ»»
º¯ÊýÃû: DecIoModeChange
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: u8
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2017.02.07
*//*********************************************/
void DecIoModeChange(u8 nMode)
{
	if(PULLUPOUTPUT == nMode)
	{
		GPIO_Init(RS485_DE_PORT, RS485_DE_PIN, GPIO_Mode_Out_PP_High_Slow);
		GPIO_Init(DEBUG_PORT, DEBUG_PIN, GPIO_Mode_In_FL_No_IT);
	}
	else
	{
		GPIO_Init(RS485_DE_PORT, RS485_DE_PIN, GPIO_Mode_In_FL_No_IT);
		GPIO_Init(DEBUG_PORT, DEBUG_PIN, GPIO_Mode_In_PU_No_IT);
	}
}
#ifdef VAVLE_METER
/***********************************************/
/* IO¿ÚÄ£Ê½ÇÐ»»
º¯ÊýÃû: ValveStatIoModeChange
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: u8
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2017.02.07
*//*********************************************/
void ValveStatIoModeChange(u8 nMode)
{
	if(PULLUPINPUT == nMode)
	{
		GPIO_Init(MOTO_MS1_PORT, MOTO_MS1_PIN, GPIO_Mode_In_PU_No_IT); 
		GPIO_Init(MOTO_MS2_PORT, MOTO_MS2_PIN, GPIO_Mode_In_PU_No_IT);
	}
	else
	{
		GPIO_Init(MOTO_MS1_PORT, MOTO_MS1_PIN, GPIO_Mode_In_FL_No_IT); 
		GPIO_Init(MOTO_MS2_PORT, MOTO_MS2_PIN, GPIO_Mode_In_FL_No_IT);
	}
}
#endif
#endif

/* LED¿ØÖÆ */
#if 1
/***********************************************/
/* LEDÉÁË¸ÈÎÎñº¯Êý
º¯ÊýÃû: fixTaskLed
Èë	²Î: void
³ö	²Î: void
·µ»ØÖµ: u8
ÐÞ¸ÄÈË: maronglang
ÈÕ	ÆÚ: 2016.06.10
*//*********************************************/
void fixTaskLed(void)
{	
	if((1000 < GetSysTemTick()-m_dwSecTick)	&&(GetLedFlg()&&(GSM_SHAKEHAND > GetGprsConntStat())))
	{
		Toggle_LED();
		m_dwSecTick = GetSysTemTick();
	}
	else if((200 < GetSysTemTick()-m_dw500MsTick)&&(GetLedFlg()
		&&(GSM_SEND > GetGprsConntStat())&&(GSM_SHAKEHAND <= GetGprsConntStat())))
	{
		m_dw500MsTick = GetSysTemTick();
		Toggle_LED();
	}
	return ;
}
#endif

/* (C) Copyright 2008~2015
ÄÏÉ½ÇøÖÐÉ½Ô°Â·1001ºÅ TCL¹ú¼ÊE³ÇE4¶°2D
ÉîÛÚÊÐ½ÝÏÈÊýÂë¿Æ¼¼ÓÐÏÞ¹«Ë¾
End Of File*/
