   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 95 void WFE_DeInit(void)
  32                     ; 96 {
  34                     	switch	.text
  35  0000               _WFE_DeInit:
  39                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  41  0000 725f50a6      	clr	20646
  42                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  44  0004 725f50a7      	clr	20647
  45                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  47  0008 725f50a8      	clr	20648
  48                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  50  000c 725f50a9      	clr	20649
  51                     ; 101 }
  54  0010 81            	ret
 376                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 376                     ; 142 {
 377                     	switch	.text
 378  0011               _WFE_WakeUpSourceEventCmd:
 380  0011 89            	pushw	x
 381  0012 88            	push	a
 382       00000001      OFST:	set	1
 385                     ; 143   uint8_t register_index = 0;
 387  0013 0f01          	clr	(OFST+0,sp)
 388                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 390                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 392                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 394  0015 9e            	ld	a,xh
 395  0016 6b01          	ld	(OFST+0,sp),a
 396                     ; 151   if (NewState != DISABLE)
 398  0018 0d06          	tnz	(OFST+5,sp)
 399  001a 273c          	jreq	L302
 400                     ; 153     switch (register_index)
 402  001c 7b01          	ld	a,(OFST+0,sp)
 404                     ; 171       default:
 404                     ; 172         break;
 405  001e 4a            	dec	a
 406  001f 270b          	jreq	L12
 407  0021 4a            	dec	a
 408  0022 2712          	jreq	L32
 409  0024 4a            	dec	a
 410  0025 2719          	jreq	L52
 411  0027 4a            	dec	a
 412  0028 2720          	jreq	L72
 413  002a 2045          	jra	L112
 414  002c               L12:
 415                     ; 155       case 1:
 415                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 417  002c c650a6        	ld	a,20646
 418  002f 1a03          	or	a,(OFST+2,sp)
 419  0031 c750a6        	ld	20646,a
 420                     ; 157         break;
 422  0034 203b          	jra	L112
 423  0036               L32:
 424                     ; 159       case 2:
 424                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 426  0036 c650a7        	ld	a,20647
 427  0039 1a03          	or	a,(OFST+2,sp)
 428  003b c750a7        	ld	20647,a
 429                     ; 161         break;
 431  003e 2031          	jra	L112
 432  0040               L52:
 433                     ; 163       case 3:
 433                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 435  0040 c650a8        	ld	a,20648
 436  0043 1a03          	or	a,(OFST+2,sp)
 437  0045 c750a8        	ld	20648,a
 438                     ; 165         break;
 440  0048 2027          	jra	L112
 441  004a               L72:
 442                     ; 167       case 4:
 442                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 444  004a c650a9        	ld	a,20649
 445  004d 1a03          	or	a,(OFST+2,sp)
 446  004f c750a9        	ld	20649,a
 447                     ; 169         break;
 449  0052 201d          	jra	L112
 450  0054               L13:
 451                     ; 171       default:
 451                     ; 172         break;
 453  0054 201b          	jra	L112
 454  0056               L702:
 456  0056 2019          	jra	L112
 457  0058               L302:
 458                     ; 177     switch (register_index)
 460  0058 7b01          	ld	a,(OFST+0,sp)
 462                     ; 195       default:
 462                     ; 196         break;
 463  005a 4a            	dec	a
 464  005b 270b          	jreq	L33
 465  005d 4a            	dec	a
 466  005e 2714          	jreq	L53
 467  0060 4a            	dec	a
 468  0061 271c          	jreq	L73
 469  0063 4a            	dec	a
 470  0064 2724          	jreq	L14
 471  0066 2009          	jra	L112
 472  0068               L33:
 473                     ; 179       case 1:
 473                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 475  0068 7b03          	ld	a,(OFST+2,sp)
 476  006a 43            	cpl	a
 477  006b c450a6        	and	a,20646
 478  006e c750a6        	ld	20646,a
 479                     ; 181         break;
 480  0071               L112:
 481                     ; 199 }
 484  0071 5b03          	addw	sp,#3
 485  0073 81            	ret
 486  0074               L53:
 487                     ; 183       case 2:
 487                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 489  0074 7b03          	ld	a,(OFST+2,sp)
 490  0076 43            	cpl	a
 491  0077 c450a7        	and	a,20647
 492  007a c750a7        	ld	20647,a
 493                     ; 185         break;
 495  007d 20f2          	jra	L112
 496  007f               L73:
 497                     ; 187       case 3:
 497                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 499  007f 7b03          	ld	a,(OFST+2,sp)
 500  0081 43            	cpl	a
 501  0082 c450a8        	and	a,20648
 502  0085 c750a8        	ld	20648,a
 503                     ; 189         break;
 505  0088 20e7          	jra	L112
 506  008a               L14:
 507                     ; 191       case 4:
 507                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 509  008a 7b03          	ld	a,(OFST+2,sp)
 510  008c 43            	cpl	a
 511  008d c450a9        	and	a,20649
 512  0090 c750a9        	ld	20649,a
 513                     ; 193         break;
 515  0093 20dc          	jra	L112
 516  0095               L34:
 517                     ; 195       default:
 517                     ; 196         break;
 519  0095 20da          	jra	L112
 520  0097               L512:
 521  0097 20d8          	jra	L112
 568                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 568                     ; 238 {
 569                     	switch	.text
 570  0099               _WFE_GetWakeUpSourceEventStatus:
 572  0099 89            	pushw	x
 573  009a 88            	push	a
 574       00000001      OFST:	set	1
 577                     ; 239   FunctionalState status = DISABLE;
 579  009b 0f01          	clr	(OFST+0,sp)
 580                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 582                     ; 243   switch (WFE_Source)
 585                     ; 326     default:
 585                     ; 327       break;
 586  009d 1d0101        	subw	x,#257
 587  00a0 2603          	jrne	L21
 588  00a2 cc0140        	jp	L712
 589  00a5               L21:
 590  00a5 5a            	decw	x
 591  00a6 2603          	jrne	L41
 592  00a8 cc0140        	jp	L712
 593  00ab               L41:
 594  00ab 1d0002        	subw	x,#2
 595  00ae 2603          	jrne	L61
 596  00b0 cc0140        	jp	L712
 597  00b3               L61:
 598  00b3 1d0004        	subw	x,#4
 599  00b6 2603          	jrne	L02
 600  00b8 cc0140        	jp	L712
 601  00bb               L02:
 602  00bb 1d0008        	subw	x,#8
 603  00be 2602          	jrne	L22
 604  00c0 207e          	jp	L712
 605  00c2               L22:
 606  00c2 1d0010        	subw	x,#16
 607  00c5 2779          	jreq	L712
 608  00c7 1d0020        	subw	x,#32
 609  00ca 2774          	jreq	L712
 610  00cc 1d0040        	subw	x,#64
 611  00cf 276f          	jreq	L712
 612  00d1 1d0081        	subw	x,#129
 613  00d4 277b          	jreq	L122
 614  00d6 5a            	decw	x
 615  00d7 2778          	jreq	L122
 616  00d9 1d0002        	subw	x,#2
 617  00dc 2773          	jreq	L122
 618  00de 1d0004        	subw	x,#4
 619  00e1 276e          	jreq	L122
 620  00e3 1d0008        	subw	x,#8
 621  00e6 2769          	jreq	L122
 622  00e8 1d0010        	subw	x,#16
 623  00eb 2764          	jreq	L122
 624  00ed 1d0020        	subw	x,#32
 625  00f0 275f          	jreq	L122
 626  00f2 1d0040        	subw	x,#64
 627  00f5 275a          	jreq	L122
 628  00f7 1d0081        	subw	x,#129
 629  00fa 2766          	jreq	L322
 630  00fc 5a            	decw	x
 631  00fd 2763          	jreq	L322
 632  00ff 1d0002        	subw	x,#2
 633  0102 275e          	jreq	L322
 634  0104 1d0004        	subw	x,#4
 635  0107 2759          	jreq	L322
 636  0109 1d0008        	subw	x,#8
 637  010c 2754          	jreq	L322
 638  010e 1d0010        	subw	x,#16
 639  0111 274f          	jreq	L322
 640  0113 1d0020        	subw	x,#32
 641  0116 274a          	jreq	L322
 642  0118 1d0040        	subw	x,#64
 643  011b 2745          	jreq	L322
 644  011d 1d0081        	subw	x,#129
 645  0120 2751          	jreq	L522
 646  0122 5a            	decw	x
 647  0123 274e          	jreq	L522
 648  0125 1d0002        	subw	x,#2
 649  0128 2749          	jreq	L522
 650  012a 1d0004        	subw	x,#4
 651  012d 2744          	jreq	L522
 652  012f 1d0008        	subw	x,#8
 653  0132 273f          	jreq	L522
 654  0134 1d0010        	subw	x,#16
 655  0137 273a          	jreq	L522
 656  0139 1d0020        	subw	x,#32
 657  013c 2735          	jreq	L522
 658  013e 2042          	jra	L552
 659  0140               L712:
 660                     ; 245     case WFE_Source_TIM2_EV0:
 660                     ; 246     case WFE_Source_TIM2_EV1:
 660                     ; 247     case WFE_Source_TIM1_EV0:
 660                     ; 248     case WFE_Source_TIM1_EV1:
 660                     ; 249     case WFE_Source_EXTI_EV0:
 660                     ; 250     case WFE_Source_EXTI_EV1:
 660                     ; 251     case WFE_Source_EXTI_EV2:
 660                     ; 252     case WFE_Source_EXTI_EV3:
 660                     ; 253 
 660                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 662  0140 c650a6        	ld	a,20646
 663  0143 1503          	bcp	a,(OFST+2,sp)
 664  0145 2706          	jreq	L752
 665                     ; 257         status = ENABLE;
 667  0147 a601          	ld	a,#1
 668  0149 6b01          	ld	(OFST+0,sp),a
 670  014b 2035          	jra	L552
 671  014d               L752:
 672                     ; 262         status = DISABLE;
 674  014d 0f01          	clr	(OFST+0,sp)
 675  014f 2031          	jra	L552
 676  0151               L122:
 677                     ; 266     case WFE_Source_EXTI_EV4:
 677                     ; 267     case WFE_Source_EXTI_EV5:
 677                     ; 268     case WFE_Source_EXTI_EV6:
 677                     ; 269     case WFE_Source_EXTI_EV7:
 677                     ; 270     case WFE_Source_EXTI_EVB_G:
 677                     ; 271     case WFE_Source_EXTI_EVD_H:
 677                     ; 272     case WFE_Source_EXTI_EVE_F:
 677                     ; 273     case WFE_Source_ADC1_COMP_EV:
 677                     ; 274 
 677                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 679  0151 c650a7        	ld	a,20647
 680  0154 1503          	bcp	a,(OFST+2,sp)
 681  0156 2706          	jreq	L362
 682                     ; 278         status = ENABLE;
 684  0158 a601          	ld	a,#1
 685  015a 6b01          	ld	(OFST+0,sp),a
 687  015c 2024          	jra	L552
 688  015e               L362:
 689                     ; 283         status = DISABLE;
 691  015e 0f01          	clr	(OFST+0,sp)
 692  0160 2020          	jra	L552
 693  0162               L322:
 694                     ; 286     case WFE_Source_TIM3_EV0:
 694                     ; 287     case WFE_Source_TIM3_EV1:
 694                     ; 288     case WFE_Source_TIM4_EV:
 694                     ; 289     case WFE_Source_SPI1_EV:
 694                     ; 290     case WFE_Source_I2C1_EV:
 694                     ; 291     case WFE_Source_USART1_EV:
 694                     ; 292     case WFE_Source_DMA1CH01_EV:
 694                     ; 293     case WFE_Source_DMA1CH23_EV:
 694                     ; 294 
 694                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 696  0162 c650a8        	ld	a,20648
 697  0165 1503          	bcp	a,(OFST+2,sp)
 698  0167 2706          	jreq	L762
 699                     ; 298         status = ENABLE;
 701  0169 a601          	ld	a,#1
 702  016b 6b01          	ld	(OFST+0,sp),a
 704  016d 2013          	jra	L552
 705  016f               L762:
 706                     ; 303         status = DISABLE;
 708  016f 0f01          	clr	(OFST+0,sp)
 709  0171 200f          	jra	L552
 710  0173               L522:
 711                     ; 307     case WFE_Source_TIM5_EV0:
 711                     ; 308     case WFE_Source_TIM5_EV1:
 711                     ; 309     case WFE_Source_AES_EV:
 711                     ; 310     case WFE_Source_SPI2_EV:
 711                     ; 311     case WFE_Source_USART2_EV:
 711                     ; 312     case WFE_Source_USART3_EV:
 711                     ; 313     case WFE_Source_RTC_CSS_EV:
 711                     ; 314 
 711                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 713  0173 c650a9        	ld	a,20649
 714  0176 1503          	bcp	a,(OFST+2,sp)
 715  0178 2706          	jreq	L372
 716                     ; 318         status = ENABLE;
 718  017a a601          	ld	a,#1
 719  017c 6b01          	ld	(OFST+0,sp),a
 721  017e 2002          	jra	L552
 722  0180               L372:
 723                     ; 323         status = DISABLE;
 725  0180 0f01          	clr	(OFST+0,sp)
 726  0182               L722:
 727                     ; 326     default:
 727                     ; 327       break;
 729  0182               L552:
 730                     ; 329   return status;
 732  0182 7b01          	ld	a,(OFST+0,sp)
 735  0184 5b03          	addw	sp,#3
 736  0186 81            	ret
 749                     	xdef	_WFE_GetWakeUpSourceEventStatus
 750                     	xdef	_WFE_WakeUpSourceEventCmd
 751                     	xdef	_WFE_DeInit
 770                     	end
