/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : DiverUart.h
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ���ڳ�ʼ�����շ�����
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/


#ifndef __DIVERUART__H__
#define __DIVERUART__H__
#include "Initialize.h"

//����Ϊ����
#define NUMBER_UART_RX	192  //96 118 255
#define NUMBER_UART_TX	192  //128 40 192

//����Ϊ�ӿں����ĳ���
#define COM_0		0		//����ͨ��0
#define COM_1		1		//����ͨ��1
#define COM_2		2		//����ͨ��2
#define COM_3		3		//����ͨ��3
#define PARITY_NULL		0	//У��λ����,��
#define PARITY_LOW		1	//�̶���
#define PARITY_HIGH		2	//�̶���
#define PARITY_EVEN		3	//żУ��
#define PARITY_ODD		4	//��У��
#define BAUDRATE_1200		1		//�����ʳ���
#define BAUDRATE_2400		2
#define BAUDRATE_4800		3
#define BAUDRATE_9600		4
#define BAUDRATE_19200		5
#define BAUDRATE_38400		6
#define BAUDRATE_57600		7
#define BAUDRATE_115200		8
#define BAUDRATE_H1200		20		//������ͷ����
#define BAUDRATE_H2400		21
#define BAUDRATE_H4800		22
#define BAUDRATE_H9600		23
#define BAUDRATE_H19200		24
#define UART_BUSY_NULL	    0		//����ĳ��ͨ��æ
#define UART_BUSY_TX1		1
#define UART_BUSY_TX2		2
#define UART_BUSY_TX3		3
#define UART_BUSY_RX2		4
#define UART_BUSY_RX3		5

#define CheckUart2Rx()      GPIO_ReadInputDataBit(UART2_RX_PORT, UART2_RX_PIN)
#define SendUart2PinLow()   GPIO_WriteBit(UART2_TX_PORT, UART2_TX_PIN, RESET)
#define SendUart2PinHigh()  GPIO_WriteBit(UART2_TX_PORT, UART2_TX_PIN, SET)

extern u8 aucUartTxBuffer[NUMBER_UART_TX];	
extern u8 ucBusUartChannel;
extern u8 ucNumberBusUart2SoftReceive;


//����Ϊ�ӿں���
//uint8_t CheckBusUartBusy(void);				//��鴮��æ
uint8_t CheckWhichBusUartReceive(void);		//����ĸ����ڽ��յ�����
uint8_t GetBusUartData(void);					//��Uart��ȡ1����������
uint8_t GetBusUartUartBaudate(uint8_t Channel);		//������Uart������
void HandleBusUartSoft(void);				//��������ڽ���/��������
void ReceivedBusUart(void);				//��Ӳ�����ڶ�ȡ����
void ReceivedBusUart2(void);				//��Ӳ�����ڶ�ȡ����
void SendBusUartOver(void);				//����һ��Ӳ��Uart����,��������
void SetBusUartBaudate(uint8_t Baudate);		//�������Uart������
//void SetBusUartBusy(uint8_t Channel);			//���ô���æ
void SetBusUart(uint8_t Channel, uint8_t Parity);		//���ô���ͨ����,У�鷽ʽ
void StartSendBusUartGroup(uint8_t Length);		//��һ�����ݱ��浽ucBusUartSendBuffer��,��ʼ��������
void TurnBusUartOn(void);			//��Ӳ��Uart
void TurnBusUartOff(void);				//�ر�Ӳ��Uart
void TurnOnTimerUart(void);			//�򿪶�ʱ���������/����Uart

uint8_t CheckRevDataLen(void);               //��ȡ��ǰ�������ݳ���
void ClearRxBuff(void);                 //��ս��ջ���
uint8_t* GetUartRxBuf(void);                 //��ȡ���ջ����ַ
void Usart1Initialize(void);
void ClearRxBuffUnUsedLen(u8 UnUsednLen);

extern u8 nReceiveDataFlg;
extern u8 aucUartRxBuffer[NUMBER_UART_RX];

#endif

