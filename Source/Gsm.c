/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : Gsm.c
* Author            : maronglang
* Date First Issued : 2015/12/18
* Date Last modfied : 2016/04/07
* Description       : GPRSģ��ͨѶά��
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/
#include "Meter.h"
#include "Gsm.h"
#include "DriverUart.h"
#include "GsmGlobal.h"
#include "FileGlobal.h"
#include "ProtocolGlobal.h"
#include "JX_Math.h"
//#include <stdio.h>
#include "STM8_Rtc.h"
#include "Pwrctr.h"
#include "Alarm.h"
#include "Initialize.h"
#include"CJ188.h"
#include "XinJiangProtocol.h"

/* gprsģ���ʼ������ */
#define INIT_PWR_OFF          0
#define INIT_PWR_ON           1
#define INIT_SWITCH_OFF       2
#define INIT_SWITCH_ON        3
#define INIT_PBREADY_1        4
#define INIT_SET_IPR          5
#define INIT_CPIN_2           6
#define INIT_IMSI_3           7
#define INIT_CCID_4           8
#define INIT_CSQ_5            9
#define INIT_CREG_6           10

#define TO_MAXCNT             2 //ʧ�ܳ�ʱ����

/* ����״̬ */
#define VALVE_CLOSE_UP          0x08//0x02
#define VALVE_ERROR_UP          0xff//0x03

/* gprsģ��PPP�������� */
#ifdef YOUFANG_GPRS
#define PPP_XISP_0            0  //ѡ���ڲ�Э�� 
#define PPP_PDPCM_1           1  //����PDP��ʽ�� IP+APN
#define PPP_XGAUTH_2          2  //�û���֤
#define PPP_CGATT_3           3  //GPRS����
#define PPP_XIIC_4            4  //����PPP����
#define PPP_GETIP_5           5  //��ȡ������IP
#else
#define PPP_CGATT_0           0  //GPRS����
#define PPP_CSTT_1            1  //����APN USR PWD
#define PPP_CIICR_2           2  //�����ƶ����������� GPRS �� CSD ��������
#define PPP_CIFSR_3           3  //��ȡ����IP
#define PPP_ATE0_4            4  //�رջ���

#endif


u8 g_nSignal    = 0;    /* �ź�ǿ��  */
u8 g_nApnBuf[20]= {"\"CMNET\""};
u8 g_nUsrBuf[16]= {"\"GSM\""};
u8 g_nPwdBuf[16]= {"\"1234\""};
u8 aucAtPServer1[20] = {"\"183.62.232.21\""};		//Jason������IP��ַ1,�̶� 121.15.209.245
u8 aucAtPPort1[8] = {"\"30042\""};			//Jason�������˿ں�1 30020 33003
u8 aucAtPServerBk[20] = {"\"183.62.232.21\""};		//Jason������IP��ַ1,�̶� 121.15.209.245
u8 aucAtPPortBk[8] = {"\"30042\""};			//Jason�������˿ں�1 30020 33003 30042

#ifdef VAVLE_INNER
uc8 m_nVerBuf[16] = {"V0.2.0  18031601"};   // ���÷��� DN25�����⴦��
#else
#ifdef XJ_JASON_VISON
uc8 m_nVerBuf[16] = {"V3.0.01 17081901"};
#else
#ifdef SAVE_TEST
uc8 m_nVerBuf[16] = {"V0.0.8  SaveTest"};
#else
#ifdef IOT_GASMETER
uc8 m_nVerBuf[16] = {"V0.1.4  17011001"};
#else
#ifdef TEST_VISON
uc8 m_nVerBuf[16] = {"V0.0.2  17061902"};
#else
#ifdef PURCHASE_MODE
uc8 m_nVerBuf[16] = {"V1.0.1  18030701"};
#else
#ifdef IOT_WATERMETER
uc8 m_nVerBuf[16] = {"V0.0.11 20170120"};
#else
#ifdef VAVLE_METER
#ifdef IOT_DAT_DETECTOR
#ifdef  PIEZOMETER
uc8 m_nVerBuf[16] = {"V0.1.0  18042501"};
#else
uc8 m_nVerBuf[16] = {"V0.1.1  18012001"};  // ���� �� ���汾
#endif
#else
uc8 m_nVerBuf[16] = {"V0.0.15 20170120"};
#endif
#else
#ifdef PHOTOELECTRIC_METER
#ifdef  PIEZOMETER
uc8 m_nVerBuf[16] = {"V4.1.0  18042501"};   // ��ѹ����+���
#else
uc8 m_nVerBuf[16] = {"V1.1.0  18010501"};   // ֻ�Ӵ��
#endif
#else
uc8 m_nVerBuf[16] = {"V1.1.1  18011101"};    // ֻ��ѹ����ģʽ
#endif
#endif
#endif
#endif
#endif
#endif
#endif
#endif
#endif
uc8 m_nPtrcoVerBuf[8] = {"V2.32"};

u8 m_nCcidBuf[24] = {0};              //CCID
u8 m_nImsiBuf[24] = {0};              //IMSI
u8 m_nImsiBufXJ[8] = {0};              //IMSI


u8 m_nWakeupReportFlg = FALSE;        //���ѱ�־
u8 m_nGprsStep  = 0;
uint32_t  m_dwTimeCnt = 0;
TM_Time stLastReportT;     //�ϴ��ϱ�����ʱ��
u16 g_wTmReportCnt    = 0; //�ն��ۼ��ϱ�����
u8 g_nReportFlg = FALSE;   //�ϱ���־
ST_Time stTimeNow;
TypeValveOpt stOptValve;			//��������
u8 g_OptValveRepFlg = FALSE;      // ��ʱ�����ϱ���־
u32 g_dwCommDelay     = 0;
u8 g_BatRepFlg       = TRUE;	    //��ص�ѹ�ϱ���־
u8 g_nDatRepCnt      = 0;           // �����ϱ������ۼ�
u32 g_dwRepTick      = 0;           //�ϱ���ʱ
u8 g_nApnType        = 0;          //APN����

u8  m_nRepEnableFlg  = TRUE;        //�ϱ���ʱʹ�ܱ�ʶ
u8  m_nIpAddBk       = FALSE;       //������վʹ�ܱ�ʶ
u8  m_nRepIndex      = 0;           // �ϱ���������
u8  m_nRepFailFlg    = TRUE;       //�ϱ�ʧ�ܱ�־ ����ʧ�ܲ���
u8  m_nDataRepSucFlg = FALSE;      //�����ϱ��ɹ����д��־
u8  m_nLedFlashFlg   = FALSE;
u8  m_nMasterType    = MASTER_OLD;  //��վ����
u8  m_nGmTn_1         = 0x01;        //����վ���������վTN��
u8  m_nGmTn_2         = 0x00;
u8  m_nUploadMode    = OTHER_REP;
uint8_t m_nAlmRepFlg = FALSE;       //�澯�Ƿ��ϱ�

u32 g_dwTmAddress = 0x00000001;           //Ĭ�ϵ�ַ256

/* Ƿ���ϱ���־ */
u8 g_nOwedRepFlg    = FAILURE_GLOBAL;

/* ��ʱ�ۻ� */
static u8 m_nCnt = 0;   

extern ST_Time g_stNextRepTime;        //�´��ϱ�ʱ��
extern ST_Time g_stNextGmTime;        //�´γ���ʱ��

u8 M590_CloseConnect(void);
s8 M590_TcpSendDatLen(u8 nLen);
u8 M590_ClaRxLength(u8* pnRxBuf, u8* pnRxLen);
uint8_t  SIMGL868_GetCCID(u8 *pnOutBuf, u8 nLen);
uint8_t  UC_CommAT(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS);



//����Ϊ130��������
#if 1
/**********************************************/
/* �¾���վ����״̬ת��
������: VavleStatTransform
��	��: nOldMastVavle opnNewVavleStat
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2016.10.31
*//*********************************************/
void  VavleStatTransform(u8 nMasterType, u8 nOldMastVavle, u8* pnNewVavleStat)
{
	/* �¾���վ״̬�л� */
	if(MASTER_NEW == nMasterType)
	{
		if(OLD_VAVLE_CLOSE == nOldMastVavle)
		{
			(*pnNewVavleStat) = VALVE_CLOSE;
		}
		else if(OLD_VAVLE_ERROR == nOldMastVavle)
		{
			(*pnNewVavleStat) = VALVE_ERROR;
		}
	}
}
/**********************************************/
/* �¾���վ�����ת����TN�Ŵ���
������: MeterTnNumTransform
��	��: nMasterType
��	��: pnNum1 pnNum2
����ֵ: u8
�޸���: maronglang
��	��: 2016.10.31
*//*********************************************/
void  MeterTnNumTransform(u8 nMasterType, u8 *pnNum1, u8 *pnNum2)
{
	/* �¾���վ״̬�л� */
	if(MASTER_NEW == nMasterType)
	{
		(*pnNum1) = 0x01;
		(*pnNum2) = 0x01;
	}
	else
	{
		(*pnNum1) = 0x01;
		(*pnNum2) = 0x00;
	}
}

/**********************************************/
/* ���õ�ǰ�ϱ�ģʽ
������: SetLogonMode
��  ��: nMode
��  ��: void
����ֵ: void
�޸���: maronglang
��  ��: 2016.3.26
*//*********************************************/
void SetLogonMode(u8 nMode)
{
	ucLogonMode = nMode; 
	nLogonModeBk = nMode;
	return ;
}

/**********************************************/
/* �����ϱ���� ��Ϊ��λ
������: ClaReportTimeToSec
��  ��: pnOutBuf
��  ��: void
����ֵ: u32
�޸���: maronglang
��  ��: 2016.2.17
*//*********************************************/
s32 ClaReportTimeToSec(u8 nCycle)
{
	s32 dwTemp = 0;
	TypeRecord stRecord;

	if(FALSE == ReadRecord(0, (u8*)&stRecord, sizeof(stRecord)))
	{
		stRecord.nStatus = VALVE_OPEN;
	}

	/* ÿСʱ */
#ifdef VAVLE_METER
#ifndef VAVLE_INNER
	if((0x41 == nCycle)||(OLD_VAVLE_CLOSE == stRecord.nStatus)||(VALVE_CLOSE == GetBoardVavleStat())) //(0x41 == nCycle)
#else
	if((0x41 == nCycle)||(OLD_VAVLE_CLOSE == stRecord.nStatus)) //(0x41 == nCycle)
#endif
#else
	if(0x41 == nCycle)
#endif
	{
		dwTemp = 3600;
	}
	else if((0xC1 == nCycle)||(0x81 == nCycle))/* ÿ�� ��֧��ÿ�£�ÿ��Ҳ����ÿ���ϱ� */
	{
		dwTemp = 3600UL*24;
	}
	else if(30 >= nCycle)/* ÿ1-10���ϱ������·�ʽ��ȡ�ϱ����� */
	{
		if(6 == nCycle)
		{
			dwTemp = 3600UL*6;
		}
		else
		{
#ifdef TEST_VISON
			if(7 == nCycle)
			{
				dwTemp = 3600UL*24*nCycle;
			}
			else
			{
				dwTemp = 60UL*nCycle;
			}
#else
			dwTemp = 3600UL*24*nCycle;
#endif
		}

	}
	else
	{
		dwTemp = 5UL*60;
	}
	return dwTemp;
}

/**********************************************/
/* �����ϱ�����ʱ��
������: UpLinkSaveReportTime
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.01.14
*//*********************************************/
void UpLinkSaveReportTime(void)
{
	ST_Time stReportTime;
	TM_Time stTime;
	u8 nBuf[10] = {0};
	s32 dwOffsetSec = 0, dwCycle = 0;

	STM8_RTC_Get(&stReportTime);
	TM_TimeChangeAToB(&stReportTime,&stTime);

#ifdef PURCHASE_MODE
	if(SUCCESS_GLOBAL == g_nOwedRepFlg)		
	{
		tyParameter.nOverBuyFlg |= OWED_REP_SUCC;
		SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
		UC_SleepFunc(60);
	}
#endif
	g_wTmReportCnt++;
#ifdef XINJIANG_PTR
	if((FALSE == (m_nWakeupReportFlg&REPORT_FAIL_FLG))
		&&(FALSE == LP_XJ_GetDebugReportFlg()))
	{
		MemcpyFunc((u8*)&stLastReportT, (u8*)&stTime, sizeof(stLastReportT));
	}
#endif
	MemcpyFunc((u8*)nBuf, (u8*)&stLastReportT, 8);
	MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
	SaveParameterForType(nBuf, 10, LT_REP_TIME);

	/* ��Զ�ʱ�����ϱ�ʧ�ܳ�ʱ���� */
	if((CTL_VALVE_OVER == stOptValve.nOptFlg)&&(MAX_REP_TIMES > stOptValve.nRepFailCnt))
	{
		stOptValve.nRepFailCnt++;
		stOptValve.nRepFailCnt = ((stOptValve.nRepFailCnt>MAX_REP_TIMES)?MAX_REP_TIMES:stOptValve.nRepFailCnt);
		SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
		return ;
	}

	/* �澯�ϱ�ʧ�ܴ��� */
	if((NO_ALARM != (ALM_GetBatStatus())&ALARM_MASK) 
		&& (ALARM_REP_FLG != (g_nGuardEnFlg&ALARM_REP_FLG))
		&& (MAX_REP_TIMES > g_nAlmRepFailCnt)&&(m_nAlmRepFlg))
	{
		g_nAlmRepFailCnt++;
		g_nAlmRepFailCnt = ((g_nAlmRepFailCnt>MAX_REP_TIMES)?MAX_REP_TIMES:g_nAlmRepFailCnt);
		g_nGuardEnFlg |=(g_nAlmRepFailCnt<<6); /* ��¼�ϱ��澯ʧ�ܴ��� */
		SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
		return ;
	}

	/* �ϱ�ʧ����д��ʧ����־��¼ */
	if(m_nRepFailFlg)
	{
		MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stReportTime, sizeof(stRepFail.stTime));
		stRepFail.nSigal = JX_ByteToBcd(g_nSignal);			//�źŴ�С,�̶�ֵ
		AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));

		/* �ϱ�ʧ�ܴ�����ʾ 0x02:��һ��ʧ�� 0x04:�ڶ���ʧ�� 0x08:������ʧ�� */
		if(m_nWakeupReportFlg&THIRD_REP_FAIL)
		{
			m_nWakeupReportFlg = 0;
#ifdef PURCHASE_MODE
			if(OWED_STAT_FLG == (tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL|OWED_STAT_FLG)))
			{
				tyParameter.nOverBuyFlg |= OWED_REP_FAIL;
				SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
				UC_SleepFunc(60);
			}
#endif	
		}
		else if(m_nWakeupReportFlg&SECOND_REP_FAIL)
		{
			m_nWakeupReportFlg |= THIRD_REP_FAIL;
		}
		else if(m_nWakeupReportFlg&FIRST_REP_FAIL)
		{
			m_nWakeupReportFlg |= SECOND_REP_FAIL;
		}
		else
		{
			m_nWakeupReportFlg |= FIRST_REP_FAIL;
		}
		SaveReportFlag(m_nWakeupReportFlg);
		m_nRepFailFlg = FALSE;
	}
}
/**********************************************/
/* ��ص�ѹ�ϱ�����
������: BatteryVolRepPro
��  ��: dwItem
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.03.26
*//*********************************************/
void BatteryVolRepPro(void)
{
	if((ALARM_MASK&ALM_GetBatStatus())&&(g_BatRepFlg)
		&&((OTHER_REP == m_nUploadMode)||(MAX_REP_TIMES <= g_nAlmRepFailCnt)))
	{
		g_dwRepTick = GetSysTemTick();
		g_nDatRepCnt = 0;
		m_nRepEnableFlg = TRUE; //�ϱ���ʱʹ��		
		SetLogonMode(UP_UPLOAD_BAT_VAL);
		g_BatRepFlg = FALSE;
		m_nAlmRepFlg = TRUE;
	}
	else
	{
		SetLogonMode(UP_HEARTBEAT);
	}
	return ;
}

/**********************************************/
/* �澯��־��֡
������: AlmMakeFrame
��  ��: pnOutBuf
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.04.27
*//*********************************************/
u8 AlmMakeFrame(u8* pnOutBuf)
{
	u8 i = 0, nAtReportLen = 0;
	TypeReportErr stRecord;

	for(i = 0; i < MAX_ALM_NUM; i++)  //  wTemp
	{
		/* EEPROM����������� */
		if(FALSE == ReadAlmRecord(i, (u8*)&stRecord, sizeof(stRecord)))
		{
			MemsetFunc((u8*)&stRecord, 0xFF, sizeof(stRecord));
		}

		JX_BL_Change(2,(u8*)&stRecord.wError);
		MemcpyFunc(&pnOutBuf[i*9], (u8*)&stRecord, sizeof(stRecord));
		nAtReportLen = (i+1)*9;
	}
	
	return nAtReportLen;	
}

/**********************************************/
/* ���ݷ��ͺ���
������: FrameSendFunc
��	��: Size nComChannel pnPoint
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2016.05.27
*//*********************************************/
void FrameSendFunc(u8 Size, u8 nComChannel, u8* pnPoint)
{
	/* GPRS���ӽ������ŷ��� */
	if(COM_1 == nComChannel)
	{
		*pnPoint++ = AT_TAIL_0;				//���ݷ��͹涨
		SetBusUart(nComChannel, PARITY_NULL);	//���ô���ͨ����
		StartSendBusUartGroup(Size + 1);
	}
	else
	{
		SetBusUart(nComChannel, PARITY_EVEN);	//���ô���ͨ����  
		StartSendBusUartGroup(Size);
	}
}
/**********************************************/
/* ��ȡCCID��IMSI��
������: GetIsmiCcidDat
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2016.06.29
*//*********************************************/
void GetIsmiCcidDat(void)
{
	u8 nOptCmd = 0, nOptRlt = 0, nCnt = 0;

	if(g_nSignal <= 0)
	{
		TurnBusUartOn();
		SetPortGsmResetDisable();
		SetPortGsmPowerOn();		   //����
		SetPortSoftSwitchOn();
		UC_SleepFunc(500);
		SetPortSoftSwitchOff();
		UC_SleepFunc(2500);
		SetPortSoftSwitchOn();
		UC_SleepFunc(500); 
		do
		{
			UC_SleepFunc(500); 
			SIMGK7M_GetCIMI(m_nImsiBuf, sizeof(m_nImsiBuf));
			nOptRlt = SIMGL868_GetCCID(m_nCcidBuf, sizeof(m_nCcidBuf));
		}while((3 > nCnt++)&&(FALSE == nOptRlt));
	}

}
#endif


/* AT������֡���� */
#if 1
/**********************************************/
/* �����ַ�������
������: JX_Strlen
��	��: pbSrc
��	��: ��
����ֵ: u8
�޸���: maronglang
��	��: 2017.05.13
*//*********************************************/
u8  JX_Strlen(char* pbSrc)
{
	u8 nLoop = 0;
	char* pBuf = (char*)pbSrc;

	nLoop = 0;
	do
	{
		nLoop++;
	}while(pBuf[nLoop] != 0);

	return nLoop;

}
/**********************************************/
/* �ַ�������
������: JX_StringCat
��	��: pbSrc
��	��: ��
����ֵ: u8
�޸���: maronglang
��	��: 2017.05.13
*//*********************************************/
void  JX_StringCat(char* pbSrc,char * pnStr, u8 nLen)
{
	u8 nLoop = 0, i = 0;

	nLoop = 0;
	for(nLoop = 0; nLoop < 254; nLoop++)
	{
		if(pbSrc[nLoop] == 0)
		{
			break;
		}
	}
	for(i = 0; i < nLen; i++)
	{
		pbSrc[nLoop++] = pnStr[i];
	}

	return ;
}

/*
����:		���,��ʼ����ATָ��
����:		����
���:		aucUartTxBuffer
*/
void PackAtCmd(u8 Cmd)
{
	u16 length;
	u8 *point;
	point = aucUartTxBuffer;
	if (Cmd > AT_CMD_S_D)		//�а�ͷ?
	{
		*point++ = AT_HEAD_0;
		*point++ = AT_HEAD_1;
	}
	length = JX_Strlen((char const *)aucAtCmd[Cmd] );
	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length);		//�����ַ�����������
	point += length;
	*point++ = AT_TAIL_0;		//��β
	*point++ = AT_TAIL_1;
	if (Cmd > AT_CMD_S_D)		//�а�ͷ?
	{
		length += 4;
	}
	else
	{
		length += 2;
	}
	SetBusUart(COM_1, PARITY_NULL);		//���ô���ͨ����

	StartSendBusUartGroup(length);
}

/*
����:		���,��ʼ����ATָ��
����:		����,����ָ��
���:		aucUartTxBuffer
*/
void PackAtCmdParameter(u8 Cmd, u8 *Parameter)
{
	u16 length1, length2;
	u8 *point;
	point = aucUartTxBuffer; 
	if (Cmd > AT_CMD_S_A)		//�а�ͷ? AT_CMD_S_D
	{
		*point++ = AT_HEAD_0;
		*point++ = AT_HEAD_1;
	}
	length1 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length1);		//�����ַ�����������
	point += length1;
	length2 = JX_Strlen( (char const *)Parameter);
	MemcpyFunc( (u8 *)point, Parameter, length2);		//�����ַ�����������
	point += length2;
	*point++ = AT_TAIL_0;		//��β
	*point++ = AT_TAIL_1;
	length1 += length2;
	if (Cmd > AT_CMD_S_A)		//�а�ͷ? AT_CMD_S_D
	{
		length1 += 4;
	}
	else
	{
		length1 += 2;
	}
	SetBusUart(COM_1, PARITY_NULL);		//���ô���ͨ����

	StartSendBusUartGroup(length1);
}


/*
����:		���,��ʼ����ATָ��,AT+TCPSETUP=0,121.150.209.245,30020
����:		����,����ָ��1,����ָ��2,2������֮����,����
���:		aucUartTxBuffer,
*/
void PackAtCmdParameter2(u8 Cmd, u8 *Parameter1, u8 *Parameter2)
{
	u16 length1, length2;
	u8 *point;
	point = aucUartTxBuffer;
	if (Cmd > AT_CMD_S_D)		//�а�ͷ?
	{
		*point++ = AT_HEAD_0;
		*point++ = AT_HEAD_1;
		//AT+TCPSETUP=0,121.150.209.245,30020
	}
	length1 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length1);		//�����ַ�����������
	point += length1;
#ifndef  XIAMEN_QIJUN_GPRS
	*point++ = '0';			//��·����
	*point++ = ',';			//2������֮��ֻ���ö�������
#endif
	length2 = JX_Strlen( (char const *)Parameter1);
	MemcpyFunc( (u8 *)point, Parameter1, length2);		//�����ַ�����������
	length1 += length2;
	point += length2;
	*point++ = ',';			//2������֮��ֻ���ö�������
	length2 = JX_Strlen( (char const *)Parameter2);
	MemcpyFunc( (u8 *)point, Parameter2, length2);		//�����ַ�����������
	length1 += length2;
	point += length2;
	*point++ = AT_TAIL_0;		//��β
	*point++ = AT_TAIL_1;
	
	if (Cmd > AT_CMD_S_D)		//�а�ͷ?
	{
#ifndef XIAMEN_QIJUN_GPRS
		length1 += 7;
#else
		length1 += 5;
#endif
	}
	else
	{
#ifndef XIAMEN_QIJUN_GPRS
		length1 += 5;
#else
		length1 += 3;
#endif
	}
	SetBusUart(COM_1, PARITY_NULL);		//���ô���ͨ����
	StartSendBusUartGroup(length1);
}


/*
����:		���,��ʼ����ATָ��,AT+TCPSETUP=0,121.150.209.245,30020
����:		����,����ָ��1,����ָ��2,2������֮����,����
���:		aucUartTxBuffer,
*/
void PackAtCmdParameter3(u8 Cmd, u8 *Parameter1, u8 *Parameter2, u8 *Parameter3)
{
	u16 length0 = 0, length1 = 0, length2 = 0, length3 = 0;
	u8 *point;

	if((NULL == Parameter1)||(NULL == Parameter2)||(NULL == Parameter3))
	{
		return;
	}
	
	point = aucUartTxBuffer;
	if (Cmd > AT_CMD_S_D)		//�а�ͷ?
	{
		*point++ = AT_HEAD_0;
		*point++ = AT_HEAD_1;
	}
	length0 = JX_Strlen( (char const *)aucAtCmd[Cmd] );
	MemcpyFunc( (u8 *)point, aucAtCmd[Cmd], length0);		//�����ַ�����������
	point += length0;
#ifndef  XIAMEN_QIJUN_GPRS
	*point++ = '0';			//��·����
	*point++ = ',';			//2������֮��ֻ���ö�������
#endif
	length1 = JX_Strlen( (char *)Parameter1);//(char const *)
	MemcpyFunc( (u8 *)point, Parameter1, length1);		//�����ַ�����������
	length0 += length1;
	point += length1;
	*point++ = ',';			//2������֮��ֻ���ö�������
	
	length2 = JX_Strlen( (char const *)Parameter2);
	MemcpyFunc( (u8 *)point, Parameter2, length2);		//�����ַ�����������
	length0 += length2+1;
	point += length2;
	*point++ = ',';			//2������֮��ֻ���ö�������
	
	length3 = JX_Strlen( (char const *)Parameter3);
	MemcpyFunc( (u8 *)point, Parameter3, length3);		//�����ַ�����������
	length0 += length3+1;
	point += length3;
	
	*point++ = AT_TAIL_0;		//��β
	*point++ = AT_TAIL_1;
	
	if (Cmd > AT_CMD_S_D)		//�а�ͷ?
	{
#ifndef XIAMEN_QIJUN_GPRS
		length0 += 7;
#else
		length0 += 5;
#endif
	}
	else
	{
#ifndef XIAMEN_QIJUN_GPRS
		length0 += 5;
#else
		length0 += 3;
#endif
	}
	SetBusUart(COM_1, PARITY_NULL);		//���ô���ͨ����
	StartSendBusUartGroup(length0);
}

/*
����:		���,��ʼ����ATָ��,TCPSEND,ר������
����:		���ݳ���,����ֻ��1~39,����������ô��
���:		aucUartTxBuffer
*/
void PackAtCmdTcpsend(u8 Length)
{
	u16 length1, length2;
	u8 *point, buffer[5];		//0,12
	point = aucUartTxBuffer;
	*point++ = AT_HEAD_0;
	*point++ = AT_HEAD_1;
	length1 = JX_Strlen( (char const *)aucAtCmd[AT_CMD_TCPSEND] );
	MemcpyFunc( (u8 *)point, aucAtCmd[AT_CMD_TCPSEND], length1);		//�����ַ�����������
	point += length1;
#ifdef YOUFANG_GPRS
	buffer[0] = '0';
	buffer[1] = ',';
	if (Length > 9)		//10~39?
	{
		length2 = 4;
		buffer[2] = '0' + Length / 10;
		buffer[3] = '0' + Length % 10;
	}
	else			//1~9?
	{
		length2 = 3;
		buffer[2] = '0' + Length;
	}
#else
	if (Length > 99)
	{
		length2 = 3;		
		buffer[0] = '0' + Length / 100;
		buffer[1] = '0' + (Length%100) / 10;
		buffer[2] = '0' + Length % 10;
	}
	else if (Length > 9) 	//10~39?
	{
		length2 = 2;
		buffer[0] = '0' + Length / 10;
		buffer[1] = '0' + Length % 10;
	}
	else			//1~9?
	{
		length2 = 1;
		buffer[0] = '0' + Length;
	}
#endif
	
	MemcpyFunc( (u8 *)point, buffer, length2);		//�����ַ�����������
	point += length2;
	*point++ = AT_TAIL_0;		//��β
	*point++ = AT_TAIL_1;
	length1 += length2;
	length1 += 2+2;            //ͷ��β ����
	SetBusUart(COM_1, PARITY_NULL);		//���ô���ͨ����

	StartSendBusUartGroup(length1);
}

/*
����:		���,��������
����:		���ݳ���,����ֻ��1~39,����������ô��
���:		aucUartTxBuffer
*/
void PackTcpSendData(u8 nLen)
{	
	aucUartTxBuffer[nLen] = AT_TAIL_0; //��β
	SetBusUart(COM_1, PARITY_NULL);		//���ô���ͨ����
	StartSendBusUartGroup(nLen+1);
}

#endif

/* GPRSģ�鴦���� */
#if 1

/*
����:		���,��ʼ����ATָ��
����:		����
���:		aucUartTxBuffer
*/
void PackAtCmdExt(void)
{
	u16 length = 0;
	u8 *point  = NULL;
	point = aucUartTxBuffer;
	{
		*point++ = AT_HEAD_0;
		*point++ = AT_HEAD_1;
	}
	*point++ = AT_TAIL_0;		//��β
	*point++ = AT_TAIL_1;
	{
		length += 2;
	}
	SetBusUart(COM_1, PARITY_NULL);		//���ô���ͨ����
	StartSendBusUartGroup(length);
}

/**********************************************/
/* ������ʱ����
������: UC_SetSleepCnt
��	��: dwWaitmS
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.10.28
*//*********************************************/
void  UC_SetSleepCnt(uint32_t dwWaitmS)
{
	m_dwTimeCnt = (dwWaitmS);
}

/**********************************************/
/* ��ʱ������������
������: UC_SleepProc
��	��: void
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.10.28
*//*********************************************/
uint8_t  UC_SleepProc(void)
{
	static uint32_t  dwTime = 0;
	uint32_t  dwTimeNow = 0;

	/* ��ȡ��ǰ����ʱ�� */
	dwTimeNow = GetSysTemTick();
	
	if (dwTime < dwTimeNow)
	{
		 if(dwTimeNow - dwTime > m_dwTimeCnt)
		 {
			dwTime = GetSysTemTick();
			return TRUE;
		 }
	}
	else if ((dwTime - dwTimeNow) > m_dwTimeCnt)
	{
		dwTime = GetSysTemTick();
		return TRUE;
	}

	return FALSE;
}

/**********************************************/
/* ��ʱ��������
������: UC_SleepFunc
��	��: dwWaitmS
��	��: void
����ֵ: u8
�޸���: maronglang
��	��: 2015.09.08
*//*********************************************/
uint8_t  UC_SleepFunc(uint32_t dwWaitmS)
{
	uint32_t dwTime = 0, dwNowTime = 0;

	/* ��ȡ��ǰ����ʱ�� */
	dwTime = GetSysTemTick();	
	
	while(1)
	{
		dwNowTime = GetSysTemTick();
		if (dwTime < dwNowTime)
		{
			 if(dwNowTime - dwTime > dwWaitmS)
			 {
				break;
			 }
		}
		else if ((dwTime - dwNowTime) > dwWaitmS)
		{
			break;
		}

		/* ���������ӿ� */
		
		/* ������Ź�ι�� */
		FeedSoftWareIwdg();
	}
        return 0;
}

/**********************************************/
/* ��ĸ�ַ���pbSrc�в����Ƿ������ַ���pbSub
������: QH_bufbuf
��	��:pbSrc --- �����ַ�����wSrcLen --- �����ַ�������
       pbSub --- �ȶ��ַ�����wSubLen --- �ȶ��ַ�������
��	��: pnOutMatchPtr
����ֵ: pbSrc
�޸���: maronglang
��	��: 2015.09.08
*//*********************************************/
int8_t  *QH_bufbuf(int8_t* pbSrc, uint32_t wSrcLen, int8_t* pbSub, uint32_t wSubLen)
{
	int8_t  *pbSrcEnd = pbSrc + wSrcLen;
	u8 nLoop = 0;

	if ((pbSrc == NULL) || (pbSub == NULL) || (wSrcLen > 16384) || (wSubLen > 1024))
	{
		return (NULL);
	}

	while ((pbSrc+wSubLen) <= pbSrcEnd)
	{
		nLoop = 0;
		do
		{
			if(pbSrc[nLoop] != pbSub[nLoop])
			{
				break;
			}
			nLoop++;
		}while(nLoop<wSubLen);
		if(wSubLen <=nLoop)
		{
			return pbSrc;
		}
		pbSrc++;
	}
	
	return (NULL);

}

#if 0
/**
  * @brief    : ��ĸ�ַ���pbSrc�в����Ƿ������ַ���pbSub
  * @param    : pbSrc --- �����ַ�����wSrcLen --- �����ַ�������
  *             pbSub --- �ȶ��ַ�����wSubLen --- �ȶ��ַ�������
  * @retval   : �������ַ�������λ��ָ�룬���󷵻ء�NULL��
  */
int8_t  *QH_bufbuf(int8_t* pbSrc, uint32_t wSrcLen, int8_t* pbSub, uint32_t wSubLen)
{
	int8_t  *pbSrcEnd = pbSrc + wSrcLen;

	if ((pbSrc == NULL) || (pbSub == NULL) || (wSrcLen > 16384) || (wSubLen > 1024))
	{
		return (NULL);
	}

	while ((pbSrc+wSubLen) <= pbSrcEnd)
	{
		if (memcmp(pbSrc, pbSub, wSubLen) == 0)
		{
			return (pbSrc);
		}
		
		pbSrc++;
	}
	
	return (NULL);

	//return (int8_t*)strstr((char*)pbSrc, (char*)pbSub);	
}
#endif
/**
  * @brief    : ��ָ��������ַ�����Ѱ�ҵ�һ����ֵ�ַ���
  * @param    : pStart --- �����ַ�����㣬pEnd --- �����ַ����յ�
  *             dwVal --- ���ظ��ַ���ʮ������ֵ
  * @retval   : TRUE / FALSE
  * note      : ��: "erfsdf123dfkkj" -> 123(ʮ����)
  */
u8  QH_SearchStrVal(int8_t* pStart, int8_t* pEnd, uint32_t *dwVal)
{
	u8 fGetFirst = FALSE, fRtnVal = FALSE;
	uint32_t  val = 0;
	int8_t    nByteTemp;


	if ((pStart == NULL) || (pEnd == NULL) || (dwVal == NULL))
	{
		return (fRtnVal);
	}

	while (pStart < pEnd)
	{
		nByteTemp = *pStart++;

		if (fGetFirst == FALSE)
		{
			if (nByteTemp>='0' && nByteTemp<='9')
			{
				fGetFirst = TRUE;
			}
		}

		if (fGetFirst == TRUE)
		{
			if (nByteTemp>='0' && nByteTemp<='9')
			{
				val = val*10 + nByteTemp - '0';
				fRtnVal = TRUE;
			}
			else
			{
				break;
			}
		}

	}

	*dwVal = val;
	return (fRtnVal);
}

/**********************************************/
/* GPRS/CDMAͨ��ģ��ATָ��ͨ�ýӿ�
������: UC_CommAT
��	��: pnSendAT pnMatch1 pnMatch2 pnMatch3 pnMatch4 dwWaitmS
��	��: pnOutMatchPtr
����ֵ: u8
�޸���: maronglang
��	��: 2015.09.08
*//*********************************************/
uint8_t  UC_CommAT(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
{
	uint32_t  dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
	uint8_t   *pnMatchTagStr = NULL, nRtnVal = 0, *pnDat = NULL;
	uint8_t   nData = 0, nStrLen = 0, nTxRxLen = 0;

	/* ��ȡ��ǰ����ʱ�� */
	dwTime = GetSysTemTick();	
	dwTimeOut = (dwWaitmS);

	if((NULL != pnParameter)&&(nCmd < AT_CMD_NULL))
	{
		/* add by maronglang clear RxBuf */
		ClearRxBuff();
		PackAtCmdParameter(nCmd, pnParameter);                
	}
	else if (nCmd < AT_CMD_NULL)
	{
		/* add by maronglang clear RxBuf */
		ClearRxBuff();
		PackAtCmd(nCmd);
	}
	
	//mtu_RecvIntoLoopBuf(); //Ԥ������
	
	nTxRxLen = 0;
	pnDat = GetUartRxBuf();

	while ((dwTimeOut <= dwWaitmS) && (nTxRxLen < NUMBER_UART_RX))
	{
		/* ���ι�� */
		FeedSoftWareIwdg();
		
		dwNowTime = GetSysTemTick();
		if (dwTime < dwNowTime)
		{
			 if(dwNowTime - dwTime > dwTimeOut)
			 {
				ClearRxBuff(); 
				break;
			 }
		}
		else if ((dwTime - dwNowTime) > dwTimeOut)
		{
			ClearRxBuff();
			break;
		}
		
		if (0 == (nTxRxLen = CheckRevDataLen()))
		{
			continue;
		}
		
		nData = *(pnDat + nTxRxLen - 1); 		//����Ҫ�ж�ͷ,β֮��
		//if(sizeof(aucAtBuffer) > dwTxRxLen)
		{
		//	aucAtBuffer[dwTxRxLen++] = nData;
		}
		//else
		{
		//	return (nRtnVal); 
		}

#ifdef  JASON130_PTR   //130Э��
		/* �������ݽ������� */
		DecodeParameter(pnDat, CheckRevDataLen());
#else  //�½�Э��
		XJ_DecodeParameter(pnDat, CheckRevDataLen());
#endif

		/* �յ�����������н��� */
		if ( (nData == AT_TAIL_0) || (nData == AT_TAIL_1) ) 	//0d0a
		{
			if (pnMatch1 != NULL)
			{
				nStrLen = (u8)JX_Strlen((char *)pnMatch1);
				if	((nTxRxLen >= nStrLen) && 
					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch1, nStrLen)) != NULL))
				{
					nRtnVal = 1;
					goto  __UC_CommAT_Exit;
				}
			}
			if (pnMatch2 != NULL)
			{
				nStrLen = (u8)JX_Strlen((char *)pnMatch2);
				if	((nTxRxLen >= nStrLen) && 
					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch2, nStrLen)) != NULL))
				{
					nRtnVal = 2;
					goto  __UC_CommAT_Exit;
				}
			}
			if (pnMatch3 != NULL)
			{
				nStrLen = (u8)JX_Strlen((char *)pnMatch3);
				if	((nTxRxLen >= nStrLen) && 
					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch3, nStrLen)) != NULL))
				{
					nRtnVal = 3;
					goto  __UC_CommAT_Exit;
				}
			}
			if (pnMatch4 != NULL)
			{
				nStrLen = (u8)JX_Strlen((char *)pnMatch4);
				if	((nTxRxLen >= nStrLen) && 
					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch4, nStrLen)) != NULL))
				{
					nRtnVal = 4;
					goto  __UC_CommAT_Exit;
				}
			}
		}

		//mtu_PushIntoLoopBuf(m_nAT_RecvBuf+dwTxRxLen, dwReadOutLen);
		//*(pnDat + dwTxRxLen ) = 0;
	}

__UC_CommAT_Exit:
	if ((pnOutMatchPtr != NULL) && (pnMatchTagStr != NULL))
	{
		*pnOutMatchPtr = pnMatchTagStr;
	}
	if (nTxRxLen > 0)
	{
		//STM32_DBG_Trace(_DTRACE_CHN_UPL, FALSE, (char *)g_nUCC_RecvBuf);		
	}

	return (nRtnVal); 
}

/**********************************************/
/* GPRS/CDMAͨ��ģ��ATָ��ͨ�ýӿ�
������: UC_CommATExt
��	��: pnSendAT pnMatch1 pnMatch2 pnMatch3 pnMatch4 dwWaitmS
��	��: pnOutMatchPtr
����ֵ: u8
�޸���: maronglang
��	��: 2015.09.09
*//*********************************************/
uint8_t  UC_CommATExt(u8 nCmd, u8 *pnParameter1, u8 *pnParameter2, u8 *pnParameter3, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
{
	uint32_t  dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
	uint8_t   *pnMatchTagStr = NULL, nRtnVal = 0;
	uint8_t   nData = 0, *pnDat = NULL, nTxRxLen = 0, nStrLen = 0;

	/* ��ȡ��ǰ����ʱ�� */
	dwTime = GetSysTemTick();	
	dwTimeOut = (dwWaitmS);
	
	/* add by maronglang clear RxBuf */
	ClearRxBuff();
	
	if(AT_CMD_TCPSEND == nCmd)
	{
		PackAtCmdTcpsend(ucNumberMessage);
	}
	else if((AT_CMD_NULL == nCmd)&&(NULL != pnParameter1)) /* ���⴦����Ҫ���͵����� */
	{
		PackTcpSendData(*pnParameter1);
	}
	else if((NULL != pnParameter1)&&(NULL != pnParameter2)&&(NULL == pnParameter3))
	{
		PackAtCmdParameter2(nCmd, pnParameter1, pnParameter2);
	}
	else if((NULL != pnParameter1)&&(NULL != pnParameter2)&&(NULL != pnParameter3))
	{
		PackAtCmdParameter3(nCmd, pnParameter1, pnParameter2, pnParameter3);
	}
	else
	{
		return nRtnVal;
	}
	
	nTxRxLen = 0;
	pnDat = GetUartRxBuf();
	UC_SleepFunc(10);

	//MemsetFunc(aucAtBuffer, 0, sizeof(aucAtBuffer)); //������ջ���
	while ((dwTimeOut <= dwWaitmS) && (nTxRxLen < NUMBER_UART_RX))
	{
		/* ���ι�� */
		FeedSoftWareIwdg();
		
		dwNowTime = GetSysTemTick();
		if (dwTime < dwNowTime)
		{
			 if(dwNowTime - dwTime > dwTimeOut)
			 {
				//MemsetFunc(aucAtBuffer, 0, sizeof(aucAtBuffer)); //������ջ���
				break;
			 }
		}
		else if ((dwTime - dwNowTime) > dwTimeOut)
		{
			//MemsetFunc(aucAtBuffer, 0, sizeof(aucAtBuffer)); //������ջ���
			break;
		}
		
		if (0 == (nTxRxLen = CheckRevDataLen()))
		{
			continue;
		}
		
		nData = *(pnDat + nTxRxLen - 1); 		//����Ҫ�ж�ͷ,β֮��
		//aucAtBuffer[dwTxRxLen++] = nData;

#ifdef  JASON130_PTR   //130Э��
		/* �������ݽ������� */
		DecodeParameter(pnDat, CheckRevDataLen());
#else   //�½�Э��
		XJ_DecodeParameter(pnDat, CheckRevDataLen());
#endif

		/* �յ�����������н��� */
		if ( (2 <= nTxRxLen)||((nData == AT_TAIL_0) || (nData == AT_TAIL_1)|| (nData == '>')) ) 	// (2 <= nTxRxLen)&& �˴����⴦���ͳ���ʱ�ظ���'>'
		{
			if (pnMatch1 != NULL)
			{
				nStrLen = (u8)JX_Strlen((char *)pnMatch1);
				if	((nTxRxLen >= nStrLen) && 
					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch1, nStrLen)) != NULL))
				{
					nRtnVal = 1;
					goto  __UC_CommAT_Exit;
				}
			}
			if (pnMatch2 != NULL)
			{
				nStrLen = (u8)JX_Strlen((char *)pnMatch2);
				if	((nTxRxLen >= nStrLen) && 
					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch2, nStrLen)) != NULL))
				{
					nRtnVal = 2;
					goto  __UC_CommAT_Exit;
				}
			}
			if (pnMatch3 != NULL)
			{
				nStrLen = (u8)JX_Strlen((char *)pnMatch3);
				if	((nTxRxLen >= nStrLen) && 
					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch3, nStrLen)) != NULL))
				{
					nRtnVal = 3;
					goto  __UC_CommAT_Exit;
				}
			}
			if (pnMatch4 != NULL)
			{
				nStrLen = (u8)JX_Strlen((char *)pnMatch4);
				if	((nTxRxLen >= nStrLen) && 
					((pnMatchTagStr = (uint8_t *)QH_bufbuf((int8_t *)pnDat, nTxRxLen, (int8_t *)pnMatch4, nStrLen)) != NULL))
				{
					nRtnVal = 4;
					goto  __UC_CommAT_Exit;
				}
			}
		}

		//mtu_PushIntoLoopBuf(m_nAT_RecvBuf+dwTxRxLen, dwReadOutLen);
		//*(pnDat + nTxRxLen ) = 0;
	}

__UC_CommAT_Exit:
	if ((pnOutMatchPtr != NULL) && (pnMatchTagStr != NULL))
	{
		*pnOutMatchPtr = pnMatchTagStr;
	}
	if (nTxRxLen > 0)
	{
		//STM32_DBG_Trace(_DTRACE_CHN_UPL, FALSE, (char *)g_nUCC_RecvBuf);		
	}

	return (nRtnVal); 
}


/***
  * @brief    : ģ��ˢ���ź�
  * @param    : None
  * @retval   : None
***/
uint8_t  SIMGetRegisterStat(void)
{
	uint8_t  nTmp = 0;

	/* ��ȡע����� */
	nTmp = UC_CommAT(AT_CMD_CREG,	NULL, "+CREG: 0,1", "+CREG: 0,5", "ERROR", NULL, NULL, 1000);
	if((nTmp != 1)&&(nTmp != 2))
	{
		return SIM_REG_FAILURE;
	}	
	return SIM_REG_SUCCESS;
}


/***
  * @brief    : ģ��ˢ���ź�
  * @param    : None
  * @retval   : None
***/
uint8_t  SIMGL868_UpdateSignal(void)
{
	uint32_t  dwSignalStr = 0;
	uint8_t  *pnRecvBuf, *pnRecvBufEnd;

	/* ��ȡ�ź�ǿ�� */
	if (UC_CommAT(AT_CMD_CSQ, NULL, "+CSQ:", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
	{
		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL) &&
			(QH_SearchStrVal((int8_t *)pnRecvBuf, (int8_t *)pnRecvBufEnd, &dwSignalStr) == TRUE))
		{
			return ((uint8_t)dwSignalStr);
		}
	}
	
	return (0);
}


/***
  * @brief    : ��ȡģ��IMSI
  * @param    : None
  * @retval   : None
***/
uint8_t  SIMGK7M_GetCIMI(u8 *pnOutBuf, u8 nLen)
{
	uint8_t  *pnRecvBuf, *pnRecvBufEnd;

	/* ��ȡ�ź�ǿ�� */
	if (UC_CommAT(AT_CMD_CIMI, NULL, "46", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
	{
		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL))
		{
			MemcpyFunc(pnOutBuf, pnRecvBuf, nLen);
			return TRUE;
		}
	}
	
	return (0);
}

/***
  * @brief    : ��ȡģ��CCID
  * @param    : None
  * @retval   : None
***/
uint8_t  SIMGL868_GetCCID(u8 *pnOutBuf, u8 nLen)
{
	uint8_t  *pnRecvBuf, *pnRecvBufEnd;

	/* ��ȡ�ź�ǿ�� */
	if (UC_CommAT(AT_CMD_CCID, NULL, "89", NULL, NULL, NULL, &pnRecvBuf, 1000) == 1)
	{
		pnRecvBufEnd = (uint8_t  *)(pnRecvBuf + JX_Strlen((char *)pnRecvBuf));
		if (((uint32_t)(pnRecvBufEnd - pnRecvBuf) < 32) && (pnRecvBuf != NULL))
		{
			MemcpyFunc(pnOutBuf, pnRecvBuf, nLen);
			return TRUE;
		}
	}
	
	return (0);
}

/**********************************************/
/* AT����ʧ�ܳ�ʱ������
������: AT_CmdFailProc
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.12.21
*//*********************************************/
u8 AT_CmdFailProc(u8 nCmd, u8 *pnParameter, uint8_t *pnMatch1, uint8_t *pnMatch2, uint8_t *pnMatch3, 
					 uint8_t *pnMatch4, uint8_t **pnOutMatchPtr, uint32_t dwWaitmS)
{
	static u8 nFailCnt = 0;

	if(1 != UC_CommAT(nCmd, pnParameter, pnMatch1, pnMatch2, pnMatch3, pnMatch4, pnOutMatchPtr, dwWaitmS))
	{
		nFailCnt++;
		if(TO_MAXCNT < nFailCnt)
		{
			nFailCnt = 0;
			m_nGprsStep = INIT_PWR_OFF;
			ucStatusGsm = GSM_INIT;
			stRepFail.wError |= (1<<ATCMD_ERROR);
		}			
	}
	else
	{
		nFailCnt = 0;
		return TRUE;
	}
	
	return FALSE;
}

/**********************************************/
/* GPRSģ���ʼ������
������: M590_Init
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.08
*//*********************************************/
u8 M590_Init(void)
{
	uint8_t nSig = 0, nTmp = 0, nResult = 0;
	static u8 nFailCnt = 0, nCnt = 0;

	/* �ȴ���ʱ */
	if(FALSE == UC_SleepProc())
	{
		return FALSE;
	}

	switch(m_nGprsStep)
	{
		case INIT_PWR_OFF:			
			SetPortGsmPowerOff();		   //�ϵ�			
			UC_SetSleepCnt(5000);
			m_nGprsStep = INIT_PWR_ON;
			break;
			
		case INIT_PWR_ON:
			TurnBusUartOn();	           //Ӳ�����ڲ�����,115200 BAUDRATE_38400
			SetPortGsmResetEnable();       //�����λ			
			//SetPortMeterPowerOff();        //SetPortMeterPowerOn();
			SetPortGsmResetDisable();
			SetPortGsmPowerOn();		   //����
			SetPortSoftSwitchOn();
			UC_SetSleepCnt(3000);
			m_nGprsStep = INIT_SWITCH_OFF;
			break;
			
		case INIT_SWITCH_OFF:
			SetPortSoftSwitchOff();
			UC_SetSleepCnt(3000);
			m_nGprsStep = INIT_SWITCH_ON;
			break;
			
		case INIT_SWITCH_ON:
			SetPortSoftSwitchOn();
			UC_SetSleepCnt(4000);
			m_nGprsStep = INIT_PBREADY_1;
			break;
			
		case INIT_PBREADY_1: /* �ȴ�ģ���ϵ��ȶ���ʼ��OK */
			//SetPortSoftSwitchOn();
			//SetPortSoftSwitchOff();
			UC_SetSleepCnt(100);
#ifndef XIAMEN_QIJUN_GPRS
			if(FALSE == AT_CmdFailProc(AT_CMD_NULL, NULL, (uint8_t *)aucAtInit, "ERROR", NULL, NULL, NULL, 10000))
#else
			if(FALSE == AT_CmdFailProc(AT_CMD_I, NULL, "OK", "ERROR", NULL, NULL, NULL, 3000))
			{
				stRepFail.wError |= (1<<REP_NO_GPRS_MODE);
				return FALSE;
			}			
#endif
			stRepFail.wError &= ~((u16)(1<<REP_NO_GPRS_MODE));
			m_nGprsStep = INIT_SET_IPR;
			break;

		case INIT_SET_IPR:
			if(FALSE == AT_CmdFailProc(AT_CMD_IPR, NULL, "OK", "ERROR", NULL, NULL, NULL, 3000))
			{
				return FALSE;
			}
			m_nGprsStep = INIT_CPIN_2;
			break;
			
		case INIT_CPIN_2:/* ��� SIM ��״̬ */	
			UC_SetSleepCnt(100);
			if(FALSE == AT_CmdFailProc(AT_CMD_CPIN,	NULL, "READY", "ERROR", NULL, NULL, NULL, 1000))
			{
				return FALSE;
			}
			m_nGprsStep = INIT_IMSI_3;
			break;

		case INIT_IMSI_3:/* ��ȡ SIM ���� ����IMSI�� */
			nResult = SIMGK7M_GetCIMI(m_nImsiBuf, sizeof(m_nImsiBuf));
			if((3 < nCnt++)||(nResult))
			{
				nCnt = 0;
				m_nGprsStep = INIT_CCID_4;
			}
			UC_SetSleepCnt(100);
			break;

		case INIT_CCID_4:/* ��ȡ SIM ���� CCID */
			nResult = SIMGL868_GetCCID(m_nCcidBuf, sizeof(m_nCcidBuf));
			if((3 < nCnt++)||(nResult))
			{
				nCnt = 0;
				m_nGprsStep = INIT_CSQ_5;
			}
			UC_SetSleepCnt(8000);
			break;
		case INIT_CSQ_5:/* ��ȡ�ź�ǿ�Ⱦ���֤�˴�������ʱ6S��ѯ���Σ����ܻ������ȶ��ź� */
			nSig = SIMGL868_UpdateSignal();
			if((3 < nCnt++)||((15 <= nSig)&&(32 > nSig)))
			{
				m_nGprsStep = INIT_CREG_6;
				g_nSignal = nSig;
			}
			UC_SetSleepCnt(8000);
			break;
		
		case INIT_CREG_6:   /* ��ע���� GSM ���� */
			nTmp = UC_CommAT(AT_CMD_CREG,	NULL, "+CREG: 0,1", "+CREG: 0,5", "ERROR", NULL, NULL, 1000);
			if((nTmp != 1)&&(nTmp != 2))
			{
				if(TO_MAXCNT < nFailCnt++)
				{
					stRepFail.wError |= (1<<REP_REG_FAIL);
					nFailCnt = 0;
					m_nGprsStep = INIT_PWR_OFF;
				}
				UC_SetSleepCnt(1000);
				return FALSE;
			}
			else
			{
				nFailCnt = 0;
			}
#ifdef XIAMEN_QIJUN_GPRS
			m_nGprsStep = PPP_CGATT_0;
#else
			m_nGprsStep = PPP_XISP_0;
#endif
			stRepFail.wError &= ~((u16)(1<<REP_REG_FAIL));
			UC_SetSleepCnt(100);
			return TRUE;
		
		default:
			break;
	}
	return FALSE;
}

/**********************************************/
/* GPRSģ���ղ���
������: M590_HandShake
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.08
*//*********************************************/
s8 M590_HandShake(void)
{
	/* �ȴ���ʱ */
	if(FALSE == UC_SleepProc())
	{
		return FALSE;
	}
	switch(m_nGprsStep)
	{
#ifdef XIAMEN_QIJUN_GPRS
	case PPP_CGATT_0: /* GPRS���� */		
		UC_SetSleepCnt(100);
		if(FALSE == AT_CmdFailProc(AT_CMD_CGATT, (u8 *)aucAtPAscii_1, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			return ERROR;
		}
		m_nGprsStep = PPP_CSTT_1;
		break;
	case PPP_CSTT_1: /* ����APN */
		UC_SetSleepCnt(100);
		if(FALSE == AT_CmdFailProc(AT_CMD_XGAUTH, (u8 *)g_nApnBuf, "OK", "ERROR", NULL, NULL, NULL, 1000))
		//if(1 != UC_CommATExt(AT_CMD_XGAUTH, (u8 *)g_nApnBuf, g_nUsrBuf, g_nPwdBuf, "OK", "ERROR", NULL,NULL,NULL, 1000))
		{
			return ERROR;
		}
		m_nGprsStep = PPP_CIICR_2;
		break;
		
	case PPP_CIICR_2: /* �����ƶ����������� GPRS �� CSD �������� */
		UC_SetSleepCnt(3000);
		if(FALSE == AT_CmdFailProc(AT_CMD_XISP, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			return ERROR;
		}
		m_nGprsStep = PPP_CIFSR_3;
		break;

	case PPP_CIFSR_3: /* ��ȡIP */
		UC_SetSleepCnt(100);
		if(2 == UC_CommAT(AT_CMD_XIIC, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			if(TO_MAXCNT < m_nCnt++)
			{
				m_nCnt = 0;
				m_nGprsStep = INIT_PWR_OFF;
				ucStatusGsm = GSM_INIT;
				stRepFail.wError |= (1<<ATCMD_ERROR);
			}
			UC_SetSleepCnt(1000);
			return ERROR;
		}
		m_nCnt = 0;
		m_nGprsStep = PPP_ATE0_4;
		break;		
	case PPP_ATE0_4: /* �رջ��� */
		UC_SetSleepCnt(100);
		if(FALSE == AT_CmdFailProc(AT_CMD_S_E, (u8 *)aucAtPAscii_0, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			return ERROR;
		}
		m_nGprsStep = PPP_CGATT_0;
		return TRUE;
	default:
		break;
#else  //�з�ģ��
	case PPP_XISP_0: /* ѡ���ڲ�Э�� */
		if(1 != UC_CommAT(AT_CMD_XISP, (u8 *)aucAtPAscii_0, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			m_nGprsStep = INIT_PWR_OFF;
			return ERROR;
		}
		m_nGprsStep = PPP_PDPCM_1;
		UC_SetSleepCnt(100);
		break;
	case PPP_PDPCM_1: /* ����Ϊ�ƶ���ʽ */
		if(1 != UC_CommAT(AT_CMD_PDPCM,  NULL, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			m_nGprsStep = INIT_PWR_OFF;
			return ERROR;
		}
		m_nGprsStep = PPP_XGAUTH_2;
		UC_SetSleepCnt(1000);
		break;
	case PPP_XGAUTH_2: /* �û���֤ */
		if(1 != UC_CommAT(AT_CMD_XGAUTH,  NULL, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			m_nGprsStep = INIT_PWR_OFF;
			return ERROR;
		}
		m_nGprsStep = PPP_CGATT_3;
		UC_SetSleepCnt(3000);
		break;
		
	case PPP_CGATT_3: /* ���� GPRS ���źͷ��� */
		if(1 != UC_CommAT(AT_CMD_CGATT, (u8 *)aucAtPAscii_1, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			m_nGprsStep = INIT_PWR_OFF;
			return ERROR;
		}
		m_nGprsStep = PPP_XIIC_4;
		UC_SetSleepCnt(100);
		break;
		
	case PPP_XIIC_4: /* ���� PPP ���� */
		if(1 != UC_CommAT(AT_CMD_XIIC, (u8 *)aucAtPAscii_Equal1, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			m_nGprsStep = INIT_PWR_OFF;
			return ERROR;
		}
		m_nGprsStep = PPP_GETIP_5;
		UC_SetSleepCnt(5000);
		break;
		
	case PPP_GETIP_5: /* ��ȡIP */
		if(1 != UC_CommAT(AT_CMD_XIIC, (u8 *)aucAtPAscii_Question, "OK", "ERROR", NULL, NULL, NULL, 1000))
		{
			m_nGprsStep = INIT_PWR_OFF;
			return ERROR;
		}
		m_nGprsStep = PPP_XISP_0;
		return TRUE;
	default:
		break;
#endif
	}

	/* ͬ������ʱ�� */
	//if(1 != UC_CommAT(AT_CMD_MYTIMEUPDATE, (u8 *)aucAtPTimeServer2, "OK", "ERROR", NULL, NULL, NULL, 1000))
	{
	//	return FALSE;
	}
	//UC_Sleep(4000);

	/* ͬ������ʱ�� */
	//if(1 != UC_CommAT(AT_CMD_MYTIMEUPDATE, (u8 *)aucAtPTimeServer1, "OK", "ERROR", NULL, NULL, NULL, 1000))
	{
	//	return FALSE;
	}
	//UC_Sleep(4000);	
	
	return FALSE;
}

/**********************************************/
/* GPRSģ��ر����Ӻ���
������: M590_CloseConnect
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.08
*//*********************************************/
u8 M590_CloseConnect(void)
{	
#if 1
		SetIO_LEDOff();
#ifdef XINJIANG_PTR
		SetLogonMode(UP_UPLOAD);
#else ifdef JASON130_PTR
		SetLogonMode(UP_LOGIN);
#endif
	
	m_nGprsStep = INIT_PWR_OFF;
	
	/* ���ι�� */
	FeedSoftWareIwdg();
	
	/* �ر�TCP���� */
	UC_CommAT(AT_CMD_TCPCLOSE, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
	delay_ms(50);

	/* �ر� ģ���Ѽ��� ���� */		
	UC_CommAT(AT_SHUT_DOWN, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
	delay_ms(50);

	/* ���ι�� */
	FeedSoftWareIwdg();

	/* ���� GPRS ���źͷ��� */
	UC_CommAT(AT_CMD_CGATT, (u8 *)aucAtPAscii_0, "OK", "ERROR", NULL, NULL, NULL, 1000);
	delay_ms(50);

	/* �ر� ģ�� */
	UC_CommAT(AT_CMD_CPWROFF, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000);
	delay_ms(50);

#endif
	return TRUE;	
}

/**********************************************/
/* TCP��������
������: M590_ConnectServer
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.09
*//*********************************************/
u8 M590_ConnectServer(u8 nBkFlg)
{
	u8 nRef = 0;

	/* ʱ��ͬ����ѯ */
	//if(1 != UC_CommAT(AT_CMD_CCLK, NULL, "OK", "ERROR", NULL, NULL, NULL, 1000))
	//{
	//	return FALSE;
	//}
	//UC_Sleep(100);

	/* ���� TCP ���� */	
	if(FALSE == nBkFlg)
	{
		nRef = UC_CommATExt(AT_CMD_TCPSETUP, (u8 *)aucAtPServer1, (u8 *)aucAtPPort1, NULL,"CONNECT OK", "ALREADY CONNECT", "CONNECT FAIL", "ERROR", NULL, 20000);
		if((1 != nRef)&&(2 != nRef))
		{
			stRepFail.wError |= (1<<REP_CONNECT_FAIL);
			return FALSE;
		}
	}
	else
	{
		nRef = UC_CommATExt(AT_CMD_TCPSETUP, (u8 *)aucAtPServerBk, (u8 *)aucAtPPortBk, NULL,"CONNECT OK", "ALREADY CONNECT", "CONNECT FAIL", "ERROR", NULL, 20000);
		if((1 != nRef)&&(2 != nRef))
		{
			stRepFail.wError |= (1<<REP_CONNECT_FAIL);
			return FALSE;
		}
	}
	UC_SleepFunc(100);
	
	stRepFail.wError &= ~((u16)(1<<REP_CONNECT_FAIL));
	return TRUE;	
}

/**********************************************/
/* TCP���ݷ��ͺ���
������: M590_TcpSendDatLen
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.09
*//*********************************************/
s8 M590_TcpSendDatLen(u8 nLen)
{
	s8 nRef = FALSE;
		
	if(0 == nLen)
	{
		return FALSE;
	}
		
	ucNumberMessage = nLen;

	/* �������ݳ��� */
	nRef = UC_CommATExt(AT_CMD_TCPSEND, NULL, NULL, NULL, ">", "ERROR", "Link Closed", NULL, NULL, 4000);
	UC_SleepFunc(100);

	if(1 == nRef)
	{
		return TRUE;	
	}
	else if((2 == nRef) || (3 == nRef))
	{
		return -1;
	}
	else
	{
		return FALSE;
	}
}

/**********************************************/
/* �ȴ������ϱ���� 
������: WatitDataSendOk
��  ��: Size tyProtol130
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.05.27
*//*********************************************/
u8 WatitDataSendOk(void)
{
	/* �ȴ����ݷ������ */
	if(1 != UC_CommAT(AT_CMD_NULL, NULL, "OK", "ERROR", NULL, NULL, NULL, 20000))
	{
		//stRepFail.wError |= (1<<GSM_TIMEOUT);
		//M590_CloseConnect();
		//ucStatusGsm = GSM_SHAKEHAND;
		return FALSE;
	}
	return TRUE;
}
#endif


/* 130Э�鴦���� */
#ifdef JASON130_PTR
#ifndef PIEZOMETER
/**********************************************/
/* ��ȡ�����ݽӿ�
������: JX_GetDayFreezeDat
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.06.03
*//*********************************************/
u8 JASON130_GetDayFreezeDat(u8 nYear, u8 nMon, u8 nDay, u8* pnOutBuf)
{
	u8 i = 0;
	TypeRecordDay stRecord;
	u8 nRef = FALSE;
	
	for(i = 0; i < NUMBER_RECORD_DAY; i++)  //  wTemp
	{
		/* EEPROM�����ݻ��¼ʱ��Ϊ��Ч */
		if((FALSE == ReadDayFreezeRecord(i, (u8*)&stRecord, sizeof(stRecord)))
			||(0xFF == stRecord.nMon)||(0xFF == stRecord.nDay))
		{
			break;
		}
		
		if((stRecord.nYear == nYear)&&(stRecord.nMon == nMon)&&(stRecord.nDay == nDay))
		{
			nRef = TRUE;
			break;
		}		
	}

	if(FALSE == nRef)
	{
		stRecord.Value = INVALID_DATA;
	}
	MemcpyFunc(pnOutBuf, (u8*)&stRecord.Value, sizeof(stRecord.Value));
	VavleStatTransform(m_nMasterType, tyParameter.Status, &tyParameter.Status);
	pnOutBuf[4] = tyParameter.Status;

	return 5;	
}

/**********************************************/
/* ��ȡ�����ݽӿ�
������: JX_GetMonFreezeDat
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.06.03
*//*********************************************/
u8 JASON130_GetMonFreezeDat(u8 nYear, u8 nMon, u8* pnOutBuf)
{
	u8 i = 0;
	TypeRecordMon stRecord;
	u8 nRef = FALSE;
	
	for(i = 0; i < NUMBER_RECORD_MON; i++)  //  wTemp
	{
		/* EEPROM�����ݻ��¼ʱ��Ϊ��Ч */
		if((FALSE == ReadMonFreezeRecord(i, (u8*)&stRecord, sizeof(stRecord)))
			||(0xFF == stRecord.nMon))
		{
			break;
		}
		
		if((stRecord.nYear == nYear)&&(stRecord.nMon == nMon))
		{
			nRef = TRUE;
			break;
		}		
	}

	if(FALSE == nRef)
	{
		stRecord.Value = INVALID_DATA;
	}
	MemcpyFunc(pnOutBuf, (u8*)&stRecord.Value, sizeof(stRecord.Value));
	VavleStatTransform(m_nMasterType, tyParameter.Status, &tyParameter.Status);
	pnOutBuf[4] = tyParameter.Status;

	return 5;
}
#endif
/**********************************************/
/* ��д��¼�ϱ���־
������: ReWriteRepFlg
��  ��: nIndex
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.03.26
*//*********************************************/
void ReWriteRepFlg(void)
{
	u8 nLoop = 0;
	TypeRecord stRecord;
	
	for(nLoop = 0; nLoop <= m_nRepIndex; nLoop++)
	{
		ReadRecord(nLoop, (u8*)&stRecord, sizeof(stRecord));
		stRecord.nRepFlg = FALSE;		
		if(FALSE == EditRecord(nLoop,(u8*)&stRecord, sizeof(stRecord)))
		{
			EditRecord(nLoop,(u8*)&stRecord, sizeof(stRecord));
		}
	}
}

/**********************************************/
/* �����ϱ���PCӦ��֡�л�ģʽ
������: �ϱ�����Ӧ��֡����
��  ��: dwItem
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.03.26
*//*********************************************/
u8 TermReportReplyPro(u32 dwItem, u8 *pnBuf)
{
	if(0 != (dwItem&0xFFFF00FF))
	{
		return FALSE;
	}
	
	/* ��ʱ�����ϱ�Ӧ�� */
	if(0x00000400 == dwItem)
	{
		if((pnBuf[0] == 0x8c)&&(pnBuf[1] == 0x00) 
			&& (pnBuf[2] == 0)&&(pnBuf[3] == 0x45)&&(pnBuf[4] == 0x24))
		{
			stOptValve.nOptFlg = 0;
			stOptValve.nRepFailCnt = 0;
			SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
			SetLogonMode(UP_HEARTBEAT);
			m_nRepEnableFlg = FALSE;
			m_nWakeupReportFlg &=(~(REPORT_FAIL_FLG));
			SaveReportFlag(m_nWakeupReportFlg); 
			m_nRepFailFlg = FALSE;
		}
		return FALSE;
	}
	
	/* ����й��������߶�ʱ���ط��ϱ�Ӧ���ظ�һ��ȷ��֡�������⴦�� */
	if((MASTER_OLD == m_nMasterType)&&(CTL_VALVE_OVER == stOptValve.nOptFlg))
	{
		return FALSE;
	}
	
	/* ���𰴼��澯�ϱ�Ӧ�� */
	if(0x00000200 != dwItem)
	{
#ifdef PURCHASE_MODE
		if(OWED_STAT_FLG == (tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL|OWED_STAT_FLG)))
		{
			g_nOwedRepFlg = SUCCESS_GLOBAL;
		}
#endif	
		/* �澯�ϱ��ɹ������ñ�־λ */
		if(UP_UPLOAD_BAT_VAL == nLogonModeBk)
		{
			g_nGuardEnFlg = (ALARM_REP_FLG|(g_nGuardEnFlg&0x3F));
			SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
		}	
	}

	/* ��ʱ�����ϱ�������Ӧ�� */
	if(0x00000100 == dwItem)
	{
		m_nRepEnableFlg = FALSE;
		BatteryVolRepPro();
		m_nWakeupReportFlg &=(~(REPORT_FAIL_FLG));
		SaveReportFlag(m_nWakeupReportFlg);	
		m_nRepFailFlg = FALSE;
		m_nDataRepSucFlg = TRUE;
	}
	else if(0x00000200 == dwItem)
	{
		g_dwRepTick = GetSysTemTick();
		if((UP_UPLOAD == nLogonModeBk)||(UP_UPLOAD_BAT_VAL == nLogonModeBk))
		{
			ucLogonMode = nLogonModeBk;
		}
	}/* ��˾�Զ��������ʱ����ʱ˯�ߴ��� */
	else
	{
		m_nRepEnableFlg = FALSE;
		g_dwRepTick  = GetSysTemTick();
		g_nDatRepCnt = 0;
		SaveReportFlag(FALSE);
		m_nWakeupReportFlg &=(~(REPORT_FAIL_FLG));
		SaveReportFlag(m_nWakeupReportFlg);		
		m_nRepFailFlg = FALSE;	
		m_nDataRepSucFlg = TRUE;
		g_dwCommDelay = (u16)((dwItem>>8)&0x000000FF);
		
		if((45 <= g_dwCommDelay)&&(120 >= g_dwCommDelay))
		{
			g_dwCommDelay = ((g_dwCommDelay*5/7)*1000);
		}
		else  /* (0x00000300 == dwItem)����������ģʽ */
		{
			g_dwCommDelay = REPROT_DELAYTO;
		}
	}
	
	return FALSE;
}
#ifdef  PIEZOMETER
/**********************************************/
/* ���ᵥλת��
������: FreezeUnitTransform
��  ��: pnOutBuf
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2017.05.25
*//*********************************************/
u8 FreezeUnitTransform(u16 wGmTime)
{
	u8 nGmUnit = 0;

	if(05 == wGmTime)
	{
		nGmUnit = 254;
	}
	else if(15 == wGmTime)
	{
		nGmUnit = 1;
	}
	else if(30 == wGmTime)
	{
		nGmUnit = 2;
	}
	else if(60 == wGmTime)
	{
		nGmUnit = 3;
	}
	return nGmUnit;	
}

/**********************************************/
/* �ϱ����ݵ������㼰����
������: RepPizeometerMakeFrame
��  ��: pnOutBuf
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.12.31
*//*********************************************/
u8 RepPizeometerMakeFrame(u8* pnOutBuf, u8* pnLen)
{
	u8 i = 0, nIndex = 0, nTimeFlg = TRUE, nAtReportLen = 0,nResult = 0;
	TypeRecord stRecord;
	u16 wTemp = 0;
	u8 nTmpBuf[4]={0};

	for(i = MAX_REPORT_NUM; i > 0; i--)  //  wTemp
	{	
		nResult = ReadRecord(i-1, (u8*)&stRecord, sizeof(stRecord));

		if(((nResult)&&(FALSE == stRecord.nRepFlg))||(FALSE == nResult))
		{
			nTimeFlg = TRUE;
			nIndex   = 0;
		}
		
		if(nTimeFlg)
		{
			/* EEPROM�����ݻ��¼ʱ��Ϊ��Ч */
			if((FALSE == nResult)
				||(0xFF == stRecord.Time.Byte.Hour)||(0xFF == stRecord.Time.Byte.Day)||(FALSE == stRecord.nRepFlg))
			{
				continue;
			}
			MemcpyFunc(pnOutBuf, (u8*)&stRecord.Time.Byte.Minute, 5); 
			nTimeFlg = FALSE;
		}

		if(INVALID_DATA != stRecord.wPressure)
		{
			JX_DWORDToBCD((u32)stRecord.wPressure, nTmpBuf, 4); 
		}
		else
		{
			MemsetFunc(nTmpBuf, 0xEE, 4); 
		}
		MemcpyFunc(&pnOutBuf[nIndex*4+9], nTmpBuf, 4);		
		//JX_BL_Change(2,(u8*)&pnOutBuf[i*4+5+6]);
		nAtReportLen = nIndex*4+9;
		nIndex++;
	}
	if(((0 == i)&&(0 == nIndex))||(KEY_WUAKEUP_FLG&GetReportFailFlag()))
	{
		//�Ż����������ѹ��ֵ����2018042501
		if((INVALID_DATA != stRecord.wPressure)||(KEY_WUAKEUP_FLG&GetReportFailFlag()))
		{
			JX_DWORDToBCD((u32)tyRecord.wPressure, nTmpBuf, 4); 
		}
		else
		{
			MemsetFunc(nTmpBuf, 0xEE, 4); 
		}		
		MemcpyFunc(&pnOutBuf[9], nTmpBuf, 4);	
		MemcpyFunc(pnOutBuf, (u8*)&tyRecord.Time.Byte.Minute, 5); 		
		*pnLen = 9;
		return 1;
	}

	*pnLen = nAtReportLen;
	return nIndex;	
}
#endif
/**********************************************/
/* �ϱ����ݵ������㼰����
������: AutoReportMakeFrame
��  ��: pnOutBuf
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.12.31
*//*********************************************/
u8 AutoReportMakeFrame(u8* pnOutBuf)
{
	u8 i = 0, nAutoFlg = 0, nAtReportLen = 0;
	TypeRecord stRecord;
	u16 wTemp = 0;

	for(i = 0; i < MAX_REPORT_NUM; i++)  //  wTemp
	{
		/* EEPROM�����ݻ��¼ʱ��Ϊ��Ч */
		if((FALSE == ReadRecord(i, (u8*)&stRecord, sizeof(stRecord)))
			||(0xFF == stRecord.Time.Byte.Hour)||(0xFF == stRecord.Time.Byte.Day)||(TRUE != stRecord.nRepFlg))
		{
			if(0 == i)
			{
#ifdef TEST_VISON
				stRecord.Value = 0x1111;
				MemcpyFunc(&pnOutBuf[5], (u8*)&stTimeNow, sizeof(stRecord.Time));
				JX_BL_Change(6,(u8*)&pnOutBuf[5]);
#else
				if(TRUE == stRecord.nRepFlg)  /* ȥ����Ϊ�Ѿ��ϱ������ݶ�����ȫEE����20170414 */
				{
					stRecord.Value = INVALID_DATA;
				}
				MemcpyFunc(&pnOutBuf[5], (u8*)&stRecord.Time, sizeof(stRecord.Time));
#endif
				JX_BL_Change(4,(u8*)&stRecord.Value);
				MemcpyFunc(pnOutBuf, (u8*)&stRecord.Value, sizeof(stRecord.Value));
				pnOutBuf[4] = tyParameter.Status;
				MemcpyFunc(&pnOutBuf[11], (u8*)&tyReport.wGatherCycle, sizeof(tyReport.wGatherCycle));		
				JX_BL_Change(2,(u8*)&pnOutBuf[11]);
				return 13;
			}
			break;
		}

		/* �¾���վ״̬�л� */
		VavleStatTransform(m_nMasterType, stRecord.nStatus, &stRecord.nStatus);
		
		m_nRepIndex	= i;
		JX_BL_Change(4,(u8*)&stRecord.Value);
		MemcpyFunc(&pnOutBuf[i*4], (u8*)&stRecord.Value, sizeof(stRecord.Value));
		MemcpyFunc(&pnOutBuf[i*4+4], (u8*)&stRecord.nStatus, sizeof(stRecord.nStatus));
		MemcpyFunc(&pnOutBuf[i*4+5], (u8*)&stRecord.Time, sizeof(stRecord.Time)); 
		MemcpyFunc(&pnOutBuf[i*4+5+6], (u8*)&tyReport.wGatherCycle, sizeof(tyReport.wGatherCycle)); 	
		JX_BL_Change(2,(u8*)&pnOutBuf[i*4+5+6]);
		nAtReportLen = i*4+5+6+2;
	}
	JX_BL_DwordChange(m_nRepIndex+1, (u32*)pnOutBuf);
	
	return nAtReportLen;	
}

/**********************************************/
/* 130����Э�鴦��,��¼����������,ʵ�ʷ��͵�����������,��GPRS�޹�
������: Protol130Send
��  ��: Size tyProtol130
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.09
*//*********************************************/
s8 Protol130Send(u8 Size, u8 nComChannel)
{
	u8 *Point, nX, checksum;
	u16 length = 0;
	TypeProtol130Head tyProtol130Head;
	s8 nFailCnt = 0, nOptRelt = FALSE;

	/* GPRS���ӳ������������ */
	if(COM_1 == nComChannel)
	{
		/* ���ӷ������ݳ��� */
		while(3 > nFailCnt++)
		{		
			nOptRelt = M590_TcpSendDatLen(Size + 8); //0x0D�����볤��
			if(-1 == nOptRelt)
			{
				stRepFail.wError |= (1<<DATSEND_ERROR);
				M590_CloseConnect();
				ucStatusGsm = GSM_SHAKEHAND;
				return -1;
			}
			if(TRUE == nOptRelt)
			{
				break;
			}
		}
		if(nFailCnt >= 3 )
		{
			return FALSE;
		}
	}
	
	length = Size * 4 + 1;		//���ȼ��㷽��,�����Ǵ�68���濪ʼ��У��λ����,*4+1����Э��涨�ķ�������

	tyProtol130Head.Head0 = MSG_START;		//���ݰ�ͷ
	tyProtol130Head.Length0[0] = (length&0xFF);
	tyProtol130Head.Length0[1] = ((length>>8)&0xFF);
	tyProtol130Head.Length1[0] = (length&0xFF);		//Э��涨,�ظ�
	tyProtol130Head.Length1[1] = ((length>>8)&0xFF);
	tyProtol130Head.Head1 = MSG_START;		//���ݰ�ͷ
	Point = aucUartTxBuffer;		//ָ��ָ����շ��ͻ���ͷ
	length = Size;

	MemcpyFunc(Point, (u8 *)&tyProtol130Head, sizeof(tyProtol130Head) );	//��������ͷ��������
	Point += sizeof(tyProtol130Head);			//ָ������
	checksum = 0;					//У������ۼӺ�
	for (nX = 0; nX < Size; nX++)
	{
		checksum += tyProtol130.Buffer[nX];    //�����ۼӺ�
	}
	tyProtol130.Buffer[length++] = checksum;
	tyProtol130.Buffer[length++] = MSG_END;		//���ݰ�β
	MemcpyFunc(Point, (u8 *)&tyProtol130, length);		//�����ַ�����������
	Point += length;					//

	FrameSendFunc(Size+8, nComChannel, Point);	
	return TRUE;
}

/*
����:		130����Э�鴦��
����:		void
���:		ucAtCmdReveive
*/
u8 Protol130Handle(void)
{
	u8 f        = 0;
	u8 h        = 0;
	u8 nSendLen = 0;
	Type32Bits temp;
	u16 wBatVol = 0, wAddrLow = 0, wAddrHigh = 0;
	ST_Time stReportTime;
	TM_Time stStar, stEnd;
	int32_t dwTimeOffset = 0;
	u8 nApnBuf[18];
	u8 nBuf[10];
	u8 nOptCmd = 0, nOptRlt = 0, nCnt = 0, nSig = 0;
	u8 nVavleStat = 0;

	int32_t  dwOffset = 0, dwTemp = 0;
	ST_Time stLastTime;


	MemcpyFunc(tyProtol130.Packet.Address, (u8 *)&g_dwTmAddress, sizeof(tyProtol130.Packet.Address));
	tyProtol130.Packet.Broadcast &= 0xfe;			                    //����㲥����־
	tyProtol130.Packet.Control = 0x80;
	tyProtol130.Packet.Seq = (tyProtol130.Packet.Seq&0x0F|0x60);		//��֡����+��Ҫ�ظ�
	MemcpyFunc((u8*)&temp.Bytes.B0, (u8*)tyProtol130.Packet.Data, 4);	
	
	switch (tyProtol130.Packet.Afn)
	{
	case 0x00:			//���е�¼��Ļظ�
	case 0x02:			//��������վ��¼Ӧ��
		if ((0x00000400 == temp.Long)
		&& (tyProtol130.Packet.Buf[0] == 2)
		&& (tyProtol130.Packet.Buf[1] == 0x10) && (tyProtol130.Packet.Buf[2] == 0)
		&& ((tyProtol130.Packet.Buf[3] == 0x01)||(tyProtol130.Packet.Buf[3] == 0x04)) && (tyProtol130.Packet.Buf[4] == 0))
		{
			switch (tyProtol130.Packet.Buf[3])
			{
				case 1:
					//���ϱ�
					m_nMasterType = tyProtol130.Packet.Buf[5];
					MeterTnNumTransform(m_nMasterType, &m_nGmTn_1, &m_nGmTn_2);
					SetIO_LEDOn();
					SetLogonMode(UP_UPLOAD);
					MemcpyFunc(&stTimeNow.nMonth, &tyProtol130.Packet.Buf[8], 5);
					stTimeNow.wYear = tyProtol130.Packet.Buf[6];
					TM_TimeChangeAToB(&stTimeNow, &stEnd);
					if(FALSE == TM_IsValidTimePro(&stEnd))
					{
						break;
					}
					STM8_RTC_Get(&stReportTime);	
					STM8_RTC_Set(&stTimeNow);		
					TM_TimeChangeAToB(&stReportTime, &stStar);
					dwTimeOffset = TM_DiffSecond(&stStar, &stEnd);
					if((-3600 >= dwTimeOffset)||(3600 <= dwTimeOffset))
					{
						/* RTC�澯 */
						ALM_SetAlmStatus(RTC_ERROR);
						stRepFail.wError |= (1<<RTC_TIMEERROR);
						MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stReportTime, sizeof(stRepFail.stTime));
						stRepFail.nSigal = 0xFF; 		//�źŴ�С,�̶�ֵ
						AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
					}
					else
					{
						ALM_ClrAlmStatus(RTC_ERROR);
					}
					ClearRxBuff();
					break;
				
				case 2:
					//�����¼ģʽ
					SetLogonMode(UP_LOGIN);
					break;
					
				case 4:
					g_dwCommDelay = 0;
					if(UP_HEARTBEAT == ucLogonMode)
					{
						bNeedReport = FALSE;
						if(0 == stOptValve.nOptFlg)
						{
							g_OptValveRepFlg = FALSE;
						}
					}
					break;
			}
		}
		
		/* ��ʱ�����ϱ�������Ӧ�� */
		TermReportReplyPro(temp.Long, tyProtol130.Packet.Buf);
		break;
		
	case 0x01:			//���ݳ�ʼ��
		switch (temp.Long)
		{
		case 0x00000100:
		case 0x00000200:
		case 0x00000300:
			temp.Long = CONFIRM_MARK;
			break;
		default:
			temp.Long = DENY_MARK;
			break;
		}
		tyProtol130.Packet.Afn = 0x00;
		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
		nSendLen = 12;
		break;
		
	case 0x04:
		switch (temp.Long)
		{
		case 0x000080f8:		//���ü�������ַ
			MemcpyFunc( (u8 *)&g_dwTmAddress, (u8 *)&tyProtol130.Packet.Buf[0], sizeof(g_dwTmAddress) ); //(u8 *)tyParameter.Address������ַ edit by maronglang 
			MemcpyFunc(tyProtol130.Packet.Address, (u8 *)&g_dwTmAddress, sizeof(tyProtol130.Packet.Address));
			SaveParameterForType((u8*)&g_dwTmAddress, sizeof(g_dwTmAddress), TM_ADDRESS_PRAA);
			temp.Long = CONFIRM_MARK;
			break;
			
		case 0x000002fa:		//����WWW����
			MemcpyFunc( (u8 *)tyReportParameter.Main_Port, (u8 *)&tyProtol130.Packet.Buf, sizeof(tyReportParameter.Main_Port) );  	//�������˿�
			temp.Long = CONFIRM_MARK;
			break;
		default:
			temp.Long = DENY_MARK;
			break;
		}
		tyProtol130.Packet.Afn = 0;
		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
		nSendLen = 12;
		break;
	case 0x0a:
		switch (temp.Long)
		{
		case 0x000080f8:		//��ȡ��������ַ
			f = 1;
			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, (u8 *)&g_dwTmAddress, sizeof(g_dwTmAddress) );//(u8 *)tyParameter.Address������ַ edit by maronglang20180822
			nSendLen = 12 + sizeof(g_dwTmAddress);
			break;
/*		case 0x000002fa:		��ȡ"WWW"���� ��վ��ַ: meter-online.com  ���˿�: 30020
			f = 1;
			*((u16*)&tyProtol130.Packet.Buf[sizeof(MAIN_URL)]) = tyReportParameter.Main_Port;
			Protol130Send(12 + sizeof(MAIN_URL) + sizeof(tyReportParameter.Main_Port));
			break;*/
		case 0x000040fa:		//δ֪
			f = 1;
			tyProtol130.Packet.Buf[0] = 0xcb;
			nSendLen = 13;
			break;
		}
		if (f == 0)		//ʧ��
		{
			tyProtol130.Packet.Afn = 0;
			temp.Long = DENY_MARK;
			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
			nSendLen = 12;
		}
		break;
		
	case 0x84:
		f = 1;
		switch (temp.Long)
		{
		case 0x00004000:		//����GPRS����
			MemcpyFunc( (u8 *)&tyReportParameter, (u8 *)&tyProtol130.Packet.Buf[1], 4);	                //��վ��ַ
			MemcpyFunc( (u8 *)&tyReportParameter.Main_Port, (u8 *)&tyProtol130.Packet.Buf[5], 2);		//���˿�
			MemcpyFunc( (u8 *)&tyReportParameter.Sub_IP, (u8 *)&tyProtol130.Packet.Buf[7], 4);		    //������վ��ַ
			MemcpyFunc( (u8 *)&tyReportParameter.Sub_Port, (u8 *)&tyProtol130.Packet.Buf[11], 2);		//���ö˿�

			//���浽EEPROM
			SaveParameterForType((u8 *)&tyReportParameter, sizeof(tyReportParameter), IPANDPORT_PARA);
			SaveParameterForType((u8 *)&tyProtol130.Packet.Buf[25], APN_LEN, APN_PARA);
			break;
			
		case 0x01012003:			//���ö�ʱ�ϱ�ʱ�������
			MemcpyFunc( (u8 *)&tyReport.cycle, (u8 *)tyProtol130.Packet.Buf, sizeof(tyReport)-3 );		//tyTimerReport
			//tyReport.cycle = (tyReport.cycle & 0xc0) + 1;
			tyReport.Time.Byte.Second = 0;
			
			MemcpyFunc((u8*)&stReportTime, (u8*)&tyReport.Time, sizeof(tyReport.Time));
			JX_BL_Change(6, (u8*)&stReportTime);
			stReportTime.nMonth = stReportTime.nMonth&0x1F;
			TM_TimeChangeAToB(&stReportTime,&stLastReportT);
			if(FALSE == TM_IsValidTimePro(&stLastReportT))
			{
				f = 0;
				break;
			}

			TM_RTimeDecnMinute(&stLastReportT, (u32)(ClaReportTimeToSec(tyReport.cycle)/60));
#ifndef TEST_VISON			
			TM_TimeChangeAToB(&stTimeNow,&stStar);			
			stLastReportT.nMinute = ((g_dwTmAddress+TM_CalPastedSeconds(&stStar))%REPORT_RANDOM_MIN); //�ϱ�ʱ�����ֵ�����
			stLastReportT.nMinute = ((stLastReportT.nMinute == 0)?1:(stLastReportT.nMinute));/* ȥ���볭����ͬһʱ�� 00 �� */
#endif
			MemcpyFunc(nBuf, (u8 *)&stLastReportT,sizeof(stLastReportT));			
			MemcpyFunc(&nBuf[8], (u8 *)&g_wTmReportCnt, 2);
			SaveParameterForType(nBuf, 10, LT_REP_TIME); 
			
			//���浽EEPROM
			SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
			break;

		case 0x00008040:			//���òɼ�����
			MemcpyFunc( (u8 *)&tyReport.wGatherCycle, (u8 *)tyProtol130.Packet.Buf, 2);		//tyTimerReport
			JX_BL_Change(2, (u8 *)&tyReport.wGatherCycle);
			
			//���浽EEPROM
			SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
			break;
#ifdef 	PIEZOMETER
		case 0x00008051:			//����Խ�޸澯����
			tyParameter.wBasePress = JX_BcdToDWORD(tyProtol130.Packet.Buf, 4);
			tyParameter.nUpLmtRate = tyProtol130.Packet.Buf[5];
			tyParameter.nDownLmtRate = tyProtol130.Packet.Buf[6];
			
			//���浽EEPROM
			SaveParameterForType((u8 *)&tyParameter, sizeof(tyParameter), METER_PARA);
			break;
			
		case 0x00008053:			//���ø澯������
			MemcpyFunc( tyParameter.nAlmCtl, (u8 *)tyProtol130.Packet.Buf, 4);		//tyTimerReport
			SaveParameterForType((u8 *)&tyParameter, sizeof(tyParameter), METER_PARA);
			break;
#endif
		case 0x00004003:			//�����ϱ�ֹͣ �����ϱ�����
			tyReport.enable = tyProtol130.Packet.Buf[0];    //�����Զ��ϱ�ֹͣ= 0XAA, �����ϱ�����=0X55
			break;
		case 0x00000401:			//δ֪
			break;
		case 0x0000010B:				//��ַ������
#ifndef  PTROTO_JASON
			if(FALSE == CJ_T188ProtocolReadAdd(nBuf))
			{
				f = 0;
			}
			else
			{
				JX_BL_Change(5, nBuf);
				JX_HexToASCII(nBuf, nApnBuf, 5);
				nApnBuf[10] = 0;
				wAddrLow	= JX_BcdStrTo16BitBin(&nApnBuf[5], 5);
				nApnBuf[5]	= 0;
				wAddrHigh	= JX_BcdStrTo16BitBcd(&nApnBuf[1], 4);
				MemcpyFunc(nBuf, (u8*)&wAddrHigh, 2);
				MemcpyFunc(&nBuf[2], (u8*)&wAddrLow, 2);
				JX_BL_Change(2, nBuf);
				JX_BL_Change(2, &nBuf[2]);
				MemcpyFunc((u8 *)&g_dwTmAddress, nBuf, 4);
				SaveParameterForType((u8*)&g_dwTmAddress, sizeof(g_dwTmAddress), TM_ADDRESS_PRAA);
				MemcpyFunc(tyProtol130.Packet.Address, (u8 *)&g_dwTmAddress, sizeof(tyProtol130.Packet.Address));
			}
#else
			f = 0;
#endif
			break;
#ifdef 	 PURCHASE_MODE	
		case 0x21002001:			/* �����������ͱ��Ԥ���� Ԥ����ĵ�ǰ���� */
			JX_BL_Change(4, &tyProtol130.Packet.Buf[6]);
			MemcpyFunc((u8 *)&temp, (u8 *)&tyProtol130.Packet.Buf[6], 4);		//tyTimerReport
			temp.Long = JX_DwordBcdToBin(temp.Long);
			//if(FULL_RANGE_METER-1 >= temp.Long)  ��Ԥ����������
			//{
				tyParameter.nOverBuyFlg = FALSE;
				tyParameter.dwPurchaseVal = (temp.Long%FULL_RANGE_METER);
				SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
			//}
			JASON_130PurchasePro();
			break;

		case 0x21002002:			/* ����Ӧ����ˮ�� */
			tyParameter.nEmergencyVal = (s8)tyProtol130.Packet.Buf[5];
			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
			break;
#endif
		}
		if (f)
		{
			temp.Long = CONFIRM_MARK;
		}
		else
		{
			temp.Long = DENY_MARK;
		}
		tyProtol130.Packet.Afn = 0;
		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
		nSendLen = 12;
		break;
		
	case 0x8a:
		tyProtol130.Packet.Control = 0x88;
		switch (temp.Long)
		{
		case 0x00004000:		//��GPRS����
			f = 1;
			MemsetFunc(nApnBuf, 0, sizeof(nApnBuf));
			ReadParameterForType(nApnBuf, APN_LEN, APN_PARA);
			tyProtol130.Packet.Buf[0] = 2;									//ͨ������
			MemcpyFunc(&tyProtol130.Packet.Buf[1], (u8 *)&tyReportParameter, 4);               //��վ��ַ
			MemcpyFunc(&tyProtol130.Packet.Buf[5],  (u8 *)&tyReportParameter.Main_Port, 2);		//���˿�
			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf[7], (u8 *)&tyReportParameter.Sub_IP, 4);		    //������վ��ַ
			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf[11], (u8 *)&tyReportParameter.Sub_Port, 2);		//���ö˿�
			MemsetFunc((u8 *)&tyProtol130.Packet.Buf[13], 0x00,44);
			MemcpyFunc((u8 *)&tyProtol130.Packet.Buf[25], nApnBuf, 16);			
			nSendLen = 12 + 57;
			break;
		case 0x01012003:		//���ϱ�ʱ��
			f = 1;
			tyProtol130.Packet.Buf[7] = 1;				//��ʶ����
			tyProtol130.Packet.Buf[8] = 0;				//���ݵ�Ԫ��ʶ 00 00 01 07
			tyProtol130.Packet.Buf[9] = 0;
			tyProtol130.Packet.Buf[10] = 1;
			tyProtol130.Packet.Buf[11] = 7;
			tyProtol130.Packet.Buf[12] = 1;				//������M  0001
			tyProtol130.Packet.Buf[13] = 0;
			tyProtol130.Packet.Buf[14] = m_nGmTn_1;				//�����  0001
			tyProtol130.Packet.Buf[15] = m_nGmTn_2;
			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, (u8 *)&tyReport.cycle, sizeof(tyReport.Time)+1);
			nSendLen = 28;
			break;
		case 0x00004003:							//��ȡ��ʱ�ϱ�����λ
			f = 1;
			tyProtol130.Packet.Afn = 0;
			temp.Long = 0x01014003;
			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
			tyProtol130.Packet.Buf[0] = tyReport.enable;
			nSendLen = 13;
			break;
#ifdef PIEZOMETER
		case 0x00008052:			//��ȡԽ�޸澯����
			f = 1;
			tyProtol130.Packet.Buf[5] = tyParameter.nUpLmtRate;
			tyProtol130.Packet.Buf[6] = tyParameter.nDownLmtRate;
			tyProtol130.Packet.Buf[7] = 0x00;
			tyProtol130.Packet.Control = 0x88;
			tyProtol130.Packet.Afn = 0x8A;			
			nBuf[4] = 0x03;
			JX_DWORDToBCD((u32)tyParameter.wBasePress, nBuf, 4); 
			MemcpyFunc(tyProtol130.Packet.Buf, nBuf, 5);	
			nSendLen = 12 + 8;
			break;
		case 0x00008054:			//��ȡ�澯������
			f = 1;
			tyProtol130.Packet.Control = 0x88;
			tyProtol130.Packet.Afn = 0x8A;			
			MemcpyFunc(tyProtol130.Packet.Buf,tyParameter.nAlmCtl, 4);		//tyTimerReport
			nSendLen = 12 + 4;
			break;
#endif
		}
		if (f == 0)
		{
			tyProtol130.Packet.Afn = 0;
			temp.Long = DENY_MARK;
			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
			nSendLen = 12;
		}
		break;
	case 0x8c:
		switch (temp.Long)
		{
		case 0x00000101:		        //��ȡ��Ӳ���汾
			f = 1;
			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, m_nVerBuf, 16);			
			nSendLen = 12 + 16;
			break;
		case 0x0000010D:		    //��ȡЭ��汾
			f = 1;
			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, m_nPtrcoVerBuf, 8);			
			nSendLen = 12 + 8;
			break;
			
		case 0x00000100:				//��ȡʱ��
			f = 1;
			STM8_RTC_Get(&stTimeNow);
			MemcpyFunc( (u8 *)&tyProtol130.Packet.Buf, (u8 *)&stTimeNow, 6);
			JX_BL_Change(6, tyProtol130.Packet.Buf);
			nSendLen = 12 + 6;
			break;
		case 0x00000107:				//�������� 0x00000107
		case 0x20000107:
			f = 1;
			if(1 == tyProtol130.Packet.Buf[1])
			{
				if(FALSE == GatherMeterFun())
				{
					if(GetTmDebugModeStat())
					{
						tyParameter.Value = INVALID_DATA;
					}
					else
					{
						if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
						{
							tyParameter.Value = tyRecord.Value;
						}
						else
						{
							tyParameter.Value = INVALID_DATA;
						}
					}
				}

				tyProtol130.Packet.Control = 0x88;
				tyProtol130.Packet.Afn = 0x8C;
				tyProtol130.Packet.Buf[0] = 0x01;
				tyProtol130.Packet.Buf[1] = 0x00;				
				tyProtol130.Packet.Buf[2] = m_nGmTn_1;
				tyProtol130.Packet.Buf[3] = m_nGmTn_2;
				MemcpyFunc((u8*)&tyProtol130.Packet.Buf[4], (u8*)&tyParameter.Value, 4);
				JX_BL_Change(4, &tyProtol130.Packet.Buf[4]);
#ifdef	VAVLE_METER
				if(VALVE_CLOSE == g_nValveStat)
				{
					if(MASTER_OLD == m_nMasterType)
					{
						nVavleStat = VALVE_CLOSE_UP;
					}
				}
				else if(VALVE_ERROR == g_nValveStat)
				{
					if(MASTER_OLD == m_nMasterType)
					{
						nVavleStat = VALVE_ERROR_UP;
					}
				}
#else
				nVavleStat = 0x00;
#endif			
				tyProtol130.Packet.Buf[8] = nVavleStat;
				nSendLen = 12 + 9;
			}
			break;
		case 0x00000108:				//��ȡ��������ص�ѹ 0x00000108 16�ֽ�
			f = 1;
			wBatVol = BAT_GetBatVol();	
			if(g_nSignal > 0)
			{
				nSig = g_nSignal;
			}
			else
			{
				TurnBusUartOn();
				SetPortGsmResetDisable();
				SetPortGsmPowerOn();		   //����
				SetPortSoftSwitchOn();
				UC_SleepFunc(2200);
				SetPortSoftSwitchOff();
				nCnt = 0;
				do
				{
					UC_SleepFunc(GETSIGNAL_TO); 
					nSig = SIMGL868_UpdateSignal();
					tyProtol130.Packet.Buf[14] = SIMGetRegisterStat();
				}while((MODE_GETSIGNAL_CNT > nCnt++)&&((25>nSig)||
				(SIM_REG_FAILURE == tyProtol130.Packet.Buf[14])));
			}
					
			tyProtol130.Packet.Control = 0x88;
			tyProtol130.Packet.Afn = 0x8C;
			MemcpyFunc(tyProtol130.Packet.Buf, (u8*)&wBatVol, 2);
			MemcpyFunc(&tyProtol130.Packet.Buf[2], (u8*)&g_dwBatNoLoadVol, 2);
			MemcpyFunc(&tyProtol130.Packet.Buf[4], (u8*)&g_wTmReportCnt, 2);
			TM_TimeChangeBToA(&stLastReportT, &stReportTime);
			MemcpyFunc(&tyProtol130.Packet.Buf[6], (u8*)&stReportTime, 6);
			tyProtol130.Packet.Buf[12] = ALM_GetBatStatus();
			tyProtol130.Packet.Buf[13] = JX_ByteToBcd(nSig);			//�źŴ�С,�̶�ֵ
#ifdef TEST_VISON
			tyProtol130.Packet.Buf[14] = g_nOhterRes;
			tyProtol130.Packet.Buf[15] = g_nIwdg;
#endif
			JX_BL_Change(2, tyProtol130.Packet.Buf);
			JX_BL_Change(2, &tyProtol130.Packet.Buf[2]);
			JX_BL_Change(2, &tyProtol130.Packet.Buf[4]);
			nSendLen = 12 + 16;
			break;

		case 0x00000109:				//��ȡ�ն�CCID��
			f = 1;
			GetIsmiCcidDat();			
			tyProtol130.Packet.Control = 0x88;
			tyProtol130.Packet.Afn = 0x8C;
			MemcpyFunc(tyProtol130.Packet.Buf, m_nCcidBuf, 24);	
			MemcpyFunc(&tyProtol130.Packet.Buf[24], m_nImsiBuf, 24);	
			nSendLen = 12 + 48;
			break;
			
		case 0x0000010A:				//�����ն˽���͹���
			f = 1;
			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
			LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
			tyProtol130.Packet.Afn = 0;
			temp.Long = CONFIRM_MARK;
			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
			nSendLen = 12;
			break;
			
		case 0x0000010E:				//�����ն˽���ά��ģʽ
			f = 1;
			SetTmDebugModeStat(DEBUG_MODE);
			tyProtol130.Packet.Afn = 0;
			temp.Long = CONFIRM_MARK;
			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
			nSendLen = 12;
			break;	
#ifdef PIEZOMETER
		case 0x00000114:				//��ȡѹ��ֵ
			f = 1;
			tyProtol130.Packet.Buf[0] = 0x01;
			tyProtol130.Packet.Buf[1] = 0x00;
			tyProtol130.Packet.Buf[2] = 0x01;
			tyProtol130.Packet.Buf[3] = 0x01;
			tyProtol130.Packet.Control = 0x88;
			tyProtol130.Packet.Afn = 0x8C;			
			nBuf[4] = 0x03;
			tyRecord.wPressure = MODBUS_GetPizeometer(READ_CMD);	
			JX_DWORDToBCD((u32)tyRecord.wPressure, nBuf, 4); 
			MemcpyFunc(&tyProtol130.Packet.Buf[4], nBuf, 5);	
			nSendLen = 12 + 9;
			break;
#endif			
		case 0x0000010C:				//��ȡ������־��Ϣ
			f = 1;
			tyProtol130.Packet.Control = 0x88;
			tyProtol130.Packet.Afn = 0x8C;			
			nSendLen = 12 + AlmMakeFrame(tyProtol130.Packet.Buf);		
			break;
		case 0x0000100C://��ȡ��������ʹ�ܱ�־
			f = 1;
			tyProtol130.Packet.Control = 0x80;
			tyProtol130.Packet.Afn = 0x8C;	
			tyProtol130.Packet.Buf[0] = g_nGuardEnFlg;
			nSendLen = 12 + 1;
			break;

		case 0x00008040:			//���òɼ�����
			f = 1;
			MemcpyFunc(tyProtol130.Packet.Buf,(u8 *)&tyReport.wGatherCycle, 2); 	//tyTimerReport
			JX_BL_Change(2, tyProtol130.Packet.Buf);
			tyProtol130.Packet.Control = 0x88;
			tyProtol130.Packet.Afn = 0x8C;
			nSendLen = 12 + 2;
			break;
#ifdef		PURCHASE_MODE	
		case 0x21002001:			//��ȡ Ԥ���� purchase
			f = 1;
			tyProtol130.Packet.Buf[0] = 0x01;
			tyProtol130.Packet.Buf[1] = 0x00;
			tyProtol130.Packet.Buf[2] = 0x01;
			tyProtol130.Packet.Buf[3] = 0x01;
			tyProtol130.Packet.Buf[4] = 0x00;
			JX_DWORDToBCD(tyParameter.dwPurchaseVal, &tyProtol130.Packet.Buf[5], 4);
			tyProtol130.Packet.Control = 0x88;
			tyProtol130.Packet.Afn = 0x8C;
			nSendLen = 12 + 9;
			break;
#endif
//#ifndef PURCHASE_MODE
#if 0

		case 0x00004523:  /* ��ʱ���ز�����ȡ */
			f = 1;
			tyProtol130.Packet.Control = 0x80;
			tyProtol130.Packet.Afn = 0x8C;	
			tyProtol130.Packet.Buf[0] = stOptValve.nOptFlg;
			tyProtol130.Packet.Buf[1] = stOptValve.nYear;
			tyProtol130.Packet.Buf[7] = stOptValve.nVavleCycle;
			tyProtol130.Packet.Buf[8] = stOptValve.nRepFailCnt;
			MemcpyFunc(&tyProtol130.Packet.Buf[3], &stOptValve.nMonth, 4);
			nSendLen = 12+9;			
			break;
			
		case 0xFFFFFFFD:  /* ��ȡ�ڲ������� */
			tyProtol130.Packet.Control = 0x80;
			f = 1;
			/* �����´γ���ʱ�� test */
			MemcpyFunc((u8*)&tyTime, (u8*)&tyReport.Time, sizeof(TypeTime));
			JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
			MemcpyFunc((u8*)&stLastTime, (u8*)&tyTime, sizeof(TypeTime));
			STM8_RTC_Get(&stTimeNow);
			TM_TimeChangeAToB(&stTimeNow, &stEnd);
			TM_TimeChangeAToB(&stLastTime, &stStar);
			dwOffset = TM_DiffSecond(&stStar, &stEnd);	
			TM_RTimeAddnMinute(&stEnd, (u32)(tyReport.wGatherCycle - (u16)((dwOffset/60)%(u32)tyReport.wGatherCycle)));
			TM_TimeChangeBToA(&stEnd, &g_stNextGmTime); 
			MemcpyFunc(&tyProtol130.Packet.Buf[0], (u8*)&g_stNextGmTime, 7);
			
			TM_TimeChangeAToB(&stTimeNow, &stEnd);
			stEnd.nSecond = 0;
			dwOffset = TM_DiffSecond(&stLastReportT, &stEnd);
			dwTemp	 = ClaReportTimeToSec(tyReport.cycle);			
			TM_RTimeAddnMinute(&stEnd, ((dwTemp - (u32)(dwOffset%dwTemp))/60));
			TM_TimeChangeBToA(&stEnd, &g_stNextRepTime);
			MemcpyFunc(&tyProtol130.Packet.Buf[7], (u8*)&g_stNextRepTime, 7);
			nSendLen = 12 + 14;
			break;

		case 0xFFFFFFFE:  /* ��ȡ�ڲ������� */
			if(7 < tyProtol130.Packet.Buf[0])
			{	
				f = 0;
				break;
			}
			ReadDataMemory(tyProtol130.Packet.Buf[0], &tyProtol130.Packet.Buf[1], 128);
			nSendLen = 12+1+128;			
			f = 1;
			break;
#endif

		}
		if (f == 0) //Q1667
		{
			tyProtol130.Packet.Afn = 0;
			temp.Long = DENY_MARK;
			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
			nSendLen = 12;
		}
		break;

	case 0x85:
		switch (temp.Long)
		{
		case 0x00000100:  //�ط�0xaa  ���� = 0x55
		case 0x20000102:
			nOptCmd = tyProtol130.Packet.Buf[10];//tyProtol130.Packet.Buf[9] ? tyProtol130.Packet.Buf[16] : tyProtol130.Packet.Buf[10];
			if (nOptCmd == 0xaa || nOptCmd == 0x55)	//��բ��ǰ��0xaa  ��բ��ǰ�� = 0x55
			{
				do{
					if(nOptCmd == 0xaa)
					{
						nOptRlt = VavleOperateFun(VALVECLOSE);
#ifdef PROTO_JASON
						g_nValveStat = VALVE_CLOSE;
#endif
					}
					else
					{
						nOptRlt = VavleOperateFun(VALVEOPEN);	
#ifdef PROTO_JASON
						g_nValveStat = VALVE_OPEN;
#endif
					}
					h++;
				}while((FALSE == nOptRlt)&&(1 > h));

			}
			if(nOptRlt)
			{
				temp.Long = CONFIRM_MARK;
			}
			else
			{
#ifdef PROTO_JASON
				g_nValveStat = VALVE_ERROR;
#endif
				temp.Long    = DENY_MARK;
			}
			break;
			
		case 0x00004523:  /* ��ʱ���ز��� */
			stOptValve.nOptFlg = tyProtol130.Packet.Buf[0];
			stOptValve.nYear   = tyProtol130.Packet.Buf[1];
			stOptValve.nEnableFlg = stOptValve.nOptFlg;
			stOptValve.nVavleCycle =  tyProtol130.Packet.Buf[7];
			MemcpyFunc(&stOptValve.nMonth, &tyProtol130.Packet.Buf[3], 4);
			SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
			temp.Long = CONFIRM_MARK;
			break;

		case 0x00000200:		//δ֪
			f = 1;
			temp.Long = CONFIRM_MARK;
			break;
		case 0x00001001://����ʱ�� tyTime.Byte.Month �ֽڸ���λ���� ��4λΪ�·�0-9������λ��ʾ10λ 12�����ʾ��0x12�ټ��ϵ������ڼ�
			f = 1;
			MemcpyFunc( (u8 *)&stTimeNow, (u8 *)&tyProtol130.Packet.Buf, 6);
			JX_BL_Change(6, (u8*)&stTimeNow);
			stTimeNow.nMonth = stTimeNow.nMonth&0x1F;
			STM8_RTC_Set(&stTimeNow);
			temp.Long = CONFIRM_MARK;
			break;
		case 0x00001003://��������֡
			f = 1;
			temp.Long = CONFIRM_MARK;		
#ifdef PIEZOMETER
			if(UP_UPLOAD_PRESSURE == nLogonModeBk)
			{
				BatteryVolRepPro();
			}
			else
			{
				SetLogonMode(UP_UPLOAD_PRESSURE);
			}
#else
			BatteryVolRepPro();
#endif
			break;	
		case 0x0000100C://���÷�������ʹ�ܱ�־
			f = 1;
			temp.Long = CONFIRM_MARK;			
			g_nGuardEnFlg = tyProtol130.Packet.Buf[0];
			SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
			break;
			
		default:
			temp.Long = DENY_MARK;
			break;
		}
		tyProtol130.Packet.Afn = 0;
		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
		nSendLen = 12;
		break;
	case 0x8d:					//�ն���
#ifndef PIEZOMETER
		if((0x21000001 == temp.Long)||(0x01000001 == temp.Long))
		{
			MemcpyFunc(&tyProtol130.Packet.Buf[10], &tyProtol130.Packet.Buf[5], 4);
			if(0x0 == tyProtol130.Packet.Buf[5])
			{
				JASON130_GetMonFreezeDat(tyProtol130.Packet.Buf[7], 
					tyProtol130.Packet.Buf[6], &tyProtol130.Packet.Buf[5]);
			}
			else
			{
				if(0x20 == tyProtol130.Packet.Buf[8])
				{
					JASON130_GetDayFreezeDat(tyProtol130.Packet.Buf[7], 
						tyProtol130.Packet.Buf[6], tyProtol130.Packet.Buf[5], &tyProtol130.Packet.Buf[5]);
				}
			}
			nSendLen = 12+14;
		}
		else
#endif
		{
			tyProtol130.Packet.Afn = 0;
			temp.Long = DENY_MARK;
			tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
			tyProtol130.Packet.Data[1] = temp.Bytes.B1;
			tyProtol130.Packet.Data[2] = temp.Bytes.B2;
			tyProtol130.Packet.Data[3] = temp.Bytes.B3;
			nSendLen = 12;
		}
		break;
	case 0x8e:					//δ֪
		tyProtol130.Packet.Afn = 0;
		temp.Long = DENY_MARK;
		tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
		tyProtol130.Packet.Data[1] = temp.Bytes.B1;
		tyProtol130.Packet.Data[2] = temp.Bytes.B2;
		tyProtol130.Packet.Data[3] = temp.Bytes.B3;
		nSendLen = 12;
		break;
	}
	return nSendLen;
}

/*
����:		��¼+����+ע��+�ϱ�,n��1
����:		ucLogonMode,tyJasonMaster
���:		��
*/
u8 Online(u8 nLogonMode)
{
	Type32Bits temp;
	u8 nStrBuf[4] = {0}, nSendLen = 0;
	u16 wBatVol   = 0;
	ST_Time stReportTime;
	
	tyProtol130.Packet.Afn = 2;
	tyProtol130.Packet.Broadcast = 0;			//����㲥����־
	tyProtol130.Packet.Control = 0xc9;
	tyProtol130.Packet.Seq = 0x70;		//��֡����+��Ҫ�ظ� 0x60
	MemcpyFunc(tyProtol130.Packet.Address, (u8 *)&g_dwTmAddress, sizeof(tyProtol130.Packet.Address));
	switch (nLogonMode)
	{
	case UP_LOGIN:		//������(��¼)
		ucNumberMessage = 12;
		temp.Long = 0x10000100;
		break;
	case UP_HEARTBEAT:		//������(����)
		ucNumberMessage = 12; //13;
		temp.Long = 0x10000400;
		break;
	case UP_LOGOUT:		//����
		ucNumberMessage = 12;		//���ĵ����ݳ���
		temp.Long = 0x00000000;
/*		ucLogonCount++;
		if (ucLogonCount++ > 9)
		{
			ucLogonMode = 0;
			temp.Long |= 0x00000200;
		}
		else
*/		{
			temp.Long |= 0x00000400;    //������(����)
		}
		break;
	case UP_UPLOAD:		//�ϱ�
		ucNumberMessage = 12;
		temp.Long = 0x10000107;
		break;
		
	case UP_UPLOAD_BAT_VAL: 	//�ϱ���ص�ѹ
		temp.Long = 0x00000108;
		break;
#ifdef PIEZOMETER
	case UP_UPLOAD_PRESSURE: 	//ѹ������
		temp.Long = 0x21000002;
		break;
#endif
	default:
		break;
	}

	/* ��ʱ�������ϱ� */
	if ( (ucLogonMode == UP_UPLOAD) && (TRUE == g_OptValveRepFlg) && (bNeedReport) )
	{
		temp.Long = 0x00004524;
		tyProtol130.Packet.Afn = 0x8c;
		tyProtol130.Packet.Control = 0xC9;
		tyProtol130.Packet.Buf[0] = stOptValve.nYear;
		tyProtol130.Packet.Buf[1] = 0x20;
		MemcpyFunc(&tyProtol130.Packet.Buf[2], &stOptValve.nMonth, 4);
		tyProtol130.Packet.Buf[7] = 1;		//������,IP��,�̶�1������
		tyProtol130.Packet.Buf[8] = 0;
		tyProtol130.Packet.Buf[9]  = m_nGmTn_1;		//�ɼ���TN 
		tyProtol130.Packet.Buf[10] = m_nGmTn_2;		//��TN��
		tyProtol130.Packet.Buf[11] = stOptValve.nVavleStat;
		nSendLen = 12 + 12;
	}
	else if ( (ucLogonMode == UP_UPLOAD) && (bNeedReport) )
	{
		//�Զ��ϱ�
		tyProtol130.Packet.Afn = 0x8c;
		tyProtol130.Packet.Control = 0x88;
		tyProtol130.Packet.Buf[0] = 1;		//������,IP��,�̶�1������
		tyProtol130.Packet.Buf[1] = 0;		
		tyProtol130.Packet.Buf[2] = m_nGmTn_1;		//�ɼ���TN 
		tyProtol130.Packet.Buf[3] = m_nGmTn_2;		//��TN��

		/* Ƿ�ѹط��ϱ� */
		if(OWED_STAT_FLG == (tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL|OWED_STAT_FLG)))
		{
			tyProtol130.Packet.Buf[0] = 0x01;
			tyProtol130.Packet.Buf[1] = 0x01;
			
			if(FALSE == GM_GetGatherMeterFlg())
			{
				if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
				{
					tyParameter.Value = tyRecord.Value;
					tyParameter.Status = tyRecord.nStatus;
				}
				else
				{
					tyParameter.Value = INVALID_DATA;
				}
			}
			/* �¾���վ״̬�л� */
			VavleStatTransform(m_nMasterType, tyParameter.Status, &tyParameter.Status);
			
			temp.Long = tyParameter.Value;	//4λ�����
			tyProtol130.Packet.Buf[2] = temp.Bytes.B3;		//LSB
			tyProtol130.Packet.Buf[3] = temp.Bytes.B2;
			tyProtol130.Packet.Buf[4] = temp.Bytes.B1;
			tyProtol130.Packet.Buf[5] = temp.Bytes.B0;
			tyProtol130.Packet.Buf[6] = tyParameter.Status;
			STM8_RTC_Get(&stTimeNow);
			tyProtol130.Packet.Buf[11]= 0x20;
			tyProtol130.Packet.Buf[12]= stTimeNow.wYear;
			MemcpyFunc(&tyProtol130.Packet.Buf[13], &stTimeNow.nMonth, 5);
			JX_BL_Change(7, &tyProtol130.Packet.Buf[11]);
			temp.Long = 0x21000112;
			nSendLen =	12 + 18;
		}
		else if(TRUE == (m_nWakeupReportFlg&KEY_WUAKEUP_FLG))/* ��������Ϊ������� */
		{
			m_nRepIndex = 0;
			if(FALSE == GM_GetGatherMeterFlg())
			{
				if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
				{
					tyParameter.Value = tyRecord.Value;
					tyParameter.Status = tyRecord.nStatus;
				}
				else
				{
#ifdef TEST_VISON
					tyParameter.Value = 0x1111;
#else
					tyParameter.Value = INVALID_DATA;
#endif
				}
			}
			temp.Long = tyParameter.Value;	//4λ�����
			tyProtol130.Packet.Buf[4] = temp.Bytes.B3;		//LSB
			tyProtol130.Packet.Buf[5] = temp.Bytes.B2;
			tyProtol130.Packet.Buf[6] = temp.Bytes.B1;
			tyProtol130.Packet.Buf[7] = temp.Bytes.B0;
			nSendLen =	12 + 2 + 1 * 7;
			if(MASTER_NEW == m_nMasterType)
			{
				temp.Long = 0x30000107;				
			}
			else
			{
				temp.Long = 0x10000107;
			}
			VavleStatTransform(m_nMasterType, tyParameter.Status, &tyParameter.Status);
			tyProtol130.Packet.Buf[8] = tyParameter.Status;
		}
		else
		{
			tyProtol130.Packet.Buf[0] = m_nGmTn_1;		//�ɼ���TN 
			tyProtol130.Packet.Buf[1] = m_nGmTn_2;		//��TN��
			temp.Long = 0x00110107;
			nSendLen = 12+2+ AutoReportMakeFrame(&tyProtol130.Packet.Buf[2]);
		}
	}
	else if((ucLogonMode == UP_UPLOAD_BAT_VAL) && (bNeedReport))
	{
		wBatVol = g_dwBatVol;//BAT_GetBatVol();				
		tyProtol130.Packet.Control = 0x88;
		tyProtol130.Packet.Afn = 0x8C;
		MemcpyFunc(tyProtol130.Packet.Buf, (u8*)&wBatVol, 2);
		MemcpyFunc(&tyProtol130.Packet.Buf[2], (u8*)&g_dwBatNoLoadVol, 2);
		MemcpyFunc(&tyProtol130.Packet.Buf[4], (u8*)&g_wTmReportCnt, 2);
		TM_TimeChangeBToA(&stLastReportT, &stReportTime);
		MemcpyFunc(&tyProtol130.Packet.Buf[6], (u8*)&stReportTime, 6);
		tyProtol130.Packet.Buf[13] = JX_ByteToBcd(g_nSignal);			//�źŴ�С,�̶�ֵ
		tyProtol130.Packet.Buf[12] = ALM_GetBatStatus();			        //�澯״̬
		
		MemsetFunc((u8*)&tyProtol130.Packet.Buf[14], 0x00, 2);
		JX_BL_Change(2, tyProtol130.Packet.Buf);
		JX_BL_Change(2, &tyProtol130.Packet.Buf[2]);
		JX_BL_Change(2, &tyProtol130.Packet.Buf[4]);
		nSendLen = 12 + 16;
	}
#ifdef PIEZOMETER
	else if((ucLogonMode == UP_UPLOAD_PRESSURE) && (bNeedReport)) //ѹ���������ϱ�
	{
		tyProtol130.Packet.Control = 0x88;
		tyProtol130.Packet.Afn = 0x8E;
		tyProtol130.Packet.Buf[0] = m_nGmTn_1;		//�ɼ���TN 
		tyProtol130.Packet.Buf[1] = m_nGmTn_2;		//��TN��
		tyProtol130.Packet.Buf[7] = FreezeUnitTransform(tyReport.wGatherCycle);		//5 ����
		tyProtol130.Packet.Buf[8] = RepPizeometerMakeFrame(&tyProtol130.Packet.Buf[2], &nSendLen);
		tyProtol130.Packet.Buf[9] = 0x04;
		tyProtol130.Packet.Buf[10]= 0x83;
		nSendLen += (12+6);
	}
#endif
	else		//���ϱ�,��¼,����,ע��
	{
		tyProtol130.Packet.Buf[0] = JX_ByteToBcd(g_nSignal);			//�źŴ�С,�̶�ֵ
		nSendLen =  13;		//�̶����ݳ���
	}
	
	tyProtol130.Packet.Data[0] = temp.Bytes.B0;		//LSB
	tyProtol130.Packet.Data[1] = temp.Bytes.B1;
	tyProtol130.Packet.Data[2] = temp.Bytes.B2;
	tyProtol130.Packet.Data[3] = temp.Bytes.B3;	
	Protol130Send(nSendLen, COM_1);			//ֻ��1������
	
	/* �ȴ����ݷ������ */
	WatitDataSendOk();
	return TRUE;
}
#ifdef YOUFANG_GPRS
/*
����:		�������
����:		pnRxBuf,pnLen
���:		ucAtCmdReveive
*/
u8* DecodeCmd(u8* pnRxBuf, u8* pnLen)
{	
	u8 *Point = NULL, nRxLen = 0, nDatOffset = 0;
	
	Point = (u8*)strstr((char const*)pnRxBuf, (char const*)aucAtrTcprecv);
	
	if(NULL == Point)
	{
		if(sizeof(aucAtrTcprecv) <= CheckRevDataLen())
		{
			ClearRxBuff();
		}
		return NULL;
	}

	/*���յ� TCP ���� ++TCPRECV:0,68,	
	��������������	68 51 00 51 00 68 88 03 13 01 00 00 8c 6a 00 00 01 07 01 00 01 00 00 80 04 00 03 23 16
	68 5d 00 5d 00 68 70 ff ff ff ff 01 8c 72 00 00 01 07 00 04 00 01 00 02 00 03 00 04 00 81 16
		*/
	Point += sizeof(aucAtrTcprecv) - 1; 	//ָ��ָ�����ݴ�
	nDatOffset = M590_ClaRxLength(Point+2, &nRxLen);
	if(0 < nRxLen)
	{
		Point +=(2+nDatOffset);
	}

	if((nRxLen+nDatOffset+11) > CheckRevDataLen())
	{
		return NULL;
	}
	
	*pnLen = nRxLen;
	return Point;
}
#endif
/**********************************************/
/* ��ַ�ж�
������: AddressComparePro
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.03.03
*//*********************************************/
u8 AddressComparePro(u8 *pnAddr)
{		
	u8 nAddBuf[5] = {0};
	u8 nLoop = 0;
	
	if((0xFF == pnAddr[0]) && (0xFF == pnAddr[1]) 
		&& (0xFF == pnAddr[2]) && (0xFF == pnAddr[3]))
	{
		return TRUE;
	}

	MemcpyFunc((u8*)nAddBuf, (u8*)&g_dwTmAddress, 4);

	/* ��ַƥ�� */
	for(nLoop = 0; nLoop < 4; nLoop++)
	{
		if(nAddBuf[nLoop] != pnAddr[nLoop])
		{
			break;
		}
	}

	if(4 > nLoop)
	{
		return FALSE;
	}

	return TRUE;	
}


/*
����:		��ASCII�������
����:		pnRxBuf,nRxLen
���:		�Զ�ִ�и�������
*/
u8 DecodeParameter(u8* pnRxBuf, u8 nRxLen)
{
	u8 *Point = NULL;
	u16 wDataLen = 0, wLen = 0;	
	TypeProtol130Head tyProtol130Head;
	u8 nSendLen = 0;
	if(NULL == pnRxBuf)
	{
		return nSendLen;
	}
    Point = pnRxBuf;

	/* �Ұ�ͷ */
	while((MSG_START != *Point)||(MSG_START != *(Point+5)))
	{
		Point++;
		wLen++;
		if(nRxLen <= wLen)
		{
		    if(NUMBER_UART_RX <= nRxLen)
		    {
			    goto __UC_130Pro_Exit;
		    }
			return nSendLen;
		}
	}
	
	if(NUMBER_UART_RX <= nRxLen)
	{
		goto __UC_130Pro_Exit;
	}
	
	MemcpyFunc((u8 *)&tyProtol130Head, Point, sizeof(tyProtol130Head));		//�����ַ�����������
        
	//������ͬ?
	if ( (tyProtol130Head.Length0[0] != tyProtol130Head.Length1[0]) 
	||(tyProtol130Head.Length0[1] != tyProtol130Head.Length1[1]))
	{
		goto __UC_130Pro_Exit;
	}

	/* ֡���ݳ��� */
	JX_BL_Change(2,tyProtol130Head.Length0); //STVDĬ��Ϊ������ݸ�ʽ Ӧ��ȥ��ע��
	MemcpyFunc((u8*)&wDataLen, tyProtol130Head.Length0, 2);
	wDataLen = (wDataLen>>2);

	/* ֡���ݳ��� */
	if((wDataLen+8+wLen) > nRxLen) //wLenΪ�Ƿ�����ƫ����
	{
		return nSendLen;
	}
	
	/* ֡βУ�� */
	if(MSG_END != *(Point+wDataLen+sizeof(tyProtol130Head)+1))
	{
		goto __UC_130Pro_Exit;
	}

	/* CSУ�� */
	if(*(Point+wDataLen+sizeof(tyProtol130Head)) != JX_AddSum8Bit(Point+sizeof(tyProtol130Head), wDataLen))
	{
		goto __UC_130Pro_Exit;
	}
	
	Point += sizeof(tyProtol130Head);
	MemcpyFunc( (u8 *)&tyProtol130, Point, wDataLen);		//�����ַ�����������

	/* ��ַУ�� */
	if(FALSE == AddressComparePro(tyProtol130.Packet.Address))
	{
		goto __UC_130Pro_Exit;
	}
	
	nSendLen = Protol130Handle();
	ClearRxBuffUnUsedLen(wDataLen+8+wLen);
	return nSendLen;
	
__UC_130Pro_Exit:

	/* add by maronglang clear RxBuf */
	ClearRxBuff();
	return nSendLen;
}

/**********************************************/
/* 130Э����ս���
������: JASON_130ProtolProc
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.12
*//*********************************************/
void JASON_130ProtolProc(void)
{
	u8* pnRxAdd = GetUartRxBuf();
	u8  nRxLen  = 0, nSendLen = 0;

#ifdef YOUFANG_GPRS
	pnRxAdd = DecodeCmd(pnRxAdd, &nRxLen);
	nSendLen = DecodeParameter(pnRxAdd, nRxLen);
#else
	nSendLen = DecodeParameter(pnRxAdd, CheckRevDataLen());
#endif

	/* ���ݷ��� */
	if(0 < nSendLen)
	{
		Protol130Send(nSendLen, COM_1);
	}
	UC_SleepFunc(50);
}
/**********************************************/
/* ���߿��Ƶ�¼��ʱ��������ʱ
������: JASON_130OnlineCtl
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.12
*//*********************************************/
void JASON_130OnlineCtl(void)
{
	static u32 dwTime = 0, dwHeart = 0;
	static u8  nFirFlg= TRUE, nLoginCnt = 0;

	if(nFirFlg)
	{
		nFirFlg = FALSE;
		dwTime  = GetSysTemTick();
		Online(ucLogonMode);
		bNeedReport = TRUE;
	}

	/* ÿ�μ��15���¼һ����ʧ�� */
	if((UP_LOGIN == ucLogonMode) && 
		(RE_LOGIN_TO < GetSysTemTick() - dwTime))
	{
		dwTime  = GetSysTemTick();
		if(3 > nLoginCnt++)
		{
			Online(ucLogonMode);
		}
		else
		{
			stRepFail.wError |= (1<<REP_LOGIN_FAIL);
			bNeedReport = FALSE;
			m_nRepFailFlg = TRUE;
		}
	}
		
	/* ÿ�μ��60������һ����ʧ�� */
	if((UP_HEARTBEAT == ucLogonMode) && 
		((0 == dwHeart)||(RE_HEART_TO < GetSysTemTick() - dwHeart)))
	{
		dwHeart	= GetSysTemTick();
		Online(ucLogonMode);
	}
	
	/* �����ϱ����� */
	if(((UP_UPLOAD <= ucLogonMode)&&(UP_FREE > ucLogonMode))&&(bNeedReport))
	{
		if(TRUE == Online(ucLogonMode))
		{
			ucLogonMode = UP_FREE;
			g_dwRepTick = GetSysTemTick();
			
			/* �ϱ������ۼ� */
			g_nDatRepCnt++;
		}
	}
}

/**********************************************/
/* ��ʱ��������
������: JASON_130TimeOutReUpLoad
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.03.26
*//*********************************************/
void JASON_130TimeOutReUpLoad(void)
{
	if (UP_FREE > ucLogonMode)
	{
		JASON_130OnlineCtl();
		UC_SleepFunc(200);
	}
	
	/* ��ʱ���ƽ�ֹ��δ��ʱ��ֱ�ӷ��� */
	if((FALSE == m_nRepEnableFlg)||(REPDAT_TIMEOUT >= GetSysTemTick() - g_dwRepTick))
	{
		return ;
	}
	
	if((UP_FREE == ucLogonMode)&&(REPORT_CNT_TO > g_nDatRepCnt))
	{
		if((UP_UPLOAD <= ucLogonMode)&&(UP_FREE > ucLogonMode))
		{
			ucLogonMode = nLogonModeBk;
		}
	}
	
	if(REPORT_CNT_TO <= g_nDatRepCnt)
	{
		SetLogonMode(UP_HEARTBEAT);
		stRepFail.wError |= (1<<REP_RESPOND_FAIL);
		m_nRepFailFlg = TRUE;
	}	
	return ;
}

/**********************************************/
/* 130Э��ģ���ʼ������
������: JASON_130InitializeGsm
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.12
*//*********************************************/
void JASON_130InitializeGsm(void)
{
	char nIPstr[32] = {0};
	u8 nPort[6]     = {0};
	u16 dwPortNum = 0;
	ST_Time stReportTime;
	u8 nBuf[10]     = {0};
	
	MemsetFunc(nPort, 0, sizeof(nPort));
	MemsetFunc(nIPstr, 0, sizeof(nIPstr));	
	SetLogonMode(UP_LOGIN);
	
	/* ��ȡ�ϱ�IP��ַ���� */
	if(TRUE == ReadParameterForType((u8 *)&tyReportParameter, sizeof(tyReportParameter), IPANDPORT_PARA))
	{
		JX_IpAddrToStr(nIPstr, (u8*)&tyReportParameter.Main_IP);
		MemcpyFunc((u8*)&dwPortNum, (u8*)&tyReportParameter.Main_Port, 2);
		JX_BL_Change(2, (u8*)&dwPortNum);
		JX_U32ToStr(dwPortNum, nPort);
		MemsetFunc(&aucAtPServer1[1], 0, sizeof(aucAtPServer1)-1);
		MemsetFunc(&aucAtPPort1[1], 0, sizeof(aucAtPPort1)-1);
		
		MemcpyFunc((u8*)&aucAtPServer1[1], nIPstr, JX_Strlen(nIPstr));
		JX_StringCat(aucAtPServer1,"\"", 2);
		MemcpyFunc((u8*)&aucAtPPort1[1], nPort, JX_Strlen(nPort));
		JX_StringCat(aucAtPPort1,"\"", 2);
	}

	/* ��ȡAPN */
	if(TRUE == ReadParameterForType(&g_nApnBuf[1], APN_LEN, APN_PARA))
	{
		JX_StringCat(g_nApnBuf, "\"", 2);
	}

	/* ��ȡ�ϱ������ϱ�ʱ�䳭���� */
	if(FALSE == ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA))
	{
#ifdef PIEZOMETER
		tyReport.cycle = 0x06;   // 7
		tyReport.enable = 1;		
		tyReport.wGatherCycle = 15; // 10080
#else
		tyReport.cycle = 0x06;	 // 7
		tyReport.enable = 1;		
		tyReport.wGatherCycle = 60; // 10080
#endif
		tyReport.Time.Byte.Year = 0x15;
		tyReport.Time.Byte.Month = 0x12;
		tyReport.Time.Byte.Day = 0x28;
		tyReport.Time.Byte.Hour = 0x00;
		tyReport.Time.Byte.Minute= 0x00;
		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);		
		UC_SleepFunc(1);
	}
	if((0 == tyReport.nMonFreezeDay)||(28 < tyReport.nMonFreezeDay))
	{
		tyReport.nMonFreezeDay   = 20;
	}

	/* ��ȡ�ϴ��ϱ�ʱ�估�ۼ��ϱ����� */
	if(FALSE == ReadParameterForType(nBuf, 10, LT_REP_TIME))
	{
		g_wTmReportCnt = 0;
		MemcpyFunc((u8*)&stReportTime, (u8*)&tyReport.Time, sizeof(tyReport.Time));
		JX_BL_Change(6, (u8*)&stReportTime);
		stReportTime.nMonth = stReportTime.nMonth&0x1F;
		TM_TimeChangeAToB(&stReportTime,&stLastReportT);
		MemcpyFunc(nBuf, (u8*)&stLastReportT, 8);
		MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
		SaveParameterForType(nBuf, 10, LT_REP_TIME);
		UC_SleepFunc(1);
 	}
	else
	{
		MemcpyFunc((u8 *)&stLastReportT, nBuf, 8);
		MemcpyFunc((u8 *)&g_wTmReportCnt, &nBuf[8], 2);
	}

	return ;
}
#endif

//����Ϊ��������
#if 1
/**********************************************/
/* LED����˸����
������: GetLedFlg
��  ��: void
��  ��: void
����ֵ: u16
�޸���: maronglang
��  ��: 2016.06.03
*//*********************************************/
u8 GetLedFlg(void)
{
	return m_nLedFlashFlg;
}
/**********************************************/
/*��ȡGPRSģ������״̬
������: GetGprsConntStat
��  ��: void
��  ��: void
����ֵ: u16
�޸���: maronglang
��  ��: 2016.06.03
*//*********************************************/
u8 GetGprsConntStat(void)
{
	return ucStatusGsm;
}

/**********************************************/
/* ��ȡ����״̬
������: GetOnLineStatus
��  ��: void
��  ��: void
����ֵ: u16
�޸���: maronglang
��  ��: 2016.06.03
*//*********************************************/
u8 GetOnLineStatus(void)
{
	return ucLogonMode;
}

/**********************************************/
/* ��ȡ�ն��ۼ��ϱ�����
������: GetTermReportTime
��  ��: void
��  ��: void
����ֵ: u16
�޸���: maronglang
��  ��: 2016.04.02
*//*********************************************/
u16 GetTermReportTime(void)
{
	return g_wTmReportCnt;
}

/**********************************************/
/* �ϱ���ʱ����
������: ReportTimeOutPro
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.03.04
*//*********************************************/
void ReportTimeOutPro(void)
{
	static u32 dwDelayCnt = 0;
	u32 dwTemp = 0;

	if(FALSE != bNeedReport)
	{
		return ;
	}

	/* �ϱ�����ʱִ�в����Ȳ��� */
	dwTemp = GetSysTemTick();
	if(REPROT_DELAY < dwTemp-dwDelayCnt)
	{
		if(0 == dwDelayCnt)
		{
			dwDelayCnt = GetSysTemTick();
			return ;
		}
	}
	else
	{
		return ;
	}
	
	LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
	M590_CloseConnect();
#ifdef TEST_VISON
	UpLinkSaveReportTime();
	m_nWakeupReportFlg &=(~(KEY_WUAKEUP_FLG));
	SaveReportFlag(m_nWakeupReportFlg); 
#else
	if(KEY_WUAKEUP_FLG != (m_nWakeupReportFlg&KEY_WUAKEUP_FLG))
	{
		if(m_nDataRepSucFlg)
		{
			ReWriteRepFlg();
		}
		UpLinkSaveReportTime();
	}
	else
	{
		m_nWakeupReportFlg &=(~(KEY_WUAKEUP_FLG));
		SaveReportFlag(m_nWakeupReportFlg); 
	}
#endif
	UC_SleepFunc(1000);
	g_nReportFlg  = FALSE;
	return ;
}



/**********************************************/
/* �����ϱ�����
������: SetReportIndex
��	��: nDat
��	��: void
����ֵ: void
�޸���: maronglang
��	��: 2016.05.03
*//*********************************************/
void SetReportIndex(u8 nDat)
{
	m_nRepIndex = nDat;
}

/**********************************************/
/* ������ģ������ϱ���־ 0-���ϱ� 1-�ϱ�
������: GetReportFlag
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.02.24
*//*********************************************/
u8 GetReportFlag(void)
{
	return g_nReportFlg;
}

/**********************************************/
/* ��ȡ�ϱ�ʧ�ܴ����ۼƱ�־
������: GetReportFailFlag
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2016.05.03
*//*********************************************/
u8 GetReportFailFlag(void)
{
	return m_nWakeupReportFlg;
}

/**********************************************/
/* gprs���лص�����
������: fixTaskGsmProc
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.12
*//*********************************************/
void fixTaskGsmProc(void)
{
	s8 nResult = 0;	
	static u8 nFailCnt = 0;
	//static u32 dwCnt = 0;

	m_nLedFlashFlg = TRUE;

	/* ��ʱ����2.5������ֹͣ�ϱ��ȴ���һ���ϱ� */
	//if(REPROT_TIMEOUT+g_dwCommDelay < GetSysTemTick() - dwCnt)
	if(REPROT_TIMEOUT+g_dwCommDelay < GetSysTemTick())
	{
		bNeedReport = FALSE;
		M590_CloseConnect();
		return ;
	}

	switch (ucStatusGsm)			//��������
	{
	default:
		if(FALSE != M590_Init())
		{
			ucStatusGsm = GSM_SHAKEHAND;
		}
		break;

	case GSM_SHAKEHAND:		
		if(TRUE == (nResult = M590_HandShake()))
		{
			ucStatusGsm = GSM_DAIL;
		}
		break;
		
	case GSM_DAIL:
		if(TRUE == M590_ConnectServer(m_nIpAddBk))
		{
			ucStatusGsm = GSM_SEND;
		}
		else
		{
			nFailCnt++;
			if(TO_MAXCNT < nFailCnt)
			{
				nFailCnt = 0;
				
				/* ���ñ�����վ��ַ */
				if(FALSE == m_nIpAddBk)
				{
					m_nIpAddBk = TRUE;
					break;
				}				
				M590_CloseConnect();
				ucStatusGsm = GSM_SHAKEHAND;
			}
		}
		break;
		
	case GSM_SEND:		//��������.3
#ifdef  JASON130_PTR   //130Э��
		JASON_130TimeOutReUpLoad();
		JASON_130ProtolProc();
#elif defined(XINJIANG_PTR)   //�½�Э��
		XJ_TimeOutReUpLoad();
		XJ_ProtolProc();
#elif defined(HEDA_PTR)   //�ʹ�Э��	
		HD_TimeOutReUpLoad();
		HD_ProtolProc();
#endif
		break;
	}
	return ;
}

/**********************************************/
/* gprs���лص�����
������: fixTaskGsm
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.12
*//*********************************************/
void fixTaskGsm(void)
{
	s32 dwReport = 0, dwOffset = 0;	
	ST_Time stReportTime;
	TM_Time stTimeNowTm, stNextTime;

	STM8_RTC_Get(&stReportTime);
	TM_TimeChangeAToB(&stReportTime,&stTimeNowTm);

	/* �״ο������Żɹܴ����������ϱ����� */
	if((FALSE != (m_nWakeupReportFlg&REPORT_FLG))
		||FALSE == TM_IsValidTimePro(&stLastReportT)
		||(2015 >= stTimeNowTm.wYear)||(TRUE == g_OptValveRepFlg)
#ifdef PURCHASE_MODE
		|| (OWED_STAT_FLG == (tyParameter.nOverBuyFlg&(OWED_REP_SUCC|OWED_REP_FAIL|OWED_STAT_FLG)))
#endif
		||((ALARM_MASK&ALM_GetBatStatus()&&(MAX_REP_TIMES > g_nAlmRepFailCnt)&&(ALARM_REP_FLG != (ALARM_REP_FLG&g_nGuardEnFlg)))))
	{
		g_nReportFlg  = TRUE;
	    m_nUploadMode = OTHER_REP;
		fixTaskGsmProc();
	}
	else
	{
#ifdef JASON130_PTR
		if(FALSE == g_nReportFlg)
		{
			dwReport = ClaReportTimeToSec(tyReport.cycle);
			dwOffset = TM_DiffSecond(&stLastReportT, &stTimeNowTm);
			
			if((60 < (dwOffset%dwReport)) ||
				((TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))&&(FALSE == tyRecord.nRepFlg)))
			{
				LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
				
				/* ����ǰ���ͼ� �����ϵ�ʱ��ͬ����ر����� */
				M590_CloseConnect();
				return ;
			}
			else
			{
				m_nUploadMode = TIME_DAT_REP;
				g_nReportFlg  = TRUE;
			}
		}
		if(TRUE == g_nReportFlg)
		{
			fixTaskGsmProc();
		}
#elif defined(XINJIANG_PTR) 	 
		LP_XJ_CalReportTime(&stNextTime);
		dwOffset = TM_DiffSecond(&stTimeNowTm, &stNextTime);
		
		/* ��һ�ΰ����ϱ�ʱ���ϱ��������60S��120��ʱ �ر�ע����С�������ڱ���Ϊ5���ӷ������ַ����ϱ����� */
		//if(((0 >= dwOffset)&&(-60 <= dwOffset))||((0 < dwOffset)&&(180 >= dwOffset)))
		if(XJ_ONLINE_TO >= dwOffset)
		{
			m_nUploadMode = TIME_DAT_REP;
			fixTaskGsmProc();
		}
		else
		{
			LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
			
			/* ����ǰ���ͼ� �����ϵ�ʱ��ͬ����ر����� */
			M590_CloseConnect();
			return ;
		}
#elif defined(HEDA_PTR)
		LP_HD_CalReportConut(&stNextTime);
		dwOffset = TM_DiffSecond(&stTimeNowTm, &stNextTime);
		
		/* ��һ�ΰ����ϱ�ʱ���ϱ��������60S��120��ʱ �ر�ע����С�������ڱ���Ϊ5���ӷ������ַ����ϱ����� */
		//if(((0 >= dwOffset)&&(-60 <= dwOffset))||((0 < dwOffset)&&(180 >= dwOffset)))
		if(HD_ClaReportTimeToSec() >= dwOffset)
		{
			m_nUploadMode = TIME_DAT_REP;
			fixTaskGsmProc();
		}
		else
		{
			LP_SetLowPwrStartFlg(LP_GPRS_FLG_OK);
			
			/* ����ǰ���ͼ� �����ϵ�ʱ��ͬ����ر����� */
			M590_CloseConnect();
			return ;
		}
#endif
	}
	
	/* ��ʱ���� */
	ReportTimeOutPro();
	return ;
}

/**********************************************/
/* GPRSģ���ʼ������
������: InitializeGsm
��  ��: void
��  ��: void
����ֵ: u8
�޸���: maronglang
��  ��: 2015.09.12
*//*********************************************/
void InitializeGsm(void)
{	
	tyGSMFlag = 0xFF;
	ucStatusGsm    = GSM_INIT;
	ucStepGsm      = 0;
	m_nGprsStep    = INIT_PWR_ON;
	stRepFail.wError = 0;
	
	m_nWakeupReportFlg = ReadReportFlag();
	ReadGroup(1, ADDRESS_GUARD_EN, &g_nGuardEnFlg);
	g_nAlmRepFailCnt = (g_nGuardEnFlg>>6);

#ifdef JASON130_PTR
	JASON_130InitializeGsm();
#elif defined(XINJIANG_PTR)
	XJ_InitializeGsm();
#elif defined(HEDA_PTR)
	HD_InitializeGsm();
#endif

	/* ��ȡ��ʱ���ز��� */
	if(FALSE == ReadParameterForType((u8 *)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA))
	{
		stOptValve.nOptFlg    = CTL_VAVLE_ENABLE;
		stOptValve.nEnableFlg = CTL_VAVLE_ENABLE;
		stOptValve.nStartHour = 0x02;
		stOptValve.nEndHour   = 0x04;
		stOptValve.nVavleStat = 0;
		stOptValve.nVavleCycle= 0;
	}

	if((MAX_REP_TIMES > stOptValve.nRepFailCnt)&&(CTL_VALVE_OVER == stOptValve.nOptFlg))
	{
		g_OptValveRepFlg = TRUE;
	}
	else if(MAX_REP_TIMES <= stOptValve.nRepFailCnt)
	{
		stOptValve.nOptFlg = 0;   /* �����ϱ���������Ϊ�ϱ��ɹ������ϱ� */ 
		stOptValve.nRepFailCnt = 0;
	}
	return ;
}

#endif
/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
