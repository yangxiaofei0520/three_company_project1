   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 56 uint8_t ITC_GetCPUCC(void)
  32                     ; 57 {
  34                     	switch	.text
  35  0000               _ITC_GetCPUCC:
  39                     ; 59   _asm("push cc");
  42  0000 8a            push cc
  44                     ; 60   _asm("pop a");
  47  0001 84            pop a
  49                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 81            	ret
  75                     ; 87 void ITC_DeInit(void)
  75                     ; 88 {
  76                     	switch	.text
  77  0003               _ITC_DeInit:
  81                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  83  0003 35ff7f70      	mov	32624,#255
  84                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  86  0007 35ff7f71      	mov	32625,#255
  87                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  89  000b 35ff7f72      	mov	32626,#255
  90                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  92  000f 35ff7f73      	mov	32627,#255
  93                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  95  0013 35ff7f74      	mov	32628,#255
  96                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  98  0017 35ff7f75      	mov	32629,#255
  99                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 101  001b 35ff7f76      	mov	32630,#255
 102                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 104  001f 35ff7f77      	mov	32631,#255
 105                     ; 97 }
 108  0023 81            	ret
 133                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 133                     ; 105 {
 134                     	switch	.text
 135  0024               _ITC_GetSoftIntStatus:
 139                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 141  0024 adda          	call	_ITC_GetCPUCC
 143  0026 a428          	and	a,#40
 146  0028 81            	ret
 451                     .const:	section	.text
 452  0000               L22:
 453  0000 0052          	dc.w	L14
 454  0002 0052          	dc.w	L14
 455  0004 0052          	dc.w	L14
 456  0006 005b          	dc.w	L34
 457  0008 005b          	dc.w	L34
 458  000a 005b          	dc.w	L34
 459  000c 005b          	dc.w	L34
 460  000e 0064          	dc.w	L54
 461  0010 0064          	dc.w	L54
 462  0012 0064          	dc.w	L54
 463  0014 0064          	dc.w	L54
 464  0016 006d          	dc.w	L74
 465  0018 006d          	dc.w	L74
 466  001a 006d          	dc.w	L74
 467  001c 006d          	dc.w	L74
 468  001e 0076          	dc.w	L15
 469  0020 0076          	dc.w	L15
 470  0022 0076          	dc.w	L15
 471  0024 0076          	dc.w	L15
 472  0026 007f          	dc.w	L35
 473  0028 007f          	dc.w	L35
 474  002a 007f          	dc.w	L35
 475  002c 007f          	dc.w	L35
 476  002e 0088          	dc.w	L55
 477  0030 0088          	dc.w	L55
 478  0032 0088          	dc.w	L55
 479  0034 0088          	dc.w	L55
 480  0036 0091          	dc.w	L75
 481  0038 0091          	dc.w	L75
 482                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 482                     ; 115 {
 483                     	switch	.text
 484  0029               _ITC_GetSoftwarePriority:
 486  0029 88            	push	a
 487  002a 89            	pushw	x
 488       00000002      OFST:	set	2
 491                     ; 116   uint8_t Value = 0;
 493  002b 0f02          	clr	(OFST+0,sp)
 494                     ; 117   uint8_t Mask = 0;
 496  002d 7b01          	ld	a,(OFST-1,sp)
 497  002f 97            	ld	xl,a
 498                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 500                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 502  0030 7b03          	ld	a,(OFST+1,sp)
 503  0032 a403          	and	a,#3
 504  0034 48            	sll	a
 505  0035 5f            	clrw	x
 506  0036 97            	ld	xl,a
 507  0037 a603          	ld	a,#3
 508  0039 5d            	tnzw	x
 509  003a 2704          	jreq	L41
 510  003c               L61:
 511  003c 48            	sll	a
 512  003d 5a            	decw	x
 513  003e 26fc          	jrne	L61
 514  0040               L41:
 515  0040 6b01          	ld	(OFST-1,sp),a
 516                     ; 125   switch (IRQn)
 518  0042 7b03          	ld	a,(OFST+1,sp)
 520                     ; 223     default:
 520                     ; 224       break;
 521  0044 4a            	dec	a
 522  0045 a11d          	cp	a,#29
 523  0047 2407          	jruge	L02
 524  0049 5f            	clrw	x
 525  004a 97            	ld	xl,a
 526  004b 58            	sllw	x
 527  004c de0000        	ldw	x,(L22,x)
 528  004f fc            	jp	(x)
 529  0050               L02:
 530  0050 2046          	jra	L122
 531  0052               L14:
 532                     ; 127     case FLASH_IRQn:
 532                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 532                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 532                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 534  0052 c67f70        	ld	a,32624
 535  0055 1401          	and	a,(OFST-1,sp)
 536  0057 6b02          	ld	(OFST+0,sp),a
 537                     ; 131       break;
 539  0059 203d          	jra	L122
 540  005b               L34:
 541                     ; 133     case EXTIE_F_PVD_IRQn:
 541                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 541                     ; 135     case RTC_IRQn:
 541                     ; 136     case EXTIB_IRQn:
 541                     ; 137     case EXTID_IRQn:
 541                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 541                     ; 139     case RTC_CSSLSE_IRQn:
 541                     ; 140     case EXTIB_IRQn:
 541                     ; 141     case EXTID_IRQn:
 541                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 541                     ; 143     case RTC_CSSLSE_IRQn:
 541                     ; 144     case EXTIB_G_IRQn:
 541                     ; 145     case EXTID_H_IRQn:
 541                     ; 146 #endif  /* STM8L15X_MD */
 541                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 543  005b c67f71        	ld	a,32625
 544  005e 1401          	and	a,(OFST-1,sp)
 545  0060 6b02          	ld	(OFST+0,sp),a
 546                     ; 148       break;
 548  0062 2034          	jra	L122
 549  0064               L54:
 550                     ; 150     case EXTI0_IRQn:
 550                     ; 151     case EXTI1_IRQn:
 550                     ; 152     case EXTI2_IRQn:
 550                     ; 153     case EXTI3_IRQn:
 550                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 552  0064 c67f72        	ld	a,32626
 553  0067 1401          	and	a,(OFST-1,sp)
 554  0069 6b02          	ld	(OFST+0,sp),a
 555                     ; 155       break;
 557  006b 202b          	jra	L122
 558  006d               L74:
 559                     ; 157     case EXTI4_IRQn:
 559                     ; 158     case EXTI5_IRQn:
 559                     ; 159     case EXTI6_IRQn:
 559                     ; 160     case EXTI7_IRQn:
 559                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 561  006d c67f73        	ld	a,32627
 562  0070 1401          	and	a,(OFST-1,sp)
 563  0072 6b02          	ld	(OFST+0,sp),a
 564                     ; 162       break;
 566  0074 2022          	jra	L122
 567  0076               L15:
 568                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 568                     ; 168 #endif /* STM8L15X_LD */		
 568                     ; 169     case ADC1_COMP_IRQn:
 568                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 568                     ; 171     case LCD_IRQn:
 568                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 568                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 568                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 568                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 568                     ; 176     case LCD_AES_IRQn:
 568                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 568                     ; 178 #endif  /* STM8L15X_MD */
 568                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 570  0076 c67f74        	ld	a,32628
 571  0079 1401          	and	a,(OFST-1,sp)
 572  007b 6b02          	ld	(OFST+0,sp),a
 573                     ; 180       break;
 575  007d 2019          	jra	L122
 576  007f               L35:
 577                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 577                     ; 184 #endif /* STM8L15X_LD */		
 577                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 577                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 577                     ; 187     case TIM2_CC_IRQn:
 577                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 577                     ; 189     case TIM3_CC_IRQn:
 577                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 577                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 577                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 577                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 577                     ; 194 #endif  /* STM8L15X_MD */
 577                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 579  007f c67f75        	ld	a,32629
 580  0082 1401          	and	a,(OFST-1,sp)
 581  0084 6b02          	ld	(OFST+0,sp),a
 582                     ; 196       break;
 584  0086 2010          	jra	L122
 585  0088               L55:
 586                     ; 199     case TIM1_CC_IRQn:
 586                     ; 200 #endif /* STM8L15X_LD */	
 586                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 586                     ; 202     case SPI1_IRQn:
 586                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 586                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 586                     ; 205     case USART1_TX_IRQn:
 586                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 586                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 586                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 586                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 588  0088 c67f76        	ld	a,32630
 589  008b 1401          	and	a,(OFST-1,sp)
 590  008d 6b02          	ld	(OFST+0,sp),a
 591                     ; 210       break;
 593  008f 2007          	jra	L122
 594  0091               L75:
 595                     ; 214     case USART1_RX_IRQn:
 595                     ; 215     case I2C1_IRQn:
 595                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 595                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 595                     ; 218     case I2C1_SPI2_IRQn:
 595                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 595                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 597  0091 c67f77        	ld	a,32631
 598  0094 1401          	and	a,(OFST-1,sp)
 599  0096 6b02          	ld	(OFST+0,sp),a
 600                     ; 221       break;
 602  0098               L16:
 603                     ; 223     default:
 603                     ; 224       break;
 605  0098               L122:
 606                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 608  0098 7b03          	ld	a,(OFST+1,sp)
 609  009a a403          	and	a,#3
 610  009c 48            	sll	a
 611  009d 5f            	clrw	x
 612  009e 97            	ld	xl,a
 613  009f 7b02          	ld	a,(OFST+0,sp)
 614  00a1 5d            	tnzw	x
 615  00a2 2704          	jreq	L42
 616  00a4               L62:
 617  00a4 44            	srl	a
 618  00a5 5a            	decw	x
 619  00a6 26fc          	jrne	L62
 620  00a8               L42:
 621  00a8 6b02          	ld	(OFST+0,sp),a
 622                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 624  00aa 7b02          	ld	a,(OFST+0,sp)
 627  00ac 5b03          	addw	sp,#3
 628  00ae 81            	ret
 688                     	switch	.const
 689  003a               L44:
 690  003a 00ee          	dc.w	L322
 691  003c 00ee          	dc.w	L322
 692  003e 00ee          	dc.w	L322
 693  0040 0100          	dc.w	L522
 694  0042 0100          	dc.w	L522
 695  0044 0100          	dc.w	L522
 696  0046 0100          	dc.w	L522
 697  0048 0112          	dc.w	L722
 698  004a 0112          	dc.w	L722
 699  004c 0112          	dc.w	L722
 700  004e 0112          	dc.w	L722
 701  0050 0124          	dc.w	L132
 702  0052 0124          	dc.w	L132
 703  0054 0124          	dc.w	L132
 704  0056 0124          	dc.w	L132
 705  0058 0136          	dc.w	L332
 706  005a 0136          	dc.w	L332
 707  005c 0136          	dc.w	L332
 708  005e 0136          	dc.w	L332
 709  0060 0148          	dc.w	L532
 710  0062 0148          	dc.w	L532
 711  0064 0148          	dc.w	L532
 712  0066 0148          	dc.w	L532
 713  0068 015a          	dc.w	L732
 714  006a 015a          	dc.w	L732
 715  006c 015a          	dc.w	L732
 716  006e 015a          	dc.w	L732
 717  0070 016c          	dc.w	L142
 718  0072 016c          	dc.w	L142
 719                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 719                     ; 251 {
 720                     	switch	.text
 721  00af               _ITC_SetSoftwarePriority:
 723  00af 89            	pushw	x
 724  00b0 89            	pushw	x
 725       00000002      OFST:	set	2
 728                     ; 252   uint8_t Mask = 0;
 730  00b1 7b01          	ld	a,(OFST-1,sp)
 731  00b3 97            	ld	xl,a
 732                     ; 253   uint8_t NewPriority = 0;
 734  00b4 7b02          	ld	a,(OFST+0,sp)
 735  00b6 97            	ld	xl,a
 736                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 738                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 740                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 742                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 744  00b7 7b03          	ld	a,(OFST+1,sp)
 745  00b9 a403          	and	a,#3
 746  00bb 48            	sll	a
 747  00bc 5f            	clrw	x
 748  00bd 97            	ld	xl,a
 749  00be a603          	ld	a,#3
 750  00c0 5d            	tnzw	x
 751  00c1 2704          	jreq	L23
 752  00c3               L43:
 753  00c3 48            	sll	a
 754  00c4 5a            	decw	x
 755  00c5 26fc          	jrne	L43
 756  00c7               L23:
 757  00c7 43            	cpl	a
 758  00c8 6b01          	ld	(OFST-1,sp),a
 759                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 761  00ca 7b03          	ld	a,(OFST+1,sp)
 762  00cc a403          	and	a,#3
 763  00ce 48            	sll	a
 764  00cf 5f            	clrw	x
 765  00d0 97            	ld	xl,a
 766  00d1 7b04          	ld	a,(OFST+2,sp)
 767  00d3 5d            	tnzw	x
 768  00d4 2704          	jreq	L63
 769  00d6               L04:
 770  00d6 48            	sll	a
 771  00d7 5a            	decw	x
 772  00d8 26fc          	jrne	L04
 773  00da               L63:
 774  00da 6b02          	ld	(OFST+0,sp),a
 775                     ; 268   switch (IRQn)
 777  00dc 7b03          	ld	a,(OFST+1,sp)
 779                     ; 372     default:
 779                     ; 373       break;
 780  00de 4a            	dec	a
 781  00df a11d          	cp	a,#29
 782  00e1 2407          	jruge	L24
 783  00e3 5f            	clrw	x
 784  00e4 97            	ld	xl,a
 785  00e5 58            	sllw	x
 786  00e6 de003a        	ldw	x,(L44,x)
 787  00e9 fc            	jp	(x)
 788  00ea               L24:
 789  00ea ac7c017c      	jpf	L572
 790  00ee               L322:
 791                     ; 270     case FLASH_IRQn:
 791                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 791                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 791                     ; 273       ITC->ISPR1 &= Mask;
 793  00ee c67f70        	ld	a,32624
 794  00f1 1401          	and	a,(OFST-1,sp)
 795  00f3 c77f70        	ld	32624,a
 796                     ; 274       ITC->ISPR1 |= NewPriority;
 798  00f6 c67f70        	ld	a,32624
 799  00f9 1a02          	or	a,(OFST+0,sp)
 800  00fb c77f70        	ld	32624,a
 801                     ; 275       break;
 803  00fe 207c          	jra	L572
 804  0100               L522:
 805                     ; 277     case EXTIE_F_PVD_IRQn:
 805                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 805                     ; 279     case RTC_IRQn:
 805                     ; 280     case EXTIB_IRQn:
 805                     ; 281     case EXTID_IRQn:
 805                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 805                     ; 283     case RTC_CSSLSE_IRQn:
 805                     ; 284     case EXTIB_IRQn:
 805                     ; 285     case EXTID_IRQn:
 805                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 805                     ; 287     case RTC_CSSLSE_IRQn:
 805                     ; 288     case EXTIB_G_IRQn:
 805                     ; 289     case EXTID_H_IRQn:
 805                     ; 290 #endif  /* STM8L15X_MD */
 805                     ; 291       ITC->ISPR2 &= Mask;
 807  0100 c67f71        	ld	a,32625
 808  0103 1401          	and	a,(OFST-1,sp)
 809  0105 c77f71        	ld	32625,a
 810                     ; 292       ITC->ISPR2 |= NewPriority;
 812  0108 c67f71        	ld	a,32625
 813  010b 1a02          	or	a,(OFST+0,sp)
 814  010d c77f71        	ld	32625,a
 815                     ; 293       break;
 817  0110 206a          	jra	L572
 818  0112               L722:
 819                     ; 295     case EXTI0_IRQn:
 819                     ; 296     case EXTI1_IRQn:
 819                     ; 297     case EXTI2_IRQn:
 819                     ; 298     case EXTI3_IRQn:
 819                     ; 299       ITC->ISPR3 &= Mask;
 821  0112 c67f72        	ld	a,32626
 822  0115 1401          	and	a,(OFST-1,sp)
 823  0117 c77f72        	ld	32626,a
 824                     ; 300       ITC->ISPR3 |= NewPriority;
 826  011a c67f72        	ld	a,32626
 827  011d 1a02          	or	a,(OFST+0,sp)
 828  011f c77f72        	ld	32626,a
 829                     ; 301       break;
 831  0122 2058          	jra	L572
 832  0124               L132:
 833                     ; 303     case EXTI4_IRQn:
 833                     ; 304     case EXTI5_IRQn:
 833                     ; 305     case EXTI6_IRQn:
 833                     ; 306     case EXTI7_IRQn:
 833                     ; 307       ITC->ISPR4 &= Mask;
 835  0124 c67f73        	ld	a,32627
 836  0127 1401          	and	a,(OFST-1,sp)
 837  0129 c77f73        	ld	32627,a
 838                     ; 308       ITC->ISPR4 |= NewPriority;
 840  012c c67f73        	ld	a,32627
 841  012f 1a02          	or	a,(OFST+0,sp)
 842  0131 c77f73        	ld	32627,a
 843                     ; 309       break;
 845  0134 2046          	jra	L572
 846  0136               L332:
 847                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 847                     ; 312 #else
 847                     ; 313     case SWITCH_CSS_IRQn:
 847                     ; 314 #endif /*	STM8L15X_LD	*/
 847                     ; 315     case ADC1_COMP_IRQn:
 847                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 847                     ; 317     case LCD_IRQn:
 847                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 847                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 847                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 847                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 847                     ; 322     case LCD_AES_IRQn:
 847                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 847                     ; 324 #endif  /* STM8L15X_MD */
 847                     ; 325       ITC->ISPR5 &= Mask;
 849  0136 c67f74        	ld	a,32628
 850  0139 1401          	and	a,(OFST-1,sp)
 851  013b c77f74        	ld	32628,a
 852                     ; 326       ITC->ISPR5 |= NewPriority;
 854  013e c67f74        	ld	a,32628
 855  0141 1a02          	or	a,(OFST+0,sp)
 856  0143 c77f74        	ld	32628,a
 857                     ; 327       break;
 859  0146 2034          	jra	L572
 860  0148               L532:
 861                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 861                     ; 330 #endif  /* STM8L15X_LD */
 861                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 861                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 861                     ; 333     case TIM2_CC_IRQn:
 861                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 861                     ; 335     case TIM3_CC_IRQn:
 861                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 861                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 861                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 861                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 861                     ; 340 #endif  /* STM8L15X_MD */
 861                     ; 341       ITC->ISPR6 &= Mask;
 863  0148 c67f75        	ld	a,32629
 864  014b 1401          	and	a,(OFST-1,sp)
 865  014d c77f75        	ld	32629,a
 866                     ; 342       ITC->ISPR6 |= NewPriority;
 868  0150 c67f75        	ld	a,32629
 869  0153 1a02          	or	a,(OFST+0,sp)
 870  0155 c77f75        	ld	32629,a
 871                     ; 343       break;
 873  0158 2022          	jra	L572
 874  015a               L732:
 875                     ; 346     case TIM1_CC_IRQn:
 875                     ; 347 #endif  /* STM8L15X_LD */
 875                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 875                     ; 349     case SPI1_IRQn:
 875                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 875                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 875                     ; 352     case USART1_TX_IRQn:
 875                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 875                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 875                     ; 355 #endif  /* STM8L15X_MD */
 875                     ; 356       ITC->ISPR7 &= Mask;
 877  015a c67f76        	ld	a,32630
 878  015d 1401          	and	a,(OFST-1,sp)
 879  015f c77f76        	ld	32630,a
 880                     ; 357       ITC->ISPR7 |= NewPriority;
 882  0162 c67f76        	ld	a,32630
 883  0165 1a02          	or	a,(OFST+0,sp)
 884  0167 c77f76        	ld	32630,a
 885                     ; 358       break;
 887  016a 2010          	jra	L572
 888  016c               L142:
 889                     ; 362     case USART1_RX_IRQn:
 889                     ; 363     case I2C1_IRQn:
 889                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 889                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 889                     ; 366     case I2C1_SPI2_IRQn:
 889                     ; 367 #endif  /* STM8L15X_MD */
 889                     ; 368       ITC->ISPR8 &= Mask;
 891  016c c67f77        	ld	a,32631
 892  016f 1401          	and	a,(OFST-1,sp)
 893  0171 c77f77        	ld	32631,a
 894                     ; 369       ITC->ISPR8 |= NewPriority;
 896  0174 c67f77        	ld	a,32631
 897  0177 1a02          	or	a,(OFST+0,sp)
 898  0179 c77f77        	ld	32631,a
 899                     ; 370       break;
 901  017c               L342:
 902                     ; 372     default:
 902                     ; 373       break;
 904  017c               L572:
 905                     ; 375 }
 908  017c 5b04          	addw	sp,#4
 909  017e 81            	ret
 922                     	xdef	_ITC_GetSoftwarePriority
 923                     	xdef	_ITC_SetSoftwarePriority
 924                     	xdef	_ITC_GetSoftIntStatus
 925                     	xdef	_ITC_GetCPUCC
 926                     	xdef	_ITC_DeInit
 945                     	end
