/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : global.h
* Author            : maronglang
* Date First Issued : 2015/12/25
* Description       : ȫ�ֽṹ�����Ͷ����ļ�
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/
#include "Libraries/inc/stm8l15x_conf.h"
#include "JX_Math.h"
#include "ProtocolGlobal.h"


#ifndef GLOBAL_H
#define GLOBAL_H

#define SUCCESS_GLOBAL        0
#define FAILURE_GLOBAL        1
#define ERROR         -1

//#define TEST_VISON         // just for test ���԰汾
//#define   SAVE_TEST        // just for test �洢���԰汾
//#define     XJ_JASON_VISON  // ��������ڲ�Э��汾

/* ����ˮ��ѡ��궨�� */
//#define IOT_GASMETER       // ������������ֱ��
//#define IOT_WATERMETER      // ������ˮ����ֱ����ģ��
//#define IOT_WATERMETER_NEW      // ��ģ�߹��ֱ��
#define IOT_DAT_DETECTOR        //������ݲɼ��� 


/* ����Э������ */
//#define XINJIANG_PTR            //�½�Э��
#define HEDA_PTR				//�ʹ�Э��
//#define JASON130_PTR            //����130Э��

/* Ԥ����ģʽ */
//#define PURCHASE_MODE     

#define VAVLE_METER             //�Ƿ������

#ifdef VAVLE_METER
//#define VAVLE_INNER             // ������÷��� ���DN25�����÷���
#endif

//#define PIEZOMETER              // ѹ���� piezometer

#define PHOTOELECTRIC_METER    //����  ֻ��ѹ��������Ҫ����

/* Ԥ����ר��ˮ��λ�� */
#ifdef  PURCHASE_MODE
#define METER_6BIT
//#define METER_5BIT
//#define METER_4BIT
#endif

#ifndef NULL
#define NULL ((void *)0)
#endif

#if 1
//�����ǹ�ͬ��(������)
typedef union {
	unsigned char Byte;
	struct {
		unsigned int N0:4;
		unsigned int N1:4;
	} Nibbles;
	struct {
		unsigned int D0:2;
		unsigned int D1:2;
		unsigned int D2:2;
		unsigned int D3:2;
	} Doublets;
	struct {
		unsigned int b0:1;
		unsigned int b1:1;
		unsigned int b2:1;
		unsigned int b3:1;
		unsigned int b4:1;
		unsigned int b5:1;
		unsigned int b6:1;
		unsigned int b7:1;
	} Bits;
} Type8Bits;

typedef union {
	unsigned short Short;
	struct {
		unsigned char B0;
		unsigned char B1;
	} Bytes;
	struct {
		unsigned int N0:4;
		unsigned int N1:4;
		unsigned int N2:4;
		unsigned int N3:4;
	} Nibbles;
	struct {
		unsigned int D0:2;
		unsigned int D1:2;
		unsigned int D2:2;
		unsigned int D3:2;
		unsigned int D4:2;
		unsigned int D5:2;
		unsigned int D6:2;
		unsigned int D7:2;
	} Doublets;
	struct {
		unsigned int b0:1;
		unsigned int b1:1;
		unsigned int b2:1;
		unsigned int b3:1;
		unsigned int b4:1;
		unsigned int b5:1;
		unsigned int b6:1;
		unsigned int b7:1;
		unsigned int b8:1;
		unsigned int b9:1;
		unsigned int b10:1;
		unsigned int b11:1;
		unsigned int b12:1;
		unsigned int b13:1;
		unsigned int b14:1;
		unsigned int b15:1;
	} Bits;
} Type16Bits;

typedef union {
	unsigned long Long;
	struct {
		unsigned short S0;
		unsigned short S1;
	} Shorts;
	struct {
		unsigned char B0;
		unsigned char B1;
		unsigned char B2;
		unsigned char B3;
	} Bytes;
	struct {
		unsigned int N0:4;
		unsigned int N1:4;
		unsigned int N2:4;
		unsigned int N3:4;
		unsigned int N4:4;
		unsigned int N5:4;
		unsigned int N6:4;
		unsigned int N7:4;
	} Nibbles;
	struct {
		unsigned int D0:2;
		unsigned int D1:2;
		unsigned int D2:2;
		unsigned int D3:2;
		unsigned int D4:2;
		unsigned int D5:2;
		unsigned int D6:2;
		unsigned int D7:2;
		unsigned int D8:2;
		unsigned int D9:2;
		unsigned int D10:2;
		unsigned int D11:2;
		unsigned int D12:2;
		unsigned int D13:2;
		unsigned int D14:2;
		unsigned int D15:2;
	} Doublets;
	struct {
		unsigned int b0:1;
		unsigned int b1:1;
		unsigned int b2:1;
		unsigned int b3:1;
		unsigned int b4:1;
		unsigned int b5:1;
		unsigned int b6:1;
		unsigned int b7:1;
		unsigned int b8:1;
		unsigned int b9:1;
		unsigned int b10:1;
		unsigned int b11:1;
		unsigned int b12:1;
		unsigned int b13:1;
		unsigned int b14:1;
		unsigned int b15:1;
		unsigned int b16:1;
		unsigned int b17:1;
		unsigned int b18:1;
		unsigned int b19:1;
		unsigned int b20:1;
		unsigned int b21:1;
		unsigned int b22:1;
		unsigned int b23:1;
		unsigned int b24:1;
		unsigned int b25:1;
		unsigned int b26:1;
		unsigned int b27:1;
		unsigned int b28:1;
		unsigned int b29:1;
		unsigned int b30:1;
		unsigned int b31:1;
	} Bits;
} Type32Bits;
#endif

typedef union		//ʱ��ṹ��
{
	struct
	{
		u8 Second;		//��λ��ǰ
		u8 Minute;
		u8 Hour;
		u8 Day;
		u8 Month;
//		u8 WeekMonth;
		u8 Year;
	} Byte;
	struct
	{
		u16 MS;
		u16 DH;
		u16 YM;
	} Int;
} TypeTime;	//6byte

/* ����Ϊ130Э��ṹ�� */
#ifdef JASON130_PTR
	typedef struct
	{
		u8 Type;			//������
		u8 Status;			//��״̬
		//u32 Address;		//���ַ  // edit by maronglang 2018030601
		u32 Value;		    //�����
		u32 Password;		//����
		u32 dwPurchaseVal;//Ԥ����ˮ�����
		s8  nEmergencyVal;//Ӧ������
		u8  nOverBuyFlg;  //������ˮ��־ ����D1λΪ1�� ����������2�� D2λΪ1��ʾ�ϱ��ɹ��� D3λΪ1��ʾ�ϱ�ʧ��
		#ifdef PIEZOMETER
		    u32 wBasePress;
		    u8  nAlmCtl[4];
		    u8  nUpLmtRate;
		    u8  nDownLmtRate;
		#endif
	} TypeParameter;		//�����

	typedef struct
	{
		u16 wGatherCycle;   //������
		u8 enable;			//��ʱ�ϱ�����
		u8 cycle;			//�ϱ����ڣ�ʱ���죬��
		TypeTime Time;		//ʱ��
		u8 nMonFreezeDay; /* �¶����� */	
	} TypeReport;

	typedef struct
	{
		u32 Main_IP;		//����IP��ַ
		u32 Sub_IP;		    //����IP��ַ
		u16 Main_Port;		//�����˿�
		u16 Sub_Port;		//���ö˿�
	} TypeReportParameter;		//�ϱ�����

	typedef struct
	{
		TypeTime Time;  //ʱ��
		u32 Value;		//�����
		#ifdef PIEZOMETER
		    u32 wPressure;
		#endif
		u8  nStatus;    //��״̬
		u8  nRepFlg;    //�ϱ���־
	} TypeRecord;		//���¼


/* ����Ϊ�½�Э��ṹ�� */
#elif defined(XINJIANG_PTR)
	typedef	 struct   	//ʱ��ṹ��
	{
		u8   nYear;        // ��(99)
		u8   nMonth;       // ��(01-12)
		u8   nDay;         // ��(01-31)
		u8   nHour;        // ʱ(00-23)
		u8   nMinute;      // ��(00-59)
		u8   nSecond;      // ��(00-59)
	}TIME_BIN;	//6byte

	typedef struct
	{
		u8 Type;			//������
		u8 Address[5];		//�����
		u8 FactoryCode[2];	//����ID
		u32 Value;		    //�����
		u8 Status[4];		//��״̬	
		u8 RestoreStat[4];  //��״̬�ָ����	
	} TypeParameter;		//�����

	typedef struct
	{
		u8 nGatherCycle;   //������
		u8 nStartDay;	    //��ʼ����
		u8 nStartHour;	    //��ʼСʱ
		u8 nStartMinute;	/* ��ʼ���� */
		u8 nIntervalType; 	/* ������� */
		u8 cycle;			//�ϱ����ڣ�ʱ���죬��
		u8 nTailCtl; 	    /* β�����߿��� */
		u8 nTaiInterval;  /* β�����߼���� */	
		u8 nMonFreezeDay; /* �¶����� */	
		u8 nReportType;   /* ����֡���� */	
		TIME_BIN Time;		//ʱ��
	} TypeReport;

	typedef struct
	{
		u32 Main_IP;		//����IP��ַ
		u16 Main_Port;		//�����˿�
	} TypeReportParameter;		//�ϱ�����

	typedef struct
	{
		u32 Value;		//�����
		TypeTime Time;  //ʱ��
	} TypeRecord;		//���¼

#elif defined(HEDA_PTR)	//�ʹ�Э��

	typedef	 struct   	//ʱ��ṹ��
	{
		u8   nYear;        // ��(99)
		u8   nMonth;       // ��(01-12)
		u8   nDay;         // ��(01-31)
		u8   nHour;        // ʱ(00-23)
		u8   nMinute;      // ��(00-59)
		u8   nSecond;      // ��(00-59)
	}TIME_BIN;	//6byte

	typedef struct
	{
		u8 Type;					//������
		u8 Address[5];				//�����
		u8 FactoryCode[2];			//����ID
		u32 Value;		    		//�����
		u8 Status;				//��״̬	
		u8 RestoreStat[4];  		//��״̬�ָ����	
		float Pressure1_LimitUp;	//ѹ��1����
		float Pressure1_LimitDown;	//ѹ��1����
		float Pressure2_LimitUp;	//ѹ��2����
		float Pressure2_LimitDown;	//ѹ��2����
	} TypeParameter;		//�����

	typedef struct
	{
		u8 wGatherCycle;   	//������
		u8 nIntervalType; 	/* ������� */
		u8 cycle;			//�ϱ����ڣ�ʱ���죬��
		u8 nMonFreezeDay; /* �¶����� */
		TypeTime Time;		//ʱ��	
	} TypeReport;

	typedef struct
	{
		u32 Main_IP;		//����IP��ַ
		u16 Main_Port;		//�����˿�
		u8  Main_domain_name[32];//����
		u8  flag_Login_Mode;//��½��ʽ��Ĭ��IP��ַ
	} TypeReportParameter;		//�ϱ�����

	typedef struct
	{
		u32 Value;		//�����
		TypeTime Time;  //ʱ��

		
		u8  nStatus;    //��״̬
		u8  nRepFlg;    //�ϱ���־
	} TypeRecord;		//���¼

#endif

typedef struct
{
	u32 Value;		//�����
	u8 nYear;       //��
	u8 nMon;        //��
	u8 nDay;       //��

} TypeRecordDay;		//���¼

typedef struct
{
	u32 Value;		//�����
	u8 nYear;       //��
	u8 nMon;        //��
} TypeRecordMon;		//���¼


typedef struct
{
	u8 nEnableFlg;     //����0xaa  ��ֹ = 0x55
	u8 nOptFlg;		    //�ϱ�������ִ�п��Ʊ�־ 00 �޶�ʱ������������0xaa  ��ֹ = 0x55 
	u8 nYear;		    //��
	u8 nMonth;		    //��
	u8 nDay;		    //��
	u8 nStartHour;		//��ʼ
	u8 nEndHour;		//����
	u8 nVavleStat;     //��������
	u8 nRepFailCnt;     //�ϱ�ʧ�ܴ���
	u8 nVavleCycle;     //��ʱ�������� 00 Ĭ��ÿ��1��15�� 2��-4�㿪�ط� 1-255����
} TypeValveOpt;




typedef struct		//�ڲ�Э��ͨѶЭ��,��Ҫ���õĽ��յĽṹ
{
	union
	{
		u8 Buffer[18];
		struct
		{
			u32 Address;		//��ַ
			u8 Cmd;
			u32 Code;		//Ҫ���õĲ���
			u16 Crc;
			u8 End;
		} Tx;		//����  edit by maronglang 20150822
		struct
		{
			u32 Address;		//��ַ
			u8 Cmd;
			u8 Type;		//����
			u8 Status;
			u32 Value;
			u32 Password;
			u16 Crc;
			u8  End;
		}Rx; 	//����Э�����  edit by maronglang 20150822
	};
	u8 Count;
	u8 Length: 7;
	u8 Head: 1;
} TypeJason;	//18byte

//�����Ǻ궨��
#define MAX_1_BYTE 255		//((2^8) -1)		//���ֽ����ֵ
#define MAX_2_BYTE 65535		//((2^16) -1)		//˫�ֽ����ֵ
#define MAX_3_BYTE 16777215	//((2^24) -1)		//3�ֽ����ֵ
#define MAX_4_BYTE ((u32)4294967295uL)	//((2^32) -1)		//4�ֽ����ֵ

#define CLB0	0xfe		//bit0 clear mask
#define CLB1	0xfd		//bit1 clear mask
#define CLB2	0xfb		//bit2 clear mask
#define CLB3	0xf7		//bit3 clear mask
#define CLB4	0xef		//bit4 clear mask
#define CLB5	0xdf		//bit5 clear mask
#define CLB6	0xbf		//bit6 clear mask
#define CLB7	0x7f		//bit7 clear mask

//���ڷ���У�����ú궨��
#define NONE		0		//��У������
#define ODD			1		//��У������
#define EVEN		2		//żУ������

#define CLOCK_MCU	1000000		//����Ƶ��1MHz,�ڲ�RC��
//	#define ENABLE_FLASH		//FLASHģ��EEPROM
#define ENABLE_BUS_UART
#define ENABLE_BUS_I2C		//eeprom
#define INTERNAL_RC		//�ڲ�RC��

#define  ST_SPECIA     @near

	
#endif

/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
