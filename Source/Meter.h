/*
��Ŀ:		IP��
��д:		��̶�		SunJiD@china-e-eye.com
ģ������:	ͨ�Ŷ�������
MCU:	msp430g2403
�ļ���:	meter.h
��ʼʱ��:	2015-6-17 14:53:41
*/
#ifndef __METER_H__
#define __METER_H__

#include "global.h"

//����Ϊ�궨��
#define CTL_VAVLE_ENABLE   0xAA  //����
#define CTL_VALVE_DISABLE  0x55  //��ֹ
#define CTL_VALVE_OVER     0xEE  //����ִ�н���


#ifdef XINJIANG_PTR
#define INVALID_DATA       0xFFFFFFFF
#else
#define INVALID_DATA       0xEEEEEEEE
#endif

/* ���γ���ʱ */
#define GM_TIMEOUT          600   //500
#define OPTVALVE_TIMEOUT    20000 //20��

#define GM_DELAY            1000    //1s
#define GM_PWROFFDELAY      100    //200ms
#define VAVLE_DELAY          16     //5s
#define VAVLE_TIMEOUT        40     //20S
#define VAVLE_OPT_DELAY      500

/* Ƿ�ѱ�־ ��Ƿ��������ʹ��2�ֱ�־��Ƿ���ϱ���־ */
#define OWED_STAT_FLG       0x01   /* D0λ Ƿ��״̬��־*/
#define OWED_USED_FLG       0x02   /* D1λ Ƿ������ʹ�ó�2�ֱ�־*/
#define OWED_REP_SUCC       0x04   /* D2�ϱ��ɹ� */
#define OWED_REP_FAIL       0x08   /* D3ʧ�� */
#define OWED_ALL_FLAG       0x0F   /* Ƿ�ѱ�־ */

#ifdef  METER_6BIT
/* 6λ���� */
#define FULL_RANGE_METER  1000000
#define UP_LIMIT_DATA      990000
#define LIMIT_PURCHASE     10000
#else
#ifdef METER_5BIT
/* 5λ���� */
#define FULL_RANGE_METER   100000
#define UP_LIMIT_DATA       99000
#define LIMIT_PURCHASE      1000
#else
/* 4λ���� */
#define FULL_RANGE_METER   10000
#define UP_LIMIT_DATA       9900
#define LIMIT_PURCHASE      100
#endif 
#endif

#define HALF_FULL_RANGE      FULL_RANGE_METER/2


//����Ϊ����

//����Ϊ���ݱ�

//����Ϊ��ʾ���ַ���

//����Ϊ����
extern volatile TypeTime tyTime;		//ʱ��ṹ��

/* ����ִ������ */
extern u8 g_nOptValveTask;
extern u32 g_dwNowMeterVal;

void fixTaskMeter(void);
u8 GetGatherMeterFlg(void);
void InitializeMeter(void);
u8 GM_GetGatherMeterFlg(void);
void fixTaskVavle(void);
u8 JASON_GetArrearageFlg(void);
void JASON_ClrArrearageFlg(void);
int32_t ClaGatherMeterTime(TypeTime stTime);
void JASON_130PurchasePro(void);


//����Ϊλ����
#endif /* __METER_H__ */
/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
