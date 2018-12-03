/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : DiverUart.h
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 串口初始化及收发函数
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/


#ifndef __DIVERUART__H__
#define __DIVERUART__H__
#include "Initialize.h"

//以下为常量
#define NUMBER_UART_RX	192  //96 118 255
#define NUMBER_UART_TX	192  //128 40 192

//以下为接口函数的常量
#define COM_0		0		//串口通道0
#define COM_1		1		//串口通道1
#define COM_2		2		//串口通道2
#define COM_3		3		//串口通道3
#define PARITY_NULL		0	//校验位类型,无
#define PARITY_LOW		1	//固定低
#define PARITY_HIGH		2	//固定高
#define PARITY_EVEN		3	//偶校验
#define PARITY_ODD		4	//奇校验
#define BAUDRATE_1200		1		//波特率常数
#define BAUDRATE_2400		2
#define BAUDRATE_4800		3
#define BAUDRATE_9600		4
#define BAUDRATE_19200		5
#define BAUDRATE_38400		6
#define BAUDRATE_57600		7
#define BAUDRATE_115200		8
#define BAUDRATE_H1200		20		//波特率头常数
#define BAUDRATE_H2400		21
#define BAUDRATE_H4800		22
#define BAUDRATE_H9600		23
#define BAUDRATE_H19200		24
#define UART_BUSY_NULL	    0		//设置某个通道忙
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


//以下为接口函数
//uint8_t CheckBusUartBusy(void);				//检查串口忙
uint8_t CheckWhichBusUartReceive(void);		//检查哪个串口接收到数据
uint8_t GetBusUartData(void);					//从Uart读取1个接收数据
uint8_t GetBusUartUartBaudate(uint8_t Channel);		//获得软件Uart波特率
void HandleBusUartSoft(void);				//从软件串口接收/发送数据
void ReceivedBusUart(void);				//从硬件串口读取数据
void ReceivedBusUart2(void);				//从硬件串口读取数据
void SendBusUartOver(void);				//发送一个硬件Uart数据,内联函数
void SetBusUartBaudate(uint8_t Baudate);		//设置软件Uart波特率
//void SetBusUartBusy(uint8_t Channel);			//设置串口忙
void SetBusUart(uint8_t Channel, uint8_t Parity);		//设置串口通道号,校验方式
void StartSendBusUartGroup(uint8_t Length);		//将一组数据保存到ucBusUartSendBuffer中,开始发送数据
void TurnBusUartOn(void);			//打开硬件Uart
void TurnBusUartOff(void);				//关闭硬件Uart
void TurnOnTimerUart(void);			//打开定时器软件接收/发送Uart

uint8_t CheckRevDataLen(void);               //获取当前接收数据长度
void ClearRxBuff(void);                 //清空接收缓存
uint8_t* GetUartRxBuf(void);                 //获取接收缓存地址
void Usart1Initialize(void);
void ClearRxBuffUnUsedLen(u8 UnUsednLen);

extern u8 nReceiveDataFlg;
extern u8 aucUartRxBuffer[NUMBER_UART_RX];

#endif

