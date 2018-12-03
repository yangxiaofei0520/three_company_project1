/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : DiverUart.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 串口初始化及收发函数
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/


#include "global.h"
#include "Initialize.h"
#include "DriverUart.h"
//#include <string.h>
#include "GsmGlobal.h"

#define b2SendingData	      tyUartBusyFlag		        //串口2正在发送数据
#define b2ParitySend	      tyUartParityFlag		        //串口2发送数据校验位
#define b2ParityReceive	      tyUartParityFlag		        //串口2接收数据校验位
#define b2ParityReceiveError  tyUartParityFlagError		    //串口2接收数据校验位错误
#define d2ParityMode	      tyUartModeFlag		        //串口2数据校验位类型


//以下为变量
u8 uCountBusUartSend;			//已经发送数据的数量
u8 ucBusUartBaudate;				//串口波特率
u8 ucBusUartChannel;				//哪个串口在工作
u8 ucBusUartReceiveHead;		//接收缓冲中数据头位置
u8 ucBusUartReceiveTail;			//接收缓冲中数据尾位置
u8 ucBusUartReciveLen;			    //串口接收数据长度 add by maronglang 20150821
u8 ucDataBusUart2SoftSend;		//发送数据2,软件串口使用
u8 ucDataBusUart2SoftReceive;		//接收数据2,软件串口使用
u8 ucNumberBusUartSend;		//需要发送数据的数量
u8 ucNumberBusUart2SoftSend;		//发送数据2位数,软件串口使用
u8 ucNumberBusUart2SoftReceive;		//接收数据2位数,软件串口使用
u8 aucUartRxBuffer[NUMBER_UART_RX];		//接收缓冲
u8 aucUartTxBuffer[NUMBER_UART_TX];		//发送缓冲

//以下为位变量
u8 tyUartBusyFlag = 0;			                //串口2忙
u8 tyUartModeFlag = 0;		                    //串口2设置校验模式
u8 tyUartParityFlag = 0;		                //串口2接收发送校验位
u8 tyUartParityFlagError = 0;                   //串口2接数据校验位错误
u8 nReceiveDataFlg = 0;                         //串口2接数据标志

/* 串口接收锁 */
static u8 m_nUartRxLockFlg = FALSE; 

#if 1
/***********************************************/
/* 定时器重装计数值
函数名: Time1ReloadVal
入	参: 无
出	参: 无
返回值: 无
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void Time1ReloadVal(u16 TIM1_Period)
{
	/* Set the Autoreload value */
	TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
	TIM1->ARRL = (uint8_t)(TIM1_Period);
}

/***********************************************/
/* 打开定时器,软件接收/发送UART
函数名: TurnOnTimerUart
入	参: 无
出	参: 无
返回值: 无
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void TurnOnTimerUart(void)
{
	TurnOffExit();			//关闭外部中断
	switch (ucBusUartBaudate)		//1MHZ
	{
	case BAUDRATE_1200:
		Time1ReloadVal(6666 - 1);		//定时器初值,8000000/1200=6666.6		
		break;
	case BAUDRATE_2400:
		Time1ReloadVal(3407 - 1);		//A,定时器初值,8000000/2400=3333.3,微调 //3335-3480
		break;
	case BAUDRATE_4800:
		Time1ReloadVal(1667 - 1);		//定时器初值,8000000/4800=1666.6
		break;
	case BAUDRATE_9600:
		Time1ReloadVal(847 - 1);			//定时器初值,8000000/9600=833.3
		break;
	case BAUDRATE_19200:
		Time1ReloadVal(417 - 1);			//定时器初值,8000000/19200=416.6
		break;
	case BAUDRATE_38400:
		Time1ReloadVal(208 - 1);			//定时器初值,8000000/38400=208.3us
		break;
	case BAUDRATE_57600:
		Time1ReloadVal(139 - 1); 		//定时器初值,8000000/57600=138.8
		break;
	case BAUDRATE_115200:
		Time1ReloadVal(69- 1);  		    //定时器初值,8000000/115200=69.4
		break;
	}

	//TIM1_Cmd(ENABLE);	
    TIM1->CR1 |= TIM1_CR1_CEN;
	tyUartParityFlag = 0;				//串口接收发送校验位清零	
}

/***********************************************/
/* 串口2为模拟串口使用完后关闭定时器
函数名: TurnOffTimerUart
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void TurnOffTimerUart(void)
{
	//TIM1_Cmd(DISABLE);
    TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
	TurnOnExit();			        //打开外部中断
}

/***********************************************/
/* 接收数据并存入循环缓存
函数名: BusUartReceiveSave
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void BusUartReceiveSave(u8 Data)
{
	/* add by maronglang  */
	if(NUMBER_UART_RX == ucBusUartReciveLen)
	{
		ucBusUartReciveLen = NUMBER_UART_RX-1;
		return ;
	}
	ucBusUartReciveLen++;

	aucUartRxBuffer[ucBusUartReceiveTail] = Data;	//读接收到的数据,同时清除中断标记
	ucBusUartReceiveTail++;			                //接收缓冲中数据尾位置
	if (ucBusUartReceiveTail > (NUMBER_UART_RX - 1) )		//尾到头?
	{
		ucBusUartReceiveTail = 0;			//接收缓冲中数据尾位置
	}
}

/***********************************************/
/* 接收软件串口2尾处理
函数名: ReceivedBusUart2Tail
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void ReceivedBusUart2Tail(void)
{
	TurnOffTimerUart();		//关闭定时器
	if (CheckUart2Rx())		//尾必须为高 
	{
		BusUartReceiveSave(ucDataBusUart2SoftReceive);	//读接收到的数据,同时清除中断标记
		ucBusUartChannel = COM_2;		//收到数据
	}
	ucNumberBusUart2SoftReceive = 0;		//接收数据2位数	
	nReceiveDataFlg = FALSE;
}

/***********************************************/
/* 接收软件串口2数据
函数名: ReceivedBusUart2
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void ReceivedBusUart2(void)
{
	switch (ucNumberBusUart2SoftReceive)		//接收数据2位数
	{
	case 0:
		b2ParityReceiveError = 0;			//串口2接收数据校验位错误
		if (!CheckUart2Rx() )		//头为高?
		{
			ucNumberBusUart2SoftReceive++;		//接收数据2位数
			ucDataBusUart2SoftReceive = 0;		//接收数据2
		}
		break;
	default:		//1~8
		ucNumberBusUart2SoftReceive++;		//接收数据2位数
		ucDataBusUart2SoftReceive >>= 1;			//LSB,数据右移1位
		if (CheckUart2Rx() )		//判断数据位
		{
			ucDataBusUart2SoftReceive |= 0x80;		//接收数据2
			b2ParityReceive ^= 1;
		}
		break;
	case 9:		//停止位,or校验位
		ucNumberBusUart2SoftReceive++;		//接收数据2位数
		switch (d2ParityMode)
		{
		case PARITY_NULL:
			ReceivedBusUart2Tail();
			break;
		case PARITY_HIGH:
			if (!CheckUart2Rx() )		//判断校验位
			{
				b2ParityReceiveError = 1;			//串口2接收数据校验位错误
			}
			break;
		case PARITY_LOW:
			if (CheckUart2Rx() )		//判断校验位
			{
				b2ParityReceiveError = 1;			//串口2接收数据校验位错误
			}
			break;
		case PARITY_EVEN:
			if (b2ParityReceive)
			{
				if (!CheckUart2Rx() )		//判断校验位
				{
					b2ParityReceiveError = 1;			//串口2接收数据校验位错误
				}
			}
			else
			{
				if (CheckUart2Rx() )		//判断校验位
				{
					b2ParityReceiveError = 1;			//串口2接收数据校验位错误
				}
			}
			break;
		case PARITY_ODD:
			if (b2ParityReceive)
			{
				if (CheckUart2Rx() )		//判断校验位
				{
					b2ParityReceiveError = 1;			//串口2接收数据校验位错误
				}
			}
			else
			{
				if (!CheckUart2Rx() )		//判断校验位
				{
					b2ParityReceiveError = 1;			//串口2接收数据校验位错误
				}
			}
			break;
		}
		break;
	case 10:		//停止位
		ReceivedBusUart2Tail();
		break;
	}
}

/***********************************************/
/* 设置软件串口通道号,校验方式,在发送之前设置(只有软件串口才可以设置)
函数名: SetBusUart
入	参: 无
出	参: 无
返回值: 0~3
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void SetBusUart(u8 Channel, u8 Parity)
{
	ucBusUartChannel = Channel;
	switch (ucBusUartChannel)		//只有2,3通道才可以设置校验位
	{
	case COM_2:
		d2ParityMode = Parity;		//设置校验位模式
		break;
	}
}


/***********************************************/
/* 对外接口修改波特率(模拟串口)
函数名: SetBusUart
入	参: 无
出	参: 无
返回值: 0~3
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void SetBusUartBaudate(u8 Baudate)
{
	TurnOffTimerUart();		//关闭定时器 add by maronglang 20170524
	ucBusUartBaudate = Baudate;	
}

/***********************************************/
/* 从软件串口接收/发送数据,定时器调用
函数名: HandleBusUartSoft
入	参: 无
出	参: 无
返回值: 无
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void HandleBusUartSoft(void)
{
	if (b2SendingData)
	{
		switch (ucNumberBusUart2SoftSend)		//发送数据2位数
		{
		case 0:
			ucNumberBusUart2SoftSend++;		//发送数据2位数
			ucDataBusUart2SoftSend = aucUartTxBuffer[uCountBusUartSend];
			SendUart2PinLow();		//开始位
			b2ParitySend = 0;
			break;
		default:			//1~8
			if (ucDataBusUart2SoftSend & 1)		//LSB
			{
				SendUart2PinHigh();
				b2ParitySend ^= 1;
			}
			else
			{
				SendUart2PinLow();
			}
			ucDataBusUart2SoftSend >>= 1;			//LSB,数据右移1位
			ucNumberBusUart2SoftSend++;		//发送数据2位数
			break;
		case 9:		//停止位,or校验位
			switch (d2ParityMode)
			{
			case PARITY_NULL:
				break;//ucNumberBusUart2SoftSend++;		//跳过校验位 edit by maronglang 20170524
			case PARITY_HIGH:
				SendUart2PinHigh();
				break;
			case PARITY_ODD:
				if (b2ParitySend)
				{
					SendUart2PinLow();
				}
				else
				{
					SendUart2PinHigh();
				}
				break;
			case PARITY_EVEN:
				if (b2ParitySend)
				{
					SendUart2PinHigh();
				}
				else
			//case PARITY_LOW:
				{
					SendUart2PinLow();
				}
				break;
			}
			ucNumberBusUart2SoftSend++;		//发送数据2位数
			break;
		case 10:		//停止位
			//ucNumberBusUart2SoftSend++;		//发送数据尾
			SendUart2PinHigh();			
			uCountBusUartSend++;			//已经发送数据的数量
			if (uCountBusUartSend >= ucNumberBusUartSend)		//全部数据发送完?
			{
				TurnOffTimerUart(); 	        //关闭定时器
				ucNumberBusUartSend = 0;		//需要发送数据的数量
				uCountBusUartSend = 0;			//已经发送数据的数量
				b2SendingData = 0;
			}
			ucNumberBusUart2SoftSend = 0;		//发送数据2位数			
			break;
#if 0		
		case 11:		//结束发送
			uCountBusUartSend++;			//已经发送数据的数量
			if (uCountBusUartSend >= ucNumberBusUartSend)		//全部数据发送完?
			{
				TurnOffTimerUart(); 	//关闭定时器
				ucNumberBusUartSend = 0;		//需要发送数据的数量
				uCountBusUartSend = 0;			//已经发送数据的数量
				b2SendingData = 0;
			}
			ucNumberBusUart2SoftSend = 0;		//发送数据2位数
			break;
#endif
		}
	}
	else if (nReceiveDataFlg)				//接收数据
	{
		ReceivedBusUart2();
	}
}



#endif


//以下为正常流程
#if 1
/**
  * @}
  */
  
/** @defgroup USART_Group8 Interrupts and flags management functions
 *  @brief   Interrupts and flags management functions 
 *
@verbatim   
 ===============================================================================
                   Interrupts and flags management functions
 ===============================================================================  

  This subsection provides a set of functions allowing to configure the USART 
  Interrupts sources, DMA channels requests and check or clear the flags or 
  pending bits status.
  The user should identify which mode will be used in his application to manage 
  the communication: Polling mode, Interrupt mode or DMA mode. 
    
  Polling Mode
  =============
  In Polling Mode, the USART communication can be managed by 9 flags:
     1. USART_FLAG_TXE: to indicate the status of the transmit buffer register
     2. USART_FLAG_RXNE: to indicate the status of the receive buffer register
     3. USART_FLAG_TC: to indicate the status of the transmit operation
     4. USART_FLAG_IDLE: to indicate the status of the Idle Line             
     5. USART_FLAG_SBK: to indicate the status of the Send Break characters
     6. USART_FLAG_NE: to indicate if a noise error occur
     7. USART_FLAG_FE: to indicate if a frame error occur
     8. USART_FLAG_PE: to indicate if a parity error occur
     9. USART_FLAG_ORE: to indicate if an Overrun error occur

  In this Mode it is advised to use the following functions:
      - FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG);
      - void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG);

  Interrupt Mode
  ===============
  In Interrupt Mode, the USART communication can be managed by 7 interrupt sources
  and 6 pending bits: 

  Pending Bits:
  ------------- 
     1. USART_IT_TXE: to indicate the status of the transmit buffer register
     2. USART_IT_RXNE: to indicate the status of the receive buffer register
     3. USART_IT_TC: to indicate the status of the transmit operation
     4. USART_IT_IDLE: to indicate the status of the Idle Line             
     5. USART_IT_PE: to indicate if a parity error occur
     6. USART_IT_OR: to indicate if an Noise flag, overrun error and framing error in
											multibuffer communication error occur

  Interrupt Source:
  -----------------
     1. USART_IT_TXE: specifies the interrupt source for the Tx buffer empty 
                       interrupt. 
     2. USART_IT_RXNE: specifies the interrupt source for the Rx buffer not 
                        empty interrupt.
     3. USART_IT_TC: specifies the interrupt source for the Transmit complete 
											interrupt. 
     4. USART_IT_IDLE: specifies the interrupt source for the Idle Line interrupt.
     5. USART_IT_PE: specifies the interrupt source for the parity error interrupt. 
     6. USART_IT_ERR:  specifies the interrupt source for the errors interrupt.
		 7. USART_IT_OR: specifies the interrupt source for the overrun error interrupt.

    Note: Some parameters are coded in order to use them as interrupt source or 
    ----  as pending bits.

  In this Mode it is advised to use the following functions:
     - void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState
                      		 NewState);
     - ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT);
     - void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT);

  DMA Mode
  ========
  In DMA Mode, the USART communication can be managed by 2 DMA Channel requests:
     1. USART_DMAReq_Tx: specifies the Tx buffer DMA transfer request
     2. USART_DMAReq_Rx: specifies the Rx buffer DMA transfer request

  In this Mode it is advised to use the following function:
     - void USART_DMACmd(USART_TypeDef* USARTx, uint16_t USART_DMAReq, FunctionalState NewState);

@endverbatim
  * @{
  */

/**
  * @brief  Enables or disables the specified USART interrupts.
  * @param  USARTx: where x can be 1 to select the specified USART peripheral.
  * @param  USART_IT specifies the USART interrupt sources to be enabled or disabled.
  *         This parameter can be one of the following values:
  *            @arg USART_IT_TXE: Transmit Data Register empty interrupt
  *            @arg USART_IT_TC: Transmission complete interrupt
  *            @arg USART_IT_RXNE: Receive Data register not empty interrupt
  *            @arg USART_IT_OR: Overrun error interrupt
  *            @arg USART_IT_IDLE: Idle line detection interrupt
  *            @arg USART_IT_ERR: Error interrupt
  * @param  NewState new state of the specified USART interrupts.
    *         This parameter can be: ENABLE or DISABLE.
  * @retval None
  */
void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
{
  uint8_t usartreg, itpos = 0x00;
  assert_param(IS_USART_CONFIG_IT(USART_IT));
  assert_param(IS_FUNCTIONAL_STATE(NewState));

  /* Get the USART register index */
  usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
  /* Get the USART IT index */
  itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));

  if (NewState != DISABLE)
  {
    /**< Enable the Interrupt bits according to USART_IT mask */
    if (usartreg == 0x01)
    {
      USARTx->CR1 |= itpos;
    }
    else if (usartreg == 0x05)
    {
      USARTx->CR5 |= itpos;
    }
    /*uartreg =0x02*/
    else
    {
      USARTx->CR2 |= itpos;
    }
  }
  else
  {
    /**< Disable the interrupt bits according to USART_IT mask */
    if (usartreg == 0x01)
    {
      USARTx->CR1 &= (uint8_t)(~itpos);
    }
    else if (usartreg == 0x05)
    {
      USARTx->CR5 &= (uint8_t)(~itpos);
    }
    /*uartreg =0x02*/
    else
    {
      USARTx->CR2 &= (uint8_t)(~itpos);
    }
  }
}

/***********************************************/
/* 硬件串口初始化
函数名: Usart1Initialize
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.12
*//*********************************************/
void Usart1Initialize(void)
{
	uint32_t BaudRate_Mantissa = 0;
	uint8_t usartreg, itpos = 0x00;

	/* Deinitializes the UART1  */
//	USART_DeInit(USART1);
	(void) USART1->SR;
	(void) USART1->DR;	
	USART1->BRR2 = USART_BRR2_RESET_VALUE;	/* Set USART_BRR2 to reset value 0x00 */
	USART1->BRR1 = USART_BRR1_RESET_VALUE;	/* Set USART_BRR1 to reset value 0x00 */
	
	USART1->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
	USART1->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
	USART1->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
	USART1->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */

	//USART_Init(USART1, (uint32_t)115200, USART_WordLength_8b, 
		//USART_StopBits_1, USART_Parity_No, USART_Mode_Rx|USART_Mode_Tx);

	/* Clear the word length and Parity Control bits */
	USART1->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
	/* Set the word length bit according to USART_WordLength value */
	/* Set the Parity Control bit to USART_Parity value */
	USART1->CR1 |= (uint8_t)((uint8_t)USART_WordLength_8b | (uint8_t)USART_Parity_No);
	
	/* Clear the STOP bits */
	USART1->CR3 &= (uint8_t)(~USART_CR3_STOP);
	/* Set the STOP bits number according to USART_StopBits value */
	USART1->CR3 |= (uint8_t)USART_StopBits_1;
	
	/* Clear the LSB mantissa of USARTDIV */
	USART1->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
	/* Clear the MSB mantissa of USARTDIV */
	USART1->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
	/* Clear the Fraction bits of USARTDIV */
	USART1->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
	
	BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / 19200 ); //115200
	/* Set the fraction of USARTDIV */
	USART1->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
	/* Set the MSB mantissa of USARTDIV */
	USART1->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
	/* Set the LSB mantissa of USARTDIV */
	USART1->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
	
	/* Disable the Transmitter and Receiver */
	USART1->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
	/* Set TEN and REN bits according to USART_Mode value */
	USART1->CR2 |= (uint8_t)USART_Mode_Rx|USART_Mode_Tx;

	/* Enable the USART Receive interrupt: this interrupt is generated when the USART
	  receive data register is not empty */
	USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
	
	/* Enable the USART Transmit complete interrupt: this interrupt is generated when the USART
	  transmit Shift Register is empty */
	USART_ITConfig(USART1, USART_IT_TC, ENABLE);
	
	TurnBusUartOn();

	SetBusUartBaudate(BAUDRATE_2400);
	SetBusUart(COM_2, PARITY_EVEN); 
	//SetBusUartBaudate(BAUDRATE_9600);
	//SetBusUart(COM_2, PARITY_NULL); 
	
	ClearRxBuff();
}

/***********************************************/
/* 硬件UART,继续发送一个数据,串口发送中断中调用
函数名: SendBusUartOver
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void SendBusUartOver(void)
{
	uCountBusUartSend++;			//已经发送数据的数量++
	if (uCountBusUartSend < ucNumberBusUartSend)		//全部数据发送完?
	{
		USART1->DR = aucUartTxBuffer[uCountBusUartSend];
		//USART_SendData8(USART1, aucUartTxBuffer[uCountBusUartSend]); //已经发送数据的数量
	}
	else
	{
		ucNumberBusUartSend = 0;		//需要发送数据的数量
		uCountBusUartSend = 0;			//已经发送数据的数量		
		USART_ITConfig(USART1, USART_IT_TC, DISABLE);
		//IE2 &= ~UCA0TXIE;			//禁止UART发送中断
		//IFG2 &= ~UCA0TXIFG;		//清发送标记
	}
}

/***********************************************/
/* 从硬件串口读取数据,中断中调用
函数名: ReceivedBusUart
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void ReceivedBusUart(void)
{
	ucBusUartChannel = COM_1;
	BusUartReceiveSave(USART1->DR);	//读接收到的数据,同时清除中断标记
}

/***********************************************/
/* 开始发送数据
函数名: ReceivedBusUart
入	参: aucUartTxBuffer,ucNumberBusUartSend=长度
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void StartSendBusUartGroup(u8 Length)
{
	u32 dwTick = 0;
	
	ucNumberBusUartSend = Length;		            //需要发送数据的数量
	uCountBusUartSend = 0;			                //已经发送数据的数量
	switch (ucBusUartChannel)
	{
	case COM_1:		
		USART_ITConfig(USART1, USART_IT_TC, ENABLE);
		USART1->DR = aucUartTxBuffer[0]; //发送第一个数据
		break;
		
	case COM_2:
		b2SendingData = TRUE;			//正在发送数据
		SendUart2PinHigh();		    //485转换到发送模式
		ucNumberBusUart2SoftSend = 0;		//发送数据2位数
		TurnOnTimerUart();
		break;
	}

	/* 等待数据发送完成 */
	dwTick = GetSysTemTick();
	while(0 < ucNumberBusUartSend)
	{
		if(1000 < GetSysTemTick() - dwTick)
		{
			break;
		}
	}
	return ;
}

/***********************************************/
/* 从软缓冲区读取1个接收数据
函数名: GetBusUartData
入	参: 无
出	参: 无
返回值: u8
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
u8 GetBusUartData(void)		//从缓冲区读取一组UART数据
{
	u8 code;
	code = aucUartRxBuffer[ucBusUartReceiveHead];	//读接收到的数据,同时清除中断标记
	ucBusUartReceiveHead++;
	if (ucBusUartReceiveHead > (NUMBER_UART_RX - 1) )
	{
		ucBusUartReceiveHead = 0;
	}

	ucBusUartReciveLen--;
	if(0 == ucBusUartReciveLen)
	{
		ucBusUartReciveLen = 0;
	}
	return code;
}

/***********************************************/
/* 打开硬件串口
函数名: GetBusUartData
入	参: Baudrate(波特率)
出	参: 无
返回值: 无
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void TurnBusUartOn(void)			//打开UART
{
	//USART_Cmd(USART1, ENABLE);	
    USART1->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
}

/***********************************************/
/* 关闭硬件Uart
函数名: TurnBusUartOff
入	参: 无
出	参: 无
返回值: 无
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
void TurnBusUartOff(void)
{
	//USART_Cmd(USART1, DISABLE);	
    USART1->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
}

/***********************************************/
/* 检查哪个个串口接收到数据
函数名: CheckWhichBusUartReceive
入	参: 无
出	参: 无
返回值: 0~3
修改人: maronglang
日	期: 2015.12.11
*//*********************************************/
u8 CheckWhichBusUartReceive(void)
{
	u8 code = 0;
	
	if (ucBusUartReceiveHead == ucBusUartReceiveTail)		//头等于尾? 后续增加计算接收数据
	{
		code = COM_0;			//无数据
	}
	else
	{
		code = ucBusUartChannel;		//输出通道号
	}
	return code;
}
#endif

#if 1
/***********************************************/
/* 获取当前串口接收数据长度
函数名: CheckRevDataLen
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.08.21
*//*********************************************/
u8 CheckRevDataLen(void)
{
	return ucBusUartReciveLen;
}

/***********************************************/
/* 清空缓存
函数名: ClearRxBuff
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.09.11
*//*********************************************/
void ClearRxBuff(void)
{
	ucBusUartReciveLen = 0;
	ucBusUartReceiveHead = 0;
	ucBusUartReceiveTail = 0;
	MemsetFunc(aucUartRxBuffer, 0, sizeof(aucUartRxBuffer));
}

/***********************************************/
/* 清空指定缓存
函数名: ClearRxBuffUnUsedLen
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2016.08.08
*//*********************************************/
void ClearRxBuffUnUsedLen(u8 UnUsednLen)
{
	if((ucBusUartReceiveHead+UnUsednLen+100 >= (NUMBER_UART_RX - 1) )||(ucBusUartReciveLen >= 100+ucBusUartReceiveHead))
	{
		ClearRxBuff();
		return ;
	}		
	ucBusUartReciveLen = ucBusUartReciveLen - UnUsednLen;
	MemsetFunc(&aucUartRxBuffer[ucBusUartReceiveHead], 0, UnUsednLen);
	ucBusUartReceiveHead = ucBusUartReceiveHead+UnUsednLen;
}

/***********************************************/
/* 获取串口缓存首地址
函数名: GetUartRxBuf
入	参: void
出	参: void
返回值: u8
修改人: maronglang
日	期: 2015.09.12
*//*********************************************/
u8* GetUartRxBuf(void)
{
	return &aucUartRxBuffer[ucBusUartReceiveHead];
}

#endif
/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
