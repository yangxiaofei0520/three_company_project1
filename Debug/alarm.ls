   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               _g_nAlmStat:
   7  0000 00            	dc.b	0
   8  0001               _g_dwBatVol:
   9  0001 0000          	dc.w	0
  10  0003               _g_dwBatNoLoadVol:
  11  0003 0000          	dc.w	0
  12  0005               _g_dwInnerVol:
  13  0005 0000          	dc.w	0
  14  0007               _g_nGuardEnFlg:
  15  0007 00            	dc.b	0
  16  0008               _g_nAlmRepFailCnt:
  17  0008 00            	dc.b	0
  46                     ; 46 void ADC_OffToOnChange(void)
  46                     ; 47 {
  48                     	switch	.text
  49  0000               _ADC_OffToOnChange:
  53                     ; 48     ADC1->CR1 &= (uint8_t)~ADC_CR1_ADON;	
  55  0000 72115340      	bres	21312,#0
  56                     ; 50     ADC1->CR1 |= ADC_CR1_ADON;
  58  0004 72105340      	bset	21312,#0
  59                     ; 51 }
  62  0008 81            	ret	
  95                     ; 62 u16 ADC_GetAdcVol(void)
  95                     ; 63 {
  96                     	switch	.text
  97  0009               _ADC_GetAdcVol:
  99  0009 89            	pushw	x
 100       00000002      OFST:	set	2
 103                     ; 64 	uint16_t tmpreg = 0;
 105  000a 5f            	clrw	x
 106  000b 1f01          	ldw	(OFST-1,sp),x
 107                     ; 67 	ADC1->CR1 |= ADC_CR1_START; 	//ADC_SoftwareStartConv(ADC1);
 109  000d 72125340      	bset	21312,#1
 110                     ; 68 	delay_us(10000);
 112  0011 ae2710        	ldw	x,#10000
 113  0014 cd0000        	call	_delay_us
 116  0017               L73:
 117                     ; 71 	while ((ADC1->SR & ADC_FLAG_EOC) == (uint8_t)RESET) //(ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0)
 119  0017 72015343fb    	btjf	21315,#0,L73
 120                     ; 75 	tmpreg = (uint16_t)(ADC1->DRH);
 122  001c c65344        	ld	a,21316
 123  001f 97            	ld	xl,a
 124                     ; 76 	tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADC1->DRL); //ADC_GetConversionValue(ADC1);
 126  0020 c65345        	ld	a,21317
 127  0023 02            	rlwa	x,a
 128                     ; 77 	ADC1->SR = (uint8_t)~ADC_FLAG_EOC;
 130  0024 35fe5343      	mov	21315,#254
 131                     ; 79 	return tmpreg;
 135  0028 5b02          	addw	sp,#2
 136  002a 81            	ret	
 191                     ; 90 u16 ADC_GetVavleCtlVol(void)
 191                     ; 91 {
 192                     	switch	.text
 193  002b               _ADC_GetVavleCtlVol:
 195  002b 520c          	subw	sp,#12
 196       0000000c      OFST:	set	12
 199                     ; 92 	uint16_t wRefAdc = 0, wIn2Adc = 0, wVin2 = 0;
 205                     ; 93 	u32 dwTmp = 0;	
 207  002d 96            	ldw	x,sp
 208  002e 1c0007        	addw	x,#OFST-5
 209  0031 cd0000        	call	c_ltor
 211                     ; 96 	ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, DISABLE);
 213  0034 4b00          	push	#0
 214  0036 ae0010        	ldw	x,#16
 215  0039 89            	pushw	x
 216  003a ae5340        	ldw	x,#21312
 217  003d cd0000        	call	_ADC_ChannelCmd
 219  0040 5b03          	addw	sp,#3
 220                     ; 98 	ADC_ChannelCmd(ADC1, ADC_Channel_15, ENABLE);
 222  0042 4b01          	push	#1
 223  0044 ae0280        	ldw	x,#640
 224  0047 89            	pushw	x
 225  0048 ae5340        	ldw	x,#21312
 226  004b cd0000        	call	_ADC_ChannelCmd
 228  004e 5b03          	addw	sp,#3
 229                     ; 103 	wIn2Adc = ADC_GetAdcVol();
 231  0050 adb7          	call	_ADC_GetAdcVol
 233                     ; 104 	wIn2Adc = ADC_GetAdcVol();
 235  0052 adb5          	call	_ADC_GetAdcVol
 237  0054 1f05          	ldw	(OFST-7,sp),x
 238                     ; 108 	ADC_ChannelCmd(ADC1, ADC_Channel_15, DISABLE);
 240  0056 4b00          	push	#0
 241  0058 ae0280        	ldw	x,#640
 242  005b 89            	pushw	x
 243  005c ae5340        	ldw	x,#21312
 244  005f cd0000        	call	_ADC_ChannelCmd
 246  0062 5b03          	addw	sp,#3
 247                     ; 112 	ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
 249  0064 4b01          	push	#1
 250  0066 ae0010        	ldw	x,#16
 251  0069 89            	pushw	x
 252  006a ae5340        	ldw	x,#21312
 253  006d cd0000        	call	_ADC_ChannelCmd
 255  0070 5b03          	addw	sp,#3
 256                     ; 113 	wRefAdc = ADC_GetAdcVol();
 258  0072 ad95          	call	_ADC_GetAdcVol
 260                     ; 114 	wRefAdc = ADC_GetAdcVol();
 262  0074 ad93          	call	_ADC_GetAdcVol
 264  0076 1f0b          	ldw	(OFST-1,sp),x
 265                     ; 115 	dwTmp = 1220;
 267  0078 96            	ldw	x,sp
 268  0079 1c0007        	addw	x,#OFST-5
 269  007c cd0000        	call	c_ltor
 271                     ; 116 	dwTmp = dwTmp*wIn2Adc/wRefAdc;
 273  007f 1e0b          	ldw	x,(OFST-1,sp)
 274  0081 cd0000        	call	c_uitolx
 276  0084 96            	ldw	x,sp
 277  0085 5c            	incw	x
 278  0086 cd0000        	call	c_rtol
 280  0089 1e05          	ldw	x,(OFST-7,sp)
 281  008b 90ae04c4      	ldw	y,#1220
 282  008f cd0000        	call	c_umul
 284  0092 96            	ldw	x,sp
 285  0093 5c            	incw	x
 286  0094 cd0000        	call	c_ludv
 288  0097 96            	ldw	x,sp
 289  0098 1c0007        	addw	x,#OFST-5
 290  009b cd0000        	call	c_rtol
 292                     ; 117 	wVin2 = (u16)dwTmp;
 294  009e 1e09          	ldw	x,(OFST-3,sp)
 295                     ; 119 	return wVin2;
 299  00a0 5b0c          	addw	sp,#12
 300  00a2 81            	ret	
 303                     .const:	section	.text
 304  0000               L56_wAdcBuf:
 305  0000 0000          	dc.w	0
 306  0002 00000000      	ds.b	4
 372                     ; 131 u16 ADC_ClaAvrVol(u8 nLoadFLg)
 372                     ; 132 {
 373                     	switch	.text
 374  00a3               _ADC_ClaAvrVol:
 376  00a3 88            	push	a
 377  00a4 520f          	subw	sp,#15
 378       0000000f      OFST:	set	15
 381                     ; 133 	u32 dwTmp = 0;
 383  00a6 5f            	clrw	x
 384  00a7 1f07          	ldw	(OFST-8,sp),x
 385  00a9 1f05          	ldw	(OFST-10,sp),x
 386                     ; 134 	u16 wAdcVol = 0;
 388                     ; 135 	u16 wAdcBuf[3] = {0}; //3
 390  00ab 96            	ldw	x,sp
 391  00ac 1c0009        	addw	x,#OFST-6
 392  00af 90ae0000      	ldw	y,#L56_wAdcBuf
 393  00b3 a606          	ld	a,#6
 394  00b5 cd0000        	call	c_xymvx
 396                     ; 136 	u8 nLoop = 0;
 398                     ; 138 	if(nLoadFLg)
 400  00b8 7b10          	ld	a,(OFST+1,sp)
 401  00ba 2721          	jreq	L511
 402                     ; 140 		SetPortBatGatEnable();
 404  00bc 4b01          	push	#1
 405  00be 4b10          	push	#16
 406  00c0 ae5005        	ldw	x,#20485
 407  00c3 cd0000        	call	_GPIO_WriteBit
 409  00c6 85            	popw	x
 410                     ; 141 		UC_SleepFunc(1); 
 412  00c7 ae0001        	ldw	x,#1
 413  00ca 89            	pushw	x
 414  00cb 5f            	clrw	x
 415  00cc 89            	pushw	x
 416  00cd cd0000        	call	_UC_SleepFunc
 418  00d0 5b04          	addw	sp,#4
 419                     ; 145 		UC_SleepFunc(4); 
 421  00d2 ae0004        	ldw	x,#4
 422  00d5 89            	pushw	x
 423  00d6 5f            	clrw	x
 424  00d7 89            	pushw	x
 425  00d8 cd0000        	call	_UC_SleepFunc
 427  00db 5b04          	addw	sp,#4
 428  00dd               L511:
 429                     ; 147 	SetPortMeterPowerOff();
 431  00dd 4b00          	push	#0
 432  00df 4b08          	push	#8
 433  00e1 ae5000        	ldw	x,#20480
 434  00e4 cd0000        	call	_GPIO_WriteBit
 436  00e7 85            	popw	x
 437                     ; 148 	SetPortGsmPowerOff();
 439  00e8 4b00          	push	#0
 440  00ea 4b10          	push	#16
 441  00ec ae500a        	ldw	x,#20490
 442  00ef cd0000        	call	_GPIO_WriteBit
 444  00f2 85            	popw	x
 445                     ; 149 	for(nLoop = 0; nLoop < 1; nLoop++) // 3
 447  00f3 0f0f          	clr	(OFST+0,sp)
 448  00f5               L711:
 449                     ; 152 		wAdcBuf[nLoop] = ADC_GetVavleCtlVol();
 451  00f5 cd002b        	call	_ADC_GetVavleCtlVol
 453  00f8 9096          	ldw	y,sp
 454  00fa 72a90009      	addw	y,#OFST-6
 455  00fe 1701          	ldw	(OFST-14,sp),y
 456  0100 7b0f          	ld	a,(OFST+0,sp)
 457  0102 905f          	clrw	y
 458  0104 9097          	ld	yl,a
 459  0106 9058          	sllw	y
 460  0108 72f901        	addw	y,(OFST-14,sp)
 461  010b 90ff          	ldw	(y),x
 462                     ; 149 	for(nLoop = 0; nLoop < 1; nLoop++) // 3
 464  010d 0c0f          	inc	(OFST+0,sp)
 467  010f 27e4          	jreq	L711
 468                     ; 157 	if(nLoadFLg)
 470  0111 7b10          	ld	a,(OFST+1,sp)
 471  0113 270b          	jreq	L521
 472                     ; 162 		SetPortBatGatDisable(); 
 474  0115 4b00          	push	#0
 475  0117 4b10          	push	#16
 476  0119 ae5005        	ldw	x,#20485
 477  011c cd0000        	call	_GPIO_WriteBit
 479  011f 85            	popw	x
 480  0120               L521:
 481                     ; 166 	if(TRUE == GetReportFlag())
 483  0120 cd0000        	call	_GetReportFlag
 485  0123 4a            	dec	a
 486  0124 260b          	jrne	L721
 487                     ; 168 		SetPortGsmPowerOn();
 489  0126 4b01          	push	#1
 490  0128 4b10          	push	#16
 491  012a ae500a        	ldw	x,#20490
 492  012d cd0000        	call	_GPIO_WriteBit
 494  0130 85            	popw	x
 495  0131               L721:
 496                     ; 171 	if(GetTmDebugModeStat())
 498  0131 cd0000        	call	_GetTmDebugModeStat
 500  0134 4d            	tnz	a
 501  0135 270b          	jreq	L131
 502                     ; 173 		SetPortMeterPowerOn();
 504  0137 4b01          	push	#1
 505  0139 4b08          	push	#8
 506  013b ae5000        	ldw	x,#20480
 507  013e cd0000        	call	_GPIO_WriteBit
 509  0141 85            	popw	x
 510  0142               L131:
 511                     ; 177 	for(nLoop = 0; nLoop < 1; nLoop++)
 513  0142 0f0f          	clr	(OFST+0,sp)
 514  0144               L331:
 515                     ; 179 		dwTmp += wAdcBuf[nLoop];
 517  0144 96            	ldw	x,sp
 518  0145 1c0009        	addw	x,#OFST-6
 519  0148 1f01          	ldw	(OFST-14,sp),x
 520  014a 7b0f          	ld	a,(OFST+0,sp)
 521  014c 5f            	clrw	x
 522  014d 97            	ld	xl,a
 523  014e 58            	sllw	x
 524  014f 72fb01        	addw	x,(OFST-14,sp)
 525  0152 fe            	ldw	x,(x)
 526  0153 cd0000        	call	c_uitolx
 528  0156 96            	ldw	x,sp
 529  0157 1c0005        	addw	x,#OFST-10
 530  015a cd0000        	call	c_lgadd
 532                     ; 177 	for(nLoop = 0; nLoop < 1; nLoop++)
 534  015d 0c0f          	inc	(OFST+0,sp)
 537  015f 27e3          	jreq	L331
 538                     ; 181 	wAdcVol = (u16)dwTmp;  // wAdcVol = dwTmp/2;
 540  0161 1e07          	ldw	x,(OFST-8,sp)
 541                     ; 183 	return wAdcVol;	
 545  0163 5b10          	addw	sp,#16
 546  0165 81            	ret	
 600                     	switch	.const
 601  0006               L07:
 602  0006 00001389      	dc.l	5001
 603  000a               L27:
 604  000a 00001d4c      	dc.l	7500
 605                     ; 196 u16 BAT_GetBatVolExt(u8 nLoadFLg)
 605                     ; 197 {
 606                     	switch	.text
 607  0166               _BAT_GetBatVolExt:
 609  0166 88            	push	a
 610  0167 5206          	subw	sp,#6
 611       00000006      OFST:	set	6
 614                     ; 198 	u32 dwAdc = 0, dwTmp = 0;
 616  0169 96            	ldw	x,sp
 617  016a 1c0003        	addw	x,#OFST-3
 618  016d cd0000        	call	c_ltor
 622  0170 96            	ldw	x,sp
 623  0171 1c0003        	addw	x,#OFST-3
 624  0174 cd0000        	call	c_ltor
 626                     ; 199 	u16 wBatVol = 0;
 628  0177 1e01          	ldw	x,(OFST-5,sp)
 629                     ; 201 	dwAdc = ADC_ClaAvrVol(nLoadFLg);
 631  0179 7b07          	ld	a,(OFST+1,sp)
 632  017b cd00a3        	call	_ADC_ClaAvrVol
 634  017e cd0000        	call	c_uitolx
 636  0181 96            	ldw	x,sp
 637  0182 1c0003        	addw	x,#OFST-3
 638  0185 cd0000        	call	c_rtol
 640                     ; 202 	dwTmp = dwAdc*6;
 642  0188 96            	ldw	x,sp
 643  0189 1c0003        	addw	x,#OFST-3
 644  018c cd0000        	call	c_ltor
 646  018f a606          	ld	a,#6
 647  0191 cd0000        	call	c_smul
 649  0194 96            	ldw	x,sp
 650  0195 1c0003        	addw	x,#OFST-3
 651  0198 cd0000        	call	c_rtol
 653                     ; 204 	if((5000 < dwTmp)&&(dwTmp<7500))
 655  019b 96            	ldw	x,sp
 656  019c 1c0003        	addw	x,#OFST-3
 657  019f cd0000        	call	c_ltor
 659  01a2 ae0006        	ldw	x,#L07
 660  01a5 cd0000        	call	c_lcmp
 662  01a8 2513          	jrult	L361
 664  01aa 96            	ldw	x,sp
 665  01ab 1c0003        	addw	x,#OFST-3
 666  01ae cd0000        	call	c_ltor
 668  01b1 ae000a        	ldw	x,#L27
 669  01b4 cd0000        	call	c_lcmp
 671  01b7 2404          	jruge	L361
 672                     ; 206 		wBatVol = dwTmp;
 674  01b9 1e05          	ldw	x,(OFST-1,sp)
 676  01bb 2001          	jra	L561
 677  01bd               L361:
 678                     ; 210 		wBatVol = 0;
 680  01bd 5f            	clrw	x
 681  01be               L561:
 682                     ; 213 	return wBatVol;	
 686  01be 5b07          	addw	sp,#7
 687  01c0 81            	ret	
 711                     ; 258 u16 BAT_GetBatVol(void)
 711                     ; 259 {
 712                     	switch	.text
 713  01c1               _BAT_GetBatVol:
 717                     ; 263 	return BAT_GetBatVolExt(TRUE);	
 719  01c1 a601          	ld	a,#1
 723  01c3 20a1          	jp	_BAT_GetBatVolExt
 764                     ; 275 u8 BAT_ManageFunc(void)
 764                     ; 276 {
 765                     	switch	.text
 766  01c5               _BAT_ManageFunc:
 768  01c5 89            	pushw	x
 769       00000002      OFST:	set	2
 772                     ; 277 	u16 wBatVol = 0;
 774  01c6 5f            	clrw	x
 775  01c7 1f01          	ldw	(OFST-1,sp),x
 776                     ; 279 	g_dwBatVol = BAT_GetBatVol();
 778  01c9 adf6          	call	_BAT_GetBatVol
 780  01cb cf0001        	ldw	_g_dwBatVol,x
 781                     ; 280 	if(BATVOL_LOWLIMT >= g_dwBatVol)
 783  01ce a31839        	cpw	x,#6201
 784  01d1 2437          	jruge	L312
 785                     ; 283 		stRepFail.wError |= (1<<BT_POWERLOW);
 787  01d3 721c0007      	bset	_stRepFail+7,#6
 788                     ; 284 		STM8_RTC_Get(&stTimeNow);
 790  01d7 ae0000        	ldw	x,#_stTimeNow
 791  01da cd0000        	call	_STM8_RTC_Get
 793                     ; 285 		MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stTimeNow, sizeof(stRepFail.stTime));
 795  01dd 4b06          	push	#6
 796  01df ae0000        	ldw	x,#_stTimeNow
 797  01e2 89            	pushw	x
 798  01e3 ae0000        	ldw	x,#_stRepFail
 799  01e6 cd0000        	call	_MemcpyFunc
 801  01e9 5b03          	addw	sp,#3
 802                     ; 286 		stRepFail.nSigal = 0xFF;			//信号大小,固定值
 804  01eb 35ff0008      	mov	_stRepFail+8,#255
 805                     ; 287 		AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));	
 807  01ef 4b09          	push	#9
 808  01f1 ae0000        	ldw	x,#_stRepFail
 809  01f4 cd0000        	call	_AddAlmRecord
 811  01f7 ae003c        	ldw	x,#60
 812  01fa 84            	pop	a
 813                     ; 288 		UC_SleepFunc(60);
 815  01fb 89            	pushw	x
 816  01fc 5f            	clrw	x
 817  01fd 89            	pushw	x
 818  01fe cd0000        	call	_UC_SleepFunc
 820  0201 5b04          	addw	sp,#4
 821                     ; 289 		LP_ClrLowPwrStartFlg(LP_GPRS_FLG_OK);
 823  0203 a601          	ld	a,#1
 824  0205 cd0000        	call	_LP_ClrLowPwrStartFlg
 826                     ; 305 		return BATVOL_LOW; 
 828  0208 2005          	jp	LC001
 829  020a               L312:
 830                     ; 307 	else if(BAT_NO_BAT_VOL >= g_dwBatVol)
 832  020a a303e9        	cpw	x,#1001
 833  020d 2404          	jruge	L712
 834                     ; 309 		return BATVOL_LOW; 
 836  020f               LC001:
 838  020f a601          	ld	a,#1
 840  0211               L611:
 842  0211 85            	popw	x
 843  0212 81            	ret	
 844  0213               L712:
 845                     ; 311 	else if((BATVOL_HIGHLIMT > g_dwBatVol)&&(BATVOL_LOWLIMT < g_dwBatVol))
 847  0213 a31d4c        	cpw	x,#7500
 848  0216 2409          	jruge	LC002
 850  0218 a31839        	cpw	x,#6201
 851  021b 2504          	jrult	LC002
 852                     ; 322 		stRepFail.wError &= ~((u16)(1<<BT_POWERLOW));
 854  021d 721d0007      	bres	_stRepFail+7,#6
 855                     ; 323 		return BATVOL_NORMAL;
 857  0221               LC002:
 859  0221 4f            	clr	a
 861  0222 20ed          	jra	L611
 862                     ; 327 		return BATVOL_NORMAL;
 866                     	switch	.data
 867  0009               L722_nAlmPressChk:
 868  0009 01            	dc.b	1
 902                     	switch	.const
 903  000e               L621:
 904  000e ffffff00      	dc.l	-256
 905  0012               L031:
 906  0012 00000064      	dc.l	100
 907                     ; 340 void ALM_PressureOverLimit(void)
 907                     ; 341 {
 908                     	switch	.text
 909  0224               _ALM_PressureOverLimit:
 911  0224 5204          	subw	sp,#4
 912       00000004      OFST:	set	4
 915                     ; 344 	if((FALSE == nAlmPressChk)||(0 == tyParameter.nAlmCtl[0]&0x01)||(0xFFFFFF00 <= tyRecord.wPressure))
 917  0226 725d0009      	tnz	L722_nAlmPressChk
 918  022a 275f          	jreq	L631
 920  022c 725d0014      	tnz	_tyParameter+20
 921  0230 2605          	jrne	L221
 922  0232 ae0001        	ldw	x,#1
 923  0235 2001          	jra	L421
 924  0237               L221:
 925  0237 5f            	clrw	x
 926  0238               L421:
 927  0238 01            	rrwa	x,a
 928  0239 a501          	bcp	a,#1
 929  023b 264e          	jrne	L631
 931  023d ae000a        	ldw	x,#_tyRecord+10
 932  0240 cd0000        	call	c_ltor
 934  0243 ae000e        	ldw	x,#L621
 935  0246 cd0000        	call	c_lcmp
 937                     ; 346 		return ;
 939  0249 2440          	jruge	L631
 940                     ; 349 	if(tyParameter.wBasePress-(tyParameter.wBasePress*(u32)tyParameter.nDownLmtRate/100) >= tyRecord.wPressure)
 942  024b ad41          	call	LC004
 944  024d 96            	ldw	x,sp
 945  024e 5c            	incw	x
 946  024f cd0000        	call	c_rtol
 948  0252 ae0010        	ldw	x,#_tyParameter+16
 949  0255 cd0000        	call	c_ltor
 951  0258 96            	ldw	x,sp
 952  0259 5c            	incw	x
 953  025a cd0000        	call	c_lsub
 955  025d ae000a        	ldw	x,#_tyRecord+10
 956  0260 cd0000        	call	c_lcmp
 958  0263 2504          	jrult	L352
 959                     ; 351 		ALM_SetAlmStatus(PRESS_DOWNLIMIT);
 961  0265 a640          	ld	a,#64
 964  0267 201c          	jp	LC003
 965  0269               L352:
 966                     ; 353 	else if(tyParameter.wBasePress <= tyRecord.wPressure-(tyParameter.wBasePress*(u32)tyParameter.nDownLmtRate/100))/* 越上限 */
 968  0269 ad23          	call	LC004
 970  026b 96            	ldw	x,sp
 971  026c 5c            	incw	x
 972  026d cd0000        	call	c_rtol
 974  0270 ae000a        	ldw	x,#_tyRecord+10
 975  0273 cd0000        	call	c_ltor
 977  0276 96            	ldw	x,sp
 978  0277 5c            	incw	x
 979  0278 cd0000        	call	c_lsub
 981  027b ae0010        	ldw	x,#_tyParameter+16
 982  027e cd0000        	call	c_lcmp
 984  0281 2504          	jrult	L552
 985                     ; 355 		ALM_SetAlmStatus(PRESS_UPLIMIT);
 987  0283 a620          	ld	a,#32
 988  0285               LC003:
 989  0285 ad5e          	call	_ALM_SetAlmStatus
 991  0287               L552:
 992                     ; 358 	nAlmPressChk = FALSE;
 994  0287 725f0009      	clr	L722_nAlmPressChk
 995                     ; 359 	return ;
 996  028b               L631:
 999  028b 5b04          	addw	sp,#4
1000  028d 81            	ret	
1002  028e               LC004:
1003  028e 5500190003    	mov	c_lreg+3,_tyParameter+25
1004  0293 3f02          	clr	c_lreg+2
1005  0295 3f01          	clr	c_lreg+1
1006  0297 3f00          	clr	c_lreg
1007  0299 ae0010        	ldw	x,#_tyParameter+16
1008  029c cd0000        	call	c_lmul
1010  029f ae0012        	ldw	x,#L031
1011  02a2 cc0000        	jp	c_ludv
1013                     	switch	.data
1014  000a               L162_nBatAdcFlg:
1015  000a 01            	dc.b	1
1066                     ; 372 void ALM_TaskFunc(void)
1066                     ; 373 {
1067                     	switch	.text
1068  02a5               _ALM_TaskFunc:
1070  02a5 89            	pushw	x
1071       00000002      OFST:	set	2
1074                     ; 374 	u8 nWakeUpFlg = 0;
1076  02a6 0f01          	clr	(OFST-1,sp)
1077                     ; 375 	u8 nGuardKeyStat = 0;
1079  02a8 0f02          	clr	(OFST+0,sp)
1080                     ; 381 	if(nBatAdcFlg)                      /* 修改2017081401 */
1082  02aa c6000a        	ld	a,L162_nBatAdcFlg
1083  02ad 270d          	jreq	L303
1084                     ; 383 		g_nAlmStat |= BAT_ManageFunc();
1086  02af cd01c5        	call	_BAT_ManageFunc
1088  02b2 ca0000        	or	a,_g_nAlmStat
1089  02b5 c70000        	ld	_g_nAlmStat,a
1090                     ; 384 		nBatAdcFlg = FALSE;
1092  02b8 725f000a      	clr	L162_nBatAdcFlg
1093  02bc               L303:
1094                     ; 429 		ALM_PressureOverLimit();
1096  02bc cd0224        	call	_ALM_PressureOverLimit
1098                     ; 433 	if((NO_ALARM == (g_nAlmStat & ALARM_MASK))&&(FALSE == g_nGmFlg))
1100  02bf c60000        	ld	a,_g_nAlmStat
1101  02c2 5f            	clrw	x
1102  02c3 97            	ld	xl,a
1103  02c4 5d            	tnzw	x
1104  02c5 2618          	jrne	L503
1106  02c7 c60000        	ld	a,_g_nGmFlg
1107  02ca 2613          	jrne	L503
1108                     ; 435 		g_nAlmRepFailCnt = 0;
1110  02cc c70008        	ld	_g_nAlmRepFailCnt,a
1111                     ; 436 		g_nGuardEnFlg &= ((~ALARM_REP_FLG)&0x3F);
1113  02cf c60007        	ld	a,_g_nGuardEnFlg
1114  02d2 a43d          	and	a,#61
1115  02d4 c70007        	ld	_g_nGuardEnFlg,a
1116                     ; 437 		SaveByte(ADDRESS_GUARD_EN, g_nGuardEnFlg);
1118  02d7 88            	push	a
1119  02d8 ae1000        	ldw	x,#4096
1120  02db cd0000        	call	_SaveByte
1122  02de 84            	pop	a
1123  02df               L503:
1124                     ; 439 }
1127  02df 85            	popw	x
1128  02e0 81            	ret	
1152                     ; 450 u8 ALM_GetBatStatus(void)
1152                     ; 451 {
1153                     	switch	.text
1154  02e1               _ALM_GetBatStatus:
1158                     ; 452 	return g_nAlmStat;
1160  02e1 c60000        	ld	a,_g_nAlmStat
1163  02e4 81            	ret	
1197                     ; 464 u8 ALM_SetAlmStatus(u8 nNewAlmStat)
1197                     ; 465 {
1198                     	switch	.text
1199  02e5               _ALM_SetAlmStatus:
1201  02e5 88            	push	a
1202       00000000      OFST:	set	0
1205                     ; 466 	LP_ClrLowPwrStartFlg(LP_GPRS_FLG_OK);
1207  02e6 a601          	ld	a,#1
1208  02e8 cd0000        	call	_LP_ClrLowPwrStartFlg
1210                     ; 467 	g_nAlmStat|= nNewAlmStat;
1212  02eb c60000        	ld	a,_g_nAlmStat
1213  02ee 1a01          	or	a,(OFST+1,sp)
1214  02f0 c70000        	ld	_g_nAlmStat,a
1215                     ; 477 }
1218  02f3 84            	pop	a
1219  02f4 81            	ret	
1252                     ; 488 u8 ALM_ClrAlmStatus(u8 nNewAlmStat)
1252                     ; 489 {
1253                     	switch	.text
1254  02f5               _ALM_ClrAlmStatus:
1258                     ; 490 	g_nAlmStat &= (~nNewAlmStat);	
1260  02f5 43            	cpl	a
1261  02f6 c40000        	and	a,_g_nAlmStat
1262  02f9 c70000        	ld	_g_nAlmStat,a
1263                     ; 501 }
1266  02fc 81            	ret	
1323                     	xdef	_ALM_PressureOverLimit
1324                     	xdef	_BAT_ManageFunc
1325                     	xdef	_BAT_GetBatVolExt
1326                     	xdef	_ADC_ClaAvrVol
1327                     	xdef	_ADC_GetAdcVol
1328                     	xdef	_ADC_OffToOnChange
1329                     	xref	_g_nGmFlg
1330                     	xdef	_g_nAlmStat
1331                     	xref	_STM8_RTC_Get
1332                     	xref	_stRepFail
1333                     	xref	_tyParameter
1334                     	xref	_tyRecord
1335                     	xref	_AddAlmRecord
1336                     	xref	_SaveByte
1337                     	xref	_LP_ClrLowPwrStartFlg
1338                     	xref	_UC_SleepFunc
1339                     	xref	_GetReportFlag
1340                     	xref	_stTimeNow
1341                     	xdef	_ADC_GetVavleCtlVol
1342                     	xdef	_ALM_ClrAlmStatus
1343                     	xdef	_ALM_SetAlmStatus
1344                     	xdef	_BAT_GetBatVol
1345                     	xdef	_ALM_GetBatStatus
1346                     	xdef	_ALM_TaskFunc
1347                     	xdef	_g_nAlmRepFailCnt
1348                     	xdef	_g_nGuardEnFlg
1349                     	xdef	_g_dwBatNoLoadVol
1350                     	xdef	_g_dwInnerVol
1351                     	xdef	_g_dwBatVol
1352                     	xref	_GetTmDebugModeStat
1353                     	xref	_MemcpyFunc
1354                     	xref	_delay_us
1355                     	xref	_GPIO_WriteBit
1356                     	xref	_ADC_ChannelCmd
1357                     	xref.b	c_lreg
1376                     	xref	c_lsub
1377                     	xref	c_lmul
1378                     	xref	c_lcmp
1379                     	xref	c_smul
1380                     	xref	c_lgadd
1381                     	xref	c_xymvx
1382                     	xref	c_ludv
1383                     	xref	c_rtol
1384                     	xref	c_uitolx
1385                     	xref	c_umul
1386                     	xref	c_ltor
1387                     	end
