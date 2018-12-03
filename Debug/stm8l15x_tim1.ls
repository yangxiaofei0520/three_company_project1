   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 181 void TIM1_DeInit(void)
  32                     ; 182 {
  34                     	switch	.text
  35  0000               _TIM1_DeInit:
  39                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  41  0000 725f52b0      	clr	21168
  42                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  44  0004 725f52b1      	clr	21169
  45                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  47  0008 725f52b2      	clr	21170
  48                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  50  000c 725f52b3      	clr	21171
  51                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  53  0010 725f52b5      	clr	21173
  54                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  56  0014 725f52bd      	clr	21181
  57                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  59  0018 725f52be      	clr	21182
  60                     ; 193   TIM1->CCMR1 = 0x01;
  62  001c 350152b9      	mov	21177,#1
  63                     ; 194   TIM1->CCMR2 = 0x01;
  65  0020 350152ba      	mov	21178,#1
  66                     ; 195   TIM1->CCMR3 = 0x01;
  68  0024 350152bb      	mov	21179,#1
  69                     ; 196   TIM1->CCMR4 = 0x01;
  71  0028 350152bc      	mov	21180,#1
  72                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  74  002c 725f52bd      	clr	21181
  75                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  77  0030 725f52be      	clr	21182
  78                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  80  0034 725f52b9      	clr	21177
  81                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  83  0038 725f52ba      	clr	21178
  84                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  86  003c 725f52bb      	clr	21179
  87                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  89  0040 725f52bc      	clr	21180
  90                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  92  0044 725f52bf      	clr	21183
  93                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  95  0048 725f52c0      	clr	21184
  96                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  98  004c 725f52c1      	clr	21185
  99                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 101  0050 725f52c2      	clr	21186
 102                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 104  0054 35ff52c3      	mov	21187,#255
 105                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 107  0058 35ff52c4      	mov	21188,#255
 108                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 110  005c 725f52c6      	clr	21190
 111                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 113  0060 725f52c7      	clr	21191
 114                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 116  0064 725f52c8      	clr	21192
 117                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 119  0068 725f52c9      	clr	21193
 120                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 122  006c 725f52ca      	clr	21194
 123                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 125  0070 725f52cb      	clr	21195
 126                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 128  0074 725f52cc      	clr	21196
 129                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 131  0078 725f52cd      	clr	21197
 132                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 134  007c 725f52d0      	clr	21200
 135                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 137  0080 350152b8      	mov	21176,#1
 138                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 140  0084 725f52cf      	clr	21199
 141                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 143  0088 725f52ce      	clr	21198
 144                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 146  008c 725f52c5      	clr	21189
 147                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 149  0090 725f52b6      	clr	21174
 150                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 152  0094 725f52b7      	clr	21175
 153                     ; 225 }
 156  0098 81            	ret
 259                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 259                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 259                     ; 243                        uint16_t TIM1_Period,
 259                     ; 244                        uint8_t TIM1_RepetitionCounter)
 259                     ; 245 {
 260                     	switch	.text
 261  0099               _TIM1_TimeBaseInit:
 263  0099 89            	pushw	x
 264       00000000      OFST:	set	0
 267                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 269                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 271  009a 7b06          	ld	a,(OFST+6,sp)
 272  009c c752c3        	ld	21187,a
 273                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 275  009f 7b07          	ld	a,(OFST+7,sp)
 276  00a1 c752c4        	ld	21188,a
 277                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 279  00a4 9e            	ld	a,xh
 280  00a5 c752c1        	ld	21185,a
 281                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 283  00a8 9f            	ld	a,xl
 284  00a9 c752c2        	ld	21186,a
 285                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 285                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 287  00ac c652b0        	ld	a,21168
 288  00af a48f          	and	a,#143
 289  00b1 1a05          	or	a,(OFST+5,sp)
 290  00b3 c752b0        	ld	21168,a
 291                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 293  00b6 7b08          	ld	a,(OFST+8,sp)
 294  00b8 c752c5        	ld	21189,a
 295                     ; 265 }
 298  00bb 85            	popw	x
 299  00bc 81            	ret
 364                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 364                     ; 280 {
 365                     	switch	.text
 366  00bd               _TIM1_PrescalerConfig:
 368  00bd 89            	pushw	x
 369       00000000      OFST:	set	0
 372                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 374                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 376  00be 9e            	ld	a,xh
 377  00bf c752c1        	ld	21185,a
 378                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 380  00c2 9f            	ld	a,xl
 381  00c3 c752c2        	ld	21186,a
 382                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 384  00c6 7b05          	ld	a,(OFST+5,sp)
 385  00c8 c752b8        	ld	21176,a
 386                     ; 290 }
 389  00cb 85            	popw	x
 390  00cc 81            	ret
 426                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 426                     ; 304 {
 427                     	switch	.text
 428  00cd               _TIM1_CounterModeConfig:
 430  00cd 88            	push	a
 431       00000000      OFST:	set	0
 434                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 436                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 436                     ; 311                         | (uint8_t)TIM1_CounterMode);
 438  00ce c652b0        	ld	a,21168
 439  00d1 a48f          	and	a,#143
 440  00d3 1a01          	or	a,(OFST+1,sp)
 441  00d5 c752b0        	ld	21168,a
 442                     ; 312 }
 445  00d8 84            	pop	a
 446  00d9 81            	ret
 478                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 478                     ; 321 {
 479                     	switch	.text
 480  00da               _TIM1_SetCounter:
 484                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 486  00da 9e            	ld	a,xh
 487  00db c752bf        	ld	21183,a
 488                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 490  00de 9f            	ld	a,xl
 491  00df c752c0        	ld	21184,a
 492                     ; 325 }
 495  00e2 81            	ret
 527                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 527                     ; 334 {
 528                     	switch	.text
 529  00e3               _TIM1_SetAutoreload:
 533                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 535  00e3 9e            	ld	a,xh
 536  00e4 c752c3        	ld	21187,a
 537                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 539  00e7 9f            	ld	a,xl
 540  00e8 c752c4        	ld	21188,a
 541                     ; 338 }
 544  00eb 81            	ret
 590                     ; 345 uint16_t TIM1_GetCounter(void)
 590                     ; 346 {
 591                     	switch	.text
 592  00ec               _TIM1_GetCounter:
 594  00ec 5204          	subw	sp,#4
 595       00000004      OFST:	set	4
 598                     ; 348   uint16_t tmpcntr = 0;
 600  00ee 1e03          	ldw	x,(OFST-1,sp)
 601                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 603  00f0 7b01          	ld	a,(OFST-3,sp)
 604  00f2 97            	ld	xl,a
 607  00f3 7b02          	ld	a,(OFST-2,sp)
 608  00f5 97            	ld	xl,a
 609                     ; 351   tmpcntrh = TIM1->CNTRH;
 611  00f6 c652bf        	ld	a,21183
 612  00f9 6b02          	ld	(OFST-2,sp),a
 613                     ; 352   tmpcntrl = TIM1->CNTRL;
 615  00fb c652c0        	ld	a,21184
 616  00fe 6b01          	ld	(OFST-3,sp),a
 617                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 619  0100 7b01          	ld	a,(OFST-3,sp)
 620  0102 5f            	clrw	x
 621  0103 97            	ld	xl,a
 622  0104 1f03          	ldw	(OFST-1,sp),x
 623                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 625  0106 7b02          	ld	a,(OFST-2,sp)
 626  0108 5f            	clrw	x
 627  0109 97            	ld	xl,a
 628  010a 4f            	clr	a
 629  010b 02            	rlwa	x,a
 630  010c 01            	rrwa	x,a
 631  010d 1a04          	or	a,(OFST+0,sp)
 632  010f 01            	rrwa	x,a
 633  0110 1a03          	or	a,(OFST-1,sp)
 634  0112 01            	rrwa	x,a
 635  0113 1f03          	ldw	(OFST-1,sp),x
 636                     ; 358   return (uint16_t)tmpcntr;
 638  0115 1e03          	ldw	x,(OFST-1,sp)
 641  0117 5b04          	addw	sp,#4
 642  0119 81            	ret
 674                     ; 366 uint16_t TIM1_GetPrescaler(void)
 674                     ; 367 {
 675                     	switch	.text
 676  011a               _TIM1_GetPrescaler:
 678  011a 89            	pushw	x
 679       00000002      OFST:	set	2
 682                     ; 368   uint16_t tmpreg = 0;
 684  011b 5f            	clrw	x
 685  011c 1f01          	ldw	(OFST-1,sp),x
 686                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 688  011e c652c1        	ld	a,21185
 689  0121 5f            	clrw	x
 690  0122 97            	ld	xl,a
 691  0123 4f            	clr	a
 692  0124 02            	rlwa	x,a
 693  0125 1f01          	ldw	(OFST-1,sp),x
 694                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 696  0127 c652c2        	ld	a,21186
 697  012a 5f            	clrw	x
 698  012b 97            	ld	xl,a
 699  012c 01            	rrwa	x,a
 700  012d 1a02          	or	a,(OFST+0,sp)
 701  012f 01            	rrwa	x,a
 702  0130 1a01          	or	a,(OFST-1,sp)
 703  0132 01            	rrwa	x,a
 706  0133 5b02          	addw	sp,#2
 707  0135 81            	ret
 763                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 763                     ; 381 {
 764                     	switch	.text
 765  0136               _TIM1_UpdateDisableConfig:
 769                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 771                     ; 386   if (NewState != DISABLE)
 773  0136 4d            	tnz	a
 774  0137 2706          	jreq	L352
 775                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 777  0139 721252b0      	bset	21168,#1
 779  013d 2004          	jra	L552
 780  013f               L352:
 781                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 783  013f 721352b0      	bres	21168,#1
 784  0143               L552:
 785                     ; 394 }
 788  0143 81            	ret
 846                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 846                     ; 405 {
 847                     	switch	.text
 848  0144               _TIM1_UpdateRequestConfig:
 852                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 854                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 856  0144 4d            	tnz	a
 857  0145 2706          	jreq	L503
 858                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 860  0147 721452b0      	bset	21168,#2
 862  014b 2004          	jra	L703
 863  014d               L503:
 864                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 866  014d 721552b0      	bres	21168,#2
 867  0151               L703:
 868                     ; 418 }
 871  0151 81            	ret
 907                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 907                     ; 427 {
 908                     	switch	.text
 909  0152               _TIM1_ARRPreloadConfig:
 913                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 915                     ; 432   if (NewState != DISABLE)
 917  0152 4d            	tnz	a
 918  0153 2706          	jreq	L723
 919                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 921  0155 721e52b0      	bset	21168,#7
 923  0159 2004          	jra	L133
 924  015b               L723:
 925                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 927  015b 721f52b0      	bres	21168,#7
 928  015f               L133:
 929                     ; 440 }
 932  015f 81            	ret
 989                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 989                     ; 451 {
 990                     	switch	.text
 991  0160               _TIM1_SelectOnePulseMode:
 995                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
 997                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
 999  0160 4d            	tnz	a
1000  0161 2706          	jreq	L163
1001                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1003  0163 721652b0      	bset	21168,#3
1005  0167 2004          	jra	L363
1006  0169               L163:
1007                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1009  0169 721752b0      	bres	21168,#3
1010  016d               L363:
1011                     ; 464 }
1014  016d 81            	ret
1049                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1049                     ; 473 {
1050                     	switch	.text
1051  016e               _TIM1_Cmd:
1055                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1057                     ; 478   if (NewState != DISABLE)
1059  016e 4d            	tnz	a
1060  016f 2706          	jreq	L304
1061                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1063  0171 721052b0      	bset	21168,#0
1065  0175 2004          	jra	L504
1066  0177               L304:
1067                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1069  0177 721152b0      	bres	21168,#0
1070  017b               L504:
1071                     ; 486 }
1074  017b 81            	ret
1357                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1357                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1357                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1357                     ; 580                   uint16_t TIM1_Pulse,
1357                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1357                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1357                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1357                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1357                     ; 585 {
1358                     	switch	.text
1359  017c               _TIM1_OC1Init:
1361  017c 89            	pushw	x
1362  017d 5203          	subw	sp,#3
1363       00000003      OFST:	set	3
1366                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1368                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1370                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1372                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1374                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1376                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1378                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1380                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1380                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1382  017f c652bd        	ld	a,21181
1383  0182 a4f0          	and	a,#240
1384  0184 c752bd        	ld	21181,a
1385                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1385                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1385                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1385                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1387  0187 7b0c          	ld	a,(OFST+9,sp)
1388  0189 a408          	and	a,#8
1389  018b 6b03          	ld	(OFST+0,sp),a
1390  018d 7b0b          	ld	a,(OFST+8,sp)
1391  018f a402          	and	a,#2
1392  0191 1a03          	or	a,(OFST+0,sp)
1393  0193 6b02          	ld	(OFST-1,sp),a
1394  0195 7b08          	ld	a,(OFST+5,sp)
1395  0197 a404          	and	a,#4
1396  0199 6b01          	ld	(OFST-2,sp),a
1397  019b 9f            	ld	a,xl
1398  019c a401          	and	a,#1
1399  019e 1a01          	or	a,(OFST-2,sp)
1400  01a0 1a02          	or	a,(OFST-1,sp)
1401  01a2 ca52bd        	or	a,21181
1402  01a5 c752bd        	ld	21181,a
1403                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1403                     ; 608                           | (uint8_t)TIM1_OCMode);
1405  01a8 c652b9        	ld	a,21177
1406  01ab a48f          	and	a,#143
1407  01ad 1a04          	or	a,(OFST+1,sp)
1408  01af c752b9        	ld	21177,a
1409                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1411  01b2 c652d0        	ld	a,21200
1412  01b5 a4fc          	and	a,#252
1413  01b7 c752d0        	ld	21200,a
1414                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1414                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1416  01ba 7b0e          	ld	a,(OFST+11,sp)
1417  01bc a402          	and	a,#2
1418  01be 6b03          	ld	(OFST+0,sp),a
1419  01c0 7b0d          	ld	a,(OFST+10,sp)
1420  01c2 a401          	and	a,#1
1421  01c4 1a03          	or	a,(OFST+0,sp)
1422  01c6 ca52d0        	or	a,21200
1423  01c9 c752d0        	ld	21200,a
1424                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1426  01cc 7b09          	ld	a,(OFST+6,sp)
1427  01ce c752c6        	ld	21190,a
1428                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1430  01d1 7b0a          	ld	a,(OFST+7,sp)
1431  01d3 c752c7        	ld	21191,a
1432                     ; 619 }
1435  01d6 5b05          	addw	sp,#5
1436  01d8 81            	ret
1538                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1538                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1538                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1538                     ; 661                   uint16_t TIM1_Pulse,
1538                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1538                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1538                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1538                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1538                     ; 666 {
1539                     	switch	.text
1540  01d9               _TIM1_OC2Init:
1542  01d9 89            	pushw	x
1543  01da 5203          	subw	sp,#3
1544       00000003      OFST:	set	3
1547                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1549                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1551                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1553                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1555                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1557                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1559                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1561                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1563  01dc c652bd        	ld	a,21181
1564  01df a40f          	and	a,#15
1565  01e1 c752bd        	ld	21181,a
1566                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1566                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1568  01e4 7b0c          	ld	a,(OFST+9,sp)
1569  01e6 a480          	and	a,#128
1570  01e8 6b03          	ld	(OFST+0,sp),a
1571  01ea 7b0b          	ld	a,(OFST+8,sp)
1572  01ec a420          	and	a,#32
1573  01ee 1a03          	or	a,(OFST+0,sp)
1574  01f0 6b02          	ld	(OFST-1,sp),a
1575  01f2 7b08          	ld	a,(OFST+5,sp)
1576  01f4 a440          	and	a,#64
1577  01f6 6b01          	ld	(OFST-2,sp),a
1578  01f8 9f            	ld	a,xl
1579  01f9 a410          	and	a,#16
1580  01fb 1a01          	or	a,(OFST-2,sp)
1581  01fd 1a02          	or	a,(OFST-1,sp)
1582  01ff ca52bd        	or	a,21181
1583  0202 c752bd        	ld	21181,a
1584                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1586  0205 c652ba        	ld	a,21178
1587  0208 a48f          	and	a,#143
1588  020a 1a04          	or	a,(OFST+1,sp)
1589  020c c752ba        	ld	21178,a
1590                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1592  020f c652d0        	ld	a,21200
1593  0212 a4f3          	and	a,#243
1594  0214 c752d0        	ld	21200,a
1595                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1597  0217 7b0e          	ld	a,(OFST+11,sp)
1598  0219 a408          	and	a,#8
1599  021b 6b03          	ld	(OFST+0,sp),a
1600  021d 7b0d          	ld	a,(OFST+10,sp)
1601  021f a404          	and	a,#4
1602  0221 1a03          	or	a,(OFST+0,sp)
1603  0223 ca52d0        	or	a,21200
1604  0226 c752d0        	ld	21200,a
1605                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1607  0229 7b09          	ld	a,(OFST+6,sp)
1608  022b c752c8        	ld	21192,a
1609                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1611  022e 7b0a          	ld	a,(OFST+7,sp)
1612  0230 c752c9        	ld	21193,a
1613                     ; 696 }
1616  0233 5b05          	addw	sp,#5
1617  0235 81            	ret
1719                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1719                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1719                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1719                     ; 738                   uint16_t TIM1_Pulse,
1719                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1719                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1719                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1719                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1719                     ; 743 {
1720                     	switch	.text
1721  0236               _TIM1_OC3Init:
1723  0236 89            	pushw	x
1724  0237 5203          	subw	sp,#3
1725       00000003      OFST:	set	3
1728                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1730                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1732                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1734                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1736                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1738                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1740                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1742                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1744  0239 c652be        	ld	a,21182
1745  023c a4f0          	and	a,#240
1746  023e c752be        	ld	21182,a
1747                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1747                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1749  0241 7b0c          	ld	a,(OFST+9,sp)
1750  0243 a408          	and	a,#8
1751  0245 6b03          	ld	(OFST+0,sp),a
1752  0247 7b0b          	ld	a,(OFST+8,sp)
1753  0249 a402          	and	a,#2
1754  024b 1a03          	or	a,(OFST+0,sp)
1755  024d 6b02          	ld	(OFST-1,sp),a
1756  024f 7b08          	ld	a,(OFST+5,sp)
1757  0251 a404          	and	a,#4
1758  0253 6b01          	ld	(OFST-2,sp),a
1759  0255 9f            	ld	a,xl
1760  0256 a401          	and	a,#1
1761  0258 1a01          	or	a,(OFST-2,sp)
1762  025a 1a02          	or	a,(OFST-1,sp)
1763  025c ca52be        	or	a,21182
1764  025f c752be        	ld	21182,a
1765                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1767  0262 c652bb        	ld	a,21179
1768  0265 a48f          	and	a,#143
1769  0267 1a04          	or	a,(OFST+1,sp)
1770  0269 c752bb        	ld	21179,a
1771                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1773  026c c652d0        	ld	a,21200
1774  026f a4cf          	and	a,#207
1775  0271 c752d0        	ld	21200,a
1776                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1778  0274 7b0e          	ld	a,(OFST+11,sp)
1779  0276 a420          	and	a,#32
1780  0278 6b03          	ld	(OFST+0,sp),a
1781  027a 7b0d          	ld	a,(OFST+10,sp)
1782  027c a410          	and	a,#16
1783  027e 1a03          	or	a,(OFST+0,sp)
1784  0280 ca52d0        	or	a,21200
1785  0283 c752d0        	ld	21200,a
1786                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1788  0286 7b09          	ld	a,(OFST+6,sp)
1789  0288 c752ca        	ld	21194,a
1790                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1792  028b 7b0a          	ld	a,(OFST+7,sp)
1793  028d c752cb        	ld	21195,a
1794                     ; 773 }
1797  0290 5b05          	addw	sp,#5
1798  0292 81            	ret
2003                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2003                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2003                     ; 805                      uint8_t TIM1_DeadTime,
2003                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2003                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2003                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2003                     ; 809 {
2004                     	switch	.text
2005  0293               _TIM1_BDTRConfig:
2007  0293 89            	pushw	x
2008  0294 88            	push	a
2009       00000001      OFST:	set	1
2012                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2014                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2016                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2018                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2020                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2022                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2024  0295 7b06          	ld	a,(OFST+5,sp)
2025  0297 c752cf        	ld	21199,a
2026                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2026                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2026                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2028  029a 7b07          	ld	a,(OFST+6,sp)
2029  029c 1a08          	or	a,(OFST+7,sp)
2030  029e 1a09          	or	a,(OFST+8,sp)
2031  02a0 6b01          	ld	(OFST+0,sp),a
2032  02a2 9f            	ld	a,xl
2033  02a3 1a02          	or	a,(OFST+1,sp)
2034  02a5 1a01          	or	a,(OFST+0,sp)
2035  02a7 c752ce        	ld	21198,a
2036                     ; 826 }
2039  02aa 5b03          	addw	sp,#3
2040  02ac 81            	ret
2076                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2076                     ; 835 {
2077                     	switch	.text
2078  02ad               _TIM1_CtrlPWMOutputs:
2082                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2084                     ; 841   if (NewState != DISABLE)
2086  02ad 4d            	tnz	a
2087  02ae 2706          	jreq	L1301
2088                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2090  02b0 721e52ce      	bset	21198,#7
2092  02b4 2004          	jra	L3301
2093  02b6               L1301:
2094                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2096  02b6 721f52ce      	bres	21198,#7
2097  02ba               L3301:
2098                     ; 849 }
2101  02ba 81            	ret
2180                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2180                     ; 872 {
2181                     	switch	.text
2182  02bb               _TIM1_SelectOCxM:
2184  02bb 89            	pushw	x
2185       00000000      OFST:	set	0
2188                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2190                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2192                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2194  02bc 9e            	ld	a,xh
2195  02bd 4d            	tnz	a
2196  02be 2610          	jrne	L3701
2197                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2199  02c0 721152bd      	bres	21181,#0
2200                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2202  02c4 c652b9        	ld	a,21177
2203  02c7 a48f          	and	a,#143
2204  02c9 1a02          	or	a,(OFST+2,sp)
2205  02cb c752b9        	ld	21177,a
2207  02ce 2024          	jra	L5701
2208  02d0               L3701:
2209                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2211  02d0 7b01          	ld	a,(OFST+1,sp)
2212  02d2 a101          	cp	a,#1
2213  02d4 2610          	jrne	L7701
2214                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2216  02d6 721952bd      	bres	21181,#4
2217                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2219  02da c652ba        	ld	a,21178
2220  02dd a48f          	and	a,#143
2221  02df 1a02          	or	a,(OFST+2,sp)
2222  02e1 c752ba        	ld	21178,a
2224  02e4 200e          	jra	L5701
2225  02e6               L7701:
2226                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2228  02e6 721152be      	bres	21182,#0
2229                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2231  02ea c652bb        	ld	a,21179
2232  02ed a48f          	and	a,#143
2233  02ef 1a02          	or	a,(OFST+2,sp)
2234  02f1 c752bb        	ld	21179,a
2235  02f4               L5701:
2236                     ; 902 }
2239  02f4 85            	popw	x
2240  02f5 81            	ret
2272                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2272                     ; 911 {
2273                     	switch	.text
2274  02f6               _TIM1_SetCompare1:
2278                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2280  02f6 9e            	ld	a,xh
2281  02f7 c752c6        	ld	21190,a
2282                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2284  02fa 9f            	ld	a,xl
2285  02fb c752c7        	ld	21191,a
2286                     ; 916 }
2289  02fe 81            	ret
2321                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2321                     ; 925 {
2322                     	switch	.text
2323  02ff               _TIM1_SetCompare2:
2327                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2329  02ff 9e            	ld	a,xh
2330  0300 c752c8        	ld	21192,a
2331                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2333  0303 9f            	ld	a,xl
2334  0304 c752c9        	ld	21193,a
2335                     ; 929 }
2338  0307 81            	ret
2370                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2370                     ; 938 {
2371                     	switch	.text
2372  0308               _TIM1_SetCompare3:
2376                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2378  0308 9e            	ld	a,xh
2379  0309 c752ca        	ld	21194,a
2380                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2382  030c 9f            	ld	a,xl
2383  030d c752cb        	ld	21195,a
2384                     ; 942 }
2387  0310 81            	ret
2419                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2419                     ; 951 {
2420                     	switch	.text
2421  0311               _TIM1_SetCompare4:
2425                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2427  0311 9e            	ld	a,xh
2428  0312 c752cc        	ld	21196,a
2429                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2431  0315 9f            	ld	a,xl
2432  0316 c752cd        	ld	21197,a
2433                     ; 955 }
2436  0319 81            	ret
2472                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2472                     ; 964 {
2473                     	switch	.text
2474  031a               _TIM1_CCPreloadControl:
2478                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2480                     ; 969   if (NewState != DISABLE)
2482  031a 4d            	tnz	a
2483  031b 2706          	jreq	L1021
2484                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2486  031d 721052b1      	bset	21169,#0
2488  0321 2004          	jra	L3021
2489  0323               L1021:
2490                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2492  0323 721152b1      	bres	21169,#0
2493  0327               L3021:
2494                     ; 977 }
2497  0327 81            	ret
2555                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2555                     ; 988 {
2556                     	switch	.text
2557  0328               _TIM1_ForcedOC1Config:
2559  0328 88            	push	a
2560       00000000      OFST:	set	0
2563                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2565                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2567  0329 c652b9        	ld	a,21177
2568  032c a48f          	and	a,#143
2569  032e 1a01          	or	a,(OFST+1,sp)
2570  0330 c752b9        	ld	21177,a
2571                     ; 994 }
2574  0333 84            	pop	a
2575  0334 81            	ret
2611                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2611                     ; 1005 {
2612                     	switch	.text
2613  0335               _TIM1_ForcedOC2Config:
2615  0335 88            	push	a
2616       00000000      OFST:	set	0
2619                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2621                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2623  0336 c652ba        	ld	a,21178
2624  0339 a48f          	and	a,#143
2625  033b 1a01          	or	a,(OFST+1,sp)
2626  033d c752ba        	ld	21178,a
2627                     ; 1011 }
2630  0340 84            	pop	a
2631  0341 81            	ret
2667                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2667                     ; 1022 {
2668                     	switch	.text
2669  0342               _TIM1_ForcedOC3Config:
2671  0342 88            	push	a
2672       00000000      OFST:	set	0
2675                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2677                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2679  0343 c652bb        	ld	a,21179
2680  0346 a48f          	and	a,#143
2681  0348 1a01          	or	a,(OFST+1,sp)
2682  034a c752bb        	ld	21179,a
2683                     ; 1028 }
2686  034d 84            	pop	a
2687  034e 81            	ret
2723                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2723                     ; 1037 {
2724                     	switch	.text
2725  034f               _TIM1_OC1PreloadConfig:
2729                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2731                     ; 1042   if (NewState != DISABLE)
2733  034f 4d            	tnz	a
2734  0350 2706          	jreq	L5031
2735                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2737  0352 721652b9      	bset	21177,#3
2739  0356 2004          	jra	L7031
2740  0358               L5031:
2741                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2743  0358 721752b9      	bres	21177,#3
2744  035c               L7031:
2745                     ; 1050 }
2748  035c 81            	ret
2784                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2784                     ; 1059 {
2785                     	switch	.text
2786  035d               _TIM1_OC2PreloadConfig:
2790                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2792                     ; 1064   if (NewState != DISABLE)
2794  035d 4d            	tnz	a
2795  035e 2706          	jreq	L7231
2796                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2798  0360 721652ba      	bset	21178,#3
2800  0364 2004          	jra	L1331
2801  0366               L7231:
2802                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2804  0366 721752ba      	bres	21178,#3
2805  036a               L1331:
2806                     ; 1072 }
2809  036a 81            	ret
2845                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2845                     ; 1081 {
2846                     	switch	.text
2847  036b               _TIM1_OC3PreloadConfig:
2851                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2853                     ; 1086   if (NewState != DISABLE)
2855  036b 4d            	tnz	a
2856  036c 2706          	jreq	L1531
2857                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2859  036e 721652bb      	bset	21179,#3
2861  0372 2004          	jra	L3531
2862  0374               L1531:
2863                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2865  0374 721752bb      	bres	21179,#3
2866  0378               L3531:
2867                     ; 1094 }
2870  0378 81            	ret
2906                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2906                     ; 1103 {
2907                     	switch	.text
2908  0379               _TIM1_OC4PreloadConfig:
2912                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2914                     ; 1108   if (NewState != DISABLE)
2916  0379 4d            	tnz	a
2917  037a 2706          	jreq	L3731
2918                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2920  037c 721652bc      	bset	21180,#3
2922  0380 2004          	jra	L5731
2923  0382               L3731:
2924                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2926  0382 721752bc      	bres	21180,#3
2927  0386               L5731:
2928                     ; 1116 }
2931  0386 81            	ret
2966                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
2966                     ; 1125 {
2967                     	switch	.text
2968  0387               _TIM1_OC1FastConfig:
2972                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
2974                     ; 1130   if (NewState != DISABLE)
2976  0387 4d            	tnz	a
2977  0388 2706          	jreq	L5141
2978                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2980  038a 721452b9      	bset	21177,#2
2982  038e 2004          	jra	L7141
2983  0390               L5141:
2984                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2986  0390 721552b9      	bres	21177,#2
2987  0394               L7141:
2988                     ; 1138 }
2991  0394 81            	ret
3026                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3026                     ; 1147 {
3027                     	switch	.text
3028  0395               _TIM1_OC2FastConfig:
3032                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3034                     ; 1152   if (NewState != DISABLE)
3036  0395 4d            	tnz	a
3037  0396 2706          	jreq	L7341
3038                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3040  0398 721452ba      	bset	21178,#2
3042  039c 2004          	jra	L1441
3043  039e               L7341:
3044                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3046  039e 721552ba      	bres	21178,#2
3047  03a2               L1441:
3048                     ; 1160 }
3051  03a2 81            	ret
3086                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3086                     ; 1169 {
3087                     	switch	.text
3088  03a3               _TIM1_OC3FastConfig:
3092                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3094                     ; 1174   if (NewState != DISABLE)
3096  03a3 4d            	tnz	a
3097  03a4 2706          	jreq	L1641
3098                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3100  03a6 721452bb      	bset	21179,#2
3102  03aa 2004          	jra	L3641
3103  03ac               L1641:
3104                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3106  03ac 721552bb      	bres	21179,#2
3107  03b0               L3641:
3108                     ; 1182 }
3111  03b0 81            	ret
3146                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3146                     ; 1191 {
3147                     	switch	.text
3148  03b1               _TIM1_ClearOC1Ref:
3152                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3154                     ; 1196   if (NewState != DISABLE)
3156  03b1 4d            	tnz	a
3157  03b2 2706          	jreq	L3051
3158                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3160  03b4 721e52b9      	bset	21177,#7
3162  03b8 2004          	jra	L5051
3163  03ba               L3051:
3164                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3166  03ba 721f52b9      	bres	21177,#7
3167  03be               L5051:
3168                     ; 1204 }
3171  03be 81            	ret
3206                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3206                     ; 1213 {
3207                     	switch	.text
3208  03bf               _TIM1_ClearOC2Ref:
3212                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3214                     ; 1218   if (NewState != DISABLE)
3216  03bf 4d            	tnz	a
3217  03c0 2706          	jreq	L5251
3218                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3220  03c2 721e52ba      	bset	21178,#7
3222  03c6 2004          	jra	L7251
3223  03c8               L5251:
3224                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3226  03c8 721f52ba      	bres	21178,#7
3227  03cc               L7251:
3228                     ; 1226 }
3231  03cc 81            	ret
3266                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3266                     ; 1235 {
3267                     	switch	.text
3268  03cd               _TIM1_ClearOC3Ref:
3272                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3274                     ; 1240   if (NewState != DISABLE)
3276  03cd 4d            	tnz	a
3277  03ce 2706          	jreq	L7451
3278                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3280  03d0 721e52bb      	bset	21179,#7
3282  03d4 2004          	jra	L1551
3283  03d6               L7451:
3284                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3286  03d6 721f52bb      	bres	21179,#7
3287  03da               L1551:
3288                     ; 1248 }
3291  03da 81            	ret
3326                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3326                     ; 1257 {
3327                     	switch	.text
3328  03db               _TIM1_ClearOC4Ref:
3332                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3334                     ; 1262   if (NewState != DISABLE)
3336  03db 4d            	tnz	a
3337  03dc 2706          	jreq	L1751
3338                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3340  03de 721e52bc      	bset	21180,#7
3342  03e2 2004          	jra	L3751
3343  03e4               L1751:
3344                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3346  03e4 721f52bc      	bres	21180,#7
3347  03e8               L3751:
3348                     ; 1270 }
3351  03e8 81            	ret
3387                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3387                     ; 1281 {
3388                     	switch	.text
3389  03e9               _TIM1_OC1PolarityConfig:
3393                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3395                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3397  03e9 4d            	tnz	a
3398  03ea 2706          	jreq	L3161
3399                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3401  03ec 721252bd      	bset	21181,#1
3403  03f0 2004          	jra	L5161
3404  03f2               L3161:
3405                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3407  03f2 721352bd      	bres	21181,#1
3408  03f6               L5161:
3409                     ; 1294 }
3412  03f6 81            	ret
3448                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3448                     ; 1305 {
3449                     	switch	.text
3450  03f7               _TIM1_OC1NPolarityConfig:
3454                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3456                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3458  03f7 4d            	tnz	a
3459  03f8 2706          	jreq	L5361
3460                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3462  03fa 721652bd      	bset	21181,#3
3464  03fe 2004          	jra	L7361
3465  0400               L5361:
3466                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3468  0400 721752bd      	bres	21181,#3
3469  0404               L7361:
3470                     ; 1318 }
3473  0404 81            	ret
3509                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3509                     ; 1329 {
3510                     	switch	.text
3511  0405               _TIM1_OC2PolarityConfig:
3515                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3517                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3519  0405 4d            	tnz	a
3520  0406 2706          	jreq	L7561
3521                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3523  0408 721a52bd      	bset	21181,#5
3525  040c 2004          	jra	L1661
3526  040e               L7561:
3527                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3529  040e 721b52bd      	bres	21181,#5
3530  0412               L1661:
3531                     ; 1342 }
3534  0412 81            	ret
3570                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3570                     ; 1353 {
3571                     	switch	.text
3572  0413               _TIM1_OC2NPolarityConfig:
3576                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3578                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3580  0413 4d            	tnz	a
3581  0414 2706          	jreq	L1071
3582                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3584  0416 721e52bd      	bset	21181,#7
3586  041a 2004          	jra	L3071
3587  041c               L1071:
3588                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3590  041c 721f52bd      	bres	21181,#7
3591  0420               L3071:
3592                     ; 1366 }
3595  0420 81            	ret
3631                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3631                     ; 1377 {
3632                     	switch	.text
3633  0421               _TIM1_OC3PolarityConfig:
3637                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3639                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3641  0421 4d            	tnz	a
3642  0422 2706          	jreq	L3271
3643                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3645  0424 721252be      	bset	21182,#1
3647  0428 2004          	jra	L5271
3648  042a               L3271:
3649                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3651  042a 721352be      	bres	21182,#1
3652  042e               L5271:
3653                     ; 1390 }
3656  042e 81            	ret
3692                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3692                     ; 1401 {
3693                     	switch	.text
3694  042f               _TIM1_OC3NPolarityConfig:
3698                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3700                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3702  042f 4d            	tnz	a
3703  0430 2706          	jreq	L5471
3704                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3706  0432 721652be      	bset	21182,#3
3708  0436 2004          	jra	L7471
3709  0438               L5471:
3710                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3712  0438 721752be      	bres	21182,#3
3713  043c               L7471:
3714                     ; 1414 }
3717  043c 81            	ret
3776                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3776                     ; 1425 {
3777                     	switch	.text
3778  043d               _TIM1_SelectOCREFClear:
3782                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3784                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3786  043d 721752b2      	bres	21170,#3
3787                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3789  0441 ca52b2        	or	a,21170
3790  0444 c752b2        	ld	21170,a
3791                     ; 1432 }
3794  0447 81            	ret
3829                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3829                     ; 1441 {
3830                     	switch	.text
3831  0448               _TIM1_SelectCOM:
3835                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3837                     ; 1446   if (NewState != DISABLE)
3839  0448 4d            	tnz	a
3840  0449 2706          	jreq	L5102
3841                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3843  044b 721452b1      	bset	21169,#2
3845  044f 2004          	jra	L7102
3846  0451               L5102:
3847                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3849  0451 721552b1      	bres	21169,#2
3850  0455               L7102:
3851                     ; 1454 }
3854  0455 81            	ret
3899                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3899                     ; 1469 {
3900                     	switch	.text
3901  0456               _TIM1_CCxCmd:
3903  0456 89            	pushw	x
3904       00000000      OFST:	set	0
3907                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3909                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3911                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3913  0457 9e            	ld	a,xh
3914  0458 4d            	tnz	a
3915  0459 2610          	jrne	L3402
3916                     ; 1477     if (NewState != DISABLE)
3918  045b 9f            	ld	a,xl
3919  045c 4d            	tnz	a
3920  045d 2706          	jreq	L5402
3921                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3923  045f 721052bd      	bset	21181,#0
3925  0463 2040          	jra	L1502
3926  0465               L5402:
3927                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3929  0465 721152bd      	bres	21181,#0
3930  0469 203a          	jra	L1502
3931  046b               L3402:
3932                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3934  046b 7b01          	ld	a,(OFST+1,sp)
3935  046d a101          	cp	a,#1
3936  046f 2610          	jrne	L3502
3937                     ; 1489     if (NewState != DISABLE)
3939  0471 0d02          	tnz	(OFST+2,sp)
3940  0473 2706          	jreq	L5502
3941                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3943  0475 721852bd      	bset	21181,#4
3945  0479 202a          	jra	L1502
3946  047b               L5502:
3947                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3949  047b 721952bd      	bres	21181,#4
3950  047f 2024          	jra	L1502
3951  0481               L3502:
3952                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
3954  0481 7b01          	ld	a,(OFST+1,sp)
3955  0483 a102          	cp	a,#2
3956  0485 2610          	jrne	L3602
3957                     ; 1501     if (NewState != DISABLE)
3959  0487 0d02          	tnz	(OFST+2,sp)
3960  0489 2706          	jreq	L5602
3961                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3963  048b 721052be      	bset	21182,#0
3965  048f 2014          	jra	L1502
3966  0491               L5602:
3967                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3969  0491 721152be      	bres	21182,#0
3970  0495 200e          	jra	L1502
3971  0497               L3602:
3972                     ; 1513     if (NewState != DISABLE)
3974  0497 0d02          	tnz	(OFST+2,sp)
3975  0499 2706          	jreq	L3702
3976                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3978  049b 721852be      	bset	21182,#4
3980  049f 2004          	jra	L1502
3981  04a1               L3702:
3982                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
3984  04a1 721952be      	bres	21182,#4
3985  04a5               L1502:
3986                     ; 1522 }
3989  04a5 85            	popw	x
3990  04a6 81            	ret
4035                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4035                     ; 1536 {
4036                     	switch	.text
4037  04a7               _TIM1_CCxNCmd:
4039  04a7 89            	pushw	x
4040       00000000      OFST:	set	0
4043                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4045                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4047                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4049  04a8 9e            	ld	a,xh
4050  04a9 4d            	tnz	a
4051  04aa 2610          	jrne	L1212
4052                     ; 1544     if (NewState != DISABLE)
4054  04ac 9f            	ld	a,xl
4055  04ad 4d            	tnz	a
4056  04ae 2706          	jreq	L3212
4057                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4059  04b0 721452bd      	bset	21181,#2
4061  04b4 202a          	jra	L7212
4062  04b6               L3212:
4063                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4065  04b6 721552bd      	bres	21181,#2
4066  04ba 2024          	jra	L7212
4067  04bc               L1212:
4068                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4070  04bc 7b01          	ld	a,(OFST+1,sp)
4071  04be a101          	cp	a,#1
4072  04c0 2610          	jrne	L1312
4073                     ; 1556     if (NewState != DISABLE)
4075  04c2 0d02          	tnz	(OFST+2,sp)
4076  04c4 2706          	jreq	L3312
4077                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4079  04c6 721c52bd      	bset	21181,#6
4081  04ca 2014          	jra	L7212
4082  04cc               L3312:
4083                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4085  04cc 721d52bd      	bres	21181,#6
4086  04d0 200e          	jra	L7212
4087  04d2               L1312:
4088                     ; 1568     if (NewState != DISABLE)
4090  04d2 0d02          	tnz	(OFST+2,sp)
4091  04d4 2706          	jreq	L1412
4092                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4094  04d6 721452be      	bset	21182,#2
4096  04da 2004          	jra	L7212
4097  04dc               L1412:
4098                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4100  04dc 721552be      	bres	21182,#2
4101  04e0               L7212:
4102                     ; 1577 }
4105  04e0 85            	popw	x
4106  04e1 81            	ret
4272                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4272                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4272                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4272                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4272                     ; 1668                  uint8_t TIM1_ICFilter)
4272                     ; 1669 {
4273                     	switch	.text
4274  04e2               _TIM1_ICInit:
4276  04e2 89            	pushw	x
4277       00000000      OFST:	set	0
4280                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4282                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4284                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4286                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4288                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4290                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4292  04e3 9e            	ld	a,xh
4293  04e4 4d            	tnz	a
4294  04e5 2614          	jrne	L7322
4295                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4297  04e7 7b07          	ld	a,(OFST+7,sp)
4298  04e9 88            	push	a
4299  04ea 7b06          	ld	a,(OFST+6,sp)
4300  04ec 97            	ld	xl,a
4301  04ed 7b03          	ld	a,(OFST+3,sp)
4302  04ef 95            	ld	xh,a
4303  04f0 cd0853        	call	L3_TI1_Config
4305  04f3 84            	pop	a
4306                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4308  04f4 7b06          	ld	a,(OFST+6,sp)
4309  04f6 cd0672        	call	_TIM1_SetIC1Prescaler
4312  04f9 2046          	jra	L1422
4313  04fb               L7322:
4314                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4316  04fb 7b01          	ld	a,(OFST+1,sp)
4317  04fd a101          	cp	a,#1
4318  04ff 2614          	jrne	L3422
4319                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4321  0501 7b07          	ld	a,(OFST+7,sp)
4322  0503 88            	push	a
4323  0504 7b06          	ld	a,(OFST+6,sp)
4324  0506 97            	ld	xl,a
4325  0507 7b03          	ld	a,(OFST+3,sp)
4326  0509 95            	ld	xh,a
4327  050a cd0883        	call	L5_TI2_Config
4329  050d 84            	pop	a
4330                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4332  050e 7b06          	ld	a,(OFST+6,sp)
4333  0510 cd067f        	call	_TIM1_SetIC2Prescaler
4336  0513 202c          	jra	L1422
4337  0515               L3422:
4338                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4340  0515 7b01          	ld	a,(OFST+1,sp)
4341  0517 a102          	cp	a,#2
4342  0519 2614          	jrne	L7422
4343                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4345  051b 7b07          	ld	a,(OFST+7,sp)
4346  051d 88            	push	a
4347  051e 7b06          	ld	a,(OFST+6,sp)
4348  0520 97            	ld	xl,a
4349  0521 7b03          	ld	a,(OFST+3,sp)
4350  0523 95            	ld	xh,a
4351  0524 cd08b3        	call	L7_TI3_Config
4353  0527 84            	pop	a
4354                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4356  0528 7b06          	ld	a,(OFST+6,sp)
4357  052a cd068c        	call	_TIM1_SetIC3Prescaler
4360  052d 2012          	jra	L1422
4361  052f               L7422:
4362                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4364  052f 7b07          	ld	a,(OFST+7,sp)
4365  0531 88            	push	a
4366  0532 7b06          	ld	a,(OFST+6,sp)
4367  0534 97            	ld	xl,a
4368  0535 7b03          	ld	a,(OFST+3,sp)
4369  0537 95            	ld	xh,a
4370  0538 cd08e3        	call	L11_TI4_Config
4372  053b 84            	pop	a
4373                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4375  053c 7b06          	ld	a,(OFST+6,sp)
4376  053e cd0699        	call	_TIM1_SetIC4Prescaler
4378  0541               L1422:
4379                     ; 1706 }
4382  0541 85            	popw	x
4383  0542 81            	ret
4479                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4479                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4479                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4479                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4479                     ; 1737                      uint8_t TIM1_ICFilter)
4479                     ; 1738 {
4480                     	switch	.text
4481  0543               _TIM1_PWMIConfig:
4483  0543 89            	pushw	x
4484  0544 89            	pushw	x
4485       00000002      OFST:	set	2
4488                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4490  0545 7b01          	ld	a,(OFST-1,sp)
4491  0547 97            	ld	xl,a
4492                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4494  0548 7b02          	ld	a,(OFST+0,sp)
4495  054a 97            	ld	xl,a
4496                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4498                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4500                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4502                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4504                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4506  054b 7b04          	ld	a,(OFST+2,sp)
4507  054d a101          	cp	a,#1
4508  054f 2706          	jreq	L7132
4509                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4511  0551 a601          	ld	a,#1
4512  0553 6b01          	ld	(OFST-1,sp),a
4514  0555 2002          	jra	L1232
4515  0557               L7132:
4516                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4518  0557 0f01          	clr	(OFST-1,sp)
4519  0559               L1232:
4520                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4522  0559 7b07          	ld	a,(OFST+5,sp)
4523  055b a101          	cp	a,#1
4524  055d 2606          	jrne	L3232
4525                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4527  055f a602          	ld	a,#2
4528  0561 6b02          	ld	(OFST+0,sp),a
4530  0563 2004          	jra	L5232
4531  0565               L3232:
4532                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4534  0565 a601          	ld	a,#1
4535  0567 6b02          	ld	(OFST+0,sp),a
4536  0569               L5232:
4537                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4539  0569 0d03          	tnz	(OFST+1,sp)
4540  056b 2626          	jrne	L7232
4541                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4543  056d 7b09          	ld	a,(OFST+7,sp)
4544  056f 88            	push	a
4545  0570 7b08          	ld	a,(OFST+6,sp)
4546  0572 97            	ld	xl,a
4547  0573 7b05          	ld	a,(OFST+3,sp)
4548  0575 95            	ld	xh,a
4549  0576 cd0853        	call	L3_TI1_Config
4551  0579 84            	pop	a
4552                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4554  057a 7b08          	ld	a,(OFST+6,sp)
4555  057c cd0672        	call	_TIM1_SetIC1Prescaler
4557                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4559  057f 7b09          	ld	a,(OFST+7,sp)
4560  0581 88            	push	a
4561  0582 7b03          	ld	a,(OFST+1,sp)
4562  0584 97            	ld	xl,a
4563  0585 7b02          	ld	a,(OFST+0,sp)
4564  0587 95            	ld	xh,a
4565  0588 cd0883        	call	L5_TI2_Config
4567  058b 84            	pop	a
4568                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4570  058c 7b08          	ld	a,(OFST+6,sp)
4571  058e cd067f        	call	_TIM1_SetIC2Prescaler
4574  0591 2024          	jra	L1332
4575  0593               L7232:
4576                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4578  0593 7b09          	ld	a,(OFST+7,sp)
4579  0595 88            	push	a
4580  0596 7b08          	ld	a,(OFST+6,sp)
4581  0598 97            	ld	xl,a
4582  0599 7b05          	ld	a,(OFST+3,sp)
4583  059b 95            	ld	xh,a
4584  059c cd0883        	call	L5_TI2_Config
4586  059f 84            	pop	a
4587                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4589  05a0 7b08          	ld	a,(OFST+6,sp)
4590  05a2 cd067f        	call	_TIM1_SetIC2Prescaler
4592                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4594  05a5 7b09          	ld	a,(OFST+7,sp)
4595  05a7 88            	push	a
4596  05a8 7b03          	ld	a,(OFST+1,sp)
4597  05aa 97            	ld	xl,a
4598  05ab 7b02          	ld	a,(OFST+0,sp)
4599  05ad 95            	ld	xh,a
4600  05ae cd0853        	call	L3_TI1_Config
4602  05b1 84            	pop	a
4603                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4605  05b2 7b08          	ld	a,(OFST+6,sp)
4606  05b4 cd0672        	call	_TIM1_SetIC1Prescaler
4608  05b7               L1332:
4609                     ; 1796 }
4612  05b7 5b04          	addw	sp,#4
4613  05b9 81            	ret
4659                     ; 1803 uint16_t TIM1_GetCapture1(void)
4659                     ; 1804 {
4660                     	switch	.text
4661  05ba               _TIM1_GetCapture1:
4663  05ba 5204          	subw	sp,#4
4664       00000004      OFST:	set	4
4667                     ; 1807   uint16_t tmpccr1 = 0;
4669  05bc 1e03          	ldw	x,(OFST-1,sp)
4670                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4672  05be 7b01          	ld	a,(OFST-3,sp)
4673  05c0 97            	ld	xl,a
4676  05c1 7b02          	ld	a,(OFST-2,sp)
4677  05c3 97            	ld	xl,a
4678                     ; 1810   tmpccr1h = TIM1->CCR1H;
4680  05c4 c652c6        	ld	a,21190
4681  05c7 6b02          	ld	(OFST-2,sp),a
4682                     ; 1811   tmpccr1l = TIM1->CCR1L;
4684  05c9 c652c7        	ld	a,21191
4685  05cc 6b01          	ld	(OFST-3,sp),a
4686                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4688  05ce 7b01          	ld	a,(OFST-3,sp)
4689  05d0 5f            	clrw	x
4690  05d1 97            	ld	xl,a
4691  05d2 1f03          	ldw	(OFST-1,sp),x
4692                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4694  05d4 7b02          	ld	a,(OFST-2,sp)
4695  05d6 5f            	clrw	x
4696  05d7 97            	ld	xl,a
4697  05d8 4f            	clr	a
4698  05d9 02            	rlwa	x,a
4699  05da 01            	rrwa	x,a
4700  05db 1a04          	or	a,(OFST+0,sp)
4701  05dd 01            	rrwa	x,a
4702  05de 1a03          	or	a,(OFST-1,sp)
4703  05e0 01            	rrwa	x,a
4704  05e1 1f03          	ldw	(OFST-1,sp),x
4705                     ; 1816   return (uint16_t)tmpccr1;
4707  05e3 1e03          	ldw	x,(OFST-1,sp)
4710  05e5 5b04          	addw	sp,#4
4711  05e7 81            	ret
4757                     ; 1824 uint16_t TIM1_GetCapture2(void)
4757                     ; 1825 {
4758                     	switch	.text
4759  05e8               _TIM1_GetCapture2:
4761  05e8 5204          	subw	sp,#4
4762       00000004      OFST:	set	4
4765                     ; 1828   uint16_t tmpccr2 = 0;
4767  05ea 1e03          	ldw	x,(OFST-1,sp)
4768                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4770  05ec 7b01          	ld	a,(OFST-3,sp)
4771  05ee 97            	ld	xl,a
4774  05ef 7b02          	ld	a,(OFST-2,sp)
4775  05f1 97            	ld	xl,a
4776                     ; 1831   tmpccr2h = TIM1->CCR2H;
4778  05f2 c652c8        	ld	a,21192
4779  05f5 6b02          	ld	(OFST-2,sp),a
4780                     ; 1832   tmpccr2l = TIM1->CCR2L;
4782  05f7 c652c9        	ld	a,21193
4783  05fa 6b01          	ld	(OFST-3,sp),a
4784                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4786  05fc 7b01          	ld	a,(OFST-3,sp)
4787  05fe 5f            	clrw	x
4788  05ff 97            	ld	xl,a
4789  0600 1f03          	ldw	(OFST-1,sp),x
4790                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4792  0602 7b02          	ld	a,(OFST-2,sp)
4793  0604 5f            	clrw	x
4794  0605 97            	ld	xl,a
4795  0606 4f            	clr	a
4796  0607 02            	rlwa	x,a
4797  0608 01            	rrwa	x,a
4798  0609 1a04          	or	a,(OFST+0,sp)
4799  060b 01            	rrwa	x,a
4800  060c 1a03          	or	a,(OFST-1,sp)
4801  060e 01            	rrwa	x,a
4802  060f 1f03          	ldw	(OFST-1,sp),x
4803                     ; 1837   return (uint16_t)tmpccr2;
4805  0611 1e03          	ldw	x,(OFST-1,sp)
4808  0613 5b04          	addw	sp,#4
4809  0615 81            	ret
4855                     ; 1845 uint16_t TIM1_GetCapture3(void)
4855                     ; 1846 {
4856                     	switch	.text
4857  0616               _TIM1_GetCapture3:
4859  0616 5204          	subw	sp,#4
4860       00000004      OFST:	set	4
4863                     ; 1848   uint16_t tmpccr3 = 0;
4865  0618 1e03          	ldw	x,(OFST-1,sp)
4866                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4868  061a 7b01          	ld	a,(OFST-3,sp)
4869  061c 97            	ld	xl,a
4872  061d 7b02          	ld	a,(OFST-2,sp)
4873  061f 97            	ld	xl,a
4874                     ; 1851   tmpccr3h = TIM1->CCR3H;
4876  0620 c652ca        	ld	a,21194
4877  0623 6b02          	ld	(OFST-2,sp),a
4878                     ; 1852   tmpccr3l = TIM1->CCR3L;
4880  0625 c652cb        	ld	a,21195
4881  0628 6b01          	ld	(OFST-3,sp),a
4882                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4884  062a 7b01          	ld	a,(OFST-3,sp)
4885  062c 5f            	clrw	x
4886  062d 97            	ld	xl,a
4887  062e 1f03          	ldw	(OFST-1,sp),x
4888                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4890  0630 7b02          	ld	a,(OFST-2,sp)
4891  0632 5f            	clrw	x
4892  0633 97            	ld	xl,a
4893  0634 4f            	clr	a
4894  0635 02            	rlwa	x,a
4895  0636 01            	rrwa	x,a
4896  0637 1a04          	or	a,(OFST+0,sp)
4897  0639 01            	rrwa	x,a
4898  063a 1a03          	or	a,(OFST-1,sp)
4899  063c 01            	rrwa	x,a
4900  063d 1f03          	ldw	(OFST-1,sp),x
4901                     ; 1857   return (uint16_t)tmpccr3;
4903  063f 1e03          	ldw	x,(OFST-1,sp)
4906  0641 5b04          	addw	sp,#4
4907  0643 81            	ret
4953                     ; 1865 uint16_t TIM1_GetCapture4(void)
4953                     ; 1866 {
4954                     	switch	.text
4955  0644               _TIM1_GetCapture4:
4957  0644 5204          	subw	sp,#4
4958       00000004      OFST:	set	4
4961                     ; 1868   uint16_t tmpccr4 = 0;
4963  0646 1e03          	ldw	x,(OFST-1,sp)
4964                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4966  0648 7b01          	ld	a,(OFST-3,sp)
4967  064a 97            	ld	xl,a
4970  064b 7b02          	ld	a,(OFST-2,sp)
4971  064d 97            	ld	xl,a
4972                     ; 1871   tmpccr4h = TIM1->CCR4H;
4974  064e c652cc        	ld	a,21196
4975  0651 6b02          	ld	(OFST-2,sp),a
4976                     ; 1872   tmpccr4l = TIM1->CCR4L;
4978  0653 c652cd        	ld	a,21197
4979  0656 6b01          	ld	(OFST-3,sp),a
4980                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
4982  0658 7b01          	ld	a,(OFST-3,sp)
4983  065a 5f            	clrw	x
4984  065b 97            	ld	xl,a
4985  065c 1f03          	ldw	(OFST-1,sp),x
4986                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4988  065e 7b02          	ld	a,(OFST-2,sp)
4989  0660 5f            	clrw	x
4990  0661 97            	ld	xl,a
4991  0662 4f            	clr	a
4992  0663 02            	rlwa	x,a
4993  0664 01            	rrwa	x,a
4994  0665 1a04          	or	a,(OFST+0,sp)
4995  0667 01            	rrwa	x,a
4996  0668 1a03          	or	a,(OFST-1,sp)
4997  066a 01            	rrwa	x,a
4998  066b 1f03          	ldw	(OFST-1,sp),x
4999                     ; 1877   return (uint16_t)tmpccr4;
5001  066d 1e03          	ldw	x,(OFST-1,sp)
5004  066f 5b04          	addw	sp,#4
5005  0671 81            	ret
5041                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5041                     ; 1891 {
5042                     	switch	.text
5043  0672               _TIM1_SetIC1Prescaler:
5045  0672 88            	push	a
5046       00000000      OFST:	set	0
5049                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5051                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5053  0673 c652b9        	ld	a,21177
5054  0676 a4f3          	and	a,#243
5055  0678 1a01          	or	a,(OFST+1,sp)
5056  067a c752b9        	ld	21177,a
5057                     ; 1897 }
5060  067d 84            	pop	a
5061  067e 81            	ret
5097                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5097                     ; 1910 {
5098                     	switch	.text
5099  067f               _TIM1_SetIC2Prescaler:
5101  067f 88            	push	a
5102       00000000      OFST:	set	0
5105                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5107                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5109  0680 c652ba        	ld	a,21178
5110  0683 a4f3          	and	a,#243
5111  0685 1a01          	or	a,(OFST+1,sp)
5112  0687 c752ba        	ld	21178,a
5113                     ; 1916 }
5116  068a 84            	pop	a
5117  068b 81            	ret
5153                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5153                     ; 1929 {
5154                     	switch	.text
5155  068c               _TIM1_SetIC3Prescaler:
5157  068c 88            	push	a
5158       00000000      OFST:	set	0
5161                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5163                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5165  068d c652bb        	ld	a,21179
5166  0690 a4f3          	and	a,#243
5167  0692 1a01          	or	a,(OFST+1,sp)
5168  0694 c752bb        	ld	21179,a
5169                     ; 1936 }
5172  0697 84            	pop	a
5173  0698 81            	ret
5209                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5209                     ; 1949 {
5210                     	switch	.text
5211  0699               _TIM1_SetIC4Prescaler:
5213  0699 88            	push	a
5214       00000000      OFST:	set	0
5217                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5219                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5221  069a c652bc        	ld	a,21180
5222  069d a4f3          	and	a,#243
5223  069f 1a01          	or	a,(OFST+1,sp)
5224  06a1 c752bc        	ld	21180,a
5225                     ; 1956 }
5228  06a4 84            	pop	a
5229  06a5 81            	ret
5336                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5336                     ; 1992 {
5337                     	switch	.text
5338  06a6               _TIM1_ITConfig:
5340  06a6 89            	pushw	x
5341       00000000      OFST:	set	0
5344                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5346                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5348                     ; 1997   if (NewState != DISABLE)
5350  06a7 9f            	ld	a,xl
5351  06a8 4d            	tnz	a
5352  06a9 2709          	jreq	L1752
5353                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5355  06ab 9e            	ld	a,xh
5356  06ac ca52b5        	or	a,21173
5357  06af c752b5        	ld	21173,a
5359  06b2 2009          	jra	L3752
5360  06b4               L1752:
5361                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5363  06b4 7b01          	ld	a,(OFST+1,sp)
5364  06b6 43            	cpl	a
5365  06b7 c452b5        	and	a,21173
5366  06ba c752b5        	ld	21173,a
5367  06bd               L3752:
5368                     ; 2007 }
5371  06bd 85            	popw	x
5372  06be 81            	ret
5477                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5477                     ; 2024 {
5478                     	switch	.text
5479  06bf               _TIM1_GenerateEvent:
5483                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5485                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5487  06bf c752b8        	ld	21176,a
5488                     ; 2030 }
5491  06c2 81            	ret
5661                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5661                     ; 2050 {
5662                     	switch	.text
5663  06c3               _TIM1_GetFlagStatus:
5665  06c3 89            	pushw	x
5666  06c4 89            	pushw	x
5667       00000002      OFST:	set	2
5670                     ; 2051   FlagStatus bitstatus = RESET;
5672  06c5 7b02          	ld	a,(OFST+0,sp)
5673  06c7 97            	ld	xl,a
5674                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5676  06c8 7b01          	ld	a,(OFST-1,sp)
5677  06ca 97            	ld	xl,a
5680  06cb 7b02          	ld	a,(OFST+0,sp)
5681  06cd 97            	ld	xl,a
5682                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5684                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5686  06ce c652b6        	ld	a,21174
5687  06d1 1404          	and	a,(OFST+2,sp)
5688  06d3 6b01          	ld	(OFST-1,sp),a
5689                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5691  06d5 c652b7        	ld	a,21175
5692  06d8 1403          	and	a,(OFST+1,sp)
5693  06da 6b02          	ld	(OFST+0,sp),a
5694                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5696  06dc 7b01          	ld	a,(OFST-1,sp)
5697  06de 1a02          	or	a,(OFST+0,sp)
5698  06e0 2706          	jreq	L1372
5699                     ; 2062     bitstatus = SET;
5701  06e2 a601          	ld	a,#1
5702  06e4 6b02          	ld	(OFST+0,sp),a
5704  06e6 2002          	jra	L3372
5705  06e8               L1372:
5706                     ; 2066     bitstatus = RESET;
5708  06e8 0f02          	clr	(OFST+0,sp)
5709  06ea               L3372:
5710                     ; 2068   return (FlagStatus)(bitstatus);
5712  06ea 7b02          	ld	a,(OFST+0,sp)
5715  06ec 5b04          	addw	sp,#4
5716  06ee 81            	ret
5751                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5751                     ; 2090 {
5752                     	switch	.text
5753  06ef               _TIM1_ClearFlag:
5755  06ef 89            	pushw	x
5756       00000000      OFST:	set	0
5759                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5761                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5763  06f0 9f            	ld	a,xl
5764  06f1 43            	cpl	a
5765  06f2 c752b6        	ld	21174,a
5766                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5768  06f5 7b01          	ld	a,(OFST+1,sp)
5769  06f7 43            	cpl	a
5770  06f8 a41e          	and	a,#30
5771  06fa c752b7        	ld	21175,a
5772                     ; 2097 }
5775  06fd 85            	popw	x
5776  06fe 81            	ret
5836                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5836                     ; 2115 {
5837                     	switch	.text
5838  06ff               _TIM1_GetITStatus:
5840  06ff 88            	push	a
5841  0700 89            	pushw	x
5842       00000002      OFST:	set	2
5845                     ; 2116   ITStatus bitstatus = RESET;
5847  0701 7b02          	ld	a,(OFST+0,sp)
5848  0703 97            	ld	xl,a
5849                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5851  0704 7b01          	ld	a,(OFST-1,sp)
5852  0706 97            	ld	xl,a
5855  0707 7b02          	ld	a,(OFST+0,sp)
5856  0709 97            	ld	xl,a
5857                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5859                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5861  070a c652b6        	ld	a,21174
5862  070d 1403          	and	a,(OFST+1,sp)
5863  070f 6b01          	ld	(OFST-1,sp),a
5864                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5866  0711 c652b5        	ld	a,21173
5867  0714 1403          	and	a,(OFST+1,sp)
5868  0716 6b02          	ld	(OFST+0,sp),a
5869                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5871  0718 0d01          	tnz	(OFST-1,sp)
5872  071a 270a          	jreq	L1003
5874  071c 0d02          	tnz	(OFST+0,sp)
5875  071e 2706          	jreq	L1003
5876                     ; 2129     bitstatus = SET;
5878  0720 a601          	ld	a,#1
5879  0722 6b02          	ld	(OFST+0,sp),a
5881  0724 2002          	jra	L3003
5882  0726               L1003:
5883                     ; 2133     bitstatus = RESET;
5885  0726 0f02          	clr	(OFST+0,sp)
5886  0728               L3003:
5887                     ; 2135   return (ITStatus)(bitstatus);
5889  0728 7b02          	ld	a,(OFST+0,sp)
5892  072a 5b03          	addw	sp,#3
5893  072c 81            	ret
5929                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5929                     ; 2153 {
5930                     	switch	.text
5931  072d               _TIM1_ClearITPendingBit:
5935                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
5937                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5939  072d 43            	cpl	a
5940  072e c752b6        	ld	21174,a
5941                     ; 2159 }
5944  0731 81            	ret
6482                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6482                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6482                     ; 2169 {
6483                     	switch	.text
6484  0732               _TIM1_DMAConfig:
6488                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6490                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6492                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6494  0732 9e            	ld	a,xh
6495  0733 c752d1        	ld	21201,a
6496                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6498  0736 9f            	ld	a,xl
6499  0737 c752d2        	ld	21202,a
6500                     ; 2177 }
6503  073a 81            	ret
6597                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6597                     ; 2190 {
6598                     	switch	.text
6599  073b               _TIM1_DMACmd:
6601  073b 89            	pushw	x
6602       00000000      OFST:	set	0
6605                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6607                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6609                     ; 2195   if (NewState != DISABLE)
6611  073c 9f            	ld	a,xl
6612  073d 4d            	tnz	a
6613  073e 2709          	jreq	L7133
6614                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6616  0740 9e            	ld	a,xh
6617  0741 ca52b4        	or	a,21172
6618  0744 c752b4        	ld	21172,a
6620  0747 2009          	jra	L1233
6621  0749               L7133:
6622                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6624  0749 7b01          	ld	a,(OFST+1,sp)
6625  074b 43            	cpl	a
6626  074c c452b4        	and	a,21172
6627  074f c752b4        	ld	21172,a
6628  0752               L1233:
6629                     ; 2205 }
6632  0752 85            	popw	x
6633  0753 81            	ret
6668                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6668                     ; 2214 {
6669                     	switch	.text
6670  0754               _TIM1_SelectCCDMA:
6674                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6676                     ; 2218   if (NewState != DISABLE)
6678  0754 4d            	tnz	a
6679  0755 2706          	jreq	L1433
6680                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6682  0757 721652b1      	bset	21169,#3
6684  075b 2004          	jra	L3433
6685  075d               L1433:
6686                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6688  075d 721752b1      	bres	21169,#3
6689  0761               L3433:
6690                     ; 2228 }
6693  0761 81            	ret
6717                     ; 2251 void TIM1_InternalClockConfig(void)
6717                     ; 2252 {
6718                     	switch	.text
6719  0762               _TIM1_InternalClockConfig:
6723                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6725  0762 c652b2        	ld	a,21170
6726  0765 a4f8          	and	a,#248
6727  0767 c752b2        	ld	21170,a
6728                     ; 2255 }
6731  076a 81            	ret
6818                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6818                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6818                     ; 2274                                  uint8_t ICFilter)
6818                     ; 2275 {
6819                     	switch	.text
6820  076b               _TIM1_TIxExternalClockConfig:
6822  076b 89            	pushw	x
6823       00000000      OFST:	set	0
6826                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6828                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6830                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6832                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6834  076c 9e            	ld	a,xh
6835  076d a160          	cp	a,#96
6836  076f 260f          	jrne	L3143
6837                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6839  0771 7b05          	ld	a,(OFST+5,sp)
6840  0773 88            	push	a
6841  0774 ae0001        	ldw	x,#1
6842  0777 7b03          	ld	a,(OFST+3,sp)
6843  0779 95            	ld	xh,a
6844  077a cd0883        	call	L5_TI2_Config
6846  077d 84            	pop	a
6848  077e 200d          	jra	L5143
6849  0780               L3143:
6850                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6852  0780 7b05          	ld	a,(OFST+5,sp)
6853  0782 88            	push	a
6854  0783 ae0001        	ldw	x,#1
6855  0786 7b03          	ld	a,(OFST+3,sp)
6856  0788 95            	ld	xh,a
6857  0789 cd0853        	call	L3_TI1_Config
6859  078c 84            	pop	a
6860  078d               L5143:
6861                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6863  078d 7b01          	ld	a,(OFST+1,sp)
6864  078f ad34          	call	_TIM1_SelectInputTrigger
6866                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6868  0791 c652b2        	ld	a,21170
6869  0794 aa07          	or	a,#7
6870  0796 c752b2        	ld	21170,a
6871                     ; 2296 }
6874  0799 85            	popw	x
6875  079a 81            	ret
6990                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6990                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6990                     ; 2316                               uint8_t ExtTRGFilter)
6990                     ; 2317 {
6991                     	switch	.text
6992  079b               _TIM1_ETRClockMode1Config:
6994  079b 89            	pushw	x
6995       00000000      OFST:	set	0
6998                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7000                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7002                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7004                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7006  079c 7b05          	ld	a,(OFST+5,sp)
7007  079e 88            	push	a
7008  079f 9f            	ld	a,xl
7009  07a0 97            	ld	xl,a
7010  07a1 7b02          	ld	a,(OFST+2,sp)
7011  07a3 95            	ld	xh,a
7012  07a4 ad54          	call	_TIM1_ETRConfig
7014  07a6 84            	pop	a
7015                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7015                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7017  07a7 c652b2        	ld	a,21170
7018  07aa a488          	and	a,#136
7019  07ac aa77          	or	a,#119
7020  07ae c752b2        	ld	21170,a
7021                     ; 2329 }
7024  07b1 85            	popw	x
7025  07b2 81            	ret
7081                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7081                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7081                     ; 2349                               uint8_t ExtTRGFilter)
7081                     ; 2350 {
7082                     	switch	.text
7083  07b3               _TIM1_ETRClockMode2Config:
7085  07b3 89            	pushw	x
7086       00000000      OFST:	set	0
7089                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7091                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7093                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7095  07b4 7b05          	ld	a,(OFST+5,sp)
7096  07b6 88            	push	a
7097  07b7 9f            	ld	a,xl
7098  07b8 97            	ld	xl,a
7099  07b9 7b02          	ld	a,(OFST+2,sp)
7100  07bb 95            	ld	xh,a
7101  07bc ad3c          	call	_TIM1_ETRConfig
7103  07be 84            	pop	a
7104                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7106  07bf 721c52b3      	bset	21171,#6
7107                     ; 2360 }
7110  07c3 85            	popw	x
7111  07c4 81            	ret
7218                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7218                     ; 2411 {
7219                     	switch	.text
7220  07c5               _TIM1_SelectInputTrigger:
7222  07c5 88            	push	a
7223       00000000      OFST:	set	0
7226                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7228                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7230  07c6 c652b2        	ld	a,21170
7231  07c9 a48f          	and	a,#143
7232  07cb 1a01          	or	a,(OFST+1,sp)
7233  07cd c752b2        	ld	21170,a
7234                     ; 2417 }
7237  07d0 84            	pop	a
7238  07d1 81            	ret
7344                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7344                     ; 2434 {
7345                     	switch	.text
7346  07d2               _TIM1_SelectOutputTrigger:
7348  07d2 88            	push	a
7349       00000000      OFST:	set	0
7352                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7354                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7356  07d3 c652b1        	ld	a,21169
7357  07d6 a48f          	and	a,#143
7358  07d8 1a01          	or	a,(OFST+1,sp)
7359  07da c752b1        	ld	21169,a
7360                     ; 2439 }
7363  07dd 84            	pop	a
7364  07de 81            	ret
7438                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7438                     ; 2452 {
7439                     	switch	.text
7440  07df               _TIM1_SelectSlaveMode:
7442  07df 88            	push	a
7443       00000000      OFST:	set	0
7446                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7448                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7450  07e0 c652b2        	ld	a,21170
7451  07e3 a4f8          	and	a,#248
7452  07e5 1a01          	or	a,(OFST+1,sp)
7453  07e7 c752b2        	ld	21170,a
7454                     ; 2459 }
7457  07ea 84            	pop	a
7458  07eb 81            	ret
7494                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7494                     ; 2468 {
7495                     	switch	.text
7496  07ec               _TIM1_SelectMasterSlaveMode:
7500                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7502                     ; 2473   if (NewState != DISABLE)
7504  07ec 4d            	tnz	a
7505  07ed 2706          	jreq	L7663
7506                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7508  07ef 721e52b2      	bset	21170,#7
7510  07f3 2004          	jra	L1763
7511  07f5               L7663:
7512                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7514  07f5 721f52b2      	bres	21170,#7
7515  07f9               L1763:
7516                     ; 2481 }
7519  07f9 81            	ret
7573                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7573                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7573                     ; 2501                     uint8_t ExtTRGFilter)
7573                     ; 2502 {
7574                     	switch	.text
7575  07fa               _TIM1_ETRConfig:
7577  07fa 89            	pushw	x
7578       00000000      OFST:	set	0
7581                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7583                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7583                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7583                     ; 2508                          | (uint8_t) ExtTRGFilter);
7585  07fb 9f            	ld	a,xl
7586  07fc 1a01          	or	a,(OFST+1,sp)
7587  07fe 1a05          	or	a,(OFST+5,sp)
7588  0800 ca52b3        	or	a,21171
7589  0803 c752b3        	ld	21171,a
7590                     ; 2509 }
7593  0806 85            	popw	x
7594  0807 81            	ret
7680                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7680                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7680                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7680                     ; 2550 {
7681                     	switch	.text
7682  0808               _TIM1_EncoderInterfaceConfig:
7684  0808 89            	pushw	x
7685       00000000      OFST:	set	0
7688                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7690                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7692                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7694                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7696  0809 9f            	ld	a,xl
7697  080a 4d            	tnz	a
7698  080b 2706          	jreq	L7573
7699                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7701  080d 721252bd      	bset	21181,#1
7703  0811 2004          	jra	L1673
7704  0813               L7573:
7705                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7707  0813 721352bd      	bres	21181,#1
7708  0817               L1673:
7709                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7711  0817 0d05          	tnz	(OFST+5,sp)
7712  0819 2706          	jreq	L3673
7713                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7715  081b 721a52bd      	bset	21181,#5
7717  081f 2004          	jra	L5673
7718  0821               L3673:
7719                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7721  0821 721b52bd      	bres	21181,#5
7722  0825               L5673:
7723                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7725  0825 c652b2        	ld	a,21170
7726  0828 a4f0          	and	a,#240
7727  082a 1a01          	or	a,(OFST+1,sp)
7728  082c c752b2        	ld	21170,a
7729                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7731  082f c652b9        	ld	a,21177
7732  0832 a4fc          	and	a,#252
7733  0834 aa01          	or	a,#1
7734  0836 c752b9        	ld	21177,a
7735                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7737  0839 c652ba        	ld	a,21178
7738  083c a4fc          	and	a,#252
7739  083e aa01          	or	a,#1
7740  0840 c752ba        	ld	21178,a
7741                     ; 2581 }
7744  0843 85            	popw	x
7745  0844 81            	ret
7781                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7781                     ; 2590 {
7782                     	switch	.text
7783  0845               _TIM1_SelectHallSensor:
7787                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7789                     ; 2595   if (NewState != DISABLE)
7791  0845 4d            	tnz	a
7792  0846 2706          	jreq	L5004
7793                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7795  0848 721e52b1      	bset	21169,#7
7797  084c 2004          	jra	L7004
7798  084e               L5004:
7799                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7801  084e 721f52b1      	bres	21169,#7
7802  0852               L7004:
7803                     ; 2603 }
7806  0852 81            	ret
7852                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7852                     ; 2624 {
7853                     	switch	.text
7854  0853               L3_TI1_Config:
7856  0853 89            	pushw	x
7857  0854 88            	push	a
7858       00000001      OFST:	set	1
7861                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7863  0855 721152bd      	bres	21181,#0
7864                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7864                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7866  0859 7b06          	ld	a,(OFST+5,sp)
7867  085b 97            	ld	xl,a
7868  085c a610          	ld	a,#16
7869  085e 42            	mul	x,a
7870  085f 9f            	ld	a,xl
7871  0860 1a03          	or	a,(OFST+2,sp)
7872  0862 6b01          	ld	(OFST+0,sp),a
7873  0864 c652b9        	ld	a,21177
7874  0867 a40c          	and	a,#12
7875  0869 1a01          	or	a,(OFST+0,sp)
7876  086b c752b9        	ld	21177,a
7877                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7879  086e 0d02          	tnz	(OFST+1,sp)
7880  0870 2706          	jreq	L1304
7881                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7883  0872 721252bd      	bset	21181,#1
7885  0876 2004          	jra	L3304
7886  0878               L1304:
7887                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7889  0878 721352bd      	bres	21181,#1
7890  087c               L3304:
7891                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7893  087c 721052bd      	bset	21181,#0
7894                     ; 2647 }
7897  0880 5b03          	addw	sp,#3
7898  0882 81            	ret
7944                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7944                     ; 2664 {
7945                     	switch	.text
7946  0883               L5_TI2_Config:
7948  0883 89            	pushw	x
7949  0884 88            	push	a
7950       00000001      OFST:	set	1
7953                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7955  0885 721952bd      	bres	21181,#4
7956                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7956                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7958  0889 7b06          	ld	a,(OFST+5,sp)
7959  088b 97            	ld	xl,a
7960  088c a610          	ld	a,#16
7961  088e 42            	mul	x,a
7962  088f 9f            	ld	a,xl
7963  0890 1a03          	or	a,(OFST+2,sp)
7964  0892 6b01          	ld	(OFST+0,sp),a
7965  0894 c652ba        	ld	a,21178
7966  0897 a40c          	and	a,#12
7967  0899 1a01          	or	a,(OFST+0,sp)
7968  089b c752ba        	ld	21178,a
7969                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7971  089e 0d02          	tnz	(OFST+1,sp)
7972  08a0 2706          	jreq	L5504
7973                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7975  08a2 721a52bd      	bset	21181,#5
7977  08a6 2004          	jra	L7504
7978  08a8               L5504:
7979                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7981  08a8 721b52bd      	bres	21181,#5
7982  08ac               L7504:
7983                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7985  08ac 721852bd      	bset	21181,#4
7986                     ; 2682 }
7989  08b0 5b03          	addw	sp,#3
7990  08b2 81            	ret
8036                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8036                     ; 2699 {
8037                     	switch	.text
8038  08b3               L7_TI3_Config:
8040  08b3 89            	pushw	x
8041  08b4 88            	push	a
8042       00000001      OFST:	set	1
8045                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8047  08b5 721152be      	bres	21182,#0
8048                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8048                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8050  08b9 7b06          	ld	a,(OFST+5,sp)
8051  08bb 97            	ld	xl,a
8052  08bc a610          	ld	a,#16
8053  08be 42            	mul	x,a
8054  08bf 9f            	ld	a,xl
8055  08c0 1a03          	or	a,(OFST+2,sp)
8056  08c2 6b01          	ld	(OFST+0,sp),a
8057  08c4 c652bb        	ld	a,21179
8058  08c7 a40c          	and	a,#12
8059  08c9 1a01          	or	a,(OFST+0,sp)
8060  08cb c752bb        	ld	21179,a
8061                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8063  08ce 0d02          	tnz	(OFST+1,sp)
8064  08d0 2706          	jreq	L1014
8065                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8067  08d2 721252be      	bset	21182,#1
8069  08d6 2004          	jra	L3014
8070  08d8               L1014:
8071                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8073  08d8 721352be      	bres	21182,#1
8074  08dc               L3014:
8075                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8077  08dc 721052be      	bset	21182,#0
8078                     ; 2718 }
8081  08e0 5b03          	addw	sp,#3
8082  08e2 81            	ret
8128                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8128                     ; 2734 {
8129                     	switch	.text
8130  08e3               L11_TI4_Config:
8132  08e3 89            	pushw	x
8133  08e4 88            	push	a
8134       00000001      OFST:	set	1
8137                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8139  08e5 721952be      	bres	21182,#4
8140                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8140                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8142  08e9 7b06          	ld	a,(OFST+5,sp)
8143  08eb 97            	ld	xl,a
8144  08ec a610          	ld	a,#16
8145  08ee 42            	mul	x,a
8146  08ef 9f            	ld	a,xl
8147  08f0 1a03          	or	a,(OFST+2,sp)
8148  08f2 6b01          	ld	(OFST+0,sp),a
8149  08f4 c652bc        	ld	a,21180
8150  08f7 a40c          	and	a,#12
8151  08f9 1a01          	or	a,(OFST+0,sp)
8152  08fb c752bc        	ld	21180,a
8153                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8155  08fe 0d02          	tnz	(OFST+1,sp)
8156  0900 2706          	jreq	L5214
8157                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8159  0902 721a52be      	bset	21182,#5
8161  0906 2004          	jra	L7214
8162  0908               L5214:
8163                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8165  0908 721b52be      	bres	21182,#5
8166  090c               L7214:
8167                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8169  090c 721852be      	bset	21182,#4
8170                     ; 2755 }
8173  0910 5b03          	addw	sp,#3
8174  0912 81            	ret
8187                     	xdef	_TIM1_SelectHallSensor
8188                     	xdef	_TIM1_EncoderInterfaceConfig
8189                     	xdef	_TIM1_ETRConfig
8190                     	xdef	_TIM1_SelectMasterSlaveMode
8191                     	xdef	_TIM1_SelectSlaveMode
8192                     	xdef	_TIM1_SelectOutputTrigger
8193                     	xdef	_TIM1_SelectInputTrigger
8194                     	xdef	_TIM1_ETRClockMode2Config
8195                     	xdef	_TIM1_ETRClockMode1Config
8196                     	xdef	_TIM1_TIxExternalClockConfig
8197                     	xdef	_TIM1_InternalClockConfig
8198                     	xdef	_TIM1_SelectCCDMA
8199                     	xdef	_TIM1_DMACmd
8200                     	xdef	_TIM1_DMAConfig
8201                     	xdef	_TIM1_ClearITPendingBit
8202                     	xdef	_TIM1_GetITStatus
8203                     	xdef	_TIM1_ClearFlag
8204                     	xdef	_TIM1_GetFlagStatus
8205                     	xdef	_TIM1_GenerateEvent
8206                     	xdef	_TIM1_ITConfig
8207                     	xdef	_TIM1_SetIC4Prescaler
8208                     	xdef	_TIM1_SetIC3Prescaler
8209                     	xdef	_TIM1_SetIC2Prescaler
8210                     	xdef	_TIM1_SetIC1Prescaler
8211                     	xdef	_TIM1_GetCapture4
8212                     	xdef	_TIM1_GetCapture3
8213                     	xdef	_TIM1_GetCapture2
8214                     	xdef	_TIM1_GetCapture1
8215                     	xdef	_TIM1_PWMIConfig
8216                     	xdef	_TIM1_ICInit
8217                     	xdef	_TIM1_CCxNCmd
8218                     	xdef	_TIM1_CCxCmd
8219                     	xdef	_TIM1_SelectCOM
8220                     	xdef	_TIM1_SelectOCREFClear
8221                     	xdef	_TIM1_OC3NPolarityConfig
8222                     	xdef	_TIM1_OC3PolarityConfig
8223                     	xdef	_TIM1_OC2NPolarityConfig
8224                     	xdef	_TIM1_OC2PolarityConfig
8225                     	xdef	_TIM1_OC1NPolarityConfig
8226                     	xdef	_TIM1_OC1PolarityConfig
8227                     	xdef	_TIM1_ClearOC4Ref
8228                     	xdef	_TIM1_ClearOC3Ref
8229                     	xdef	_TIM1_ClearOC2Ref
8230                     	xdef	_TIM1_ClearOC1Ref
8231                     	xdef	_TIM1_OC3FastConfig
8232                     	xdef	_TIM1_OC2FastConfig
8233                     	xdef	_TIM1_OC1FastConfig
8234                     	xdef	_TIM1_OC4PreloadConfig
8235                     	xdef	_TIM1_OC3PreloadConfig
8236                     	xdef	_TIM1_OC2PreloadConfig
8237                     	xdef	_TIM1_OC1PreloadConfig
8238                     	xdef	_TIM1_ForcedOC3Config
8239                     	xdef	_TIM1_ForcedOC2Config
8240                     	xdef	_TIM1_ForcedOC1Config
8241                     	xdef	_TIM1_CCPreloadControl
8242                     	xdef	_TIM1_SetCompare4
8243                     	xdef	_TIM1_SetCompare3
8244                     	xdef	_TIM1_SetCompare2
8245                     	xdef	_TIM1_SetCompare1
8246                     	xdef	_TIM1_SelectOCxM
8247                     	xdef	_TIM1_CtrlPWMOutputs
8248                     	xdef	_TIM1_BDTRConfig
8249                     	xdef	_TIM1_OC3Init
8250                     	xdef	_TIM1_OC2Init
8251                     	xdef	_TIM1_OC1Init
8252                     	xdef	_TIM1_Cmd
8253                     	xdef	_TIM1_SelectOnePulseMode
8254                     	xdef	_TIM1_ARRPreloadConfig
8255                     	xdef	_TIM1_UpdateRequestConfig
8256                     	xdef	_TIM1_UpdateDisableConfig
8257                     	xdef	_TIM1_GetPrescaler
8258                     	xdef	_TIM1_GetCounter
8259                     	xdef	_TIM1_SetAutoreload
8260                     	xdef	_TIM1_SetCounter
8261                     	xdef	_TIM1_CounterModeConfig
8262                     	xdef	_TIM1_PrescalerConfig
8263                     	xdef	_TIM1_TimeBaseInit
8264                     	xdef	_TIM1_DeInit
8283                     	end
