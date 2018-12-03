/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : STM8_Rtc.h
* Author            : maronglang
* Date First Issued : 2015/12/23
* Description       : 内部RTC时钟接口函数头文件
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef __STM8_RTC_H__
#define __STM8_RTC_H__
#include "global.h"

#define TEN_VALUE_BCD      ((uint8_t)0x10)
#define TEN_VALUE_BIN      ((uint8_t)0x0A)
#define RSF_TIMEOUT        ((uint16_t)0xFFFF)
#define WUTWF_TIMEOUT      ((uint16_t)0xFFFF)
#define INITF_TIMEOUT      ((uint16_t)0xFFFF)


void  STM8_RTC_Init(void);
void  STM8_RTC_Get(ST_Time *pStTimeNow);
u8    STM8_RTC_Set(ST_Time *time);
ErrorStatus RTC_WaitForSynchro(void);

#endif /* __STM8_RTC_H__ */
