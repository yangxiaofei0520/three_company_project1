/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : STM8_Rtc.c
* Author            : maronglang
* Date First Issued : 2015/12/23
* Description       : 内部RTC时钟接口函数
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#include "global.h"
#include "STM8_Rtc.h"

/* Private defines   ----------------------------------------------------------*/
/* Private function prototypes -----------------------------------------------*/

/* Private variables ---------------------------------------------------------*/
RTC_InitTypeDef   RTC_InitStr;
RTC_TimeTypeDef   RTC_TimeStr;
RTC_DateTypeDef   RTC_DateStr;
//RTC_AlarmTypeDef  RTC_AlarmStr;


/* Private functions ---------------------------------------------------------*/

#if 1


/**
* @brief  Enters the RTC Initialization mode.
* @note   The RTC Initialization mode is write protected, use the 
*         RTC_WriteProtectionCmd(DISABLE) before calling this function. 
* @param  None
* @retval An ErrorStatus enumeration value:
*          - SUCCESS: RTC is in Init mode
*          - ERROR: RTC is not in Init mode
*/
ErrorStatus RTC_EnterInitMode(void)
{
  ErrorStatus status = ERROR;
  uint16_t initfcount = 0;

  /* Check if the Initialization mode is set */
  if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
  {
    /* Set the Initialization mode */
    RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;

    /* Wait until INITF flag is set */
    while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
    {
      initfcount++;
    }
  }

  if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
  {
    status = ERROR;
  }
  else
  {
    status = SUCCESS;
  }

  return (ErrorStatus)status;
}

/**
 * @addtogroup RTC_Private_Functions
 * @{
 */
/**
* @brief  Converts a 2 digit decimal to BCD format
* @param  Value: Byte to be converted.
* @retval Converted byte
*/
static uint8_t ByteToBcd2(uint8_t Value)
{
  uint8_t bcdhigh = 0;

  while (Value >= 10)
  {
    bcdhigh++;
    Value -= 10;
  }

  return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
}

/**
* @brief  Converts from 2 digit BCD to Binary format
* @param  Value: BCD value to be converted.
* @retval Converted word
*/
static uint8_t Bcd2ToByte(uint8_t Value)
{
  uint8_t tmp = 0;

  tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);

  return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
}

/**
* @brief  Set the RTC current date.
* @note   After updating the Calendar, this routine clears the RSF flag and waits
*         until it is set again (using RTC_WaitForSynchro() function) , which means
*         that the Calendar registers have been correctly copied into the RTC_TRx
*         and RTC_DRx shadow registers.   
* @param  RTC_Format: specifies the format of the entered parameters.
*         This parameter can be one of the @ref RTC_Format_TypeDef enumeration.
* @param  RTC_DateStruct:  pointer to a  @ref RTC_TimeTypeDef structure that
*         contains the date configuration information for the RTC.
* @retval An ErrorStatus enumeration value:
*          - SUCCESS: RTC Date register is configured
*          - ERROR: RTC Date register is not configured
*/
ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
                        RTC_DateTypeDef* RTC_DateStruct)
{
  ErrorStatus status = ERROR;

  if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
  {
    RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
  }

  /* Check the parameters */
  assert_param(IS_RTC_FORMAT(RTC_Format));
  if (RTC_Format == RTC_Format_BIN)
  {
    assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
    assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
    assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
    assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
    assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
  }
  else
  {
    assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
    assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
    assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
    assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
    assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
  }
  assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));

  /* Disable the write protection for RTC registers */
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;

  /* Set Initialization mode */
  if (RTC_EnterInitMode() == ERROR)
  {
    status = ERROR;
    /* Enable the write protection for RTC registers */
    RTC->WPR = 0xFF; 
  }
  else
  {
    (void)(RTC->TR1);
    /* Set the RTC_DR registers */
    /* Check the input parameters format */
    if (RTC_Format != RTC_Format_BIN)
    {
      RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
      RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
      RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
    }
    else
    {
      RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
      RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
      RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
    }

    /* Exit Initialization mode */
    RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;

    /* Enable the write protection for RTC registers */
    RTC->WPR = 0xFF; 

    /* if  RTC_CR1_BYPSHAD bit = 0, wait for synchro else this check is not needed */
    if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
    {
      if (RTC_WaitForSynchro() == ERROR)
      {
        status = ERROR;
      }
      else
      {
        status = SUCCESS;
      }
    }
    else
    {
      status = SUCCESS;
    }
  }

  return (ErrorStatus)status;
}

/**
  * @}
  */

/** @defgroup RTC_Group2 Time and Date configuration functions
 *  @brief   Time and Date configuration functions 
 *
@verbatim   
 ===============================================================================
                   Time and Date configuration functions
 ===============================================================================  

  This section provide functions allowing to program and read the RTC Calendar
  (Time and Date).

@endverbatim
  * @{
  */


/**
* @brief Sets the RTC current time.
* @note   After updating the Calendar, this routine clears the RSF flag and waits
*         until it is set again (using RTC_WaitForSynchro() function) , which means
*         that the Calendar registers have been correctly copied into the RTC_TRx
*         and RTC_DRx shadow registers. 
* @param  RTC_Format: specifies the format of the entered parameters.
*         This parameter can be one of the @ref RTC_Format_TypeDef enumeration.
* @param  RTC_TimeStruct:  pointer to a  @ref RTC_TimeTypeDef structure that
*         contains the time configuration information for the RTC
* @retval An ErrorStatus enumeration value:
*          - SUCCESS: RTC Time register is configured
*          - ERROR: RTC Time register is not configured
*/
ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
                        RTC_TimeTypeDef* RTC_TimeStruct)
{
  ErrorStatus status = ERROR;
  uint8_t temp = 0;

  /* Check the parameters */
  assert_param(IS_RTC_FORMAT(RTC_Format));

  if (RTC_Format == RTC_Format_BIN)
  {
    /* Check Hour Format (24h or 12h)*/
    if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
    {
      assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
      assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
    }
    else
    {
      assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
    }
    assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
    assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
  }
  else
  {
    /* Check Hour Format (24h or 12h)*/
    if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
    {
      assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
      assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
    }
    else
    {
      assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
    }
    assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
    assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
  }


  /* Disable the write protection for RTC registers */
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;

  /* Set Initialization mode */
  if (RTC_EnterInitMode() == ERROR)
  {
    status = ERROR;
    /* Enable the write protection for RTC registers */
    RTC->WPR = 0xFF; 
  }
  else
  {
    /* Check Hour Format is 12h)*/
    if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
    {
      assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
      temp = RTC_TimeStruct->RTC_H12;
    }
    else
    {
      temp = 0;
    }
    /* Check the input parameters format */
    if (RTC_Format != RTC_Format_BIN)
    {
      RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
      RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
      RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
    }
    else
    {
      RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
      RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
      RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
    }
    /* Read DR3 register to unfreeze calender registers */
    (void)(RTC->DR3);

    /* Exit Initialization mode */
    RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;

    /* Enable the write protection for RTC registers */
    RTC->WPR = 0xFF; 

    /* if RTC_CR1_BYPSHAD bit = 0, wait for synchro else this check is not needed */
    if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
    {
      if (RTC_WaitForSynchro() == ERROR)
      {
        status = ERROR;
      }
      else
      {
        status = SUCCESS;
      }
    }
    else
    {
      status = SUCCESS;
    }
  }

  return (ErrorStatus)status;
}


/**
* @brief  Waits until the RTC Calendar registers (Time and Date)
*         are synchronized with RTC clock.
* @note   This function is meaningless when BYPASS feature is enabled in RTC_CR1
*         register.
* @note   To read the Calendar through the shadow registers after Calendar 
*         initialization, Calendar update or after wakeup from low power modes 
*         the software must first clear the RSF flag. 
*         The software must then wait until it is set again before reading 
*         the Calendar (if not yet done), which means that the Calendar registers
*         have been correctly copied into the RTC_TRx and RTC_DRx shadow registers.
* @note   RTC_SetTime() and RTC_SetDate() functions call RTC_WaitForSynchro() function
*         after updating the Calendar. In Run mode, User can use RTC_GetDate(), 
*         RTC_GetTime() and/or RTC_GetSubSecond() without need to call 
*         RTC_WaitForSynchro() function. After waking up from low power mode, this 
*         function must be called before calling RTC_GetDate(), RTC_GetTime() or 
*         RTC_GetSubSecond() functions.   
* @param  None
* @retval An ErrorStatus enumeration value:
*          - SUCCESS: RTC registers are synchronized
*          - ERROR: RTC registers are not synchronized
*/
ErrorStatus RTC_WaitForSynchro(void)
{
  uint16_t rsfcount = 0;
  ErrorStatus status = ERROR;
  
  /* Disable the write protection for RTC registers */
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;

  /* Clear RSF flag by writing 0 in RSF bit  */
  RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);

  /* Wait the registers to be synchronised */
  while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
  {
    rsfcount++;
  }

  /* Check if RSF flag occurs*/
  if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
  {
    status = SUCCESS;
  }
  else
  {
    status = ERROR;
  }

  /* Enable the write protection for RTC registers */
  RTC->WPR = 0xFF; 
  
  return (ErrorStatus)status;
}

/**
* @brief  Initializes the RTC registers according to the specified parameters
*         in RTC_InitStruct.
* @param  RTC_InitStruct: pointer to a RTC_InitTypeDef structure that contains
*         the configuration information for the RTC peripheral.
* @note   The RTC Prescaler register is write protected and can be written in 
*         initialization mode only.  
* @retval An ErrorStatus enumeration value:
*          - SUCCESS: RTC registers are initialized
*          - ERROR: RTC registers are not initialized
*/
ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
{
  ErrorStatus status = ERROR;

  /* Check the parameters */
  assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
  assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
  assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));

  /* Disable the write protection for RTC registers */
  RTC->WPR = 0xCA;
  RTC->WPR = 0x53;

  /* Set Initialization mode */
  if (RTC_EnterInitMode() == ERROR)
  {
    status = ERROR;
  }
  else
  {
    /* Clear the bits to be configured first */
    RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));

    /* Set RTC_CR1 register */
    RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));

    /* Set Prescalers registers */
    RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
    RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
    RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);

    /* Exit Initialization mode */
    RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;

    status = SUCCESS;
  }

  /* Enable the write protection for RTC registers */
  RTC->WPR = 0xFF; 

  /* return Initialize the RTC registers status*/
  return (ErrorStatus)(status);
}
#endif

/***********************************************/
/* 日历配置
函数名: Calendar_Init
入	参: 无
出	参: 无
返回值: 0~3
修改人: maronglang
日	期: 2015.12.23
*//*********************************************/
void Calendar_Init(void)
{ 
  RTC_DateStr.RTC_WeekDay = RTC_Weekday_Monday;
  RTC_DateStr.RTC_Date = 28;
  RTC_DateStr.RTC_Month = RTC_Month_December;
  RTC_DateStr.RTC_Year = 15;
  RTC_SetDate(RTC_Format_BIN, &RTC_DateStr);

  RTC_TimeStr.RTC_H12 = RTC_H12_AM;
  RTC_TimeStr.RTC_Hours   = 01;
  RTC_TimeStr.RTC_Minutes = 00;
  RTC_TimeStr.RTC_Seconds = 00;
  RTC_SetTime(RTC_Format_BIN, &RTC_TimeStr);
}


/***********************************************/
/* RTC时钟配置初始化
函数名: STM8_RTC_Init
入	参: 无
出	参: 无
返回值: 无
修改人: maronglang
日	期: 2015.12.23
*//*********************************************/
void  STM8_RTC_Init(void)
{	
	TM_Time stTmTime;
	ST_Time stTime;


#ifdef RTC_LSI	
	/* Enable LSI */
	CLK_LSICmd(ENABLE);

	/* Wait for LSI clock to be ready */
	while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET)
	{}
	
	/* Select LSE (32 KHz) as RTC clock source */
	CLK_RTCClockConfig(CLK_RTCCLKSource_LSI, CLK_RTCCLKDiv_1);
#else
	/* Enable LSE */
	CLK_LSEConfig(CLK_LSE_ON);

	/* Wait for LSE clock to be ready */
	while (CLK_GetFlagStatus(CLK_FLAG_LSERDY) == RESET)
	{}

	/* Select LSE (32.768 KHz) as RTC clock source */
	CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);
#endif

	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);

	RTC_InitStr.RTC_HourFormat = RTC_HourFormat_24;
	RTC_InitStr.RTC_AsynchPrediv = 0x7F;
	RTC_InitStr.RTC_SynchPrediv = 0x00FF;
	RTC_Init(&RTC_InitStr);
	
	/* Wait for RTC APB registers synchronisation */
	RTC_WaitForSynchro();

	STM8_RTC_Get(&stTime);
	TM_TimeChangeAToB(&stTime, &stTmTime);		
	if ((stTmTime.wYear < 2015)||(TM_IsValidTimePro(&stTmTime) == FALSE))
	{
		Calendar_Init();
	}
	return ;
}

/***********************************************/
/* RTC获取时间接口
函数名: STM8_RTC_Get
入	参: 无
出	参: 无
返回值: 无
修改人: maronglang
日	期: 2015.12.23
*//*********************************************/
void  STM8_RTC_Get(ST_Time *pStTimeNow)
{	
	uint8_t tmpreg = 0;
	RTC_TimeTypeDef stTmpTime;
	RTC_DateTypeDef stTmpDate;
	
	//RTC_GetTime(RTC_Format_BCD, &stTmpTime);
	//RTC_GetDate(RTC_Format_BCD, &stTmpDate);

	/* Fill the structure fields with the read parameters */
	/* Get RTC seconds */
	stTmpTime.RTC_Seconds = RTC->TR1;	
	/* Get RTC Minutes */
	stTmpTime.RTC_Minutes = RTC->TR2;
	/* Get the RTC_TR3 register */
	tmpreg = (uint8_t)RTC->TR3;
	/* Read DR3 register to unfreeze calender registers */
	(void) (RTC->DR3) ;
	/* Get RTC Hours */
	stTmpTime.RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
	/* Get RTC H12 state */
	stTmpTime.RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
	
	/* Fill the structure fields with the read parameters */
	(void) (RTC->TR1) ;
	stTmpDate.RTC_Date = (uint8_t)(RTC->DR1);
	tmpreg = (uint8_t)RTC->DR2;
	stTmpDate.RTC_Year = (uint8_t)(RTC->DR3);	
	stTmpDate.RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
	stTmpDate.RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);

	pStTimeNow->wYear   = stTmpDate.RTC_Year;
	pStTimeNow->nMonth  = stTmpDate.RTC_Month;
	pStTimeNow->nDay	= stTmpDate.RTC_Date;
	pStTimeNow->nHour   = stTmpTime.RTC_Hours;
	pStTimeNow->nMinute = stTmpTime.RTC_Minutes;
	pStTimeNow->nSecond = stTmpTime.RTC_Seconds;
	pStTimeNow->nWeek   = stTmpDate.RTC_WeekDay;
}

/***********************************************/
/* RTC时钟设置接口
函数名: STM8_RTC_Set
入	参: 无
出	参: 无
返回值: 无
修改人: maronglang
日	期: 2015.12.23
*//*********************************************/
u8  STM8_RTC_Set(ST_Time *time)
{	
	RTC_TimeTypeDef stTmpTime;
	RTC_DateTypeDef stTmpDate;
	TM_Time stTmTime;

	TM_TimeChangeAToB(time, &stTmTime);		
	if (TM_IsValidTimePro(&stTmTime) == FALSE)
	{
		return (FALSE);
	}
	
	stTmpDate.RTC_Year    = time->wYear;
	stTmpDate.RTC_Month   = time->nMonth;
	stTmpDate.RTC_Date    = time->nDay;
	stTmpTime.RTC_Hours   = time->nHour;
	stTmpTime.RTC_Minutes = time->nMinute;
	stTmpTime.RTC_Seconds = time->nSecond;
	
	stTmTime.nWeek  = TM_DayOfWeek(&stTmTime);
	if(1 == stTmTime.nWeek)
	{
		stTmpDate.RTC_WeekDay = 7;
	}
	else
	{
		stTmpDate.RTC_WeekDay = stTmTime.nWeek-1;
	}

	RTC_SetTime(RTC_Format_BCD, &stTmpTime);
	RTC_SetDate(RTC_Format_BCD, &stTmpDate);

	/* Wait for RTC APB registers synchronisation */
	RTC_WaitForSynchro();
	
	return TRUE;
}

