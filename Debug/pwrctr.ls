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
 112                     ; 55 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
 112                     ; 56 {
 114                     	switch	.text
 115  0000               _RTC_WakeUpCmd:
 117  0000 88            	push	a
 118  0001 5203          	subw	sp,#3
 119       00000003      OFST:	set	3
 122                     ; 57   ErrorStatus status = ERROR;
 124                     ; 58   uint16_t wutwfcount = 0;
 126  0003 5f            	clrw	x
 127  0004 1f02          	ldw	(OFST-1,sp),x
 128                     ; 61   assert_param(IS_FUNCTIONAL_STATE(NewState));
 130                     ; 64   RTC->WPR = 0xCA;
 132  0006 35ca5159      	mov	20825,#202
 133                     ; 65   RTC->WPR = 0x53;
 135  000a 35535159      	mov	20825,#83
 136                     ; 67   if (NewState != DISABLE)
 138  000e 7b04          	ld	a,(OFST+1,sp)
 139  0010 270d          	jreq	L36
 140                     ; 70     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
 142  0012 72145149      	bset	20809,#2
 143                     ; 72     status = SUCCESS;
 145  0016               LC001:
 147  0016 a601          	ld	a,#1
 149  0018               L56:
 150                     ; 97   RTC->WPR = 0xFF; 
 152  0018 35ff5159      	mov	20825,#255
 153                     ; 100   return (ErrorStatus)status;
 157  001c 5b04          	addw	sp,#4
 158  001e 81            	ret	
 159  001f               L36:
 160                     ; 77     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
 162  001f 72155149      	bres	20809,#2
 164  0023 2003          	jra	L17
 165  0025               L76:
 166                     ; 82       wutwfcount++;
 168  0025 5c            	incw	x
 169  0026 1f02          	ldw	(OFST-1,sp),x
 170  0028               L17:
 171                     ; 80     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 173  0028 7204514c05    	btjt	20812,#2,L57
 175  002d a3ffff        	cpw	x,#65535
 176  0030 26f3          	jrne	L76
 177  0032               L57:
 178                     ; 86     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 180  0032 7204514c04    	btjt	20812,#2,L77
 181                     ; 88       status = ERROR;
 183  0037 a6ff          	ld	a,#255
 185  0039 20dd          	jra	L56
 186  003b               L77:
 187                     ; 92       status = SUCCESS;
 188  003b 20d9          	jp	LC001
 227                     ; 117 void LP_DelayMs(uint32_t dwTime)
 227                     ; 118 {
 228                     	switch	.text
 229  003d               _LP_DelayMs:
 231  003d 5204          	subw	sp,#4
 232       00000004      OFST:	set	4
 235                     ; 119 	int32_t dwCnt = 16000;
 237  003f ae3e80        	ldw	x,#16000
 238  0042 1f03          	ldw	(OFST-1,sp),x
 239  0044 5f            	clrw	x
 240  0045 1f01          	ldw	(OFST-3,sp),x
 242  0047 201a          	jra	L521
 243  0049               L121:
 244                     ; 123 		dwCnt = 16000;
 246  0049 ae3e80        	ldw	x,#16000
 247  004c 1f03          	ldw	(OFST-1,sp),x
 248  004e 5f            	clrw	x
 249  004f 1f01          	ldw	(OFST-3,sp),x
 250  0051               L131:
 251                     ; 126 			dwCnt--;
 253  0051 96            	ldw	x,sp
 254  0052 5c            	incw	x
 255  0053 a601          	ld	a,#1
 256  0055 cd0000        	call	c_lgsbc
 258                     ; 124 		while(0 < dwCnt)
 260  0058 96            	ldw	x,sp
 261  0059 5c            	incw	x
 262  005a cd0000        	call	c_lzmp
 264  005d 2cf2          	jrsgt	L131
 265                     ; 128 		IWDG->KR = IWDG_KEY_REFRESH;
 267  005f 35aa50e0      	mov	20704,#170
 268  0063               L521:
 269                     ; 121 	while(dwTime--)
 271  0063 96            	ldw	x,sp
 272  0064 1c0007        	addw	x,#OFST+3
 273  0067 cd0000        	call	c_ltor
 275  006a 96            	ldw	x,sp
 276  006b 1c0007        	addw	x,#OFST+3
 277  006e a601          	ld	a,#1
 278  0070 cd0000        	call	c_lgsbc
 280  0073 cd0000        	call	c_lrzmp
 282  0076 26d1          	jrne	L121
 283                     ; 130 }
 286  0078 5b04          	addw	sp,#4
 287  007a 81            	ret	
 320                     ; 141 void LP_SetKeyWuFlg(uint8_t nFlg)
 320                     ; 142 {
 321                     	switch	.text
 322  007b               _LP_SetKeyWuFlg:
 326                     ; 143   m_nKeyWuFlg = nFlg;
 328  007b c70000        	ld	L3_m_nKeyWuFlg,a
 329                     ; 144 }
 332  007e 81            	ret	
 356                     ; 155 uint8_t LP_GetKeyWuFlg(void)
 356                     ; 156 {
 357                     	switch	.text
 358  007f               _LP_GetKeyWuFlg:
 362                     ; 157   return m_nKeyWuFlg;
 364  007f c60000        	ld	a,L3_m_nKeyWuFlg
 367  0082 81            	ret	
 393                     ; 169 void LP_GPIO_DefaultConfig(void)
 393                     ; 170 {
 394                     	switch	.text
 395  0083               _LP_GPIO_DefaultConfig:
 399                     ; 171 	LP_DelayMs(10);
 401  0083 ae000a        	ldw	x,#10
 402  0086 89            	pushw	x
 403  0087 5f            	clrw	x
 404  0088 89            	pushw	x
 405  0089 adb2          	call	_LP_DelayMs
 407  008b 5b04          	addw	sp,#4
 408                     ; 174 	GPIOA->DDR = 0xFF;
 410  008d 35ff5002      	mov	20482,#255
 411                     ; 175 	GPIOB->DDR = 0xFF;
 413  0091 35ff5007      	mov	20487,#255
 414                     ; 176 	GPIOC->DDR = 0xFF;
 416  0095 35ff500c      	mov	20492,#255
 417                     ; 177 	GPIOD->DDR = 0xFF;
 419  0099 35ff5011      	mov	20497,#255
 420                     ; 179 	GPIOA->ODR = 0;
 422  009d 725f5000      	clr	20480
 423                     ; 180 	GPIOB->ODR = 0;
 425  00a1 725f5005      	clr	20485
 426                     ; 181 	GPIOC->ODR = 0;
 428  00a5 725f500a      	clr	20490
 429                     ; 182 	GPIOD->ODR = 0;
 431  00a9 725f500f      	clr	20495
 432                     ; 188   	GPIO_Init(GPIOD, GPIO_Pin_0, GPIO_Mode_In_FL_IT);// 上拉 输入，内部接入上拉电阻  GPIO_Mode_In_PU_IT
 434  00ad 4b20          	push	#32
 435  00af 4b01          	push	#1
 436  00b1 ae500f        	ldw	x,#20495
 437  00b4 cd0000        	call	_GPIO_Init
 439  00b7 85            	popw	x
 440                     ; 193 }
 443  00b8 81            	ret	
 470                     ; 204 void LP_EXTI_Configuration(void)
 470                     ; 205 {	
 471                     	switch	.text
 472  00b9               _LP_EXTI_Configuration:
 476                     ; 207 	EXTI_SelectPort(WAKE_UP_PORT_EXTI);
 478  00b9 a602          	ld	a,#2
 479  00bb cd0000        	call	_EXTI_SelectPort
 481                     ; 208 	EXTI_SetPinSensitivity(WAKE_UP_PORT_PIN, EXTI_Trigger_Falling);
 483  00be ae0002        	ldw	x,#2
 484  00c1 4f            	clr	a
 485  00c2 95            	ld	xh,a
 486  00c3 cd0000        	call	_EXTI_SetPinSensitivity
 488                     ; 209 	EXTI_ClearITPendingBit(WAKE_UP_EXTIT_PIN);
 490  00c6 ae0001        	ldw	x,#1
 492                     ; 210 }
 495  00c9 cc0000        	jp	_EXTI_ClearITPendingBit
 518                     ; 221 void LP_TermReset(void)
 518                     ; 222 {
 519                     	switch	.text
 520  00cc               _LP_TermReset:
 524                     ; 223 	WWDG->WR = WWDG_WR_RESET_VALUE;
 526  00cc 357f50d4      	mov	20692,#127
 527                     ; 224 	WWDG->CR = (uint8_t)(WWDG_CR_WDGA | COUNTER_INIT);
 529  00d0 35e850d3      	mov	20691,#232
 530                     ; 225 	WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WINDOW_VALUE);
 532  00d4 356150d4      	mov	20692,#97
 533  00d8               L312:
 534                     ; 226 	while (1);
 536  00d8 20fe          	jra	L312
 560                     ; 238 int32_t LP_TimeDeInit(void)
 560                     ; 239 {
 561                     	switch	.text
 562  00da               _LP_TimeDeInit:
 566                     ; 240 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 568  00da 5f            	clrw	x
 569  00db a611          	ld	a,#17
 570  00dd 95            	ld	xh,a
 571  00de cd0000        	call	_CLK_PeripheralClockConfig
 573                     ; 241 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 575  00e1 5f            	clrw	x
 576  00e2 a602          	ld	a,#2
 577  00e4 95            	ld	xh,a
 578  00e5 cd0000        	call	_CLK_PeripheralClockConfig
 580                     ; 243 	TIM1->CR1  = TIM1_CR1_RESET_VALUE;
 582  00e8 725f52b0      	clr	21168
 583                     ; 244 	TIM1->CR2  = TIM1_CR2_RESET_VALUE;
 585  00ec 725f52b1      	clr	21169
 586                     ; 245 	TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
 588  00f0 725f52b2      	clr	21170
 589                     ; 246 	TIM1->ETR  = TIM1_ETR_RESET_VALUE;
 591  00f4 725f52b3      	clr	21171
 592                     ; 247 	TIM1->IER  = TIM1_IER_RESET_VALUE;
 594  00f8 725f52b5      	clr	21173
 595                     ; 250 	TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 597  00fc 725f52bd      	clr	21181
 598                     ; 251 	TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 600  0100 725f52be      	clr	21182
 601                     ; 253 	TIM1->CCMR1 = 0x01;
 603  0104 350152b9      	mov	21177,#1
 604                     ; 254 	TIM1->CCMR2 = 0x01;
 606  0108 350152ba      	mov	21178,#1
 607                     ; 255 	TIM1->CCMR3 = 0x01;
 609  010c 350152bb      	mov	21179,#1
 610                     ; 256 	TIM1->CCMR4 = 0x01;
 612  0110 350152bc      	mov	21180,#1
 613                     ; 258 	TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
 615  0114 725f52bd      	clr	21181
 616                     ; 259 	TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
 618  0118 725f52be      	clr	21182
 619                     ; 260 	TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 621  011c 725f52b9      	clr	21177
 622                     ; 261 	TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 624  0120 725f52ba      	clr	21178
 625                     ; 262 	TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 627  0124 725f52bb      	clr	21179
 628                     ; 263 	TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 630  0128 725f52bc      	clr	21180
 631                     ; 264 	TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 633  012c 725f52bf      	clr	21183
 634                     ; 265 	TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 636  0130 725f52c0      	clr	21184
 637                     ; 266 	TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 639  0134 725f52c1      	clr	21185
 640                     ; 267 	TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 642  0138 725f52c2      	clr	21186
 643                     ; 268 	TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 645  013c 35ff52c3      	mov	21187,#255
 646                     ; 269 	TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 648  0140 35ff52c4      	mov	21188,#255
 649                     ; 270 	TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 651  0144 725f52c6      	clr	21190
 652                     ; 271 	TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 654  0148 725f52c7      	clr	21191
 655                     ; 272 	TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 657  014c 725f52c8      	clr	21192
 658                     ; 273 	TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 660  0150 725f52c9      	clr	21193
 661                     ; 274 	TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 663  0154 725f52ca      	clr	21194
 664                     ; 275 	TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 666  0158 725f52cb      	clr	21195
 667                     ; 276 	TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 669  015c 725f52cc      	clr	21196
 670                     ; 277 	TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 672  0160 725f52cd      	clr	21197
 673                     ; 278 	TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 675  0164 725f52d0      	clr	21200
 676                     ; 279 	TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 678  0168 350152b8      	mov	21176,#1
 679                     ; 280 	TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 681  016c 725f52cf      	clr	21199
 682                     ; 281 	TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 684  0170 725f52ce      	clr	21198
 685                     ; 282 	TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 687  0174 725f52c5      	clr	21189
 688                     ; 283 	TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 690  0178 725f52b6      	clr	21174
 691                     ; 284 	TIM1->SR2   = TIM1_SR2_RESET_VALUE;	
 693  017c 725f52b7      	clr	21175
 694                     ; 286 	TIM4->CR1	= TIM4_CR1_RESET_VALUE;
 696  0180 725f52e0      	clr	21216
 697                     ; 287 	TIM4->CR2	= TIM4_CR2_RESET_VALUE;
 699  0184 725f52e1      	clr	21217
 700                     ; 288 	TIM4->SMCR	 = TIM4_SMCR_RESET_VALUE;
 702  0188 725f52e2      	clr	21218
 703                     ; 289 	TIM4->IER	= TIM4_IER_RESET_VALUE;
 705  018c 725f52e4      	clr	21220
 706                     ; 290 	TIM4->CNTR	 = TIM4_CNTR_RESET_VALUE;
 708  0190 725f52e7      	clr	21223
 709                     ; 291 	TIM4->PSCR	= TIM4_PSCR_RESET_VALUE;
 711  0194 725f52e8      	clr	21224
 712                     ; 292 	TIM4->ARR	= TIM4_ARR_RESET_VALUE;
 714  0198 35ff52e9      	mov	21225,#255
 715                     ; 293 	TIM4->SR1	= TIM4_SR1_RESET_VALUE;
 717  019c 725f52e5      	clr	21221
 718                     ; 295 	return (SUCCESS);
 720  01a0 ae0001        	ldw	x,#1
 721  01a3 bf02          	ldw	c_lreg+2,x
 722  01a5 5f            	clrw	x
 723  01a6 bf00          	ldw	c_lreg,x
 726  01a8 81            	ret	
 751                     ; 307 int32_t  LP_UART_DeInit(void)
 751                     ; 308 {
 752                     	switch	.text
 753  01a9               _LP_UART_DeInit:
 757                     ; 309 	TurnBusUartOff();
 759  01a9 cd0000        	call	_TurnBusUartOff
 761                     ; 310 	(void) USART1->SR;
 763  01ac c65230        	ld	a,21040
 764                     ; 311 	(void) USART1->DR;
 766  01af c65231        	ld	a,21041
 767                     ; 313 	USART1->BRR2 = USART_BRR2_RESET_VALUE;	/* Set USART_BRR2 to reset value 0x00 */
 769  01b2 725f5233      	clr	21043
 770                     ; 314 	USART1->BRR1 = USART_BRR1_RESET_VALUE;	/* Set USART_BRR1 to reset value 0x00 */
 772  01b6 725f5232      	clr	21042
 773                     ; 316 	USART1->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 775  01ba 725f5234      	clr	21044
 776                     ; 317 	USART1->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 778  01be 725f5235      	clr	21045
 779                     ; 318 	USART1->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 781  01c2 725f5236      	clr	21046
 782                     ; 319 	USART1->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 784  01c6 725f5237      	clr	21047
 785                     ; 321 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
 787  01ca 5f            	clrw	x
 788  01cb a605          	ld	a,#5
 789  01cd 95            	ld	xh,a
 790  01ce cd0000        	call	_CLK_PeripheralClockConfig
 792                     ; 323 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 794  01d1 5f            	clrw	x
 795  01d2 a611          	ld	a,#17
 796  01d4 95            	ld	xh,a
 797  01d5 cd0000        	call	_CLK_PeripheralClockConfig
 799                     ; 324 	return (SUCCESS);
 801  01d8 ae0001        	ldw	x,#1
 802  01db bf02          	ldw	c_lreg+2,x
 803  01dd 5f            	clrw	x
 804  01de bf00          	ldw	c_lreg,x
 807  01e0 81            	ret	
 831                     ; 336 int32_t  LP_ADC_DeInit(void)
 831                     ; 337 {
 832                     	switch	.text
 833  01e1               _LP_ADC_DeInit:
 837                     ; 340     ADC1->CR1 &= (uint8_t)~ADC_CR1_ADON;
 839  01e1 72115340      	bres	21312,#0
 840                     ; 343 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 842  01e5 5f            	clrw	x
 843  01e6 a610          	ld	a,#16
 844  01e8 95            	ld	xh,a
 845  01e9 cd0000        	call	_CLK_PeripheralClockConfig
 847                     ; 345 	return (SUCCESS);
 849  01ec ae0001        	ldw	x,#1
 850  01ef bf02          	ldw	c_lreg+2,x
 851  01f1 5f            	clrw	x
 852  01f2 bf00          	ldw	c_lreg,x
 855  01f4 81            	ret	
 882                     ; 357 void  LP_BSP_DeInit(void)
 882                     ; 358 {	
 883                     	switch	.text
 884  01f5               _LP_BSP_DeInit:
 888                     ; 360 	LP_ADC_DeInit();
 890  01f5 adea          	call	_LP_ADC_DeInit
 892                     ; 363 	LP_UART_DeInit(); 
 894  01f7 adb0          	call	_LP_UART_DeInit
 896                     ; 366 	LP_TimeDeInit();
 898  01f9 cd00da        	call	_LP_TimeDeInit
 900                     ; 369 	LP_GPIO_DefaultConfig();
 903                     ; 370 }
 906  01fc cc0083        	jp	_LP_GPIO_DefaultConfig
1100                     .const:	section	.text
1101  0000               L401:
1102  0000 00000003      	dc.l	3
1103                     ; 381 uint8_t LP_CalReportGatherTime(void)
1103                     ; 382 {
1104                     	switch	.text
1105  01ff               _LP_CalReportGatherTime:
1107  01ff 521f          	subw	sp,#31
1108       0000001f      OFST:	set	31
1111                     ; 383 	uint16_t wCount = 0, wTmp = 0;
1113  0201 5f            	clrw	x
1114  0202 1f01          	ldw	(OFST-30,sp),x
1117  0204 1f03          	ldw	(OFST-28,sp),x
1118                     ; 384 	int32_t  dwWorkTime = 0;
1120  0206 1f07          	ldw	(OFST-24,sp),x
1121  0208 1f05          	ldw	(OFST-26,sp),x
1122                     ; 389 	STM8_RTC_Get(&stTimeNow);	
1124  020a 96            	ldw	x,sp
1125  020b 1c0019        	addw	x,#OFST-6
1126  020e cd0000        	call	_STM8_RTC_Get
1128                     ; 390 	TM_TimeChangeAToB(&stTimeNow, &stRepTimeEnd);
1130  0211 96            	ldw	x,sp
1131  0212 1c0009        	addw	x,#OFST-22
1132  0215 89            	pushw	x
1133  0216 1c0010        	addw	x,#16
1134  0219 cd0000        	call	_TM_TimeChangeAToB
1136  021c 85            	popw	x
1137                     ; 392 	TM_TimeChangeAToB(&g_stPowrOnTime, &stStarTime);
1139  021d 96            	ldw	x,sp
1140  021e 1c0011        	addw	x,#OFST-14
1141  0221 89            	pushw	x
1142  0222 ae0000        	ldw	x,#_g_stPowrOnTime
1143  0225 cd0000        	call	_TM_TimeChangeAToB
1145  0228 85            	popw	x
1146                     ; 393 	dwWorkTime = TM_DiffSecond(&stStarTime, &stRepTimeEnd);
1148  0229 96            	ldw	x,sp
1149  022a 1c0009        	addw	x,#OFST-22
1150  022d 89            	pushw	x
1151  022e 1c0008        	addw	x,#8
1152  0231 cd0000        	call	_TM_DiffSecond
1154  0234 85            	popw	x
1155  0235 96            	ldw	x,sp
1156  0236 1c0005        	addw	x,#OFST-26
1157  0239 cd0000        	call	c_rtol
1159                     ; 394 	MemcpyFunc((u8*)&g_stPowrOnTime, (u8*)&stTimeNow, sizeof(g_stPowrOnTime));;
1161  023c 4b07          	push	#7
1162  023e 96            	ldw	x,sp
1163  023f 1c001a        	addw	x,#OFST-5
1164  0242 89            	pushw	x
1165  0243 ae0000        	ldw	x,#_g_stPowrOnTime
1166  0246 cd0000        	call	_MemcpyFunc
1168  0249 5b03          	addw	sp,#3
1169                     ; 396 	if(dwWorkTime < LP_KEYWU_TO)
1172  024b 96            	ldw	x,sp
1173  024c 1c0005        	addw	x,#OFST-26
1174  024f cd0000        	call	c_ltor
1176  0252 ae0000        	ldw	x,#L401
1177  0255 cd0000        	call	c_lcmp
1179  0258 2e04          	jrsge	L753
1180                     ; 398 		return TRUE;
1182  025a a601          	ld	a,#1
1184  025c 2001          	jra	L601
1185  025e               L753:
1186                     ; 401 	return FALSE;
1188  025e 4f            	clr	a
1190  025f               L601:
1192  025f 5b1f          	addw	sp,#31
1193  0261 81            	ret	
1218                     ; 413 void LP_RTC_Config(void)
1218                     ; 414 { 
1219                     	switch	.text
1220  0262               _LP_RTC_Config:
1224                     ; 418 	RTC->WPR = 0xCA;
1226  0262 35ca5159      	mov	20825,#202
1227                     ; 419 	RTC->WPR = 0x53;	
1229  0266 35535159      	mov	20825,#83
1230                     ; 421 	RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;	
1232  026a 72155149      	bres	20809,#2
1233                     ; 423 	RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;	
1235  026e c65148        	ld	a,20808
1236  0271 a4f8          	and	a,#248
1237  0273 c75148        	ld	20808,a
1238                     ; 425 	RTC->CR1 |= (uint8_t)RTC_WakeUpClock_RTCCLK_Div16;	
1240  0276 c65148        	ld	a,20808
1241                     ; 427 	RTC->WPR = 0xFF;
1243  0279 35ff5159      	mov	20825,#255
1244                     ; 429 	RTC_WaitForSynchro();
1246  027d cd0000        	call	_RTC_WaitForSynchro
1248                     ; 434 	RTC->WPR = 0xCA;
1250  0280 35ca5159      	mov	20825,#202
1251                     ; 435 	RTC->WPR = 0x53;	
1253  0284 35535159      	mov	20825,#83
1254                     ; 437 	RTC->WUTRH = (uint8_t)(2047 >> 8);
1256  0288 35075154      	mov	20820,#7
1257                     ; 438 	RTC->WUTRL = (uint8_t)(2047);	
1259  028c 35ff5155      	mov	20821,#255
1260                     ; 440 	RTC->WPR = 0xFF;
1262  0290 35ff5159      	mov	20825,#255
1263                     ; 442 	RTC_WakeUpCmd(DISABLE);
1265  0294 4f            	clr	a
1266  0295 cd0000        	call	_RTC_WakeUpCmd
1268                     ; 447 	RTC->WPR = 0xCA;
1270  0298 35ca5159      	mov	20825,#202
1271                     ; 448 	RTC->WPR = 0x53;	
1273  029c 35535159      	mov	20825,#83
1274                     ; 450 	RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT_WUT & (uint16_t)0x00F0);
1276  02a0 721c5149      	bset	20809,#6
1277                     ; 451 	RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT_WUT & RTC_TCR1_TAMPIE);
1279  02a4 c6516c        	ld	a,20844
1280                     ; 454 	RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT_WUT >> 4);
1282  02a7 35fb514d      	mov	20813,#251
1283                     ; 455 }
1286  02ab 81            	ret	
1320                     ; 466 void LP_SetLowPwrStartFlg(u8 nFlg)
1320                     ; 467 { 
1321                     	switch	.text
1322  02ac               _LP_SetLowPwrStartFlg:
1326                     ; 468 	m_nPowrDown |= (1<<nFlg);
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
1340                     ; 469 }
1343  02bd 81            	ret	
1377                     ; 480 void LP_ClrLowPwrStartFlg(u8 nFlg)
1377                     ; 481 { 
1378                     	switch	.text
1379  02be               _LP_ClrLowPwrStartFlg:
1383                     ; 482 	m_nPowrDown &= (~(1<<nFlg));
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
1398                     ; 483 }
1401  02d0 81            	ret	
1461                     ; 494 void LP_ExitWakeUpProc(void)
1461                     ; 495 { 
1462                     	switch	.text
1463  02d1               _LP_ExitWakeUpProc:
1465  02d1 5214          	subw	sp,#20
1466       00000014      OFST:	set	20
1469                     ; 496 	int32_t  dwWorkTime = 0;
1471  02d3 5f            	clrw	x
1472  02d4 1f0b          	ldw	(OFST-9,sp),x
1473  02d6 1f09          	ldw	(OFST-11,sp),x
1474                     ; 500 	STM8_RTC_Get(&stTimeNow);		
1476  02d8 ae0000        	ldw	x,#_stTimeNow
1477  02db cd0000        	call	_STM8_RTC_Get
1479                     ; 501 	TM_TimeChangeAToB(&stTimeNow, &stRepTimeEnd);	
1481  02de 96            	ldw	x,sp
1482  02df 1c000d        	addw	x,#OFST-7
1483  02e2 89            	pushw	x
1484  02e3 ae0000        	ldw	x,#_stTimeNow
1485  02e6 cd0000        	call	_TM_TimeChangeAToB
1487  02e9 85            	popw	x
1488                     ; 502 	TM_TimeChangeAToB(&g_stPowrOnTime, &stStarTime);
1490  02ea 96            	ldw	x,sp
1491  02eb 5c            	incw	x
1492  02ec 89            	pushw	x
1493  02ed ae0000        	ldw	x,#_g_stPowrOnTime
1494  02f0 cd0000        	call	_TM_TimeChangeAToB
1496  02f3 85            	popw	x
1497                     ; 503 	dwWorkTime = TM_DiffSecond(&stStarTime, &stRepTimeEnd);
1499  02f4 96            	ldw	x,sp
1500  02f5 1c000d        	addw	x,#OFST-7
1501  02f8 89            	pushw	x
1502  02f9 1d000c        	subw	x,#12
1503  02fc cd0000        	call	_TM_DiffSecond
1505  02ff 85            	popw	x
1506  0300 96            	ldw	x,sp
1507  0301 1c0009        	addw	x,#OFST-11
1508  0304 cd0000        	call	c_rtol
1510                     ; 504 	MemcpyFunc((u8*)&g_stPowrOnTime, (u8*)&stTimeNow, sizeof(g_stPowrOnTime));
1512  0307 4b07          	push	#7
1513  0309 ae0000        	ldw	x,#_stTimeNow
1514  030c 89            	pushw	x
1515  030d ae0000        	ldw	x,#_g_stPowrOnTime
1516  0310 cd0000        	call	_MemcpyFunc
1518  0313 5b03          	addw	sp,#3
1519                     ; 506 	if((0 == (m_nWakeUpCnt))||(LP_KEYWU_TO <= dwWorkTime))
1521  0315 c60002        	ld	a,L7_m_nWakeUpCnt
1522  0318 2705          	jreq	L744
1524  031a 96            	ldw	x,sp
1525  031b ad23          	call	LC002
1527  031d 2f15          	jrslt	L544
1528  031f               L744:
1529                     ; 508 		m_nWakeUpCnt = 1;
1531  031f 35010002      	mov	L7_m_nWakeUpCnt,#1
1532                     ; 509 		MemcpyFunc((u8*)&m_stStartTime, (u8*)&stRepTimeEnd, sizeof(m_stStartTime));
1534  0323 4b08          	push	#8
1535  0325 96            	ldw	x,sp
1536  0326 1c000e        	addw	x,#OFST-6
1537  0329 89            	pushw	x
1538  032a ae0007        	ldw	x,#_m_stStartTime
1539  032d cd0000        	call	_MemcpyFunc
1541  0330 5b03          	addw	sp,#3
1542                     ; 510 		return ;
1544  0332 2009          	jra	L154
1545  0334               L544:
1546                     ; 513 	if(dwWorkTime < LP_KEYWU_TO)
1548  0334 96            	ldw	x,sp
1549  0335 ad09          	call	LC002
1551  0337 2e04          	jrsge	L154
1552                     ; 515 		m_nWakeUpCnt++;
1554  0339 725c0002      	inc	L7_m_nWakeUpCnt
1555  033d               L154:
1556                     ; 518 	return ;	
1559  033d 5b14          	addw	sp,#20
1560  033f 81            	ret	
1562  0340               LC002:
1563  0340 1c0009        	addw	x,#OFST-11
1564  0343 cd0000        	call	c_ltor
1566  0346 ae0000        	ldw	x,#L401
1567  0349 cc0000        	jp	c_lcmp
1605                     ; 530 u8 LP_ClaReportTime(void)
1605                     ; 531 { 
1606                     	switch	.text
1607  034c               _LP_ClaReportTime:
1609  034c 5207          	subw	sp,#7
1610       00000007      OFST:	set	7
1613                     ; 535 	STM8_RTC_Get(&stTime);
1615  034e 96            	ldw	x,sp
1616  034f 5c            	incw	x
1617  0350 cd0000        	call	_STM8_RTC_Get
1619                     ; 538 	if((g_stNextRepTime.nDay == stTime.nDay)&&(g_stNextRepTime.nHour == stTime.nHour)
1619                     ; 539 		&&(g_stNextRepTime.nMinute == stTime.nMinute))
1621  0353 c60018        	ld	a,_g_stNextRepTime+2
1622  0356 1103          	cp	a,(OFST-4,sp)
1623  0358 260e          	jrne	L174
1625  035a c60019        	ld	a,_g_stNextRepTime+3
1626  035d 1104          	cp	a,(OFST-3,sp)
1627  035f 2607          	jrne	L174
1629  0361 c6001a        	ld	a,_g_stNextRepTime+4
1630  0364 1105          	cp	a,(OFST-2,sp)
1631                     ; 541 		return TRUE;
1633  0366 2715          	jreq	LC003
1634  0368               L174:
1635                     ; 545 	if((g_stNextGmTime.nDay == stTime.nDay)
1635                     ; 546 		&&(g_stNextGmTime.nHour == stTime.nHour)&&(g_stNextGmTime.nMinute == stTime.nMinute))
1637  0368 c60011        	ld	a,_g_stNextGmTime+2
1638  036b 1103          	cp	a,(OFST-4,sp)
1639  036d 2613          	jrne	L374
1641  036f c60012        	ld	a,_g_stNextGmTime+3
1642  0372 1104          	cp	a,(OFST-3,sp)
1643  0374 260c          	jrne	L374
1645  0376 c60013        	ld	a,_g_stNextGmTime+4
1646  0379 1105          	cp	a,(OFST-2,sp)
1647  037b 2605          	jrne	L374
1648                     ; 548 		return TRUE;
1650  037d               LC003:
1653  037d a601          	ld	a,#1
1655  037f               L651:
1657  037f 5b07          	addw	sp,#7
1658  0381 81            	ret	
1659  0382               L374:
1660                     ; 553 	if((CTL_VAVLE_ENABLE == stOptValve.nOptFlg)
1660                     ; 554 		&&(((0 != stOptValve.nVavleCycle)&&(stOptValve.nDay == stTime.nDay)&&(stOptValve.nMonth == stTime.nMonth))
1660                     ; 555 		||((0 == stOptValve.nVavleCycle)&&((0x01 == stTime.nDay)||(0x15 == stTime.nDay))))
1660                     ; 556 		&&(stOptValve.nStartHour <= stTime.nHour)&&(stOptValve.nEndHour >= stTime.nHour))
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
1695                     ; 558 		return TRUE;
1697  03b7 24c4          	jruge	LC003
1698  03b9               L574:
1699                     ; 561 	return FALSE;	
1701  03b9 4f            	clr	a
1703  03ba 20c3          	jra	L651
1742                     ; 573 void LP_WakeUpTerm(void)
1742                     ; 574 {
1743                     	switch	.text
1744  03bc               _LP_WakeUpTerm:
1746  03bc 88            	push	a
1747       00000001      OFST:	set	1
1750                     ; 575 	u8 nRepFlg = 0;
1752  03bd 0f01          	clr	(OFST+0,sp)
1753                     ; 577 	InitializeBase();
1755  03bf cd0000        	call	_InitializeBase
1757                     ; 578 	InitializeFile();
1759  03c2 cd0000        	call	_InitializeFile
1761                     ; 579 	nRepFlg = ReadReportFlag();
1763  03c5 cd0000        	call	_ReadReportFlag
1765  03c8 6b01          	ld	(OFST+0,sp),a
1766                     ; 580 	SaveReportFlag((nRepFlg|KEY_WUAKEUP_FLG));		
1768  03ca aa01          	or	a,#1
1769  03cc cd0000        	call	_SaveReportFlag
1771                     ; 581 	SetIO_LEDOn();
1773  03cf 4b01          	push	#1
1774  03d1 4b04          	push	#4
1775  03d3 ae5005        	ldw	x,#20485
1776  03d6 cd0000        	call	_GPIO_WriteBit
1778  03d9 85            	popw	x
1779                     ; 582 	LP_DelayMs(100);	
1781  03da ae0064        	ldw	x,#100
1782  03dd 89            	pushw	x
1783  03de 5f            	clrw	x
1784  03df 89            	pushw	x
1785  03e0 cd003d        	call	_LP_DelayMs
1787  03e3 5b04          	addw	sp,#4
1788                     ; 583 	LP_TermReset();
1790  03e5 cd00cc        	call	_LP_TermReset
1792                     ; 584 	return ;
1795  03e8 84            	pop	a
1796  03e9 81            	ret	
1820                     ; 596 u8 LP_CheckGuardKeyStat(void)
1820                     ; 597 { 	
1821                     	switch	.text
1822  03ea               _LP_CheckGuardKeyStat:
1826                     ; 620 	return FALSE;		
1828  03ea 4f            	clr	a
1831  03eb 81            	ret	
1918                     ; 632 void LP_LowPowerManage(void)
1918                     ; 633 {
1919                     	switch	.text
1920  03ec               _LP_LowPowerManage:
1922  03ec 5215          	subw	sp,#21
1923       00000015      OFST:	set	21
1926                     ; 634 	uint32_t dwCount = 0, dwCntTimeOut = LP_WAKEUP_TO;
1928  03ee 5f            	clrw	x
1929  03ef 1f08          	ldw	(OFST-13,sp),x
1930  03f1 1f06          	ldw	(OFST-15,sp),x
1933  03f3 96            	ldw	x,sp
1934  03f4 1c0002        	addw	x,#OFST-19
1935  03f7 cd0000        	call	c_ltor
1937                     ; 635 	int32_t  dwTickOffset = 0;
1939  03fa 96            	ldw	x,sp
1940  03fb 1c0012        	addw	x,#OFST-3
1941  03fe cd0000        	call	c_ltor
1943                     ; 636 	u8 nRepFlg = 0;	
1945  0401 0f01          	clr	(OFST-20,sp)
1946                     ; 640 	if(LP_START_FLG_OK != m_nPowrDown)
1948  0403 c60001        	ld	a,L5_m_nPowrDown
1949  0406 a103          	cp	a,#3
1950  0408 2666          	jrne	L232
1951                     ; 642 		return ;
1953                     ; 651 	dwCntTimeOut = LP_HD_CalReportConut();
1955  040a cd0000        	call	_LP_HD_CalReportConut
1957  040d 96            	ldw	x,sp
1958  040e 1c0002        	addw	x,#OFST-19
1959  0411 cd0000        	call	c_rtol
1961                     ; 654 	LP_DelayMs(10);
1963  0414 ae000a        	ldw	x,#10
1964  0417 89            	pushw	x
1965  0418 5f            	clrw	x
1966  0419 89            	pushw	x
1967  041a cd003d        	call	_LP_DelayMs
1969  041d 5b04          	addw	sp,#4
1970                     ; 657 	IWDG->KR = IWDG_KEY_REFRESH;
1972  041f 35aa50e0      	mov	20704,#170
1973                     ; 659 	LP_BSP_DeInit();
1975  0423 cd01f5        	call	_LP_BSP_DeInit
1977                     ; 662 	LP_EXTI_Configuration();
1979  0426 cd00b9        	call	_LP_EXTI_Configuration
1981                     ; 665 	LP_RTC_Config(); //edit by maronglang 20150609
1983  0429 cd0262        	call	_LP_RTC_Config
1985  042c               L365:
1986                     ; 670 		IWDG->KR = IWDG_KEY_REFRESH;
1988  042c 35aa50e0      	mov	20704,#170
1989                     ; 673 		RTC_WakeUpCmd(ENABLE); 	//edit by maronglang
1991  0430 a601          	ld	a,#1
1992  0432 cd0000        	call	_RTC_WakeUpCmd
1994                     ; 676 		PWR->CSR2 = 0x2;
1996  0435 350250b3      	mov	20659,#2
1997                     ; 679 		halt();
2000  0439 8e            	halt	
2002                     ; 680 		nop();
2006  043a 9d            	nop	
2008                     ; 681 		nop();
2012  043b 9d            	nop	
2014                     ; 682 		nop();
2018  043c 9d            	nop	
2020                     ; 683 		nop();
2024  043d 9d            	nop	
2026                     ; 684 		nop();
2030  043e 9d            	nop	
2032                     ; 686 		RTC_WakeUpCmd(DISABLE); 		
2035  043f 4f            	clr	a
2036  0440 cd0000        	call	_RTC_WakeUpCmd
2038                     ; 688 		if(WU_MODE_KEY == m_nKeyWuFlg)
2040  0443 c60000        	ld	a,L3_m_nKeyWuFlg
2041  0446 4a            	dec	a
2042  0447 2605          	jrne	L765
2043                     ; 690 			LP_ExitWakeUpProc();
2045  0449 cd02d1        	call	_LP_ExitWakeUpProc
2048  044c 2025          	jra	L175
2049  044e               L765:
2050                     ; 704 			dwCount++;
2052  044e 96            	ldw	x,sp
2053  044f 1c0006        	addw	x,#OFST-15
2054  0452 a601          	ld	a,#1
2055  0454 cd0000        	call	c_lgadc
2057                     ; 707 			if((dwCount >= dwCntTimeOut)||(LP_ClaReportTime()))
2059  0457 96            	ldw	x,sp
2060  0458 1c0006        	addw	x,#OFST-15
2061  045b cd0000        	call	c_ltor
2063  045e 96            	ldw	x,sp
2064  045f 1c0002        	addw	x,#OFST-19
2065  0462 cd0000        	call	c_lcmp
2067  0465 2406          	jruge	L575
2069  0467 cd034c        	call	_LP_ClaReportTime
2071  046a 4d            	tnz	a
2072  046b 2706          	jreq	L175
2073  046d               L575:
2074                     ; 709 				LP_TermReset();
2076  046d cd00cc        	call	_LP_TermReset
2078                     ; 710 				return ;
2079  0470               L232:
2082  0470 5b15          	addw	sp,#21
2083  0472 81            	ret	
2084  0473               L175:
2085                     ; 715 		if(3 <= m_nWakeUpCnt)
2087  0473 c60002        	ld	a,L7_m_nWakeUpCnt
2088  0476 a103          	cp	a,#3
2089  0478 25b2          	jrult	L365
2090                     ; 718 			LP_WakeUpTerm();
2092  047a cd03bc        	call	_LP_WakeUpTerm
2094                     ; 719 			return ;
2096  047d 20f1          	jra	L232
2223                     	switch	.const
2224  0004               L062:
2225  0004 0000003c      	dc.l	60
2226                     ; 1034 uint32_t LP_130_CalReportConut(void)
2226                     ; 1035 {
2227                     	switch	.text
2228  047f               _LP_130_CalReportConut:
2230  047f 5236          	subw	sp,#54
2231       00000036      OFST:	set	54
2234                     ; 1036 	uint32_t dwTmp = 0, dwCount = 0;
2236  0481 96            	ldw	x,sp
2237  0482 1c002b        	addw	x,#OFST-11
2238  0485 cd0000        	call	c_ltor
2242  0488 96            	ldw	x,sp
2243  0489 1c002b        	addw	x,#OFST-11
2244  048c cd0000        	call	c_ltor
2246                     ; 1037 	int32_t  dwOffset = 0,dwTemp = 0;
2248  048f 96            	ldw	x,sp
2249  0490 1c001f        	addw	x,#OFST-23
2250  0493 cd0000        	call	c_ltor
2254  0496 96            	ldw	x,sp
2255  0497 1c002b        	addw	x,#OFST-11
2256  049a cd0000        	call	c_ltor
2258                     ; 1039 	u8       nRepFlg = 0;
2260                     ; 1045 	MemcpyFunc((u8*)&tyTime, (u8*)&tyReport.Time, sizeof(TypeTime));
2262  049d 4b06          	push	#6
2263  049f ae0004        	ldw	x,#_tyReport+4
2264  04a2 89            	pushw	x
2265  04a3 ae0000        	ldw	x,#_tyTime
2266  04a6 cd0000        	call	_MemcpyFunc
2268  04a9 5b03          	addw	sp,#3
2269                     ; 1046 	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
2271  04ab ae0000        	ldw	x,#_tyTime
2272  04ae 89            	pushw	x
2273  04af ae0006        	ldw	x,#6
2274  04b2 cd0000        	call	_JX_BL_Change
2276  04b5 85            	popw	x
2277                     ; 1047 	MemcpyFunc((u8*)&stLastTime, (u8*)&tyTime, sizeof(TypeTime));
2279  04b6 4b06          	push	#6
2280  04b8 ae0000        	ldw	x,#_tyTime
2281  04bb 89            	pushw	x
2282  04bc 96            	ldw	x,sp
2283  04bd 1c001a        	addw	x,#OFST-28
2284  04c0 cd0000        	call	_MemcpyFunc
2286  04c3 5b03          	addw	sp,#3
2287                     ; 1048 	STM8_RTC_Get(&stTimeNow);
2289  04c5 ae0000        	ldw	x,#_stTimeNow
2290  04c8 cd0000        	call	_STM8_RTC_Get
2292                     ; 1049 	TM_TimeChangeAToB(&stTimeNow, &stEnd);
2294  04cb 96            	ldw	x,sp
2295  04cc 1c0023        	addw	x,#OFST-19
2296  04cf 89            	pushw	x
2297  04d0 ae0000        	ldw	x,#_stTimeNow
2298  04d3 cd0000        	call	_TM_TimeChangeAToB
2300  04d6 85            	popw	x
2301                     ; 1050 	TM_TimeChangeAToB(&stLastTime, &stStar);
2303  04d7 96            	ldw	x,sp
2304  04d8 1c000f        	addw	x,#OFST-39
2305  04db 89            	pushw	x
2306  04dc 1c0008        	addw	x,#8
2307  04df cd0000        	call	_TM_TimeChangeAToB
2309  04e2 85            	popw	x
2310                     ; 1051 	dwOffset = TM_DiffSecond(&stStar, &stEnd);	
2312  04e3 96            	ldw	x,sp
2313  04e4 1c0023        	addw	x,#OFST-19
2314  04e7 89            	pushw	x
2315  04e8 1d0014        	subw	x,#20
2316  04eb cd0000        	call	_TM_DiffSecond
2318  04ee 85            	popw	x
2319  04ef 96            	ldw	x,sp
2320  04f0 1c001f        	addw	x,#OFST-23
2321  04f3 cd0000        	call	c_rtol
2323                     ; 1052 	stEnd.nSecond = 0;	
2325  04f6 0f29          	clr	(OFST-13,sp)
2326                     ; 1053 	MemcpyFunc((u8*)&stTmpTime,  (u8*)&stEnd, sizeof(stTmpTime));
2328  04f8 4b08          	push	#8
2329  04fa 96            	ldw	x,sp
2330  04fb 1c0024        	addw	x,#OFST-18
2331  04fe 89            	pushw	x
2332  04ff 1c000c        	addw	x,#12
2333  0502 cd0000        	call	_MemcpyFunc
2335  0505 5b03          	addw	sp,#3
2336                     ; 1056 	if(0 < dwOffset) 
2338  0507 96            	ldw	x,sp
2339  0508 1c001f        	addw	x,#OFST-23
2340  050b cd0000        	call	c_lzmp
2342  050e 2d52          	jrsle	L156
2343                     ; 1058 		TM_RTimeAddnMinute(&stEnd, (tyReport.wGatherCycle - (u16)((dwOffset/60)%(u32)tyReport.wGatherCycle)));
2345  0510 5500000003    	mov	c_lreg+3,_tyReport
2346  0515 3f02          	clr	c_lreg+2
2347  0517 3f01          	clr	c_lreg+1
2348  0519 3f00          	clr	c_lreg
2349  051b 96            	ldw	x,sp
2350  051c 1c0003        	addw	x,#OFST-51
2351  051f cd0000        	call	c_rtol
2353  0522 96            	ldw	x,sp
2354  0523 1c001f        	addw	x,#OFST-23
2355  0526 cd0000        	call	c_ltor
2357  0529 ae0004        	ldw	x,#L062
2358  052c cd0000        	call	c_ldiv
2360  052f 96            	ldw	x,sp
2361  0530 1c0003        	addw	x,#OFST-51
2362  0533 cd0000        	call	c_lmod
2364  0536 be02          	ldw	x,c_lreg+2
2365  0538 1f01          	ldw	(OFST-53,sp),x
2366  053a c60000        	ld	a,_tyReport
2367  053d 5f            	clrw	x
2368  053e 97            	ld	xl,a
2369  053f 72f001        	subw	x,(OFST-53,sp)
2370  0542 cd0000        	call	c_uitolx
2372  0545 be02          	ldw	x,c_lreg+2
2373  0547 89            	pushw	x
2374  0548 be00          	ldw	x,c_lreg
2375  054a 89            	pushw	x
2376  054b 96            	ldw	x,sp
2377  054c 1c0027        	addw	x,#OFST-15
2378  054f cd0000        	call	_TM_RTimeAddnMinute
2380  0552 5b04          	addw	sp,#4
2381                     ; 1059 		TM_TimeChangeBToA(&stEnd, &g_stNextGmTime); 
2383  0554 ae000f        	ldw	x,#_g_stNextGmTime
2384  0557 89            	pushw	x
2385  0558 96            	ldw	x,sp
2386  0559 1c0025        	addw	x,#OFST-17
2387  055c cd0000        	call	_TM_TimeChangeBToA
2389  055f 85            	popw	x
2391  0560 200f          	jra	L356
2392  0562               L156:
2393                     ; 1063 		MemcpyFunc((u8*)&g_stNextGmTime, (u8*)&stLastTime, sizeof(ST_Time));
2395  0562 4b07          	push	#7
2396  0564 96            	ldw	x,sp
2397  0565 1c0018        	addw	x,#OFST-30
2398  0568 89            	pushw	x
2399  0569 ae000f        	ldw	x,#_g_stNextGmTime
2400  056c cd0000        	call	_MemcpyFunc
2402  056f 5b03          	addw	sp,#3
2403  0571               L356:
2404                     ; 1068 	dwOffset = TM_DiffSecond(&stLastReportT, &stTmpTime);
2406  0571 96            	ldw	x,sp
2407  0572 1c002f        	addw	x,#OFST-7
2408  0575 89            	pushw	x
2409  0576 ae0000        	ldw	x,#_stLastReportT
2410  0579 cd0000        	call	_TM_DiffSecond
2412  057c 85            	popw	x
2413  057d 96            	ldw	x,sp
2414  057e 1c001f        	addw	x,#OFST-23
2415  0581 cd0000        	call	c_rtol
2417                     ; 1069 	dwTemp   = ClaReportTimeToSec(tyReport.cycle);
2419  0584 c60002        	ld	a,_tyReport+2
2420  0587 cd0000        	call	_ClaReportTimeToSec
2422  058a 96            	ldw	x,sp
2423  058b 1c002b        	addw	x,#OFST-11
2424  058e cd0000        	call	c_rtol
2426                     ; 1072 	if(0 < dwOffset) 
2428  0591 96            	ldw	x,sp
2429  0592 1c001f        	addw	x,#OFST-23
2430  0595 cd0000        	call	c_lzmp
2432  0598 2d42          	jrsle	L556
2433                     ; 1074 		TM_RTimeAddnMinute(&stTmpTime, ((dwTemp - (u32)(dwOffset%dwTemp))/60));
2435  059a 96            	ldw	x,sp
2436  059b 1c001f        	addw	x,#OFST-23
2437  059e cd0000        	call	c_ltor
2439  05a1 96            	ldw	x,sp
2440  05a2 1c002b        	addw	x,#OFST-11
2441  05a5 cd0000        	call	c_lumd
2443  05a8 96            	ldw	x,sp
2444  05a9 1c0003        	addw	x,#OFST-51
2445  05ac cd0000        	call	c_rtol
2447  05af 96            	ldw	x,sp
2448  05b0 1c002b        	addw	x,#OFST-11
2449  05b3 cd0000        	call	c_ltor
2451  05b6 96            	ldw	x,sp
2452  05b7 1c0003        	addw	x,#OFST-51
2453  05ba cd0000        	call	c_lsub
2455  05bd ae0004        	ldw	x,#L062
2456  05c0 cd0000        	call	c_ludv
2458  05c3 be02          	ldw	x,c_lreg+2
2459  05c5 89            	pushw	x
2460  05c6 be00          	ldw	x,c_lreg
2461  05c8 89            	pushw	x
2462  05c9 96            	ldw	x,sp
2463  05ca 1c0033        	addw	x,#OFST-3
2464  05cd cd0000        	call	_TM_RTimeAddnMinute
2466  05d0 5b04          	addw	sp,#4
2467                     ; 1075 		TM_TimeChangeBToA(&stTmpTime, &g_stNextRepTime);
2469  05d2 ae0016        	ldw	x,#_g_stNextRepTime
2470  05d5 89            	pushw	x
2471  05d6 96            	ldw	x,sp
2472  05d7 1c0031        	addw	x,#OFST-5
2475  05da 2007          	jra	L756
2476  05dc               L556:
2477                     ; 1079 		TM_TimeChangeBToA(&stLastReportT, &g_stNextRepTime);
2479  05dc ae0016        	ldw	x,#_g_stNextRepTime
2480  05df 89            	pushw	x
2481  05e0 ae0000        	ldw	x,#_stLastReportT
2483  05e3               L756:
2484  05e3 cd0000        	call	_TM_TimeChangeBToA
2485  05e6 85            	popw	x
2486                     ; 1083 	nRepFlg = GetReportFailFlag();
2488  05e7 cd0000        	call	_GetReportFailFlag
2490  05ea 6b1e          	ld	(OFST-24,sp),a
2491                     ; 1084 	if(nRepFlg&REPORT_FAIL_FLG)
2493  05ec a50e          	bcp	a,#14
2494  05ee 2774          	jreq	L166
2495                     ; 1086 		STM8_RTC_Get(&stTimeNow);		
2497  05f0 ae0000        	ldw	x,#_stTimeNow
2498  05f3 cd0000        	call	_STM8_RTC_Get
2500                     ; 1087 		TM_TimeChangeAToB(&stTimeNow, &stTime);
2502  05f6 96            	ldw	x,sp
2503  05f7 1c0007        	addw	x,#OFST-47
2504  05fa 89            	pushw	x
2505  05fb ae0000        	ldw	x,#_stTimeNow
2506  05fe cd0000        	call	_TM_TimeChangeAToB
2508  0601 85            	popw	x
2509                     ; 1088 		MemcpyFunc((u8*)&stTmpTime, (u8*)&stTime, sizeof(TM_Time));
2511  0602 4b08          	push	#8
2512  0604 96            	ldw	x,sp
2513  0605 1c0008        	addw	x,#OFST-46
2514  0608 89            	pushw	x
2515  0609 1c0028        	addw	x,#40
2516  060c cd0000        	call	_MemcpyFunc
2518  060f 5b03          	addw	sp,#3
2519                     ; 1091 		if(nRepFlg&THIRD_REP_FAIL)
2521  0611 7b1e          	ld	a,(OFST-24,sp)
2522  0613 a508          	bcp	a,#8
2523  0615 2711          	jreq	L366
2524                     ; 1096 			if(0x41 == tyReport.cycle)
2526  0617 c60002        	ld	a,_tyReport+2
2527  061a a141          	cp	a,#65
2528  061c 2605          	jrne	L566
2529                     ; 1098 				TM_RTimeAddnMinute(&stTmpTime, 15);
2531  061e ae000f        	ldw	x,#15
2534  0621 2029          	jra	L176
2535  0623               L566:
2536                     ; 1102 				TM_RTimeAddnMinute(&stTmpTime, 540);
2538  0623 ae021c        	ldw	x,#540
2540  0626 2024          	jra	L176
2541  0628               L366:
2542                     ; 1106 		else if(nRepFlg&SECOND_REP_FAIL)
2544  0628 a504          	bcp	a,#4
2545  062a 2711          	jreq	L376
2546                     ; 1111 			if(0x41 == tyReport.cycle)
2548  062c c60002        	ld	a,_tyReport+2
2549  062f a141          	cp	a,#65
2550  0631 2605          	jrne	L576
2551                     ; 1113 				TM_RTimeAddnMinute(&stTmpTime, 10);
2553  0633 ae000a        	ldw	x,#10
2556  0636 2014          	jra	L176
2557  0638               L576:
2558                     ; 1117 				TM_RTimeAddnMinute(&stTmpTime, 360);
2560  0638 ae0168        	ldw	x,#360
2562  063b 200f          	jra	L176
2563  063d               L376:
2564                     ; 1126 			if(0x41 == tyReport.cycle)
2566  063d c60002        	ld	a,_tyReport+2
2567  0640 a141          	cp	a,#65
2568  0642 2605          	jrne	L307
2569                     ; 1128 				TM_RTimeAddnMinute(&stTmpTime, 5);
2571  0644 ae0005        	ldw	x,#5
2574  0647 2003          	jra	L176
2575  0649               L307:
2576                     ; 1132 				TM_RTimeAddnMinute(&stTmpTime, 180);
2578  0649 ae00b4        	ldw	x,#180
2580  064c               L176:
2581  064c 89            	pushw	x
2582  064d 5f            	clrw	x
2583  064e 89            	pushw	x
2584  064f 96            	ldw	x,sp
2585  0650 1c0033        	addw	x,#OFST-3
2586  0653 cd0000        	call	_TM_RTimeAddnMinute
2587  0656 5b04          	addw	sp,#4
2588                     ; 1136 		TM_TimeChangeBToA(&stTmpTime, &g_stNextRepTime);	
2590  0658 ae0016        	ldw	x,#_g_stNextRepTime
2591  065b 89            	pushw	x
2592  065c 96            	ldw	x,sp
2593  065d 1c0031        	addw	x,#OFST-5
2594  0660 cd0000        	call	_TM_TimeChangeBToA
2596  0663 85            	popw	x
2597  0664               L166:
2598                     ; 1140 	ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
2600  0664 4b03          	push	#3
2601  0666 4b0a          	push	#10
2602  0668 ae0000        	ldw	x,#_tyReport
2603  066b cd0000        	call	_ReadParameterForType
2605  066e c60000        	ld	a,_tyReport
2606  0671 85            	popw	x
2607                     ; 1141 	if(0 < tyReport.wGatherCycle)
2609  0672 2725          	jreq	L707
2610                     ; 1143 		dwTmp = tyReport.wGatherCycle;
2612  0674 6b2e          	ld	(OFST-8,sp),a
2613  0676 4f            	clr	a
2614  0677 6b2d          	ld	(OFST-9,sp),a
2615  0679 6b2c          	ld	(OFST-10,sp),a
2616  067b 6b2b          	ld	(OFST-11,sp),a
2617                     ; 1144 		dwCount = dwTmp*60;
2619  067d 96            	ldw	x,sp
2620  067e 1c002b        	addw	x,#OFST-11
2621  0681 cd0000        	call	c_ltor
2623  0684 a63c          	ld	a,#60
2624  0686 cd0000        	call	c_smul
2626  0689 96            	ldw	x,sp
2627  068a 1c002b        	addw	x,#OFST-11
2628  068d cd0000        	call	c_rtol
2631                     ; 1151 	return dwCount;
2633  0690 96            	ldw	x,sp
2634  0691 1c002b        	addw	x,#OFST-11
2635  0694 cd0000        	call	c_ltor
2638  0697 200a          	jra	L033
2639  0699               L707:
2640                     ; 1148 		return LP_WAKEUP_TO;
2642  0699 ae8c00        	ldw	x,#35840
2643  069c bf02          	ldw	c_lreg+2,x
2644  069e ae000a        	ldw	x,#10
2645  06a1 bf00          	ldw	c_lreg,x
2647  06a3               L033:
2649  06a3 5b36          	addw	sp,#54
2650  06a5 81            	ret	
2733                     	xdef	_LP_CheckGuardKeyStat
2734                     	xdef	_LP_WakeUpTerm
2735                     	xdef	_LP_ClaReportTime
2736                     	xdef	_LP_ExitWakeUpProc
2737                     	xdef	_LP_RTC_Config
2738                     	xdef	_LP_CalReportGatherTime
2739                     	xdef	_LP_ADC_DeInit
2740                     	xdef	_LP_UART_DeInit
2741                     	xdef	_LP_TimeDeInit
2742                     	xdef	_LP_EXTI_Configuration
2743                     	xdef	_LP_GPIO_DefaultConfig
2744                     	xdef	_LP_130_CalReportConut
2745                     	switch	.bss
2746  0000               _g_stPowrOnTime:
2747  0000 000000000000  	ds.b	7
2748                     	xdef	_g_stPowrOnTime
2749  0007               _m_stStartTime:
2750  0007 000000000000  	ds.b	8
2751                     	xdef	_m_stStartTime
2752                     	xdef	_m_nDebugFlg
2753                     	xref	_LP_HD_CalReportConut
2754                     	xref	_tyTime
2755                     	xref	_TurnBusUartOff
2756                     	xdef	_LP_DelayMs
2757                     	xdef	_LP_TermReset
2758                     	xdef	_LP_GetKeyWuFlg
2759                     	xdef	_LP_ClrLowPwrStartFlg
2760                     	xdef	_LP_SetLowPwrStartFlg
2761                     	xdef	_LP_SetKeyWuFlg
2762                     	xdef	_LP_BSP_DeInit
2763                     	xdef	_LP_LowPowerManage
2764  000f               _g_stNextGmTime:
2765  000f 000000000000  	ds.b	7
2766                     	xdef	_g_stNextGmTime
2767  0016               _g_stNextRepTime:
2768  0016 000000000000  	ds.b	7
2769                     	xdef	_g_stNextRepTime
2770                     	xref	_STM8_RTC_Get
2771                     	xref	_ReadReportFlag
2772                     	xref	_SaveReportFlag
2773                     	xref	_ReadParameterForType
2774                     	xref	_InitializeFile
2775                     	xref	_ClaReportTimeToSec
2776                     	xref	_GetReportFailFlag
2777                     	xref	_stOptValve
2778                     	xref	_stLastReportT
2779                     	xref	_stTimeNow
2780                     	xref	_tyReport
2781                     	xref	_InitializeBase
2782                     	xref	_TM_RTimeAddnMinute
2783                     	xref	_TM_DiffSecond
2784                     	xref	_TM_TimeChangeBToA
2785                     	xref	_TM_TimeChangeAToB
2786                     	xref	_JX_BL_Change
2787                     	xref	_MemcpyFunc
2788                     	xdef	_RTC_WakeUpCmd
2789                     	xref	_RTC_WaitForSynchro
2790                     	xref	_GPIO_WriteBit
2791                     	xref	_GPIO_Init
2792                     	xref	_EXTI_ClearITPendingBit
2793                     	xref	_EXTI_SelectPort
2794                     	xref	_EXTI_SetPinSensitivity
2795                     	xref	_CLK_PeripheralClockConfig
2796                     	xref.b	c_lreg
2816                     	xref	c_smul
2817                     	xref	c_ludv
2818                     	xref	c_lsub
2819                     	xref	c_lumd
2820                     	xref	c_uitolx
2821                     	xref	c_lmod
2822                     	xref	c_ldiv
2823                     	xref	c_lgadc
2824                     	xref	c_lcmp
2825                     	xref	c_rtol
2826                     	xref	c_lrzmp
2827                     	xref	c_ltor
2828                     	xref	c_lzmp
2829                     	xref	c_lgsbc
2830                     	end
