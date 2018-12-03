
#ifndef __INITIALIZE_H__
#define __INITIALIZE_H__

#include "global.h"

/* ����Ϊ�궨�� */
#define RELOAD_VALUE     254
#define TIM4_PERIOD      124 //41

#define SOLFDOG_TO     8000  //8S��ʱ
#define IWDG_FEED_TO   1000  //1Sι������

/* IO��ģʽ�л� */
#define PULLUPOUTPUT       1
#define FLOATINPUT         0
#define PULLUPINPUT        2


/* ����ģʽ */
#define NORMAL_MODE         0
#define DEBUG_MODE          1


/* ��ʱ��1��Ƶϵ�� */
#define TIM1_PRESCALER                   1
#define TIM1_PERIOD                    3333 //2400 BANDRATE 330
#define TIM1_REPTETION_COUNTER           0

#define UART2_RX_PORT      GPIOD
#define UART2_RX_PIN       GPIO_Pin_4 
#define UART2_TX_PORT      GPIOB
#define UART2_TX_PIN       GPIO_Pin_7

#ifdef IOT_DAT_DETECTOR
#ifdef VAVLE_METER
#define MOTO_VCC_PORT       GPIOD 
#define MOTO_VCC_PIN        GPIO_Pin_1 
#define MOTO_POSI_PORT      GPIOB 
#define MOTO_POSI_PIN       GPIO_Pin_1 
#define MOTO_NEGA_PORT      GPIOB 
#define MOTO_NEGA_PIN       GPIO_Pin_0 
#define MOTO_MS1_PORT      GPIOD 
#define MOTO_MS1_PIN       GPIO_Pin_3 
#define MOTO_MS2_PORT      GPIOD 
#define MOTO_MS2_PIN       GPIO_Pin_2 

/* Moto_VCC */
#define MotoVccOn()  GPIO_WriteBit(MOTO_VCC_PORT, MOTO_VCC_PIN, SET)
#define MotoVccOff()  GPIO_WriteBit(MOTO_VCC_PORT, MOTO_VCC_PIN, RESET)

/* M+ */
#define MotoPosiHigh()  GPIO_WriteBit(MOTO_POSI_PORT, MOTO_POSI_PIN, SET)
#define MotoPosiLow()  GPIO_WriteBit(MOTO_POSI_PORT, MOTO_POSI_PIN, RESET)

/* M- */
#define MotoNegaHigh()  GPIO_WriteBit(MOTO_NEGA_PORT, MOTO_NEGA_PIN, SET)
#define MotoNegaLow()  GPIO_WriteBit(MOTO_NEGA_PORT, MOTO_NEGA_PIN, RESET)

/* MS1 */
#define GetMs1Stat()  GPIO_ReadInputDataBit(MOTO_MS1_PORT, MOTO_MS1_PIN)

/* MS2 */
#define GetMs2Stat()  GPIO_ReadInputDataBit(MOTO_MS2_PORT, MOTO_MS2_PIN)

#endif
#endif

#ifdef IOT_GASMETER
#define IO_LED_PORT      GPIOB
#define IO_LED_PIN       GPIO_Pin_0
#define MCU_VCC_PORT      GPIOD
#define MCU_VCC_PIN       GPIO_Pin_0
#else
#ifdef IOT_DAT_DETECTOR
#define IO_LED_PORT      GPIOB
#define IO_LED_PIN       GPIO_Pin_2
#else
#define IO_LED_PORT      GPIOB
#define IO_LED_PIN       GPIO_Pin_0
#endif
#endif
#define SetIO_LEDOn()  GPIO_WriteBit(IO_LED_PORT, IO_LED_PIN, SET)
#define SetIO_LEDOff()  GPIO_WriteBit(IO_LED_PORT, IO_LED_PIN, RESET)
#define Toggle_LED()    GPIO_ToggleBits(IO_LED_PORT, IO_LED_PIN)


#define LOAD_PORT      GPIOD
#define LOAD_PIN       GPIO_Pin_1
#define SetPortLoadOn()  GPIO_WriteBit(LOAD_PORT, LOAD_PIN, SET)
#define SetPortLoadOff()  GPIO_WriteBit(LOAD_PORT, LOAD_PIN, RESET)
#ifdef IOT_WATERMETER_NEW
#define GUARD_PORT      GPIOC
#define GUARD_PIN       GPIO_Pin_4
#define CHK_GUARD_PORT      GPIOC
#define CHK_GUARD_PIN       GPIO_Pin_1
#define SetGuardPinOn()  GPIO_WriteBit(GUARD_PORT, GUARD_PIN, SET)
#define SetGuardPinOff()  GPIO_WriteBit(GUARD_PORT, GUARD_PIN, RESET)
#endif

#define GM_VCC_PORT      GPIOA
#define GM_VCC_PIN       GPIO_Pin_3
#define SetPortMeterPowerOn()  GPIO_WriteBit(GM_VCC_PORT, GM_VCC_PIN, SET)
#define SetPortMeterPowerOff()  GPIO_WriteBit(GM_VCC_PORT, GM_VCC_PIN, RESET)

#define GM_TXEN_PORT      GPIOA
#define GM_TXEN_PIN       GPIO_Pin_4
#define SetPortMeterTxEn()  GPIO_WriteBit(GM_TXEN_PORT, GM_TXEN_PIN, SET)
#define SetPortMeterTxDis()  GPIO_WriteBit(GM_TXEN_PORT, GM_TXEN_PIN, RESET)

#ifdef IOT_DAT_DETECTOR
#define GPRS_VCC_PORT      GPIOC
#define GPRS_VCC_PIN       GPIO_Pin_4
#define GPRS_RX_PORT      GPIOA
#define GPRS_RX_PIN       GPIO_Pin_2
#define RS485_DE_PORT     GPIOA
#define RS485_DE_PIN      GPIO_Pin_4
#define SetPortRS485Rx()     GPIO_WriteBit(RS485_DE_PORT, RS485_DE_PIN, RESET)
#define SetPortRS485Tx()     GPIO_WriteBit(RS485_DE_PORT, RS485_DE_PIN, SET)

//#define SetPortGsmRxOn()     GPIO_WriteBit(GPRS_RX_PORT, GPRS_RX_PIN, SET)
//#define SetPortGsmRxOff()    GPIO_WriteBit(GPRS_RX_PORT, GPRS_RX_PIN, RESET)
#else
#define GPRS_VCC_PORT      GPIOB
#define GPRS_VCC_PIN       GPIO_Pin_1
#endif
#define SetPortGsmPowerOn()     GPIO_WriteBit(GPRS_VCC_PORT, GPRS_VCC_PIN, SET)
#define SetPortGsmPowerOff()    GPIO_WriteBit(GPRS_VCC_PORT, GPRS_VCC_PIN, RESET)

#define SWITCHON_PORT      GPIOB
#define SWITCHON_PIN       GPIO_Pin_5
#define SetPortSoftSwitchOff()   GPIO_WriteBit(SWITCHON_PORT, SWITCHON_PIN, RESET)  // SET
#define SetPortSoftSwitchOn()    GPIO_WriteBit(SWITCHON_PORT, SWITCHON_PIN, SET)    // RESET

#define GPRS_RESET_PORT      GPIOB
#define GPRS_RESET_PIN       GPIO_Pin_6
#define SetPortGsmResetDisable()     GPIO_WriteBit(GPRS_RESET_PORT, GPRS_RESET_PIN, RESET)   // SET 
#define SetPortGsmResetEnable()    GPIO_WriteBit(GPRS_RESET_PORT, GPRS_RESET_PIN, SET)       // RESET

#define BAT_GAT_PORT      GPIOB
#define BAT_GAT_PIN       GPIO_Pin_4
#define SetPortBatGatEnable()       GPIO_WriteBit(BAT_GAT_PORT, BAT_GAT_PIN, SET)
#define SetPortBatGatDisable()      GPIO_WriteBit(BAT_GAT_PORT, BAT_GAT_PIN, RESET)

#define DEBUG_PORT      GPIOA
#define DEBUG_PIN       GPIO_Pin_5
#define GetDebugMode()  GPIO_ReadInputDataBit(DEBUG_PORT, DEBUG_PIN)


#define BUFFER_SIZE            2
#define BUFFER_ADDRESS         ((uint16_t)(&Buffer))
#define ADC1_DR_ADDRESS        ((uint16_t)0x5344)

extern u32 g_dwSysTick;
extern u16  g_wIwdgTick;
extern u8 g_nOhterRes;
extern u8 g_nIwdg;


/*����Ϊ����
V1
P10	AD BAT
P11	RXD1,Ӳ��UART
P12	TXD1,Ӳ��UART
P13	RXD2,���UART
P14	RE/DE,485����
P15	TXD2,���UART
P16	I2C_SCL,Ӳ��I2C
P17	I2C_SDA,Ӳ��I2C
P20	GSM��Դ
P21	RE/DE,485����
P22	���Դ
P23	GSM�رտ���
P24	LED1
P25	WP,EEPROM����
P26	��
P27	GSM�رտ���

V2
P10	��
P11	RXD1,Ӳ��UART
P12	TXD1,Ӳ��UART
P13	RXD2,���UART
P14	RE/DE,485����
P15	TXD2,���UART
P16	I2C_SCL,Ӳ��I2C
P17	I2C_SDA,Ӳ��I2C
P20	GSM��Դ
P21	RE/DE,485����
P22	���Դ
P23	GSM�رտ���
P24	LED1
P25	WP,EEPROM����
P26	��
P27	GSM�رտ���

PxDIR	����,0=����;1=���
PxIE		�ж�����,0=��ֹ;1=����
PxIES	�жϷ���,0=�͵���;1=�ߵ���
PxIFG	�жϱ��
PxIN		����
PxOUT	���
PxREN	����/��������,���ʱ��ſ���
PxSEL	����ѡ��1
PxSEL2	����ѡ��2
*/
#if PCB_VERSION == 1
#define INIT_P1DIR	(BIT4 | BIT5)
#define INIT_P1IE	(BIT3)
#define INIT_P1IES	(BIT3)
#define INIT_P1IFG	0
#define INIT_P1OUT	(BIT4 | BIT5)
#define INIT_P1REN	0
#define INIT_P1SEL	(BIT1 | BIT2 )	//P11=RXD, P12=TXD | BIT6 | BIT7
#define INIT_P1SEL2	(BIT1 | BIT2 )	//P16=SCL, P17=SDA | BIT6 | BIT7

#define INIT_P2DIR	(BIT0 | BIT1 | BIT2 | BIT3 | BIT4 | BIT5 | BIT7)
#define INIT_P2IE	0
#define INIT_P2IES	0
#define INIT_P2IFG	0
#define INIT_P2OUT	(BIT1)
#define INIT_P2REN	0
#define INIT_P2SEL	0
#define INIT_P2SEL2	0
#endif


extern void InitializeBase(void);
extern void TurnOnExit(void);
extern void TurnOffExit(void);
extern u8 CheckDebugInsertStat(void);
extern u8 GetTmDebugModeStat(void);
extern void CLK_Config(void);
extern void FeedSoftWareIwdg(void);
extern void fixTaskLed(void);
extern void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState);
extern void DecIoModeChange(u8 nMode);
extern u8 SetTmDebugModeStat(u8 nMode);
extern void ValveStatIoModeChange(u8 nMode);
extern u8  STM8_RTC_ClkSwitchProc(void);


#endif
/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
