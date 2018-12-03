   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 55 INTERRUPT void TRAP_IRQHandler(void)
  33                     ; 56 {
  34                     	switch	.text
  35  0000               f_TRAP_IRQHandler:
  40                     ; 60 }
  43  0000 80            	iret	
  66                     ; 70 INTERRUPT void NonHandledInterrupt(void)
  66                     ; 71 {
  67                     	switch	.text
  68  0001               f_NonHandledInterrupt:
  73                     ; 73 }
  77  0001 80            	iret	
 101                     ; 82 INTERRUPT void RTC_CSSLSE_IRQHandler(void)
 101                     ; 83 {
 102                     	switch	.text
 103  0002               f_RTC_CSSLSE_IRQHandler:
 106  0002 3b0002        	push	c_x+2
 107  0005 be00          	ldw	x,c_x
 108  0007 89            	pushw	x
 109  0008 3b0002        	push	c_y+2
 110  000b be00          	ldw	x,c_y
 111  000d 89            	pushw	x
 114                     ; 84 	LP_SetKeyWuFlg(WU_MODE_AUTO);
 116  000e a602          	ld	a,#2
 117  0010 cd0000        	call	_LP_SetKeyWuFlg
 119                     ; 86 	RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT_WUT >> 4);
 121  0013 35fb514d      	mov	20813,#251
 122                     ; 87 }
 125  0017 85            	popw	x
 126  0018 bf00          	ldw	c_y,x
 127  001a 320002        	pop	c_y+2
 128  001d 85            	popw	x
 129  001e bf00          	ldw	c_x,x
 130  0020 320002        	pop	c_x+2
 131  0023 80            	iret	
 155                     ; 96 INTERRUPT void EXTI0_IRQHandler(void)
 155                     ; 97 {
 156                     	switch	.text
 157  0024               f_EXTI0_IRQHandler:
 160  0024 3b0002        	push	c_x+2
 161  0027 be00          	ldw	x,c_x
 162  0029 89            	pushw	x
 163  002a 3b0002        	push	c_y+2
 164  002d be00          	ldw	x,c_y
 165  002f 89            	pushw	x
 168                     ; 98 	LP_SetKeyWuFlg(WU_MODE_KEY);
 170  0030 a601          	ld	a,#1
 171  0032 cd0000        	call	_LP_SetKeyWuFlg
 173                     ; 99 	EXTI_ClearITPendingBit(WAKE_UP_EXTIT_PIN);	
 175  0035 ae0001        	ldw	x,#1
 176  0038 cd0000        	call	_EXTI_ClearITPendingBit
 178                     ; 100 }
 181  003b 85            	popw	x
 182  003c bf00          	ldw	c_y,x
 183  003e 320002        	pop	c_y+2
 184  0041 85            	popw	x
 185  0042 bf00          	ldw	c_x,x
 186  0044 320002        	pop	c_x+2
 187  0047 80            	iret	
 211                     ; 109 INTERRUPT void EXTI2_IRQHandler(void)
 211                     ; 110 {
 212                     	switch	.text
 213  0048               f_EXTI2_IRQHandler:
 216  0048 3b0002        	push	c_x+2
 217  004b be00          	ldw	x,c_x
 218  004d 89            	pushw	x
 219  004e 3b0002        	push	c_y+2
 220  0051 be00          	ldw	x,c_y
 221  0053 89            	pushw	x
 224                     ; 111 	LP_SetKeyWuFlg(WU_MODE_KEY);
 226  0054 a601          	ld	a,#1
 227  0056 cd0000        	call	_LP_SetKeyWuFlg
 229                     ; 112 	EXTI_ClearITPendingBit(WAKE_UP_EXTIT_PIN);
 231  0059 ae0001        	ldw	x,#1
 232  005c cd0000        	call	_EXTI_ClearITPendingBit
 234                     ; 113 }
 237  005f 85            	popw	x
 238  0060 bf00          	ldw	c_y,x
 239  0062 320002        	pop	c_y+2
 240  0065 85            	popw	x
 241  0066 bf00          	ldw	c_x,x
 242  0068 320002        	pop	c_x+2
 243  006b 80            	iret	
 271                     ; 122 INTERRUPT void EXTI4_IRQHandler(void)
 271                     ; 123 {
 272                     	switch	.text
 273  006c               f_EXTI4_IRQHandler:
 276  006c 3b0002        	push	c_x+2
 277  006f be00          	ldw	x,c_x
 278  0071 89            	pushw	x
 279  0072 3b0002        	push	c_y+2
 280  0075 be00          	ldw	x,c_y
 281  0077 89            	pushw	x
 284                     ; 124 	nReceiveDataFlg = TRUE;	
 286  0078 35010000      	mov	_nReceiveDataFlg,#1
 287                     ; 125 	ucNumberBusUart2SoftReceive = 0;		//接收数据2位数
 289  007c 725f0000      	clr	_ucNumberBusUart2SoftReceive
 290                     ; 127 	if(!CheckUart2Rx())
 292  0080 4b10          	push	#16
 293  0082 ae500f        	ldw	x,#20495
 294  0085 cd0000        	call	_GPIO_ReadInputDataBit
 296  0088 5b01          	addw	sp,#1
 297  008a 4d            	tnz	a
 298  008b 2606          	jrne	L17
 299                     ; 129 		ReceivedBusUart2();
 301  008d cd0000        	call	_ReceivedBusUart2
 303                     ; 130 		TurnOnTimerUart();
 305  0090 cd0000        	call	_TurnOnTimerUart
 307  0093               L17:
 308                     ; 133 	EXTI_ClearITPendingBit(EXTI_IT_Pin4);
 310  0093 ae0010        	ldw	x,#16
 311  0096 cd0000        	call	_EXTI_ClearITPendingBit
 313                     ; 134 }
 316  0099 85            	popw	x
 317  009a bf00          	ldw	c_y,x
 318  009c 320002        	pop	c_y+2
 319  009f 85            	popw	x
 320  00a0 bf00          	ldw	c_x,x
 321  00a2 320002        	pop	c_x+2
 322  00a5 80            	iret	
 346                     ; 143 INTERRUPT void TIM1_UPD_OVF_TRG_COM_IRQHandler(void)
 346                     ; 144 {
 347                     	switch	.text
 348  00a6               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 351  00a6 3b0002        	push	c_x+2
 352  00a9 be00          	ldw	x,c_x
 353  00ab 89            	pushw	x
 354  00ac 3b0002        	push	c_y+2
 355  00af be00          	ldw	x,c_y
 356  00b1 89            	pushw	x
 359                     ; 145 	HandleBusUartSoft();		//软件UART处理
 361  00b2 cd0000        	call	_HandleBusUartSoft
 363                     ; 146 	TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG_Update));
 365  00b5 35fe52b6      	mov	21174,#254
 366                     ; 147 	TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG_Update >> 8))) & (uint8_t)0x1E);
 368  00b9 351e52b7      	mov	21175,#30
 369                     ; 148 }
 372  00bd 85            	popw	x
 373  00be bf00          	ldw	c_y,x
 374  00c0 320002        	pop	c_y+2
 375  00c3 85            	popw	x
 376  00c4 bf00          	ldw	c_x,x
 377  00c6 320002        	pop	c_x+2
 378  00c9 80            	iret	
 405                     ; 156 INTERRUPT void TIM4_UPD_OVF_TRG_IRQHandler(void)
 405                     ; 157 {
 406                     	switch	.text
 407  00ca               f_TIM4_UPD_OVF_TRG_IRQHandler:
 410  00ca 3b0002        	push	c_x+2
 411  00cd be00          	ldw	x,c_x
 412  00cf 89            	pushw	x
 413  00d0 3b0002        	push	c_y+2
 414  00d3 be00          	ldw	x,c_y
 415  00d5 89            	pushw	x
 418                     ; 162 	if(SOLFDOG_TO < g_wIwdgTick++)
 420  00d6 ce0000        	ldw	x,_g_wIwdgTick
 421  00d9 5c            	incw	x
 422  00da cf0000        	ldw	_g_wIwdgTick,x
 423  00dd 5a            	decw	x
 424  00de a31f41        	cpw	x,#8001
 425  00e1 2507          	jrult	L311
 426                     ; 164 		g_wIwdgTick = 0;
 428  00e3 5f            	clrw	x
 429  00e4 cf0000        	ldw	_g_wIwdgTick,x
 430                     ; 165 		LP_TermReset();
 432  00e7 cd0000        	call	_LP_TermReset
 434  00ea               L311:
 435                     ; 168 	if(IWDG_FEED_TO < g_wIwdgTickExt++)
 437  00ea ce0000        	ldw	x,_g_wIwdgTickExt
 438  00ed 5c            	incw	x
 439  00ee cf0000        	ldw	_g_wIwdgTickExt,x
 440  00f1 5a            	decw	x
 441  00f2 a303e9        	cpw	x,#1001
 442  00f5 2508          	jrult	L511
 443                     ; 170 		IWDG->KR = IWDG_KEY_REFRESH;
 445  00f7 35aa50e0      	mov	20704,#170
 446                     ; 171 		g_wIwdgTickExt = 0;
 448  00fb 5f            	clrw	x
 449  00fc cf0000        	ldw	_g_wIwdgTickExt,x
 450  00ff               L511:
 451                     ; 174 	g_dwSysTick++;
 453  00ff ae0000        	ldw	x,#_g_dwSysTick
 454  0102 a601          	ld	a,#1
 455  0104 cd0000        	call	c_lgadc
 457                     ; 175 	TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT_Update);
 459  0107 35fe52e5      	mov	21221,#254
 460                     ; 176 }
 463  010b 85            	popw	x
 464  010c bf00          	ldw	c_y,x
 465  010e 320002        	pop	c_y+2
 466  0111 85            	popw	x
 467  0112 bf00          	ldw	c_x,x
 468  0114 320002        	pop	c_x+2
 469  0117 80            	iret	
 494                     ; 183 INTERRUPT void USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler(void)
 494                     ; 184 {
 495                     	switch	.text
 496  0118               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 499  0118 3b0002        	push	c_x+2
 500  011b be00          	ldw	x,c_x
 501  011d 89            	pushw	x
 502  011e 3b0002        	push	c_y+2
 503  0121 be00          	ldw	x,c_y
 504  0123 89            	pushw	x
 507                     ; 189 	USART1->SR &= (uint8_t)(~USART_SR_TC);
 509  0124 721d5230      	bres	21040,#6
 510                     ; 190 	SendBusUartOver();
 512  0128 cd0000        	call	_SendBusUartOver
 514                     ; 191 }
 517  012b 85            	popw	x
 518  012c bf00          	ldw	c_y,x
 519  012e 320002        	pop	c_y+2
 520  0131 85            	popw	x
 521  0132 bf00          	ldw	c_x,x
 522  0134 320002        	pop	c_x+2
 523  0137 80            	iret	
 547                     ; 198 INTERRUPT void USART1_RX_TIM5_CC_IRQHandler(void)
 547                     ; 199 {
 548                     	switch	.text
 549  0138               f_USART1_RX_TIM5_CC_IRQHandler:
 552  0138 3b0002        	push	c_x+2
 553  013b be00          	ldw	x,c_x
 554  013d 89            	pushw	x
 555  013e 3b0002        	push	c_y+2
 556  0141 be00          	ldw	x,c_y
 557  0143 89            	pushw	x
 560                     ; 203     ReceivedBusUart();
 562  0144 cd0000        	call	_ReceivedBusUart
 564                     ; 205 	USART1->SR &= (uint8_t)(~USART_SR_TC);
 566  0147 721d5230      	bres	21040,#6
 567                     ; 206 }
 570  014b 85            	popw	x
 571  014c bf00          	ldw	c_y,x
 572  014e 320002        	pop	c_y+2
 573  0151 85            	popw	x
 574  0152 bf00          	ldw	c_x,x
 575  0154 320002        	pop	c_x+2
 576  0157 80            	iret	
 588                     	xref	_g_wIwdgTickExt
 589                     	xref	_LP_TermReset
 590                     	xref	_LP_SetKeyWuFlg
 591                     	xref	_nReceiveDataFlg
 592                     	xref	_TurnOnTimerUart
 593                     	xref	_SendBusUartOver
 594                     	xref	_ReceivedBusUart2
 595                     	xref	_ReceivedBusUart
 596                     	xref	_HandleBusUartSoft
 597                     	xref	_ucNumberBusUart2SoftReceive
 598                     	xref	_g_wIwdgTick
 599                     	xref	_g_dwSysTick
 600                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
 601                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
 602                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
 603                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
 604                     	xdef	f_EXTI4_IRQHandler
 605                     	xdef	f_EXTI2_IRQHandler
 606                     	xdef	f_EXTI0_IRQHandler
 607                     	xdef	f_RTC_CSSLSE_IRQHandler
 608                     	xdef	f_TRAP_IRQHandler
 609                     	xdef	f_NonHandledInterrupt
 610                     	xref	_GPIO_ReadInputDataBit
 611                     	xref	_EXTI_ClearITPendingBit
 612                     	xref.b	c_x
 613                     	xref.b	c_y
 632                     	xref	c_lgadc
 633                     	end
