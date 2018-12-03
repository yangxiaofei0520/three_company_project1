
#include"CJ188.h"
#include "JX_Math.h"
#include "global.h"
#include "DriverUart.h"
//#include <string.h>
#include "Meter.h"


/* Э���շ�֡�ṹ */
Pro_Com_Str comm;


/* �����շ���� */
u8 g_nSeqNum = 0;

#ifdef  PTROTO_CJ_188
/******************************************************************************
* �� �� ��: Comm_Rst(void)
* ��������: ͨѶ״̬����
* ��ڲ���: ��
* ʱ	��: 2013��6��18�� 17:48:20
* ��    ��: 
* ˵    ��: 
*******************************************************************************/
void Comm_Rst(void)
{
	ClearRxBuff();
	comm.status = CJ188_HEAD;//���ճ�ʱ
}
/******************************************************************************
* �� �� ��: CJ188CommSendData(void)
* ��������: ͨѶ��������
* ��ڲ���: ��
* ʱ	��: 2015��8��13�� 18:15:30
* ��    ��: 
* ˵    ��: 
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
	for(i=0;i<3;i++) // 3��0xFE������
	{
		pnBuf[i] = LOND_COND;
	}
	
	pnBuf[i++] = COMM_HEAD;
	MemcpyFunc(&pnBuf[i], CommUF.buff, lenth);
	pnBuf[i+lenth] = cs;
	pnBuf[i+lenth+1] = COMM_END;
	nTxLen = i+lenth+2;
	
	SetBusUart(COM_2, PARITY_EVEN);		//���ô���ͨ����
	StartSendBusUartGroup(nTxLen);
}
/******************************************************************************
* �� �� ��: CJ188RecMeterValueCmdPro(void)
* ��������: �յ������������
* ��ڲ���: ��
* ʱ	��: 2013��5��9�� 16:15:30
* ��    ��: 
* ˵    ��: ������Ϣ�����ͱ�������Ӧ��Ϣ
*******************************************************************************/
void CJ188SendReadMeter(u8 nPtrType, u8* pnInBuf, u8 nLen)
{
	u8 nDataLen = 0;

	CommF.meter_type = 0x10;  //��д��Ϊ��ˮ��

	/* ���� */
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

	/* ����ַ */
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

	/* д��ַ */
	if(CJ188_WRITE_ADDR == CommF.meter_cmd)
	{
		if((NULL != pnInBuf)&&(sizeof(CommTx.buff) > nLen))
		{
			nDataLen = 0x03+nLen;    
			MemcpyFunc(&CommUF.buff[PUBLIC_LENTH+3], pnInBuf, nLen); //���ֽڶ�������ֱ����buff���д���
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

	/* ���ط� */
	if(CJ188_WRITE_JSVALVE == CommF.meter_cmd)
	{
		if((NULL != pnInBuf)&&(0 < nLen))
		{
			nDataLen = 0x03+nLen;    
			MemcpyFunc(&CommUF.buff[PUBLIC_LENTH+3], pnInBuf, nLen); //���ֽڶ�������ֱ����buff���д���
		}
		
		if(PTR_CJ_T188 == nPtrType)
		{
			CommF.meter_cmd = CJ188_WRITE_COMMON;
			MeterID.meter_ID = CJ188_WRITE_VALVE_ID; //��׼188
		}
		else
		{
			MeterID.meter_ID = CJ188_WRITE_VALVE_ID1; //�Ǳ�188
		}
	}

	CommF.meter_lenth = nDataLen;		
	CommF.meter_ser = g_nSeqNum++;
	CJ188CommSendData();
	return ;
}

/******************************************************************************
* �� �� ��: RecMeterCmdPro(void)
* ��������: �յ������������
* ��ڲ���: ��
* ʱ	��: 2013��5��9�� 16:15:30
* ��    ��: 
* ˵    ��: ������Ϣ�����ͱ�������Ӧ��Ϣ
*******************************************************************************/
u8 CJ188RecDataPro(u8 nCmd, u8 *pnOutBuf, u8 nOutLen)
{
	if(CJ188_READ_VALUE_RE == CommF.meter_cmd)//����Ӧ������
	{
		/* ���ݳ��� */
		if(3+4+2 > CommF.meter_lenth)
		{
			return FALSE;
		}
		
		/* �������ж� */
		if((CJ188_READ_VALUE_ID1 != MeterID.meter_ID)&&(CJ188_READ_VALUE_ID != MeterID.meter_ID))
		{
			return FALSE;
		}

		/* ��������λ�ж� */
		if(SUCCESS_GLOBAL != (JX_FAULT_BIT& CommRxDat.status))
		{
			return FALSE;
		}	
		MemcpyFunc(pnOutBuf, CommRx.buff, nOutLen);
	}
	else if(CJ188_READ_ADDR_RE == CommF.meter_cmd)// �����ַ
	{
		/* ���ݳ��� */
		if(3 != CommF.meter_lenth)
		{
			return FALSE;
		}
		
		/* �������ж� */
		if((CJ188_READ_ADDR_ID != MeterID.meter_ID)&&(CJ188_READ_ADDR_ID1 != MeterID.meter_ID))
		{
			return FALSE;
		}
		
		/* �������ж� */
		if(NULL == pnOutBuf)
		{
			return FALSE;
		}
		
		MemcpyFunc(pnOutBuf, CommF.meter_addr, sizeof(CommF.meter_addr));
	}
	else if(CJ188_WRITE_ADDR_RE == CommF.meter_cmd)// д���ַ
	{
		/* ���ݳ��� */
		if(3 != CommF.meter_lenth)
		{
			return FALSE;
		}
		
		/* �������ж� */
		if((CJ188_WRITE_ADDR_ID1 != MeterID.meter_ID)&&(CJ188_WRITE_ADDR_ID != MeterID.meter_ID))
		{
			return FALSE;
		}
	}
	else /* ���ſ��� */
	{
		/* ���ݳ��� */
		if(3 > CommF.meter_lenth)
		{
			return FALSE;
		}
		
		/* �������ж� */
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
* �� �� ��: Comm_SendCmd(void)
* ��������: ����������֡����
* ��ڲ���: ��
* ʱ	��: 2015��8��13�� 16:00:31
* ��    ��: 
* ˵    ��: ����188Э������֡
*******************************************************************************/
void CJ188Comm_SendCmd(u8 nPtrType, u8* pnInBuf, u8 nLen)
{
	//��д��Ϊ��ˮ��
	CJ188SendReadMeter(nPtrType, pnInBuf, nLen);
	return ;
}

/******************************************************************************
* �� �� ��: Comm_OkProc(void)
* ��������: Communication OK������
* ��ڲ���: ��
* ʱ	��: 2013��5��9�� 16:00:31
* ��    ��: 
* ˵    ��: ��������ok����
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
	
	for(i=0;i<7;i++)//ȷ�ϵ�ַ
	{
		if((nCurrAdd[i]!=COM_188CODE)&&(CommF.meter_addr[i]!=nCurrAdd[i]))
		{	
			return FALSE;//���ǹ㲥��ַ���ҵ�ַ�����򲻴���
		}
	}
	
	return CJ188RecDataPro(nCmd, pnOutBuf, nOutLen);
	
}
/******************************************************************************
* �� �� ��: CJ188_RecProc(void)
* ��������: CJ188Э�鴮�ڽ��մ�����
* ��ڲ���: ��
* ʱ	��: 2013��5��9�� 14:46:30
* ��    ��: 
* ˵    ��: �Խ��յ�����Data����������
*******************************************************************************/
s8 CJ188RecProc(u8 Data)
{
	u8 i,lenth,checksum;
	static u8 nDatRevCnt = 0;

	switch(comm.status)
	{
		case CJ188_HEAD://����ͷ
			if(Data==COMM_HEAD)
			{
				comm.status = CJ188_TYPE;
				comm.cnt = 0;
			}
			break;
		case CJ188_TYPE://���ձ�����
			CommF.meter_type  = Data;
			comm.status = CJ188_ADDR;
			break;
		case CJ188_ADDR://����7����ַλ
			CommF.meter_addr[comm.cnt++] = Data;
			if(comm.cnt>=7)
			{
				comm.cnt = 0;
				comm.status = CJ188_CMD;
			}
			break;
		case CJ188_CMD://���ղ�������
			CommF.meter_cmd = Data;
			comm.status = CJ188_LENTH;			
			break;			
		case CJ188_LENTH://���յ����ݳ���
			CommF.meter_lenth = Data;
			comm.cnt = 0;
			comm.status = CJ188_ID;
			break;
		case CJ188_ID://����2����ʶλ
			MeterID.meter_id[comm.cnt++] = Data;
			if(comm.cnt>=CommF.meter_lenth)//���lenth==2������У��
			{
				comm.status = CJ188_CS;
			}
			else if(comm.cnt>=2)
			{
				comm.status = CJ188_SER;
			}
			break;
		case CJ188_SER://����1�����
			CommF.meter_ser = Data;
			comm.cnt++;

			if(comm.cnt<CommF.meter_lenth)//���lenth>3�������� 
			{
				comm.status = CJ188_DATA;
			}
			else
			{
				comm.status = CJ188_CS;
			}
			break;
		case CJ188_DATA://������Ч���� ֻ�г��ȴ���3�ĲŻ����
			CommRx.buff[nDatRevCnt++] = Data; //�ӵ�Ƭ����ֲ�������³���4�ֽڶ��������Ѿ��޸�
			comm.cnt++;
			if(comm.cnt==CommF.meter_lenth)
			{
				nDatRevCnt = 0;
				comm.status = CJ188_CS;
			}
			break;
		case CJ188_CS://����У��� 
			comm.checksum = Data;
			comm.status = CJ188_END;
			break;
		case CJ188_END://����β
			if(Data==COMM_END)
			{	
				checksum = COMM_HEAD;
#if 0
				lenth = (u8)(PUBLIC_LENTH+CommF.meter_lenth+3); //���⴦��4�ֽڶ�������+3
				for(i=0;i<lenth;i++)
				{
					checksum += CommUF.buff[i];
				}
#endif
				lenth = (u8)(PUBLIC_LENTH+3); //���⴦��4�ֽڶ�������
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
					comm.flagok = 1;//��������OK 
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
/* ��ʱ�������ݽӿ�
������: CJ188RecvData
��	��: nMaxRxLen wTimeMs
��	��: pnOutBuf
����ֵ: void
�޸���: maronglang
��	��: 2015.08.11
*//*********************************************/
s8 CJ188RecvData(u32 dwTimeMs)
{
	u8  nLoop     = 0, nData = 0;
	u32 dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
	u8 nRxHead    = 0;
	
	dwTimeOut = dwTimeMs;

	/* ���ι�� */
	FeedSoftWareIwdg();
	
	dwTime = GetSysTemTick();

	while(1)
	{
		/* ���ι�� */
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

		/* �������� */
		if(0 >= CheckRevDataLen())
		{
			continue;
		}

		/* �������� */
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
/* CJ-T188Э���ƻ�����ӿ�
������: CJ188GatherMeter
��	��: pnAddr
��	��: pnSendBuf
����ֵ: u8
�޸���: maronglang
��	��: 2015.08.11
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
	
	/* ��ǰ��ַ */
	MemcpyFunc(CommF.meter_addr, pnAddr, sizeof(CommF.meter_addr));

	/* ���������ȡ ���������š����ء����ñ�� */
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
	else  /* ��װ��ַ����е�ַת�� */
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
	
	/* ����֡ */
	CJ188Comm_SendCmd(nPtrType, nNewAddr, nDataLen);

#ifdef IOT_DAT_DETECTOR
	SetPortRS485Rx();
#endif

	/* ���ݽ��� */
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

	if(comm.flagok)//��������OK ����
	{		
		/*��ǰ�ն˵�ַ�� �������(���/�����)�� ������ȣ� ���õ��±�� */
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

