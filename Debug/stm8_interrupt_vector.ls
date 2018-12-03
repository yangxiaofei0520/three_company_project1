   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     .const:	section	.text
   6  0000               __vectab:
   7  0000 82            	dc.b	130
   9  0001 00            	dc.b	page(__stext)
  10  0002 0000          	dc.w	__stext
  11  0004 82            	dc.b	130
  13  0005 00            	dc.b	page(f_TRAP_IRQHandler)
  14  0006 0000          	dc.w	f_TRAP_IRQHandler
  15  0008 82            	dc.b	130
  17  0009 00            	dc.b	page(f_NonHandledInterrupt)
  18  000a 0000          	dc.w	f_NonHandledInterrupt
  19  000c 82            	dc.b	130
  21  000d 00            	dc.b	page(f_NonHandledInterrupt)
  22  000e 0000          	dc.w	f_NonHandledInterrupt
  23  0010 82            	dc.b	130
  25  0011 00            	dc.b	page(f_NonHandledInterrupt)
  26  0012 0000          	dc.w	f_NonHandledInterrupt
  27  0014 82            	dc.b	130
  29  0015 00            	dc.b	page(f_NonHandledInterrupt)
  30  0016 0000          	dc.w	f_NonHandledInterrupt
  31  0018 82            	dc.b	130
  33  0019 00            	dc.b	page(f_RTC_CSSLSE_IRQHandler)
  34  001a 0000          	dc.w	f_RTC_CSSLSE_IRQHandler
  35  001c 82            	dc.b	130
  37  001d 00            	dc.b	page(f_NonHandledInterrupt)
  38  001e 0000          	dc.w	f_NonHandledInterrupt
  39  0020 82            	dc.b	130
  41  0021 00            	dc.b	page(f_NonHandledInterrupt)
  42  0022 0000          	dc.w	f_NonHandledInterrupt
  43  0024 82            	dc.b	130
  45  0025 00            	dc.b	page(f_NonHandledInterrupt)
  46  0026 0000          	dc.w	f_NonHandledInterrupt
  47  0028 82            	dc.b	130
  49  0029 00            	dc.b	page(f_EXTI0_IRQHandler)
  50  002a 0000          	dc.w	f_EXTI0_IRQHandler
  51  002c 82            	dc.b	130
  53  002d 00            	dc.b	page(f_NonHandledInterrupt)
  54  002e 0000          	dc.w	f_NonHandledInterrupt
  55  0030 82            	dc.b	130
  57  0031 00            	dc.b	page(f_EXTI2_IRQHandler)
  58  0032 0000          	dc.w	f_EXTI2_IRQHandler
  59  0034 82            	dc.b	130
  61  0035 00            	dc.b	page(f_NonHandledInterrupt)
  62  0036 0000          	dc.w	f_NonHandledInterrupt
  63  0038 82            	dc.b	130
  65  0039 00            	dc.b	page(f_EXTI4_IRQHandler)
  66  003a 0000          	dc.w	f_EXTI4_IRQHandler
  67  003c 82            	dc.b	130
  69  003d 00            	dc.b	page(f_NonHandledInterrupt)
  70  003e 0000          	dc.w	f_NonHandledInterrupt
  71  0040 82            	dc.b	130
  73  0041 00            	dc.b	page(f_NonHandledInterrupt)
  74  0042 0000          	dc.w	f_NonHandledInterrupt
  75  0044 82            	dc.b	130
  77  0045 00            	dc.b	page(f_NonHandledInterrupt)
  78  0046 0000          	dc.w	f_NonHandledInterrupt
  79  0048 82            	dc.b	130
  81  0049 00            	dc.b	page(f_NonHandledInterrupt)
  82  004a 0000          	dc.w	f_NonHandledInterrupt
  83  004c 82            	dc.b	130
  85  004d 00            	dc.b	page(f_NonHandledInterrupt)
  86  004e 0000          	dc.w	f_NonHandledInterrupt
  87  0050 82            	dc.b	130
  89  0051 00            	dc.b	page(f_NonHandledInterrupt)
  90  0052 0000          	dc.w	f_NonHandledInterrupt
  91  0054 82            	dc.b	130
  93  0055 00            	dc.b	page(f_NonHandledInterrupt)
  94  0056 0000          	dc.w	f_NonHandledInterrupt
  95  0058 82            	dc.b	130
  97  0059 00            	dc.b	page(f_NonHandledInterrupt)
  98  005a 0000          	dc.w	f_NonHandledInterrupt
  99  005c 82            	dc.b	130
 101  005d 00            	dc.b	page(f_NonHandledInterrupt)
 102  005e 0000          	dc.w	f_NonHandledInterrupt
 103  0060 82            	dc.b	130
 105  0061 00            	dc.b	page(f_NonHandledInterrupt)
 106  0062 0000          	dc.w	f_NonHandledInterrupt
 107  0064 82            	dc.b	130
 109  0065 00            	dc.b	page(f_TIM1_UPD_OVF_TRG_COM_IRQHandler)
 110  0066 0000          	dc.w	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 111  0068 82            	dc.b	130
 113  0069 00            	dc.b	page(f_NonHandledInterrupt)
 114  006a 0000          	dc.w	f_NonHandledInterrupt
 115  006c 82            	dc.b	130
 117  006d 00            	dc.b	page(f_TIM4_UPD_OVF_TRG_IRQHandler)
 118  006e 0000          	dc.w	f_TIM4_UPD_OVF_TRG_IRQHandler
 119  0070 82            	dc.b	130
 121  0071 00            	dc.b	page(f_NonHandledInterrupt)
 122  0072 0000          	dc.w	f_NonHandledInterrupt
 123  0074 82            	dc.b	130
 125  0075 00            	dc.b	page(f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler)
 126  0076 0000          	dc.w	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 127  0078 82            	dc.b	130
 129  0079 00            	dc.b	page(f_USART1_RX_TIM5_CC_IRQHandler)
 130  007a 0000          	dc.w	f_USART1_RX_TIM5_CC_IRQHandler
 131  007c 82            	dc.b	130
 133  007d 00            	dc.b	page(f_NonHandledInterrupt)
 134  007e 0000          	dc.w	f_NonHandledInterrupt
 194                     	xdef	__vectab
 195                     	xref	f_USART1_RX_TIM5_CC_IRQHandler
 196                     	xref	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 197                     	xref	f_TIM4_UPD_OVF_TRG_IRQHandler
 198                     	xref	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 199                     	xref	f_EXTI4_IRQHandler
 200                     	xref	f_EXTI2_IRQHandler
 201                     	xref	f_EXTI0_IRQHandler
 202                     	xref	f_RTC_CSSLSE_IRQHandler
 203                     	xref	f_TRAP_IRQHandler
 204                     	xref	f_NonHandledInterrupt
 205                     	xref	__stext
 224                     	end
