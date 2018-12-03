/*
项目:		IP物联网表表
模块描述:	和其他的MCU,PC通讯
MCU:	msp430g2403
文件名:	protocol.c
开始时间:	2015-6-24 17:32:45
*/

#include "Protocol.h"
#include "Meter.h"
#include "ProtocolGlobal.h"
#include "DriverUart.h"
#include "GsmGlobal.h"
#include "FileGlobal.h"
#include "Initialize.h"
#include "Pwrctr.h"
#include "global.h"
#include"CJ188.h"
#include "XinJiangProtocol.h"
#include "Alarm.h"

#define  _ACR_CMD_OFFSET		1
#define  _ACR_LEN_OFFSET		2
#define  _ACR_DAT_OFFSET		3


union  
{
	u8 nDatBuf[2];
	u16 wData;
}U_TranShort;


u32 dwTime = 0, dwNowTime = 0;

u8 g_nValveStat = VALVE_OPEN;
u8 GetBoardVavleStat(void);

/* 内部协议抄表 */
#ifdef  PTROTO_JASON
/******************************************************************************
* 函 数 名: JasonDataRate(void)
* 函数功能: 根据内部协议类型字节计算出当前倍率的读数格式 保留两位小数
* 入口参数: 无
* 时	间: 2015年12月28日15:37:00
* 修 改 人: maronglang
* 说    明: 下行抄表
*******************************************************************************/
u32 JasonDataRate(u8 nRate, u32 data)
{
	u32 dwRealData = 0;//扩大100倍BCD码保留两位小数

	switch(nRate)
	{
		case JASON_RATE_0001:
			dwRealData = (data>>4);
			break;
		case JASON_RATE_001:
			dwRealData = data;
			break;
		case JASON_RATE_01:
			dwRealData = (data<<4);
			break;
		case JASON_RATE_1:
			dwRealData = (data<<8);
			break;
		case JASON_RATE_10:
			dwRealData = (data<<12);
			break;
		case JASON_RATE_100:
			dwRealData = (data<<16);
			break;
		case JASON_RATE_1000:
			dwRealData = (data<<20);
			break;
		default:
			break;
	}
	return dwRealData;
}

/*以下为基本函数

描述:		计算CRC-16-CCITT,多项式:0x11021,或0x1021
输入:		数据长度,数据指针
输出:		CRC校验和
*/
u16 GetCrcCcitt(u8 Length, u8 *Point)
{
	Type16Bits crc;
	u8 tempf, tempe, resulth, resultl;
	crc.Short = 0;
	while (Length--)
	{
/*		crc.Short = CCITT_TABLE[(crc.Bytes.B0 ^ *Point++) & 0xff] ^ crc.Bytes.B1;
		crc.Short = CCITT_TABLE[(crc.Short ^ *Point++) & 0xff] ^ crc.Bytes.B1;
*/
		tempf = crc.Nibbles.N2;		//e=Al N0
		tempe = crc.Nibbles.N3;		//f=Ah N1
		resulth = he00[tempe] ^ hf00[tempf];
		resultl = le00[tempe] ^ lf00[tempf];
		tempf = resultl ^ *Point++;
		crc.Bytes.B0 = resulth ^ (crc.Bytes.B1);
		crc.Bytes.B1 = tempf;
	}
	return crc.Short;
}


/*
描述:		计算,比较CRC
输入:		数据长度,数据指针
输出:		CRC对,错
*/
u8 CheckCrc(u8 Length, u8 *Point)
{
	u8 code, *from;
	Type16Bits crcA, crcB;
	from = Point;
	from += Length;
	crcA.Short = GetCrcCcitt(Length, Point);
	crcB.Bytes.B0 = *from++;
	crcB.Bytes.B1 = *from;
	if (crcA.Short == crcB.Short)
	{
		code = 1;
	}
	else
	{
		code = 0;
	}
	return code;
}
/*
描述:		协议重置
输入:		无
输出:		无
*/
void JasonReset(void)
{
	ClearRxBuff();//add by maronglang 20160328
	ucStepUart = 0;
	ucNumberUart = 0;
}


/*
描述:		作为主机时候下行协议打包,数据已经放好在aucUartTxBuffer处
输入:		数据长度
输出:		无
*/
void PackProtocolMaster(u8 Length)
{
	u8 *to;
	Type16Bits crc;
	to = aucUartTxBuffer;
	*to++ = JASON_PREAMBLE;		//数据引导码
	*to++ = JASON_PREAMBLE;
	*to++ = JASON_PREAMBLE;
	*to++ = JASON_HEAD_0;			//数据头
	*to++ = JASON_HEAD_0;			//B,0x42
	*to++ = JASON_HEAD_0;
	*to++ = JASON_HEAD_0;
	*to++ = JASON_HEAD_1;			//S,0x53
	crc.Short = GetCrcCcitt(Length, to);		//获得校验码
	to += Length;
	*to++ = crc.Bytes.B0;			//校验码A
	*to++ = crc.Bytes.B1;			//校验码B
	*to++ = JASON_TAIL;			//E,0x45
	SetBusUart(COM_2, PARITY_NULL);		//设置串口通道号
	StartSendBusUartGroup(Length + JASON_HEAD_OFFSET + 3);
}

/*
描述:		作为从机时候上行协议打包,数据已经放好在aucUartTxBuffer处
输入:		数据长度,数据指针
输出:		无
*/
void PackProtocolSlave(u8 Length)
{
	u8 *to;
	Type16Bits crc;
	to = aucUartTxBuffer;
	*to++ = JASON_PREAMBLE;		//数据引导码
	*to++ = JASON_PREAMBLE;
	*to++ = JASON_PREAMBLE;
	*to++ = JASON_HEAD_1;			//数据头
	*to++ = JASON_HEAD_1;			//S,0x53
	*to++ = JASON_HEAD_1;
	*to++ = JASON_HEAD_1;
	*to++ = JASON_HEAD_0;			//B,0x42
	crc.Short = GetCrcCcitt(Length, to);		//获得校验码
	to += Length;
	*to++ = crc.Bytes.B0;			//校验码A
	*to++ = crc.Bytes.B1;			//校验码B
	*to++ = JASON_TAIL;			//E,0x45
	StartSendBusUartGroup(Length + JASON_HEAD_OFFSET + 3);
}

/*
描述:		作为主机时候下行协议打包
输入:		数据长度,数据指针
输出:		无
*/
void PackProtocolMasterCopy(u8 Length, u8 *Pack)
{
	u8 *to;
	to = aucUartTxBuffer;
	to += JASON_HEAD_OFFSET;
	MemcpyFunc(to, Pack, Length);		//复制到内存
	PackProtocolMaster(Length);
}

/*
描述:		作为从机时候上行协议打包
输入:		数据长度,数据指针
输出:		无
*/
void PackProtocolSlaveCopy(u8 Length, u8 *Pack)
{
	u8 *to;
	to = aucUartTxBuffer;
	to += JASON_HEAD_OFFSET;
	MemcpyFunc(to, Pack, Length);		//复制到内存
	PackProtocolSlave(Length);
}

/*
描述:		从机命令处理
输入:		tyJasonSlave,tyParameter
输出:		无
*/
void JasonCmdSlave(void)
{
#if 0
	u8 length;
	if ( (tyJasonSlave.Rx.Address == g_dwTmAddress)		//地址相同?
	|| (tyJasonSlave.Rx.Address == JASON_BROADCAST) )		//是广播码?
	{
		tyJasonSlave.Tx.Address = g_dwTmAddress;		//读地址
		tyJasonSlave.Tx.Cmd= tyJasonSlave.Rx.Cmd;
		tyJasonSlave.Tx.Status = tyParameter.Status;
		tyJasonSlave.Tx.Type = tyParameter.Type;
		tyJasonSlave.Tx.Value = tyParameter.Value;			//读表值
		tyJasonSlave.Tx.Password = tyParameter.Password + ANSWER_PASSWORD;		//密码
		switch (tyJasonSlave.Rx.Cmd)		//命令
		{
		case JASON_AUTO_TEST:
			length = 16;
			break;
		case JASON_READ_METER:
			length = 16;
			PackProtocolSlaveCopy( sizeof(tyJasonSlave), (u8 *)&tyJasonSlave );		//复制到内存
			break;
		case JASON_CLOSE_VALVE:
			length = 16;
			if (tyJasonSlave.Tx.Password == tyParameter.Password)		//密码相同?
			{

			}
			break;
		case JASON_FACTORY_SET:
			length = 12 + 4;
			break;
		case JASON_OPEN_VALVE:
			length = 12 + 4;
			if (tyJasonSlave.Tx.Password == tyParameter.Password)		//密码相同?
			{

			}
			break;
		case JASON_SET_ADDR:
			length = 12 + 4;
			break;
		case JASON_SET_PASSWORD:
			length = 12 + 4;
			break;
		case JASON_SET_READER:
			length = 12 + 4;
			break;
		case JASON_VERSION:
		case JASON_VERSION_CB:
			PackProtocolSlaveCopy( sizeof(METER_VERSION), (u8 *)METER_VERSION );		//复制到内存
			break;
		}
	}
#endif
}

/*
描述:		主机命令处理
输入:		tyJasonMaster,tyParameter
输出:		无
*/
u8 JasonCmdMaster(void)
{
	//u8 length = 0;
        
	switch (tyJasonMaster.Rx.Cmd)		//命令命令正确,将接收到的数据全部下发到直读表
	{
	case JASON_SET_ADDR:
	case JASON_SET_PASSWORD:
	case JASON_SET_READER:
		//length = 12 + 4;
		break;
	case JASON_FACTORY_SET:
		//length = 9 + 4;
		break;
	case JASON_AUTO_TEST:
		//length = 9 + 4;
		break;
	case JASON_CLOSE_VALVE:
		//length = 9 + 4;
		//break;
		return TRUE;
	case JASON_OPEN_VALVE:
		//length = 9 + 4;
		//break;		
		return TRUE;
	case JASON_READ_METER:
		//length = 26 - 8;
		tyParameter.Type = tyJasonMaster.Rx.Type;
		JX_BL_Change(4, &tyJasonMaster.Buffer[7]);
		MemcpyFunc((u8*)&tyParameter.Value, &tyJasonMaster.Buffer[7], 4);
		tyParameter.Value = JasonDataRate(tyParameter.Type&0x0F, tyParameter.Value);
		return TRUE;
		
	case JASON_VERSION:
	case JASON_VERSION_CB:
		//length = 8 + 4;
		break;		
	}
	return FALSE;
}

/*
描述:		捷先内部协议从机处理
输入:		无
返回值:	无
*/
void JasonReceiveSlave(u8 Data)
{
	switch (ucStepUart)		//接收步骤
	{
	case 0:			//这里过滤了引导码
	case 1:
	case 2:
	case 3:
		if (Data == JASON_HEAD_0)		//是B?
		{
			ucStepUart++;		//接收步骤++
		}
		else
		{
			ucStepUart = 0;		//重新开始
		}
		break;
	case 4:
		if (Data == JASON_HEAD_1)		//是S?
		{
			ucStepUart++;		//接收步骤++
			ucNumberUart = 0;
			tyJasonSlave.Head = 1;
		}
		else
		{
			JasonReset();
		}
		break;
	case 5:
		if (ucNumberUart > MAX_JASON)		//超过长度?
		{
			JasonReset();
		}
		else
		{
			tyJasonSlave.Buffer[ucNumberUart++] = Data;		//接收数据
			if (ucNumberUart == 5)		//地址接收完是,长度
			{
				switch (tyJasonSlave.Rx.Cmd)		//根据命令计算出数据长度
				{
				case JASON_SET_PASSWORD:
				case JASON_SET_ADDR:
				case JASON_SET_READER:
					tyJasonSlave.Length = 12;
					break;
				case JASON_FACTORY_SET:
					tyJasonSlave.Length = 9;
					break;
				default:
					tyJasonSlave.Length = 8;
					break;
				}
			}
			else if (tyJasonSlave.Length == ucNumberUart)		//接收结束?
			{
				if (CheckCrc(tyJasonSlave.Length - 3, tyJasonSlave.Buffer))	//计算接收到的数据的校验和
				{
					JasonCmdSlave();			//从机命令处理
				}
				JasonReset();
			}
		}
		break;
	}
}

/*
描述:	捷先内部协议主机处理
输入:	无
返回值:	无
*/
u8 JasonReceiveMaster(u8 Data)
{
	u16 check = 0, wNewCheck = 0;
	
	switch (ucStepUart)		//接收步骤
	{
	case 0:			//这里过滤了引导码
	case 1:
	case 2:
	case 3:
		if (Data == JASON_HEAD_1)		//是S?
		{
			ucStepUart++;		//接收步骤++
		}
		else
		{
			ucStepUart = 0;		//重新开始
		}
		break;
	case 4:
		if (Data == JASON_HEAD_0)		//是B?
		{
			ucStepUart++;		//接收步骤++
			ucNumberUart = 0;
		}
		else
		{
			JasonReset();
		}
		break;
	case 5:
		if (ucNumberUart > MAX_JASON)		//超过长度? 当前按照读数据返回帧算18
		{
			JasonReset();
		}
		else
		{
			tyJasonMaster.Buffer[ucNumberUart] = Data;		//接收数据
			ucNumberUart++;
			if (ucNumberUart == 5)		//地址接收完是,长度
			{
				switch (tyJasonMaster.Rx.Cmd)		//根据命令计算出数据长度
				{
				case JASON_SET_PASSWORD:
				case JASON_SET_ADDR:
				case JASON_SET_READER:
					tyJasonMaster.Length = 12;
					break;
				case JASON_FACTORY_SET:
					tyJasonMaster.Length = 9;
					break;
				case JASON_READ_METER:
					tyJasonMaster.Length = JASON_READDAT_RE_LEN;
					break;

				default:
					tyJasonMaster.Length = 8;
					break;
				}
			}
			else if (tyJasonMaster.Length == ucNumberUart)
			{
				MemcpyFunc((u8*)&wNewCheck, &tyJasonMaster.Buffer[tyJasonMaster.Length - 3], 2);
				check = GetCrcCcitt(tyJasonMaster.Length - 3, tyJasonMaster.Buffer);		//计算接收到的数据的校验和
				if (wNewCheck == check)		//和计算接收到的校验和比较?
				{
					return JasonCmdMaster();			//上行协议处理
				}
				JasonReset();
			}
		}
		break;
	}
	return FALSE;
}

/******************************************************************************
* 函 数 名: JasonProtocolGM(void)
* 函数功能: 抄表应答数据解析
* 入口参数: 无
* 时	间: 2015年8月04日15:37:00
* 修 改 人: maronglang
* 说    明: 
*******************************************************************************/
u8 JasonGatherMeterDecode(u16 wTimeOut)
{
	u8 nData = 0;

	dwTime = GetSysTemTick();	
	while(1)
	{
		/* 软件喂狗 */
		FeedSoftWareIwdg();
		
		dwNowTime = GetSysTemTick();
		if (dwTime < dwNowTime)
		{
			 if(dwNowTime - dwTime > wTimeOut)
			 {
				JasonReset();
				break;
			 }
		}
		else if ((dwTime - dwNowTime) > wTimeOut)
		{
			JasonReset();
			break;
		}

		/* 接收数据 */
		if(0 == CheckRevDataLen())
		{
			continue;
		}
		
		nData = GetBusUartData();
		if(JasonReceiveMaster(nData))
		{
			return TRUE;
		}
	}
        
	return FALSE;
}

/******************************************************************************
* 函 数 名: JasonProtocolGM(void)
* 函数功能: 内部协议抄表
* 入口参数: 无
* 时	间: 2015年8月04日15:37:00
* 修 改 人: maronglang
* 说    明: 下行抄表
*******************************************************************************/
u8 JasonProtocolGM(void)
{
	u8 *point = NULL;
	u32 dwAddr = JASON_BROADCAST; //广播标志
	u8  nRef   = FALSE;
	
	point = aucUartTxBuffer;
	point += JASON_HEAD_OFFSET;
	SetPortMeterPowerOn();
	UC_SleepFunc(GM_DELAY);
	
	MemcpyFunc(point,(u8*)&dwAddr, JASON_ADDR_LEN);		//转存储
	point += JASON_ADDR_LEN;
	*point++ = JASON_READ_METER;

#ifdef IOT_DAT_DETECTOR
	DecIoModeChange(PULLUPOUTPUT);
	SetPortRS485Tx();
#endif	
	PackProtocolMaster(5);
#ifdef IOT_DAT_DETECTOR
	SetPortRS485Rx();
#endif
	nRef = JasonGatherMeterDecode(GM_TIMEOUT);		//捷先内部协议主机处理
#ifdef IOT_DAT_DETECTOR
	DecIoModeChange(FLOATINPUT);
#endif
	SetPortMeterPowerOff();	
	SetBusUart(COM_2, PARITY_EVEN);		//设置串口通道 修改回原来的偶校验
	return nRef;
}

/******************************************************************************
* 函 数 名: JasonProtocolGM(void)
* 函数功能: 内部协议开阀门
* 入口参数: 无
* 时	间: 2016年3月01日15:37:00
* 修 改 人: maronglang
* 说    明: 下行抄表
*******************************************************************************/
u8 JasonProtocolOptValve(u8 nOptCmd)
{
	u8 *point = NULL;
	u32 dwAddr = JASON_BROADCAST; //广播标志
	u8  nRef   = FALSE;

	if(VALVEOPEN == nOptCmd)
	{
		nOptCmd =  JASON_OPEN_VALVE;
	}
	else
	{
		nOptCmd =  JASON_CLOSE_VALVE;
	}	
	point = aucUartTxBuffer;
	point += JASON_HEAD_OFFSET;
	SetPortMeterPowerOn();	
	//LP_DelayMs(20);
	UC_SleepFunc(GM_DELAY);
	MemcpyFunc(point,(u8*)&dwAddr, JASON_ADDR_LEN);		//转存储
	point += JASON_ADDR_LEN;
	*point++ = nOptCmd;
	PackProtocolMaster(5);
	nRef = JasonGatherMeterDecode(OPTVALVE_TIMEOUT);		//捷先内部协议主机处理
	SetPortMeterPowerOff();	  
	return nRef;
}
#endif

/* CJ-T188协议 */
#ifdef PTROTO_CJ_188
/******************************************************************************
* 函 数 名: CJ_T188ProtocolGM(void)
* 函数功能: 188协议抄表
* 入口参数: 无
* 时	间: 2016年03月22日15:37:00
* 修 改 人: maronglang
* 说    明: 下行抄表
*******************************************************************************/
u8 CJ_T188ProtocolGM(void)
{
	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
	u8 nTempBuf[19]  = {0};

	SetPortMeterPowerOn();
	UC_SleepFunc(GM_DELAY);

	if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
		READDATA, NULL, 0, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
	{
		JX_BL_Change(4, &nTempBuf[0]);
		MemcpyFunc((u8*)&tyParameter.Value, &nTempBuf[0], 4);		
#ifdef VAVLE_METER
#ifdef VAVLE_INNER
		g_nValveStat = (nTempBuf[17]&0x03); 
#else
		g_nValveStat = GetBoardVavleStat();
#endif
#else
		g_nValveStat = 0;
#endif
		return TRUE;
	}
	SetPortMeterPowerOff();	
	UC_SleepFunc(GM_PWROFFDELAY); //add by maronglang 20160428
	
	return FALSE;
}

/******************************************************************************
* 函 数 名: CJ_T188ProtocolReadAdd(void)
* 函数功能: 读取表地址
* 入口参数: 无
* 时	间: 2016年04月26日15:37:00
* 修 改 人: maronglang
* 说    明: 读取表地址
*******************************************************************************/
u8 CJ_T188ProtocolReadAdd(u8* pnOutAddr)
{
	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
	u8 nTempBuf[12]  = {0};

	SetPortMeterPowerOn();
	UC_SleepFunc(GM_DELAY);

	if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
		READADDR, NULL, 0, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
	{
		MemcpyFunc(pnOutAddr, nTempBuf, 7);
		return TRUE;
	}
	SetPortMeterPowerOff();	  
	return FALSE;
}

#if 0
/******************************************************************************
* 函 数 名: CJ_T188ProtocolSetAdd(void)
* 函数功能: 读取表地址
* 入口参数: 无
* 时	间: 2016年04月26日15:37:00
* 修 改 人: maronglang
* 说    明: 读取表地址
*******************************************************************************/
u8 CJ_T188ProtocolSetAdd(u8* pnInAddr)
{
	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
	u8 nTempBuf[12]  = {0};
	u8 i = 0;

	SetPortMeterPowerOn();
	UC_SleepFunc(GM_DELAY);
	for(i = 0; i < 5; i++)
	{
		if(GM_WR_ADDR == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
			WRITEADDR, pnInAddr, 7, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
		{
			return TRUE;
		}
	}

	SetPortMeterPowerOff();	  
	return FALSE;
}
#endif

#ifdef VAVLE_INNER
/******************************************************************************
* 函 数 名: CJ_T188ProtocolGM(void)
* 函数功能: 188协议抄表
* 入口参数: 无
* 时	间: 2016年03月22日15:37:00
* 修 改 人: maronglang
* 说    明: 下行抄表
*******************************************************************************/
u8 CJ_T188ProtocolOptValve(u8 nOptCmd)
{
	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
	u8 nTmpBuf[19]  = {0};
	u8 i = 0;

	SetPortMeterPowerOn();
	UC_SleepFunc(GM_DELAY);

	if(GM_FAIL != CJ188GatherMeter(PTR_CJ_T188, nAddr, 
		nOptCmd, NULL, 0, nTmpBuf, sizeof(nTmpBuf), NULL, OPTVALVE_TIMEOUT))
	{
		for(i = 0; i < 7; i++)
		{
			UC_SleepFunc(4000);
			if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
				READDATA, NULL, 0, nTmpBuf, sizeof(nTmpBuf), NULL, GM_TIMEOUT))
			{
				g_nValveStat = (nTmpBuf[17]&0x03);
				if((VALVE_OPEN != g_nValveStat)&&(VALVE_CLOSE != g_nValveStat))
				{
					g_nValveStat = 0x03;
				}
				break;
			}
		}
		SetPortMeterPowerOff();   
		if(4 <= i)
		{
			return FALSE;
		}		
		if((VALVEOPEN == nOptCmd)&&VALVE_OPEN == g_nValveStat)
		{
			return TRUE;
		}			
		else if((VALVECLOSE == nOptCmd)&&(VALVE_CLOSE == g_nValveStat))
		{
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}
	SetPortMeterPowerOff();	  
	return FALSE;
}
#endif
#endif

/* 压力计 */
#ifdef   PIEZOMETER
/*************************************************************
    描    述：  CRC16校验计算子程序,速度慢，占用空间小(Modbus_RTU协议)
    入口参数：  指向数组指针，校验字节个数
    出口参数：  16位CRC校验码
**************************************************************/
unsigned short CRC16check(unsigned char *pcrc, unsigned char count)
{
	unsigned short crc16       = 0xA001;
	unsigned short crcregister = 0xFFFF;
	unsigned char  nTmp = 0, nCnt = 0, i = 0, j = 0;

	for(i = 0; i < count; i++)
	{
		crcregister = ((unsigned short)pcrc[i]^crcregister);	

		for(j = 0; j < 8; j++)
		{
			if((crcregister&0x01))   //注意先检测最低位是否为0再移位
				crcregister = ((crcregister>>1)^crc16);
			else
				crcregister = (crcregister>>1);
		}
	}

	return(crcregister);
}

/***
  * @brief    : ACR_Modbus规约数据包搜索函数
  * @param    : pnRecvBuf  <- 数据接收缓存
  *           : wRecvLen   <- 数据接收缓存长度 
  *           : pwFrameLen -> 数据帧长度
  *           : pwDatLen   -> 祯内数据长度
  *           : pnDatBuf   -> 祯内数据输出缓存
  * @retval   : ACR_Modbus格式祯长度(单位：字节)
***/
uint8_t*  ACR_Modbus_FindFrame(uint8_t* pnRecvBuf, uint16_t wRecvLen, 
								uint16_t *pwFrameLen,uint16_t *pwDatLen, uint8_t *pnDatBuf)
{
	uint8_t   nCmd, nLen;
	uint16_t  wFrmDatLen = 0, wCrcResult = 0, wFrameCrc = 0;
	uint32_t  i;


	for (i=0; (i<wRecvLen) && (pnRecvBuf!=NULL); i++)
	{
		if ((pnRecvBuf[i] != 0) && (pnRecvBuf[i + 1] != 0) && (pnRecvBuf[i + 2] != 0))
		{
			// 帧数据域长度
			wFrmDatLen = (uint16_t)(pnRecvBuf[i + _ACR_LEN_OFFSET]+5);
			if(wRecvLen < wFrmDatLen)
			{
				return NULL;
			}
			wCrcResult = CRC16check(pnRecvBuf, pnRecvBuf[i + _ACR_LEN_OFFSET]+_ACR_DAT_OFFSET);			

			wFrameCrc = pnRecvBuf[i +wFrmDatLen-1];
			wFrameCrc = (wFrameCrc<<8);
			wFrameCrc += pnRecvBuf[i +wFrmDatLen-2];

			// 帧校验码与帧结束符
			if ((wFrameCrc == wCrcResult) &&
				 ((i+wFrmDatLen) <= wRecvLen))
			{
				// 帧命令字
				nCmd = pnRecvBuf[i + _ACR_CMD_OFFSET];

				// 返回帧数据域长度
				if (pwDatLen != NULL)
				{
					nLen = (uint16_t)pnRecvBuf[i +  _ACR_LEN_OFFSET];
					if (nLen  == 0)
					{
						wFrmDatLen -= 1;
					}
					*pwFrameLen = wFrmDatLen;
					*pwDatLen   = nLen;
				}

				// 输出电表地址
				if (pnDatBuf != NULL)
				{
					pnDatBuf[0] = pnRecvBuf[i];
					//MemcpyFunc(pnDatBuf, pnRecvBuf + i, 1);
				}

				return (pnRecvBuf+i);
			}
		}
	}

	return (NULL);
}

/******************************************************************************
* 函 数 名: CJ_T188ProtocolGM(void)
* 函数功能: MODBUS协议抄读压力计
* 入口参数: 无
* 时	间: 2017年05月22日11:37:00
* 修 改 人: maronglang
* 说    明: 下行采集压力
*******************************************************************************/
u32 MODBUS_GetPizeometer(u8 nCmd)
{
	u8 nSendBuf[8] = {0x00,0x03,0x00,0x16,0x00,0x02,0x24,0x1e}; //抄表  
	//u8 nSetBuf[8] = {0x00,0x06,0x00,0x01,0x00,0x01,0x18,0x1B}; //抄表 00 06 00 01 00 01 00 02 CB CA
	//u8 nSaveBuf[8] = {0x00,0x06,0xFF,0xFF,0x00,0x00,0x88,0x3F}; //抄表 00 06 00 01 00 01 00 02 CB CA
	u8 nRecvlen = 0;
	u16 wRevFrameLen = 0, wFrameLen = 0;
	float dwPressure = 0.0;
	u32 dwPizeometer = INVALID_DATA;
	u8* pnBuf = NULL;
	u8 nBuf[4] = {0x3a,0x2b,0xa5,0x84};

	SetPortMeterPowerOn();
	if(READ_CMD == nCmd)
	{
		MemcpyFunc(aucUartTxBuffer,nSendBuf,8);
	}
	ClearRxBuff();
	SetBusUartBaudate(BAUDRATE_9600);	
	SetBusUart(COM_2, PARITY_NULL);		//设置串口通道号
	UC_SleepFunc(3000); //add by maronglang 20160428

	DecIoModeChange(PULLUPOUTPUT);
	SetPortRS485Tx();		
	/* 发送帧 */
	StartSendBusUartGroup(8);	
	SetPortRS485Rx();
	UC_SleepFunc(GM_PWROFFDELAY); //add by maronglang 20160428
	dwTime = GetSysTemTick();
	while(1)
	{
		/* 软件喂狗 */
		FeedSoftWareIwdg();
		dwNowTime = GetSysTemTick();
		if (dwTime < dwNowTime)
	    {
	         if(dwNowTime - dwTime > GM_DELAY)
	         {
	         	break;
	         }
		}
	    else if ((dwTime - dwNowTime) > GM_DELAY)
	    {
	    	break;
	    }

		/* 接收数据 */
		if(0 >= CheckRevDataLen())
		{
			continue;
		}
		nRecvlen = CheckRevDataLen();
		wFrameLen = 0;
		
		// 协议解帧
		pnBuf = ACR_Modbus_FindFrame(GetUartRxBuf(), 
									nRecvlen, &wRevFrameLen, &wFrameLen, NULL);
		// 分析返回数据
		if ((pnBuf != NULL) && (wRevFrameLen >= 4) )
		{		
			if (pnBuf[1] == 0x03)
			{
				MemcpyFunc((u8*)&dwPressure, &pnBuf[_ACR_DAT_OFFSET], wFrameLen);				
				dwPizeometer = JX_FloatToBin(dwPressure);				
				break;
			}
		}
	}	
	/**************just for test 20170518********************/ 
	//MemcpyFunc(&aucUartTxBuffer[1], (u8*)pnBuf, 9);
	//aucUartTxBuffer[0] = 0XF0;
	//FrameSendFunc(10, COM_2, NULL);
	/**************just for test 20170518********************/ 
	
	ClearRxBuff();
	DecIoModeChange(FLOATINPUT);
	UC_SleepFunc(GM_PWROFFDELAY); //add by maronglang 20160428	
	SetBusUartBaudate(BAUDRATE_2400);	
	SetBusUart(COM_2, PARITY_EVEN);		//设置串口通道号
	if(FALSE == GetTmDebugModeStat())
	{
		SetPortMeterPowerOff(); 
	}	
	return dwPizeometer;
}
#endif

/* 抄表阀控接口 */
#if 1
/******************************************************************************
* 函 数 名: GatherMeterFun(void)
* 函数功能: 抄表接口
* 入口参数: 无
* 时	间: 2016年03月22日15:37:00
* 修 改 人: maronglang
* 说    明: 下行抄表
*******************************************************************************/
u8 GatherMeterFun(void)
{
	u8 nRef = FALSE;
#ifdef PTROTO_JASON
	nRef = JasonProtocolGM();
#else
	nRef = CJ_T188ProtocolGM();
#endif

	if(GetTmDebugModeStat())
	{
		SetPortMeterPowerOn();
	}
	return nRef;
}

#ifndef VAVLE_INNER
#ifdef VAVLE_METER
/******************************************************************************
* 函 数 名: GetBoardVavleStat(void)
* 函数功能: 获取当前主板上阀门状态
* 入  参  : 无
* 出  参  : 无
* 返回值  : 阀门状态
* 时	间: 2016年12月15日15:37:00
* 作    者: maronglang
* 说    明: 阀控
*******************************************************************************/
u8 GetBoardVavleStat(void)
{
	u8 nMs1 = 0, nMs2 = 0, nVavleStat = VALVE_OPEN;

	ValveStatIoModeChange(PULLUPINPUT);	
	UC_SleepFunc(3);
	nMs1 = GetMs1Stat();
	nMs2 = GetMs2Stat();
	ValveStatIoModeChange(FLOATINPUT);	

	if((0 == nMs1)&&(0 != nMs2))
	{
		nVavleStat = VALVE_OPEN;
	}
	else if((0 != nMs1)&&(0 == nMs2))
	{
		nVavleStat = VALVE_CLOSE;
	}
	else
	{
		nVavleStat = VALVE_ERROR;
	}		
	
	return nVavleStat;
}
#endif
/******************************************************************************
* 函 数 名: VavleOperateFun(void)
* 函数功能: 阀控接口
* 入口参数: nOptCmd
* 时	间: 2016年03月22日15:37:00
* 作    者: maronglang
* 说    明: 阀控
*******************************************************************************/
u8 VavleOperateFunExt(u8 nOptCmd)
{
	u8 nRef = FALSE, nCnt = 0;
	u16 wVol = 0;
#ifdef VAVLE_METER

	g_nValveStat = GetBoardVavleStat();

	if(((VALVE_CLOSE == g_nValveStat)&&(VALVECLOSE == nOptCmd))
		|| ((VALVE_OPEN == g_nValveStat)&&(VALVEOPEN == nOptCmd)))
	{
		return TRUE;
	}
	
	//if(GetTmDebugModeStat())    // 任何时候都应该启开启GPRS电源，因4.2V阀控供电与GPRS电源共用 20170317
	{
		SetPortGsmPowerOn();
	}
	/* 供电10S */
	MotoVccOn();	
	UC_SleepFunc(2000);
#if 0
	while(nCnt < VAVLE_DELAY)
	{
		UC_SleepFunc(1000);
		nCnt++;
		wVol = ADC_GetVavleCtlVol();
		if(3090 <= wVol)
		{
		  UC_SleepFunc(3000);
			break;
		}
	}
	if(nCnt>= VAVLE_DELAY)
	{
		MotoVccOff();      //关闭控阀IO口
		return FALSE;
	}
#endif
	if(VALVECLOSE == nOptCmd)
	{
		MotoPosiHigh();
		MotoNegaLow();
		nCnt = 0;
		do
		{
			UC_SleepFunc(VAVLE_OPT_DELAY);
			g_nValveStat = GetBoardVavleStat();
			if(VALVE_CLOSE == g_nValveStat)
			{
				nRef = TRUE;
				break;
			}
			nCnt++;			
			FeedSoftWareIwdg();
		}while(VAVLE_TIMEOUT>nCnt);
	}
	else
	{
		MotoPosiLow();
		MotoNegaHigh();
		do
		{
			UC_SleepFunc(VAVLE_OPT_DELAY);
			g_nValveStat = GetBoardVavleStat();
			if(VALVE_OPEN == g_nValveStat)
			{
				nRef = TRUE;
				break;
			}
			nCnt++;			
			FeedSoftWareIwdg();
		}while(VAVLE_TIMEOUT>nCnt);
	}

	MotoVccOff();
	if(GetTmDebugModeStat())
	{
		SetPortGsmPowerOff();
	}
	MotoPosiLow();
	MotoNegaLow();	
#endif
	return nRef;
}

/******************************************************************************
* 函 数 名: GetVavleStat(void)
* 函数功能: 获取阀门状态
* 入口参数: nOptCmd
* 时	间: 2016年05月10日15:37:00
* 作    者: maronglang
* 说    明: 阀控
*******************************************************************************/
u8 GetVavleStat(void)
{
	return g_nValveStat;
}

#else
/******************************************************************************
* 函 数 名: VavleOperateFun(void)
* 函数功能: 阀控接口
* 入口参数: nOptCmd
* 时	间: 2016年03月22日15:37:00
* 作    者: maronglang
* 说    明: 阀控
*******************************************************************************/
u8 VavleOperateFunExt(u8 nOptCmd)
{
	u8 nRef = FALSE;
	
#ifdef PTROTO_JASON
	nRef = JasonProtocolOptValve(nOptCmd);
#else
	nRef = CJ_T188ProtocolOptValve(nOptCmd);
#endif
	if(GetTmDebugModeStat())
	{
		SetPortMeterPowerOn();
	}
	
	return nRef;
}

/******************************************************************************
* 函 数 名: GetVavleStat(void)
* 函数功能: 获取阀门状态
* 入口参数: nOptCmd
* 时	间: 2016年05月10日15:37:00
* 作    者: maronglang
* 说    明: 阀控
*******************************************************************************/
u8 GetVavleStat(void)
{
	return g_nValveStat;
}
#endif

/******************************************************************************
* 函 数 名: VavleOperateFun(void)
* 函数功能: 阀控接口
* 入口参数: nOptCmd
* 时	间: 2016年03月22日15:37:00
* 作    者: maronglang
* 说    明: 阀控
*******************************************************************************/
u8 VavleOperateFun(u8 nOptCmd)
{
	u8 nRef = FALSE;
	
	nRef = VavleOperateFunExt(nOptCmd);
	return nRef;
}

#endif


/* 调试及参数设置 */
#if 1
#if 0
/**********************************************/
/* 表端同步地址
函数名: SyncMeterBoradAdd
入  参: void
出  参: void
返回值: u16
修改人: maronglang
日  期: 2017.05.13
*//*********************************************/
void SyncMeterBoradAdd(u8 *pnBuf)
{
	u16 wAddrLow = 0, wAddrHigh = 0;	
	u8 nApnBuf[18];
	
	JX_BL_Change(5, pnBuf);
	JX_HexToASCII(pnBuf, nApnBuf, 5);
	nApnBuf[10] = 0;
	wAddrLow	= JX_BcdStrTo16BitBin(&nApnBuf[5], 5);
	nApnBuf[5]	= 0;
	wAddrHigh	= JX_BcdStrTo16BitBcd(&nApnBuf[1], 4);
	MemcpyFunc(pnBuf, (u8*)&wAddrHigh, 2);
	MemcpyFunc(&pnBuf[2], (u8*)&wAddrLow, 2);
	JX_BL_Change(2, pnBuf);
	JX_BL_Change(2, &pnBuf[2]);
	MemcpyFunc((u8 *)&tyParameter.Address, pnBuf, 4);
	SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
	UC_SleepFunc(60);
}
/**********************************************/
/* 表端同步地址
函数名: SyncMeterBoradAdd
入  参: void
出  参: void
返回值: u16
修改人: maronglang
日  期: 2017.05.13
*//*********************************************/
u8 SetMeterBoradAdd(u8 *pnBuf)
{
	u16 wAddrLow = 0, wAddrHigh = 0;	
	u8 nBuf[7], nTemp = 0;
	u8 nTempAdd[4] = {0};

	MemsetFunc(nBuf, 0, 7);
	MemcpyFunc(nTempAdd, pnBuf, 4);
	//nTemp = pnBuf[2];
	///pnBuf[2] = pnBuf[3];
	//pnBuf[3] = nTemp;
	JX_BL_Change(2,&nTempAdd[2]);
	JX_BL_Change(2,nTempAdd);
	MemcpyFunc((u8*)&wAddrHigh, nTempAdd, 2);
	MemcpyFunc((u8*)&wAddrLow, &nTempAdd[2], 2);
	JX_DWORDToBCD((u32)wAddrLow, nBuf, 3);	
	nTemp = ((wAddrHigh&0x000F)<<4);
	nBuf[2] = (nTemp|nBuf[2]);
	wAddrHigh = (wAddrHigh>>4);
	MemcpyFunc(&nBuf[3], (u8*)&wAddrHigh, 2);
	JX_BL_Change(2,&nBuf[3]);
	return CJ_T188ProtocolSetAdd(nBuf);
}
#endif



/***********************************************/
/* 打印函数
函数名: DG_DebugPrintfFun
入	参: void
出	参: void
返回值: u32
修改人: maronglang
日	期: 2015.08.21
*//*********************************************/
u32 DG_DebugPrintfFun(u8 *pnBuf, u8 nLen, u8 nIndex)
{
#if 0
	// just for test 20170518
	MemcpyFunc(&aucUartTxBuffer[1], pnBuf, nLen);
	aucUartTxBuffer[0] = nIndex;
	FrameSendFunc(nLen+3, COM_2, NULL);
#endif
}

/******************************************************************************
* 函 数 名: fixTaskProtocolDebug(void)
* 函数功能: TTL上行调试及参数设置
* 入口参数: 无
* 时	间: 2015年10月15日15:37:00
* 修 改 人: maronglang
*******************************************************************************/
void fixTaskProtocolDebug(void)
{
	u8 channel  = 0;
	u8 nSendLen = 0;

	channel = CheckWhichBusUartReceive();		//接收到数据?

	/* 其他串口接收数据则不处理 */
	if (COM_2 != CheckWhichBusUartReceive())
	{
		return ;
	}
	
	UC_SleepFunc(180);
#ifdef  JASON130_PTR   //130协议
	if(0 < (nSendLen = DecodeParameter(GetUartRxBuf(), CheckRevDataLen())))
	{
		Protol130Send(nSendLen, COM_2);
	}
#else                //新疆协议
	if(0 < (nSendLen = XJ_DecodeParameter(GetUartRxBuf(), CheckRevDataLen())))
	{
		XJ_ProtolSend(nSendLen, COM_2);
	}
#endif
}


/***********************************************/
/* 获取当前滴答数接口 返回当前Tick数
函数名: GetSysTemTick
入	参: void
出	参: void
返回值: u32
修改人: maronglang
日	期: 2015.08.21
*//*********************************************/
u32 GetSysTemTick(void)
{
	return g_dwSysTick;
}
/***********************************************/
/* 调试模块初始化函数
函数名: InitializeProtocol
入	参: void
出	参: void
返回值: u32
修改人: maronglang
日	期: 2015.08.21
*//*********************************************/
void InitializeProtocol(void)
{
	u8 nTmpBuf[7] = {0};
	u8 i = 0;
	
	ucTimerProtocol = 10;
	ucMasterCmd = 0;
	ucSlaveCmd = 0;
	ClearRxBuff();

	if ((FALSE == ReadParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA)))
	{
#ifdef  JASON130_PTR   //130协议
		tyParameter.Type = COLD_WATER_METER;
		tyParameter.Status = INIT_STATUS;
		tyParameter.Password = INIT_PASSWORD;
		tyParameter.dwPurchaseVal = 0;
		tyParameter.nEmergencyVal = 5;
		tyParameter.nOverBuyFlg = 0;
#ifdef PIEZOMETER
		tyParameter.nAlmCtl[0]= 0x00; // 01
		tyParameter.wBasePress = 500;
		tyParameter.nUpLmtRate = 20;
		tyParameter.nDownLmtRate = 20;
#endif
#else   //新疆协议 
		tyParameter.Type = COLD_WATER_METER;
		MemsetFunc(tyParameter.Status, INIT_STATUS, 4);
		MemsetFunc(tyParameter.Address, 0x11, sizeof(tyParameter.Address));
		tyParameter.FactoryCode[0] = 0x16;
		tyParameter.FactoryCode[1] = 0x88;
		MemsetFunc(tyParameter.RestoreStat, 0xFF, 4);
#endif
	}
	tyParameter.Value = INVALID_DATA;
	
	if ((FALSE == ReadParameterForType((u8*)&g_dwTmAddress, sizeof(g_dwTmAddress), TM_ADDRESS_PRAA)))
	{
		g_dwTmAddress = INIT_ADDRESS;
	}
}

#endif

/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
