/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : File.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ���ݵĶ�д,��EEPROM/FLASH 2������,������ƽ���㷨(FLASH����)
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

//#include <string.h>
#include "file.h"
#include "JX_Math.h"
#include "GsmGlobal.h"
#include "FileGlobal.h"


#define BLOCK_OPERATION    0    /* block 0 in data eeprom memory: address is 0x1000 */

#if 1
/***********************************************/
/* ��EEPROM ��ȡ����
������: ReadGroup
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.12.18
*//*********************************************/
void ReadGroup(u8 Length, u16 Address, u8 *Data)		//��EEPROMָ����ַ��ȡN���ֽ�
{
	uint32_t add, startadd, stopadd = 0;
	uint8_t i = 0;

	startadd = Address + ((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
	stopadd = startadd + Length;
	for (add = startadd; add < stopadd; add++)
	{
		Data[i++] = (*(PointerAttr uint8_t *) (MemoryAddressCast)add); //FLASH_ReadByte(add);
	}
}
/***********************************************/
/* ��EEPROM ��ȡ����
������: ReadGroup
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.12.18
*//*********************************************/
void SaveByte(u16 Address, u8 Data)
{
	/* Wait until Flash Program area unlocked flag is set*/
	//while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_PUL) == RESET)  //FLASH_GetFlagStatus(FLASH_FLAG_PUL)
	//{}
	
	/* Unlock flash data eeprom memory */
	//FLASH_Unlock(FLASH_MemType_Data);
    FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
    FLASH->DUKR = FLASH_RASS_KEY1;
	
	/* Wait until Data EEPROM area unlocked flag is set*/
	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET)  //FLASH_GetFlagStatus(FLASH_FLAG_DUL)
	{}

	//FLASH_ProgramByte((u32)Address, Data);	
	*(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
	delay_us(150);

	/* Wait until End of high voltage flag is set*/
	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_HVOFF) == RESET)  //FLASH_GetFlagStatus(FLASH_FLAG_HVOFF)
	{}	
}

/***********************************************/
/* д��EEPROM 
������: ReadGroup
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.12.18
*//*********************************************/
void SaveGroup(u8 Length, u16 Address, u8 *Data)		//дn���ֽڵ�ָ��EEPROM��ָ����ַ
{
	u16 wLoop = 0;
		
	//FLASH_Unlock(FLASH_MemType_Program);
    //FLASH->PUKR = FLASH_RASS_KEY1;
    //FLASH->PUKR = FLASH_RASS_KEY2;
	
	/* Wait until Flash Program area unlocked flag is set*/
	//while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_PUL) == RESET)
	//{}
	
	/* Unlock flash data eeprom memory */
	//FLASH_Unlock(FLASH_MemType_Data);
    FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
    FLASH->DUKR = FLASH_RASS_KEY1;

	/* Wait until Data EEPROM area unlocked flag is set*/
	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET)
	{}

	for(wLoop = 0; wLoop < Length; wLoop++)
	{
		//FLASH_ProgramByte(wLoop+Address, Data[wLoop]);
		*(PointerAttr uint8_t*) (MemoryAddressCast)(wLoop+Address) = Data[wLoop];
		delay_us(150);
	}

	/* Wait until End of high voltage flag is set*/
	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_HVOFF) == RESET)  
	{}	
}

#endif

#ifdef ENABLE_FLASH
/*����Ϊ��������

����:		�������д洢��
����:		��
���:		��
*/
void EraseAllBlock(void)
{
	u16 index;
	index = SIZE_STORE / SIZE_BLOCK;
	while (index--)
	{
		EraseOneBlock(index * SIZE_BLOCK);		//���п����һ��
	}
}

//����Ϊ��������
void fixTimerFile(void)
{
}

void fixTaskFile(void)
{
}

void InitializeFile(void)
{
	u8 flag, first;
	u16 index;
	flag = 1;
	first = 1;
	index = 0;
	ucAddressRecord = 0;		//��ǰ��¼��ַ��0
	ucSizeRecord = 0;
	while (flag)
	{
		if (ReadByte(index) == RECORD_HEAD_0)		//�м�¼ͷ0?
		{
			index++;		//��1��ַ
			if (ReadByte(index) == RECORD_HEAD_1)		//�м�¼ͷ1?
			{
				ucAddressRecord = index + 1;		//���µ�ǰ��¼��ַ
				index += sizeof(tyRecord);			//ָ����1����¼��ַ
			}
			else
			{
				EraseAllBlock();		//ȫ������
				flag = 0;
			}
		}
		else if (ReadByte(index) == 0xff)
		{
			ucSizeRecord = index - ucAddressRecord;		//�������ǰ��¼��С
			flag = 0;
		}
		else if (first)		//��һ�ζ�?
		{
			EraseAllBlock();		//ȫ������
			flag = 0;
		}
		first = 0;
	}
}

/*����Ϊ�ӿں���

����:		����1����¼
����:		��¼ָ��
���:		��
*/
void AddRecord(u8 *Record)
{
	u8 nX;
	u16 from, to;
	to = 0;
	from = ucAddressRecord;		//��ǰ��¼��ַ
	if ( (ucAddressRecord + (ucSizeRecord * 2) + sizeof(tyRecord)) >= SIZE_STORE)
	{			//��ַ+��¼�Ѿ���?
		EraseOneBlock(to);		//������һ��
		SaveByte(to++, RECORD_HEAD_0);		//�����¼ͷ0
		SaveByte(to++, RECORD_HEAD_1);		//�����¼ͷ1
		ucAddressRecord = to;		//���¶��嵱ǰ��¼��ַ
		nX = 0;
		while (nX < (ucSizeRecord / sizeof(tyRecord)) )		//��ɾ����¼ǰ������ݸ��Ƶ�ǰ��
		{
			ReadGroup(sizeof(tyRecord), from, aucRecordBuffer);	//��1����¼������
			SaveGroup(sizeof(tyRecord), to, aucRecordBuffer);		//д1����¼��ָ��FLASH��ָ����ַ
			from += sizeof(tyRecord);
			to += sizeof(tyRecord);
			nX++;
		}
		to += SIZE_BLOCK;
		from = to & 0x80;		//ȡ��
		while (from < SIZE_STORE)
		{
			EraseOneBlock(from);		//���п����һ��
			from += SIZE_BLOCK;
		}
	}
	else
	{
		SaveGroup(sizeof(tyRecord), to, aucRecordBuffer);		//д1����¼��ָ��FLASH��ָ����ַ
	}
	ucSizeRecord += sizeof(tyRecord);		//���¶����¼����
}

/*
����:		��ĳ1����¼
����:		��¼������,��0��ʼ,��¼ָ��
���:		tyRecord
*/
void ReadRecord(u8 Index)
{
	u16 from;
	from = ucAddressRecord + Index * sizeof(tyRecord);
	ReadGroup(sizeof(tyRecord), from, (u8 *)tyRecord);	//��1����¼������
}

/*
����:		ɾ��ĳ1����¼
����:		��¼������,��0��ʼ
���:		��
*/
void DelRecord(u8 Index)
{
	u8 nX, flag;
	u16 from, to;
	to = 0;
	from = ucAddressRecord;
	if (CheckRecordFull() )		//����¼�Ƿ���?
	{
		if (ucSizeRecord == sizeof(tyRecord))		//ֻ��1����¼
		{
			EraseAllBlock();
			flag = 0;
			SaveByte(to++, RECORD_HEAD_0);		//�����¼ͷ0
			SaveByte(to++, RECORD_HEAD_1);		//�����¼ͷ1
			ucAddressRecord = to;
			ucSizeRecord = 0;
		}
		else
		{
			EraseOneBlock(to);		//������һ��
			flag = 2;		//����ʣ���
		}
	}
	else
	{
		if ( (ucAddressRecord + (ucSizeRecord * 2) - sizeof(tyRecord)) >= SIZE_STORE)
		{
			EraseOneBlock(to);		//������һ��
			flag = 2;		//����ʣ���
		}
		else
		{
			to = ucAddressRecord + ucSizeRecord;		//��λ����¼�����
			flag = 1;
		}
	}
	if (flag)		//��Ҫ�ƶ�����?
	{
		SaveByte(to++, RECORD_HEAD_0);		//�����¼ͷ0
		SaveByte(to++, RECORD_HEAD_1);		//�����¼ͷ1
		ucAddressRecord = to;		//���¶��嵱ǰ��¼��ַ
		nX = 0;
		while (nX < Index)		//��ɾ����¼ǰ������ݸ��Ƶ�ǰ��
		{
			ReadGroup(sizeof(tyRecord), from, aucRecordBuffer);	//��1����¼������
			SaveGroup(sizeof(tyRecord), to, aucRecordBuffer);		//д1����¼��ָ��FLASH��ָ����ַ
			from += sizeof(tyRecord);
			to += sizeof(tyRecord);
			nX++;
		}
		nX++;
		from += sizeof(tyRecord);		//����ɾ���ļ�¼
		while (nX < (ucSizeRecord / sizeof(tyRecord)) )		//��ɾ����¼ǰ������ݸ��Ƶ�ǰ��
		{
			ReadGroup(sizeof(tyRecord), from, aucRecordBuffer);	//��1����¼������
			SaveGroup(sizeof(tyRecord), to, aucRecordBuffer);		//д1����¼��ָ��FLASH��ָ����ַ
			from += sizeof(tyRecord);
			to += sizeof(tyRecord);
			nX++;
		}
		ucSizeRecord -= sizeof(tyRecord);		//���¶����¼����
	}
	if (flag == 2)		//����ʣ���
	{	
		to += SIZE_BLOCK;
		from = to & 0x80;		//ȡ��
		while (from < SIZE_STORE)
		{
			EraseOneBlock(from);		//���п����һ��
			from += SIZE_BLOCK;
		}
	}
}

/*
����:		����¼�Ƿ���
����:		��
���:		��
*/
u8 CheckRecordFull(void)
{
	u8 read;
	if ( (ucAddressRecord + ucSizeRecord) == SIZE_STORE)		//��¼�Ѿ���?
	{
		read = 1;
	}
	else
	{
		read = 0;
	}
	return read;
}

/*
����:		����¼����
����:		��
���:		��
*/
u8 CheckRecordNumber(void)
{
	u8 read;
	read = ucSizeRecord / sizeof(tyRecord);
	return read;
}

	#else			//EEPROM
/*����Ϊ�ӿں���
/******************************************************************************
* �� �� ��: SaveReportFlag
* ��������: �����ϱ���Ǵ�ƽ���㷨
			λ��	0123 ֵ	1111 0111 0011 0001	0000
* ��ڲ���: nReportFlg
* ʱ	��: 2015��12��30��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
void SaveReportFlag(u8 nReportFlg)
{
	u16 nX = 0, address = 0;
	Type32Bits index;

	/* add by maronglang 20150829 */
	address = ADDRESS_REPORTFLG;

	ReadGroup(sizeof(index), address, (u8 *)&index);		//��ָ��,������ƽ���㷨
	if (index.Bytes.B0 == 0xff)		//��һ��?
	{
		SaveByte(ADDRESS_REPORTFLG, nReportFlg);		//����ָ��
	}
	else if (index.Bytes.B1 == 0xff)
	{
		SaveByte(ADDRESS_REPORTFLG + 1, nReportFlg);	//����ָ��
	}
	else if (index.Bytes.B2 == 0xff)
	{
		SaveByte(ADDRESS_REPORTFLG + 2, nReportFlg);	//����ָ��
	}
	else if (index.Bytes.B3 == 0xff)
	{
		SaveByte(ADDRESS_REPORTFLG + 3, nReportFlg);	//����ָ��
	}
	else
	{
		SaveByte(ADDRESS_REPORTFLG, nReportFlg);		//����ָ��
		SaveByte(ADDRESS_REPORTFLG + 1, 0xff);		//���
		SaveByte(ADDRESS_REPORTFLG + 2, 0xff);		//���
		SaveByte(ADDRESS_REPORTFLG + 3, 0xff);		//���
	}
}

/******************************************************************************
* �� �� ��: ReadReportFlag
* ��������: ��ȡ�ϱ���־
* ��ڲ���: ��
* ʱ	��: 2015��12��30��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
u8 ReadReportFlag(void)
{
	Type32Bits index;

	ReadGroup(sizeof(index), ADDRESS_REPORTFLG, (u8 *)&index);		//��ָ��,����ƽ���㷨,�ҵ�ָ�������λ��
	if (index.Bytes.B3 < 0xff)		//������?
	{
		return index.Bytes.B3;
	}
	else if (index.Bytes.B2 < 0xff)
	{
		return index.Bytes.B2;
	}
	else if (index.Bytes.B1 < 0xff)
	{
		return index.Bytes.B1;
	}
	else if (index.Bytes.B0 < 0xff)
	{
		return index.Bytes.B0;
	}
	else		//ȫ��û����?
	{
		return 0;
	}
}

/******************************************************************************
* �� �� ��: ReadIndex
* ��������: ��ȡIndexλ��
* ��ڲ���: nIndex
* ʱ	��: 2016��6��25��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
u8 ReadIndex(u16 wAddr)
{
	u8 nIndexDat = 0;
	Type32Bits index;

	ReadGroup(sizeof(index), wAddr, (u8 *)&index);		//��ָ��,����ƽ���㷨,�ҵ�ָ�������λ��
	if (index.Bytes.B3 < 0xff)		//������?
	{
		nIndexDat = index.Bytes.B3;
	}
	else if (index.Bytes.B2 < 0xff)
	{
		nIndexDat = index.Bytes.B2;
	}
	else if (index.Bytes.B1 < 0xff)
	{
		nIndexDat = index.Bytes.B1;
	}
	else if (index.Bytes.B0 < 0xff)
	{
		nIndexDat = index.Bytes.B0;
	}
	else		//ȫ��û����?
	{
		nIndexDat = 0;
	}
	return nIndexDat;
}

/******************************************************************************
* �� �� ��: InitializeFile
* ��������: EEPROM��ʼ������ ��ȡ��ǰ��¼ָ��
* ��ڲ���: nIndex
* ʱ	��: 2015��8��29��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
void InitializeFile(void)
{	
	/* Define flash programming Time*/
	FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
	FLASH->CR1 |= (uint8_t)FLASH_ProgramTime_Standard;
		
    FLASH->DUKR = FLASH_RASS_KEY2; /* edit by maronglang Warning: keys are reversed on data memory !!! */
    FLASH->DUKR = FLASH_RASS_KEY1;
	
	/* Wait until flash Eeprom area unlocked flag is set*/
	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET) // edit by maronglang20160217
	{}

	//��ָ��,��ϸ����
	ucRecordIndex = ReadIndex(ADDRESS_INDEX);

	//��ָ��,�澯��־
	g_nRecAlmIndex = ReadIndex(ADDRESS_INDEX_ALM);
#ifndef PIEZOMETER
	//��ָ��,�ն���
	g_nDayRecIndex = ReadIndex(ADDRESS_INDEX_DAY);

	//��ָ��,�¶���
	g_nMonRecIndex = ReadIndex(ADDRESS_INDEX_MON);
#endif
}

/*
����:		�������
����:		��
���:		��
*/
void SaveParameterForType(u8* pnDat, u8 nLen, u8 nTpye)
{
  u8 nBuf[MAX_LEN+1] = {0};
		
  nBuf[nLen] = JX_AddSum8Bit(pnDat, nLen);
	MemcpyFunc(nBuf, pnDat, nLen);
	nLen = nLen + 1;
	
	if(IPANDPORT_PARA == nTpye)
	{
		SaveGroup(nLen, ADDRESS_IPPARA, nBuf);
		SaveGroup(nLen, ADDRESS_IPPARA_BK, nBuf);
		
		MemsetFunc(nBuf, 0, sizeof(nBuf));
		ReadGroup(nLen, ADDRESS_IPPARA, nBuf);
	}
	else if(APN_PARA == nTpye)
	{
		SaveGroup(nLen, ADDRESS_APN, nBuf);
		SaveGroup(nLen, ADDRESS_APN_BK, nBuf);
	}
	else if(REPORT_PARA == nTpye)
	{
		SaveGroup(nLen, ADDRESS_REPOERCYCLE, nBuf);
		SaveGroup(nLen, ADDRESS_REPOERCYCLE_BK, nBuf);		
	}
	else if(METER_PARA == nTpye)
	{
		SaveGroup(nLen, ADDRESS_PARAMETER, nBuf);
		SaveGroup(nLen, ADDRESS_PARAMETER_BK, nBuf);		
	}
	else if(LT_REP_TIME == nTpye)
	{
		SaveGroup(nLen, ADDRESS_REPORTTIME, nBuf);
		SaveGroup(nLen, ADDRESS_REPORTTIME_BK, nBuf);		
	}
	else if(OPT_VALVE_PRAA == nTpye)
	{
		SaveGroup(nLen, ADDRESS_OPTVALVE, nBuf);
		SaveGroup(nLen, ADDRESS_OPTVALVE_BK, nBuf);		
	}
	else if(TM_ADDRESS_PRAA == nTpye)
	{
		SaveGroup(nLen, ADDRESS_TMADDRESS, nBuf);
		SaveGroup(nLen, ADDRESS_TMADDRESS_BK, nBuf);		
	}
}

/*
����:		��ȡ����
����:		��
���:		��
*/
u8 ReadParameterForType(u8* pnDat, u8 nLen, u8 nTpye)
{
	u16 Address = 0, AddressBk = 0;
	u8 nBuf[MAX_LEN+1] = {0};
	
	if(IPANDPORT_PARA == nTpye)
	{
		Address   = ADDRESS_IPPARA;
		AddressBk = ADDRESS_IPPARA_BK;
	}
	else if(APN_PARA == nTpye)
	{
		Address   = ADDRESS_APN;
		AddressBk = ADDRESS_APN_BK;
	}
	else if(REPORT_PARA == nTpye)
	{
		Address   = ADDRESS_REPOERCYCLE;
		AddressBk = ADDRESS_REPOERCYCLE_BK;
	}
	else if(METER_PARA == nTpye)
	{
		Address   = ADDRESS_PARAMETER;
		AddressBk = ADDRESS_PARAMETER_BK;
	}
	else if(LT_REP_TIME == nTpye)
	{
		Address   = ADDRESS_REPORTTIME;
		AddressBk = ADDRESS_REPORTTIME_BK;
	}
	else if(OPT_VALVE_PRAA == nTpye)
	{
		Address   = ADDRESS_OPTVALVE;
		AddressBk = ADDRESS_OPTVALVE_BK;
	}
	else if(TM_ADDRESS_PRAA == nTpye)
	{
		Address   = ADDRESS_TMADDRESS;
		AddressBk = ADDRESS_TMADDRESS_BK;	
	}
	
	ReadGroup(nLen+1, Address, nBuf);	
	if(nBuf[nLen] == JX_AddSum8Bit(nBuf, nLen))
	{
		if(!JX_IsAllFillDat(nBuf, 0, nLen))
		{
			MemcpyFunc(pnDat, nBuf, nLen);
			return TRUE;
		}
	}
	else
	{
		ReadGroup(nLen+1, AddressBk, nBuf);	
		if(nBuf[nLen] == JX_AddSum8Bit(nBuf, nLen))
		{
			if(!JX_IsAllFillDat(pnDat, 0, nLen))
			{
				MemcpyFunc(pnDat, nBuf, nLen);
				return TRUE;
			}
		}
	}
	
	return FALSE;
}

#endif

/* ��¼�洢���� */
#if 1
/******************************************************************************
* �� �� ��: AddRecordFun
* ��������: ����1����¼��ƽ���㷨
			λ��	0123 ֵ	1111 0111 0011 0001	0000
* ��ڲ���: nIndex
* ʱ	��: 2016��07��13��09:37:00
* �� �� ��: maronglang
*******************************************************************************/
void AddRecordFun(u8 *Record, u8 nLen, u8 *pnRecIndex, u8 nMaxNum, 
	u32 dwIndexAdd, u32 dwRecordAdd, u8 nRecordLen)
{
	u16 nX = 0, address = 0, nInDexAdd = 0, nLoop = 0 ,wCurrIndex = 0;
	Type32Bits index;
	u8 nBuf[RECORD_LEN+1]    = {0};
	u8 nTmpBuf[RECORD_LEN+1] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};

	nBuf[nLen] = JX_AddSum8Bit(Record, nLen);
	MemcpyFunc(nBuf, Record, nLen);	
	nX = nLen+1; //��1�ֽ�У��
	
	(*pnRecIndex) = (*pnRecIndex)+1;
	if ((*pnRecIndex) >= nMaxNum)
	{
		(*pnRecIndex) = 0;
	}
	wCurrIndex = (*pnRecIndex);

	/* add by maronglang 20150829 */
	nInDexAdd = dwIndexAdd;

	ReadGroup(sizeof(index), nInDexAdd, (u8 *)&index);		//��ָ��,������ƽ���㷨
	if (index.Bytes.B0 == 0xff)		//��һ��?
	{
		SaveByte(nInDexAdd, wCurrIndex);		//����ָ��
		address = dwRecordAdd;
		for(nLoop = 0; nLoop < nMaxNum; nLoop++)
		{
			address +=(nLoop*nX);
			SaveGroup(nX, address, nTmpBuf);
		}
	}
	else if (index.Bytes.B1 == 0xff)
	{
		SaveByte(nInDexAdd + 1, wCurrIndex);	//����ָ��
	}
	else if (index.Bytes.B2 == 0xff)
	{
		SaveByte(nInDexAdd + 2, wCurrIndex);	//����ָ��
	}
	else if (index.Bytes.B3 == 0xff)
	{
		SaveByte(nInDexAdd + 3, wCurrIndex);	//����ָ��
	}
	else
	{
		SaveByte(nInDexAdd, wCurrIndex);		//����ָ��
		SaveByte(nInDexAdd + 1, 0xff);		//���
		SaveByte(nInDexAdd + 2, 0xff);		//���
		SaveByte(nInDexAdd + 3, 0xff);		//���
	}

	address = dwRecordAdd;		            //EEPROM��ʼ��ַ
	address += wCurrIndex * (nRecordLen+1);		//+��¼ƫ�� 	
	SaveGroup(nX, address, nBuf);
}

/******************************************************************************
* �� �� ��: ReadRecordFun
* ��������: ��EEPROM����������ȡ�ն����¼����
* ��ڲ���: nIndex
* ʱ	��: 2016��7��13��11:37:00
* �� �� ��: maronglang
*******************************************************************************/
u8 ReadRecordFun(u8 nIndex, u8 *Record, u8 nOutLen, u8 nRecIndex, u8 nMaxNum, u32 dwRecordAdd)
{
	u16 nX = 0, address = 0;
	u16 nReadIndex = 0;
	u8 nBuf[RECORD_LEN+1] = {0};

	if(NULL == Record || nOutLen > sizeof(TypeRecord) || (nMaxNum <= nIndex))
	{
		return FALSE;
	}
	
	nX = nOutLen+1;

	/* ����ʵ�ʶ�ȡ���� */
	if(nRecIndex < nIndex)
	{
		nReadIndex = (u8)nMaxNum - (nIndex - nRecIndex);
	}
	else
	{
		nReadIndex = nRecIndex - nIndex;
	}

	address = nReadIndex*nX + dwRecordAdd;	
	ReadGroup(nX, address, nBuf);	
	if(nBuf[nX-1] == JX_AddSum8Bit(nBuf, nX-1))
	{
		if(!JX_IsAllFillDat(nBuf, 0, nX-1))
		{
			MemcpyFunc(Record, nBuf, nOutLen); 
			return TRUE;
		}
	}

	return FALSE;
}

/******************************************************************************
* �� �� ��: EditRecord
* ��������: ��д�ϱ���־
* ��ڲ���: nIndex
* ʱ	��: 2016��04��22��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
u8 EditRecord(u8 nIndex, u8 *Record, u8 nInLen)
{
	u16 nX = 0, address = 0;
	u16 nReadIndex = 0;
	u8 nBuf[16] = {0};

	if(NULL == Record || nInLen < sizeof(TypeRecord) || (NUMBER_RECORD < nIndex))
	{
		return FALSE;
	}
	
	nX = sizeof(TypeRecord)+1;

	/* ����ʵ��д������ */
	if(ucRecordIndex < nIndex)
	{
		nReadIndex = (u8)NUMBER_RECORD - (nIndex - ucRecordIndex);
	}
	else
	{
		nReadIndex = ucRecordIndex - nIndex;
	}

	MemcpyFunc(nBuf, Record, nInLen);
	address = nReadIndex*nX + ADDRESS_RECORD;	
	nBuf[nX-1] = JX_AddSum8Bit(nBuf, nX-1);
	SaveGroup(nX, address, nBuf);
	
	MemsetFunc(nBuf, 0, sizeof(nBuf));
	ReadGroup(nX, address, nBuf);
	if(nBuf[nX-1] == JX_AddSum8Bit(nBuf, nX-1))
	{
		if(!JX_IsAllFillDat(nBuf, 0, nX-1))
		{
			return TRUE;
		}
	}

	return FALSE;
}

/******************************************************************************
* �� �� ��: AddAlmRecord
* ��������: ����1���澯��¼��ƽ���㷨
			λ��	0123 ֵ	1111 0111 0011 0001	0000
* ��ڲ���: nIndex
* ʱ	��: 2016��4��29��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
void AddAlmRecord(u8 *Record, u8 nLen)
{
	AddRecordFun(Record, nLen, &g_nRecAlmIndex, NUMBER_RECORD_ALM, 
		ADDRESS_INDEX_ALM, ADDRESS_RECORD_ALM, RECORD_LEN_ALM);
}


/******************************************************************************
* �� �� ��: ReadAlmRecord
* ��������: ��EEPROM����������ȡ�澯��¼����
* ��ڲ���: nIndex
* ʱ	��: 2016��4��29��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
u8 ReadAlmRecord(u8 nIndex, u8 *Record, u8 nOutLen)
{
	return (ReadRecordFun(nIndex, Record, nOutLen, g_nRecAlmIndex, NUMBER_RECORD_ALM, ADDRESS_RECORD_ALM));
}

/******************************************************************************
* �� �� ��: AddRecord
* ��������: ����1����¼��ƽ���㷨
			λ��	0123 ֵ	1111 0111 0011 0001	0000
* ��ڲ���: nIndex
* ʱ	��: 2015��8��29��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
void AddRecord(u8 *Record, u8 nLen)
{
	AddRecordFun(Record, nLen, &ucRecordIndex, NUMBER_RECORD, 
		ADDRESS_INDEX, ADDRESS_RECORD, RECORD_LEN);
}

/******************************************************************************
* �� �� ��: ReadRecord
* ��������: ��EEPROM����������ȡ��¼����
* ��ڲ���: nIndex
* ʱ	��: 2015��8��29��15:37:00
* �� �� ��: maronglang
*******************************************************************************/
u8 ReadRecord(u8 nIndex, u8 *Record, u8 nOutLen)
{
	return (ReadRecordFun(nIndex, Record, nOutLen, ucRecordIndex, NUMBER_RECORD, ADDRESS_RECORD));
}

#ifndef PIEZOMETER
/******************************************************************************
* �� �� ��: AddDayFreezeRecord
* ��������: ����1���ն����¼��ƽ���㷨
			λ��	0123 ֵ	1111 0111 0011 0001	0000
* ��ڲ���: nIndex
* ʱ	��: 2016��06��17��09:37:00
* �� �� ��: maronglang
*******************************************************************************/
void AddDayFreezeRecord(u8 *Record, u8 nLen)
{
	AddRecordFun(Record, nLen, &g_nDayRecIndex, NUMBER_RECORD_DAY, 
		ADDRESS_INDEX_DAY, ADDRESS_RECORD_DAY, RECORD_LEN_DAY);
}

/******************************************************************************
* �� �� ��: ReadDayFreezeRecord
* ��������: ��EEPROM����������ȡ�ն����¼����
* ��ڲ���: nIndex
* ʱ	��: 2016��6��17��11:37:00
* �� �� ��: maronglang
*******************************************************************************/
u8 ReadDayFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen)
{
	return (ReadRecordFun(nIndex, Record, nOutLen, g_nDayRecIndex, NUMBER_RECORD_DAY, ADDRESS_RECORD_DAY));
}
/******************************************************************************
* �� �� ��: AddMonFreezeRecord
* ��������: ����1���¶����¼��ƽ���㷨
			λ��	0123 ֵ	1111 0111 0011 0001	0000
* ��ڲ���: nIndex
* ʱ	��: 2016��06��20��09:37:00
* �� �� ��: maronglang
*******************************************************************************/
void AddMonFreezeRecord(u8 *Record, u8 nLen)
{
	AddRecordFun(Record, nLen, &g_nMonRecIndex, NUMBER_RECORD_MON, 
		ADDRESS_INDEX_MON, ADDRESS_RECORD_MON, RECORD_LEN_MON);
}

/******************************************************************************
* �� �� ��: ReadMonFreezeRecord
* ��������: ��EEPROM����������ȡ�ն����¼����
* ��ڲ���: nIndex
* ʱ	��: 2016��6��17��11:37:00
* �� �� ��: maronglang
*******************************************************************************/
u8 ReadMonFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen)
{
	return (ReadRecordFun(nIndex, Record, nOutLen, g_nMonRecIndex, NUMBER_RECORD_MON, ADDRESS_RECORD_MON));
}
#endif

#endif

/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/

