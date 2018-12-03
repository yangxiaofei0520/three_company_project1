   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               L3_m_nKeyWuFlg:
   7  0000 00            	dc.b	0
   8  0001               L5_m_nPowrDown:
   9  0001 00            	dc.b	0
  10  0002               L7_m_nWakeUpCnt:
  11  0002 00            	dc.b	0
  12  0003               _m_nDebugFlg:
  13  0003 00            	dc.b	0
 112                     ; 54 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
 112                     ; 55 {
 114                     	switch	.text
 115  0000               _RTC_WakeUpCmd:
 117  0000 88            	push	a
 118  0001 5203          	subw	sp,#3
 119       00000003      OFST:	set	3
 122                     ; 56   ErrorStatus status = ERROR;
 124                     ; 57   uint16_t wutwfcount = 0;
 126  0003 5f            	clrw	x
 127  0004 1f02          	ldw	(OFST-1,sp),x
 128                     ; 60   assert_param(IS_FUNCTIONAL_STATE(NewState));
 130                     ; 63   RTC->WPR = 0xCA;
 132  0006 35ca5159      	mov	20825,#202
 133                     ; 64   RTC->WPR = 0x53;
 135  000a 35535159      	mov	20825,#83
 136                     ; 66   if (NewState != DISABLE)
 138  000e 7b04          	ld	a,(OFST+1,sp)
 139  0010 270d          	jreq	L36
 140                     ; 69     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
 142  0012 72145149      	bset	20809,#2
 143                     ; 71     status = SUCCESS;
 145  0016               LC001:
 147  0016 a601          	ld	a,#1
 149  0018               L56:
 150                     ; 96   RTC->WPR = 0xFF; 
 152  0018 35ff5159      	mov	20825,#255
 153                     ; 99   return (ErrorStatus)status;
 157  001c 5b04          	addw	sp,#4
 158  001e 81            	ret	
 159  001f               L36:
 160                     ; 76     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
 162  001f 72155149      	bres	20809,#2
 164  0023 2003          	jra	L17
 165  0025               L76:
 166                     ; 81       wutwfcount++;
 168  0025 5c            	incw	x
 169  0026 1f02          	ldw	(OFST-1,sp),x
 170  0028               L17:
 171                     ; 79     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 173  0028 7204514c05    	btjt	20812,#2,L57
 175  002d a3ffff        	cpw	x,#65535
 176  0030 26f3          	jrne	L76
 177  0032               L57:
 178                     ; 85     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 180  0032 7204514c04    	btjt	20812,#2,L77
 181                     ; 87       status = ERROR;
 183  0037 a6ff          	ld	a,#255
 185  0039 20dd          	jra	L56
 186  003b               L77:
 187                     ; 91       status = SUCCESS;
 188  003b 20d9          	jp	LC001
 227                     ; 116 void LP_DelayMs(uint32_t dwTime)
 227                     ; 117 {
 228                     	switch	.text
 229  003d               _LP_DelayMs:
 231  003d 5204          	subw	sp,#4
 232       00000004      OFST:	set	4
 235                     ; 118 	int32_t dwCnt = 16000;
 237  003f ae3e80        	ldw	x,#16000
 238  0042 1f03          	ldw	(OFST-1,sp),x
 239  0044 5f            	clrw	x
 240  0045 1f01          	ldw	(OFST-3,sp),x
 242  0047 201a          	jra	L521
 243  0049               L121:
 244                     ; 122 		dwCnt = 16000;
 246  0049 ae3e80        	ldw	x,#16000
 247  004c 1f03          	ldw	(OFST-1,sp),x
 248  004e 5f            	clrw	x
 249  004f 1f01          	ldw	(OFST-3,sp),x
 250  0051               L131:
 251                     ; 125 			dwCnt--;
 253  0051 96            	ldw	x,sp
 254  0052 5c            	incw	x
 255  0053 a601          	ld	a,#1
 256  0055 cd0000        	call	c_lgsbc
 258                     ; 123 		while(0 < dwCnt)
 260  0058 96            	ldw	x,sp
 261  0059 5c            	incw	x
 262  005a cd0000        	call	c_lzmp
 264  005d 2cf2          	jrsgt	L131
 265                     ; 127 		IWDG->KR = IWDG_KEY_REFRESH;
 267  005f 35aa50e0      	mov	20704,#170
 268  0063               L521:
 269                     ; 120 	while(dwTime--)
 271  0063 96            	ldw	x,sp
 272  0064 1c0007        	addw	x,#OFST+3
 273  0067 cd0000        	call	c_ltor
 275  006a 96            	ldw	x,sp
 276  006b 1c0007        	addw	x,#OFST+3
 277  006e a601          	ld	a,#1
 278  0070 cd0000        	call	c_lgsbc
 280  0073 cd0000        	call	c_lrzmp
 282  0076 26d1          	jrne	L121
 283                     ; 129 }
 286  0078 5b04          	addw	sp,#4
 287  007a 81            	ret	
 320                     ; 140 void LP_SetKeyWuFlg(uint8_t nFlg)
 320                     ; 141 {
 321                     	switch	.text
 322  007b               _LP_SetKeyWuFlg:
 326                     ; 142   m_nKeyWuFlg = nFlg;
 328  007b c70000        	ld	L3_m_nKeyWuFlg,a
 329                     ; 143 }
 332  007e 81            	ret	
 356                     ; 154 uint8_t LP_GetKeyWuFlg(void)
 356                     ; 155 {
 357                     	switch	.text
 358  007f               _LP_GetKeyWuFlg:
 362                     ; 156   return m_nKeyWuFlg;
 364  007f c60000        	ld	a,L3_m_nKeyWuFlg
 367  0082 81            	ret	
 393                     ; 168 void LP_GPIO_DefaultConfig(void)
 393                     ; 169 {
 394                     	switch	.text
 395  0083               _LP_GPIO_DefaultConfig:
 399                     ; 170 	LP_DelayMs(10);
 401  0083 ae000a        	ldw	x,#10
 402  0086 89            	pushw	x
 403  0087 5f            	clrw	x
 404  0088 89            	pushw	x
 405  0089 adb2          	call	_LP_DelayMs
 407  008b 5b04          	addw	sp,#4
 408                     ; 173 	GPIOA->DDR = 0xFF;
 410  008d 35ff5002      	mov	20482,#255
 411                     ; 174 	GPIOB->DDR = 0xFF;
 413  0091 35ff5007      	mov	20487,#255
 414                     ; 175 	GPIOC->DDR = 0xFF;
 416  0095 35ff500c      	mov	20492,#255
 417                     ; 176 	GPIOD->DDR = 0xFF;
 419  0099 35ff5011      	mov	20497,#255
 420                     ; 178 	GPIOA->ODR = 0;
 422  009d 725f5000      	clr	20480
 423                     ; 179 	GPIOB->ODR = 0;
 425  00a1 725f5005      	clr	20485
 426                     ; 180 	GPIOC->ODR = 0;
 428  00a5 725f500a      	clr	20490
 429                     ; 181 	GPIOD->ODR = 0;
 431  00a9 725f500f      	clr	20495
 432                     ; 187   	GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_In_FL_IT);// 上拉 输入，内部接入上拉电阻  GPIO_Mode_In_PU_IT
 434  00ad 4b20          	push	#32
 435  00af 4b01          	push	#1
 436  00b1 ae500f        	ldw	x,#20495
 437  00b4 cd0000        	call	_GPIO_Init
 439  00b7 85            	popw	x
 440                     ; 192 }
 443  00b8 81            	ret	
 470                     ; 203 void LP_EXTI_Configuration(void)
 470                     ; 204 {	
 471                     	switch	.text
 472  00b9               _LP_EXTI_Configuration:
 476                     ; 206 	EXTI_SelectPort(WAKE_UP_PORT_EXTI);
 478  00b9 a602          	ld	a,#2
 479  00bb cd0000        	call	_EXTI_SelectPort
 481                     ; 207 	EXTI_SetPinSensitivity(WAKE_UP_PORT_PIN, EXTI_Trigger_Falling);
 483  00be ae0002        	ldw	x,#2
 484  00c1 4f            	clr	a
 485  00c2 95            	ld	xh,a
 486  00c3 cd0000        	call	_EXTI_SetPinSensitivity
 488                     ; 208 	EXTI_ClearITPendingBit(WAKE_UP_EXTIT_PIN);
 490  00c6 ae0001        	ldw	x,#1
 492                     ; 209 }
 495  00c9 cc0000        	jp	_EXTI_ClearITPendingBit
 518                     ; 220 void LP_TermReset(void)
 518                     ; 221 {
 519                     	switch	.text
 520  00cc               _LP_TermReset:
 524                     ; 222 	WWDG->WR = WWDG_WR_RESET_VALUE;
 526  00cc 357f50d4      	mov	20692,#127
 527                     ; 223 	WWDG->CR = (uint8_t)(WWDG_CR_WDGA | COUNTER_INIT);
 529  00d0 35e850d3      	mov	20691,#232
 530                     ; 224 	WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WINDOW_VALUE);
 532  00d4 356150d4      	mov	20692,#97
 533  00d8               L312:
 534                     ; 225 	while (1);
 536  00d8 20fe          	jra	L312
 560                     ; 237 int32_t LP_TimeDeInit(void)
 560                     ; 238 {
 561                     	switch	.text
 562  00da               _LP_TimeDeInit:
 566                     ; 239 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 568  00da 5f            	clrw	x
 569  00db a611          	ld	a,#17
 570  00dd 95            	ld	xh,a
 571  00de cd0000        	call	_CLK_PeripheralClockConfig
 573                     ; 240 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 575  00e1 5f            	clrw	x
 576  00e2 a602          	ld	a,#2
 577  00e4 95            	ld	xh,a
 578  00e5 cd0000        	call	_CLK_PeripheralClockConfig
 580                     ; 242 	TIM1->CR1  = TIM1_CR1_RESET_VALUE;
 582  00e8 725f52b0      	clr	21168
 583                     ; 243 	TIM1->CR2  = TIM1_CR2_RESET_VALUE;
 585  00ec 725f52b1      	clr	21169
 586                     ; 244 	TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
 588  00f0 725f52b2      	clr	21170
 589                     ; 245 	TIM1->ETR  = TIM1_ETR_RESET_VALUE;
 591  00f4 725f52b3      	clr	21171
 592                     ; 246 	TIM1->IER  = TIM1_IER_RESET_VALUE;
 594  00f8 725f52b5      	clr	21173
 595                     ; 249 	TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 597  00fc 725f52bd      	clr	21181
 598                     ; 250 	TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 600  0100 725f52be      	clr	21182
 601                     ; 252 	TIM1->CCMR1 = 0x01;
 603  0104 350152b9      	mov	21177,#1
 604                     ; 253 	TIM1->CCMR2 = 0x01;
 606  0108 350152ba      	mov	21178,#1
 607                     ; 254 	TIM1->CCMR3 = 0x01;
 609  010c 350152bb      	mov	21179,#1
 610                     ; 255 	TIM1->CCMR4 = 0x01;
 612  0110 350152bc      	mov	21180,#1
 613                     ; 257 	TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 615  0114 725f52bd      	clr	21181
 616                     ; 258 	TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 618  0118 725f52be      	clr	21182
 619                     ; 259 	TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 621  011c 725f52b9      	clr	21177
 622                     ; 260 	TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 624  0120 725f52ba      	clr	21178
 625                     ; 261 	TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 627  0124 725f52bb      	clr	21179
 628                     ; 262 	TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 630  0128 725f52bc      	clr	21180
 631                     ; 263 	TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 633  012c 725f52bf      	clr	21183
 634                     ; 264 	TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 636  0130 725f52c0      	clr	21184
 637                     ; 265 	TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 639  0134 725f52c1      	clr	21185
 640                     ; 266 	TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 642  0138 725f52c2      	clr	21186
 643                     ; 267 	TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 645  013c 35ff52c3      	mov	21187,#255
 646                     ; 268 	TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 648  0140 35ff52c4      	mov	21188,#255
 649                     ; 269 	TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 651  0144 725f52c6      	clr	21190
 652                     ; 270 	TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 654  0148 725f52c7      	clr	21191
 655                     ; 271 	TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 657  014c 725f52c8      	clr	21192
 658                     ; 272 	TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 660  0150 725f52c9      	clr	21193
 661                     ; 273 	TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 663  0154 725f52ca      	clr	21194
 664                     ; 274 	TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 666  0158 725f52cb      	clr	21195
 667                     ; 275 	TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 669  015c 725f52cc      	clr	21196
 670                     ; 276 	TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 672  0160 725f52cd      	clr	21197
 673                     ; 277 	TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 675  0164 725f52d0      	clr	21200
 676                     ; 278 	TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 678  0168 350152b8      	mov	21176,#1
 679                     ; 279 	TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 681  016c 725f52cf      	clr	21199
 682                     ; 280 	TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 684  0170 725f52ce      	clr	21198
 685                     ; 281 	TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 687  0174 725f52c5      	clr	21189
 688                     ; 282 	TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 690  0178 725f52b6      	clr	21174
 691                     ; 283 	TIM1->SR2   = TIM1_SR2_RESET_VALUE;	
 693  017c 725f52b7      	clr	21175
 694                     ; 285 	TIM4->CR1	= TIM4_CR1_RESET_VALUE;
 696  0180 725f52e0      	clr	21216
 697                     ; 286 	TIM4->CR2	= TIM4_CR2_RESET_VALUE;
 699  0184 725f52e1      	clr	21217
 700                     ; 287 	TIM4->SMCR	 = TIM4_SMCR_RESET_VALUE;
 702  0188 725f52e2      	clr	21218
 703                     ; 288 	TIM4->IER	= TIM4_IER_RESET_VALUE;
 705  018c 725f52e4      	clr	21220
 706                     ; 289 	TIM4->CNTR	 = TIM4_CNTR_RESET_VALUE;
 708  0190 725f52e7      	clr	21223
 709                     ; 290 	TIM4->PSCR	= TIM4_PSCR_RESET_VALUE;
 711  0194 725f52e8      	clr	21224
 712                     ; 291 	TIM4->ARR	= TIM4_ARR_RESET_VALUE;
 714  0198 35ff52e9      	mov	21225,#255
 715                     ; 292 	TIM4->SR1	= TIM4_SR1_RESET_VALUE;
 717  019c 725f52e5      	clr	21221
 718                     ; 294 	return (SUCCESS);
 720  01a0 ae0001        	ldw	x,#1
 721  01a3 bf02          	ldw	c_lreg+2,x
 722  01a5 5f            	clrw	x
 723  01a6 bf00          	ldw	c_lreg,x
 726  01a8 81            	ret	
 751                     ; 306 int32_t  LP_UART_DeInit(void)
 751                     ; 307 {
 752                     	switch	.text
 753  01a9               _LP_UART_DeInit:
 757                     ; 308 	TurnBusUartOff();
 759  01a9 cd0000        	call	_TurnBusUartOff
 761                     ; 309 	(void) USART1->SR;
 763  01ac c65230        	ld	a,21040
 764                     ; 310 	(void) USART1->DR;
 766  01af c65231        	ld	a,21041
 767                     ; 312 	USART1->BRR2 = USART_BRR2_RESET_VALUE;	/* Set USART_BRR2 to reset value 0x00 */
 769  01b2 725f5233      	clr	21043
 770                     ; 313 	USART1->BRR1 = USART_BRR1_RESET_VALUE;	/* Set USART_BRR1 to reset value 0x00 */
 772  01b6 725f5232      	clr	21042
 773                     ; 315 	USART1->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 775  01ba 725f5234      	clr	21044
 776                     ; 316 	USART1->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 778  01be 725f5235      	clr	21045
 779                     ; 317 	USART1->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 781  01c2 725f5236      	clr	21046
 782                     ; 318 	USART1->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 784  01c6 725f5237      	clr	21047
 785                     ; 320 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
 787  01ca 5f            	clrw	x
 788  01cb a605          	ld	a,#5
 789  01cd 95            	ld	xh,a
 790  01ce cd0000        	call	_CLK_PeripheralClockConfig
 792                     ; 322 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 794  01d1 5f            	clrw	x
 795  01d2 a611          	ld	a,#17
 796  01d4 95            	ld	xh,a
 797  01d5 cd0000        	call	_CLK_PeripheralClockConfig
 799                     ; 323 	return (SUCCESS);
 801  01d8 ae0001        	ldw	x,#1
 802  01db bf02          	ldw	c_lreg+2,x
 803  01dd 5f            	clrw	x
 804  01de bf00          	ldw	c_lreg,x
 807  01e0 81            	ret	
 831                     ; 335 int32_t  LP_ADC_DeInit(void)
 831                     ; 336 {
 832                     	switch	.text
 833  01e1               _LP_ADC_DeInit:
 837                     ; 339     ADC1->CR1 &= (uint8_t)~ADC_CR1_ADON;
 839  01e1 72115340      	bres	21312,#0
 840                     ; 342 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 842  01e5 5f            	clrw	x
 843  01e6 a610          	ld	a,#16
 844  01e8 95            	ld	xh,a
 845  01e9 cd0000        	call	_CLK_PeripheralClockConfig
 847                     ; 344 	return (SUCCESS);
 849  01ec ae0001        	ldw	x,#1
 850  01ef bf02          	ldw	c_lreg+2,x
 851  01f1 5f            	clrw	x
 852  01f2 bf00          	ldw	c_lreg,x
 855  01f4 81            	ret	
 882                     ; 356 void  LP_BSP_DeInit(void)
 882                     ; 357 {	
 883                     	switch	.text
 884  01f5               _LP_BSP_DeInit:
 888                     ; 359 	LP_ADC_DeInit();
 890  01f5 adea          	call	_LP_ADC_DeInit
 892                     ; 362 	LP_UART_DeInit(); 
 894  01f7 adb0          	call	_LP_UART_DeInit
 896                     ; 365 	LP_TimeDeInit();
 898  01f9 cd00da        	call	_LP_TimeDeInit
 900                     ; 368 	LP_GPIO_DefaultConfig();
 903                     ; 369 }
 906  01fc cc0083        	jp	_LP_GPIO_DefaultConfig
1100                     .const:	section	.text
1101  0000               L401:
1102  0000 00000003      	dc.l	3
1103                     ; 380 uint8_t LP_CalReportGatherTime(void)
1103                     ; 381 {
1104                     	switch	.text
1105  01ff               _LP_CalReportGatherTime:
1107  01ff 521f          	subw	sp,#31
1108       0000001f      OFST:	set	31
1111                     ; 382 	uint16_t wCount = 0, wTmp = 0;
1113  0201 5f            	clrw	x
1114  0202 1f01          	ldw	(OFST-30,sp),x
1117  0204 1f03          	ldw	(OFST-28,sp),x
1118                     ; 383 	int32_t  dwWorkTime = 0;
1120  0206 1f07          	ldw	(OFST-24,sp),x
1121  0208 1f05          	ldw	(OFST-26,sp),x
1122                     ; 388 	STM8_RTC_Get(&stTimeNow);	
1124  020a 96            	ldw	x,sp
1125  020b 1c0019        	addw	x,#OFST-6
1126  020e cd0000        	call	_STM8_RTC_Get
1128                     ; 389 	TM_TimeChangeAToB(&stTimeNow, &stRepTimeEnd);
1130  0211 96            	ldw	x,sp
1131  0212 1c0009        	addw	x,#OFST-22
1132  0215 89            	pushw	x
1133  0216 1c0010        	addw	x,#16
1134  0219 cd0000        	call	_TM_TimeChangeAToB
1136  021c 85            	popw	x
1137                     ; 391 	TM_TimeChangeAToB(&g_stPowrOnTime, &stStarTime);
1139  021d 96            	ldw	x,sp
1140  021e 1c0011        	addw	x,#OFST-14
1141  0221 89            	pushw	x
1142  0222 ae000e        	ldw	x,#_g_stPowrOnTime
1143  0225 cd0000        	call	_TM_TimeChangeAToB
1145  0228 85            	popw	x
1146                     ; 392 	dwWorkTime = TM_DiffSecond(&stStarTime, &stRepTimeEnd);
1148  0229 96            	ldw	x,sp
1149  022a 1c0009        	addw	x,#OFST-22
1150  022d 89            	pushw	x
1151  022e 1c0008        	addw	x,#8
1152  0231 cd0000        	call	_TM_DiffSecond
1154  0234 85            	popw	x
1155  0235 96            	ldw	x,sp
1156  0236 1c0005        	addw	x,#OFST-26
1157  0239 cd0000        	call	c_rtol
1159                     ; 393 	MemcpyFunc((u8*)&g_stPowrOnTime, (u8*)&stTimeNow, sizeof(g_stPowrOnTime));;
1161  023c 4b07          	push	#7
1162  023e 96            	ldw	x,sp
1163  023f 1c001a        	addw	x,#OFST-5
1164  0242 89            	pushw	x
1165  0243 ae000e        	ldw	x,#_g_stPowrOnTime
1166  0246 cd0000        	call	_MemcpyFunc
1168  0249 5b03          	addw	sp,#3
1169                     ; 395 	if(dwWorkTime < LP_KEYWU_TO)
1172  024b 96            	ldw	x,sp
1173  024c 1c0005        	addw	x,#OFST-26
1174  024f cd0000        	call	c_ltor
1176  0252 ae0000        	ldw	x,#L401
1177  0255 cd0000        	call	c_lcmp
1179  0258 2e04          	jrsge	L753
1180                     ; 397 		return TRUE;
1182  025a a601          	ld	a,#1
1184  025c 2001          	jra	L601
1185  025e               L753:
1186                     ; 400 	return FALSE;
1188  025e 4f            	clr	a
1190  025f               L601:
1192  025f 5b1f          	addw	sp,#31
1193  0261 81            	ret	
1218                     ; 412 void LP_RTC_Config(void)
1218                     ; 413 { 
1219                     	switch	.text
1220  0262               _LP_RTC_Config:
1224                     ; 417 	RTC->WPR = 0xCA;
1226  0262 35ca5159      	mov	20825,#202
1227                     ; 418 	RTC->WPR = 0x53;	
1229  0266 35535159      	mov	20825,#83
1230                     ; 420 	RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;	
1232  026a 72155149      	bres	20809,#2
1233                     ; 422 	RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;	
1235  026e c65148        	ld	a,20808
1236  0271 a4f8          	and	a,#248
1237  0273 c75148        	ld	20808,a
1238                     ; 424 	RTC->CR1 |= (uint8_t)RTC_WakeUpClock_RTCCLK_Div16;	
1240  0276 c65148        	ld	a,20808
1241                     ; 426 	RTC->WPR = 0xFF;
1243  0279 35ff5159      	mov	20825,#255
1244                     ; 428 	RTC_WaitForSynchro();
1246  027d cd0000        	call	_RTC_WaitForSynchro
1248                     ; 433 	RTC->WPR = 0xCA;
1250  0280 35ca5159      	mov	20825,#202
1251                     ; 434 	RTC->WPR = 0x53;	
1253  0284 35535159      	mov	20825,#83
1254                     ; 436 	RTC->WUTRH = (uint8_t)(2047 >> 8);
1256  0288 35075154      	mov	20820,#7
1257                     ; 437 	RTC->WUTRL = (uint8_t)(2047);	
1259  028c 35ff5155      	mov	20821,#255
1260                     ; 439 	RTC->WPR = 0xFF;
1262  0290 35ff5159      	mov	20825,#255
1263                     ; 441 	RTC_WakeUpCmd(DISABLE);
1265  0294 4f            	clr	a
1266  0295 cd0000        	call	_RTC_WakeUpCmd
1268                     ; 446 	RTC->WPR = 0xCA;
1270  0298 35ca5159      	mov	20825,#202
1271                     ; 447 	RTC->WPR = 0x53;	
1273  029c 35535159      	mov	20825,#83
1274                     ; 449 	RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT_WUT & (uint16_t)0x00F0);
1276  02a0 721c5149      	bset	20809,#6
1277                     ; 450 	RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT_WUT & RTC_TCR1_TAMPIE);
1279  02a4 c6516c        	ld	a,20844
1280                     ; 453 	RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT_WUT >> 4);
1282  02a7 35fb514d      	mov	20813,#251
1283                     ; 454 }
1286  02ab 81            	ret	
1320                     ; 465 void LP_SetLowPwrStartFlg(u8 nFlg)
1320                     ; 466 { 
1321                     	switch	.text
1322  02ac               _LP_SetLowPwrStartFlg:
1326                     ; 467 	m_nPowrDown |= (1<<nFlg);
1328  02ac 5f            	clrw	x
1329  02ad 97            	ld	xl,a
1330  02ae a601          	ld	a,#1
1331  02b0 5d            	tnzw	x
1332  02b1 2704          	jreq	L021
1333  02b3               L221:
1334  02b3 48            	sll	a
1335  02b4 5a            	decw	x
1336  02b5 26fc          	jrne	L221
1337  02b7               L021:
1338  02b7 ca0001        	or	a,L5_m_nPowrDown
1339  02ba c70001        	ld	L5_m_nPowrDown,a
1340                     ; 468 }
1343  02bd 81            	ret	
1377                     ; 479 void LP_ClrLowPwrStartFlg(u8 nFlg)
1377                     ; 480 { 
1378                     	switch	.text
1379  02be               _LP_ClrLowPwrStartFlg:
1383                     ; 481 	m_nPowrDown &= (~(1<<nFlg));
1385  02be 5f            	clrw	x
1386  02bf 97            	ld	xl,a
1387  02c0 a601          	ld	a,#1
1388  02c2 5d            	tnzw	x
1389  02c3 2704          	jreq	L621
1390  02c5               L031:
1391  02c5 48            	sll	a
1392  02c6 5a            	decw	x
1393  02c7 26fc          	jrne	L031
1394  02c9               L621:
1395  02c9 43            	cpl	a
1396  02ca c40001        	and	a,L5_m_nPowrDown
1397  02cd c70001        	ld	L5_m_nPowrDown,a
1398                     ; 482 }
1401  02d0 81            	ret	
1461                     ; 493 void LP_ExitWakeUpProc(void)
1461                     ; 494 { 
1462                     	switch	.text
1463  02d1               _LP_ExitWakeUpProc:
1465  02d1 5214          	subw	sp,#20
1466       00000014      OFST:	set	20
1469                     ; 495 	int32_t  dwWorkTime = 0;
1471  02d3 5f            	clrw	x
1472  02d4 1f0b          	ldw	(OFST-9,sp),x
1473  02d6 1f09          	ldw	(OFST-11,sp),x
1474                     ; 499 	STM8_RTC_Get(&stTimeNow);		
1476  02d8 ae0000        	ldw	x,#_stTimeNow
1477  02db cd0000        	call	_STM8_RTC_Get
1479                     ; 500 	TM_TimeChangeAToB(&stTimeNow, &stRepTimeEnd);	
1481  02de 96            	ldw	x,sp
1482  02df 1c000d        	addw	x,#OFST-7
1483  02e2 89            	pushw	x
1484  02e3 ae0000        	ldw	x,#_stTimeNow
1485  02e6 cd0000        	call	_TM_TimeChangeAToB
1487  02e9 85            	popw	x
1488                     ; 501 	TM_TimeChangeAToB(&g_stPowrOnTime, &stStarTime);
1490  02ea 96            	ldw	x,sp
1491  02eb 5c            	incw	x
1492  02ec 89            	pushw	x
1493  02ed ae000e        	ldw	x,#_g_stPowrOnTime
1494  02f0 cd0000        	call	_TM_TimeChangeAToB
1496  02f3 85            	popw	x
1497                     ; 502 	dwWorkTime = TM_DiffSecond(&stStarTime, &stRepTimeEnd);
1499  02f4 96            	ldw	x,sp
1500  02f5 1c000d        	addw	x,#OFST-7
1501  02f8 89            	pushw	x
1502  02f9 1d000c        	subw	x,#12
1503  02fc cd0000        	call	_TM_DiffSecond
1505  02ff 85            	popw	x
1506  0300 96            	ldw	x,sp
1507  0301 1c0009        	addw	x,#OFST-11
1508  0304 cd0000        	call	c_rtol
1510                     ; 503 	MemcpyFunc((u8*)&g_stPowrOnTime, (u8*)&stTimeNow, sizeof(g_stPowrOnTime));
1512  0307 4b07          	push	#7
1513  0309 ae0000        	ldw	x,#_stTimeNow
1514  030c 89            	pushw	x
1515  030d ae000e        	ldw	x,#_g_stPowrOnTime
1516  0310 cd0000        	call	_MemcpyFunc
1518  0313 5b03          	addw	sp,#3
1519                     ; 505 	if((0 == (m_nWakeUpCnt))||(LP_KEYWU_TO <= dwWorkTime))
1521  0315 c60002        	ld	a,L7_m_nWakeUpCnt
1522  0318 2705          	jreq	L744
1524  031a 96            	ldw	x,sp
1525  031b ad23          	call	LC002
1527  031d 2f15          	jrslt	L544
1528  031f               L744:
1529                     ; 507 		m_nWakeUpCnt = 1;
1531  031f 35010002      	mov	L7_m_nWakeUpCnt,#1
1532                     ; 508 		MemcpyFunc((u8*)&m_stStartTime, (u8*)&stRepTimeEnd, sizeof(m_stStartTime));
1534  0323 4b08          	push	#8
1535  0325 96            	ldw	x,sp
1536  0326 1c000e        	addw	x,#OFST-6
1537  0329 89            	pushw	x
1538  032a ae0015        	ldw	x,#_m_stStartTime
1539  032d cd0000        	call	_MemcpyFunc
1541  0330 5b03          	addw	sp,#3
1542                     ; 509 		return ;
1544  0332 2009          	jra	L154
1545  0334               L544:
1546                     ; 512 	if(dwWorkTime < LP_KEYWU_TO)
1548  0334 96            	ldw	x,sp
1549  0335 ad09          	call	LC002
1551  0337 2e04          	jrsge	L154
1552                     ; 514 		m_nWakeUpCnt++;
1554  0339 725c0002      	inc	L7_m_nWakeUpCnt
1555  033d               L154:
1556                     ; 517 	return ;	
1559  033d 5b14          	addw	sp,#20
1560  033f 81            	ret	
1562  0340               LC002:
1563  0340 1c0009        	addw	x,#OFST-11
1564  0343 cd0000        	call	c_ltor
1566  0346 ae0000        	ldw	x,#L401
1567  0349 cc0000        	jp	c_lcmp
1605                     ; 529 u8 LP_ClaReportTime(void)
1605                     ; 530 { 
1606                     	switch	.text
1607  034c               _LP_ClaReportTime:
1609  034c 5207          	subw	sp,#7
1610       00000007      OFST:	set	7
1613                     ; 534 	STM8_RTC_Get(&stTime);
1615  034e 96            	ldw	x,sp
1616  034f 5c            	incw	x
1617  0350 cd0000        	call	_STM8_RTC_Get
1619                     ; 537 	if((g_stNextRepTime.nDay == stTime.nDay)&&(g_stNextRepTime.nHour == stTime.nHour)
1619                     ; 538 		&&(g_stNextRepTime.nMinute == stTime.nMinute))
1621  0353 c60009        	ld	a,_g_stNextRepTime+2
1622  0356 1103          	cp	a,(OFST-4,sp)
1623  0358 260e          	jrne	L174
1625  035a c6000a        	ld	a,_g_stNextRepTime+3
1626  035d 1104          	cp	a,(OFST-3,sp)
1627  035f 2607          	jrne	L174
1629  0361 c6000b        	ld	a,_g_stNextRepTime+4
1630  0364 1105          	cp	a,(OFST-2,sp)
1631                     ; 540 		return TRUE;
1633  0366 2715          	jreq	LC003
1634  0368               L174:
1635                     ; 544 	if((g_stNextGmTime.nDay == stTime.nDay)
1635                     ; 545 		&&(g_stNextGmTime.nHour == stTime.nHour)&&(g_stNextGmTime.nMinute == stTime.nMinute))
1637  0368 c60002        	ld	a,_g_stNextGmTime+2
1638  036b 1103          	cp	a,(OFST-4,sp)
1639  036d 2613          	jrne	L374
1641  036f c60003        	ld	a,_g_stNextGmTime+3
1642  0372 1104          	cp	a,(OFST-3,sp)
1643  0374 260c          	jrne	L374
1645  0376 c60004        	ld	a,_g_stNextGmTime+4
1646  0379 1105          	cp	a,(OFST-2,sp)
1647  037b 2605          	jrne	L374
1648                     ; 547 		return TRUE;
1650  037d               LC003:
1653  037d a601          	ld	a,#1
1655  037f               L651:
1657  037f 5b07          	addw	sp,#7
1658  0381 81            	ret	
1659  0382               L374:
1660                     ; 552 	if((CTL_VAVLE_ENABLE == stOptValve.nOptFlg)
1660                     ; 553 		&&(((0 != stOptValve.nVavleCycle)&&(stOptValve.nDay == stTime.nDay)&&(stOptValve.nMonth == stTime.nMonth))
1660                     ; 554 		||((0 == stOptValve.nVavleCycle)&&((0x01 == stTime.nDay)||(0x15 == stTime.nDay))))
1660                     ; 555 		&&(stOptValve.nStartHour <= stTime.nHour)&&(stOptValve.nEndHour >= stTime.nHour))
1662  0382 c60001        	ld	a,_stOptValve+1
1663  0385 a1aa          	cp	a,#170
1664  0387 2630          	jrne	L574
1666  0389 c60009        	ld	a,_stOptValve+9
1667  038c 270e          	jreq	L105
1669  038e c60004        	ld	a,_stOptValve+4
1670  0391 1103          	cp	a,(OFST-4,sp)
1671  0393 2607          	jrne	L105
1673  0395 c60003        	ld	a,_stOptValve+3
1674  0398 1102          	cp	a,(OFST-5,sp)
1675  039a 270f          	jreq	L774
1676  039c               L105:
1678  039c c60009        	ld	a,_stOptValve+9
1679  039f 2618          	jrne	L574
1681  03a1 7b03          	ld	a,(OFST-4,sp)
1682  03a3 a101          	cp	a,#1
1683  03a5 2704          	jreq	L774
1685  03a7 a115          	cp	a,#21
1686  03a9 260e          	jrne	L574
1687  03ab               L774:
1689  03ab c60005        	ld	a,_stOptValve+5
1690  03ae 1104          	cp	a,(OFST-3,sp)
1691  03b0 2207          	jrugt	L574
1693  03b2 c60006        	ld	a,_stOptValve+6
1694  03b5 1104          	cp	a,(OFST-3,sp)
1695                     ; 557 		return TRUE;
1697  03b7 24c4          	jruge	LC003
1698  03b9               L574:
1699                     ; 560 	return FALSE;	
1701  03b9 4f            	clr	a
1703  03ba 20c3          	jra	L651
1742                     ; 572 void LP_WakeUpTerm(void)
1742                     ; 573 {
1743                     	switch	.text
1744  03bc               _LP_WakeUpTerm:
1746  03bc 88            	push	a
1747       00000001      OFST:	set	1
1750                     ; 574 	u8 nRepFlg = 0;
1752  03bd 0f01          	clr	(OFST+0,sp)
1753                     ; 576 	InitializeBase();
1755  03bf cd0000        	call	_InitializeBase
1757                     ; 577 	InitializeFile();
1759  03c2 cd0000        	call	_InitializeFile
1761                     ; 578 	nRepFlg = ReadReportFlag();
1763  03c5 cd0000        	call	_ReadReportFlag
1765  03c8 6b01          	ld	(OFST+0,sp),a
1766                     ; 579 	SaveReportFlag((nRepFlg|KEY_WUAKEUP_FLG));		
1768  03ca aa01          	or	a,#1
1769  03cc cd0000        	call	_SaveReportFlag
1771                     ; 580 	SetIO_LEDOn();
1773  03cf 4b01          	push	#1
1774  03d1 4b04          	push	#4
1775  03d3 ae5005        	ldw	x,#20485
1776  03d6 cd0000        	call	_GPIO_WriteBit
1778  03d9 85            	popw	x
1779                     ; 581 	LP_DelayMs(100);	
1781  03da ae0064        	ldw	x,#100
1782  03dd 89            	pushw	x
1783  03de 5f            	clrw	x
1784  03df 89            	pushw	x
1785  03e0 cd003d        	call	_LP_DelayMs
1787  03e3 5b04          	addw	sp,#4
1788                     ; 582 	LP_TermReset();
1790  03e5 cd00cc        	call	_LP_TermReset
1792                     ; 583 	return ;
1795  03e8 84            	pop	a
1796  03e9 81            	ret	
1820                     ; 595 u8 LP_CheckGuardKeyStat(void)
1820                     ; 596 { 	
1821                     	switch	.text
1822  03ea               _LP_CheckGuardKeyStat:
1826                     ; 619 	return FALSE;		
1828  03ea 4f            	clr	a
1831  03eb 81            	ret	
1918                     ; 631 void LP_LowPowerManage(void)
1918                     ; 632 {
1919                     	switch	.text
1920  03ec               _LP_LowPowerManage:
1922  03ec 5215          	subw	sp,#21
1923       00000015      OFST:	set	21
1926                     ; 633 	uint32_t dwCount = 0, dwCntTimeOut = LP_WAKEUP_TO;
1928  03ee 5f            	clrw	x
1929  03ef 1f08          	ldw	(OFST-13,sp),x
1930  03f1 1f06          	ldw	(OFST-15,sp),x
1933  03f3 96            	ldw	x,sp
1934  03f4 1c0002        	addw	x,#OFST-19
1935  03f7 cd0000        	call	c_ltor
1937                     ; 634 	int32_t  dwTickOffset = 0;
1939  03fa 96            	ldw	x,sp
1940  03fb 1c0012        	addw	x,#OFST-3
1941  03fe cd0000        	call	c_ltor
1943                     ; 635 	u8 nRepFlg = 0;	
1945  0401 0f01          	clr	(OFST-20,sp)
1946                     ; 639 	if(LP_START_FLG_OK != m_nPowrDown)
1948  0403 c60001        	ld	a,L5_m_nPowrDown
1949  0406 a103          	cp	a,#3
1950  0408 2665          	jrne	L232
1951                     ; 641 		return ;
1953                     ; 648 	dwCntTimeOut = LP_130_CalReportConut();
1955  040a ad72          	call	_LP_130_CalReportConut
1957  040c 96            	ldw	x,sp
1958  040d 1c0002        	addw	x,#OFST-19
1959  0410 cd0000        	call	c_rtol
1961                     ; 651 	LP_DelayMs(10);
1963  0413 ae000a        	ldw	x,#10
1964  0416 89            	pushw	x
1965  0417 5f            	clrw	x
1966  0418 89            	pushw	x
1967  0419 cd003d        	call	_LP_DelayMs
1969  041c 5b04          	addw	sp,#4
1970                     ; 654 	IWDG->KR = IWDG_KEY_REFRESH;
1972  041e 35aa50e0      	mov	20704,#170
1973                     ; 656 	LP_BSP_DeInit();
1975  0422 cd01f5        	call	_LP_BSP_DeInit
1977                     ; 659 	LP_EXTI_Configuration();
1979  0425 cd00b9        	call	_LP_EXTI_Configuration
1981                     ; 662 	LP_RTC_Config(); //edit by maronglang 20150609
1983  0428 cd0262        	call	_LP_RTC_Config
1985  042b               L365:
1986                     ; 667 		IWDG->KR = IWDG_KEY_REFRESH;
1988  042b 35aa50e0      	mov	20704,#170
1989                     ; 670 		RTC_WakeUpCmd(ENABLE); 	//edit by maronglang
1991  042f a601          	ld	a,#1
1992  0431 cd0000        	call	_RTC_WakeUpCmd
1994                     ; 673 		PWR->CSR2 = 0x2;
1996  0434 350250b3      	mov	20659,#2
1997                     ; 676 		halt();
2000  0438 8e            	halt	
2002                     ; 677 		nop();
2006  0439 9d            	nop	
2008                     ; 678 		nop();
2012  043a 9d            	nop	
2014                     ; 679 		nop();
2018  043b 9d            	nop	
2020                     ; 680 		nop();
2024  043c 9d            	nop	
2026                     ; 681 		nop();
2030  043d 9d            	nop	
2032                     ; 683 		RTC_WakeUpCmd(DISABLE); 		
2035  043e 4f            	clr	a
2036  043f cd0000        	call	_RTC_WakeUpCmd
2038                     ; 685 		if(WU_MODE_KEY == m_nKeyWuFlg)
2040  0442 c60000        	ld	a,L3_m_nKeyWuFlg
2041  0445 4a            	dec	a
2042  0446 2605          	jrne	L765
2043                     ; 687 			LP_ExitWakeUpProc();
2045  0448 cd02d1        	call	_LP_ExitWakeUpProc
2048  044b 2025          	jra	L175
2049  044d               L765:
2050                     ; 701 			dwCount++;
2052  044d 96            	ldw	x,sp
2053  044e 1c0006        	addw	x,#OFST-15
2054  0451 a601          	ld	a,#1
2055  0453 cd0000        	call	c_lgadc
2057                     ; 704 			if((dwCount >= dwCntTimeOut)||(LP_ClaReportTime()))
2059  0456 96            	ldw	x,sp
2060  0457 1c0006        	addw	x,#OFST-15
2061  045a cd0000        	call	c_ltor
2063  045d 96            	ldw	x,sp
2064  045e 1c0002        	addw	x,#OFST-19
2065  0461 cd0000        	call	c_lcmp
2067  0464 2406          	jruge	L575
2069  0466 cd034c        	call	_LP_ClaReportTime
2071  0469 4d            	tnz	a
2072  046a 2706          	jreq	L175
2073  046c               L575:
2074                     ; 706 				LP_TermReset();
2076  046c cd00cc        	call	_LP_TermReset
2078                     ; 707 				return ;
2079  046f               L232:
2082  046f 5b15          	addw	sp,#21
2083  0471 81            	ret	
2084  0472               L175:
2085                     ; 712 		if(3 <= m_nWakeUpCnt)
2087  0472 c60002        	ld	a,L7_m_nWakeUpCnt
2088  0475 a103          	cp	a,#3
2089  0477 25b2          	jrult	L365
2090                     ; 715 			LP_WakeUpTerm();
2092  0479 cd03bc        	call	_LP_WakeUpTerm
2094                     ; 716 			return ;
2096  047c 20f1          	jra	L232
2223                     	switch	.const
2224  0004               L062:
2225  0004 0000003c      	dc.l	60
2226                     ; 1031 uint32_t LP_130_CalReportConut(void)
2226                     ; 1032 {
2227                     	switch	.text
2228  047e               _LP_130_CalReportConut:
2230  047e 5236          	subw	sp,#54
2231       00000036      OFST:	set	54
2234                     ; 1033 	uint32_t dwTmp = 0, dwCount = 0;
2236  0480 96            	ldw	x,sp
2237  0481 1c002b        	addw	x,#OFST-11
2238  0484 cd0000        	call	c_ltor
2242  0487 96            	ldw	x,sp
2243  0488 1c002b        	addw	x,#OFST-11
2244  048b cd0000        	call	c_ltor
2246                     ; 1034 	int32_t  dwOffset = 0,dwTemp = 0;
2248  048e 96            	ldw	x,sp
2249  048f 1c001f        	addw	x,#OFST-23
2250  0492 cd0000        	call	c_ltor
2254  0495 96            	ldw	x,sp
2255  0496 1c002b        	addw	x,#OFST-11
2256  0499 cd0000        	call	c_ltor
2258                     ; 1036 	u8       nRepFlg = 0;
2260                     ; 1042 	MemcpyFunc((u8*)&tyTime, (u8*)&tyReport.Time, sizeof(TypeTime));
2262  049c 4b06          	push	#6
2263  049e ae0004        	ldw	x,#_tyReport+4
2264  04a1 89            	pushw	x
2265  04a2 ae0000        	ldw	x,#_tyTime
2266  04a5 cd0000        	call	_MemcpyFunc
2268  04a8 5b03          	addw	sp,#3
2269                     ; 1043 	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
2271  04aa ae0000        	ldw	x,#_tyTime
2272  04ad 89            	pushw	x
2273  04ae ae0006        	ldw	x,#6
2274  04b1 cd0000        	call	_JX_BL_Change
2276  04b4 85            	popw	x
2277                     ; 1044 	MemcpyFunc((u8*)&stLastTime, (u8*)&tyTime, sizeof(TypeTime));
2279  04b5 4b06          	push	#6
2280  04b7 ae0000        	ldw	x,#_tyTime
2281  04ba 89            	pushw	x
2282  04bb 96            	ldw	x,sp
2283  04bc 1c001a        	addw	x,#OFST-28
2284  04bf cd0000        	call	_MemcpyFunc
2286  04c2 5b03          	addw	sp,#3
2287                     ; 1045 	STM8_RTC_Get(&stTimeNow);
2289  04c4 ae0000        	ldw	x,#_stTimeNow
2290  04c7 cd0000        	call	_STM8_RTC_Get
2292                     ; 1046 	TM_TimeChangeAToB(&stTimeNow, &stEnd);
2294  04ca 96            	ldw	x,sp
2295  04cb 1c0023        	addw	x,#OFST-19
2296  04ce 89            	pushw	x
2297  04cf ae0000        	ldw	x,#_stTimeNow
2298  04d2 cd0000        	call	_TM_TimeChangeAToB
2300  04d5 85            	popw	x
2301                     ; 1047 	TM_TimeChangeAToB(&stLastTime, &stStar);
2303  04d6 96            	ldw	x,sp
2304  04d7 1c000f        	addw	x,#OFST-39
2305  04da 89            	pushw	x
2306  04db 1c0008        	addw	x,#8
2307  04de cd0000        	call	_TM_TimeChangeAToB
2309  04e1 85            	popw	x
2310                     ; 1048 	dwOffset = TM_DiffSecond(&stStar, &stEnd);	
2312  04e2 96            	ldw	x,sp
2313  04e3 1c0023        	addw	x,#OFST-19
2314  04e6 89            	pushw	x
2315  04e7 1d0014        	subw	x,#20
2316  04ea cd0000        	call	_TM_DiffSecond
2318  04ed 85            	popw	x
2319  04ee 96            	ldw	x,sp
2320  04ef 1c001f        	addw	x,#OFST-23
2321  04f2 cd0000        	call	c_rtol
2323                     ; 1049 	stEnd.nSecond = 0;	
2325  04f5 0f29          	clr	(OFST-13,sp)
2326                     ; 1050 	MemcpyFunc((u8*)&stTmpTime,  (u8*)&stEnd, sizeof(stTmpTime));
2328  04f7 4b08          	push	#8
2329  04f9 96            	ldw	x,sp
2330  04fa 1c0024        	addw	x,#OFST-18
2331  04fd 89            	pushw	x
2332  04fe 1c000c        	addw	x,#12
2333  0501 cd0000        	call	_MemcpyFunc
2335  0504 5b03          	addw	sp,#3
2336                     ; 1053 	if(0 < dwOffset) 
2338  0506 96            	ldw	x,sp
2339  0507 1c001f        	addw	x,#OFST-23
2340  050a cd0000        	call	c_lzmp
2342  050d 2d4b          	jrsle	L156
2343                     ; 1055 		TM_RTimeAddnMinute(&stEnd, (tyReport.wGatherCycle - (u16)((dwOffset/60)%(u32)tyReport.wGatherCycle)));
2345  050f ce0000        	ldw	x,_tyReport
2346  0512 cd0000        	call	c_uitolx
2348  0515 96            	ldw	x,sp
2349  0516 1c0003        	addw	x,#OFST-51
2350  0519 cd0000        	call	c_rtol
2352  051c 96            	ldw	x,sp
2353  051d 1c001f        	addw	x,#OFST-23
2354  0520 cd0000        	call	c_ltor
2356  0523 ae0004        	ldw	x,#L062
2357  0526 cd0000        	call	c_ldiv
2359  0529 96            	ldw	x,sp
2360  052a 1c0003        	addw	x,#OFST-51
2361  052d cd0000        	call	c_lmod
2363  0530 be02          	ldw	x,c_lreg+2
2364  0532 1f01          	ldw	(OFST-53,sp),x
2365  0534 ce0000        	ldw	x,_tyReport
2366  0537 72f001        	subw	x,(OFST-53,sp)
2367  053a cd0000        	call	c_uitolx
2369  053d be02          	ldw	x,c_lreg+2
2370  053f 89            	pushw	x
2371  0540 be00          	ldw	x,c_lreg
2372  0542 89            	pushw	x
2373  0543 96            	ldw	x,sp
2374  0544 1c0027        	addw	x,#OFST-15
2375  0547 cd0000        	call	_TM_RTimeAddnMinute
2377  054a 5b04          	addw	sp,#4
2378                     ; 1056 		TM_TimeChangeBToA(&stEnd, &g_stNextGmTime); 
2380  054c ae0000        	ldw	x,#_g_stNextGmTime
2381  054f 89            	pushw	x
2382  0550 96            	ldw	x,sp
2383  0551 1c0025        	addw	x,#OFST-17
2384  0554 cd0000        	call	_TM_TimeChangeBToA
2386  0557 85            	popw	x
2388  0558 200f          	jra	L356
2389  055a               L156:
2390                     ; 1060 		MemcpyFunc((u8*)&g_stNextGmTime, (u8*)&stLastTime, sizeof(ST_Time));
2392  055a 4b07          	push	#7
2393  055c 96            	ldw	x,sp
2394  055d 1c0018        	addw	x,#OFST-30
2395  0560 89            	pushw	x
2396  0561 ae0000        	ldw	x,#_g_stNextGmTime
2397  0564 cd0000        	call	_MemcpyFunc
2399  0567 5b03          	addw	sp,#3
2400  0569               L356:
2401                     ; 1065 	dwOffset = TM_DiffSecond(&stLastReportT, &stTmpTime);
2403  0569 96            	ldw	x,sp
2404  056a 1c002f        	addw	x,#OFST-7
2405  056d 89            	pushw	x
2406  056e ae0000        	ldw	x,#_stLastReportT
2407  0571 cd0000        	call	_TM_DiffSecond
2409  0574 85            	popw	x
2410  0575 96            	ldw	x,sp
2411  0576 1c001f        	addw	x,#OFST-23
2412  0579 cd0000        	call	c_rtol
2414                     ; 1066 	dwTemp   = ClaReportTimeToSec(tyReport.cycle);
2416  057c c60003        	ld	a,_tyReport+3
2417  057f cd0000        	call	_ClaReportTimeToSec
2419  0582 96            	ldw	x,sp
2420  0583 1c002b        	addw	x,#OFST-11
2421  0586 cd0000        	call	c_rtol
2423                     ; 1069 	if(0 < dwOffset) 
2425  0589 96            	ldw	x,sp
2426  058a 1c001f        	addw	x,#OFST-23
2427  058d cd0000        	call	c_lzmp
2429  0590 2d42          	jrsle	L556
2430                     ; 1071 		TM_RTimeAddnMinute(&stTmpTime, ((dwTemp - (u32)(dwOffset%dwTemp))/60));
2432  0592 96            	ldw	x,sp
2433  0593 1c001f        	addw	x,#OFST-23
2434  0596 cd0000        	call	c_ltor
2436  0599 96            	ldw	x,sp
2437  059a 1c002b        	addw	x,#OFST-11
2438  059d cd0000        	call	c_lumd
2440  05a0 96            	ldw	x,sp
2441  05a1 1c0003        	addw	x,#OFST-51
2442  05a4 cd0000        	call	c_rtol
2444  05a7 96            	ldw	x,sp
2445  05a8 1c002b        	addw	x,#OFST-11
2446  05ab cd0000        	call	c_ltor
2448  05ae 96            	ldw	x,sp
2449  05af 1c0003        	addw	x,#OFST-51
2450  05b2 cd0000        	call	c_lsub
2452  05b5 ae0004        	ldw	x,#L062
2453  05b8 cd0000        	call	c_ludv
2455  05bb be02          	ldw	x,c_lreg+2
2456  05bd 89            	pushw	x
2457  05be be00          	ldw	x,c_lreg
2458  05c0 89            	pushw	x
2459  05c1 96            	ldw	x,sp
2460  05c2 1c0033        	addw	x,#OFST-3
2461  05c5 cd0000        	call	_TM_RTimeAddnMinute
2463  05c8 5b04          	addw	sp,#4
2464                     ; 1072 		TM_TimeChangeBToA(&stTmpTime, &g_stNextRepTime);
2466  05ca ae0007        	ldw	x,#_g_stNextRepTime
2467  05cd 89            	pushw	x
2468  05ce 96            	ldw	x,sp
2469  05cf 1c0031        	addw	x,#OFST-5
2472  05d2 2007          	jra	L756
2473  05d4               L556:
2474                     ; 1076 		TM_TimeChangeBToA(&stLastReportT, &g_stNextRepTime);
2476  05d4 ae0007        	ldw	x,#_g_stNextRepTime
2477  05d7 89            	pushw	x
2478  05d8 ae0000        	ldw	x,#_stLastReportT
2480  05db               L756:
2481  05db cd0000        	call	_TM_TimeChangeBToA
2482  05de 85            	popw	x
2483                     ; 1080 	nRepFlg = GetReportFailFlag();
2485  05df cd0000        	call	_GetReportFailFlag
2487  05e2 6b1e          	ld	(OFST-24,sp),a
2488                     ; 1081 	if(nRepFlg&REPORT_FAIL_FLG)
2490  05e4 a50e          	bcp	a,#14
2491  05e6 2774          	jreq	L166
2492                     ; 1083 		STM8_RTC_Get(&stTimeNow);		
2494  05e8 ae0000        	ldw	x,#_stTimeNow
2495  05eb cd0000        	call	_STM8_RTC_Get
2497                     ; 1084 		TM_TimeChangeAToB(&stTimeNow, &stTime);
2499  05ee 96            	ldw	x,sp
2500  05ef 1c0007        	addw	x,#OFST-47
2501  05f2 89            	pushw	x
2502  05f3 ae0000        	ldw	x,#_stTimeNow
2503  05f6 cd0000        	call	_TM_TimeChangeAToB
2505  05f9 85            	popw	x
2506                     ; 1085 		MemcpyFunc((u8*)&stTmpTime, (u8*)&stTime, sizeof(TM_Time));
2508  05fa 4b08          	push	#8
2509  05fc 96            	ldw	x,sp
2510  05fd 1c0008        	addw	x,#OFST-46
2511  0600 89            	pushw	x
2512  0601 1c0028        	addw	x,#40
2513  0604 cd0000        	call	_MemcpyFunc
2515  0607 5b03          	addw	sp,#3
2516                     ; 1088 		if(nRepFlg&THIRD_REP_FAIL)
2518  0609 7b1e          	ld	a,(OFST-24,sp)
2519  060b a508          	bcp	a,#8
2520  060d 2711          	jreq	L366
2521                     ; 1093 			if(0x41 == tyReport.cycle)
2523  060f c60003        	ld	a,_tyReport+3
2524  0612 a141          	cp	a,#65
2525  0614 2605          	jrne	L566
2526                     ; 1095 				TM_RTimeAddnMinute(&stTmpTime, 15);
2528  0616 ae000f        	ldw	x,#15
2531  0619 2029          	jra	L176
2532  061b               L566:
2533                     ; 1099 				TM_RTimeAddnMinute(&stTmpTime, 540);
2535  061b ae021c        	ldw	x,#540
2537  061e 2024          	jra	L176
2538  0620               L366:
2539                     ; 1103 		else if(nRepFlg&SECOND_REP_FAIL)
2541  0620 a504          	bcp	a,#4
2542  0622 2711          	jreq	L376
2543                     ; 1108 			if(0x41 == tyReport.cycle)
2545  0624 c60003        	ld	a,_tyReport+3
2546  0627 a141          	cp	a,#65
2547  0629 2605          	jrne	L576
2548                     ; 1110 				TM_RTimeAddnMinute(&stTmpTime, 10);
2550  062b ae000a        	ldw	x,#10
2553  062e 2014          	jra	L176
2554  0630               L576:
2555                     ; 1114 				TM_RTimeAddnMinute(&stTmpTime, 360);
2557  0630 ae0168        	ldw	x,#360
2559  0633 200f          	jra	L176
2560  0635               L376:
2561                     ; 1123 			if(0x41 == tyReport.cycle)
2563  0635 c60003        	ld	a,_tyReport+3
2564  0638 a141          	cp	a,#65
2565  063a 2605          	jrne	L307
2566                     ; 1125 				TM_RTimeAddnMinute(&stTmpTime, 5);
2568  063c ae0005        	ldw	x,#5
2571  063f 2003          	jra	L176
2572  0641               L307:
2573                     ; 1129 				TM_RTimeAddnMinute(&stTmpTime, 180);
2575  0641 ae00b4        	ldw	x,#180
2577  0644               L176:
2578  0644 89            	pushw	x
2579  0645 5f            	clrw	x
2580  0646 89            	pushw	x
2581  0647 96            	ldw	x,sp
2582  0648 1c0033        	addw	x,#OFST-3
2583  064b cd0000        	call	_TM_RTimeAddnMinute
2584  064e 5b04          	addw	sp,#4
2585                     ; 1133 		TM_TimeChangeBToA(&stTmpTime, &g_stNextRepTime);	
2587  0650 ae0007        	ldw	x,#_g_stNextRepTime
2588  0653 89            	pushw	x
2589  0654 96            	ldw	x,sp
2590  0655 1c0031        	addw	x,#OFST-5
2591  0658 cd0000        	call	_TM_TimeChangeBToA
2593  065b 85            	popw	x
2594  065c               L166:
2595                     ; 1137 	ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
2597  065c 4b03          	push	#3
2598  065e 4b0b          	push	#11
2599  0660 ae0000        	ldw	x,#_tyReport
2600  0663 cd0000        	call	_ReadParameterForType
2602  0666 85            	popw	x
2603                     ; 1138 	if(0 < tyReport.wGatherCycle)
2605  0667 ce0000        	ldw	x,_tyReport
2606  066a 2726          	jreq	L707
2607                     ; 1140 		dwTmp = tyReport.wGatherCycle;
2609  066c cd0000        	call	c_uitolx
2611  066f 96            	ldw	x,sp
2612  0670 1c002b        	addw	x,#OFST-11
2613  0673 cd0000        	call	c_rtol
2615                     ; 1141 		dwCount = dwTmp*60;
2617  0676 96            	ldw	x,sp
2618  0677 1c002b        	addw	x,#OFST-11
2619  067a cd0000        	call	c_ltor
2621  067d a63c          	ld	a,#60
2622  067f cd0000        	call	c_smul
2624  0682 96            	ldw	x,sp
2625  0683 1c002b        	addw	x,#OFST-11
2626  0686 cd0000        	call	c_rtol
2629                     ; 1148 	return dwCount;
2631  0689 96            	ldw	x,sp
2632  068a 1c002b        	addw	x,#OFST-11
2633  068d cd0000        	call	c_ltor
2636  0690 200a          	jra	L033
2637  0692               L707:
2638                     ; 1145 		return LP_WAKEUP_TO;
2640  0692 ae8c00        	ldw	x,#35840
2641  0695 bf02          	ldw	c_lreg+2,x
2642  0697 ae000a        	ldw	x,#10
2643  069a bf00          	ldw	c_lreg,x
2645  069c               L033:
2647  069c 5b36          	addw	sp,#54
2648  069e 81            	ret	
2731                     	xdef	_LP_CheckGuardKeyStat
2732                     	xdef	_LP_WakeUpTerm
2733                     	xdef	_LP_ClaReportTime
2734                     	xdef	_LP_ExitWakeUpProc
2735                     	xdef	_LP_RTC_Config
2736                     	xdef	_LP_CalReportGatherTime
2737                     	xdef	_LP_ADC_DeInit
2738                     	xdef	_LP_UART_DeInit
2739                     	xdef	_LP_TimeDeInit
2740                     	xdef	_LP_EXTI_Configuration
2741                     	xdef	_LP_GPIO_DefaultConfig
2742                     	xdef	_LP_130_CalReportConut
2743                     	switch	.bss
2744  0000               _g_stNextGmTime:
2745  0000 000000000000  	ds.b	7
2746                     	xdef	_g_stNextGmTime
2747  0007               _g_stNextRepTime:
2748  0007 000000000000  	ds.b	7
2749                     	xdef	_g_stNextRepTime
2750  000e               _g_stPowrOnTime:
2751  000e 000000000000  	ds.b	7
2752                     	xdef	_g_stPowrOnTime
2753  0015               _m_stStartTime:
2754  0015 000000000000  	ds.b	8
2755                     	xdef	_m_stStartTime
2756                     	xdef	_m_nDebugFlg
2757                     	xref	_tyTime
2758                     	xref	_TurnBusUartOff
2759                     	xdef	_LP_DelayMs
2760                     	xdef	_LP_TermReset
2761                     	xdef	_LP_GetKeyWuFlg
2762                     	xdef	_LP_ClrLowPwrStartFlg
2763                     	xdef	_LP_SetLowPwrStartFlg
2764                     	xdef	_LP_SetKeyWuFlg
2765                     	xdef	_LP_BSP_DeInit
2766                     	xdef	_LP_LowPowerManage
2767                     	xref	_STM8_RTC_Get
2768                     	xref	_ReadReportFlag
2769                     	xref	_SaveReportFlag
2770                     	xref	_ReadParameterForType
2771                     	xref	_InitializeFile
2772                     	xref	_ClaReportTimeToSec
2773                     	xref	_GetReportFailFlag
2774                     	xref	_stOptValve
2775                     	xref	_stLastReportT
2776                     	xref	_stTimeNow
2777                     	xref	_tyReport
2778                     	xref	_InitializeBase
2779                     	xref	_TM_RTimeAddnMinute
2780                     	xref	_TM_DiffSecond
2781                     	xref	_TM_TimeChangeBToA
2782                     	xref	_TM_TimeChangeAToB
2783                     	xref	_JX_BL_Change
2784                     	xref	_MemcpyFunc
2785                     	xdef	_RTC_WakeUpCmd
2786                     	xref	_RTC_WaitForSynchro
2787                     	xref	_GPIO_WriteBit
2788                     	xref	_GPIO_Init
2789                     	xref	_EXTI_ClearITPendingBit
2790                     	xref	_EXTI_SelectPort
2791                     	xref	_EXTI_SetPinSensitivity
2792                     	xref	_CLK_PeripheralClockConfig
2793                     	xref.b	c_lreg
2813                     	xref	c_smul
2814                     	xref	c_ludv
2815                     	xref	c_lsub
2816                     	xref	c_lumd
2817                     	xref	c_lmod
2818                     	xref	c_uitolx
2819                     	xref	c_ldiv
2820                     	xref	c_lgadc
2821                     	xref	c_lcmp
2822                     	xref	c_rtol
2823                     	xref	c_lrzmp
2824                     	xref	c_ltor
2825                     	xref	c_lzmp
2826                     	xref	c_lgsbc
2827                     	end
