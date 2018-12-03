   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 130 void TIM4_DeInit(void)
  32                     ; 131 {
  34                     	switch	.text
  35  0000               _TIM4_DeInit:
  39                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  41  0000 725f52e0      	clr	21216
  42                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  44  0004 725f52e1      	clr	21217
  45                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  47  0008 725f52e2      	clr	21218
  48                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  50  000c 725f52e4      	clr	21220
  51                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  53  0010 725f52e7      	clr	21223
  54                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  56  0014 725f52e8      	clr	21224
  57                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  59  0018 35ff52e9      	mov	21225,#255
  60                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  62  001c 725f52e5      	clr	21221
  63                     ; 140 }
  66  0020 81            	ret
 232                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 232                     ; 166                        uint8_t TIM4_Period)
 232                     ; 167 {
 233                     	switch	.text
 234  0021               _TIM4_TimeBaseInit:
 238                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 240                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 242  0021 9f            	ld	a,xl
 243  0022 c752e9        	ld	21225,a
 244                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 246  0025 9e            	ld	a,xh
 247  0026 c752e8        	ld	21224,a
 248                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 250  0029 350152e6      	mov	21222,#1
 251                     ; 177 }
 254  002d 81            	ret
 322                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 322                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 322                     ; 207 {
 323                     	switch	.text
 324  002e               _TIM4_PrescalerConfig:
 328                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 330                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 332                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 334  002e 9e            	ld	a,xh
 335  002f c752e8        	ld	21224,a
 336                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 338  0032 9f            	ld	a,xl
 339  0033 a101          	cp	a,#1
 340  0035 2606          	jrne	L731
 341                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 343  0037 721052e6      	bset	21222,#0
 345  003b 2004          	jra	L141
 346  003d               L731:
 347                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 349  003d 721152e6      	bres	21222,#0
 350  0041               L141:
 351                     ; 224 }
 354  0041 81            	ret
 386                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 386                     ; 233 {
 387                     	switch	.text
 388  0042               _TIM4_SetCounter:
 392                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 394  0042 c752e7        	ld	21223,a
 395                     ; 236 }
 398  0045 81            	ret
 430                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 430                     ; 245 {
 431                     	switch	.text
 432  0046               _TIM4_SetAutoreload:
 436                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 438  0046 c752e9        	ld	21225,a
 439                     ; 248 }
 442  0049 81            	ret
 474                     ; 255 uint8_t TIM4_GetCounter(void)
 474                     ; 256 {
 475                     	switch	.text
 476  004a               _TIM4_GetCounter:
 478  004a 88            	push	a
 479       00000001      OFST:	set	1
 482                     ; 257   uint8_t tmpcntr = 0;
 484  004b 0f01          	clr	(OFST+0,sp)
 485                     ; 258   tmpcntr = TIM4->CNTR;
 487  004d c652e7        	ld	a,21223
 488  0050 6b01          	ld	(OFST+0,sp),a
 489                     ; 260   return ((uint8_t)tmpcntr);
 491  0052 7b01          	ld	a,(OFST+0,sp)
 494  0054 5b01          	addw	sp,#1
 495  0056 81            	ret
 519                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 519                     ; 285 {
 520                     	switch	.text
 521  0057               _TIM4_GetPrescaler:
 525                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 527  0057 c652e8        	ld	a,21224
 530  005a 81            	ret
 586                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 586                     ; 297 {
 587                     	switch	.text
 588  005b               _TIM4_UpdateDisableConfig:
 592                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 594                     ; 302   if (NewState != DISABLE)
 596  005b 4d            	tnz	a
 597  005c 2706          	jreq	L542
 598                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 600  005e 721252e0      	bset	21216,#1
 602  0062 2004          	jra	L742
 603  0064               L542:
 604                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 606  0064 721352e0      	bres	21216,#1
 607  0068               L742:
 608                     ; 310 }
 611  0068 81            	ret
 669                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 669                     ; 321 {
 670                     	switch	.text
 671  0069               _TIM4_UpdateRequestConfig:
 675                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 677                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 679  0069 a101          	cp	a,#1
 680  006b 2606          	jrne	L772
 681                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 683  006d 721452e0      	bset	21216,#2
 685  0071 2004          	jra	L103
 686  0073               L772:
 687                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 689  0073 721552e0      	bres	21216,#2
 690  0077               L103:
 691                     ; 334 }
 694  0077 81            	ret
 730                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 730                     ; 343 {
 731                     	switch	.text
 732  0078               _TIM4_ARRPreloadConfig:
 736                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 738                     ; 348   if (NewState != DISABLE)
 740  0078 4d            	tnz	a
 741  0079 2706          	jreq	L123
 742                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 744  007b 721e52e0      	bset	21216,#7
 746  007f 2004          	jra	L323
 747  0081               L123:
 748                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 750  0081 721f52e0      	bres	21216,#7
 751  0085               L323:
 752                     ; 356 }
 755  0085 81            	ret
 812                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 812                     ; 367 {
 813                     	switch	.text
 814  0086               _TIM4_SelectOnePulseMode:
 818                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 820                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 822  0086 a101          	cp	a,#1
 823  0088 2606          	jrne	L353
 824                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 826  008a 721652e0      	bset	21216,#3
 828  008e 2004          	jra	L553
 829  0090               L353:
 830                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 832  0090 721752e0      	bres	21216,#3
 833  0094               L553:
 834                     ; 380 }
 837  0094 81            	ret
 872                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 872                     ; 389 {
 873                     	switch	.text
 874  0095               _TIM4_Cmd:
 878                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 880                     ; 394   if (NewState != DISABLE)
 882  0095 4d            	tnz	a
 883  0096 2706          	jreq	L573
 884                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 886  0098 721052e0      	bset	21216,#0
 888  009c 2004          	jra	L773
 889  009e               L573:
 890                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 892  009e 721152e0      	bres	21216,#0
 893  00a2               L773:
 894                     ; 402 }
 897  00a2 81            	ret
 962                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 962                     ; 431 {
 963                     	switch	.text
 964  00a3               _TIM4_ITConfig:
 966  00a3 89            	pushw	x
 967       00000000      OFST:	set	0
 970                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 972                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 974                     ; 436   if (NewState != DISABLE)
 976  00a4 9f            	ld	a,xl
 977  00a5 4d            	tnz	a
 978  00a6 2709          	jreq	L334
 979                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 981  00a8 9e            	ld	a,xh
 982  00a9 ca52e4        	or	a,21220
 983  00ac c752e4        	ld	21220,a
 985  00af 2009          	jra	L534
 986  00b1               L334:
 987                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 989  00b1 7b01          	ld	a,(OFST+1,sp)
 990  00b3 43            	cpl	a
 991  00b4 c452e4        	and	a,21220
 992  00b7 c752e4        	ld	21220,a
 993  00ba               L534:
 994                     ; 446 }
 997  00ba 85            	popw	x
 998  00bb 81            	ret
1055                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1055                     ; 457 {
1056                     	switch	.text
1057  00bc               _TIM4_GenerateEvent:
1061                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1063                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1065  00bc ca52e6        	or	a,21222
1066  00bf c752e6        	ld	21222,a
1067                     ; 463 }
1070  00c2 81            	ret
1156                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1156                     ; 475 {
1157                     	switch	.text
1158  00c3               _TIM4_GetFlagStatus:
1160  00c3 88            	push	a
1161       00000001      OFST:	set	1
1164                     ; 476   FlagStatus bitstatus = RESET;
1166  00c4 0f01          	clr	(OFST+0,sp)
1167                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1169                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1171  00c6 c452e5        	and	a,21221
1172  00c9 2706          	jreq	L725
1173                     ; 483     bitstatus = SET;
1175  00cb a601          	ld	a,#1
1176  00cd 6b01          	ld	(OFST+0,sp),a
1178  00cf 2002          	jra	L135
1179  00d1               L725:
1180                     ; 487     bitstatus = RESET;
1182  00d1 0f01          	clr	(OFST+0,sp)
1183  00d3               L135:
1184                     ; 489   return ((FlagStatus)bitstatus);
1186  00d3 7b01          	ld	a,(OFST+0,sp)
1189  00d5 5b01          	addw	sp,#1
1190  00d7 81            	ret
1225                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1225                     ; 501 {
1226                     	switch	.text
1227  00d8               _TIM4_ClearFlag:
1231                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1233                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1235  00d8 43            	cpl	a
1236  00d9 c752e5        	ld	21221,a
1237                     ; 506 }
1240  00dc 81            	ret
1300                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1300                     ; 519 {
1301                     	switch	.text
1302  00dd               _TIM4_GetITStatus:
1304  00dd 88            	push	a
1305  00de 89            	pushw	x
1306       00000002      OFST:	set	2
1309                     ; 520   ITStatus bitstatus = RESET;
1311  00df 7b02          	ld	a,(OFST+0,sp)
1312  00e1 97            	ld	xl,a
1313                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1315  00e2 7b01          	ld	a,(OFST-1,sp)
1316  00e4 97            	ld	xl,a
1319  00e5 7b02          	ld	a,(OFST+0,sp)
1320  00e7 97            	ld	xl,a
1321                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1323                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1325  00e8 c652e5        	ld	a,21221
1326  00eb 1403          	and	a,(OFST+1,sp)
1327  00ed 6b01          	ld	(OFST-1,sp),a
1328                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1330  00ef c652e4        	ld	a,21220
1331  00f2 1403          	and	a,(OFST+1,sp)
1332  00f4 6b02          	ld	(OFST+0,sp),a
1333                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1335  00f6 0d01          	tnz	(OFST-1,sp)
1336  00f8 270a          	jreq	L775
1338  00fa 0d02          	tnz	(OFST+0,sp)
1339  00fc 2706          	jreq	L775
1340                     ; 533     bitstatus = (ITStatus)SET;
1342  00fe a601          	ld	a,#1
1343  0100 6b02          	ld	(OFST+0,sp),a
1345  0102 2002          	jra	L106
1346  0104               L775:
1347                     ; 537     bitstatus = (ITStatus)RESET;
1349  0104 0f02          	clr	(OFST+0,sp)
1350  0106               L106:
1351                     ; 539   return ((ITStatus)bitstatus);
1353  0106 7b02          	ld	a,(OFST+0,sp)
1356  0108 5b03          	addw	sp,#3
1357  010a 81            	ret
1393                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1393                     ; 551 {
1394                     	switch	.text
1395  010b               _TIM4_ClearITPendingBit:
1399                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1401                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1403  010b 43            	cpl	a
1404  010c c752e5        	ld	21221,a
1405                     ; 557 }
1408  010f 81            	ret
1467                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1467                     ; 569 {
1468                     	switch	.text
1469  0110               _TIM4_DMACmd:
1471  0110 89            	pushw	x
1472       00000000      OFST:	set	0
1475                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1477                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1479                     ; 574   if (NewState != DISABLE)
1481  0111 9f            	ld	a,xl
1482  0112 4d            	tnz	a
1483  0113 2709          	jreq	L156
1484                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1486  0115 9e            	ld	a,xh
1487  0116 ca52e3        	or	a,21219
1488  0119 c752e3        	ld	21219,a
1490  011c 2009          	jra	L356
1491  011e               L156:
1492                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1494  011e 7b01          	ld	a,(OFST+1,sp)
1495  0120 43            	cpl	a
1496  0121 c452e3        	and	a,21219
1497  0124 c752e3        	ld	21219,a
1498  0127               L356:
1499                     ; 584 }
1502  0127 85            	popw	x
1503  0128 81            	ret
1527                     ; 607 void TIM4_InternalClockConfig(void)
1527                     ; 608 {
1528                     	switch	.text
1529  0129               _TIM4_InternalClockConfig:
1533                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1535  0129 c652e2        	ld	a,21218
1536  012c a4f8          	and	a,#248
1537  012e c752e2        	ld	21218,a
1538                     ; 611 }
1541  0131 81            	ret
1623                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1623                     ; 652 {
1624                     	switch	.text
1625  0132               _TIM4_SelectInputTrigger:
1627  0132 88            	push	a
1628  0133 88            	push	a
1629       00000001      OFST:	set	1
1632                     ; 653   uint8_t tmpsmcr = 0;
1634  0134 0f01          	clr	(OFST+0,sp)
1635                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1637                     ; 658   tmpsmcr = TIM4->SMCR;
1639  0136 c652e2        	ld	a,21218
1640  0139 6b01          	ld	(OFST+0,sp),a
1641                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1643  013b 7b01          	ld	a,(OFST+0,sp)
1644  013d a48f          	and	a,#143
1645  013f 6b01          	ld	(OFST+0,sp),a
1646                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1648  0141 7b01          	ld	a,(OFST+0,sp)
1649  0143 1a02          	or	a,(OFST+1,sp)
1650  0145 6b01          	ld	(OFST+0,sp),a
1651                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1653  0147 7b01          	ld	a,(OFST+0,sp)
1654  0149 c752e2        	ld	21218,a
1655                     ; 665 }
1658  014c 85            	popw	x
1659  014d 81            	ret
1732                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1732                     ; 677 {
1733                     	switch	.text
1734  014e               _TIM4_SelectOutputTrigger:
1736  014e 88            	push	a
1737  014f 88            	push	a
1738       00000001      OFST:	set	1
1741                     ; 678   uint8_t tmpcr2 = 0;
1743  0150 0f01          	clr	(OFST+0,sp)
1744                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1746                     ; 683   tmpcr2 = TIM4->CR2;
1748  0152 c652e1        	ld	a,21217
1749  0155 6b01          	ld	(OFST+0,sp),a
1750                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1752  0157 7b01          	ld	a,(OFST+0,sp)
1753  0159 a48f          	and	a,#143
1754  015b 6b01          	ld	(OFST+0,sp),a
1755                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1757  015d 7b01          	ld	a,(OFST+0,sp)
1758  015f 1a02          	or	a,(OFST+1,sp)
1759  0161 6b01          	ld	(OFST+0,sp),a
1760                     ; 691   TIM4->CR2 = tmpcr2;
1762  0163 7b01          	ld	a,(OFST+0,sp)
1763  0165 c752e1        	ld	21217,a
1764                     ; 692 }
1767  0168 85            	popw	x
1768  0169 81            	ret
1857                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1857                     ; 707 {
1858                     	switch	.text
1859  016a               _TIM4_SelectSlaveMode:
1861  016a 88            	push	a
1862  016b 88            	push	a
1863       00000001      OFST:	set	1
1866                     ; 708   uint8_t tmpsmcr = 0;
1868  016c 0f01          	clr	(OFST+0,sp)
1869                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1871                     ; 713   tmpsmcr = TIM4->SMCR;
1873  016e c652e2        	ld	a,21218
1874  0171 6b01          	ld	(OFST+0,sp),a
1875                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1877  0173 7b01          	ld	a,(OFST+0,sp)
1878  0175 a4f8          	and	a,#248
1879  0177 6b01          	ld	(OFST+0,sp),a
1880                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1882  0179 7b01          	ld	a,(OFST+0,sp)
1883  017b 1a02          	or	a,(OFST+1,sp)
1884  017d 6b01          	ld	(OFST+0,sp),a
1885                     ; 721   TIM4->SMCR = tmpsmcr;
1887  017f 7b01          	ld	a,(OFST+0,sp)
1888  0181 c752e2        	ld	21218,a
1889                     ; 722 }
1892  0184 85            	popw	x
1893  0185 81            	ret
1929                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1929                     ; 731 {
1930                     	switch	.text
1931  0186               _TIM4_SelectMasterSlaveMode:
1935                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1937                     ; 736   if (NewState != DISABLE)
1939  0186 4d            	tnz	a
1940  0187 2706          	jreq	L7201
1941                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1943  0189 721e52e2      	bset	21218,#7
1945  018d 2004          	jra	L1301
1946  018f               L7201:
1947                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1949  018f 721f52e2      	bres	21218,#7
1950  0193               L1301:
1951                     ; 744 }
1954  0193 81            	ret
1967                     	xdef	_TIM4_SelectMasterSlaveMode
1968                     	xdef	_TIM4_SelectSlaveMode
1969                     	xdef	_TIM4_SelectOutputTrigger
1970                     	xdef	_TIM4_SelectInputTrigger
1971                     	xdef	_TIM4_InternalClockConfig
1972                     	xdef	_TIM4_DMACmd
1973                     	xdef	_TIM4_ClearITPendingBit
1974                     	xdef	_TIM4_GetITStatus
1975                     	xdef	_TIM4_ClearFlag
1976                     	xdef	_TIM4_GetFlagStatus
1977                     	xdef	_TIM4_GenerateEvent
1978                     	xdef	_TIM4_ITConfig
1979                     	xdef	_TIM4_Cmd
1980                     	xdef	_TIM4_SelectOnePulseMode
1981                     	xdef	_TIM4_ARRPreloadConfig
1982                     	xdef	_TIM4_UpdateRequestConfig
1983                     	xdef	_TIM4_UpdateDisableConfig
1984                     	xdef	_TIM4_GetPrescaler
1985                     	xdef	_TIM4_GetCounter
1986                     	xdef	_TIM4_SetAutoreload
1987                     	xdef	_TIM4_SetCounter
1988                     	xdef	_TIM4_PrescalerConfig
1989                     	xdef	_TIM4_TimeBaseInit
1990                     	xdef	_TIM4_DeInit
2009                     	end
