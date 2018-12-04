/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : DiverUart.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ���ݵĶ�д,��EEPROM/FLASH 2������,������ƽ���㷨(FLASH����)
������¼����	TypeTime+Value	ʱ��+����� 6+4  �ܿռ�:4+10*3+4+28*(11+1)+4+31*8+4+24*7+(17*2+21+12*2+9)*2+4= 978�ֽ�
�½�Э�� �ܿռ�:4+10*1+4+42*(10+1)+4+31*8+4+18*7+(21+17+11+7+2+9)*2+4+8= 1008�ֽ�
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef __FILEGLOBAL_H__
#define __FILEGLOBAL_H__
#include "GsmGlobal.h"


//�����ǽṹ��
typedef struct
{
	SP_Time stTime;     //�ϱ�ʧ��ʱ��
	u16 wError;		    //������
	u8  nSigal;			//�ź�ǿ��
}TypeReportErr;

//����Ϊ�궨��
#define InitializeModule4	InitializeFile

//����Ϊ�궨��
#ifdef XINJIANG_PTR
	#define ADDRESS_PARAMETER_LEN  20           //�ն˲��� sizeof(TypeParameter) 16
	#define ADDRESS_IPPARA_LEN     6          //IP���� sizeof(TypeReportParameter)
	#define ADDRESS_APN_LEN         1           //APN
	#define REPOERCYCLE_LEN        16           //16 �ϱ����� sizeof(TypeReport)
	#define LASTREPORTTIME_LEN     10           //�ϴ��ϱ�ʱ�� sizeof(TM_Time) + u16�ۼ��ϱ�����
	#define OPTVALVE_LEN            10           //��ʱ�������� sizeof(TypeValve
#else ifdef JASON130_PTR
	#define TMADDRESS_LEN           4           //TM��ַ����
	#ifdef PIEZOMETER
		#define ADDRESS_PARAMETER_LEN  26           //�ն˲��� sizeof(TypeParameter)
	#else
		#define ADDRESS_PARAMETER_LEN  16           //�ն˲��� sizeof(TypeParameter)
	#endif
	#define ADDRESS_IPPARA_LEN     16           //IP���� sizeof(TypeReportParameter)
	#define ADDRESS_APN_LEN        16           //APN
	#define REPOERCYCLE_LEN        11           //16 �ϱ����� sizeof(TypeReport)
	#define LASTREPORTTIME_LEN     10           //�ϴ��ϱ�ʱ�� sizeof(TM_Time) + u16�ۼ��ϱ�����
	#define OPTVALVE_LEN            10           //��ʱ�������� sizeof(TypeValveOpt)
#else ifdef HEDA_PTR
	#define REPOERCYCLE_LEN        16           //16 �ϱ����� sizeof(TypeReport)

#endif

#define MAX_LEN                 ADDRESS_PARAMETER_LEN




#define SIZE_EEPROM	1024		                                                   //EEPROM����

#define ADDRESS_GUARD_EN          FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS+0     //���𰴼�ʹ�ܱ�־
#define ADDRESS_REPORTFLG          ADDRESS_GUARD_EN+1                            //��ʼ��ַ �����Ƿ��ϱ���־ �ϱ����ݱ�־ 4

#define ADDRESS_TMADDRESS		   ADDRESS_REPORTFLG+4                            //�ն˵�ַ
#define ADDRESS_PARAMETER		   ADDRESS_TMADDRESS+TMADDRESS_LEN+1              //��ʼ��ַ,�ն˲���
#define ADDRESS_IPPARA  		   ADDRESS_PARAMETER+ADDRESS_PARAMETER_LEN + 1    //IP������ʼ��ַ
#define ADDRESS_APN                ADDRESS_IPPARA + ADDRESS_IPPARA_LEN + 1	      //APN +1�ֽ�ΪCSУ��
#define ADDRESS_REPOERCYCLE        ADDRESS_APN+ADDRESS_APN_LEN + 1		          //�ϱ����ڼ�ʱ��
#define ADDRESS_REPORTTIME         ADDRESS_REPOERCYCLE+REPOERCYCLE_LEN + 1		  //�ϴ��ϱ�ʱ��
#define ADDRESS_OPTVALVE           ADDRESS_REPORTTIME+LASTREPORTTIME_LEN + 1	  //��ʱ����

#define ADDRESS_TMADDRESS_BK	   ADDRESS_OPTVALVE+OPTVALVE_LEN + 1              //�ն˵�ַ
#define ADDRESS_PARAMETER_BK	   ADDRESS_TMADDRESS_BK+TMADDRESS_LEN + 1              //���ַ����
#define ADDRESS_IPPARA_BK  		   ADDRESS_PARAMETER_BK+ADDRESS_PARAMETER_LEN + 1 //IP������ʼ��ַ
#define ADDRESS_APN_BK             ADDRESS_IPPARA_BK + ADDRESS_IPPARA_LEN + 1	  //APN
#define ADDRESS_REPOERCYCLE_BK     ADDRESS_APN_BK+ADDRESS_APN_LEN + 1		      //�ϱ����ڼ�ʱ��
#define ADDRESS_REPORTTIME_BK      ADDRESS_REPOERCYCLE_BK+REPOERCYCLE_LEN + 1	  //�ϴ��ϱ�ʱ��
#define ADDRESS_OPTVALVE_BK        ADDRESS_REPORTTIME_BK+LASTREPORTTIME_LEN + 1	  //��ʱ����

#define ADDRESS_INDEX_ALM		   ADDRESS_OPTVALVE_BK + OPTVALVE_LEN + 1         //�澯INDEX��ַ
#define ADDRESS_RECORD_ALM		   ADDRESS_INDEX_ALM+4		                          //�澯��¼��ַ
#ifdef XINJIANG_PTR
#define NUMBER_RECORD_ALM		     1		                                      //�澯¼����3
#else
#define NUMBER_RECORD_ALM		     3		                                      //�澯¼����3
#endif
#define RECORD_LEN_ALM             9                                             //�澯������¼����

#ifdef XINJIANG_PTR
/* ����������18�� */
#define ADDRESS_INDEX_MON			   ADDRESS_RECORD_ALM +(NUMBER_RECORD_ALM*(RECORD_LEN_ALM+1))//��ǰ��¼ָ���ַ,��4λ,����д
#define ADDRESS_RECORD_MON		   ADDRESS_INDEX_MON+4		                          //��¼��ַ
#define NUMBER_RECORD_MON		       18		                                      //��¼���� 18
#define RECORD_LEN_MON               6   

/* ��ϸ����40�� */
#define ADDRESS_INDEX			   ADDRESS_RECORD_MON +(NUMBER_RECORD_MON*(RECORD_LEN_MON+1))//��ǰ��¼ָ���ַ,��4λ,����д
#define ADDRESS_RECORD		       ADDRESS_INDEX+4		                          //��¼��ַ
#define NUMBER_RECORD		       42		                                      //��¼���� 40
#define RECORD_LEN                10                                             //������¼����

/* ����������31�� */
#define ADDRESS_INDEX_DAY			   ADDRESS_RECORD +(NUMBER_RECORD*(RECORD_LEN+1))//��ǰ��¼ָ���ַ,��4λ,����д
#define ADDRESS_RECORD_DAY		   ADDRESS_INDEX_DAY+4		                      //��¼��ַ
#define NUMBER_RECORD_DAY		       31		                                      //��¼���� 31
#define RECORD_LEN_DAY               7                                             //������¼����

#else
/* ��ϸ����28�� */
#ifdef PIEZOMETER
#define ADDRESS_INDEX			   ADDRESS_RECORD_ALM +(NUMBER_RECORD_ALM*(RECORD_LEN_ALM+1))//��ǰ��¼ָ���ַ,��4λ,����д
#define ADDRESS_RECORD		       ADDRESS_INDEX+4		                          //��¼��ַ
#define NUMBER_RECORD		       28		                                      //��¼���� 28
#define RECORD_LEN                16                                             //������¼����   
#else
/* ����������24�� */
#define ADDRESS_INDEX_MON			   ADDRESS_RECORD_ALM +(NUMBER_RECORD_ALM*(RECORD_LEN_ALM+1))//��ǰ��¼ָ���ַ,��4λ,����д
#define ADDRESS_RECORD_MON		   ADDRESS_INDEX_MON+4		                          //��¼��ַ
#define NUMBER_RECORD_MON		       24		                                      //��¼���� 24
#define RECORD_LEN_MON               6   

#define ADDRESS_INDEX			   ADDRESS_RECORD_MON +(NUMBER_RECORD_MON*(RECORD_LEN_MON+1))//��ǰ��¼ָ���ַ,��4λ,����д
#define ADDRESS_RECORD		       ADDRESS_INDEX+4		                          //��¼��ַ
#define NUMBER_RECORD		       28		                                      //��¼���� 28
#define RECORD_LEN                12                                             //������¼����   

/* ����������31�� */
#define ADDRESS_INDEX_DAY			   ADDRESS_RECORD +(NUMBER_RECORD*(RECORD_LEN+1))//��ǰ��¼ָ���ַ,��4λ,����д
#define ADDRESS_RECORD_DAY		   ADDRESS_INDEX_DAY+4		                      //��¼��ַ
#define NUMBER_RECORD_DAY		       31		                                      //��¼���� 31
#define RECORD_LEN_DAY               7 
#endif
#endif

//����Ϊ����

//����Ϊ������

//����Ϊ�ӿں���
void AddRecord(u8 *Record, u8 nLen);		//����1����¼,�������,�Զ�ɾ�����ϵļ�¼
void DelRecord(u8 Index);		//ɾ��ĳ1����¼,ʣ�¼�¼��ǰ�ƶ�
void InitializeFile(void);		//��ʼ������һ��
u8 ReadRecord(u8 nIndex, u8 *Record, u8 nOutLen);
u8 ReadParameterForType(u8* pnDat, u8 nLen, u8 nTpye);		//������
void SaveParameterForType(u8* pnDat, u8 nLen, u8 nTpye);        //�������
void SaveReportFlag(u8 nReportFlg);
u8 ReadReportFlag(void);
void ReadGroup(u8 Length, u16 Address, u8 *Data);		//��EEPROMָ����ַ��ȡN���ֽ�
void SaveByte(u16 Address, u8 Data);
u8 EditRecord(u8 nIndex, u8 *Record, u8 nInLen);

void AddAlmRecord(u8 *Record, u8 nLen);
u8 ReadAlmRecord(u8 nIndex, u8 *Record, u8 nOutLen);

void AddDayFreezeRecord(u8 *Record, u8 nLen);
u8 ReadDayFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen);
void AddMonFreezeRecord(u8 *Record, u8 nLen);
u8 ReadMonFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen);
u8 ReadDataMemory(u8 nIndex, u8 *Record, u8 nOutLen);


extern TypeRecord tyRecord;
extern TypeParameter tyParameter;
extern TypeReportErr stRepFail;


#endif
/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
