/******************** (C) COPYRIGHT 2015 jason ,LTD ***********************
* File Name         : ProtocolJason.h
* Author            : maronglang
* Date First Issued : 2015/08/10
* Description       : ֧�ֽ����ڲ�ͨѶ����Э��
*******************************************************************************
*
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef  __CJ188_H__
#define  __CJ188_H__
#include "global.h"

#define PTR_CJ_T188     1      // CJ_T188
#define PTR_FB_T188     2      // �Ǳ�188
#define PTR_645_97      3      // 645-97

#define GM_SUCC        2      // ����ɹ�
#define GM_FAIL        0      // ����ʧ��
#define GM_WR_ADDR     3      // д��ַ
#define GM_ON_VALVE    4      // �ط���
#define GM_OFF_VALVE   5      // ������



#define GM_EXIT        -1     // �˳�����

#define VALVE_OPEN      0x00
#define VALVE_CLOSE     0x01
#define VALVE_ERROR     0x03


#define COMM_HEAD				0x68
#define COMM_END				0x16
//������궨��
#define CJ188_READ_ADDR 		0x03//0xAAAAAAAA �㲥�� ����ַ���� 
#define CJ188_READ_VALUE		0x01//����������  
#define CJ188_READ_PWORDV		0x09//������汾������
#define CJ188_WRITE_ADDR		0x15//д��ַ
#define CJ188_WRITE_VALUE		0x16//������汾������
#define CJ188_WRITE_COMMON		0x04//����д����
#define CJ188_WRITE_JSVALVE		0x2A//����188��������

#define CJ188_WRITE_GUONENG		0x17//����188��������


#define CJ188_READ_VALUE_RE		0x81//������Ӧ������
#define CJ188_READ_ADDR_RE		0x83//����ַӦ������ 
#define CJ188_WRITE_ADDR_RE		0x95//д��ַӦ������ 
#define CJ188_WRITE_JSVALVE_RE  0xAA//����188����Ӧ������



//��ʶ�궨��
#define CJ188_READ_ADDR_ID		0x0A81//0xAAAAAAAA �㲥�� ����ַ��ʶ
#define CJ188_READ_ADDR_ID1		0x810A//0xAAAAAAAA �㲥�� ����ַ��ʶ
#define CJ188_READ_VALUE_ID		0x1F90//��������ʶ
#define CJ188_READ_VALUE_ID1	0x901F//��������ʶ
#define CJ188_READ_PWORDV_ID	0x0681//������汾�ű�ʶ
#define CJ188_WRITE_ADDR_ID		0x18A0//д��ַ��ʶ
#define CJ188_WRITE_ADDR_ID1	0xA018//д��ַ��ʶ
#define CJ188_WRITE_PWORD_ID	0x14A0//д�����ʶ
#define CJ188_WRITE_TIME_ID		0x15A0//дʱ���ʶ
#define CJ188_WRITE_VALVE_ID	0x17A0//д���ű�ʶ
#define CJ188_WRITE_VALVE_ID1	0xA017//д���ű�ʶ
#define CJ188_WRITE_SPWORD_ID	0x20A0//д���������ʶ

//����
#define LOND_COND				0xfe // ������
#define COM_188CODE				0xaa // �㲥�� 
#define PUBLIC_LENTH			10//��������

//���ȷ���
#define JX_VALVE_OPEN  			0x55   //����
#define JX_VALVE_CLOSE  		0x99   //�ط�

/* ��������λ */
#define JX_FAULT_BIT  			0x04   //��������λ


#define CommUF         comm.uFrame
#define CommF          CommUF.stFrame
#define MeterID        CommF.uMeterID
#define CommTx         CommF.uDataPart.cj188_tx
#define CommRx         CommF.uDataPart.cj188_rx 
#define CommRxDat      CommRx.stReadDatExt



typedef enum
{
	CJ188_HEAD = 0,
	CJ188_TYPE = 1,
	CJ188_ADDR = 2,
	CJ188_CMD  = 3,
	CJ188_LENTH= 4,
	CJ188_ID   = 5,
	CJ188_SER  = 6,
	CJ188_DATA = 7,
	CJ188_CS   = 8,
	CJ188_END  = 9
}Comm_CJ188_Enum;

typedef struct/*CJ188 �ṹ��*/ //������չ
{
	union
	{
		u8 buff[36]; //32 ���ֽڶ�����������4�ֽ�
		struct
		{
			u8 	meter_type;
			u8 	meter_addr[7]; //���ַ
			u8 	meter_cmd;
			u8  meter_lenth;
			union
			{
				u16 meter_ID; 
				u8  meter_id[2];
			}uMeterID;
			u8  meter_ser; // 13byte�ǹ��õ� 16
			union
			{
				union
				{
					u8 buff[10];
					u8 addr[7];
					u8 time[7];
					u8 valve_ctrl;//����
					struct	
					{// ��ɳ�쳣��չ���ݽṹ
						u8  operate;
						u32 encrypt[3];//�����ֽ�
					}stEncrypt;
					struct	
					{
						u8 password_ver;
						u8 password[8];
					}stPassword;
				}cj188_tx;
	
				union
				{
					u8 buff[20];
					struct	
					{
						u32 value;
						u8  status1;// ����չʱ��״̬λ1
						u8  status2;// ����չʱ��״̬λ2
					}stReadMeter;
					struct	
					{// ������չ���ݽṹ
						u32 value;
						u8  unit0;
						u32 total_value;
						u8  unit1;
						u8  time[7];
						u16 status;
					}stReadDatExt;
					struct
					{// ��ɳ�쳣��չ���ݽṹ
						u8  disturb_time;// �Ÿ��Ŵ���
						u8  electricity; // ����
						u16 valve_st;
					}stDisturb;
					u8 password_ver;//��������汾
					u16 valve_status;
				}cj188_rx;
			}uDataPart;
		}stFrame;
	}uFrame;

	u8 checksum;
	u8 cnt;
	u8 status;
	u8 flagok;
	u8 flag_error;
}Pro_Com_Str;

extern Pro_Com_Str comm;

/* CJ188����ӿ� */
extern s8 CJ188GatherMeter(u8 nPtrType, u8 *pnAddr, u8 nCmd, u8 *pnInBuf, 
					u8 nLen, u8 *pnOutBuf, u8 nOutLen, u8 *pnOutAdd, u32 dwTimeMs);

#endif /* __CJ188_H__ */
