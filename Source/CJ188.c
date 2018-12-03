
#include"CJ188.h"
#include "JX_Math.h"
#include "global.h"
#include "DriverUart.h"
//#include <string.h>
#include "Meter.h"


/* 协议收发帧结构 */
Pro_Com_Str comm;


/* 数据收发序号 */
u8 g_nSeqNum = 0;

#ifdef  PTROTO_CJ_188
/******************************************************************************
* 函 数 名: Comm_Rst(void)
* 函数功能: 通讯状态重置
* 入口参数: 无
* 时	间: 2013年6月18日 17:48:20
* 作    者: 
* 说    明: 
*******************************************************************************/
void Comm_Rst(void)
{
	ClearRxBuff();
	comm.status = CJ188_HEAD;//接收超时
}
/******************************************************************************
* 函 数 名: CJ188CommSendData(void)
* 函数功能: 通讯发送数据
* 入口参数: 无
* 时	间: 2015年8月13日 18:15:30
* 作    者: 
* 说    明: 
*******************************************************************************/
void CJ188CommSendData(void)
{
	u8 i,cs,lenth, nTxLen = 0;
	u8 *pnBuf = NULL;

	pnBuf = aucUartTxBuffer;
	cs = COMM_HEAD;
	lenth = (u8)(PUBLIC_LENTH+CommF.meter_lenth);

	for(i=0;i<lenth;i++)
	{
		cs += CommUF.buff[i];
	}
	for(i=0;i<3;i++) // 3个0xFE引导码
	{
		pnBuf[i] = LOND_COND;
	}
	
	pnBuf[i++] = COMM_HEAD;
	MemcpyFunc(&pnBuf[i], CommUF.buff, lenth);
	pnBuf[i+lenth] = cs;
	pnBuf[i+lenth+1] = COMM_END;
	nTxLen = i+lenth+2;
	
	SetBusUart(COM_2, PARITY_EVEN);		//设置串口通道号
	StartSendBusUartGroup(nTxLen);
}
/******************************************************************************
* 函 数 名: CJ188RecMeterValueCmdPro(void)
* 函数功能: 收到读表命令处理函数
* 入口参数: 无
* 时	间: 2013年5月9日 16:15:30
* 作    者: 
* 说    明: 读表信息并发送表数和相应信息
*******************************************************************************/
void CJ188SendReadMeter(u8 nPtrType, u8* pnInBuf, u8 nLen)
{
	u8 nDataLen = 0;

	CommF.meter_type = 0x10;  //先写死为冷水表

	/* 抄表 */
	if(CJ188_READ_VALUE == CommF.meter_cmd)
	{
		if(PTR_CJ_T188 == nPtrType)
		{
			MeterID.meter_ID = CJ188_READ_VALUE_ID;
		}
		else
		{
			MeterID.meter_ID = CJ188_READ_VALUE_ID1;
		}
		nDataLen = 0x03;
	}

	/* 读地址 */
	if(CJ188_READ_ADDR == CommF.meter_cmd)
	{
		MemsetFunc(CommF.meter_addr, 0xAA, sizeof(CommF.meter_addr));
		if(PTR_CJ_T188 == nPtrType)
		{
			MeterID.meter_ID = CJ188_READ_ADDR_ID;
		}
		else
		{
			MeterID.meter_ID = CJ188_READ_ADDR_ID1;
		}
		nDataLen = 0x03;
	}

	/* 写地址 */
	if(CJ188_WRITE_ADDR == CommF.meter_cmd)
	{
		if((NULL != pnInBuf)&&(sizeof(CommTx.buff) > nLen))
		{
			nDataLen = 0x03+nLen;    
			MemcpyFunc(&CommUF.buff[PUBLIC_LENTH+3], pnInBuf, nLen); //四字节对齐问题直接用buff进行处理
		}

		if(PTR_CJ_T188 == nPtrType)
		{
			MeterID.meter_ID = CJ188_WRITE_ADDR_ID;
		}
		else
		{
			MeterID.meter_ID = CJ188_WRITE_ADDR_ID1;
		}
		nDataLen = 0x03+nLen;
	}

	/* 开关阀 */
	if(CJ188_WRITE_JSVALVE == CommF.meter_cmd)
	{
		if((NULL != pnInBuf)&&(0 < nLen))
		{
			nDataLen = 0x03+nLen;    
			MemcpyFunc(&CommUF.buff[PUBLIC_LENTH+3], pnInBuf, nLen); //四字节对齐问题直接用buff进行处理
		}
		
		if(PTR_CJ_T188 == nPtrType)
		{
			CommF.meter_cmd = CJ188_WRITE_COMMON;
			MeterID.meter_ID = CJ188_WRITE_VALVE_ID; //标准188
		}
		else
		{
			MeterID.meter_ID = CJ188_WRITE_VALVE_ID1; //非标188
		}
	}

	CommF.meter_lenth = nDataLen;		
	CommF.meter_ser = g_nSeqNum++;
	CJ188CommSendData();
	return ;
}

/******************************************************************************
* 函 数 名: RecMeterCmdPro(void)
* 函数功能: 收到读表命令处理函数
* 入口参数: 无
* 时	间: 2013年5月9日 16:15:30
* 作    者: 
* 说    明: 读表信息并发送表数和相应信息
*******************************************************************************/
u8 CJ188RecDataPro(u8 nCmd, u8 *pnOutBuf, u8 nOutLen)
{
	if(CJ188_READ_VALUE_RE == CommF.meter_cmd)//抄表应答命令
	{
		/* 数据长度 */
		if(3+4+2 > CommF.meter_lenth)
		{
			return FALSE;
		}
		
		/* 数据项判断 */
		if((CJ188_READ_VALUE_ID1 != MeterID.meter_ID)&&(CJ188_READ_VALUE_ID != MeterID.meter_ID))
		{
			return FALSE;
		}

		/* 读数故障位判断 */
		if(SUCCESS_GLOBAL != (JX_FAULT_BIT& CommRxDat.status))
		{
			return FALSE;
		}	
		MemcpyFunc(pnOutBuf, CommRx.buff, nOutLen);
	}
	else if(CJ188_READ_ADDR_RE == CommF.meter_cmd)// 读表地址
	{
		/* 数据长度 */
		if(3 != CommF.meter_lenth)
		{
			return FALSE;
		}
		
		/* 数据项判断 */
		if((CJ188_READ_ADDR_ID != MeterID.meter_ID)&&(CJ188_READ_ADDR_ID1 != MeterID.meter_ID))
		{
			return FALSE;
		}
		
		/* 数据项判断 */
		if(NULL == pnOutBuf)
		{
			return FALSE;
		}
		
		MemcpyFunc(pnOutBuf, CommF.meter_addr, sizeof(CommF.meter_addr));
	}
	else if(CJ188_WRITE_ADDR_RE == CommF.meter_cmd)// 写表地址
	{
		/* 数据长度 */
		if(3 != CommF.meter_lenth)
		{
			return FALSE;
		}
		
		/* 数据项判断 */
		if((CJ188_WRITE_ADDR_ID1 != MeterID.meter_ID)&&(CJ188_WRITE_ADDR_ID != MeterID.meter_ID))
		{
			return FALSE;
		}
	}
	else /* 阀门控制 */
	{
		/* 数据长度 */
		if(3 > CommF.meter_lenth)
		{
			return FALSE;
		}
		
		/* 数据项判断 */
		if((CJ188_WRITE_VALVE_ID1 != MeterID.meter_ID)&&(CJ188_WRITE_VALVE_ID != MeterID.meter_ID))
		{
			return FALSE;
		}

		if((JX_VALVE_OPEN == nCmd)&&(0 != CommRx.buff[0]))
		{
			return FALSE;
		}

		if((JX_VALVE_CLOSE == nCmd)&&(1 != CommRx.buff[0]))
		{
			return FALSE;
		}
	}

	return TRUE;
}

/******************************************************************************
* 函 数 名: Comm_SendCmd(void)
* 函数功能: 跟进命令组帧发送
* 入口参数: 无
* 时	间: 2015年8月13日 16:00:31
* 作    者: 
* 说    明: 发送188协议命令帧
*******************************************************************************/
void CJ188Comm_SendCmd(u8 nPtrType, u8* pnInBuf, u8 nLen)
{
	//先写死为冷水表
	CJ188SendReadMeter(nPtrType, pnInBuf, nLen);
	return ;
}

/******************************************************************************
* 函 数 名: Comm_OkProc(void)
* 函数功能: Communication OK处理函数
* 入口参数: 无
* 时	间: 2013年5月9日 16:00:31
* 作    者: 
* 说    明: 接收数据ok处理
*******************************************************************************/
u8 CJ188Comm_OkProc(u8 nCmd, u8 *pnAddr, u8 *pnOutBuf, u8 nOutLen, u8* pnNewAdd)
{
	u8 i = 0;
	u8 nCurrAdd[7] = {0};

	MemsetFunc(nCurrAdd, 0, sizeof(nCurrAdd));
	if(CJ188_WRITE_ADDR_RE == CommF.meter_cmd)
	{
		MemcpyFunc(nCurrAdd, pnNewAdd, sizeof(nCurrAdd));
	}
	else
	{
		MemcpyFunc(nCurrAdd, pnAddr, sizeof(nCurrAdd));
	}
	
	for(i=0;i<7;i++)//确认地址
	{
		if((nCurrAdd[i]!=COM_188CODE)&&(CommF.meter_addr[i]!=nCurrAdd[i]))
		{	
			return FALSE;//不是广播地址而且地址错误则不处理
		}
	}
	
	return CJ188RecDataPro(nCmd, pnOutBuf, nOutLen);
	
}
/******************************************************************************
* 函 数 名: CJ188_RecProc(void)
* 函数功能: CJ188协议串口接收处理函数
* 入口参数: 无
* 时	间: 2013年5月9日 14:46:30
* 作    者: 
* 说    明: 对接收的数据Data解析并处理
*******************************************************************************/
s8 CJ188RecProc(u8 Data)
{
	u8 i,lenth,checksum;
	static u8 nDatRevCnt = 0;

	switch(comm.status)
	{
		case CJ188_HEAD://接收头
			if(Data==COMM_HEAD)
			{
				comm.status = CJ188_TYPE;
				comm.cnt = 0;
			}
			break;
		case CJ188_TYPE://接收表类型
			CommF.meter_type  = Data;
			comm.status = CJ188_ADDR;
			break;
		case CJ188_ADDR://接收7个地址位
			CommF.meter_addr[comm.cnt++] = Data;
			if(comm.cnt>=7)
			{
				comm.cnt = 0;
				comm.status = CJ188_CMD;
			}
			break;
		case CJ188_CMD://接收操作命令
			CommF.meter_cmd = Data;
			comm.status = CJ188_LENTH;			
			break;			
		case CJ188_LENTH://接收到数据长度
			CommF.meter_lenth = Data;
			comm.cnt = 0;
			comm.status = CJ188_ID;
			break;
		case CJ188_ID://接收2个标识位
			MeterID.meter_id[comm.cnt++] = Data;
			if(comm.cnt>=CommF.meter_lenth)//如果lenth==2则跳至校验
			{
				comm.status = CJ188_CS;
			}
			else if(comm.cnt>=2)
			{
				comm.status = CJ188_SER;
			}
			break;
		case CJ188_SER://接收1个序号
			CommF.meter_ser = Data;
			comm.cnt++;

			if(comm.cnt<CommF.meter_lenth)//如果lenth>3则有数据 
			{
				comm.status = CJ188_DATA;
			}
			else
			{
				comm.status = CJ188_CS;
			}
			break;
		case CJ188_DATA://接收有效数据 只有长度大于3的才会出现
			CommRx.buff[nDatRevCnt++] = Data; //从单片机移植过来导致出现4字节对齐问题已经修改
			comm.cnt++;
			if(comm.cnt==CommF.meter_lenth)
			{
				nDatRevCnt = 0;
				comm.status = CJ188_CS;
			}
			break;
		case CJ188_CS://接收校验和 
			comm.checksum = Data;
			comm.status = CJ188_END;
			break;
		case CJ188_END://接收尾
			if(Data==COMM_END)
			{	
				checksum = COMM_HEAD;
#if 0
				lenth = (u8)(PUBLIC_LENTH+CommF.meter_lenth+3); //特殊处理4字节对齐问题+3
				for(i=0;i<lenth;i++)
				{
					checksum += CommUF.buff[i];
				}
#endif
				lenth = (u8)(PUBLIC_LENTH+3); //特殊处理4字节对齐问题
				for(i=0;i<lenth;i++)
				{
					checksum += CommUF.buff[i];
				}
				for(i = 0; i < CommF.meter_lenth - 3; i++)
				{
					checksum += CommRx.buff[i];
				}

				if(checksum == comm.checksum)
				{
					comm.flagok = 1;//接收数据OK 
					return TRUE;
				}
				else 
				{
					comm.flag_error = 1;					
				}
			}
		default:
			comm.status = CJ188_HEAD;
			break;
	}

	return FALSE;
}

/***********************************************/
/* 超时接收数据接口
函数名: CJ188RecvData
入	参: nMaxRxLen wTimeMs
出	参: pnOutBuf
返回值: void
修改人: maronglang
日	期: 2015.08.11
*//*********************************************/
s8 CJ188RecvData(u32 dwTimeMs)
{
	u8  nLoop     = 0, nData = 0;
	u32 dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
	u8 nRxHead    = 0;
	
	dwTimeOut = dwTimeMs;

	/* 软件喂狗 */
	FeedSoftWareIwdg();
	
	dwTime = GetSysTemTick();

	while(1)
	{
		/* 软件喂狗 */
		FeedSoftWareIwdg();
		dwNowTime = GetSysTemTick();
		if (dwTime < dwNowTime)
	    {
	         if(dwNowTime - dwTime > dwTimeOut)
	         {
	         	break;
	         }
		}
	    else if ((dwTime - dwNowTime) > dwTimeOut)
	    {
	    	break;
	    }

		/* 接收数据 */
		if(0 >= CheckRevDataLen())
		{
			continue;
		}

		/* 接收数据 */
		nData = GetBusUartData();
		if(CJ188RecProc(nData))
		{
			Comm_Rst();
			return TRUE;
		}
	}
	
	Comm_Rst();
	return FALSE;
}

/***********************************************/
/* CJ-T188协议掌机抄表接口
函数名: CJ188GatherMeter
入	参: pnAddr
出	参: pnSendBuf
返回值: u8
修改人: maronglang
日	期: 2015.08.11
*//*********************************************/
s8 CJ188GatherMeter(u8 nPtrType, u8 *pnAddr, u8 nCmd, u8 *pnInBuf, 
					u8 nLen, u8 *pnOutBuf, u8 nOutLen, u8 *pnOutAdd, u32 dwTimeMs)
{
	u8 nDataLen = 0;
	s8 nRef = 0;
	u8 nNewAddr[7];
	u8 nTmpBuf[19]  = {0};
	u8 nTmpCmd     = 0;
	
	MemsetFunc(nTmpBuf, 0, sizeof(nTmpBuf));
	
	Comm_Rst();
	
	/* 当前地址 */
	MemcpyFunc(CommF.meter_addr, pnAddr, sizeof(CommF.meter_addr));

	/* 控制命令获取 抄表、抄表标号、阀控、设置表号 */
	if(READDATA == nCmd)
	{
		nTmpCmd = CJ188_READ_VALUE;
	}
	else if(WRITEADDR == nCmd)
	{
		nTmpCmd = CJ188_WRITE_ADDR;
		MemcpyFunc(nNewAddr, pnInBuf, sizeof(nNewAddr));
		nDataLen = sizeof(nNewAddr);
	}
	else if(READADDR == nCmd)
	{
		nTmpCmd = CJ188_READ_ADDR;
	}	
	else  /* 表安装地址则进行地址转换 */
	{
		if(VALVEOPEN == nCmd)
		{
			nNewAddr[0] = JX_VALVE_OPEN;
		}
		else
		{
			nNewAddr[0] = JX_VALVE_CLOSE;
		}
		nDataLen = 1;
		nTmpCmd     = CJ188_WRITE_JSVALVE;
	}
	CommF.meter_cmd = nTmpCmd;

#ifdef IOT_DAT_DETECTOR
	DecIoModeChange(PULLUPOUTPUT);
	SetPortRS485Tx();
#endif
	
	/* 发送帧 */
	CJ188Comm_SendCmd(nPtrType, nNewAddr, nDataLen);

#ifdef IOT_DAT_DETECTOR
	SetPortRS485Rx();
#endif

	/* 数据接收 */
	nRef = CJ188RecvData(dwTimeMs);
#ifdef IOT_DAT_DETECTOR
	DecIoModeChange(FLOATINPUT);
#endif

	if(FALSE > nRef)
	{
		return GM_EXIT;
	}
	if(FALSE == nRef)
	{
		return GM_FAIL;
	}

	if(comm.flagok)//接收数据OK 则处理
	{		
		/*当前终端地址， 输出数据(表号/表读数)， 输出长度， 设置的新表号 */
		nRef = CJ188Comm_OkProc(nNewAddr[0], pnAddr, nTmpBuf, sizeof(nTmpBuf), nNewAddr);
		comm.flagok = 0;
		comm.flag_error = 0;
		if(FALSE == nRef)
		{
			return GM_FAIL;
		}
		
		if((CJ188_READ_VALUE_RE == CommF.meter_cmd)&&((NULL != pnOutBuf)&&(nOutLen > 0)))
		{
			MemcpyFunc(pnOutBuf, &nTmpBuf[0], nOutLen);
		}			
		
		if((CJ188_READ_ADDR_RE == CommF.meter_cmd)&&(NULL != nTmpBuf))
		{
			MemcpyFunc(pnOutBuf, nTmpBuf, 7);
		}

		if((READDATA == nCmd)||(READADDR == nCmd))
		{
			return GM_SUCC;
		}
		else if(WRITEADDR == nCmd)
		{
			return GM_WR_ADDR;
		}
		else if(VALVEOPEN == nCmd)
		{
			return GM_ON_VALVE;
		}
		else if(VALVECLOSE == nCmd)
		{
			return GM_OFF_VALVE;
		}
		else
		{
			return GM_FAIL;
		}		
	}
	return GM_FAIL;
}

#endif

