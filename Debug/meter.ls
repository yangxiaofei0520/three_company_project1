   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               _g_wGMInterval:
   7  0000 000f          	dc.w	15
   8  0002               _g_nGmFlg:
   9  0002 01            	dc.b	1
  10  0003               _g_nErrFlg:
  11  0003 00            	dc.b	0
  12  0004               _g_nGatherMeterFlg:
  13  0004 00            	dc.b	0
  14  0005               _g_nOptValveTask:
  15  0005 ff            	dc.b	255
  16  0006               _g_dwNowMeterVal:
  17  0006 00000000      	dc.l	0
  47                     ; 274 void JASON_130PurchasePro(void)
  47                     ; 275 {
  49                     	switch	.text
  50  0000               _JASON_130PurchasePro:
  54                     ; 416 }
  57  0000 81            	ret	
  60                     	switch	.data
  61  000a               L12_nTimeOut:
  62  000a 00            	dc.b	0
 145                     .const:	section	.text
 146  0000               L21:
 147  0000 00001770      	dc.l	6000
 148  0004               L62:
 149  0004 0000003c      	dc.l	60
 150  0008               L63:
 151  0008 00000002      	dc.l	2
 152                     ; 426 void JASON_130TaskMeter(void)
 152                     ; 427 {
 153                     	switch	.text
 154  0001               _JASON_130TaskMeter:
 156  0001 520c          	subw	sp,#12
 157       0000000c      OFST:	set	12
 160                     ; 429 	int32_t dwOffset   = 0;
 162  0003 96            	ldw	x,sp
 163  0004 1c0009        	addw	x,#OFST-3
 164  0007 cd0000        	call	c_ltor
 166                     ; 430 	u8 nRepFlg = 0, nReadFlg = FALSE;
 170                     ; 431 	u16 wGatherInterval = 0; 
 172  000a 5f            	clrw	x
 173  000b 1f06          	ldw	(OFST-6,sp),x
 174                     ; 435 	if((GetReportFlag())&&g_dwSysTick<6000)
 176  000d cd0000        	call	_GetReportFlag
 178  0010 4d            	tnz	a
 179  0011 2711          	jreq	L74
 181  0013 ae0000        	ldw	x,#_g_dwSysTick
 182  0016 cd0000        	call	c_ltor
 184  0019 ae0000        	ldw	x,#L21
 185  001c cd0000        	call	c_lcmp
 187  001f 2403cc00ac    	jrult	L011
 188                     ; 437 		return ;
 190  0024               L74:
 191                     ; 440 	nRepFlg = GetReportFailFlag();
 193  0024 cd0000        	call	_GetReportFailFlag
 195  0027 6b08          	ld	(OFST-4,sp),a
 196                     ; 441 	if(TRUE == g_nGmFlg)
 198  0029 c60002        	ld	a,_g_nGmFlg
 199  002c 4a            	dec	a
 200  002d 2703cc01db    	jrne	L15
 201                     ; 443 		MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));
 203  0032 4b0c          	push	#12
 204  0034 4b00          	push	#0
 205  0036 ae0000        	ldw	x,#_tyRecord
 206  0039 cd0000        	call	_MemsetFunc
 208  003c 85            	popw	x
 209                     ; 444 		nReadFlg = ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord));
 211  003d 4b0c          	push	#12
 212  003f ae0000        	ldw	x,#_tyRecord
 213  0042 89            	pushw	x
 214  0043 4f            	clr	a
 215  0044 cd0000        	call	_ReadRecord
 217  0047 5b03          	addw	sp,#3
 218  0049 6b05          	ld	(OFST-7,sp),a
 219                     ; 445 		dwOffset = ClaGatherMeterTime(tyRecord.Time);
 221  004b ae0004        	ldw	x,#_tyRecord+4
 222  004e bf00          	ldw	c_x,x
 223  0050 ae0006        	ldw	x,#6
 224  0053               L42:
 225  0053 5a            	decw	x
 226  0054 92d600        	ld	a,([c_x.w],x)
 227  0057 88            	push	a
 228  0058 5d            	tnzw	x
 229  0059 26f8          	jrne	L42
 230  005b cd0202        	call	_ClaGatherMeterTime
 232  005e 5b06          	addw	sp,#6
 233  0060 96            	ldw	x,sp
 234  0061 1c0009        	addw	x,#OFST-3
 235  0064 cd0000        	call	c_rtol
 237                     ; 447 		if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&(TRUE == nReadFlg))
 239  0067 7b08          	ld	a,(OFST-4,sp)
 240  0069 a501          	bcp	a,#1
 241  006b 2642          	jrne	L35
 243  006d 7b05          	ld	a,(OFST-7,sp)
 244  006f 4a            	dec	a
 245  0070 263d          	jrne	L35
 246                     ; 449 			wGatherInterval = tyReport.wGatherCycle;
 248  0072 c60000        	ld	a,_tyReport
 249  0075 5f            	clrw	x
 250  0076 97            	ld	xl,a
 251  0077 1f06          	ldw	(OFST-6,sp),x
 252                     ; 452 			if((0x15 >= stTimeNow.wYear)||((0xFF != tyRecord.Time.Byte.Day) && (0 < dwOffset)
 252                     ; 453 				&& (wGatherInterval-1 > (u32)((dwOffset)/60)))) //(FALSE != tyRecord.nRepFlg)
 254  0079 c60000        	ld	a,_stTimeNow
 255  007c a116          	cp	a,#22
 256  007e 2528          	jrult	L75
 258  0080 c60007        	ld	a,_tyRecord+7
 259  0083 4c            	inc	a
 260  0084 2729          	jreq	L35
 262  0086 96            	ldw	x,sp
 263  0087 1c0009        	addw	x,#OFST-3
 264  008a cd0000        	call	c_lzmp
 266  008d 2d20          	jrsle	L35
 268  008f 96            	ldw	x,sp
 269  0090 cd01f8        	call	LC004
 270  0093 cd0000        	call	c_ludv
 272  0096 96            	ldw	x,sp
 273  0097 5c            	incw	x
 274  0098 cd0000        	call	c_rtol
 276  009b 1e06          	ldw	x,(OFST-6,sp)
 277  009d 5a            	decw	x
 278  009e cd0000        	call	c_uitolx
 280  00a1 96            	ldw	x,sp
 281  00a2 5c            	incw	x
 282  00a3 cd0000        	call	c_lcmp
 284  00a6 2307          	jrule	L35
 285  00a8               L75:
 286                     ; 456 				LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 290  00a8 4f            	clr	a
 291  00a9 cd0000        	call	_LP_SetLowPwrStartFlg
 293                     ; 457 				return ;
 294  00ac               L011:
 297  00ac 5b0c          	addw	sp,#12
 298  00ae 81            	ret	
 299  00af               L35:
 300                     ; 460 		dwOffset = ClaGatherMeterTime(tyReport.Time);		
 302  00af ae0004        	ldw	x,#_tyReport+4
 303  00b2 bf00          	ldw	c_x,x
 304  00b4 ae0006        	ldw	x,#6
 305  00b7               L43:
 306  00b7 5a            	decw	x
 307  00b8 92d600        	ld	a,([c_x.w],x)
 308  00bb 88            	push	a
 309  00bc 5d            	tnzw	x
 310  00bd 26f8          	jrne	L43
 311  00bf cd0202        	call	_ClaGatherMeterTime
 313  00c2 5b06          	addw	sp,#6
 314  00c4 96            	ldw	x,sp
 315  00c5 1c0009        	addw	x,#OFST-3
 316  00c8 cd0000        	call	c_rtol
 318                     ; 463 		if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&((0 > dwOffset)||(1 < (u32)((dwOffset/60)%(u32)wGatherInterval))))
 320  00cb 7b08          	ld	a,(OFST-4,sp)
 321  00cd a501          	bcp	a,#1
 322  00cf 2622          	jrne	L16
 324  00d1 7b09          	ld	a,(OFST-3,sp)
 325  00d3 2bd3          	jrmi	L75
 327  00d5 1e06          	ldw	x,(OFST-6,sp)
 328  00d7 cd0000        	call	c_uitolx
 330  00da 96            	ldw	x,sp
 331  00db 5c            	incw	x
 332  00dc cd0000        	call	c_rtol
 334  00df 96            	ldw	x,sp
 335  00e0 cd01f8        	call	LC004
 336  00e3 cd0000        	call	c_ldiv
 338  00e6 96            	ldw	x,sp
 339  00e7 5c            	incw	x
 340  00e8 cd0000        	call	c_lumd
 342  00eb ae0008        	ldw	x,#L63
 343  00ee cd0000        	call	c_lcmp
 345                     ; 466 			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 347                     ; 467 			return ;
 349  00f1 24b5          	jruge	L75
 350  00f3               L16:
 351                     ; 471 		if(FALSE == nReadFlg)
 353  00f3 7b05          	ld	a,(OFST-7,sp)
 354  00f5 2603          	jrne	L56
 355                     ; 473 			ReWriteRepFlg();
 357  00f7 cd0000        	call	_ReWriteRepFlg
 359  00fa               L56:
 360                     ; 479 		if(TRUE == (g_nGatherMeterFlg = GatherMeterFun()))
 362  00fa cd0000        	call	_GatherMeterFun
 364  00fd c70004        	ld	_g_nGatherMeterFlg,a
 365  0100 4a            	dec	a
 366  0101 266c          	jrne	L76
 367                     ; 482 			SetPortMeterPowerOff();
 369  0103 4b00          	push	#0
 370  0105 4b08          	push	#8
 371  0107 ae5000        	ldw	x,#20480
 372  010a cd0000        	call	_GPIO_WriteBit
 374  010d 725f0002      	clr	_g_nGmFlg
 375  0111 5500000009    	mov	_tyRecord+9,_stTimeNow
 376  0116 5500010008    	mov	_tyRecord+8,_stTimeNow+1
 377  011b 5500020007    	mov	_tyRecord+7,_stTimeNow+2
 378  0120 5500030006    	mov	_tyRecord+6,_stTimeNow+3
 379  0125 85            	popw	x
 380                     ; 484 			g_nGmFlg = FALSE;
 382                     ; 487 			tyRecord.Time.Byte.Year = stTimeNow.wYear;
 384                     ; 488 			tyRecord.Time.Byte.Month = stTimeNow.nMonth;
 386                     ; 489 			tyRecord.Time.Byte.Day = stTimeNow.nDay;
 388                     ; 490 			tyRecord.Time.Byte.Hour = stTimeNow.nHour;
 390                     ; 491 			if(60 <= wGatherInterval)
 392  0126 1e06          	ldw	x,(OFST-6,sp)
 393  0128 a3003c        	cpw	x,#60
 394  012b 2506          	jrult	L17
 395                     ; 493 				tyRecord.Time.Byte.Minute = 0;
 397  012d 725f0005      	clr	_tyRecord+5
 399  0131 2005          	jra	L37
 400  0133               L17:
 401                     ; 497 				tyRecord.Time.Byte.Minute = stTimeNow.nMinute;
 403  0133 5500040005    	mov	_tyRecord+5,_stTimeNow+4
 404  0138               L37:
 405                     ; 500 			tyRecord.Time.Byte.Second = 0;               /* 存储只精确到分钟 */
 407  0138 725f0004      	clr	_tyRecord+4
 408                     ; 501 			tyRecord.Value = tyParameter.Value;
 410  013c ce000a        	ldw	x,_tyParameter+10
 411  013f cf0002        	ldw	_tyRecord+2,x
 412  0142 ce0008        	ldw	x,_tyParameter+8
 413  0145 cf0000        	ldw	_tyRecord,x
 414                     ; 516 			tyParameter.Status = 0x00;
 416  0148 725f000c      	clr	_tyParameter+12
 417                     ; 518 			tyRecord.nStatus = tyParameter.Status;
 419  014c 725f000a      	clr	_tyRecord+10
 420                     ; 519 			tyRecord.nRepFlg = TRUE;
 422  0150 3501000b      	mov	_tyRecord+11,#1
 423                     ; 521 			if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
 425  0154 7b08          	ld	a,(OFST-4,sp)
 426  0156 a501          	bcp	a,#1
 427  0158 2606          	jrne	L57
 428                     ; 523 				AddRecord((u8*)&tyRecord, sizeof(tyRecord));
 430  015a cd01eb        	call	LC003
 431                     ; 524 				UC_SleepFunc(60);
 433  015d cd01e2        	call	LC002
 434  0160               L57:
 435                     ; 528 			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 437  0160 4f            	clr	a
 438  0161 cd0000        	call	_LP_SetLowPwrStartFlg
 440                     ; 530 			JASON_130PurchasePro();
 442  0164 cd0000        	call	_JASON_130PurchasePro
 444                     ; 533 			ALM_ClrAlmStatus(METER_ERROR);
 446  0167 a604          	ld	a,#4
 447  0169 cd0000        	call	_ALM_ClrAlmStatus
 450  016c cc00ac        	jra	L011
 451  016f               L76:
 452                     ; 537 			nTimeOut++;
 454  016f 725c000a      	inc	L12_nTimeOut
 455                     ; 538 			UC_SleepFunc(1000);
 457  0173 ae03e8        	ldw	x,#1000
 458  0176 ad6a          	call	LC002
 459                     ; 539 			if(3 < nTimeOut)
 461  0178 c6000a        	ld	a,L12_nTimeOut
 462  017b a104          	cp	a,#4
 463  017d 25ed          	jrult	L011
 464                     ; 541 				g_nGmFlg = FALSE;					
 466  017f 725f0002      	clr	_g_nGmFlg
 467                     ; 542 				LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 469  0183 4f            	clr	a
 470  0184 cd0000        	call	_LP_SetLowPwrStartFlg
 472                     ; 543 				MemsetFunc((u8*)&tyRecord, 0xFF, sizeof(tyRecord));
 474  0187 4b0c          	push	#12
 475  0189 4bff          	push	#255
 476  018b ae0000        	ldw	x,#_tyRecord
 477  018e cd0000        	call	_MemsetFunc
 479  0191 85            	popw	x
 480                     ; 544 				tyRecord.Value = INVALID_DATA;
 482  0192 aeeeee        	ldw	x,#61166
 483  0195 cf0002        	ldw	_tyRecord+2,x
 484  0198 cf0000        	ldw	_tyRecord,x
 485                     ; 545 				tyRecord.nRepFlg = TRUE;
 487  019b 3501000b      	mov	_tyRecord+11,#1
 488                     ; 547 				if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
 490  019f 7b08          	ld	a,(OFST-4,sp)
 491  01a1 a501          	bcp	a,#1
 492  01a3 2604          	jrne	L301
 493                     ; 549 					AddRecord((u8*)&tyRecord, sizeof(tyRecord));
 495  01a5 ad44          	call	LC003
 496                     ; 550 					UC_SleepFunc(60);
 498  01a7 ad39          	call	LC002
 499  01a9               L301:
 500                     ; 554 				ALM_SetAlmStatus(METER_ERROR);
 502  01a9 a604          	ld	a,#4
 503  01ab cd0000        	call	_ALM_SetAlmStatus
 505                     ; 557 				stRepFail.wError |= (1<<GM_GATHERMETER_FAIL);
 507  01ae 721a0007      	bset	_stRepFail+7,#5
 508                     ; 558 				STM8_RTC_Get(&stTimeNow);
 510  01b2 ae0000        	ldw	x,#_stTimeNow
 511  01b5 cd0000        	call	_STM8_RTC_Get
 513                     ; 559 				MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stTimeNow, sizeof(stRepFail.stTime));
 515  01b8 4b06          	push	#6
 516  01ba ae0000        	ldw	x,#_stTimeNow
 517  01bd 89            	pushw	x
 518  01be ae0000        	ldw	x,#_stRepFail
 519  01c1 cd0000        	call	_MemcpyFunc
 521  01c4 5b03          	addw	sp,#3
 522                     ; 560 				stRepFail.nSigal = 0xFF;			//信号大小,固定值
 524  01c6 35ff0008      	mov	_stRepFail+8,#255
 525                     ; 561 				AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
 527  01ca 4b09          	push	#9
 528  01cc ae0000        	ldw	x,#_stRepFail
 529  01cf cd0000        	call	_AddAlmRecord
 531  01d2 ae003c        	ldw	x,#60
 532  01d5 84            	pop	a
 533                     ; 562 				UC_SleepFunc(60);
 535  01d6 ad0a          	call	LC002
 537  01d8 cc00ac        	jra	L011
 538                     ; 566 				return ;
 540  01db               L15:
 541                     ; 599 		g_nGmFlg = FALSE; //补报则不再抄表
 543  01db 725f0002      	clr	_g_nGmFlg
 544                     ; 600 		LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 546                     ; 602 	return ;
 548  01df cc00a8        	jp	L75
 550  01e2               LC002:
 551  01e2 89            	pushw	x
 552  01e3 5f            	clrw	x
 553  01e4 89            	pushw	x
 554  01e5 cd0000        	call	_UC_SleepFunc
 556  01e8 5b04          	addw	sp,#4
 557  01ea 81            	ret	
 558  01eb               LC003:
 559  01eb 4b0c          	push	#12
 560  01ed ae0000        	ldw	x,#_tyRecord
 561  01f0 cd0000        	call	_AddRecord
 563  01f3 ae003c        	ldw	x,#60
 564  01f6 84            	pop	a
 565  01f7 81            	ret	
 566  01f8               LC004:
 567  01f8 1c0009        	addw	x,#OFST-3
 568  01fb cd0000        	call	c_ltor
 570  01fe ae0004        	ldw	x,#L62
 571  0201 81            	ret	
 864                     ; 614 int32_t ClaGatherMeterTime(TypeTime stTime)
 864                     ; 615 {
 865                     	switch	.text
 866  0202               _ClaGatherMeterTime:
 868  0202 521b          	subw	sp,#27
 869       0000001b      OFST:	set	27
 872                     ; 618 	int32_t dwOffset = 0;
 874  0204 5f            	clrw	x
 875  0205 1f1a          	ldw	(OFST-1,sp),x
 876  0207 1f18          	ldw	(OFST-3,sp),x
 877                     ; 620 	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&stTime);
 879  0209 96            	ldw	x,sp
 880  020a 1c001e        	addw	x,#OFST+3
 881  020d 89            	pushw	x
 882  020e ae0006        	ldw	x,#6
 883  0211 cd0000        	call	_JX_BL_Change
 885  0214 85            	popw	x
 886                     ; 621 	MemcpyFunc((u8*)&stLastTime, (u8*)&stTime, sizeof(TypeTime));
 888  0215 4b06          	push	#6
 889  0217 96            	ldw	x,sp
 890  0218 1c001f        	addw	x,#OFST+4
 891  021b 89            	pushw	x
 892  021c 1d001d        	subw	x,#29
 893  021f cd0000        	call	_MemcpyFunc
 895  0222 5b03          	addw	sp,#3
 896                     ; 622 	STM8_RTC_Get(&stTimeNow);
 898  0224 ae0000        	ldw	x,#_stTimeNow
 899  0227 cd0000        	call	_STM8_RTC_Get
 901                     ; 623 	TM_TimeChangeAToB(&stTimeNow, &stEnd);
 903  022a 96            	ldw	x,sp
 904  022b 1c0010        	addw	x,#OFST-11
 905  022e 89            	pushw	x
 906  022f ae0000        	ldw	x,#_stTimeNow
 907  0232 cd0000        	call	_TM_TimeChangeAToB
 909  0235 85            	popw	x
 910                     ; 624 	TM_TimeChangeAToB(&stLastTime, &stStar);
 912  0236 96            	ldw	x,sp
 913  0237 1c0008        	addw	x,#OFST-19
 914  023a 89            	pushw	x
 915  023b 1d0007        	subw	x,#7
 916  023e cd0000        	call	_TM_TimeChangeAToB
 918  0241 85            	popw	x
 919                     ; 625 	dwOffset = TM_DiffSecond(&stStar, &stEnd);	
 921  0242 96            	ldw	x,sp
 922  0243 1c0010        	addw	x,#OFST-11
 923  0246 89            	pushw	x
 924  0247 1d0008        	subw	x,#8
 925  024a cd0000        	call	_TM_DiffSecond
 927  024d 85            	popw	x
 928  024e 96            	ldw	x,sp
 929  024f 1c0018        	addw	x,#OFST-3
 930  0252 cd0000        	call	c_rtol
 932                     ; 627 	return dwOffset;
 934  0255 96            	ldw	x,sp
 935  0256 1c0018        	addw	x,#OFST-3
 936  0259 cd0000        	call	c_ltor
 940  025c 5b1b          	addw	sp,#27
 941  025e 81            	ret	
 964                     ; 638 void fixTaskVavle(void)
 964                     ; 639 {
 965                     	switch	.text
 966  025f               _fixTaskVavle:
 970                     ; 750 	return ;
 973  025f 81            	ret	
1104                     	switch	.const
1105  000c               L641:
1106  000c eeeeeeee      	dc.l	-286331154
1107                     ; 761 void MonFreezeDatProc(void)
1107                     ; 762 {
1108                     	switch	.text
1109  0260               _MonFreezeDatProc:
1111  0260 520e          	subw	sp,#14
1112       0000000e      OFST:	set	14
1115                     ; 763 	u8 i = 0, nMonFreeDay = 0;
1119                     ; 767 	STM8_RTC_Get(&stTimeNow);
1121  0262 ae0000        	ldw	x,#_stTimeNow
1122  0265 cd0000        	call	_STM8_RTC_Get
1124                     ; 768 	nMonFreeDay = JX_BcdToByte(stTimeNow.nDay);
1126  0268 c60002        	ld	a,_stTimeNow+2
1127  026b cd0000        	call	_JX_BcdToByte
1129  026e 6b01          	ld	(OFST-13,sp),a
1130                     ; 769 	if(nMonFreeDay < tyReport.nMonFreezeDay)
1132  0270 c10003        	cp	a,_tyReport+3
1133  0273 251e          	jrult	L261
1134                     ; 771 		return ;
1136                     ; 775 	if(TRUE == ReadMonFreezeRecord(0, (u8*)&stMonFreeze, sizeof(stMonFreeze)))
1138  0275 4b06          	push	#6
1139  0277 96            	ldw	x,sp
1140  0278 1c0003        	addw	x,#OFST-11
1141  027b 89            	pushw	x
1142  027c 4f            	clr	a
1143  027d cd0000        	call	_ReadMonFreezeRecord
1145  0280 5b03          	addw	sp,#3
1146  0282 4a            	dec	a
1147  0283 2611          	jrne	L743
1148                     ; 777 		if((stMonFreeze.nYear == stTimeNow.wYear) && (stMonFreeze.nMon == stTimeNow.nMonth))
1150  0285 7b06          	ld	a,(OFST-8,sp)
1151  0287 c10000        	cp	a,_stTimeNow
1152  028a 260a          	jrne	L743
1154  028c 7b07          	ld	a,(OFST-7,sp)
1155  028e c10001        	cp	a,_stTimeNow+1
1156  0291 2603          	jrne	L743
1157                     ; 779 			return ;
1158  0293               L261:
1161  0293 5b0e          	addw	sp,#14
1162  0295 81            	ret	
1163  0296               L743:
1164                     ; 783 	MemsetFunc((u8*)&stMonFreeze, 0x00, sizeof(stMonFreeze));
1166  0296 4b06          	push	#6
1167  0298 4b00          	push	#0
1168  029a 96            	ldw	x,sp
1169  029b 1c0004        	addw	x,#OFST-10
1170  029e cd0000        	call	_MemsetFunc
1172  02a1 85            	popw	x
1173                     ; 785 	for(i = 0; i < NUMBER_RECORD_DAY; i++)
1175  02a2 0f01          	clr	(OFST-13,sp)
1176  02a4               L353:
1177                     ; 787 		if(TRUE == ReadDayFreezeRecord(i, (u8*)&stDayRec, sizeof(stDayRec)))
1179  02a4 4b07          	push	#7
1180  02a6 96            	ldw	x,sp
1181  02a7 1c0009        	addw	x,#OFST-5
1182  02aa 89            	pushw	x
1183  02ab 7b04          	ld	a,(OFST-10,sp)
1184  02ad cd0000        	call	_ReadDayFreezeRecord
1186  02b0 5b03          	addw	sp,#3
1187  02b2 4a            	dec	a
1188  02b3 2640          	jrne	L762
1189                     ; 789 			if(stDayRec.Value == INVALID_DATA)
1191  02b5 96            	ldw	x,sp
1192  02b6 1c0008        	addw	x,#OFST-6
1193  02b9 cd0000        	call	c_ltor
1195  02bc ae000c        	ldw	x,#L641
1196  02bf cd0000        	call	c_lcmp
1198  02c2 2729          	jreq	L553
1199                     ; 791 				continue;
1201                     ; 794 			if((stDayRec.nYear == stTimeNow.wYear) && 	(stDayRec.nMon == stTimeNow.nMonth))
1203  02c4 7b0c          	ld	a,(OFST-2,sp)
1204  02c6 c10000        	cp	a,_stTimeNow
1205  02c9 2617          	jrne	L763
1207  02cb 7b0d          	ld	a,(OFST-1,sp)
1208  02cd c10001        	cp	a,_stTimeNow+1
1209  02d0 2610          	jrne	L763
1210                     ; 796 				stMonFreeze.nYear = stDayRec.nYear;
1212  02d2 7b0c          	ld	a,(OFST-2,sp)
1213  02d4 6b06          	ld	(OFST-8,sp),a
1214                     ; 797 				stMonFreeze.nMon = stDayRec.nMon;
1216  02d6 7b0d          	ld	a,(OFST-1,sp)
1217  02d8 6b07          	ld	(OFST-7,sp),a
1218                     ; 798 				stMonFreeze.Value = stDayRec.Value;
1220  02da 1e0a          	ldw	x,(OFST-4,sp)
1221  02dc 1f04          	ldw	(OFST-10,sp),x
1222  02de 1e08          	ldw	x,(OFST-6,sp)
1223                     ; 799 				AddMonFreezeRecord((u8*)&stMonFreeze, RECORD_LEN_MON);
1225                     ; 800 				UC_SleepFunc(60);
1227                     ; 801 				return ;
1229  02e0 2022          	jp	LC005
1230  02e2               L763:
1231                     ; 808 		UC_SleepFunc(2);
1233  02e2 ae0002        	ldw	x,#2
1234  02e5 89            	pushw	x
1235  02e6 5f            	clrw	x
1236  02e7 89            	pushw	x
1237  02e8 cd0000        	call	_UC_SleepFunc
1239  02eb 5b04          	addw	sp,#4
1240  02ed               L553:
1241                     ; 785 	for(i = 0; i < NUMBER_RECORD_DAY; i++)
1243  02ed 0c01          	inc	(OFST-13,sp)
1246  02ef 7b01          	ld	a,(OFST-13,sp)
1247  02f1 a11f          	cp	a,#31
1248  02f3 25af          	jrult	L353
1249  02f5               L762:
1250                     ; 811 END_InvalidDatPro:
1250                     ; 812 	stMonFreeze.nYear = stTimeNow.wYear;
1252  02f5 c60000        	ld	a,_stTimeNow
1253  02f8 6b06          	ld	(OFST-8,sp),a
1254                     ; 813 	stMonFreeze.nMon = stTimeNow.nMonth;
1256  02fa c60001        	ld	a,_stTimeNow+1
1257  02fd 6b07          	ld	(OFST-7,sp),a
1258                     ; 814 	stMonFreeze.Value = INVALID_DATA;
1260  02ff aeeeee        	ldw	x,#61166
1261  0302 1f04          	ldw	(OFST-10,sp),x
1262                     ; 815 	AddMonFreezeRecord((u8*)&stMonFreeze, RECORD_LEN_MON);
1265                     ; 816 	UC_SleepFunc(60);
1268  0304               LC005:
1269  0304 1f02          	ldw	(OFST-12,sp),x
1271  0306 4b06          	push	#6
1272  0308 96            	ldw	x,sp
1273  0309 1c0003        	addw	x,#OFST-11
1274  030c cd0000        	call	_AddMonFreezeRecord
1275  030f ae003c        	ldw	x,#60
1276  0312 84            	pop	a
1278  0313 89            	pushw	x
1279  0314 5f            	clrw	x
1280  0315 89            	pushw	x
1281  0316 cd0000        	call	_UC_SleepFunc
1282  0319 5b04          	addw	sp,#4
1283                     ; 817 	return ;
1285  031b cc0293        	jra	L261
1405                     ; 827 void DayFreezeDatProc(void)
1405                     ; 828 {
1406                     	switch	.text
1407  031e               _DayFreezeDatProc:
1409  031e 5223          	subw	sp,#35
1410       00000023      OFST:	set	35
1413                     ; 831 	u8 i = 0;
1415  0320 0f09          	clr	(OFST-26,sp)
1416                     ; 835 	MemsetFunc((u8*)&stDayFreeze, 0x00, sizeof(stDayFreeze));	
1418  0322 4b07          	push	#7
1419  0324 4b00          	push	#0
1420  0326 96            	ldw	x,sp
1421  0327 1c0013        	addw	x,#OFST-16
1422  032a cd0000        	call	_MemsetFunc
1424  032d 85            	popw	x
1425                     ; 836 	STM8_RTC_Get(&stTimeNow);
1427  032e ae0000        	ldw	x,#_stTimeNow
1428  0331 cd0000        	call	_STM8_RTC_Get
1430                     ; 837 	TM_TimeChangeAToB(&stTimeNow, &stTmpTime);
1432  0334 96            	ldw	x,sp
1433  0335 5c            	incw	x
1434  0336 89            	pushw	x
1435  0337 ae0000        	ldw	x,#_stTimeNow
1436  033a cd0000        	call	_TM_TimeChangeAToB
1438  033d 85            	popw	x
1439                     ; 838 	TM_RTimeDecnMinute(&stTmpTime, 1440);
1441  033e ae05a0        	ldw	x,#1440
1442  0341 89            	pushw	x
1443  0342 5f            	clrw	x
1444  0343 89            	pushw	x
1445  0344 96            	ldw	x,sp
1446  0345 1c0005        	addw	x,#OFST-30
1447  0348 cd0000        	call	_TM_RTimeDecnMinute
1449  034b 5b04          	addw	sp,#4
1450                     ; 839 	TM_TimeChangeBToA(&stTmpTime, &stYesterDay);
1452  034d 96            	ldw	x,sp
1453  034e 1c000a        	addw	x,#OFST-25
1454  0351 89            	pushw	x
1455  0352 1d0009        	subw	x,#9
1456  0355 cd0000        	call	_TM_TimeChangeBToA
1458  0358 85            	popw	x
1459                     ; 842 	if(TRUE == ReadDayFreezeRecord(0, (u8*)&stDayFreeze, sizeof(TypeRecordDay)))
1461  0359 4b07          	push	#7
1462  035b 96            	ldw	x,sp
1463  035c 1c0012        	addw	x,#OFST-17
1464  035f 89            	pushw	x
1465  0360 4f            	clr	a
1466  0361 cd0000        	call	_ReadDayFreezeRecord
1468  0364 5b03          	addw	sp,#3
1469  0366 4a            	dec	a
1470  0367 2612          	jrne	L544
1471                     ; 844 		if((stDayFreeze.nYear == stYesterDay.wYear) && 
1471                     ; 845 			(stDayFreeze.nMon == stYesterDay.nMonth) && (stDayFreeze.nDay == stYesterDay.nDay))
1473  0369 7b15          	ld	a,(OFST-14,sp)
1474  036b 110a          	cp	a,(OFST-25,sp)
1475  036d 260c          	jrne	L544
1477  036f 7b16          	ld	a,(OFST-13,sp)
1478  0371 110b          	cp	a,(OFST-24,sp)
1479  0373 2606          	jrne	L544
1481  0375 7b17          	ld	a,(OFST-12,sp)
1482  0377 110c          	cp	a,(OFST-23,sp)
1483  0379 275d          	jreq	L612
1484                     ; 847 			return ;
1486  037b               L544:
1487                     ; 851 	for(i = 0; i < NUMBER_RECORD; i++)
1489  037b 0f09          	clr	(OFST-26,sp)
1490  037d               L154:
1491                     ; 853 		if(TRUE == ReadRecord(i, (u8*)&stNowRec, sizeof(stNowRec)))
1493  037d 4b0c          	push	#12
1494  037f 96            	ldw	x,sp
1495  0380 1c0019        	addw	x,#OFST-10
1496  0383 89            	pushw	x
1497  0384 7b0c          	ld	a,(OFST-23,sp)
1498  0386 cd0000        	call	_ReadRecord
1500  0389 5b03          	addw	sp,#3
1501  038b 4a            	dec	a
1502  038c 2660          	jrne	L173
1503                     ; 855 			if(stNowRec.Value == INVALID_DATA)
1505  038e 96            	ldw	x,sp
1506  038f 1c0018        	addw	x,#OFST-11
1507  0392 cd0000        	call	c_ltor
1509  0395 ae000c        	ldw	x,#L641
1510  0398 cd0000        	call	c_lcmp
1512  039b 2749          	jreq	L354
1513                     ; 857 				continue;
1515                     ; 860 			if((stNowRec.Time.Byte.Year == stYesterDay.wYear) && 
1515                     ; 861 				(stNowRec.Time.Byte.Month == stYesterDay.nMonth) && (stNowRec.Time.Byte.Day == stYesterDay.nDay))
1517  039d 7b21          	ld	a,(OFST-2,sp)
1518  039f 110a          	cp	a,(OFST-25,sp)
1519  03a1 2638          	jrne	L564
1521  03a3 7b20          	ld	a,(OFST-3,sp)
1522  03a5 110b          	cp	a,(OFST-24,sp)
1523  03a7 2632          	jrne	L564
1525  03a9 7b1f          	ld	a,(OFST-4,sp)
1526  03ab 110c          	cp	a,(OFST-23,sp)
1527  03ad 262c          	jrne	L564
1528                     ; 863 				stDayFreeze.nYear = stNowRec.Time.Byte.Year;
1530  03af 7b21          	ld	a,(OFST-2,sp)
1531  03b1 6b15          	ld	(OFST-14,sp),a
1532                     ; 864 				stDayFreeze.nMon = stNowRec.Time.Byte.Month;
1534  03b3 7b20          	ld	a,(OFST-3,sp)
1535  03b5 6b16          	ld	(OFST-13,sp),a
1536                     ; 865 				stDayFreeze.nDay = stNowRec.Time.Byte.Day;
1538  03b7 7b1f          	ld	a,(OFST-4,sp)
1539  03b9 6b17          	ld	(OFST-12,sp),a
1540                     ; 866 				stDayFreeze.Value = stNowRec.Value;
1542  03bb 1e1a          	ldw	x,(OFST-9,sp)
1543  03bd 1f13          	ldw	(OFST-16,sp),x
1544  03bf 1e18          	ldw	x,(OFST-11,sp)
1545                     ; 867 				AddDayFreezeRecord((u8*)&stDayFreeze, RECORD_LEN_DAY);
1548                     ; 868 				UC_SleepFunc(60);
1551  03c1               LC006:
1552  03c1 1f11          	ldw	(OFST-18,sp),x
1554  03c3 4b07          	push	#7
1555  03c5 96            	ldw	x,sp
1556  03c6 1c0012        	addw	x,#OFST-17
1557  03c9 cd0000        	call	_AddDayFreezeRecord
1558  03cc ae003c        	ldw	x,#60
1559  03cf 84            	pop	a
1561  03d0 89            	pushw	x
1562  03d1 5f            	clrw	x
1563  03d2 89            	pushw	x
1564  03d3 cd0000        	call	_UC_SleepFunc
1565  03d6 5b04          	addw	sp,#4
1566                     ; 869 				return ;
1567  03d8               L612:
1570  03d8 5b23          	addw	sp,#35
1571  03da 81            	ret	
1572  03db               L564:
1573                     ; 876 		UC_SleepFunc(2);
1575  03db ae0002        	ldw	x,#2
1576  03de 89            	pushw	x
1577  03df 5f            	clrw	x
1578  03e0 89            	pushw	x
1579  03e1 cd0000        	call	_UC_SleepFunc
1581  03e4 5b04          	addw	sp,#4
1582  03e6               L354:
1583                     ; 851 	for(i = 0; i < NUMBER_RECORD; i++)
1585  03e6 0c09          	inc	(OFST-26,sp)
1588  03e8 7b09          	ld	a,(OFST-26,sp)
1589  03ea a11c          	cp	a,#28
1590  03ec 258f          	jrult	L154
1591  03ee               L173:
1592                     ; 879 END_InvalidDatPro:
1592                     ; 880 	stDayFreeze.nYear = stYesterDay.wYear;
1594  03ee 7b0a          	ld	a,(OFST-25,sp)
1595  03f0 6b15          	ld	(OFST-14,sp),a
1596                     ; 881 	stDayFreeze.nMon = stYesterDay.nMonth;
1598  03f2 7b0b          	ld	a,(OFST-24,sp)
1599  03f4 6b16          	ld	(OFST-13,sp),a
1600                     ; 882 	stDayFreeze.nDay = stYesterDay.nDay;
1602  03f6 7b0c          	ld	a,(OFST-23,sp)
1603  03f8 6b17          	ld	(OFST-12,sp),a
1604                     ; 883 	stDayFreeze.Value = INVALID_DATA;
1606  03fa aeeeee        	ldw	x,#61166
1607  03fd 1f13          	ldw	(OFST-16,sp),x
1608                     ; 884 	AddDayFreezeRecord((u8*)&stDayFreeze, RECORD_LEN_DAY);
1610                     ; 885 	UC_SleepFunc(60);
1612                     ; 886 	return ;
1614  03ff 20c0          	jp	LC006
1639                     ; 897 u8 GM_GetGatherMeterFlg(void)
1639                     ; 898 {
1640                     	switch	.text
1641  0401               _GM_GetGatherMeterFlg:
1645                     ; 899 	return g_nGatherMeterFlg;
1647  0401 c60004        	ld	a,_g_nGatherMeterFlg
1650  0404 81            	ret	
1674                     ; 910 void fixTaskMeterTestCode(void)
1674                     ; 911 {
1675                     	switch	.text
1676  0405               _fixTaskMeterTestCode:
1680                     ; 1089 	return ;
1683  0405 81            	ret	
1707                     ; 1100 void fixTaskMeter(void)
1707                     ; 1101 {
1708                     	switch	.text
1709  0406               _fixTaskMeter:
1713                     ; 1110 	JASON_130TaskMeter();
1716                     ; 1125 	return ;
1719  0406 cc0001        	jp	_JASON_130TaskMeter
1745                     ; 1128 void InitializeMeter(void)
1745                     ; 1129 {
1746                     	switch	.text
1747  0409               _InitializeMeter:
1751                     ; 1130 	MemsetFunc((u8*)&tyTime, 0x00, sizeof(tyTime));
1753  0409 4b06          	push	#6
1754  040b 4b00          	push	#0
1755  040d ae0002        	ldw	x,#_tyTime
1756  0410 cd0000        	call	_MemsetFunc
1758  0413 85            	popw	x
1759                     ; 1131 	MemsetFunc((u8*)&tyRecord, 0xff, sizeof(tyRecord));
1761  0414 4b0c          	push	#12
1762  0416 4bff          	push	#255
1763  0418 ae0000        	ldw	x,#_tyRecord
1764  041b cd0000        	call	_MemsetFunc
1766  041e 85            	popw	x
1767                     ; 1132 }
1770  041f 81            	ret	
1851                     	xdef	_fixTaskMeterTestCode
1852                     	xdef	_DayFreezeDatProc
1853                     	xdef	_MonFreezeDatProc
1854                     	xdef	_JASON_130TaskMeter
1855                     	xdef	_g_nGatherMeterFlg
1856                     	xdef	_g_nErrFlg
1857                     	xdef	_g_nGmFlg
1858                     	xdef	_g_wGMInterval
1859                     	switch	.bss
1860  0000               _ucStepMeter:
1861  0000 00            	ds.b	1
1862                     	xdef	_ucStepMeter
1863  0001               _ucStatusMeter:
1864  0001 00            	ds.b	1
1865                     	xdef	_ucStatusMeter
1866                     	xref	_ALM_ClrAlmStatus
1867                     	xref	_ALM_SetAlmStatus
1868                     	xref	_LP_SetLowPwrStartFlg
1869                     	xref	_STM8_RTC_Get
1870                     	xref	_stRepFail
1871                     	xref	_tyParameter
1872                     	xref	_tyRecord
1873                     	xref	_ReadMonFreezeRecord
1874                     	xref	_AddMonFreezeRecord
1875                     	xref	_ReadDayFreezeRecord
1876                     	xref	_AddDayFreezeRecord
1877                     	xref	_AddAlmRecord
1878                     	xref	_ReadRecord
1879                     	xref	_AddRecord
1880                     	xref	_GetReportFailFlag
1881                     	xref	_ReWriteRepFlg
1882                     	xref	_UC_SleepFunc
1883                     	xref	_GetReportFlag
1884                     	xref	_stTimeNow
1885                     	xref	_tyReport
1886                     	xref	_g_dwSysTick
1887                     	xdef	_JASON_130PurchasePro
1888                     	xdef	_ClaGatherMeterTime
1889                     	xdef	_fixTaskVavle
1890                     	xdef	_GM_GetGatherMeterFlg
1891                     	xdef	_InitializeMeter
1892                     	xdef	_fixTaskMeter
1893                     	xdef	_g_dwNowMeterVal
1894                     	xdef	_g_nOptValveTask
1895  0002               _tyTime:
1896  0002 000000000000  	ds.b	6
1897                     	xdef	_tyTime
1898                     	xref	_JX_BcdToByte
1899                     	xref	_TM_RTimeDecnMinute
1900                     	xref	_TM_DiffSecond
1901                     	xref	_TM_TimeChangeBToA
1902                     	xref	_TM_TimeChangeAToB
1903                     	xref	_JX_BL_Change
1904                     	xref	_MemcpyFunc
1905                     	xref	_MemsetFunc
1906                     	xref	_GatherMeterFun
1907                     	xref	_GPIO_WriteBit
1908                     	xref.b	c_x
1928                     	xref	c_lumd
1929                     	xref	c_ldiv
1930                     	xref	c_ludv
1931                     	xref	c_uitolx
1932                     	xref	c_lzmp
1933                     	xref	c_rtol
1934                     	xref	c_lcmp
1935                     	xref	c_ltor
1936                     	end
