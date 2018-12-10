/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : GsmGlobal.h
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ͨ��ģ��ӿں���
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef __GSMGLOBAL_H__
#define __GSMGLOBAL_H__
#include "global.h"

//����Ϊ�궨��
#define GSM_INIT			1		//��ʼ��
#define GSM_SHAKEHAND	    2		//GPRS����
#define GSM_DAIL    	    3		//��������
#define GSM_SEND			4		//��������
#define GSM_CLOSE			5		//�ػ�

#define IPANDPORT_PARA       1
#define APN_PARA             2
#define REPORT_PARA          3
#define METER_PARA           4
#define LT_REP_TIME          5
#define OPT_VALVE_PRAA       6
#define TM_ADDRESS_PRAA      7


/* ����ϱ����� */
#define MAX_REP_TIMES         3

/* ��վ���� */
#define MASTER_OLD                0
#define MASTER_NEW                1

/* ����վ����״̬ */
#define OLD_VAVLE_CLOSE          0x08
#define OLD_VAVLE_ERROR          0xFF


#define TIME_DAT_REP              1 //��ʱ�ϱ�����
#define OTHER_REP                 0 //�Ƕ�ʱ�ϱ����ݰ�����ʱ���أ�Ƿ�� ���� �澯

/* �˴�Ϊ����λ�� 0x0000 Ϊ�ϱ���ʱ*/
#define REP_NO_GPRS_MODE     0    //��ģ��         0x0001
#define REP_REG_FAIL         1    //ע��ʧ��       0x0002
#define REP_CONNECT_FAIL     2    //TCP����ʧ��    0x0004
#define REP_LOGIN_FAIL       3    //��¼ʧ��       0x0008
#define REP_RESPOND_FAIL     4    //�ϱ���Ӧ��     0x0010
#define GM_GATHERMETER_FAIL  5    //����ʧ��       0x0020
#define BT_POWERLOW          6    //��ص�ѹ��     0x0040
#define RTC_TIMEERROR        7    //RTCʱ���쳣    0x0080
#define DATSEND_ERROR        8    //�����շ�ʧ��   0x0100
#define ATCMD_ERROR          9    //AT������Ӧʧ�� 0x0200
#define GSM_TIMEOUT          10    //GRPS���糬ʱ  0x0400
#define GM_PIEZOMETER_FAIL  11    //GRPS���糬ʱ  0x0800


/* �ϱ�ʧ�ܱ�־λ */
#define KEY_WUAKEUP_FLG         0x01
#define FIRST_REP_FAIL          0x02
#define SECOND_REP_FAIL         0x04
#define THIRD_REP_FAIL          0x08


#define REPORT_NORMAL           0x00  //�����ϱ�
#define REPORT_FAIL_FLG         0x0E  //�ϱ�ʧ�ܲ�������
#define REPORT_FLG               0x0F  //�ϱ���־λ����

#define REPORT_RANDOM_MIN       50       /* �ϱ�����Ϊ0- 50��֮�� */

#define CONFIRM_MARK         0x00000100  /* ȷ��֡���ݱ�ʶ */
#define DENY_MARK            0x00000200  /* ����֡���ݱ�ʶ */

#ifdef XINJIANG_PTR
	#define APN_LEN              1          /* APN���� */
#elif defined(JASON130_PTR)
	#define APN_LEN              16          /* APN���� */
#elif defined(HEDA_PTR)
	#define APN_LEN              20          /* APN���� */
#endif


#define REPROT_TIMEOUT       120000      /* ��ʱ 180s */
#define REPROT_DELAY         0        /* ��ʱ 5s 5000 */
#define REPROT_DELAYTO       70000       /* ��ʱ 90s */

#define REPDAT_TIMEOUT       15000       /* �ϱ���ʱ15S */
#define REPORT_CNT_TO        3           /* �ϱ����޴��� */

#define MAX_REPORT_NUM       28          /* ������������ϱ� 28����¼ 143�ֽ� */
#define MAX_ALM_NUM          3           /* 3���澯��־ */

//����Ϊ����

//����Ϊ������
#define FixTaskModule3	fixTaskGsm
#define FixTimerModule3	fixTimerGsm
#define InitializeModule3	InitializeGsm

extern TypeReport tyReport;			//�ϱ�����
extern u8 g_nApnBuf[20];
extern ST_Time stTimeNow;
extern TM_Time stLastReportT;
extern TypeValveOpt stOptValve;

extern u32 g_dwRepTick;           //�ϱ���ʱ
extern u8  m_nRepEnableFlg;        //�ϱ���ʱʹ�ܱ�ʶ
extern u8 g_nDatRepCnt;           // �����ϱ������ۼ�
extern vu8 ucLogonMode;		//��¼״̬
extern u8 tyGSMFlag;
extern u8  nLogonModeBk;
extern u8  m_nRepFailFlg;
extern u8 g_nApnType;
extern volatile TypeReportParameter tyReportParameter;		//ʱ��ṹ��
extern uc8 m_nVerBuf[16];
extern u8 m_nImsiBuf[24];
extern u8 m_nImsiBufXJ[8];
extern vu8 ucStatusGsm;		//״̬
extern ST_Time stTimeNow;
extern u32 g_dwCommDelay;
extern u8 aucAtPServer1[20];
extern u8 aucAtPPort1[8];
extern u16 g_wTmReportCnt;
extern u8 g_nSignal;
extern u8 g_OptValveRepFlg;
extern u32 g_dwTmAddress;
extern u8  m_nUploadMode;//


u8 GetReportFlag(void);
void fixTaskGsm(void);
void fixTimerGsm(void);
void InitializeGsm(void);

//����Ϊ�ӿں���
void StartSendGprs(void);		//��ʼ�ϱ�����
u8 GetGprStatus(void);		//���GPRS��ǰ״̬
u8 DecodeParameter(u8* pnRxBuf, u8 nRxLen);
u8 Protol130Handle(void);
s8 Protol130Send(u8 Size, u8 nComChannel);
u8 UC_SleepFunc(uint32_t dwWaitmS);
u16 GetTermReportTime(void);
void ReWriteRepFlg(void);
u8 GetReportFailFlag(void);
void SetReportIndex(u8 nDat);
s32 ClaReportTimeToSec(u8 nCycle);
u8 WatitDataSendOk(void);
void SetLogonMode(u8 nMode);
s8 M590_TcpSendDatLen(u8 nLen);
u8 M590_CloseConnect(void);
void FrameSendFunc(u8 Size, u8 nComChannel, u8* pnPoint);
u8 GetLedFlg(void);
u8 GetOnLineStatus(void);
u8 GetGprsConntStat(void);
void GetIsmiCcidDat(void);
u8 RepPizeometerMakeFrame(u8* pnOutBuf, u8* pnLen);


u8  JX_Strlen(char* pbSrc);
void  JX_StringCat(char* pbSrc,char * pnStr, u8 nLen);


//����Ϊλ����

#endif
/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
