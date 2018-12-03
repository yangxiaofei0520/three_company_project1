/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : DiverUart.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ���ݵĶ�д,��EEPROM/FLASH 2������,������ƽ���㷨(FLASH����)
������¼����	TypeTime+Value	ʱ��+����� 6+4 60*10
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/


#include "global.h"
#include "string.h"
#include "FileGlobal.h"

#ifdef ENABLE_FLASH
//����Ϊ�궨��

//����Ϊ����
#define RECORD_HEAD_0	0xaa		//��¼ͷ0
#define RECORD_HEAD_1	0xbb		//��¼ͷ1
#define SIZE_STORE		256		//�洢��FLASH��С,������㶨��,���ܳ���FLASH���еط�
#define SIZE_BLOCK		64		//FLASH ���С,MSP430�̶���

//�����ǽṹ��

//����Ϊ���ݱ�

//����Ϊ�ַ���

//����Ϊ����
u16 ucAddressRecord;		//��ǰ��¼��ַ
u16 ucSizeRecord;			//��¼��С
u8 aucRecordBuffer[SIZE_RECORD];		//��¼����
#else				//EEPROM

//����Ϊ���ݱ�

//����Ϊ�ַ���

//����Ϊ����
u8 g_nRecAlmIndex;			        //�澯��¼ָ��
TypeReportErr stRepFail;            //�ϱ�ʧ�ܴ������¼

u8 ucRecordIndex;			//��ǰ��¼ָ��
TypeRecord tyRecord;		//
TypeParameter tyParameter;

u8 g_nDayRecIndex;			//�ն����¼ָ��
u8 g_nMonRecIndex;			//�¶����¼ָ��
#endif

/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
