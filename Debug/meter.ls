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
 146                     .const:	section	.text
 147  0000               L21:
 148  0000 00001770      	dc.l	6000
 149  0004               L62:
 150  0004 0000003c      	dc.l	60
 151  0008               L63:
 152  0008 00000002      	dc.l	2
 153                     ; 426 void JASON_130TaskMeter(void)
 153                     ; 427 {
 154                     	switch	.text
 155  0001               _JASON_130TaskMeter:
 157  0001 520c          	subw	sp,#12
 158       0000000c      OFST:	set	12
 161                     ; 429 	int32_t dwOffset   = 0;
 163  0003 96            	ldw	x,sp
 164  0004 1c0009        	addw	x,#OFST-3
 165  0007 cd0000        	call	c_ltor
 167                     ; 430 	u8 nRepFlg = 0, nReadFlg = FALSE;
 171                     ; 431 	u16 wGatherInterval = 0; 
 173  000a 5f            	clrw	x
 174  000b 1f06          	ldw	(OFST-6,sp),x
 175                     ; 435 	if((GetReportFlag())&&g_dwSysTick<6000)
 177  000d cd0000        	call	_GetReportFlag
 179  0010 4d            	tnz	a
 180  0011 2711          	jreq	L74
 182  0013 ae0000        	ldw	x,#_g_dwSysTick
 183  0016 cd0000        	call	c_ltor
 185  0019 ae0000        	ldw	x,#L21
 186  001c cd0000        	call	c_lcmp
 188  001f 2403cc00ac    	jrult	L011
 189                     ; 437 		return ;
 191  0024               L74:
 192                     ; 440 	nRepFlg = GetReportFailFlag();
 194  0024 cd0000        	call	_GetReportFailFlag
 196  0027 6b08          	ld	(OFST-4,sp),a
 197                     ; 441 	if(TRUE == g_nGmFlg)
 199  0029 c60002        	ld	a,_g_nGmFlg
 200  002c 4a            	dec	a
 201  002d 2703cc01f7    	jrne	L15
 202                     ; 443 		MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));
 204  0032 4b0c          	push	#12
 205  0034 4b00          	push	#0
 206  0036 ae0000        	ldw	x,#_tyRecord
 207  0039 cd0000        	call	_MemsetFunc
 209  003c 85            	popw	x
 210                     ; 444 		nReadFlg = ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord));
 212  003d 4b0c          	push	#12
 213  003f ae0000        	ldw	x,#_tyRecord
 214  0042 89            	pushw	x
 215  0043 4f            	clr	a
 216  0044 cd0000        	call	_ReadRecord
 218  0047 5b03          	addw	sp,#3
 219  0049 6b05          	ld	(OFST-7,sp),a
 220                     ; 445 		dwOffset = ClaGatherMeterTime(tyRecord.Time);
 222  004b ae0004        	ldw	x,#_tyRecord+4
 223  004e bf00          	ldw	c_x,x
 224  0050 ae0006        	ldw	x,#6
 225  0053               L42:
 226  0053 5a            	decw	x
 227  0054 92d600        	ld	a,([c_x.w],x)
 228  0057 88            	push	a
 229  0058 5d            	tnzw	x
 230  0059 26f8          	jrne	L42
 231  005b cd021e        	call	_ClaGatherMeterTime
 233  005e 5b06          	addw	sp,#6
 234  0060 96            	ldw	x,sp
 235  0061 1c0009        	addw	x,#OFST-3
 236  0064 cd0000        	call	c_rtol
 238                     ; 447 		if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&(TRUE == nReadFlg))
 240  0067 7b08          	ld	a,(OFST-4,sp)
 241  0069 a501          	bcp	a,#1
 242  006b 2642          	jrne	L35
 244  006d 7b05          	ld	a,(OFST-7,sp)
 245  006f 4a            	dec	a
 246  0070 263d          	jrne	L35
 247                     ; 449 			wGatherInterval = tyReport.wGatherCycle;
 249  0072 c60000        	ld	a,_tyReport
 250  0075 5f            	clrw	x
 251  0076 97            	ld	xl,a
 252  0077 1f06          	ldw	(OFST-6,sp),x
 253                     ; 452 			if((0x15 >= stTimeNow.wYear)||((0xFF != tyRecord.Time.Byte.Day) && (0 < dwOffset)
 253                     ; 453 				&& (wGatherInterval-1 > (u32)((dwOffset)/60)))) //(FALSE != tyRecord.nRepFlg)
 255  0079 c60000        	ld	a,_stTimeNow
 256  007c a116          	cp	a,#22
 257  007e 2528          	jrult	L75
 259  0080 c60007        	ld	a,_tyRecord+7
 260  0083 4c            	inc	a
 261  0084 2729          	jreq	L35
 263  0086 96            	ldw	x,sp
 264  0087 1c0009        	addw	x,#OFST-3
 265  008a cd0000        	call	c_lzmp
 267  008d 2d20          	jrsle	L35
 269  008f 96            	ldw	x,sp
 270  0090 cd0214        	call	LC004
 271  0093 cd0000        	call	c_ludv
 273  0096 96            	ldw	x,sp
 274  0097 5c            	incw	x
 275  0098 cd0000        	call	c_rtol
 277  009b 1e06          	ldw	x,(OFST-6,sp)
 278  009d 5a            	decw	x
 279  009e cd0000        	call	c_uitolx
 281  00a1 96            	ldw	x,sp
 282  00a2 5c            	incw	x
 283  00a3 cd0000        	call	c_lcmp
 285  00a6 2307          	jrule	L35
 286  00a8               L75:
 287                     ; 456 				LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 291  00a8 4f            	clr	a
 292  00a9 cd0000        	call	_LP_SetLowPwrStartFlg
 294                     ; 457 				return ;
 295  00ac               L011:
 298  00ac 5b0c          	addw	sp,#12
 299  00ae 81            	ret	
 300  00af               L35:
 301                     ; 460 		dwOffset = ClaGatherMeterTime(tyReport.Time);		
 303  00af ae0004        	ldw	x,#_tyReport+4
 304  00b2 bf00          	ldw	c_x,x
 305  00b4 ae0006        	ldw	x,#6
 306  00b7               L43:
 307  00b7 5a            	decw	x
 308  00b8 92d600        	ld	a,([c_x.w],x)
 309  00bb 88            	push	a
 310  00bc 5d            	tnzw	x
 311  00bd 26f8          	jrne	L43
 312  00bf cd021e        	call	_ClaGatherMeterTime
 314  00c2 5b06          	addw	sp,#6
 315  00c4 96            	ldw	x,sp
 316  00c5 1c0009        	addw	x,#OFST-3
 317  00c8 cd0000        	call	c_rtol
 319                     ; 463 		if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&((0 > dwOffset)||(1 < (u32)((dwOffset/60)%(u32)wGatherInterval))))
 321  00cb 7b08          	ld	a,(OFST-4,sp)
 322  00cd a501          	bcp	a,#1
 323  00cf 2622          	jrne	L16
 325  00d1 7b09          	ld	a,(OFST-3,sp)
 326  00d3 2bd3          	jrmi	L75
 328  00d5 1e06          	ldw	x,(OFST-6,sp)
 329  00d7 cd0000        	call	c_uitolx
 331  00da 96            	ldw	x,sp
 332  00db 5c            	incw	x
 333  00dc cd0000        	call	c_rtol
 335  00df 96            	ldw	x,sp
 336  00e0 cd0214        	call	LC004
 337  00e3 cd0000        	call	c_ldiv
 339  00e6 96            	ldw	x,sp
 340  00e7 5c            	incw	x
 341  00e8 cd0000        	call	c_lumd
 343  00eb ae0008        	ldw	x,#L63
 344  00ee cd0000        	call	c_lcmp
 346                     ; 466 			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 348                     ; 467 			return ;
 350  00f1 24b5          	jruge	L75
 351  00f3               L16:
 352                     ; 471 		if(FALSE == nReadFlg)
 354  00f3 7b05          	ld	a,(OFST-7,sp)
 355  00f5 2603          	jrne	L56
 356                     ; 473 			ReWriteRepFlg();
 358  00f7 cd0000        	call	_ReWriteRepFlg
 360  00fa               L56:
 361                     ; 479 		if(TRUE == (g_nGatherMeterFlg = GatherMeterFun()))
 363  00fa cd0000        	call	_GatherMeterFun
 365  00fd c70004        	ld	_g_nGatherMeterFlg,a
 366  0100 4a            	dec	a
 367  0101 2703cc018b    	jrne	L76
 368                     ; 482 			SetPortMeterPowerOff();
 370  0106 4b00          	push	#0
 371  0108 4b08          	push	#8
 372  010a ae5000        	ldw	x,#20480
 373  010d cd0000        	call	_GPIO_WriteBit
 375  0110 725f0002      	clr	_g_nGmFlg
 376  0114 5500000009    	mov	_tyRecord+9,_stTimeNow
 377  0119 5500010008    	mov	_tyRecord+8,_stTimeNow+1
 378  011e 5500020007    	mov	_tyRecord+7,_stTimeNow+2
 379  0123 5500030006    	mov	_tyRecord+6,_stTimeNow+3
 380  0128 85            	popw	x
 381                     ; 484 			g_nGmFlg = FALSE;
 383                     ; 487 			tyRecord.Time.Byte.Year = stTimeNow.wYear;
 385                     ; 488 			tyRecord.Time.Byte.Month = stTimeNow.nMonth;
 387                     ; 489 			tyRecord.Time.Byte.Day = stTimeNow.nDay;
 389                     ; 490 			tyRecord.Time.Byte.Hour = stTimeNow.nHour;
 391                     ; 491 			if(60 <= wGatherInterval)
 393  0129 1e06          	ldw	x,(OFST-6,sp)
 394  012b a3003c        	cpw	x,#60
 395  012e 2506          	jrult	L17
 396                     ; 493 				tyRecord.Time.Byte.Minute = 0;
 398  0130 725f0005      	clr	_tyRecord+5
 400  0134 2005          	jra	L37
 401  0136               L17:
 402                     ; 497 				tyRecord.Time.Byte.Minute = stTimeNow.nMinute;
 404  0136 5500040005    	mov	_tyRecord+5,_stTimeNow+4
 405  013b               L37:
 406                     ; 500 			tyRecord.Time.Byte.Second = 0;               /* 存储只精确到分钟 */
 408  013b 725f0004      	clr	_tyRecord+4
 409                     ; 501 			tyRecord.Value = tyParameter.Value;
 411  013f ce000a        	ldw	x,_tyParameter+10
 412  0142 cf0002        	ldw	_tyRecord+2,x
 413  0145 ce0008        	ldw	x,_tyParameter+8
 414  0148 cf0000        	ldw	_tyRecord,x
 415                     ; 503 			if(VALVE_CLOSE == g_nValveStat)
 417  014b c60000        	ld	a,_g_nValveStat
 418  014e a101          	cp	a,#1
 419  0150 2606          	jrne	L57
 420                     ; 505 				tyParameter.Status = OLD_VAVLE_CLOSE;	
 422  0152 3508000c      	mov	_tyParameter+12,#8
 424  0156 200f          	jra	L77
 425  0158               L57:
 426                     ; 507 			else if(VALVE_ERROR == g_nValveStat)
 428  0158 a103          	cp	a,#3
 429  015a 2606          	jrne	L101
 430                     ; 509 				tyParameter.Status = OLD_VAVLE_ERROR;	
 432  015c 35ff000c      	mov	_tyParameter+12,#255
 434  0160 2005          	jra	L77
 435  0162               L101:
 436                     ; 513 				tyParameter.Status = g_nValveStat;
 438  0162 550000000c    	mov	_tyParameter+12,_g_nValveStat
 439  0167               L77:
 440                     ; 518 			tyRecord.nStatus = tyParameter.Status;
 442  0167 55000c000a    	mov	_tyRecord+10,_tyParameter+12
 443                     ; 519 			tyRecord.nRepFlg = TRUE;
 445  016c 3501000b      	mov	_tyRecord+11,#1
 446                     ; 521 			if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
 448  0170 7b08          	ld	a,(OFST-4,sp)
 449  0172 a501          	bcp	a,#1
 450  0174 2606          	jrne	L501
 451                     ; 523 				AddRecord((u8*)&tyRecord, sizeof(tyRecord));
 453  0176 cd0207        	call	LC003
 454                     ; 524 				UC_SleepFunc(60);
 456  0179 cd01fe        	call	LC002
 457  017c               L501:
 458                     ; 528 			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 460  017c 4f            	clr	a
 461  017d cd0000        	call	_LP_SetLowPwrStartFlg
 463                     ; 530 			JASON_130PurchasePro();
 465  0180 cd0000        	call	_JASON_130PurchasePro
 467                     ; 533 			ALM_ClrAlmStatus(METER_ERROR);
 469  0183 a604          	ld	a,#4
 470  0185 cd0000        	call	_ALM_ClrAlmStatus
 473  0188 cc00ac        	jra	L011
 474  018b               L76:
 475                     ; 537 			nTimeOut++;
 477  018b 725c000a      	inc	L12_nTimeOut
 478                     ; 538 			UC_SleepFunc(1000);
 480  018f ae03e8        	ldw	x,#1000
 481  0192 ad6a          	call	LC002
 482                     ; 539 			if(3 < nTimeOut)
 484  0194 c6000a        	ld	a,L12_nTimeOut
 485  0197 a104          	cp	a,#4
 486  0199 25ed          	jrult	L011
 487                     ; 541 				g_nGmFlg = FALSE;					
 489  019b 725f0002      	clr	_g_nGmFlg
 490                     ; 542 				LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 492  019f 4f            	clr	a
 493  01a0 cd0000        	call	_LP_SetLowPwrStartFlg
 495                     ; 543 				MemsetFunc((u8*)&tyRecord, 0xFF, sizeof(tyRecord));
 497  01a3 4b0c          	push	#12
 498  01a5 4bff          	push	#255
 499  01a7 ae0000        	ldw	x,#_tyRecord
 500  01aa cd0000        	call	_MemsetFunc
 502  01ad 85            	popw	x
 503                     ; 544 				tyRecord.Value = INVALID_DATA;
 505  01ae aeeeee        	ldw	x,#61166
 506  01b1 cf0002        	ldw	_tyRecord+2,x
 507  01b4 cf0000        	ldw	_tyRecord,x
 508                     ; 545 				tyRecord.nRepFlg = TRUE;
 510  01b7 3501000b      	mov	_tyRecord+11,#1
 511                     ; 547 				if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
 513  01bb 7b08          	ld	a,(OFST-4,sp)
 514  01bd a501          	bcp	a,#1
 515  01bf 2604          	jrne	L311
 516                     ; 549 					AddRecord((u8*)&tyRecord, sizeof(tyRecord));
 518  01c1 ad44          	call	LC003
 519                     ; 550 					UC_SleepFunc(60);
 521  01c3 ad39          	call	LC002
 522  01c5               L311:
 523                     ; 554 				ALM_SetAlmStatus(METER_ERROR);
 525  01c5 a604          	ld	a,#4
 526  01c7 cd0000        	call	_ALM_SetAlmStatus
 528                     ; 557 				stRepFail.wError |= (1<<GM_GATHERMETER_FAIL);
 530  01ca 721a0007      	bset	_stRepFail+7,#5
 531                     ; 558 				STM8_RTC_Get(&stTimeNow);
 533  01ce ae0000        	ldw	x,#_stTimeNow
 534  01d1 cd0000        	call	_STM8_RTC_Get
 536                     ; 559 				MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stTimeNow, sizeof(stRepFail.stTime));
 538  01d4 4b06          	push	#6
 539  01d6 ae0000        	ldw	x,#_stTimeNow
 540  01d9 89            	pushw	x
 541  01da ae0000        	ldw	x,#_stRepFail
 542  01dd cd0000        	call	_MemcpyFunc
 544  01e0 5b03          	addw	sp,#3
 545                     ; 560 				stRepFail.nSigal = 0xFF;			//信号大小,固定值
 547  01e2 35ff0008      	mov	_stRepFail+8,#255
 548                     ; 561 				AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
 550  01e6 4b09          	push	#9
 551  01e8 ae0000        	ldw	x,#_stRepFail
 552  01eb cd0000        	call	_AddAlmRecord
 554  01ee ae003c        	ldw	x,#60
 555  01f1 84            	pop	a
 556                     ; 562 				UC_SleepFunc(60);
 558  01f2 ad0a          	call	LC002
 560  01f4 cc00ac        	jra	L011
 561                     ; 566 				return ;
 563  01f7               L15:
 564                     ; 599 		g_nGmFlg = FALSE; //补报则不再抄表
 566  01f7 725f0002      	clr	_g_nGmFlg
 567                     ; 600 		LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 569                     ; 602 	return ;
 571  01fb cc00a8        	jp	L75
 573  01fe               LC002:
 574  01fe 89            	pushw	x
 575  01ff 5f            	clrw	x
 576  0200 89            	pushw	x
 577  0201 cd0000        	call	_UC_SleepFunc
 579  0204 5b04          	addw	sp,#4
 580  0206 81            	ret	
 581  0207               LC003:
 582  0207 4b0c          	push	#12
 583  0209 ae0000        	ldw	x,#_tyRecord
 584  020c cd0000        	call	_AddRecord
 586  020f ae003c        	ldw	x,#60
 587  0212 84            	pop	a
 588  0213 81            	ret	
 589  0214               LC004:
 590  0214 1c0009        	addw	x,#OFST-3
 591  0217 cd0000        	call	c_ltor
 593  021a ae0004        	ldw	x,#L62
 594  021d 81            	ret	
 887                     ; 614 int32_t ClaGatherMeterTime(TypeTime stTime)
 887                     ; 615 {
 888                     	switch	.text
 889  021e               _ClaGatherMeterTime:
 891  021e 521b          	subw	sp,#27
 892       0000001b      OFST:	set	27
 895                     ; 618 	int32_t dwOffset = 0;
 897  0220 5f            	clrw	x
 898  0221 1f1a          	ldw	(OFST-1,sp),x
 899  0223 1f18          	ldw	(OFST-3,sp),x
 900                     ; 620 	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&stTime);
 902  0225 96            	ldw	x,sp
 903  0226 1c001e        	addw	x,#OFST+3
 904  0229 89            	pushw	x
 905  022a ae0006        	ldw	x,#6
 906  022d cd0000        	call	_JX_BL_Change
 908  0230 85            	popw	x
 909                     ; 621 	MemcpyFunc((u8*)&stLastTime, (u8*)&stTime, sizeof(TypeTime));
 911  0231 4b06          	push	#6
 912  0233 96            	ldw	x,sp
 913  0234 1c001f        	addw	x,#OFST+4
 914  0237 89            	pushw	x
 915  0238 1d001d        	subw	x,#29
 916  023b cd0000        	call	_MemcpyFunc
 918  023e 5b03          	addw	sp,#3
 919                     ; 622 	STM8_RTC_Get(&stTimeNow);
 921  0240 ae0000        	ldw	x,#_stTimeNow
 922  0243 cd0000        	call	_STM8_RTC_Get
 924                     ; 623 	TM_TimeChangeAToB(&stTimeNow, &stEnd);
 926  0246 96            	ldw	x,sp
 927  0247 1c0010        	addw	x,#OFST-11
 928  024a 89            	pushw	x
 929  024b ae0000        	ldw	x,#_stTimeNow
 930  024e cd0000        	call	_TM_TimeChangeAToB
 932  0251 85            	popw	x
 933                     ; 624 	TM_TimeChangeAToB(&stLastTime, &stStar);
 935  0252 96            	ldw	x,sp
 936  0253 1c0008        	addw	x,#OFST-19
 937  0256 89            	pushw	x
 938  0257 1d0007        	subw	x,#7
 939  025a cd0000        	call	_TM_TimeChangeAToB
 941  025d 85            	popw	x
 942                     ; 625 	dwOffset = TM_DiffSecond(&stStar, &stEnd);	
 944  025e 96            	ldw	x,sp
 945  025f 1c0010        	addw	x,#OFST-11
 946  0262 89            	pushw	x
 947  0263 1d0008        	subw	x,#8
 948  0266 cd0000        	call	_TM_DiffSecond
 950  0269 85            	popw	x
 951  026a 96            	ldw	x,sp
 952  026b 1c0018        	addw	x,#OFST-3
 953  026e cd0000        	call	c_rtol
 955                     ; 627 	return dwOffset;
 957  0271 96            	ldw	x,sp
 958  0272 1c0018        	addw	x,#OFST-3
 959  0275 cd0000        	call	c_ltor
 963  0278 5b1b          	addw	sp,#27
 964  027a 81            	ret	
1020                     ; 638 void fixTaskVavle(void)
1020                     ; 639 {
1021                     	switch	.text
1022  027b               _fixTaskVavle:
1024  027b 520f          	subw	sp,#15
1025       0000000f      OFST:	set	15
1028                     ; 653 	if(CTL_VAVLE_ENABLE != stOptValve.nEnableFlg)
1030  027d c60000        	ld	a,_stOptValve
1031  0280 a1aa          	cp	a,#170
1032  0282 2607          	jrne	L461
1033                     ; 655 		return ;
1035                     ; 658 	if(CTL_VALVE_OVER == stOptValve.nOptFlg)
1037  0284 c60001        	ld	a,_stOptValve+1
1038  0287 a1ee          	cp	a,#238
1039  0289 2603          	jrne	L313
1040                     ; 660 		return ;
1041  028b               L461:
1044  028b 5b0f          	addw	sp,#15
1045  028d 81            	ret	
1046  028e               L313:
1047                     ; 663 	STM8_RTC_Get(&stTimeNow);
1049  028e ae0000        	ldw	x,#_stTimeNow
1050  0291 cd0000        	call	_STM8_RTC_Get
1052                     ; 664 	if((((0 != stOptValve.nVavleCycle)&&(stOptValve.nDay == stTimeNow.nDay)&&(stOptValve.nMonth == stTimeNow.nMonth))
1052                     ; 665 		||((0 == stOptValve.nVavleCycle)&&((0x01 == stTimeNow.nDay)||(0x15 == stTimeNow.nDay))))	
1052                     ; 666 		&&(stTimeNow.nHour >= stOptValve.nStartHour)&&(stTimeNow.nHour <= stOptValve.nEndHour))
1054  0294 c60009        	ld	a,_stOptValve+9
1055  0297 2710          	jreq	L123
1057  0299 c60004        	ld	a,_stOptValve+4
1058  029c c10002        	cp	a,_stTimeNow+2
1059  029f 2608          	jrne	L123
1061  02a1 c60003        	ld	a,_stOptValve+3
1062  02a4 c10001        	cp	a,_stTimeNow+1
1063  02a7 2713          	jreq	L713
1064  02a9               L123:
1066  02a9 c60009        	ld	a,_stOptValve+9
1067  02ac 2703cc0361    	jrne	L513
1069  02b1 c60002        	ld	a,_stTimeNow+2
1070  02b4 a101          	cp	a,#1
1071  02b6 2704          	jreq	L713
1073  02b8 a115          	cp	a,#21
1074  02ba 26f2          	jrne	L513
1075  02bc               L713:
1077  02bc c60003        	ld	a,_stTimeNow+3
1078  02bf c10005        	cp	a,_stOptValve+5
1079  02c2 25ea          	jrult	L513
1081  02c4 c10006        	cp	a,_stOptValve+6
1082  02c7 22e5          	jrugt	L513
1083                     ; 668 		if(0 == stOptValve.nOptFlg)
1085  02c9 c60001        	ld	a,_stOptValve+1
1086  02cc 27bd          	jreq	L461
1087                     ; 670 			return ;
1089                     ; 673 		CJ_T188ProtocolGM();
1091  02ce cd0000        	call	_CJ_T188ProtocolGM
1093                     ; 674 		if((VALVE_CLOSE != g_nValveStat)&&(VALVE_OPEN != g_nValveStat))
1095  02d1 c60000        	ld	a,_g_nValveStat
1096  02d4 a101          	cp	a,#1
1097  02d6 270b          	jreq	L133
1099  02d8 c60000        	ld	a,_g_nValveStat
1100  02db 2706          	jreq	L133
1101                     ; 676 			stOptValve.nVavleStat = 0x78;
1103  02dd 35780007      	mov	_stOptValve+7,#120
1105  02e1 2050          	jra	L333
1106  02e3               L133:
1107                     ; 680 			stOptValve.nVavleStat = g_nValveStat;
1109  02e3 c70007        	ld	_stOptValve+7,a
1110                     ; 681 			stOptValve.nVavleStat|=(g_nValveStat<<5);
1112  02e6 97            	ld	xl,a
1113  02e7 a620          	ld	a,#32
1114  02e9 42            	mul	x,a
1115  02ea 9f            	ld	a,xl
1116  02eb ca0007        	or	a,_stOptValve+7
1117  02ee c70007        	ld	_stOptValve+7,a
1118                     ; 682 			if(VALVE_OPEN == g_nValveStat)
1120  02f1 c60000        	ld	a,_g_nValveStat
1121  02f4 261a          	jrne	L533
1122                     ; 684 				if(TRUE == VavleOperateFun(VALVECLOSE))
1124  02f6 a605          	ld	a,#5
1125  02f8 cd0000        	call	_VavleOperateFun
1127  02fb 4a            	dec	a
1128  02fc 260e          	jrne	L733
1129                     ; 686 					if(TRUE == VavleOperateFun(VALVEOPEN))
1131  02fe a603          	ld	a,#3
1132  0300 cd0000        	call	_VavleOperateFun
1134  0303 4a            	dec	a
1135  0304 2621          	jrne	L353
1136                     ; 688 						stOptValve.nVavleStat |= 0x80;
1138  0306               LC008:
1140  0306 721e0007      	bset	_stOptValve+7,#7
1141  030a 201b          	jra	L353
1142  030c               L733:
1143                     ; 693 					VavleOperateFun(VALVEOPEN);
1145  030c a603          	ld	a,#3
1147                     ; 695 				stOptValve.nVavleStat |=(g_nValveStat<<3);
1149  030e 2014          	jp	LC007
1150  0310               L533:
1151                     ; 699 				if(TRUE == VavleOperateFun(VALVEOPEN))
1153  0310 a603          	ld	a,#3
1154  0312 cd0000        	call	_VavleOperateFun
1156  0315 4a            	dec	a
1157  0316 260a          	jrne	L743
1158                     ; 701 					if(TRUE == VavleOperateFun(VALVECLOSE))
1160  0318 a605          	ld	a,#5
1161  031a cd0000        	call	_VavleOperateFun
1163  031d 4a            	dec	a
1164  031e 2607          	jrne	L353
1165                     ; 703 						stOptValve.nVavleStat |= 0x80;
1166  0320 20e4          	jp	LC008
1167  0322               L743:
1168                     ; 708 					VavleOperateFun(VALVECLOSE);
1170  0322 a605          	ld	a,#5
1171  0324               LC007:
1172  0324 cd0000        	call	_VavleOperateFun
1174  0327               L353:
1175                     ; 710 				stOptValve.nVavleStat |=(g_nValveStat<<3);
1178  0327 c60000        	ld	a,_g_nValveStat
1179  032a 48            	sll	a
1180  032b 48            	sll	a
1181  032c 48            	sll	a
1182  032d ca0007        	or	a,_stOptValve+7
1183  0330 c70007        	ld	_stOptValve+7,a
1184  0333               L333:
1185                     ; 713 		g_OptValveRepFlg = TRUE;
1187  0333 35010000      	mov	_g_OptValveRepFlg,#1
1188                     ; 714 		stOptValve.nRepFailCnt = 0;
1190  0337 725f0008      	clr	_stOptValve+8
1191                     ; 715 		stOptValve.nOptFlg = CTL_VALVE_OVER;	
1193  033b 35ee0001      	mov	_stOptValve+1,#238
1194                     ; 716 		stOptValve.nYear = stTimeNow.wYear;
1196  033f 5500000002    	mov	_stOptValve+2,_stTimeNow
1197                     ; 717 		stOptValve.nMonth= stTimeNow.nMonth;
1199  0344 5500010003    	mov	_stOptValve+3,_stTimeNow+1
1200                     ; 718 		stOptValve.nDay  = stTimeNow.nDay;
1202  0349 5500020004    	mov	_stOptValve+4,_stTimeNow+2
1203                     ; 719 		stOptValve.nStartHour = stTimeNow.nHour;
1205  034e 5500030005    	mov	_stOptValve+5,_stTimeNow+3
1206                     ; 720 		SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
1209  0353               LC005:
1211  0353 4b06          	push	#6
1212  0355 4b0a          	push	#10
1213  0357 ae0000        	ldw	x,#_stOptValve
1214  035a cd0000        	call	_SaveParameterForType
1215  035d 85            	popw	x
1217  035e cc028b        	jra	L461
1218  0361               L513:
1219                     ; 724 		if(CTL_VAVLE_ENABLE != stOptValve.nOptFlg)
1221  0361 c60001        	ld	a,_stOptValve+1
1222  0364 a1aa          	cp	a,#170
1223  0366 27f6          	jreq	L461
1224                     ; 726 			stOptValve.nRepFailCnt = 0;
1226  0368 725f0008      	clr	_stOptValve+8
1227                     ; 727 			stOptValve.nOptFlg = stOptValve.nEnableFlg;
1229  036c 5500000001    	mov	_stOptValve+1,_stOptValve
1230                     ; 729 			if(0 != stOptValve.nVavleCycle)
1232  0371 c60009        	ld	a,_stOptValve+9
1233  0374 27dd          	jreq	LC005
1234                     ; 731 				stTimeTmp.wYear   = stOptValve.nYear;
1236  0376 c60002        	ld	a,_stOptValve+2
1237  0379 6b09          	ld	(OFST-6,sp),a
1238                     ; 732 				stTimeTmp.nMonth  = stOptValve.nMonth;
1240  037b c60003        	ld	a,_stOptValve+3
1241  037e 6b0a          	ld	(OFST-5,sp),a
1242                     ; 733 				stTimeTmp.nDay	  = stOptValve.nDay;
1244  0380 c60004        	ld	a,_stOptValve+4
1245  0383 6b0b          	ld	(OFST-4,sp),a
1246                     ; 734 				stTimeTmp.nHour   = stOptValve.nStartHour;
1248  0385 c60005        	ld	a,_stOptValve+5
1249  0388 6b0c          	ld	(OFST-3,sp),a
1250                     ; 735 				stTimeTmp.nMinute = 0;
1252  038a 0f0d          	clr	(OFST-2,sp)
1253                     ; 736 				stTimeTmp.nSecond = 0;
1255  038c 0f0e          	clr	(OFST-1,sp)
1256                     ; 737 				TM_TimeChangeAToB(&stTimeTmp, &stStarTime);
1258  038e 96            	ldw	x,sp
1259  038f 5c            	incw	x
1260  0390 89            	pushw	x
1261  0391 1c0008        	addw	x,#8
1262  0394 cd0000        	call	_TM_TimeChangeAToB
1264  0397 5500090003    	mov	c_lreg+3,_stOptValve+9
1265  039c 3f02          	clr	c_lreg+2
1266  039e 3f01          	clr	c_lreg+1
1267  03a0 3f00          	clr	c_lreg
1268  03a2 85            	popw	x
1269                     ; 738 				TM_RTimeAddnDay(&stStarTime, stOptValve.nVavleCycle);
1271  03a3 be02          	ldw	x,c_lreg+2
1272  03a5 89            	pushw	x
1273  03a6 be00          	ldw	x,c_lreg
1274  03a8 89            	pushw	x
1275  03a9 96            	ldw	x,sp
1276  03aa 1c0005        	addw	x,#OFST-10
1277  03ad cd0000        	call	_TM_RTimeAddnDay
1279  03b0 5b04          	addw	sp,#4
1280                     ; 739 				TM_TimeChangeBToA(&stStarTime, &stTimeTmp);
1282  03b2 96            	ldw	x,sp
1283  03b3 1c0009        	addw	x,#OFST-6
1284  03b6 89            	pushw	x
1285  03b7 1d0008        	subw	x,#8
1286  03ba cd0000        	call	_TM_TimeChangeBToA
1288  03bd 85            	popw	x
1289                     ; 740 				stOptValve.nYear = stTimeTmp.wYear;
1291  03be 7b09          	ld	a,(OFST-6,sp)
1292  03c0 c70002        	ld	_stOptValve+2,a
1293                     ; 741 				stOptValve.nMonth= stTimeTmp.nMonth;
1295  03c3 7b0a          	ld	a,(OFST-5,sp)
1296  03c5 c70003        	ld	_stOptValve+3,a
1297                     ; 742 				stOptValve.nDay  = stTimeTmp.nDay;
1299  03c8 7b0b          	ld	a,(OFST-4,sp)
1300  03ca c70004        	ld	_stOptValve+4,a
1301                     ; 745 			SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
1303                     ; 750 	return ;
1305  03cd 2084          	jp	LC005
1436                     	switch	.const
1437  000c               L202:
1438  000c eeeeeeee      	dc.l	-286331154
1439                     ; 761 void MonFreezeDatProc(void)
1439                     ; 762 {
1440                     	switch	.text
1441  03cf               _MonFreezeDatProc:
1443  03cf 520e          	subw	sp,#14
1444       0000000e      OFST:	set	14
1447                     ; 763 	u8 i = 0, nMonFreeDay = 0;
1451                     ; 767 	STM8_RTC_Get(&stTimeNow);
1453  03d1 ae0000        	ldw	x,#_stTimeNow
1454  03d4 cd0000        	call	_STM8_RTC_Get
1456                     ; 768 	nMonFreeDay = JX_BcdToByte(stTimeNow.nDay);
1458  03d7 c60002        	ld	a,_stTimeNow+2
1459  03da cd0000        	call	_JX_BcdToByte
1461  03dd 6b01          	ld	(OFST-13,sp),a
1462                     ; 769 	if(nMonFreeDay < tyReport.nMonFreezeDay)
1464  03df c10003        	cp	a,_tyReport+3
1465  03e2 251e          	jrult	L612
1466                     ; 771 		return ;
1468                     ; 775 	if(TRUE == ReadMonFreezeRecord(0, (u8*)&stMonFreeze, sizeof(stMonFreeze)))
1470  03e4 4b06          	push	#6
1471  03e6 96            	ldw	x,sp
1472  03e7 1c0003        	addw	x,#OFST-11
1473  03ea 89            	pushw	x
1474  03eb 4f            	clr	a
1475  03ec cd0000        	call	_ReadMonFreezeRecord
1477  03ef 5b03          	addw	sp,#3
1478  03f1 4a            	dec	a
1479  03f2 2611          	jrne	L344
1480                     ; 777 		if((stMonFreeze.nYear == stTimeNow.wYear) && (stMonFreeze.nMon == stTimeNow.nMonth))
1482  03f4 7b06          	ld	a,(OFST-8,sp)
1483  03f6 c10000        	cp	a,_stTimeNow
1484  03f9 260a          	jrne	L344
1486  03fb 7b07          	ld	a,(OFST-7,sp)
1487  03fd c10001        	cp	a,_stTimeNow+1
1488  0400 2603          	jrne	L344
1489                     ; 779 			return ;
1490  0402               L612:
1493  0402 5b0e          	addw	sp,#14
1494  0404 81            	ret	
1495  0405               L344:
1496                     ; 783 	MemsetFunc((u8*)&stMonFreeze, 0x00, sizeof(stMonFreeze));
1498  0405 4b06          	push	#6
1499  0407 4b00          	push	#0
1500  0409 96            	ldw	x,sp
1501  040a 1c0004        	addw	x,#OFST-10
1502  040d cd0000        	call	_MemsetFunc
1504  0410 85            	popw	x
1505                     ; 785 	for(i = 0; i < NUMBER_RECORD_DAY; i++)
1507  0411 0f01          	clr	(OFST-13,sp)
1508  0413               L744:
1509                     ; 787 		if(TRUE == ReadDayFreezeRecord(i, (u8*)&stDayRec, sizeof(stDayRec)))
1511  0413 4b07          	push	#7
1512  0415 96            	ldw	x,sp
1513  0416 1c0009        	addw	x,#OFST-5
1514  0419 89            	pushw	x
1515  041a 7b04          	ld	a,(OFST-10,sp)
1516  041c cd0000        	call	_ReadDayFreezeRecord
1518  041f 5b03          	addw	sp,#3
1519  0421 4a            	dec	a
1520  0422 2640          	jrne	L363
1521                     ; 789 			if(stDayRec.Value == INVALID_DATA)
1523  0424 96            	ldw	x,sp
1524  0425 1c0008        	addw	x,#OFST-6
1525  0428 cd0000        	call	c_ltor
1527  042b ae000c        	ldw	x,#L202
1528  042e cd0000        	call	c_lcmp
1530  0431 2729          	jreq	L154
1531                     ; 791 				continue;
1533                     ; 794 			if((stDayRec.nYear == stTimeNow.wYear) && 	(stDayRec.nMon == stTimeNow.nMonth))
1535  0433 7b0c          	ld	a,(OFST-2,sp)
1536  0435 c10000        	cp	a,_stTimeNow
1537  0438 2617          	jrne	L364
1539  043a 7b0d          	ld	a,(OFST-1,sp)
1540  043c c10001        	cp	a,_stTimeNow+1
1541  043f 2610          	jrne	L364
1542                     ; 796 				stMonFreeze.nYear = stDayRec.nYear;
1544  0441 7b0c          	ld	a,(OFST-2,sp)
1545  0443 6b06          	ld	(OFST-8,sp),a
1546                     ; 797 				stMonFreeze.nMon = stDayRec.nMon;
1548  0445 7b0d          	ld	a,(OFST-1,sp)
1549  0447 6b07          	ld	(OFST-7,sp),a
1550                     ; 798 				stMonFreeze.Value = stDayRec.Value;
1552  0449 1e0a          	ldw	x,(OFST-4,sp)
1553  044b 1f04          	ldw	(OFST-10,sp),x
1554  044d 1e08          	ldw	x,(OFST-6,sp)
1555                     ; 799 				AddMonFreezeRecord((u8*)&stMonFreeze, RECORD_LEN_MON);
1557                     ; 800 				UC_SleepFunc(60);
1559                     ; 801 				return ;
1561  044f 2022          	jp	LC009
1562  0451               L364:
1563                     ; 808 		UC_SleepFunc(2);
1565  0451 ae0002        	ldw	x,#2
1566  0454 89            	pushw	x
1567  0455 5f            	clrw	x
1568  0456 89            	pushw	x
1569  0457 cd0000        	call	_UC_SleepFunc
1571  045a 5b04          	addw	sp,#4
1572  045c               L154:
1573                     ; 785 	for(i = 0; i < NUMBER_RECORD_DAY; i++)
1575  045c 0c01          	inc	(OFST-13,sp)
1578  045e 7b01          	ld	a,(OFST-13,sp)
1579  0460 a11f          	cp	a,#31
1580  0462 25af          	jrult	L744
1581  0464               L363:
1582                     ; 811 END_InvalidDatPro:
1582                     ; 812 	stMonFreeze.nYear = stTimeNow.wYear;
1584  0464 c60000        	ld	a,_stTimeNow
1585  0467 6b06          	ld	(OFST-8,sp),a
1586                     ; 813 	stMonFreeze.nMon = stTimeNow.nMonth;
1588  0469 c60001        	ld	a,_stTimeNow+1
1589  046c 6b07          	ld	(OFST-7,sp),a
1590                     ; 814 	stMonFreeze.Value = INVALID_DATA;
1592  046e aeeeee        	ldw	x,#61166
1593  0471 1f04          	ldw	(OFST-10,sp),x
1594                     ; 815 	AddMonFreezeRecord((u8*)&stMonFreeze, RECORD_LEN_MON);
1597                     ; 816 	UC_SleepFunc(60);
1600  0473               LC009:
1601  0473 1f02          	ldw	(OFST-12,sp),x
1603  0475 4b06          	push	#6
1604  0477 96            	ldw	x,sp
1605  0478 1c0003        	addw	x,#OFST-11
1606  047b cd0000        	call	_AddMonFreezeRecord
1607  047e ae003c        	ldw	x,#60
1608  0481 84            	pop	a
1610  0482 89            	pushw	x
1611  0483 5f            	clrw	x
1612  0484 89            	pushw	x
1613  0485 cd0000        	call	_UC_SleepFunc
1614  0488 5b04          	addw	sp,#4
1615                     ; 817 	return ;
1617  048a cc0402        	jra	L612
1737                     ; 827 void DayFreezeDatProc(void)
1737                     ; 828 {
1738                     	switch	.text
1739  048d               _DayFreezeDatProc:
1741  048d 5223          	subw	sp,#35
1742       00000023      OFST:	set	35
1745                     ; 831 	u8 i = 0;
1747  048f 0f09          	clr	(OFST-26,sp)
1748                     ; 835 	MemsetFunc((u8*)&stDayFreeze, 0x00, sizeof(stDayFreeze));	
1750  0491 4b07          	push	#7
1751  0493 4b00          	push	#0
1752  0495 96            	ldw	x,sp
1753  0496 1c0013        	addw	x,#OFST-16
1754  0499 cd0000        	call	_MemsetFunc
1756  049c 85            	popw	x
1757                     ; 836 	STM8_RTC_Get(&stTimeNow);
1759  049d ae0000        	ldw	x,#_stTimeNow
1760  04a0 cd0000        	call	_STM8_RTC_Get
1762                     ; 837 	TM_TimeChangeAToB(&stTimeNow, &stTmpTime);
1764  04a3 96            	ldw	x,sp
1765  04a4 5c            	incw	x
1766  04a5 89            	pushw	x
1767  04a6 ae0000        	ldw	x,#_stTimeNow
1768  04a9 cd0000        	call	_TM_TimeChangeAToB
1770  04ac 85            	popw	x
1771                     ; 838 	TM_RTimeDecnMinute(&stTmpTime, 1440);
1773  04ad ae05a0        	ldw	x,#1440
1774  04b0 89            	pushw	x
1775  04b1 5f            	clrw	x
1776  04b2 89            	pushw	x
1777  04b3 96            	ldw	x,sp
1778  04b4 1c0005        	addw	x,#OFST-30
1779  04b7 cd0000        	call	_TM_RTimeDecnMinute
1781  04ba 5b04          	addw	sp,#4
1782                     ; 839 	TM_TimeChangeBToA(&stTmpTime, &stYesterDay);
1784  04bc 96            	ldw	x,sp
1785  04bd 1c000a        	addw	x,#OFST-25
1786  04c0 89            	pushw	x
1787  04c1 1d0009        	subw	x,#9
1788  04c4 cd0000        	call	_TM_TimeChangeBToA
1790  04c7 85            	popw	x
1791                     ; 842 	if(TRUE == ReadDayFreezeRecord(0, (u8*)&stDayFreeze, sizeof(TypeRecordDay)))
1793  04c8 4b07          	push	#7
1794  04ca 96            	ldw	x,sp
1795  04cb 1c0012        	addw	x,#OFST-17
1796  04ce 89            	pushw	x
1797  04cf 4f            	clr	a
1798  04d0 cd0000        	call	_ReadDayFreezeRecord
1800  04d3 5b03          	addw	sp,#3
1801  04d5 4a            	dec	a
1802  04d6 2612          	jrne	L145
1803                     ; 844 		if((stDayFreeze.nYear == stYesterDay.wYear) && 
1803                     ; 845 			(stDayFreeze.nMon == stYesterDay.nMonth) && (stDayFreeze.nDay == stYesterDay.nDay))
1805  04d8 7b15          	ld	a,(OFST-14,sp)
1806  04da 110a          	cp	a,(OFST-25,sp)
1807  04dc 260c          	jrne	L145
1809  04de 7b16          	ld	a,(OFST-13,sp)
1810  04e0 110b          	cp	a,(OFST-24,sp)
1811  04e2 2606          	jrne	L145
1813  04e4 7b17          	ld	a,(OFST-12,sp)
1814  04e6 110c          	cp	a,(OFST-23,sp)
1815  04e8 275d          	jreq	L252
1816                     ; 847 			return ;
1818  04ea               L145:
1819                     ; 851 	for(i = 0; i < NUMBER_RECORD; i++)
1821  04ea 0f09          	clr	(OFST-26,sp)
1822  04ec               L545:
1823                     ; 853 		if(TRUE == ReadRecord(i, (u8*)&stNowRec, sizeof(stNowRec)))
1825  04ec 4b0c          	push	#12
1826  04ee 96            	ldw	x,sp
1827  04ef 1c0019        	addw	x,#OFST-10
1828  04f2 89            	pushw	x
1829  04f3 7b0c          	ld	a,(OFST-23,sp)
1830  04f5 cd0000        	call	_ReadRecord
1832  04f8 5b03          	addw	sp,#3
1833  04fa 4a            	dec	a
1834  04fb 2660          	jrne	L564
1835                     ; 855 			if(stNowRec.Value == INVALID_DATA)
1837  04fd 96            	ldw	x,sp
1838  04fe 1c0018        	addw	x,#OFST-11
1839  0501 cd0000        	call	c_ltor
1841  0504 ae000c        	ldw	x,#L202
1842  0507 cd0000        	call	c_lcmp
1844  050a 2749          	jreq	L745
1845                     ; 857 				continue;
1847                     ; 860 			if((stNowRec.Time.Byte.Year == stYesterDay.wYear) && 
1847                     ; 861 				(stNowRec.Time.Byte.Month == stYesterDay.nMonth) && (stNowRec.Time.Byte.Day == stYesterDay.nDay))
1849  050c 7b21          	ld	a,(OFST-2,sp)
1850  050e 110a          	cp	a,(OFST-25,sp)
1851  0510 2638          	jrne	L165
1853  0512 7b20          	ld	a,(OFST-3,sp)
1854  0514 110b          	cp	a,(OFST-24,sp)
1855  0516 2632          	jrne	L165
1857  0518 7b1f          	ld	a,(OFST-4,sp)
1858  051a 110c          	cp	a,(OFST-23,sp)
1859  051c 262c          	jrne	L165
1860                     ; 863 				stDayFreeze.nYear = stNowRec.Time.Byte.Year;
1862  051e 7b21          	ld	a,(OFST-2,sp)
1863  0520 6b15          	ld	(OFST-14,sp),a
1864                     ; 864 				stDayFreeze.nMon = stNowRec.Time.Byte.Month;
1866  0522 7b20          	ld	a,(OFST-3,sp)
1867  0524 6b16          	ld	(OFST-13,sp),a
1868                     ; 865 				stDayFreeze.nDay = stNowRec.Time.Byte.Day;
1870  0526 7b1f          	ld	a,(OFST-4,sp)
1871  0528 6b17          	ld	(OFST-12,sp),a
1872                     ; 866 				stDayFreeze.Value = stNowRec.Value;
1874  052a 1e1a          	ldw	x,(OFST-9,sp)
1875  052c 1f13          	ldw	(OFST-16,sp),x
1876  052e 1e18          	ldw	x,(OFST-11,sp)
1877                     ; 867 				AddDayFreezeRecord((u8*)&stDayFreeze, RECORD_LEN_DAY);
1880                     ; 868 				UC_SleepFunc(60);
1883  0530               LC010:
1884  0530 1f11          	ldw	(OFST-18,sp),x
1886  0532 4b07          	push	#7
1887  0534 96            	ldw	x,sp
1888  0535 1c0012        	addw	x,#OFST-17
1889  0538 cd0000        	call	_AddDayFreezeRecord
1890  053b ae003c        	ldw	x,#60
1891  053e 84            	pop	a
1893  053f 89            	pushw	x
1894  0540 5f            	clrw	x
1895  0541 89            	pushw	x
1896  0542 cd0000        	call	_UC_SleepFunc
1897  0545 5b04          	addw	sp,#4
1898                     ; 869 				return ;
1899  0547               L252:
1902  0547 5b23          	addw	sp,#35
1903  0549 81            	ret	
1904  054a               L165:
1905                     ; 876 		UC_SleepFunc(2);
1907  054a ae0002        	ldw	x,#2
1908  054d 89            	pushw	x
1909  054e 5f            	clrw	x
1910  054f 89            	pushw	x
1911  0550 cd0000        	call	_UC_SleepFunc
1913  0553 5b04          	addw	sp,#4
1914  0555               L745:
1915                     ; 851 	for(i = 0; i < NUMBER_RECORD; i++)
1917  0555 0c09          	inc	(OFST-26,sp)
1920  0557 7b09          	ld	a,(OFST-26,sp)
1921  0559 a11c          	cp	a,#28
1922  055b 258f          	jrult	L545
1923  055d               L564:
1924                     ; 879 END_InvalidDatPro:
1924                     ; 880 	stDayFreeze.nYear = stYesterDay.wYear;
1926  055d 7b0a          	ld	a,(OFST-25,sp)
1927  055f 6b15          	ld	(OFST-14,sp),a
1928                     ; 881 	stDayFreeze.nMon = stYesterDay.nMonth;
1930  0561 7b0b          	ld	a,(OFST-24,sp)
1931  0563 6b16          	ld	(OFST-13,sp),a
1932                     ; 882 	stDayFreeze.nDay = stYesterDay.nDay;
1934  0565 7b0c          	ld	a,(OFST-23,sp)
1935  0567 6b17          	ld	(OFST-12,sp),a
1936                     ; 883 	stDayFreeze.Value = INVALID_DATA;
1938  0569 aeeeee        	ldw	x,#61166
1939  056c 1f13          	ldw	(OFST-16,sp),x
1940                     ; 884 	AddDayFreezeRecord((u8*)&stDayFreeze, RECORD_LEN_DAY);
1942                     ; 885 	UC_SleepFunc(60);
1944                     ; 886 	return ;
1946  056e 20c0          	jp	LC010
1971                     ; 897 u8 GM_GetGatherMeterFlg(void)
1971                     ; 898 {
1972                     	switch	.text
1973  0570               _GM_GetGatherMeterFlg:
1977                     ; 899 	return g_nGatherMeterFlg;
1979  0570 c60004        	ld	a,_g_nGatherMeterFlg
1982  0573 81            	ret	
2006                     ; 910 void fixTaskMeterTestCode(void)
2006                     ; 911 {
2007                     	switch	.text
2008  0574               _fixTaskMeterTestCode:
2012                     ; 1089 	return ;
2015  0574 81            	ret	
2039                     ; 1100 void fixTaskMeter(void)
2039                     ; 1101 {
2040                     	switch	.text
2041  0575               _fixTaskMeter:
2045                     ; 1110 	JASON_130TaskMeter();
2048                     ; 1125 	return ;
2051  0575 cc0001        	jp	_JASON_130TaskMeter
2077                     ; 1128 void InitializeMeter(void)
2077                     ; 1129 {
2078                     	switch	.text
2079  0578               _InitializeMeter:
2083                     ; 1130 	MemsetFunc((u8*)&tyTime, 0x00, sizeof(tyTime));
2085  0578 4b06          	push	#6
2086  057a 4b00          	push	#0
2087  057c ae0002        	ldw	x,#_tyTime
2088  057f cd0000        	call	_MemsetFunc
2090  0582 85            	popw	x
2091                     ; 1131 	MemsetFunc((u8*)&tyRecord, 0xff, sizeof(tyRecord));
2093  0583 4b0c          	push	#12
2094  0585 4bff          	push	#255
2095  0587 ae0000        	ldw	x,#_tyRecord
2096  058a cd0000        	call	_MemsetFunc
2098  058d 85            	popw	x
2099                     ; 1132 }
2102  058e 81            	ret	
2183                     	xdef	_fixTaskMeterTestCode
2184                     	xdef	_DayFreezeDatProc
2185                     	xdef	_MonFreezeDatProc
2186                     	xdef	_JASON_130TaskMeter
2187                     	xdef	_g_nGatherMeterFlg
2188                     	xdef	_g_nErrFlg
2189                     	xdef	_g_nGmFlg
2190                     	xdef	_g_wGMInterval
2191                     	switch	.bss
2192  0000               _ucStepMeter:
2193  0000 00            	ds.b	1
2194                     	xdef	_ucStepMeter
2195  0001               _ucStatusMeter:
2196  0001 00            	ds.b	1
2197                     	xdef	_ucStatusMeter
2198                     	xref	_ALM_ClrAlmStatus
2199                     	xref	_ALM_SetAlmStatus
2200                     	xref	_LP_SetLowPwrStartFlg
2201                     	xref	_STM8_RTC_Get
2202                     	xref	_stRepFail
2203                     	xref	_tyParameter
2204                     	xref	_tyRecord
2205                     	xref	_ReadMonFreezeRecord
2206                     	xref	_AddMonFreezeRecord
2207                     	xref	_ReadDayFreezeRecord
2208                     	xref	_AddDayFreezeRecord
2209                     	xref	_AddAlmRecord
2210                     	xref	_SaveParameterForType
2211                     	xref	_ReadRecord
2212                     	xref	_AddRecord
2213                     	xref	_GetReportFailFlag
2214                     	xref	_ReWriteRepFlg
2215                     	xref	_UC_SleepFunc
2216                     	xref	_GetReportFlag
2217                     	xref	_g_OptValveRepFlg
2218                     	xref	_stOptValve
2219                     	xref	_stTimeNow
2220                     	xref	_tyReport
2221                     	xref	_g_dwSysTick
2222                     	xdef	_JASON_130PurchasePro
2223                     	xdef	_ClaGatherMeterTime
2224                     	xdef	_fixTaskVavle
2225                     	xdef	_GM_GetGatherMeterFlg
2226                     	xdef	_InitializeMeter
2227                     	xdef	_fixTaskMeter
2228                     	xdef	_g_dwNowMeterVal
2229                     	xdef	_g_nOptValveTask
2230  0002               _tyTime:
2231  0002 000000000000  	ds.b	6
2232                     	xdef	_tyTime
2233                     	xref	_JX_BcdToByte
2234                     	xref	_TM_RTimeDecnMinute
2235                     	xref	_TM_RTimeAddnDay
2236                     	xref	_TM_DiffSecond
2237                     	xref	_TM_TimeChangeBToA
2238                     	xref	_TM_TimeChangeAToB
2239                     	xref	_JX_BL_Change
2240                     	xref	_MemcpyFunc
2241                     	xref	_MemsetFunc
2242                     	xref	_VavleOperateFun
2243                     	xref	_GatherMeterFun
2244                     	xref	_CJ_T188ProtocolGM
2245                     	xref	_g_nValveStat
2246                     	xref	_GPIO_WriteBit
2247                     	xref.b	c_lreg
2248                     	xref.b	c_x
2268                     	xref	c_lumd
2269                     	xref	c_ldiv
2270                     	xref	c_ludv
2271                     	xref	c_uitolx
2272                     	xref	c_lzmp
2273                     	xref	c_rtol
2274                     	xref	c_lcmp
2275                     	xref	c_ltor
2276                     	end
