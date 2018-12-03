/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : JX_Maht.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 常用数学库函数
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/
#include "JX_Math.h"
//#include <string.h>

#if 1
/* Private variables ----------------------------------------------------------*/
static const uint8_t m_nMonthMaxDaysTab[2][12] = {
	{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}, // 平年
	{31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}  // 闰年
};

/**********************************************/
/* 内存拷贝
函数名: MemsetFunc
入  参:  srcstr,size
出  参: destr
返回值: char
修改人: rlma
日  期: 2013.9.10
*//*********************************************/
u8 MemcpyFunc(u8 *pnDeStr, u8 *pnSrcStr, u8 nSize)
{
	u8 nLoop=0;
	for(nLoop=0; nLoop<nSize; nLoop++)
	{
		pnDeStr[nLoop] = pnSrcStr[nLoop];
	}
	return nLoop;
}

/**********************************************/
/* 内存清零
函数名: MemsetFunc
入  参:  srcstr,size
出  参: destr
返回值: char
修改人: rlma
日  期: 2013.9.10
*//*********************************************/
u8 MemsetFunc(u8 *pnDeStr, u8 nVal, u8 nSize)
{
	u8 nLoop=0;
	for(nLoop=0; nLoop<nSize; nLoop++)
	{
		pnDeStr[nLoop] = nVal;
	}
	return nLoop;
}

/**********************************************/
/* 延时计算，16M即16次空操作等于1us
函数名: main
入  参: 无
出  参: 无
返回值: void
修改人: rlma
日  期: 2013.9.10
*//*********************************************/
void delay_us(unsigned int us)
{
  unsigned int i;
  unsigned int j;
	
  for(i=0;i<us;i++)
  {
		for(j=0;j<16;j++)
		{
			nop();
		}
  }
}

/**********************************************/
/* 延时计算，ms级
函数名: main
入  参: 无
出  参: 无
返回值: void
修改人: rlma
日  期: 2013.9.10
*//*********************************************/
void delay_ms(u16 ms)
{
  unsigned int i;
	
  for(i=0;i<ms;i++)
  {
		delay_us(1000);
  }
}

/************************** 时间数据长度运算操作库 *****************************/
/**
  * @brief    : 输入时间、日期是否合法数据
  * @param    : time - 输入时刻
  * @retval   : TRUE/FALSE
  */
u8 TM_IsValidDate(const TM_Time *time)
{
	if ((time == NULL) || (time->wYear > JX_MAX_VALID_YEAR) || (time->wYear < JX_MIN_VALID_YEAR) ||
         (time->nMonth > 12) || (time->nMonth < 1) ||
          (time->nDay > 31) || (time->nDay < 1))
	{
		return (FALSE);  
	}
	return (TRUE);
}

/************************** 时间数据偏差运算操作库 *****************************/
/**
  * @brief    : 计算从2000年1月1日,00:00:00到现在经过的天数
  * @param    : timeNow - 输入时刻
  * @retval   : 
  */
uint32_t  TM_CalPastedDays(const TM_Time *timeNow)
{
	uint16_t  Year[2] = {365, 366};
	uint32_t  dwPastDays = 0;
	uint16_t  i = 2000, j;
	uint8_t   nLoopYear = 0;

	if (TM_IsValidDate(timeNow) == FALSE)
	{
		 return (0);
	}

	do 
	{
		nLoopYear = ((i%4 == 0) && ((i%100 != 0) || (i%400 == 0))) ? 1:0;
	
		if (i < timeNow->wYear)
		{
			dwPastDays += Year[nLoopYear];
		}
		else
		{
			for (j=1; j<timeNow->nMonth; j++)
			{
				dwPastDays += m_nMonthMaxDaysTab[nLoopYear][j-1];
			}
			dwPastDays += (timeNow->nDay-1);
		}

		i += 1;
	}while (i <= timeNow->wYear);
	
	return (dwPastDays);
}

/**
  * @brief    : 计算从2000年1月1日,00:00:00到现在经过的秒数  
  * @param    : timeNow - 输入时刻
  * @retval   : 
  */
uint32_t  TM_CalPastedSeconds(const TM_Time *timeNow)
{
    uint32_t  pastSec;

	
	if (TM_IsValidTimePro(timeNow) == FALSE)
	{
		 return (0);
	}

	pastSec = TM_CalPastedDays(timeNow) * 24 * 3600UL;
	pastSec += (timeNow->nHour * 3600UL + timeNow->nMinute * 60UL + timeNow->nSecond);

	return (pastSec);
}

/**
  * @brief    : 计算两个时间偏差
  * @param    : timeNowE - timeNowS 
  * @retval   : 
  */
int32_t  TM_DiffSecond(const TM_Time *timeNowS, const TM_Time *timeNowE)
{
	int32_t  nSecS, nSecE;

	nSecS = (int32_t)TM_CalPastedSeconds(timeNowS);
	nSecE = (int32_t)TM_CalPastedSeconds(timeNowE);

	return (nSecE - nSecS);
}


/***
  * @brief	: 时间格式转换 (增加星期BIN - BCD)
  * @param	: pstTimeA   - 时间A
  *			  pstTimeB   - 时间B
  * @retval	: FALSE 失败   TRUE 成功
***/
int32_t TM_TimeChangeAToB(ST_Time *pstTimeA, TM_Time *pstTimeB)
{
	u16 wTmp = 0;
	
	if((NULL == pstTimeA)||(NULL == pstTimeB))
	{
		return FALSE;
	}
	
	wTmp = JX_BcdToByte(pstTimeA->wYear);
	pstTimeB->wYear   = wTmp+2000;
	pstTimeB->nMonth  = JX_BcdToByte(pstTimeA->nMonth);
	pstTimeB->nDay    = JX_BcdToByte(pstTimeA->nDay);
	pstTimeB->nHour   = JX_BcdToByte(pstTimeA->nHour);
	pstTimeB->nMinute = JX_BcdToByte(pstTimeA->nMinute);
	pstTimeB->nSecond = JX_BcdToByte(pstTimeA->nSecond);
	pstTimeB->nWeek   = pstTimeA->nWeek;
	return TRUE;
}

/***
  * @brief	: 时间格式转换 (去掉星期BCD - BIN)
  * @param	: pstTimeA   - 时间A
  *			  pstTimeB   - 时间B
  * @retval	: FALSE 失败   TRUE 成功
***/
int32_t TM_TimeChangeBToA(const TM_Time *pstTimeB, ST_Time *pstTimeA)
{
	if((NULL == pstTimeA)||(NULL == pstTimeB))
	{
		return FALSE;
	}
	
	pstTimeA->wYear   = (uint8_t)JX_ByteToBcd(pstTimeB->wYear%100);
	pstTimeA->nMonth  = JX_ByteToBcd(pstTimeB->nMonth);
	pstTimeA->nDay    = JX_ByteToBcd(pstTimeB->nDay);
	pstTimeA->nHour   = JX_ByteToBcd(pstTimeB->nHour);
	pstTimeA->nMinute = JX_ByteToBcd(pstTimeB->nMinute);
	pstTimeA->nSecond = JX_ByteToBcd(pstTimeB->nSecond);
	pstTimeA->nWeek   = pstTimeB->nWeek;
	return TRUE;
}
/**
  * @brief    : 计算输入日期时刻星期几
  * @param    : timeNowE - timeNowS 
  * @retval   : 1 = Sunday, 2 = Monday, ..., 7 = Saturday(注1是星期天，7是星期六)
  */
uint8_t  TM_DayOfWeek(const TM_Time *time)
{
	uint32_t  dwDays = TM_CalPastedDays(time);
	uint8_t   nWeek  = (uint8_t)(dwDays % 7);
	
	// 2000/1/1是星期六 暂时用6表示
	nWeek = (nWeek + 6) % 7;
	return (nWeek + 1);
}


/**
  * @brief    : 根据从2000年1月1日,00:00:00到现在经过的秒数推算实时钟
  * @param    : dwSeconds - 从2000年1月1日,00:00:00到现在经过的秒数
  *             pTime     - 实时钟输出
  * @retval   : None
  */
void  TM_SecondsToTime(uint32_t  dwSeconds, TM_Time  *pTime)
{
	int32_t   year=2000, month=1, day=1, hour=0, minute=0, second=0;
	uint32_t  delta;
	uint8_t   MonthTab[13] = {0, 31,28,31,30,31,30,31,31,30,31,30,31};


	while (dwSeconds > 0)
	{
		if ((year%4==0 && year%100!=0) || year%400==0)   //闰年
			delta = 366UL*24*60*60;
		else
			delta = 365UL*24*60*60;

		if (dwSeconds < delta)
		{
			break;
		}
		else
		{
			dwSeconds -= delta;
			year++;
		}
	}
	

	while (dwSeconds > 0)
	{
		if (month == 2)
		{
			if (((year%4 == 0) && (year%100 != 0)) || (year%400 == 0))   //闰年
				delta = 29UL * 24 * 60 * 60L;
			else
				delta = 28UL * 24 * 60 * 60L;
		}
		else
		{
			delta = 60UL*MonthTab[month] * 24 * 60;
		}
		
		if (dwSeconds < delta)
		{
			break;
		}
		else
		{
			dwSeconds -= delta;
			month++;
		}
	}

	if (dwSeconds > 0)
	{
		day = dwSeconds / (24UL * 60 * 60L);
		dwSeconds -= (day * 24UL * 60 * 60L);
		day++;
		
		if (dwSeconds > 0)
		{
			hour = dwSeconds / (60 * 60L);
			dwSeconds -= (hour * 60 * 60L);
			
			if (dwSeconds > 0)
			{
				minute = dwSeconds / 60;
				second = dwSeconds - minute * 60L;
			}
		}
	}
	
	pTime->wYear   = year;
	pTime->nMonth  = month;
	pTime->nDay    = day;
	pTime->nHour   = hour;
	pTime->nMinute = minute;
	pTime->nSecond = second;
	pTime->nWeek   = TM_DayOfWeek(pTime);
}
#ifdef  XINJIANG_PTR
void  TM_RTimeDecnDay(TM_Time  *time, uint32_t  nAddDays)
{
    uint32_t  nPastSeconds;
		
    if (nAddDays > 0)
	{
		nPastSeconds = TM_CalPastedSeconds(time);
		
		nPastSeconds -= (nAddDays * 24 * 3600L);
		TM_SecondsToTime(nPastSeconds, time);
	}
}
#endif
/**
  * @brief    : 实时钟加n日
  * @param    : time - 输入时刻
  * @retval   : None
  * @note     : 缺点-需要大量运算!!!
  */
void  TM_RTimeAddnDay(TM_Time  *time, uint32_t  nAddDays)
{
    uint32_t  nPastSeconds;
		
    if (nAddDays > 0)
	{
		nPastSeconds = TM_CalPastedSeconds(time);
		
		nPastSeconds += (nAddDays * 24 * 3600L);
		TM_SecondsToTime(nPastSeconds, time);
	}
}

/**
  * @brief    : 实时钟加n分钟
  * @param    : time - 输入时刻
  * @retval   : None
  * @note     : 缺点-需要大量运算!!!
  */
void  TM_RTimeAddnMinute(TM_Time  *time, uint32_t  nAddMinuts)
{
    uint32_t  nPastSeconds;
		
	nPastSeconds = TM_CalPastedSeconds(time);
	
	nPastSeconds += (nAddMinuts * 60);
	TM_SecondsToTime(nPastSeconds, time);
}

/**
  * @brief    : 实时钟减n分钟
  * @param    : time - 输入时刻
  * @retval   : None
  * @note     : 缺点-需要大量运算!!!
  */
void  TM_RTimeDecnMinute(TM_Time  *time, uint32_t  nDecMinuts)
{
    uint32_t  nPastSeconds;
		
	nPastSeconds = TM_CalPastedSeconds(time);
	
	nPastSeconds -= (nDecMinuts * 60);
	TM_SecondsToTime(nPastSeconds, time);
}

/**
  * @brief    : 输入时间、日期是否合法数据(增加星期校验 用于8025T校时)
  * @param    : time - 输入时刻
  * @retval   : None
  */
u8  TM_IsValidTimePro(const TM_Time *time)
{
    const uint8_t nCommYearDayBuf[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
    const uint8_t nLeapYearDayBuf[12] = {31,29,31,30,31,30,31,31,30,31,30,31};
	
	if ((time->wYear > JX_MAX_VALID_YEAR) || (time->wYear < JX_MIN_VALID_YEAR) ||
         (time->nMonth > 12) || (time->nMonth < 1) ||
          (time->nDay > 31) || (time->nDay < 1) ||
           (time->nHour > 23) || (time->nMinute > 59) || (time->nSecond > 59)
           )//||(time->nWeek != TM_DayOfWeek(time))
	{
		return (FALSE);
	}
	
	/* 闰年计算 */
	if( ((time->wYear%4==0) && (time->wYear%100!=0)) || (time->wYear%400==0))
	{
		if(time->nDay > nLeapYearDayBuf[time->nMonth-1])
		{
			return (FALSE);
		}
		else
		{
			return (TRUE);
		}
	}

	/* 平年计算 */
	if(time->nDay > nCommYearDayBuf[time->nMonth-1])
	{
		return (FALSE);
	}
	
	return (TRUE);

}

#if  0
void  TM_RTimeDecMonth(TM_Time  *time, u8 nMonth)
{
	u8 i = 0;
	
	for(i = 0; i < nMonth; i++)
	{
		time->nMonth--;
		if(time->nMonth <= 0) 
		{
			time->nMonth = 12;
			time->wYear--;
		}
	}
}

void  TM_RTimeDecnDay(TM_Time  *time, uint32_t  nAddDays)
{
    uint32_t  nPastSeconds;
		
    if (nAddDays > 0)
	{
		nPastSeconds = TM_CalPastedSeconds(time);
		
		nPastSeconds -= (nAddDays * 24 * 3600L);
		TM_SecondsToTime(nPastSeconds, time);
	}
}

/**
  * @brief    : 字符型字符串转换成十六进制数
  * @param    : 
  * @retval   : None
  * note      : "XX" -> 0xXX, 如："9A" -> 0x9A
  */
uint8_t JX_AsciiToByte(uint8_t** pp)
{
	uint8_t  *p = *pp;
	uint8_t  hi, lo;

	if (*p>='A' && *p<='F')
		hi = *p - 'A' + 0x0a;
	else if (*p>='a' && *p<='f')
		hi = *p - 'a' + 0x0a;
	else
		hi = *p - '0';

	p++;

	if (*p>='A' && *p<='F')
		lo = *p - 'A' + 0x0a;
	else if (*p>='a' && *p<='f')
		lo = *p - 'a' + 0x0a;
	else
		lo = *p - '0';

	p++;

	*pp = p;

	return ((hi << 4) | lo);
}
/**********************************************/
/* 内存清零
函数名: MemsetFunc
入  参:  srcstr,size
出  参: destr
返回值: char
修改人: rlma
日  期: 2013.9.10
*//*********************************************/
u8 MemsetFunc(u8 *pnDeStr, u8 nVal, u8 nSize)
{
	u8 nLoop=0;
	for(nLoop=0; nLoop<nSize; nLoop++)
	{
		pnDeStr[nLoop] = nVal;
	}
	return nLoop;
}

#endif


/**********************************************/
/* 将字符串转换成BCD码
函数名: JX_AsciiToBuf
入  参: ppASCII_Buf pnOutBuf
出  参: void
返回值: u8
修改人: maronglang
日  期: 2016.05.12
*//*********************************************/
uint8_t JX_AsciiToBuf(uint8_t* ppASCII_Buf, uint8_t *pnOutBuf)
{
	uint8_t  *p = ppASCII_Buf, *pOutByte = pnOutBuf;
	uint8_t  nTransLen = 0, nTempByte = 0;

	while (1)
	{
		if (*p >= 'A' && *p <= 'F')
		{
			nTempByte = *p - 'A' + 0x0a;
		}
		else if (*p >= 'a' && *p <= 'f')
		{
			nTempByte = *p - 'a' + 0x0a;
		}
		else if (*p >= '0' && *p <= '9')
		{
			nTempByte = *p - '0';
		}
		else
		{
			break;
		}

		if ((nTransLen%2) == 0)
		{
			nTempByte <<= 4;
		}
		pOutByte = pnOutBuf + (nTransLen / 2);
		*pOutByte |= nTempByte;

		nTransLen++;			
		p++;  
	}
	
	//*ppASCII_Buf = p;
	return (nTransLen);
}

/**********************************************/
/* 将字符串转换成数值 "100"->0x64 仅限于小于255
函数名: JX_BcdStrToByte
入  参: pnRxBuf nLen
出  参: void
返回值: u8
修改人: maronglang
日  期: 2015.09.12
*//*********************************************/
u8 JX_BcdStrToByte(u8* pnRxBuf, u8 nLen)
{
	u8 i =0, nData = 0, nIndex = 1, j = 0;

	JX_BL_Change(nLen, pnRxBuf);
	for(i = 0; i < nLen; i++)
	{
		nIndex = 1;
		for(j = 0; j < i; j++)
		{
			nIndex = nIndex*10;
		}
		
		nData += (pnRxBuf[i]-'0')*nIndex;
	}
	
	return nData;	
}

/**********************************************/
/* 将数值转换成字符串 0x64->"100" 仅限于小于255
函数名: JX_ByteToBcdStr
入  参: pnRxBuf nDat
出  参: void
返回值: u8
修改人: maronglang
日  期: 2015.09.12
*//*********************************************/
u8 JX_ByteToBcdStr(u8 nDat, u8* pnRxBuf)
{
	u8 i =0;

	if(0 != nDat/100)
	{
		pnRxBuf[i++] = '0'+nDat/100;
		pnRxBuf[i++] = '0'+(nDat%100)/10;
		pnRxBuf[i++] = '0'+nDat%10;
	}
	else
	{
		if(0 != nDat/10)
		{
			pnRxBuf[i++] = '0'+nDat/10;
			pnRxBuf[i++] = '0'+nDat%10;
		}
		else
		{
			pnRxBuf[i++] = '0'+nDat%10;
		}
	}
	
	return i;	
}

/**
  * @brief    : 十六进制转换成字符串
  * @param    : 
  * @retval   : None
  * note      : 如: 0x12 34 56 78 -> "12345678"
  */
uint32_t  JX_HexToASCII(uint8_t* in, uint8_t* out, uint16_t wInLen)
{
	uint8_t   b, hi, lo;
	uint32_t  i;


	if ((in == NULL) || (wInLen > 16384) || (in == NULL))
	{
		return (0);
	}

    for (i=0; i<wInLen; i++)
    {
		b = *in++;
		hi = b >> 4;
		lo = b & 0x0f;

		if (hi >= 0x0a)
			*out++ = hi - 0x0a + 'A';
		else
			*out++ = hi + '0';

		if (lo >= 0x0a)
			*out++ = lo - 0x0a + 'A';
		else
			*out++ = lo + '0';

        //*out++ = ' ';
	}
	*out = 0;

	return  ((uint32_t)wInLen*2L);
}


/**
  * @brief    : 将字符串转换成16位数据
  * @param    : pStr 字符指针  nLen 字符串长度
  * @retval   : Void
  *  note     : 字符类型:  
  */
u16 JX_BcdStrTo16BitBin(uint8_t *pStr, u8 nLen)
{
	u16 i =0, wData = 0, wIndex = 1, j = 0;

	JX_BL_Change(nLen, pStr);
	for(i = 0; i < nLen; i++)
	{
		wIndex = 1;
		for(j = 0; j < i; j++)
		{
			wIndex = wIndex*10;
		}
		
		wData += (pStr[i]-'0')*wIndex;
	}

	return wData;
}
/**
  * @brief    : 将字符串转换成16位数据
  * @param    : pStr 字符指针  nLen 字符串长度
  * @retval   : Void
  *  note     : 字符类型:  
  */
u16 JX_BcdStrTo16BitBcd(uint8_t *pStr, u8 nLen)
{
	u16 wData = 0, wIndex = 1, j = 0;

	JX_BL_Change(nLen, pStr);
	for(j = 0; j < nLen; j++)
	{
		if (*pStr>='A' && *pStr<='F')
			wIndex = *pStr - 'A' + 0x0a;
		else if (*pStr>='a' && *pStr<='f')
			wIndex = *pStr - 'a' + 0x0a;
		else
			wIndex = *pStr - '0';
		
		wData |= (wIndex<<(j*4));
		pStr++;
	}
	return wData;
}

/************************* 自定义内存操作库 **********************************/
/**
  * @brief    : 内存前后对调调整函数
  * @param    : pnBuf --- 目标调整缓存，nLen --- 目标缓存长度
  * @retval   : None
  */
void JX_BL_Change(uint16_t nLen, uint8_t* pnBuf)
{
	uint32_t   i, dwPtr = 0;
	uint16_t   wMiddleLen;
	uint8_t    nTemp;

	if ((nLen >= 2) && (nLen < 32768))
	{
		wMiddleLen = (nLen/2) + (nLen%2);
		for (i=0; i<wMiddleLen; i++)
		{
			nTemp = pnBuf[dwPtr];
			pnBuf[dwPtr] = pnBuf[nLen-dwPtr-1];
			pnBuf[nLen-dwPtr-1] = nTemp;

			dwPtr++;
		}
	}
}

/**
  * @brief    : 内存前后对调调整函数4字节为单位
  * @param    : pnBuf --- 目标调整缓存，nLen --- 目标缓存长度
  * @retval   : None
  */
void JX_BL_DwordChange(uint16_t nLen, uint32_t* pdwBuf)
{
	uint32_t   i, dwPtr = 0;
	uint16_t   wMiddleLen;
	uint32_t    dwTemp;

	if ((nLen >= 2) && (nLen < 32768))
	{
		wMiddleLen = (nLen/2) + (nLen%2);
		for (i=0; i<wMiddleLen; i++)
		{
			dwTemp = pdwBuf[dwPtr];
			pdwBuf[dwPtr] = pdwBuf[nLen-dwPtr-1];
			pdwBuf[nLen-dwPtr-1] = dwTemp;
			dwPtr++;
		}
	}
}

/**
  * @brief    :8位算术校验和计算
  * @param    : 
  * @retval   : 
  *  note     : 
  */
uint8_t  JX_AddSum8Bit(uint8_t  *nSumDat, uint16_t  wSumDatLen)
{
	uint16_t  i, wData = 0;

	for (i=0; i<wSumDatLen; i++)
	{
		wData += nSumDat[i];
	}
	return (u8)(wData);
}

/**
  * @brief    : 判断缓存空间填充数据值
  * @param    : nMatchDat --- 搜索缓存，nMatchLen --- 搜索缓存长度
  *             nFillDat - 比对的填充数值
  * @retval   : TRUE / FALSE
  */
u8  JX_IsAllFillDat(uint8_t  *nMatchDat, uint8_t nFillDat, uint32_t  nMatchLen)
{
	uint32_t  i;

	for (i=0; i<nMatchLen; i++)
	{
		if (nMatchDat[i] != nFillDat)
		{
			return (FALSE);
		}
	}
	return (TRUE);
}

/**
  * @brief    : IP地址转换为字符串
  * @param    : 
  * @retval   : None
  * note      : 如:C0 A8 01 01 -> "192.168.1.1" 
  */
u8  JX_IpAddrToStr(uint8_t *pnIPStr, uint8_t pnIPAddr[4])
{
	u8 i = 0, nStrLen = 0, nOffset = 0;
	u8 nBuf[4] = {0};
	
	if ((pnIPStr == NULL) || (pnIPAddr == NULL))
	{
		return (FALSE);
	}

	pnIPStr[31] = 0;
	for (i=0; i<4; i++)
	{
		nStrLen = JX_ByteToBcdStr(pnIPAddr[i], nBuf);
		MemcpyFunc(&pnIPStr[nOffset], nBuf, nStrLen);
		nOffset +=nStrLen;
		if(i < 3)
		{
			pnIPStr[nOffset] = '.';
			nOffset++;
		}		
	}

	return (TRUE);
}

uint8_t  JX_BcdToByte(uint8_t  bcd) 
{
	return (((bcd >> 4) & 0x0F) * 10 + (bcd & 0x0F));
}
uint8_t  JX_ByteToBcd(uint8_t  b)
{
	return ((b/10<<4) + b%10);
}
/**********************************************/
/* 将BCD码32位数转换成32位BIN码
函数名: JX_DwordBcdToBin
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2016.05.30
*//*********************************************/
u32 JX_DwordBcdToBin(u32 dwBcd)  
{  
	u32 dwBin = 0, dwRate = 1, dwBit = 0;  
	u8   i = 0, j = 0;  

	for(i = 0; i < 8; i++) 
	{ 
		dwRate = 1;
		for(j = 1; j <= i; j++) 
		{
			dwRate *=10;
		}
		
		dwBit = ((dwBcd >> (4*i))&0x0F);
		if(dwBit)
		{
			dwBin += (dwRate*dwBit);
		}		
	}
	return dwBin;
}  
/**********************************************/
/* 将32位BIN码转换成BCD码
函数名: JX_DWORDToBCD
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.10.31
*//*********************************************/
void  JX_DWORDToBCD(uint32_t val, uint8_t* bcd, uint8_t len)
{
	uint32_t  power = 1, i;
	uint8_t   bHigh, bLow;

	len = (len > 4) ? 4:len;
	for (i=0; i<len; i++)
	{
		power *= 100; 
	}
	for (; len>0; len--)
	{
	    val %= power;
	    power /= 10;
		bHigh = (uint8_t )(val / power);

	    val %= power;
	    power /= 10;
		bLow = (uint8_t )(val / power);
		bcd[len - 1] = (bHigh << 4) | bLow;
	}
}

/**********************************************/
/* 将32位数转换成字符串
函数名: JX_U32ToStr
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.10.31
*//*********************************************/
void JX_U32ToStr(u32 value, char * p_str)  
{  
	const u32 base_tab[11]={1000000000,100000000,10000000,1000000,100000,10000,1000,100,10,1,0};  
	u8 count = 0,index = 0, base_index = 0;  
	u8 flag = 0;  
	char i= 0 ,j = 0;  

	while(base_tab[base_index])  
	{  
		if(value>=base_tab[base_index])  
		{  
		    p_str[index]=(unsigned char)(value/base_tab[base_index]);  
		    value-=p_str[index]*base_tab[base_index];  
		    p_str[index++]+='0';  
		    flag=1;  
		}  
		else if(flag)  
		{  
		    p_str[index++]='0';  
		}  
		base_index++;  
	}  
	p_str[index]=0;  
	if(index==0)  
	{  
		p_str[0]='0';  
		p_str[1]=0;  
		index=1;  
	}
}  

/**
  * @brief    : 双字类型数据BCD转换
  * @param    : BCD / DWROD Buffer
  * @retval   : DWORD Buffer / BCD
  */
uint32_t  JX_BcdToDWORD(uint8_t  *p, uint8_t  len)
{
	uint32_t  val = 0;
	uint8_t   *p0 = p;

	len = (len > 4) ? 4:len;
	p += (len - 1);
	for (; p>=p0; p--)
	{
		val = val * 100 + ((*p >> 4) & 0x0f) * 10 + (*p & 0x0f);
	}

	return val;
}

/**********************************************/
/* 将浮点数转换成BIN码 即浮点数格式转换成 3.123->3123
函数名: JX_DwordBcdToBin
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2016.05.30
*//*********************************************/
u32 JX_FloatToBin(float dwInDat)  
{  
	u32 dwTmpDat = 0; 
	float dwTmp = 0.0;

	dwTmp = dwInDat;
	dwTmp=dwTmp*1000;
	dwTmpDat = (u32)dwTmp;
	return dwTmpDat;
}  

#endif


/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
