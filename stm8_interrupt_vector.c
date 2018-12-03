/*	BASIC INTERRUPT VECTOR TABLE FOR STM8 devices
 *	Copyright (c) 2013 STMicroelectronics
 */

#include "Source/Libraries/inc/stm8l15x.h"
#include "Source/stm8l15x_it.h"

typedef void @far (*interrupt_handler_t)(void);

struct interrupt_vector {
	uint8_t interrupt_instruction;
	interrupt_handler_t interrupt_handler;
};

struct interrupt_vector const _vectab[] = {
  {0x82, (interrupt_handler_t)_stext},		/* Reset */
  {0x82, (interrupt_handler_t)TRAP_IRQHandler},			/* TRAP - Software interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},		/* Reserved */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},			/* irq1 - FLASH interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},			/* irq2 - DMA1 channel0 and channel1 interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},			/* irq3 - DMA1 channel2 and channel3 interrupt */
  {0x82, (interrupt_handler_t)RTC_CSSLSE_IRQHandler},			/* irq4 - RTC/ CSS on LSE interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},    /* irq5 - External IT PORTE/F interrupt /PVD interrupt*/
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq6 - External IT PORTB / PORTG interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},			/* irq7 - External IT PORTD / PORTH interrupt */
  {0x82, (interrupt_handler_t)EXTI0_IRQHandler},			/* irq8 - External IT PIN0 interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},			/* irq9 - External IT PIN1 interrupt */
  {0x82, (interrupt_handler_t)EXTI2_IRQHandler},			/* irq10 - External IT PIN2 interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},		  /* irq11 - External IT PIN3 interrupt */
  {0x82, (interrupt_handler_t)EXTI4_IRQHandler},      /* irq12 - External IT PIN4 interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq13 - External IT PIN5 interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq14 - External IT PIN6 interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq15 - External IT PIN7 interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq16 - LCD / AES interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq17 - CLK switch/CSS interrupt/ TIM1 Break interrupt / DAC */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq18 - ADC1 and Comparator interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq19 - TIM2 Update/Overflow/Trigger/Break / USART2 TX interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq20 - TIM2 Capture/Compare / USART2 RX interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq21 - TIM3 Update/Overflow/Trigger/Break / USART3 TX interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},			/* irq22 - TIM3 Capture/Compare /USART3 RX interrupt */
  {0x82, (interrupt_handler_t)TIM1_UPD_OVF_TRG_COM_IRQHandler},      /* irq23 - TIM1 Update/Overflow/Trigger/Commutation interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq24 - TIM1 Capture/Compare interrupt */
  {0x82, (interrupt_handler_t)TIM4_UPD_OVF_TRG_IRQHandler},     /* irq25 - TIM4 Update/Overflow/Trigger interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq26 - SPI1 interrupt */
  {0x82, (interrupt_handler_t)USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler},      /* irq27 - USART1 TX / TIM5 Update/Overflow/Trigger/Break interrupt */
  {0x82, (interrupt_handler_t)USART1_RX_TIM5_CC_IRQHandler},      /* irq28 - USART1 RX / TIM1 Capture/Compare interrupt */
  {0x82, (interrupt_handler_t)NonHandledInterrupt},      /* irq29 - I2C1 / SPI2 interrupt */

};
