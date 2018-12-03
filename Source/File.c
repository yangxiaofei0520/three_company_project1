/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : File.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 数据的读写,分EEPROM/FLASH 2个部分,包括了平衡算法(FLASH部分)
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
/* 重EEPROM 读取数据
函数名: ReadGroup
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.18
*//*********************************************/
void ReadGroup(u8 Length, u16 Address, u8 *Data)		//从EEPROM指定地址读取N个字节
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
/* 重EEPROM 读取数据
函数名: ReadGroup
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.18
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
/* 写入EEPROM 
函数名: ReadGroup
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.18
*//*********************************************/
void SaveGroup(u8 Length, u16 Address, u8 *Data)		//写n个字节到指定EEPROM的指定地址
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
/*以下为基本函数

描述:		擦除所有存储块
输入:		无
输出:		无
*/
void EraseAllBlock(void)
{
	u16 index;
	index = SIZE_STORE / SIZE_BLOCK;
	while (index--)
	{
		EraseOneBlock(index * SIZE_BLOCK);		//所有块擦除一次
	}
}

//以下为正常流程
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
	ucAddressRecord = 0;		//当前记录地址置0
	ucSizeRecord = 0;
	while (flag)
	{
		if (ReadByte(index) == RECORD_HEAD_0)		//有记录头0?
		{
			index++;		//下1地址
			if (ReadByte(index) == RECORD_HEAD_1)		//有记录头1?
			{
				ucAddressRecord = index + 1;		//更新当前记录地址
				index += sizeof(tyRecord);			//指向下1条记录地址
			}
			else
			{
				EraseAllBlock();		//全部擦除
				flag = 0;
			}
		}
		else if (ReadByte(index) == 0xff)
		{
			ucSizeRecord = index - ucAddressRecord;		//计算出当前记录大小
			flag = 0;
		}
		else if (first)		//第一次读?
		{
			EraseAllBlock();		//全部擦除
			flag = 0;
		}
		first = 0;
	}
}

/*以下为接口函数

描述:		增加1条记录
输入:		记录指针
输出:		无
*/
void AddRecord(u8 *Record)
{
	u8 nX;
	u16 from, to;
	to = 0;
	from = ucAddressRecord;		//当前记录地址
	if ( (ucAddressRecord + (ucSizeRecord * 2) + sizeof(tyRecord)) >= SIZE_STORE)
	{			//地址+记录已经满?
		EraseOneBlock(to);		//擦除第一块
		SaveByte(to++, RECORD_HEAD_0);		//保存记录头0
		SaveByte(to++, RECORD_HEAD_1);		//保存记录头1
		ucAddressRecord = to;		//重新定义当前记录地址
		nX = 0;
		while (nX < (ucSizeRecord / sizeof(tyRecord)) )		//将删除记录前面的数据复制到前面
		{
			ReadGroup(sizeof(tyRecord), from, aucRecordBuffer);	//读1条记录到缓存
			SaveGroup(sizeof(tyRecord), to, aucRecordBuffer);		//写1条记录到指定FLASH的指定地址
			from += sizeof(tyRecord);
			to += sizeof(tyRecord);
			nX++;
		}
		to += SIZE_BLOCK;
		from = to & 0x80;		//取整
		while (from < SIZE_STORE)
		{
			EraseOneBlock(from);		//所有块擦除一次
			from += SIZE_BLOCK;
		}
	}
	else
	{
		SaveGroup(sizeof(tyRecord), to, aucRecordBuffer);		//写1条记录到指定FLASH的指定地址
	}
	ucSizeRecord += sizeof(tyRecord);		//重新定义记录长度
}

/*
描述:		读某1条记录
输入:		记录索引号,从0开始,记录指针
输出:		tyRecord
*/
void ReadRecord(u8 Index)
{
	u16 from;
	from = ucAddressRecord + Index * sizeof(tyRecord);
	ReadGroup(sizeof(tyRecord), from, (u8 *)tyRecord);	//读1条记录到缓存
}

/*
描述:		删除某1条记录
输入:		记录索引号,从0开始
输出:		无
*/
void DelRecord(u8 Index)
{
	u8 nX, flag;
	u16 from, to;
	to = 0;
	from = ucAddressRecord;
	if (CheckRecordFull() )		//检查记录是否满?
	{
		if (ucSizeRecord == sizeof(tyRecord))		//只有1条记录
		{
			EraseAllBlock();
			flag = 0;
			SaveByte(to++, RECORD_HEAD_0);		//保存记录头0
			SaveByte(to++, RECORD_HEAD_1);		//保存记录头1
			ucAddressRecord = to;
			ucSizeRecord = 0;
		}
		else
		{
			EraseOneBlock(to);		//擦除第一块
			flag = 2;		//擦除剩余块
		}
	}
	else
	{
		if ( (ucAddressRecord + (ucSizeRecord * 2) - sizeof(tyRecord)) >= SIZE_STORE)
		{
			EraseOneBlock(to);		//擦除第一块
			flag = 2;		//擦除剩余块
		}
		else
		{
			to = ucAddressRecord + ucSizeRecord;		//定位到记录最后面
			flag = 1;
		}
	}
	if (flag)		//需要移动数据?
	{
		SaveByte(to++, RECORD_HEAD_0);		//保存记录头0
		SaveByte(to++, RECORD_HEAD_1);		//保存记录头1
		ucAddressRecord = to;		//重新定义当前记录地址
		nX = 0;
		while (nX < Index)		//将删除记录前面的数据复制到前面
		{
			ReadGroup(sizeof(tyRecord), from, aucRecordBuffer);	//读1条记录到缓存
			SaveGroup(sizeof(tyRecord), to, aucRecordBuffer);		//写1条记录到指定FLASH的指定地址
			from += sizeof(tyRecord);
			to += sizeof(tyRecord);
			nX++;
		}
		nX++;
		from += sizeof(tyRecord);		//跳过删除的记录
		while (nX < (ucSizeRecord / sizeof(tyRecord)) )		//将删除记录前面的数据复制到前面
		{
			ReadGroup(sizeof(tyRecord), from, aucRecordBuffer);	//读1条记录到缓存
			SaveGroup(sizeof(tyRecord), to, aucRecordBuffer);		//写1条记录到指定FLASH的指定地址
			from += sizeof(tyRecord);
			to += sizeof(tyRecord);
			nX++;
		}
		ucSizeRecord -= sizeof(tyRecord);		//重新定义记录长度
	}
	if (flag == 2)		//擦除剩余块
	{	
		to += SIZE_BLOCK;
		from = to & 0x80;		//取整
		while (from < SIZE_STORE)
		{
			EraseOneBlock(from);		//所有块擦除一次
			from += SIZE_BLOCK;
		}
	}
}

/*
描述:		检查记录是否满
输入:		无
输出:		无
*/
u8 CheckRecordFull(void)
{
	u8 read;
	if ( (ucAddressRecord + ucSizeRecord) == SIZE_STORE)		//记录已经满?
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
描述:		检查记录数量
输入:		无
输出:		无
*/
u8 CheckRecordNumber(void)
{
	u8 read;
	read = ucSizeRecord / sizeof(tyRecord);
	return read;
}

	#else			//EEPROM
/*以下为接口函数
/******************************************************************************
* 函 数 名: SaveReportFlag
* 函数功能: 保存上报标记带平衡算法
			位置	0123 值	1111 0111 0011 0001	0000
* 入口参数: nReportFlg
* 时	间: 2015年12月30日15:37:00
* 修 改 人: maronglang
*******************************************************************************/
void SaveReportFlag(u8 nReportFlg)
{
	u16 nX = 0, address = 0;
	Type32Bits index;

	/* add by maronglang 20150829 */
	address = ADDRESS_REPORTFLG;

	ReadGroup(sizeof(index), address, (u8 *)&index);		//读指针,下面做平衡算法
	if (index.Bytes.B0 == 0xff)		//第一次?
	{
		SaveByte(ADDRESS_REPORTFLG, nReportFlg);		//保存指针
	}
	else if (index.Bytes.B1 == 0xff)
	{
		SaveByte(ADDRESS_REPORTFLG + 1, nReportFlg);	//保存指针
	}
	else if (index.Bytes.B2 == 0xff)
	{
		SaveByte(ADDRESS_REPORTFLG + 2, nReportFlg);	//保存指针
	}
	else if (index.Bytes.B3 == 0xff)
	{
		SaveByte(ADDRESS_REPORTFLG + 3, nReportFlg);	//保存指针
	}
	else
	{
		SaveByte(ADDRESS_REPORTFLG, nReportFlg);		//保存指针
		SaveByte(ADDRESS_REPORTFLG + 1, 0xff);		//清除
		SaveByte(ADDRESS_REPORTFLG + 2, 0xff);		//清除
		SaveByte(ADDRESS_REPORTFLG + 3, 0xff);		//清除
	}
}

/******************************************************************************
* 函 数 名: ReadReportFlag
* 函数功能: 读取上报标志
* 入口参数: 无
* 时	间: 2015年12月30日15:37:00
* 修 改 人: maronglang
*******************************************************************************/
u8 ReadReportFlag(void)
{
	Type32Bits index;

	ReadGroup(sizeof(index), ADDRESS_REPORTFLG, (u8 *)&index);		//读指针,根据平衡算法,找到指针的真正位置
	if (index.Bytes.B3 < 0xff)		//有数据?
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
	else		//全部没数据?
	{
		return 0;
	}
}

/******************************************************************************
* 函 数 名: ReadIndex
* 函数功能: 读取Index位置
* 入口参数: nIndex
* 时	间: 2016年6月25日15:37:00
* 修 改 人: maronglang
*******************************************************************************/
u8 ReadIndex(u16 wAddr)
{
	u8 nIndexDat = 0;
	Type32Bits index;

	ReadGroup(sizeof(index), wAddr, (u8 *)&index);		//读指针,根据平衡算法,找到指针的真正位置
	if (index.Bytes.B3 < 0xff)		//有数据?
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
	else		//全部没数据?
	{
		nIndexDat = 0;
	}
	return nIndexDat;
}

/******************************************************************************
* 函 数 名: InitializeFile
* 函数功能: EEPROM初始化函数 读取当前记录指针
* 入口参数: nIndex
* 时	间: 2015年8月29日15:37:00
* 修 改 人: maronglang
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

	//读指针,明细数据
	ucRecordIndex = ReadIndex(ADDRESS_INDEX);

	//读指针,告警日志
	g_nRecAlmIndex = ReadIndex(ADDRESS_INDEX_ALM);
#ifndef PIEZOMETER
	//读指针,日冻结
	g_nDayRecIndex = ReadIndex(ADDRESS_INDEX_DAY);

	//读指针,月冻结
	g_nMonRecIndex = ReadIndex(ADDRESS_INDEX_MON);
#endif
}

/*
描述:		保存参数
输入:		无
输出:		无
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
描述:		读取参数
输入:		无
输出:		无
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

/* 记录存储管理 */
#if 1
/******************************************************************************
* 函 数 名: AddRecordFun
* 函数功能: 增加1条记录带平衡算法
			位置	0123 值	1111 0111 0011 0001	0000
* 入口参数: nIndex
* 时	间: 2016年07月13日09:37:00
* 修 改 人: maronglang
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
	nX = nLen+1; //加1字节校验
	
	(*pnRecIndex) = (*pnRecIndex)+1;
	if ((*pnRecIndex) >= nMaxNum)
	{
		(*pnRecIndex) = 0;
	}
	wCurrIndex = (*pnRecIndex);

	/* add by maronglang 20150829 */
	nInDexAdd = dwIndexAdd;

	ReadGroup(sizeof(index), nInDexAdd, (u8 *)&index);		//读指针,下面做平衡算法
	if (index.Bytes.B0 == 0xff)		//第一次?
	{
		SaveByte(nInDexAdd, wCurrIndex);		//保存指针
		address = dwRecordAdd;
		for(nLoop = 0; nLoop < nMaxNum; nLoop++)
		{
			address +=(nLoop*nX);
			SaveGroup(nX, address, nTmpBuf);
		}
	}
	else if (index.Bytes.B1 == 0xff)
	{
		SaveByte(nInDexAdd + 1, wCurrIndex);	//保存指针
	}
	else if (index.Bytes.B2 == 0xff)
	{
		SaveByte(nInDexAdd + 2, wCurrIndex);	//保存指针
	}
	else if (index.Bytes.B3 == 0xff)
	{
		SaveByte(nInDexAdd + 3, wCurrIndex);	//保存指针
	}
	else
	{
		SaveByte(nInDexAdd, wCurrIndex);		//保存指针
		SaveByte(nInDexAdd + 1, 0xff);		//清除
		SaveByte(nInDexAdd + 2, 0xff);		//清除
		SaveByte(nInDexAdd + 3, 0xff);		//清除
	}

	address = dwRecordAdd;		            //EEPROM开始地址
	address += wCurrIndex * (nRecordLen+1);		//+记录偏移 	
	SaveGroup(nX, address, nBuf);
}

/******************************************************************************
* 函 数 名: ReadRecordFun
* 函数功能: 从EEPROM按照索引读取日冻结记录数据
* 入口参数: nIndex
* 时	间: 2016年7月13日11:37:00
* 修 改 人: maronglang
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

	/* 计算实际读取索引 */
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
* 函 数 名: EditRecord
* 函数功能: 回写上报标志
* 入口参数: nIndex
* 时	间: 2016年04月22日15:37:00
* 修 改 人: maronglang
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

	/* 计算实际写入索引 */
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
* 函 数 名: AddAlmRecord
* 函数功能: 增加1条告警记录带平衡算法
			位置	0123 值	1111 0111 0011 0001	0000
* 入口参数: nIndex
* 时	间: 2016年4月29日15:37:00
* 修 改 人: maronglang
*******************************************************************************/
void AddAlmRecord(u8 *Record, u8 nLen)
{
	AddRecordFun(Record, nLen, &g_nRecAlmIndex, NUMBER_RECORD_ALM, 
		ADDRESS_INDEX_ALM, ADDRESS_RECORD_ALM, RECORD_LEN_ALM);
}


/******************************************************************************
* 函 数 名: ReadAlmRecord
* 函数功能: 从EEPROM按照索引读取告警记录数据
* 入口参数: nIndex
* 时	间: 2016年4月29日15:37:00
* 修 改 人: maronglang
*******************************************************************************/
u8 ReadAlmRecord(u8 nIndex, u8 *Record, u8 nOutLen)
{
	return (ReadRecordFun(nIndex, Record, nOutLen, g_nRecAlmIndex, NUMBER_RECORD_ALM, ADDRESS_RECORD_ALM));
}

/******************************************************************************
* 函 数 名: AddRecord
* 函数功能: 增加1条记录带平衡算法
			位置	0123 值	1111 0111 0011 0001	0000
* 入口参数: nIndex
* 时	间: 2015年8月29日15:37:00
* 修 改 人: maronglang
*******************************************************************************/
void AddRecord(u8 *Record, u8 nLen)
{
	AddRecordFun(Record, nLen, &ucRecordIndex, NUMBER_RECORD, 
		ADDRESS_INDEX, ADDRESS_RECORD, RECORD_LEN);
}

/******************************************************************************
* 函 数 名: ReadRecord
* 函数功能: 从EEPROM按照索引读取记录数据
* 入口参数: nIndex
* 时	间: 2015年8月29日15:37:00
* 修 改 人: maronglang
*******************************************************************************/
u8 ReadRecord(u8 nIndex, u8 *Record, u8 nOutLen)
{
	return (ReadRecordFun(nIndex, Record, nOutLen, ucRecordIndex, NUMBER_RECORD, ADDRESS_RECORD));
}

#ifndef PIEZOMETER
/******************************************************************************
* 函 数 名: AddDayFreezeRecord
* 函数功能: 增加1条日冻结记录带平衡算法
			位置	0123 值	1111 0111 0011 0001	0000
* 入口参数: nIndex
* 时	间: 2016年06月17日09:37:00
* 修 改 人: maronglang
*******************************************************************************/
void AddDayFreezeRecord(u8 *Record, u8 nLen)
{
	AddRecordFun(Record, nLen, &g_nDayRecIndex, NUMBER_RECORD_DAY, 
		ADDRESS_INDEX_DAY, ADDRESS_RECORD_DAY, RECORD_LEN_DAY);
}

/******************************************************************************
* 函 数 名: ReadDayFreezeRecord
* 函数功能: 从EEPROM按照索引读取日冻结记录数据
* 入口参数: nIndex
* 时	间: 2016年6月17日11:37:00
* 修 改 人: maronglang
*******************************************************************************/
u8 ReadDayFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen)
{
	return (ReadRecordFun(nIndex, Record, nOutLen, g_nDayRecIndex, NUMBER_RECORD_DAY, ADDRESS_RECORD_DAY));
}
/******************************************************************************
* 函 数 名: AddMonFreezeRecord
* 函数功能: 增加1条月冻结记录带平衡算法
			位置	0123 值	1111 0111 0011 0001	0000
* 入口参数: nIndex
* 时	间: 2016年06月20日09:37:00
* 修 改 人: maronglang
*******************************************************************************/
void AddMonFreezeRecord(u8 *Record, u8 nLen)
{
	AddRecordFun(Record, nLen, &g_nMonRecIndex, NUMBER_RECORD_MON, 
		ADDRESS_INDEX_MON, ADDRESS_RECORD_MON, RECORD_LEN_MON);
}

/******************************************************************************
* 函 数 名: ReadMonFreezeRecord
* 函数功能: 从EEPROM按照索引读取日冻结记录数据
* 入口参数: nIndex
* 时	间: 2016年6月17日11:37:00
* 修 改 人: maronglang
*******************************************************************************/
u8 ReadMonFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen)
{
	return (ReadRecordFun(nIndex, Record, nOutLen, g_nMonRecIndex, NUMBER_RECORD_MON, ADDRESS_RECORD_MON));
}
#endif

#endif

/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/

