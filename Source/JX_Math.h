/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : JX_Maht.h
* Author            : maronglang
* Date First Issued : 2015/12/18
* Description       : ������ѧ�⺯��ͷ�ļ�
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef __JX_MATH_H__
#define __JX_MATH_H__
#include "global.h"


//����Ϊ�궨��
//------------�Զ���ʱ�����ݽṹ
typedef struct  
{
	uint16_t  wYear;        // ��(Hex: 2000-2199)
	uint8_t   nMonth;       // ��(Hex: 01-12)
	uint8_t   nDay;         // ��(Hex: 01-31)
	uint8_t   nHour;        // ʱ(Hex: 00-23)
	uint8_t   nMinute;      // ��(Hex: 00-59)
	uint8_t   nSecond;      // ��(Hex: 00-59)
	uint8_t   nWeek;        // ����(Sun, Mon, ..., Sat)(Hex: 1-7)
}TM_Time;

typedef struct  
{
	uint8_t   wYear;        // ��(Hex: 00-99)
	uint8_t   nMonth;       // ��(Hex: 01-12)
	uint8_t   nDay;         // ��(Hex: 01-31)
	uint8_t   nHour;        // ʱ(Hex: 00-23)
	uint8_t   nMinute;      // ��(Hex: 00-59)
	uint8_t   nSecond;      // ��(Hex: 00-59)
	uint8_t   nWeek;        // ����(Sun, Mon, ..., Sat)(Hex: 1-7)
}ST_Time;

typedef struct  
{
	uint8_t   wYear;        // ��(Hex: 00-99)
	uint8_t   nMonth;       // ��(Hex: 01-12)
	uint8_t   nDay;         // ��(Hex: 01-31)
	uint8_t   nHour;        // ʱ(Hex: 00-23)
	uint8_t   nMinute;      // ��(Hex: 00-59)
	uint8_t   nSecond;      // ��(Hex: 00-59)
}SP_Time;

#define JX_MAX_VALID_YEAR   2100
#define JX_MIN_VALID_YEAR   2000

extern void delay_ms(u16 ms);
extern void delay_us(unsigned int us);
extern uint8_t MemsetFunc(u8 *pnDeStr, u8 nVal, u8 nSize);
extern uint8_t MemcpyFunc(u8 *pnDeStr, u8 *pnSrcStr, u8 nSize);
extern void JX_BL_Change(uint16_t nLen, uint8_t* pnBuf);
extern void JX_BL_DwordChange(uint16_t nLen, uint32_t* pdwBuf);
extern uint8_t JX_BcdStrToByte(u8* pnRxBuf, u8 nLen);
extern uint8_t JX_ByteToBcdStr(u8 nDat, u8* pnRxBuf);
extern uint8_t  JX_AddSum8Bit(uint8_t  *nSumDat, uint16_t  wSumDatLen);
extern uint8_t  JX_IsAllFillDat(uint8_t  *nMatchDat, uint8_t nFillDat, uint32_t  nMatchLen);

uint8_t  TM_DayOfWeek(const TM_Time *time);
u8  TM_IsValidTimePro(const TM_Time *time);
int32_t TM_TimeChangeAToB(ST_Time *pstTimeA, TM_Time *pstTimeB);
int32_t TM_TimeChangeBToA(const TM_Time *pstTimeB, ST_Time *pstTimeA);
int32_t  TM_DiffMinute(const TM_Time *timeNowS, const TM_Time *timeNowE);
uint32_t  TM_CalPastedDays(const TM_Time *timeNow);
u8 TM_IsValidDate(const TM_Time *time);
int32_t  TM_DiffSecond(const TM_Time *timeNowS, const TM_Time *timeNowE);
void  TM_RTimeAddnDay(TM_Time  *time, uint32_t  nAddDays);
void  TM_RTimeAddnMinute(TM_Time  *time, uint32_t  nAddMinuts);
void  TM_RTimeDecnMinute(TM_Time  *time, uint32_t  nDecMinuts);
uint32_t  TM_CalPastedSeconds(const TM_Time *timeNow);
void  TM_RTimeDecMonth(TM_Time  *time, u8 nMonth);
void  TM_RTimeDecnDay(TM_Time  *time, uint32_t  nAddDays);

u8  JX_IpAddrToStr(uint8_t *pnIPStr, uint8_t pnIPAddr[4]);
uint8_t  JX_BcdToByte(uint8_t  bcd);
uint8_t  JX_ByteToBcd(uint8_t  b);
void JX_U32ToStr(u32 value, char * p_str);
uint32_t  JX_HexToASCII(uint8_t* in, uint8_t* out, uint16_t wInLen);
u16 JX_BcdStrTo16BitBin(uint8_t *pStr, u8 nLen);
u16 JX_BcdStrTo16BitBcd(uint8_t *pStr, u8 nLen);
u32 JX_DwordBcdToBin(u32 dwBcd);
uint8_t JX_AsciiToBuf(uint8_t* ppASCII_Buf, uint8_t *pnOutBuf);
uint8_t JX_AsciiToByte(uint8_t** pp);
void  JX_DWORDToBCD(uint32_t val, uint8_t* bcd, uint8_t len);
uint32_t  JX_BcdToDWORD(uint8_t  *p, uint8_t  len);
u32 JX_FloatToBin(float dwInDat);


#ifdef HEDA_PTR
u8 HeDa_Get_String_len(char *str,u8 str_buf_size);
#endif

//����Ϊλ����
#endif /* __JX_MATH_H__ */
/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
