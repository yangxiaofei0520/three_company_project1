/*
��Ŀ:		IP��
��д:		��̶�		SunJiD@china-e-eye.com
ģ������:	��������MCU,PCͨѶ
MCU:	msp430g2403
�ļ���:	protocol.global.h
��ʼʱ��:	2015-6-24 17:32:45
*/
#ifndef __PROTOCOLGLOBAL_H__
#define __PROTOCOLGLOBAL_H__
#include "global.h"

//����Ϊ�궨��
#ifdef XJ_JASON_VISON
#define PTROTO_JASON       // �½� 
#else
#define PTROTO_CJ_188
#endif

//����Ϊ����
//�ڲ�Э������궨��
#define JASON_AUTO_TEST		'T'		//0x54	�Զ�
#define JASON_CLOSE_VALVE		'G'		//0x47	�ط�
#define JASON_FACTORY_SET		'X'		//0x58	��������
#define JASON_OPEN_VALVE		'K'		//0x4B	����
#define JASON_READ_METER		'R'		//0x52	����
#define JASON_SET_ADDR		'I'		//0x49	���ñ��ַ
#define JASON_SET_PASSWORD	'S'		//0x53	���ñ�����
#define JASON_SET_READER		'D'		//0x44	���ö���
#define JASON_VERSION			'Z'		//0x5A	�汾
#define JASON_VERSION_CB		0xcb



#define READDATA   1
#define WRITEDATA  4
#define WRITEADDR  2  //add by maronglang ����д��ַ
#define VALVEOPEN  3  //add by maronglang ���ڷ��ſ���
#define VALVECLOSE 5  //add by maronglang ���ڷ��ſ���
#define READADDR   6  //��ȡ�ն˵�ַ

#define JASON_READDAT_RE_LEN    18

/* MODBUS ѹ�������� */
#define SET_CMD       1
#define READ_CMD      0
#define SAVE_CMD      2

//����Ϊ������
#define FixTaskModule2	fixTaskProtocolDebug
#define InitializeModule2	InitializeProtocol


extern u8 g_nValveStat;

void fixTaskProtocolDebug(void);
void InitializeProtocol(void);

//����Ϊ�ӿں���
void NeedSendMasterCmd(u8 Cmd);		//������������
void NeedSendSlaveCmd(u8 Cmd);		//���ʹӻ�����
u32 GetSysTemTick(void);

//�ڲ�Э�鳭��ӿ�
u8 JasonProtocolGM(void);
u8 JasonProtocolOptValve(u8 nOptCmd);
u8 CJ_T188ProtocolOptValve(u8 nOptCmd);
u8 CJ_T188ProtocolGM(void);

//�ⲿЭ�鳭��ӿ�
u8 GatherMeterFun(void);
u8 VavleOperateFun(u8 nOptCmd);
u8 CJ_T188ProtocolReadAdd(u8* pnOutAddr);
u8 GetVavleStat(void);
u32 MODBUS_GetPizeometer(u8 nCmd);
u8 SetMeterBoradAdd(u8 *pnBuf);
u32 DG_DebugPrintfFun(u8 *pnBuf, u8 nLen, u8 nIndex);
u8 GetBoardVavleStat(void);


//����Ϊλ����
#endif
/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
