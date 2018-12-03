/*
��Ŀ:		IP��
��д:		��̶�		SunJiD@china-e-eye.com
ģ������:	��������MCU,PCͨѶ
MCU:	msp430g2403
�ļ���:	protocol.c
��ʼʱ��:	2015-6-24 17:32:45
*/
#ifndef __PROTOCOL_H__
#define __PROTOCOL_H__

#include "global.h"
#include <string.h>

//����Ϊ����
#define TIMER_4_METER	3000		//��������ʱ��@3ms*3000 9S����ʱ
#define MAX_JASON		18			//12 ���Э�鳤�� edit by maronglang 20150822
#define INIT_STATUS	0
#define INIT_ADDRESS	1
#define INIT_PASSWORD	0x66668888
#define ANSWER_PASSWORD	0x33333333

#define COLD_WATER_METER		0x10		//��ˮ��
#define HOT_WATER_METER		0x11		//��ˮ��
#define GAS_METER				0x30		//ȼ����
#define JASON_METER_WATER		0x73		//����
#define JASON_METER_WATER_01	0x72		//0.1������

//����
#define JASON_HEAD_OFFSET		8	//�������ݿ�ʼ
#define JASON_HEAD_0		'B'		//0x42	ͷ
#define JASON_HEAD_1		'S'		//0x53	ͷ
#define JASON_TAIL			'E'		//0x45	β
#define JASON_PREAMBLE	0xfe		//������
#define JASON_BROADCAST		0xffffffff	//�㲥��
#define JASON_ADDR_LEN           4

#define JASON_RATE_0001       0
#define JASON_RATE_001        1
#define JASON_RATE_01         2
#define JASON_RATE_1          3
#define JASON_RATE_10         4
#define JASON_RATE_100        5
#define JASON_RATE_1000       6


/* CJ-T188Э�� */
#define CJT188_ADDR_LEN           7
#define CJT188_ADDR_LEN           7



/*����
FE FE FE 42 42 42 42 53 70 12 82 40 52 4C 81 45
FE FE FE 53 53 53 53 42 70 12 82 40 52 43 00 23 01 00 00 34 44 44 44 2B BC 45
*/

//����Ϊ���ݱ�
//CRC У���
const u8 he00[] = {0x00, 0x12, 0x24, 0x36, 0x48, 0x5a, 0x6c, 0x7e, 0x91, 0x83, 0xb5, 0xa7, 0xd9, 0xcb, 0xfd, 0xef};
const u8 le00[] = {0x00, 0x31, 0x62, 0x53, 0xc4, 0xf5, 0xa6, 0x97, 0x88, 0xb9, 0xea, 0xdb, 0x4c, 0x7d, 0x2e, 0x1f};
const u8 hf00[] = {0x00, 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70, 0x81, 0x91, 0xa1, 0xb1, 0xc1, 0xd1, 0xe1, 0xf1};
const u8 lf00[] = {0x00, 0x21, 0x42, 0x63, 0x84, 0xa5, 0xc6, 0xe7, 0x08, 0x29, 0x4a, 0x6b, 0x8c, 0xad, 0xce, 0xef};


//����Ϊ��ʾ���ַ���

//����Ϊ����
u8 ucNumberUart2;		//������������
u8 ucNumberUart3;		//������������
u8 ucNumberUart;		//������������
u8 ucStatusProtocol2;		//״̬
u8 ucStatusProtocol3;		//״̬
u8 ucStatusProtocol;		//״̬
u8 ucStepProtocol2;		//����ѹ����,����
u8 ucStepProtocol3;		//����ѹ����,����
u8 ucStepProtocol;		//����ѹ����,����
u8 ucStepUart2;			//���ղ���
u8 ucStepUart3;			//���ղ���
u8 ucStepUart;			//���ղ���
u8 ucTimerProtocol2;		//���ö�ʱ��,8.16ms
u8 ucTimerProtocol3;		//���ö�ʱ��,8.16ms
u8 ucTimerProtocol;		//���ö�ʱ��,8.16ms
u8 ucMasterCmd;		//��Ҫ������������
u8 ucSlaveCmd;		//��Ҫ���ʹӻ�����
TypeJason tyJasonMaster;		//�ڲ�Э������
TypeJason tyJasonSlave;		//�ڲ�Э��ӻ�
extern TypeParameter tyParameter;			//�����
extern u8 aucUartTxBuffer[];
extern u8 aucRecordBuffer[];		//��¼����

//����Ϊλ����

#endif /* __PROTOCOL_H__ */

/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/

