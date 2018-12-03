/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : JX_Maht.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ������ѧ�⺯��
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/
#include "JX_Math.h"
//#include <string.h>

#if 1
/* Private variables ----------------------------------------------------------*/
static const uint8_t m_nMonthMaxDaysTab[2][12] = {
	{31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}, // ƽ��
	{31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}  // ����
};

/**********************************************/
/* �ڴ濽��
������: MemsetFunc
��  ��:  srcstr,size
��  ��: destr
����ֵ: char
�޸���: rlma
��  ��: 2013.9.10
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
/* �ڴ�����
������: MemsetFunc
��  ��:  srcstr,size
��  ��: destr
����ֵ: char
�޸���: rlma
��  ��: 2013.9.10
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
/* ��ʱ���㣬16M��16�οղ�������1us
������: main
��  ��: ��
��  ��: ��
����ֵ: void
�޸���: rlma
��  ��: 2013.9.10
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
/* ��ʱ���㣬ms��
������: main
��  ��: ��
��  ��: ��
����ֵ: void
�޸���: rlma
��  ��: 2013.9.10
*//*********************************************/
void delay_ms(u16 ms)
{
  unsigned int i;
	
  for(i=0;i<ms;i++)
  {
		delay_us(1000);
  }
}

/************************** ʱ�����ݳ������������ *****************************/
/**
  * @brief    : ����ʱ�䡢�����Ƿ�Ϸ�����
  * @param    : time - ����ʱ��
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

/************************** ʱ������ƫ����������� *****************************/
/**
  * @brief    : �����2000��1��1��,00:00:00�����ھ���������
  * @param    : timeNow - ����ʱ��
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
  * @brief    : �����2000��1��1��,00:00:00�����ھ���������  
  * @param    : timeNow - ����ʱ��
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
  * @brief    : ��������ʱ��ƫ��
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
  * @brief	: ʱ���ʽת�� (��������BIN - BCD)
  * @param	: pstTimeA   - ʱ��A
  *			  pstTimeB   - ʱ��B
  * @retval	: FALSE ʧ��   TRUE �ɹ�
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
  * @brief	: ʱ���ʽת�� (ȥ������BCD - BIN)
  * @param	: pstTimeA   - ʱ��A
  *			  pstTimeB   - ʱ��B
  * @retval	: FALSE ʧ��   TRUE �ɹ�
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
  * @brief    : ������������ʱ�����ڼ�
  * @param    : timeNowE - timeNowS 
  * @retval   : 1 = Sunday, 2 = Monday, ..., 7 = Saturday(ע1�������죬7��������)
  */
uint8_t  TM_DayOfWeek(const TM_Time *time)
{
	uint32_t  dwDays = TM_CalPastedDays(time);
	uint8_t   nWeek  = (uint8_t)(dwDays % 7);
	
	// 2000/1/1�������� ��ʱ��6��ʾ
	nWeek = (nWeek + 6) % 7;
	return (nWeek + 1);
}


/**
  * @brief    : ���ݴ�2000��1��1��,00:00:00�����ھ�������������ʵʱ��
  * @param    : dwSeconds - ��2000��1��1��,00:00:00�����ھ���������
  *             pTime     - ʵʱ�����
  * @retval   : None
  */
void  TM_SecondsToTime(uint32_t  dwSeconds, TM_Time  *pTime)
{
	int32_t   year=2000, month=1, day=1, hour=0, minute=0, second=0;
	uint32_t  delta;
	uint8_t   MonthTab[13] = {0, 31,28,31,30,31,30,31,31,30,31,30,31};


	while (dwSeconds > 0)
	{
		if ((year%4==0 && year%100!=0) || year%400==0)   //����
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
			if (((year%4 == 0) && (year%100 != 0)) || (year%400 == 0))   //����
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
  * @brief    : ʵʱ�Ӽ�n��
  * @param    : time - ����ʱ��
  * @retval   : None
  * @note     : ȱ��-��Ҫ��������!!!
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
  * @brief    : ʵʱ�Ӽ�n����
  * @param    : time - ����ʱ��
  * @retval   : None
  * @note     : ȱ��-��Ҫ��������!!!
  */
void  TM_RTimeAddnMinute(TM_Time  *time, uint32_t  nAddMinuts)
{
    uint32_t  nPastSeconds;
		
	nPastSeconds = TM_CalPastedSeconds(time);
	
	nPastSeconds += (nAddMinuts * 60);
	TM_SecondsToTime(nPastSeconds, time);
}

/**
  * @brief    : ʵʱ�Ӽ�n����
  * @param    : time - ����ʱ��
  * @retval   : None
  * @note     : ȱ��-��Ҫ��������!!!
  */
void  TM_RTimeDecnMinute(TM_Time  *time, uint32_t  nDecMinuts)
{
    uint32_t  nPastSeconds;
		
	nPastSeconds = TM_CalPastedSeconds(time);
	
	nPastSeconds -= (nDecMinuts * 60);
	TM_SecondsToTime(nPastSeconds, time);
}

/**
  * @brief    : ����ʱ�䡢�����Ƿ�Ϸ�����(��������У�� ����8025TУʱ)
  * @param    : time - ����ʱ��
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
	
	/* ������� */
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

	/* ƽ����� */
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
  * @brief    : �ַ����ַ���ת����ʮ��������
  * @param    : 
  * @retval   : None
  * note      : "XX" -> 0xXX, �磺"9A" -> 0x9A
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
/* �ڴ�����
������: MemsetFunc
��  ��:  srcstr,size
��  ��: destr
����ֵ: char
�޸���: rlma
��  ��: 2013.9.10
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
/* ���ַ���ת����BCD��
������: JX_AsciiToBuf
��  ��: ppASCII_Buf pnOutBuf
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.05.12
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
/* ���ַ���ת������ֵ "100"->0x64 ������С��255
������: JX_BcdStrToByte
��  ��: pnRxBuf nLen
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.12
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
/* ����ֵת�����ַ��� 0x64->"100" ������С��255
������: JX_ByteToBcdStr
��  ��: pnRxBuf nDat
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.12
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
  * @brief    : ʮ������ת�����ַ���
  * @param    : 
  * @retval   : None
  * note      : ��: 0x12 34 56 78 -> "12345678"
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
  * @brief    : ���ַ���ת����16λ����
  * @param    : pStr �ַ�ָ��  nLen �ַ�������
  * @retval   : Void
  *  note     : �ַ�����:  
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
  * @brief    : ���ַ���ת����16λ����
  * @param    : pStr �ַ�ָ��  nLen �ַ�������
  * @retval   : Void
  *  note     : �ַ�����:  
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

/************************* �Զ����ڴ������ **********************************/
/**
  * @brief    : �ڴ�ǰ��Ե���������
  * @param    : pnBuf --- Ŀ��������棬nLen --- Ŀ�껺�泤��
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
  * @brief    : �ڴ�ǰ��Ե���������4�ֽ�Ϊ��λ
  * @param    : pnBuf --- Ŀ��������棬nLen --- Ŀ�껺�泤��
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
  * @brief    :8λ����У��ͼ���
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
  * @brief    : �жϻ���ռ��������ֵ
  * @param    : nMatchDat --- �������棬nMatchLen --- �������泤��
  *             nFillDat - �ȶԵ������ֵ
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
  * @brief    : IP��ַת��Ϊ�ַ���
  * @param    : 
  * @retval   : None
  * note      : ��:C0 A8 01 01 -> "192.168.1.1" 
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
/* ��BCD��32λ��ת����32λBIN��
������: JX_DwordBcdToBin
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2016.05.30
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
/* ��32λBIN��ת����BCD��
������: JX_DWORDToBCD
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.10.31
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
/* ��32λ��ת�����ַ���
������: JX_U32ToStr
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.10.31
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
  * @brief    : ˫����������BCDת��
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
/* ��������ת����BIN�� ����������ʽת���� 3.123->3123
������: JX_DwordBcdToBin
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2016.05.30
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
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
