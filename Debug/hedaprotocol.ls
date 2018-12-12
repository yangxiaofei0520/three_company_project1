   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               _stDataPtrHD:
   7  0000 00            	dc.b	0
   8  0001 0000          	ds.b	2
   9  0003 000000000000  	ds.b	137
  10  008c               _g_HD_Ctrl:
  11  008c 00            	dc.b	0
  12  008d               _g_HD_Msg_Tag:
  13  008d 0000          	dc.w	0
  14  008f               _g_HD_aralm_type:
  15  008f 0000          	dc.w	0
  16  0091               _g_HD_device_addr:
  17  0091 0000          	dc.w	0
  48                     .const:	section	.text
  49  0000               L6:
  50  0000 00015180      	dc.l	86400
  51                     ; 44 s32 HD_ClaReportTimeToSec(void)
  51                     ; 45 {
  52                     	scross	off
  53                     	switch	.text
  54  0000               _HD_ClaReportTimeToSec:
  58                     ; 46 	switch(tyReport.nIntervalType)
  60  0000 c60001        	ld	a,_tyReport+1
  62                     ; 51 		default:return (s32)24*3600;
  63  0003 2727          	jreq	L7
  64  0005 4a            	dec	a
  65  0006 2718          	jreq	L5
  66  0008 4a            	dec	a
  67  0009 270b          	jreq	L3
  70  000b ae5180        	ldw	x,#20864
  71  000e bf02          	ldw	c_lreg+2,x
  72  0010 ae0001        	ldw	x,#1
  73  0013 bf00          	ldw	c_lreg,x
  76  0015 81            	ret	
  77  0016               L3:
  78                     ; 48 		case HD_INTERVAL_MIN:return (s32)tyReport.cycle*60;
  80  0016 c60002        	ld	a,_tyReport+2
  81  0019 5f            	clrw	x
  82  001a 97            	ld	xl,a
  83  001b a63c          	ld	a,#60
  87  001d cc0000        	jp	c_cmulx
  88  0020               L5:
  89                     ; 49 		case HD_INTERVAL_HOUR:return (s32)tyReport.cycle*3600;
  91  0020 c60002        	ld	a,_tyReport+2
  92  0023 5f            	clrw	x
  93  0024 97            	ld	xl,a
  94  0025 90ae0e10      	ldw	y,#3600
  98  0029 cc0000        	jp	c_umul
  99  002c               L7:
 100                     ; 50 		case HD_INTERVAL_DAY:return (s32)tyReport.cycle*3600*24;
 102  002c 5500020003    	mov	c_lreg+3,_tyReport+2
 103  0031 b702          	ld	c_lreg+2,a
 104  0033 b701          	ld	c_lreg+1,a
 105  0035 b700          	ld	c_lreg,a
 106  0037 ae0000        	ldw	x,#L6
 110  003a cc0000        	jp	c_lmul
 349                     	switch	.const
 350  0004               L43:
 351  0004 0000003c      	dc.l	60
 352                     ; 66 uint32_t LP_HD_CalReportConut(void)
 352                     ; 67 {
 353                     	switch	.text
 354  003d               _LP_HD_CalReportConut:
 356  003d 5236          	subw	sp,#54
 357       00000036      OFST:	set	54
 360                     ; 68 	uint32_t dwTmp = 0, dwCount = 0;
 362  003f 96            	ldw	x,sp
 363  0040 1c002b        	addw	x,#OFST-11
 364  0043 cd0000        	call	c_ltor
 368  0046 96            	ldw	x,sp
 369  0047 1c002b        	addw	x,#OFST-11
 370  004a cd0000        	call	c_ltor
 372                     ; 69 	int32_t  dwOffset = 0,dwTemp = 0;
 374  004d 96            	ldw	x,sp
 375  004e 1c001f        	addw	x,#OFST-23
 376  0051 cd0000        	call	c_ltor
 380  0054 96            	ldw	x,sp
 381  0055 1c002b        	addw	x,#OFST-11
 382  0058 cd0000        	call	c_ltor
 384                     ; 71 	u8       nRepFlg = 0;
 386                     ; 77 	MemcpyFunc((u8*)&tyTime, (u8*)&tyReport.Time, sizeof(TypeTime));
 388  005b 4b06          	push	#6
 389  005d ae0004        	ldw	x,#_tyReport+4
 390  0060 89            	pushw	x
 391  0061 ae0000        	ldw	x,#_tyTime
 392  0064 cd0000        	call	_MemcpyFunc
 394  0067 5b03          	addw	sp,#3
 395                     ; 78 	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&tyTime);
 397  0069 ae0000        	ldw	x,#_tyTime
 398  006c 89            	pushw	x
 399  006d ae0006        	ldw	x,#6
 400  0070 cd0000        	call	_JX_BL_Change
 402  0073 85            	popw	x
 403                     ; 79 	MemcpyFunc((u8*)&stLastTime, (u8*)&tyTime, sizeof(TypeTime));
 405  0074 4b06          	push	#6
 406  0076 ae0000        	ldw	x,#_tyTime
 407  0079 89            	pushw	x
 408  007a 96            	ldw	x,sp
 409  007b 1c001a        	addw	x,#OFST-28
 410  007e cd0000        	call	_MemcpyFunc
 412  0081 5b03          	addw	sp,#3
 413                     ; 80 	STM8_RTC_Get(&stTimeNow);
 415  0083 ae0000        	ldw	x,#_stTimeNow
 416  0086 cd0000        	call	_STM8_RTC_Get
 418                     ; 81 	TM_TimeChangeAToB(&stTimeNow, &stEnd);
 420  0089 96            	ldw	x,sp
 421  008a 1c0023        	addw	x,#OFST-19
 422  008d 89            	pushw	x
 423  008e ae0000        	ldw	x,#_stTimeNow
 424  0091 cd0000        	call	_TM_TimeChangeAToB
 426  0094 85            	popw	x
 427                     ; 82 	TM_TimeChangeAToB(&stLastTime, &stStar);
 429  0095 96            	ldw	x,sp
 430  0096 1c000f        	addw	x,#OFST-39
 431  0099 89            	pushw	x
 432  009a 1c0008        	addw	x,#8
 433  009d cd0000        	call	_TM_TimeChangeAToB
 435  00a0 85            	popw	x
 436                     ; 83 	dwOffset = TM_DiffSecond(&stStar, &stEnd);	
 438  00a1 96            	ldw	x,sp
 439  00a2 1c0023        	addw	x,#OFST-19
 440  00a5 89            	pushw	x
 441  00a6 1d0014        	subw	x,#20
 442  00a9 cd0000        	call	_TM_DiffSecond
 444  00ac 85            	popw	x
 445  00ad 96            	ldw	x,sp
 446  00ae 1c001f        	addw	x,#OFST-23
 447  00b1 cd0000        	call	c_rtol
 449                     ; 84 	stEnd.nSecond = 0;	
 451  00b4 0f29          	clr	(OFST-13,sp)
 452                     ; 85 	MemcpyFunc((u8*)&stTmpTime,  (u8*)&stEnd, sizeof(stTmpTime));
 454  00b6 4b08          	push	#8
 455  00b8 96            	ldw	x,sp
 456  00b9 1c0024        	addw	x,#OFST-18
 457  00bc 89            	pushw	x
 458  00bd 1c000c        	addw	x,#12
 459  00c0 cd0000        	call	_MemcpyFunc
 461  00c3 5b03          	addw	sp,#3
 462                     ; 88 	if(0 < dwOffset) 
 464  00c5 96            	ldw	x,sp
 465  00c6 1c001f        	addw	x,#OFST-23
 466  00c9 cd0000        	call	c_lzmp
 468  00cc 2d52          	jrsle	L151
 469                     ; 90 		TM_RTimeAddnMinute(&stEnd, (tyReport.wGatherCycle - (u16)((dwOffset/60)%(u32)tyReport.wGatherCycle)));
 471  00ce 5500000003    	mov	c_lreg+3,_tyReport
 472  00d3 3f02          	clr	c_lreg+2
 473  00d5 3f01          	clr	c_lreg+1
 474  00d7 3f00          	clr	c_lreg
 475  00d9 96            	ldw	x,sp
 476  00da 1c0003        	addw	x,#OFST-51
 477  00dd cd0000        	call	c_rtol
 479  00e0 96            	ldw	x,sp
 480  00e1 1c001f        	addw	x,#OFST-23
 481  00e4 cd0000        	call	c_ltor
 483  00e7 ae0004        	ldw	x,#L43
 484  00ea cd0000        	call	c_ldiv
 486  00ed 96            	ldw	x,sp
 487  00ee 1c0003        	addw	x,#OFST-51
 488  00f1 cd0000        	call	c_lmod
 490  00f4 be02          	ldw	x,c_lreg+2
 491  00f6 1f01          	ldw	(OFST-53,sp),x
 492  00f8 c60000        	ld	a,_tyReport
 493  00fb 5f            	clrw	x
 494  00fc 97            	ld	xl,a
 495  00fd 72f001        	subw	x,(OFST-53,sp)
 496  0100 cd0000        	call	c_uitolx
 498  0103 be02          	ldw	x,c_lreg+2
 499  0105 89            	pushw	x
 500  0106 be00          	ldw	x,c_lreg
 501  0108 89            	pushw	x
 502  0109 96            	ldw	x,sp
 503  010a 1c0027        	addw	x,#OFST-15
 504  010d cd0000        	call	_TM_RTimeAddnMinute
 506  0110 5b04          	addw	sp,#4
 507                     ; 91 		TM_TimeChangeBToA(&stEnd, &g_stNextGmTime); 
 509  0112 ae0000        	ldw	x,#_g_stNextGmTime
 510  0115 89            	pushw	x
 511  0116 96            	ldw	x,sp
 512  0117 1c0025        	addw	x,#OFST-17
 513  011a cd0000        	call	_TM_TimeChangeBToA
 515  011d 85            	popw	x
 517  011e 200f          	jra	L351
 518  0120               L151:
 519                     ; 95 		MemcpyFunc((u8*)&g_stNextGmTime, (u8*)&stLastTime, sizeof(ST_Time));
 521  0120 4b07          	push	#7
 522  0122 96            	ldw	x,sp
 523  0123 1c0018        	addw	x,#OFST-30
 524  0126 89            	pushw	x
 525  0127 ae0000        	ldw	x,#_g_stNextGmTime
 526  012a cd0000        	call	_MemcpyFunc
 528  012d 5b03          	addw	sp,#3
 529  012f               L351:
 530                     ; 100 	dwOffset = TM_DiffSecond(&stLastReportT, &stTmpTime);
 532  012f 96            	ldw	x,sp
 533  0130 1c002f        	addw	x,#OFST-7
 534  0133 89            	pushw	x
 535  0134 ae0000        	ldw	x,#_stLastReportT
 536  0137 cd0000        	call	_TM_DiffSecond
 538  013a 85            	popw	x
 539  013b 96            	ldw	x,sp
 540  013c 1c001f        	addw	x,#OFST-23
 541  013f cd0000        	call	c_rtol
 543                     ; 101 	dwTemp   = HD_ClaReportTimeToSec();
 545  0142 cd0000        	call	_HD_ClaReportTimeToSec
 547  0145 96            	ldw	x,sp
 548  0146 1c002b        	addw	x,#OFST-11
 549  0149 cd0000        	call	c_rtol
 551                     ; 104 	if(0 < dwOffset) 
 553  014c 96            	ldw	x,sp
 554  014d 1c001f        	addw	x,#OFST-23
 555  0150 cd0000        	call	c_lzmp
 557  0153 2d42          	jrsle	L551
 558                     ; 106 		TM_RTimeAddnMinute(&stTmpTime, ((dwTemp - (u32)(dwOffset%dwTemp))/60));
 560  0155 96            	ldw	x,sp
 561  0156 1c001f        	addw	x,#OFST-23
 562  0159 cd0000        	call	c_ltor
 564  015c 96            	ldw	x,sp
 565  015d 1c002b        	addw	x,#OFST-11
 566  0160 cd0000        	call	c_lumd
 568  0163 96            	ldw	x,sp
 569  0164 1c0003        	addw	x,#OFST-51
 570  0167 cd0000        	call	c_rtol
 572  016a 96            	ldw	x,sp
 573  016b 1c002b        	addw	x,#OFST-11
 574  016e cd0000        	call	c_ltor
 576  0171 96            	ldw	x,sp
 577  0172 1c0003        	addw	x,#OFST-51
 578  0175 cd0000        	call	c_lsub
 580  0178 ae0004        	ldw	x,#L43
 581  017b cd0000        	call	c_ludv
 583  017e be02          	ldw	x,c_lreg+2
 584  0180 89            	pushw	x
 585  0181 be00          	ldw	x,c_lreg
 586  0183 89            	pushw	x
 587  0184 96            	ldw	x,sp
 588  0185 1c0033        	addw	x,#OFST-3
 589  0188 cd0000        	call	_TM_RTimeAddnMinute
 591  018b 5b04          	addw	sp,#4
 592                     ; 107 		TM_TimeChangeBToA(&stTmpTime, &g_stNextRepTime);
 594  018d ae0000        	ldw	x,#_g_stNextRepTime
 595  0190 89            	pushw	x
 596  0191 96            	ldw	x,sp
 597  0192 1c0031        	addw	x,#OFST-5
 600  0195 2007          	jra	L751
 601  0197               L551:
 602                     ; 111 		TM_TimeChangeBToA(&stLastReportT, &g_stNextRepTime);
 604  0197 ae0000        	ldw	x,#_g_stNextRepTime
 605  019a 89            	pushw	x
 606  019b ae0000        	ldw	x,#_stLastReportT
 608  019e               L751:
 609  019e cd0000        	call	_TM_TimeChangeBToA
 610  01a1 85            	popw	x
 611                     ; 115 	nRepFlg = GetReportFailFlag();
 613  01a2 cd0000        	call	_GetReportFailFlag
 615  01a5 6b1e          	ld	(OFST-24,sp),a
 616                     ; 116 	if(nRepFlg&REPORT_FAIL_FLG)
 618  01a7 a50e          	bcp	a,#14
 619  01a9 276f          	jreq	L161
 620                     ; 118 		STM8_RTC_Get(&stTimeNow);		
 622  01ab ae0000        	ldw	x,#_stTimeNow
 623  01ae cd0000        	call	_STM8_RTC_Get
 625                     ; 119 		TM_TimeChangeAToB(&stTimeNow, &stTime);
 627  01b1 96            	ldw	x,sp
 628  01b2 1c0007        	addw	x,#OFST-47
 629  01b5 89            	pushw	x
 630  01b6 ae0000        	ldw	x,#_stTimeNow
 631  01b9 cd0000        	call	_TM_TimeChangeAToB
 633  01bc 85            	popw	x
 634                     ; 120 		MemcpyFunc((u8*)&stTmpTime, (u8*)&stTime, sizeof(TM_Time));
 636  01bd 4b08          	push	#8
 637  01bf 96            	ldw	x,sp
 638  01c0 1c0008        	addw	x,#OFST-46
 639  01c3 89            	pushw	x
 640  01c4 1c0028        	addw	x,#40
 641  01c7 cd0000        	call	_MemcpyFunc
 643  01ca 5b03          	addw	sp,#3
 644                     ; 123 		if(nRepFlg&THIRD_REP_FAIL)
 646  01cc 7b1e          	ld	a,(OFST-24,sp)
 647  01ce a508          	bcp	a,#8
 648  01d0 270c          	jreq	L361
 649                     ; 125 			if(HD_INTERVAL_MIN == tyReport.nIntervalType)
 651  01d2 c60001        	ld	a,_tyReport+1
 652  01d5 a102          	cp	a,#2
 653                     ; 127 				TM_RTimeAddnMinute(&stTmpTime, 15);
 656  01d7 2726          	jreq	L302
 657                     ; 131 				TM_RTimeAddnMinute(&stTmpTime, 45);
 659  01d9 ae002d        	ldw	x,#45
 661  01dc 2024          	jra	L171
 662  01de               L361:
 663                     ; 134 		else if(nRepFlg&SECOND_REP_FAIL)
 665  01de a504          	bcp	a,#4
 666  01e0 2711          	jreq	L371
 667                     ; 136 			if(HD_INTERVAL_MIN == tyReport.nIntervalType)
 669  01e2 c60001        	ld	a,_tyReport+1
 670  01e5 a102          	cp	a,#2
 671  01e7 2605          	jrne	L571
 672                     ; 138 				TM_RTimeAddnMinute(&stTmpTime, 10);
 674  01e9 ae000a        	ldw	x,#10
 677  01ec 2014          	jra	L171
 678  01ee               L571:
 679                     ; 142 				TM_RTimeAddnMinute(&stTmpTime, 30);
 681  01ee ae001e        	ldw	x,#30
 683  01f1 200f          	jra	L171
 684  01f3               L371:
 685                     ; 147 			if(HD_INTERVAL_MIN == tyReport.nIntervalType)
 687  01f3 c60001        	ld	a,_tyReport+1
 688  01f6 a102          	cp	a,#2
 689  01f8 2605          	jrne	L302
 690                     ; 149 				TM_RTimeAddnMinute(&stTmpTime, 5);
 692  01fa ae0005        	ldw	x,#5
 695  01fd 2003          	jra	L171
 696  01ff               L302:
 697                     ; 153 				TM_RTimeAddnMinute(&stTmpTime, 15);
 700  01ff ae000f        	ldw	x,#15
 702  0202               L171:
 703  0202 89            	pushw	x
 704  0203 5f            	clrw	x
 705  0204 89            	pushw	x
 706  0205 96            	ldw	x,sp
 707  0206 1c0033        	addw	x,#OFST-3
 708  0209 cd0000        	call	_TM_RTimeAddnMinute
 709  020c 5b04          	addw	sp,#4
 710                     ; 156 		TM_TimeChangeBToA(&stTmpTime, &g_stNextRepTime);	
 712  020e ae0000        	ldw	x,#_g_stNextRepTime
 713  0211 89            	pushw	x
 714  0212 96            	ldw	x,sp
 715  0213 1c0031        	addw	x,#OFST-5
 716  0216 cd0000        	call	_TM_TimeChangeBToA
 718  0219 85            	popw	x
 719  021a               L161:
 720                     ; 160 	ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);
 722  021a 4b03          	push	#3
 723  021c 4b0a          	push	#10
 724  021e ae0000        	ldw	x,#_tyReport
 725  0221 cd0000        	call	_ReadParameterForType
 727  0224 c60000        	ld	a,_tyReport
 728  0227 85            	popw	x
 729                     ; 161 	if(0 < tyReport.wGatherCycle)
 731  0228 2725          	jreq	L702
 732                     ; 163 		dwTmp = tyReport.wGatherCycle;
 734  022a 6b2e          	ld	(OFST-8,sp),a
 735  022c 4f            	clr	a
 736  022d 6b2d          	ld	(OFST-9,sp),a
 737  022f 6b2c          	ld	(OFST-10,sp),a
 738  0231 6b2b          	ld	(OFST-11,sp),a
 739                     ; 164 		dwCount = dwTmp*60;
 741  0233 96            	ldw	x,sp
 742  0234 1c002b        	addw	x,#OFST-11
 743  0237 cd0000        	call	c_ltor
 745  023a a63c          	ld	a,#60
 746  023c cd0000        	call	c_smul
 748  023f 96            	ldw	x,sp
 749  0240 1c002b        	addw	x,#OFST-11
 750  0243 cd0000        	call	c_rtol
 753                     ; 171 	return dwCount;
 755  0246 96            	ldw	x,sp
 756  0247 1c002b        	addw	x,#OFST-11
 757  024a cd0000        	call	c_ltor
 760  024d 200a          	jra	L401
 761  024f               L702:
 762                     ; 168 		return LP_WAKEUP_TO;
 764  024f ae8c00        	ldw	x,#35840
 765  0252 bf02          	ldw	c_lreg+2,x
 766  0254 ae000a        	ldw	x,#10
 767  0257 bf00          	ldw	c_lreg,x
 769  0259               L401:
 771  0259 5b36          	addw	sp,#54
 772  025b 81            	ret	
 806                     	switch	.const
 807  0008               L611:
 808  0008 00003a99      	dc.l	15001
 809                     ; 185 void HD_TimeOutReUpLoad(void)
 809                     ; 186 {
 810                     	switch	.text
 811  025c               _HD_TimeOutReUpLoad:
 815                     ; 187 	if (UP_Free_HD > ucLogonMode)
 817  025c c60000        	ld	a,_ucLogonMode
 818  025f a105          	cp	a,#5
 819  0261 240d          	jruge	L322
 820                     ; 189 		HD_OnlineCtl();
 822  0263 ad6b          	call	_HD_OnlineCtl
 824                     ; 190 		UC_SleepFunc(1000);
 826  0265 ae03e8        	ldw	x,#1000
 827  0268 89            	pushw	x
 828  0269 5f            	clrw	x
 829  026a 89            	pushw	x
 830  026b cd0000        	call	_UC_SleepFunc
 832  026e 5b04          	addw	sp,#4
 833  0270               L322:
 834                     ; 194 	if((FALSE == m_nRepEnableFlg)||(REPDAT_TIMEOUT >= GetSysTemTick() - g_dwRepTick))
 836  0270 c60000        	ld	a,_m_nRepEnableFlg
 837  0273 2711          	jreq	L722
 839  0275 cd0000        	call	_GetSysTemTick
 841  0278 ae0000        	ldw	x,#_g_dwRepTick
 842  027b cd0000        	call	c_lsub
 844  027e ae0008        	ldw	x,#L611
 845  0281 cd0000        	call	c_lcmp
 847  0284 2401          	jruge	L522
 848  0286               L722:
 849                     ; 196 		return ;
 852  0286 81            	ret	
 853  0287               L522:
 854                     ; 207 	if(REPORT_CNT_TO <= g_nDatRepCnt)
 856  0287 c60000        	ld	a,_g_nDatRepCnt
 857  028a a103          	cp	a,#3
 858  028c 2511          	jrult	L132
 859                     ; 209 		SetLogonMode(UP_Free_HD);
 861  028e a605          	ld	a,#5
 862  0290 cd0000        	call	_SetLogonMode
 864                     ; 210 		stRepFail.wError |= (1<<REP_RESPOND_FAIL);
 866  0293 72180007      	bset	_stRepFail+7,#4
 867                     ; 211 		m_nRepFailFlg = TRUE;
 869  0297 35010000      	mov	_m_nRepFailFlg,#1
 870                     ; 212 		tyGSMFlag = FALSE;		
 872  029b 725f0000      	clr	_tyGSMFlag
 873  029f               L132:
 874                     ; 214 	return ;
 877  029f 81            	ret	
 931                     ; 226 void HD_ProtolProc(void)
 931                     ; 227 {
 932                     	switch	.text
 933  02a0               _HD_ProtolProc:
 935  02a0 5204          	subw	sp,#4
 936       00000004      OFST:	set	4
 939                     ; 228 	u8* pnRxAdd = GetUartRxBuf();
 941  02a2 cd0000        	call	_GetUartRxBuf
 943  02a5 1f02          	ldw	(OFST-2,sp),x
 944                     ; 229 	u8  nRxLen  = 0, nSendLen = 0;
 946  02a7 0f01          	clr	(OFST-3,sp)
 949                     ; 231 	nSendLen = HD_DecodeParameter(pnRxAdd, CheckRevDataLen());
 951  02a9 cd0000        	call	_CheckRevDataLen
 953  02ac 88            	push	a
 954  02ad 1e03          	ldw	x,(OFST-1,sp)
 955  02af cd0612        	call	_HD_DecodeParameter
 957  02b2 5b01          	addw	sp,#1
 958  02b4 6b04          	ld	(OFST+0,sp),a
 959                     ; 234 	if(0 < nSendLen)
 961  02b6 270c          	jreq	L552
 962                     ; 236 		HD_ProtolSend(nSendLen, COM_1,1);
 964  02b8 4b01          	push	#1
 965  02ba ae0001        	ldw	x,#1
 966  02bd 7b05          	ld	a,(OFST+1,sp)
 967  02bf 95            	ld	xh,a
 968  02c0 cd0508        	call	_HD_ProtolSend
 970  02c3 84            	pop	a
 971  02c4               L552:
 972                     ; 238 	UC_SleepFunc(50);
 974  02c4 ae0032        	ldw	x,#50
 975  02c7 89            	pushw	x
 976  02c8 5f            	clrw	x
 977  02c9 89            	pushw	x
 978  02ca cd0000        	call	_UC_SleepFunc
 980  02cd 5b08          	addw	sp,#8
 981                     ; 239 }
 984  02cf 81            	ret	
 987                     	switch	.data
 988  0093               L752_nFirFlg:
 989  0093 01            	dc.b	1
1025                     ; 251 void HD_OnlineCtl(void)
1025                     ; 252 {
1026                     	switch	.text
1027  02d0               _HD_OnlineCtl:
1031                     ; 255 	if(nFirFlg)
1033  02d0 c60093        	ld	a,L752_nFirFlg
1034  02d3 2708          	jreq	L572
1035                     ; 257 		nFirFlg = FALSE;
1037  02d5 725f0093      	clr	L752_nFirFlg
1038                     ; 258 		tyGSMFlag = TRUE;
1040  02d9 35010000      	mov	_tyGSMFlag,#1
1041  02dd               L572:
1042                     ; 262 	if( (UP_Upload_HD == ucLogonMode) && (tyGSMFlag) )
1044  02dd c60000        	ld	a,_ucLogonMode
1045  02e0 a104          	cp	a,#4
1046  02e2 261e          	jrne	L772
1048  02e4 c60000        	ld	a,_tyGSMFlag
1049  02e7 2719          	jreq	L772
1050                     ; 264 		if(TRUE == HD_Online(ucLogonMode))
1052  02e9 c60000        	ld	a,_ucLogonMode
1053  02ec ad15          	call	_HD_Online
1055  02ee 4a            	dec	a
1056  02ef 2611          	jrne	L772
1057                     ; 266 			ucLogonMode = UP_Free_HD;
1059  02f1 35050000      	mov	_ucLogonMode,#5
1060                     ; 267 			g_dwRepTick = GetSysTemTick();
1062  02f5 cd0000        	call	_GetSysTemTick
1064  02f8 ae0000        	ldw	x,#_g_dwRepTick
1065  02fb cd0000        	call	c_rtol
1067                     ; 270 			g_nDatRepCnt++;
1069  02fe 725c0000      	inc	_g_nDatRepCnt
1070  0302               L772:
1071                     ; 273 }
1074  0302 81            	ret	
1077                     	switch	.const
1078  000c               L303_nTmpBuf:
1079  000c 00            	dc.b	0
1080  000d 000000000000  	ds.b	16
1261                     ; 285 u8 HD_Online(u8 nLogonMode)
1261                     ; 286 {
1262                     	switch	.text
1263  0303               _HD_Online:
1265  0303 5238          	subw	sp,#56
1266       00000038      OFST:	set	56
1269                     ; 287 	u8  nSendLen = 0, nOffset = 0;
1273  0305 0f38          	clr	(OFST+0,sp)
1274                     ; 288 	u8 nTmpBuf[17]  = {0};
1276  0307 96            	ldw	x,sp
1277  0308 1c0020        	addw	x,#OFST-24
1278  030b 90ae000c      	ldw	y,#L303_nTmpBuf
1279  030f a611          	ld	a,#17
1280  0311 cd0000        	call	c_xymvx
1282                     ; 289 	u8 *pnBuf = NULL;
1284                     ; 290 	u32 dwMeterVal = 0;
1286  0314 5f            	clrw	x
1287  0315 1f33          	ldw	(OFST-5,sp),x
1288  0317 1f31          	ldw	(OFST-7,sp),x
1289                     ; 312 		u16 Bat_value=0;
1291                     ; 313 		u8 i=0;
1293                     ; 315 		pnBuf = stDataPtrHD.Packet.Buf;
1295  0319 ae0006        	ldw	x,#_stDataPtrHD+6
1296  031c 1f36          	ldw	(OFST-2,sp),x
1297                     ; 316 		stDataPtrHD.Packet.Ctrl[0]=g_HD_Ctrl;
1299  031e 55008c0000    	mov	_stDataPtrHD,_g_HD_Ctrl
1300                     ; 317 		g_HD_Msg_Tag++;
1302  0323 ce008d        	ldw	x,_g_HD_Msg_Tag
1303  0326 5c            	incw	x
1304  0327 cf008d        	ldw	_g_HD_Msg_Tag,x
1305                     ; 318 		stDataPtrHD.Packet.Ctrl[1]=(g_HD_Msg_Tag>>8)&0xff;		//帧流水号     高位在前
1307  032a 55008d0001    	mov	_stDataPtrHD+1,_g_HD_Msg_Tag
1308                     ; 319 		stDataPtrHD.Packet.Ctrl[2]=g_HD_Msg_Tag&0xff;
1310  032f 55008e0002    	mov	_stDataPtrHD+2,_g_HD_Msg_Tag+1
1311                     ; 321 		STM8_RTC_Get(&now_time);
1313  0334 96            	ldw	x,sp
1314  0335 1c0019        	addw	x,#OFST-31
1315  0338 cd0000        	call	_STM8_RTC_Get
1317                     ; 322 		MemcpyFunc(pnBuf,(u8 *)&now_time, 5);							//终端时间：年-月-日-时-分 
1319  033b 4b05          	push	#5
1320  033d 96            	ldw	x,sp
1321  033e 1c001a        	addw	x,#OFST-30
1322  0341 89            	pushw	x
1323  0342 1e39          	ldw	x,(OFST+1,sp)
1324  0344 cd0000        	call	_MemcpyFunc
1326  0347 5b03          	addw	sp,#3
1327                     ; 323 		nOffset += 5;
1329  0349 7b38          	ld	a,(OFST+0,sp)
1330  034b ab05          	add	a,#5
1331  034d 6b38          	ld	(OFST+0,sp),a
1332                     ; 325 		pnBuf[nOffset++]=1;										//报文中的数据条数
1334  034f 0c38          	inc	(OFST+0,sp)
1335  0351 5f            	clrw	x
1336  0352 97            	ld	xl,a
1337  0353 72fb36        	addw	x,(OFST-2,sp)
1338  0356 a601          	ld	a,#1
1339  0358 f7            	ld	(x),a
1340                     ; 327 		pnBuf[nOffset++]=0;										//报文中的数据间隔
1342  0359 7b38          	ld	a,(OFST+0,sp)
1343  035b 0c38          	inc	(OFST+0,sp)
1344  035d 5f            	clrw	x
1345  035e 97            	ld	xl,a
1346  035f 72fb36        	addw	x,(OFST-2,sp)
1347  0362 7f            	clr	(x)
1348                     ; 329 		Bat_value=BAT_GetBatVol();
1350  0363 cd0000        	call	_BAT_GetBatVol
1352  0366 1f17          	ldw	(OFST-33,sp),x
1353                     ; 330 		pnBuf[nOffset++]=(Bat_value>>8)&0xff;					//电池电压，除以100后为电池电压实际数值                   高位在前
1355  0368 7b38          	ld	a,(OFST+0,sp)
1356  036a 0c38          	inc	(OFST+0,sp)
1357  036c 5f            	clrw	x
1358  036d 97            	ld	xl,a
1359  036e 72fb36        	addw	x,(OFST-2,sp)
1360  0371 7b17          	ld	a,(OFST-33,sp)
1361  0373 f7            	ld	(x),a
1362                     ; 331 		pnBuf[nOffset++]=Bat_value&0xff;
1364  0374 7b38          	ld	a,(OFST+0,sp)
1365  0376 0c38          	inc	(OFST+0,sp)
1366  0378 5f            	clrw	x
1367  0379 97            	ld	xl,a
1368  037a 72fb36        	addw	x,(OFST-2,sp)
1369  037d 7b18          	ld	a,(OFST-32,sp)
1370  037f f7            	ld	(x),a
1371                     ; 333 		pnBuf[nOffset++]=(g_HD_Msg_Tag>>8)&0xff;				//帧流水号     高位在前
1373  0380 7b38          	ld	a,(OFST+0,sp)
1374  0382 0c38          	inc	(OFST+0,sp)
1375  0384 5f            	clrw	x
1376  0385 97            	ld	xl,a
1377  0386 72fb36        	addw	x,(OFST-2,sp)
1378  0389 c6008d        	ld	a,_g_HD_Msg_Tag
1379  038c f7            	ld	(x),a
1380                     ; 334 		pnBuf[nOffset++]=g_HD_Msg_Tag&0xff;
1382  038d 7b38          	ld	a,(OFST+0,sp)
1383  038f 0c38          	inc	(OFST+0,sp)
1384  0391 5f            	clrw	x
1385  0392 97            	ld	xl,a
1386  0393 72fb36        	addw	x,(OFST-2,sp)
1387  0396 c6008e        	ld	a,_g_HD_Msg_Tag+1
1388  0399 f7            	ld	(x),a
1389                     ; 336 		pnBuf[nOffset++]=g_nSignal;								//信号强度
1391  039a 7b38          	ld	a,(OFST+0,sp)
1392  039c 0c38          	inc	(OFST+0,sp)
1393  039e 5f            	clrw	x
1394  039f 97            	ld	xl,a
1395  03a0 72fb36        	addw	x,(OFST-2,sp)
1396  03a3 c60000        	ld	a,_g_nSignal
1397  03a6 f7            	ld	(x),a
1398                     ; 338 		pnBuf[nOffset++]=(g_HD_aralm_type>>8)&0xff;				//突发事件类型     高位在前
1400  03a7 7b38          	ld	a,(OFST+0,sp)
1401  03a9 0c38          	inc	(OFST+0,sp)
1402  03ab 5f            	clrw	x
1403  03ac 97            	ld	xl,a
1404  03ad 72fb36        	addw	x,(OFST-2,sp)
1405  03b0 c6008f        	ld	a,_g_HD_aralm_type
1406  03b3 f7            	ld	(x),a
1407                     ; 339 		pnBuf[nOffset++]=g_HD_aralm_type&0xff;
1409  03b4 7b38          	ld	a,(OFST+0,sp)
1410  03b6 0c38          	inc	(OFST+0,sp)
1411  03b8 5f            	clrw	x
1412  03b9 97            	ld	xl,a
1413  03ba 72fb36        	addw	x,(OFST-2,sp)
1414  03bd c60090        	ld	a,_g_HD_aralm_type+1
1415  03c0 f7            	ld	(x),a
1416                     ; 341 		for(i=0;i<6;i++)pnBuf[nOffset++]=0;						//保留字段
1418  03c1 0f35          	clr	(OFST-3,sp)
1419  03c3               L773:
1422  03c3 7b38          	ld	a,(OFST+0,sp)
1423  03c5 0c38          	inc	(OFST+0,sp)
1424  03c7 5f            	clrw	x
1425  03c8 97            	ld	xl,a
1426  03c9 72fb36        	addw	x,(OFST-2,sp)
1427  03cc 7f            	clr	(x)
1430  03cd 0c35          	inc	(OFST-3,sp)
1433  03cf 7b35          	ld	a,(OFST-3,sp)
1434  03d1 a106          	cp	a,#6
1435  03d3 25ee          	jrult	L773
1436                     ; 343 		pnBuf[nOffset++]=0x01;									//通道类型 
1438  03d5 7b38          	ld	a,(OFST+0,sp)
1439  03d7 0c38          	inc	(OFST+0,sp)
1440  03d9 5f            	clrw	x
1441  03da 97            	ld	xl,a
1442  03db 72fb36        	addw	x,(OFST-2,sp)
1443  03de a601          	ld	a,#1
1444  03e0 f7            	ld	(x),a
1445                     ; 344 		pnBuf[nOffset++]=0x01;									//通道号 
1447  03e1 7b38          	ld	a,(OFST+0,sp)
1448  03e3 0c38          	inc	(OFST+0,sp)
1449  03e5 5f            	clrw	x
1450  03e6 97            	ld	xl,a
1451  03e7 72fb36        	addw	x,(OFST-2,sp)
1452  03ea a601          	ld	a,#1
1453  03ec f7            	ld	(x),a
1454                     ; 352 			if(TRUE == ReadDayFreezeRecord(0, (u8*)&stDayFreeze, sizeof(TypeRecordDay)))
1456  03ed 4b07          	push	#7
1457  03ef 96            	ldw	x,sp
1458  03f0 1c0011        	addw	x,#OFST-39
1459  03f3 89            	pushw	x
1460  03f4 4f            	clr	a
1461  03f5 cd0000        	call	_ReadDayFreezeRecord
1463  03f8 5b03          	addw	sp,#3
1464  03fa 4a            	dec	a
1465  03fb 2703cc0489    	jrne	L504
1466                     ; 354 				STM8_RTC_Get(&now_time);
1468  0400 96            	ldw	x,sp
1469  0401 1c0019        	addw	x,#OFST-31
1470  0404 cd0000        	call	_STM8_RTC_Get
1472                     ; 355 				TM_TimeChangeAToB(&now_time, &stTmpTime);
1474  0407 96            	ldw	x,sp
1475  0408 5c            	incw	x
1476  0409 89            	pushw	x
1477  040a 1c0018        	addw	x,#24
1478  040d cd0000        	call	_TM_TimeChangeAToB
1480  0410 85            	popw	x
1481                     ; 356 				TM_RTimeDecnMinute(&stTmpTime, 1440);
1483  0411 ae05a0        	ldw	x,#1440
1484  0414 89            	pushw	x
1485  0415 5f            	clrw	x
1486  0416 89            	pushw	x
1487  0417 96            	ldw	x,sp
1488  0418 1c0005        	addw	x,#OFST-51
1489  041b cd0000        	call	_TM_RTimeDecnMinute
1491  041e 5b04          	addw	sp,#4
1492                     ; 357 				TM_TimeChangeBToA(&stTmpTime, &stYesterDay);
1494  0420 96            	ldw	x,sp
1495  0421 1c0009        	addw	x,#OFST-47
1496  0424 89            	pushw	x
1497  0425 1d0008        	subw	x,#8
1498  0428 cd0000        	call	_TM_TimeChangeBToA
1500  042b 85            	popw	x
1501                     ; 358 				if((stDayFreeze.nYear == stYesterDay.wYear) && 
1501                     ; 359 					(stDayFreeze.nMon == stYesterDay.nMonth) && (stDayFreeze.nDay == stYesterDay.nDay))
1503  042c 7b14          	ld	a,(OFST-36,sp)
1504  042e 1109          	cp	a,(OFST-47,sp)
1505  0430 263e          	jrne	L704
1507  0432 7b15          	ld	a,(OFST-35,sp)
1508  0434 110a          	cp	a,(OFST-46,sp)
1509  0436 2638          	jrne	L704
1511  0438 7b16          	ld	a,(OFST-34,sp)
1512  043a 110b          	cp	a,(OFST-45,sp)
1513  043c 2632          	jrne	L704
1514                     ; 361 					pnBuf[nOffset++]=stDayFreeze.Value&0xff;
1516  043e 7b38          	ld	a,(OFST+0,sp)
1517  0440 0c38          	inc	(OFST+0,sp)
1518  0442 5f            	clrw	x
1519  0443 97            	ld	xl,a
1520  0444 72fb36        	addw	x,(OFST-2,sp)
1521  0447 7b13          	ld	a,(OFST-37,sp)
1522  0449 f7            	ld	(x),a
1523                     ; 362 					pnBuf[nOffset++]=(stDayFreeze.Value>>8)&0xff;
1525  044a 7b38          	ld	a,(OFST+0,sp)
1526  044c 0c38          	inc	(OFST+0,sp)
1527  044e 5f            	clrw	x
1528  044f 97            	ld	xl,a
1529  0450 72fb36        	addw	x,(OFST-2,sp)
1530  0453 7b12          	ld	a,(OFST-38,sp)
1531  0455 f7            	ld	(x),a
1532                     ; 363 					pnBuf[nOffset++]=(stDayFreeze.Value>>16)&0xff;
1534  0456 7b38          	ld	a,(OFST+0,sp)
1535  0458 0c38          	inc	(OFST+0,sp)
1536  045a 5f            	clrw	x
1537  045b 97            	ld	xl,a
1538  045c 72fb36        	addw	x,(OFST-2,sp)
1539  045f 7b11          	ld	a,(OFST-39,sp)
1540  0461 f7            	ld	(x),a
1541                     ; 364 					pnBuf[nOffset++]=(stDayFreeze.Value>>24)&0xff;
1543  0462 7b38          	ld	a,(OFST+0,sp)
1544  0464 0c38          	inc	(OFST+0,sp)
1545  0466 5f            	clrw	x
1546  0467 97            	ld	xl,a
1547  0468 72fb36        	addw	x,(OFST-2,sp)
1548  046b 7b10          	ld	a,(OFST-40,sp)
1549  046d f7            	ld	(x),a
1551  046e 2019          	jra	L504
1552  0470               L704:
1553                     ; 369 					MemsetFunc(&pnBuf[nOffset], 0x00, 4);
1555  0470 4b04          	push	#4
1556  0472 4b00          	push	#0
1557  0474 7b38          	ld	a,(OFST+0,sp)
1558  0476 97            	ld	xl,a
1559  0477 7b39          	ld	a,(OFST+1,sp)
1560  0479 1b3a          	add	a,(OFST+2,sp)
1561  047b 2401          	jrnc	L071
1562  047d 5c            	incw	x
1563  047e               L071:
1564  047e 02            	rlwa	x,a
1565  047f cd0000        	call	_MemsetFunc
1567  0482 85            	popw	x
1568                     ; 370 					nOffset+=4;
1570  0483 7b38          	ld	a,(OFST+0,sp)
1571  0485 ab04          	add	a,#4
1572  0487 6b38          	ld	(OFST+0,sp),a
1573  0489               L504:
1574                     ; 375 			if(FALSE == GM_GetGatherMeterFlg())
1576  0489 cd0000        	call	_GM_GetGatherMeterFlg
1578  048c 4d            	tnz	a
1579  048d 2622          	jrne	L314
1580                     ; 377 				if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
1582  048f 4b0c          	push	#12
1583  0491 ae0000        	ldw	x,#_tyRecord
1584  0494 89            	pushw	x
1585  0495 cd0000        	call	_ReadRecord
1587  0498 5b03          	addw	sp,#3
1588  049a 4a            	dec	a
1589  049b 260b          	jrne	L514
1590                     ; 379 					tyParameter.Value = tyRecord.Value;
1592  049d ce0002        	ldw	x,_tyRecord+2
1593  04a0 cf000a        	ldw	_tyParameter+10,x
1594  04a3 ce0000        	ldw	x,_tyRecord
1596  04a6 2006          	jp	LC002
1597  04a8               L514:
1598                     ; 381 				else tyParameter.Value = INVALID_DATA;
1600  04a8 aeeeee        	ldw	x,#61166
1601  04ab cf000a        	ldw	_tyParameter+10,x
1602  04ae               LC002:
1603  04ae cf0008        	ldw	_tyParameter+8,x
1604  04b1               L314:
1605                     ; 383 			pnBuf[nOffset++]=tyParameter.Value&0xff;
1607  04b1 7b38          	ld	a,(OFST+0,sp)
1608  04b3 0c38          	inc	(OFST+0,sp)
1609  04b5 5f            	clrw	x
1610  04b6 97            	ld	xl,a
1611  04b7 72fb36        	addw	x,(OFST-2,sp)
1612  04ba c6000b        	ld	a,_tyParameter+11
1613  04bd f7            	ld	(x),a
1614                     ; 384 			pnBuf[nOffset++]=(tyParameter.Value>>8)&0xff;
1616  04be 7b38          	ld	a,(OFST+0,sp)
1617  04c0 0c38          	inc	(OFST+0,sp)
1618  04c2 5f            	clrw	x
1619  04c3 97            	ld	xl,a
1620  04c4 72fb36        	addw	x,(OFST-2,sp)
1621  04c7 c6000a        	ld	a,_tyParameter+10
1622  04ca f7            	ld	(x),a
1623                     ; 385 			pnBuf[nOffset++]=(tyParameter.Value>>16)&0xff;
1625  04cb 7b38          	ld	a,(OFST+0,sp)
1626  04cd 0c38          	inc	(OFST+0,sp)
1627  04cf 5f            	clrw	x
1628  04d0 97            	ld	xl,a
1629  04d1 72fb36        	addw	x,(OFST-2,sp)
1630  04d4 c60009        	ld	a,_tyParameter+9
1631  04d7 f7            	ld	(x),a
1632                     ; 386 			pnBuf[nOffset++]=(tyParameter.Value>>24)&0xff;
1634  04d8 7b38          	ld	a,(OFST+0,sp)
1635  04da 0c38          	inc	(OFST+0,sp)
1636  04dc 5f            	clrw	x
1637  04dd 97            	ld	xl,a
1638  04de 72fb36        	addw	x,(OFST-2,sp)
1639  04e1 c60008        	ld	a,_tyParameter+8
1640  04e4 f7            	ld	(x),a
1641                     ; 388 		nSendLen =nOffset;	
1643  04e5 7b38          	ld	a,(OFST+0,sp)
1644  04e7 6b35          	ld	(OFST-3,sp),a
1645                     ; 390 	HD_ProtolSend(nSendLen, COM_1,1);			//只有1组数据
1647  04e9 4b01          	push	#1
1648  04eb ae0001        	ldw	x,#1
1649  04ee 7b36          	ld	a,(OFST-2,sp)
1650  04f0 95            	ld	xh,a
1651  04f1 ad15          	call	_HD_ProtolSend
1653  04f3 84            	pop	a
1654                     ; 393 	if(FALSE == WatitDataSendOk())
1656  04f4 cd0000        	call	_WatitDataSendOk
1658  04f7 4d            	tnz	a
1659                     ; 395 		return FALSE;
1662  04f8 270b          	jreq	L402
1663                     ; 398 	g_dwRepTick = GetSysTemTick();
1665  04fa cd0000        	call	_GetSysTemTick
1667  04fd ae0000        	ldw	x,#_g_dwRepTick
1668  0500 cd0000        	call	c_rtol
1670                     ; 399 	return TRUE;
1672  0503 a601          	ld	a,#1
1674  0505               L402:
1676  0505 5b38          	addw	sp,#56
1677  0507 81            	ret	
1823                     ; 411 s8 HD_ProtolSend(u8 Size, u8 nComChannel,u8 device_info_flag)
1823                     ; 412 {
1824                     	switch	.text
1825  0508               _HD_ProtolSend:
1827  0508 89            	pushw	x
1828  0509 520e          	subw	sp,#14
1829       0000000e      OFST:	set	14
1832                     ; 414 	u16 length = 0;
1834  050b 1e0c          	ldw	x,(OFST-2,sp)
1835                     ; 416 	s8 nFailCnt = 0, nOptRelt = FALSE;
1837  050d 0f03          	clr	(OFST-11,sp)
1840                     ; 418 	if(device_info_flag)length=Size+15+HD_FRAME_OTHER_LEN;
1842  050f 7b13          	ld	a,(OFST+5,sp)
1843  0511 270a          	jreq	L305
1846  0513 4f            	clr	a
1847  0514 97            	ld	xl,a
1848  0515 a618          	ld	a,#24
1849  0517 1b0f          	add	a,(OFST+1,sp)
1850  0519 240a          	jrnc	L212
1852  051b 2007          	jp	LC003
1853  051d               L305:
1854                     ; 419 	else length=Size+HD_FRAME_OTHER_LEN;
1856  051d 97            	ld	xl,a
1857  051e a609          	ld	a,#9
1858  0520 1b0f          	add	a,(OFST+1,sp)
1859  0522 2401          	jrnc	L212
1860  0524               LC003:
1861  0524 5c            	incw	x
1862  0525               L212:
1863  0525 02            	rlwa	x,a
1864  0526 1f0c          	ldw	(OFST-2,sp),x
1865  0528 01            	rrwa	x,a
1866                     ; 422 	if(COM_1 == nComChannel)
1868  0529 7b10          	ld	a,(OFST+2,sp)
1869  052b 4a            	dec	a
1870  052c 2633          	jrne	L705
1872  052e 2027          	jra	L315
1873  0530               L115:
1874                     ; 427 			nOptRelt = M590_TcpSendDatLen(length); //0x0D不算入长度
1876  0530 7b0d          	ld	a,(OFST-1,sp)
1877  0532 cd0000        	call	_M590_TcpSendDatLen
1879  0535 6b0e          	ld	(OFST+0,sp),a
1880                     ; 428 			if(-1 == nOptRelt)
1882  0537 a1ff          	cp	a,#255
1883  0539 260f          	jrne	L715
1884                     ; 430 				stRepFail.wError |= (1<<DATSEND_ERROR);
1886  053b 72100006      	bset	_stRepFail+6,#0
1887                     ; 431 				M590_CloseConnect();
1889  053f cd0000        	call	_M590_CloseConnect
1891                     ; 432 				ucStatusGsm = GSM_SHAKEHAND;
1893  0542 35020000      	mov	_ucStatusGsm,#2
1894                     ; 433 				return -1;
1896  0546 a6ff          	ld	a,#255
1898  0548 200a          	jra	L032
1899  054a               L715:
1900                     ; 435 			if(TRUE == nOptRelt)
1902  054a 4a            	dec	a
1903  054b 260a          	jrne	L315
1904                     ; 437 				break;
1905  054d               L515:
1906                     ; 440 		if(nFailCnt >= 3 )
1908  054d 7b03          	ld	a,(OFST-11,sp)
1909  054f a103          	cp	a,#3
1910  0551 2f0e          	jrslt	L705
1911                     ; 442 			return FALSE;
1913  0553 4f            	clr	a
1915  0554               L032:
1917  0554 5b10          	addw	sp,#16
1918  0556 81            	ret	
1919  0557               L315:
1920                     ; 425 		while(3 > nFailCnt++)
1922  0557 7b03          	ld	a,(OFST-11,sp)
1923  0559 0c03          	inc	(OFST-11,sp)
1924  055b a103          	cp	a,#3
1925  055d 2fd1          	jrslt	L115
1926  055f 20ec          	jra	L515
1927  0561               L705:
1928                     ; 446 	length = Size;		                   
1930  0561 7b0f          	ld	a,(OFST+1,sp)
1931  0563 5f            	clrw	x
1932  0564 97            	ld	xl,a
1933  0565 1f0c          	ldw	(OFST-2,sp),x
1934                     ; 447 	tyProtolHead.Head[0] = Packet_Head_0;				//数据包头
1936  0567 a6a7          	ld	a,#167
1937  0569 6b04          	ld	(OFST-10,sp),a
1938                     ; 448 	tyProtolHead.Head[1] = Packet_Head_1;				//数据包头
1940  056b 6b05          	ld	(OFST-9,sp),a
1941                     ; 449 	tyProtolHead.Addr[0] = Maker_Addr;					//厂商地址
1943  056d a601          	ld	a,#1
1944  056f 6b06          	ld	(OFST-8,sp),a
1945                     ; 450 	tyProtolHead.Addr[1] = (g_HD_device_addr&0xFF);		//设备地址
1947  0571 c60092        	ld	a,_g_HD_device_addr+1
1948  0574 6b07          	ld	(OFST-7,sp),a
1949                     ; 451 	tyProtolHead.Addr[2] = (g_HD_device_addr>>8)&0xFF;	//设备地址
1951  0576 c60091        	ld	a,_g_HD_device_addr
1952  0579 6b08          	ld	(OFST-6,sp),a
1953                     ; 452 	tyProtolHead.Version = Protocol_Version;			//协议版本号
1955  057b a614          	ld	a,#20
1956  057d 6b09          	ld	(OFST-5,sp),a
1957                     ; 454 	Point = aucUartTxBuffer;		//指针指向接收发送缓冲头
1959  057f ae0000        	ldw	x,#_aucUartTxBuffer
1960  0582 1f0a          	ldw	(OFST-4,sp),x
1961                     ; 456 	MemcpyFunc(Point, (u8 *)&tyProtolHead, sizeof(tyProtolHead) );	//复制数据头到缓冲中
1963  0584 4b06          	push	#6
1964  0586 96            	ldw	x,sp
1965  0587 1c0005        	addw	x,#OFST-9
1966  058a 89            	pushw	x
1967  058b 1e0d          	ldw	x,(OFST-1,sp)
1968  058d cd0000        	call	_MemcpyFunc
1970  0590 5b03          	addw	sp,#3
1971                     ; 457 	Point += sizeof(tyProtolHead);									//指针向下
1973  0592 1e0a          	ldw	x,(OFST-4,sp)
1974  0594 1c0006        	addw	x,#6
1975  0597 1f0a          	ldw	(OFST-4,sp),x
1976                     ; 458 	if(device_info_flag)
1978  0599 7b13          	ld	a,(OFST+5,sp)
1979  059b 2718          	jreq	L525
1980                     ; 461 		MemsetFunc(Point,0, 15);
1982  059d 4b0f          	push	#15
1983  059f 4b00          	push	#0
1984  05a1 1e0c          	ldw	x,(OFST-2,sp)
1985  05a3 cd0000        	call	_MemsetFunc
1987  05a6 85            	popw	x
1988                     ; 462 		Point += sizeof(g_Device_Info);										//指针向下
1990  05a7 1e0a          	ldw	x,(OFST-4,sp)
1991  05a9 1c000f        	addw	x,#15
1992  05ac 1f0a          	ldw	(OFST-4,sp),x
1993                     ; 463 		length +=sizeof(g_Device_Info);
1995  05ae 1e0c          	ldw	x,(OFST-2,sp)
1996  05b0 1c000f        	addw	x,#15
1997  05b3 1f0c          	ldw	(OFST-2,sp),x
1998  05b5               L525:
1999                     ; 466 	MemcpyFunc(Point, (u8 *)&stDataPtrHD, Size );
2001  05b5 7b0f          	ld	a,(OFST+1,sp)
2002  05b7 88            	push	a
2003  05b8 ae0000        	ldw	x,#_stDataPtrHD
2004  05bb 89            	pushw	x
2005  05bc 1e0d          	ldw	x,(OFST-1,sp)
2006  05be cd0000        	call	_MemcpyFunc
2008  05c1 5b03          	addw	sp,#3
2009                     ; 467 	Point += Size;	
2011  05c3 7b0f          	ld	a,(OFST+1,sp)
2012  05c5 5f            	clrw	x
2013  05c6 97            	ld	xl,a
2014  05c7 1f01          	ldw	(OFST-13,sp),x
2015  05c9 1e0a          	ldw	x,(OFST-4,sp)
2016  05cb 72fb01        	addw	x,(OFST-13,sp)
2017  05ce 1f0a          	ldw	(OFST-4,sp),x
2018                     ; 468 	length += Size;
2020  05d0 5f            	clrw	x
2021  05d1 97            	ld	xl,a
2022  05d2 1f01          	ldw	(OFST-13,sp),x
2023  05d4 1e0c          	ldw	x,(OFST-2,sp)
2024  05d6 72fb01        	addw	x,(OFST-13,sp)
2025  05d9 1f0c          	ldw	(OFST-2,sp),x
2026                     ; 470 	checksum = 0;					//校验和是累加和
2028  05db 0f03          	clr	(OFST-11,sp)
2029                     ; 471 	for (nX = 0; nX < length; nX++)
2031  05dd 0f0e          	clr	(OFST+0,sp)
2033  05df 200b          	jra	L335
2034  05e1               L725:
2035                     ; 473 		checksum += aucUartTxBuffer[nX];    //计算累加和
2037  05e1 5f            	clrw	x
2038  05e2 97            	ld	xl,a
2039  05e3 7b03          	ld	a,(OFST-11,sp)
2040  05e5 db0000        	add	a,(_aucUartTxBuffer,x)
2041  05e8 6b03          	ld	(OFST-11,sp),a
2042                     ; 471 	for (nX = 0; nX < length; nX++)
2044  05ea 0c0e          	inc	(OFST+0,sp)
2045  05ec               L335:
2048  05ec 7b0e          	ld	a,(OFST+0,sp)
2049  05ee 5f            	clrw	x
2050  05ef 97            	ld	xl,a
2051  05f0 130c          	cpw	x,(OFST-2,sp)
2052  05f2 25ed          	jrult	L725
2053                     ; 475 	Point[length++] = checksum;
2055  05f4 1e0c          	ldw	x,(OFST-2,sp)
2056  05f6 5c            	incw	x
2057  05f7 1f0c          	ldw	(OFST-2,sp),x
2058  05f9 5a            	decw	x
2059  05fa 72fb0a        	addw	x,(OFST-4,sp)
2060                     ; 476 	Point[length++] = Packet_End_0;
2062                     ; 477 	Point[length++] = Packet_End_1;
2064  05fd a60a          	ld	a,#10
2065  05ff f7            	ld	(x),a
2066                     ; 479 	FrameSendFunc(length, nComChannel, Point);
2068  0600 1e0a          	ldw	x,(OFST-4,sp)
2069  0602 89            	pushw	x
2070  0603 7b12          	ld	a,(OFST+4,sp)
2071  0605 97            	ld	xl,a
2072  0606 7b0f          	ld	a,(OFST+1,sp)
2073  0608 95            	ld	xh,a
2074  0609 cd0000        	call	_FrameSendFunc
2076  060c a601          	ld	a,#1
2077  060e 85            	popw	x
2078                     ; 480 	return TRUE;
2081  060f cc0554        	jra	L032
2177                     ; 493 u8 HD_DecodeParameter(u8* pnRxBuf, u8 nRxLen)
2177                     ; 494 {
2178                     	switch	.text
2179  0612               _HD_DecodeParameter:
2181  0612 89            	pushw	x
2182  0613 520e          	subw	sp,#14
2183       0000000e      OFST:	set	14
2186                     ; 495 	u8 *Point = NULL;
2188                     ; 496 	u16 wDataLen = 0, wLen = 0;	
2192  0615 5f            	clrw	x
2193  0616 1f0b          	ldw	(OFST-3,sp),x
2194                     ; 498 	u8 nSendLen = 0;
2196  0618 0f08          	clr	(OFST-6,sp)
2197                     ; 500 	if(NULL == pnRxBuf)
2199  061a 1e0f          	ldw	x,(OFST+1,sp)
2200  061c 2603          	jrne	L106
2201                     ; 502 		return nSendLen;
2203  061e 4f            	clr	a
2205  061f 2020          	jra	L252
2206  0621               L106:
2207                     ; 504     Point = pnRxBuf;
2209  0621 1f0d          	ldw	(OFST-1,sp),x
2211  0623 201f          	jra	L706
2212  0625               L306:
2213                     ; 509 		Point++;
2215  0625 5c            	incw	x
2216  0626 1f0d          	ldw	(OFST-1,sp),x
2217                     ; 510 		wLen++;
2219  0628 1e0b          	ldw	x,(OFST-3,sp)
2220  062a 5c            	incw	x
2221  062b 1f0b          	ldw	(OFST-3,sp),x
2222                     ; 511 		if(nRxLen <= wLen)
2224  062d 7b13          	ld	a,(OFST+5,sp)
2225  062f 5f            	clrw	x
2226  0630 97            	ld	xl,a
2227  0631 130b          	cpw	x,(OFST-3,sp)
2228  0633 220f          	jrugt	L706
2229                     ; 513 		    if(NUMBER_UART_RX <= CheckRevDataLen())
2231  0635 cd0000        	call	_CheckRevDataLen
2233  0638 a1c0          	cp	a,#192
2234  063a 2503          	jrult	LC004
2235                     ; 515 			    goto __UC_Pro_Exit;
2236  063c               L735:
2237                     ; 567 __UC_Pro_Exit:
2237                     ; 568 
2237                     ; 569 	/* add by maronglang clear RxBuf */
2237                     ; 570 	ClearRxBuff();
2239  063c cd0000        	call	_ClearRxBuff
2241                     ; 571 	return nSendLen;
2243  063f               LC004:
2245  063f 7b08          	ld	a,(OFST-6,sp)
2247  0641               L252:
2249  0641 5b10          	addw	sp,#16
2250  0643 81            	ret	
2251                     ; 517 			return nSendLen;
2253  0644               L706:
2254                     ; 507 	while((Packet_Head_0 != *Point)||(Packet_Head_1 != *(Point+1)))
2256  0644 1e0d          	ldw	x,(OFST-1,sp)
2257  0646 f6            	ld	a,(x)
2258  0647 a1a7          	cp	a,#167
2259  0649 26da          	jrne	L306
2261  064b e601          	ld	a,(1,x)
2262  064d a1a7          	cp	a,#167
2263  064f 26d4          	jrne	L306
2264                     ; 521 	if(NUMBER_UART_RX <= CheckRevDataLen())
2266  0651 cd0000        	call	_CheckRevDataLen
2268  0654 a1c0          	cp	a,#192
2269  0656 24e4          	jruge	L735
2270                     ; 523 		goto __UC_Pro_Exit;
2272                     ; 526 	MemcpyFunc((u8 *)&tyProtolHead, Point, sizeof(tyProtolHead));		//复制字符串到缓冲中
2274  0658 4b06          	push	#6
2275  065a 1e0e          	ldw	x,(OFST+0,sp)
2276  065c 89            	pushw	x
2277  065d 96            	ldw	x,sp
2278  065e 1c0005        	addw	x,#OFST-9
2279  0661 cd0000        	call	_MemcpyFunc
2281  0664 5b03          	addw	sp,#3
2282                     ; 527 	Point += sizeof(tyProtolHead);
2284  0666 1e0d          	ldw	x,(OFST-1,sp)
2285  0668 1c0006        	addw	x,#6
2286  066b 1f0d          	ldw	(OFST-1,sp),x
2287                     ; 529 	if( (nRxLen-wLen) > (sizeof(tyProtolHead)+ 9) )//数据包的最小长度，包头结构体+3控制字+2长度+1命令+1校验+2包尾
2289  066d 7b13          	ld	a,(OFST+5,sp)
2290  066f 5f            	clrw	x
2291  0670 97            	ld	xl,a
2292  0671 72f00b        	subw	x,(OFST-3,sp)
2293  0674 a30010        	cpw	x,#16
2294  0677 25c3          	jrult	L735
2295                     ; 531 		u16 msg_len= (u16)*(Point+3)+sizeof(tyProtolHead)+ 8;//计算该消息的总长度 datalen+3控制字+2长度+1校验+2包尾
2297  0679 1e0d          	ldw	x,(OFST-1,sp)
2298  067b e603          	ld	a,(3,x)
2299  067d 5f            	clrw	x
2300  067e 97            	ld	xl,a
2301  067f 1c000e        	addw	x,#14
2302  0682 1f09          	ldw	(OFST-5,sp),x
2303                     ; 532 		if( msg_len <= (nRxLen-wLen) )
2305  0684 7b13          	ld	a,(OFST+5,sp)
2306  0686 5f            	clrw	x
2307  0687 97            	ld	xl,a
2308  0688 72f00b        	subw	x,(OFST-3,sp)
2309  068b 1309          	cpw	x,(OFST-5,sp)
2310  068d 25ad          	jrult	L735
2311                     ; 534 			wDataLen=stDataPtrHD.Packet.Data_Len+8;
2313  068f ce0003        	ldw	x,_stDataPtrHD+3
2314  0692 1c0008        	addw	x,#8
2315  0695 1f09          	ldw	(OFST-5,sp),x
2316                     ; 535 			MemcpyFunc((u8 *)&stDataPtrHD, Point, wDataLen);		//复制字符串到缓冲中
2318  0697 7b0a          	ld	a,(OFST-4,sp)
2319  0699 88            	push	a
2320  069a 1e0e          	ldw	x,(OFST+0,sp)
2321  069c 89            	pushw	x
2322  069d ae0000        	ldw	x,#_stDataPtrHD
2323  06a0 cd0000        	call	_MemcpyFunc
2325  06a3 5b03          	addw	sp,#3
2327                     ; 548 	if( (Packet_End_0!=stDataPtrHD.Buffer[wDataLen-2]) || (Packet_End_1!=stDataPtrHD.Buffer[wDataLen-1]))
2329  06a5 1e09          	ldw	x,(OFST-5,sp)
2330  06a7 1d0002        	subw	x,#2
2331  06aa d60000        	ld	a,(_stDataPtrHD,x)
2332  06ad a10d          	cp	a,#13
2333  06af 268b          	jrne	L735
2335  06b1 1e09          	ldw	x,(OFST-5,sp)
2336  06b3 5a            	decw	x
2337  06b4 d60000        	ld	a,(_stDataPtrHD,x)
2338  06b7 a10a          	cp	a,#10
2339  06b9 2681          	jrne	L735
2340                     ; 554 	if( stDataPtrHD.Buffer[wDataLen-3] != JX_AddSum8Bit(pnRxBuf+wLen, sizeof(tyProtolHead)+wDataLen+3))
2342  06bb 1e09          	ldw	x,(OFST-5,sp)
2343  06bd 1c0009        	addw	x,#9
2344  06c0 89            	pushw	x
2345  06c1 1e11          	ldw	x,(OFST+3,sp)
2346  06c3 72fb0d        	addw	x,(OFST-1,sp)
2347  06c6 cd0000        	call	_JX_AddSum8Bit
2349  06c9 85            	popw	x
2350  06ca 6b01          	ld	(OFST-13,sp),a
2351  06cc 1e09          	ldw	x,(OFST-5,sp)
2352  06ce 1d0003        	subw	x,#3
2353  06d1 d60000        	ld	a,(_stDataPtrHD,x)
2354  06d4 1101          	cp	a,(OFST-13,sp)
2355  06d6 2703cc063c    	jrne	L735
2356                     ; 556 		goto __UC_Pro_Exit;
2358                     ; 565 	nSendLen = HD_ProtolHandle();
2360  06db ad7e          	call	_HD_ProtolHandle
2362  06dd 6b08          	ld	(OFST-6,sp),a
2363  06df cc063c        	jra	L735
2366                     	switch	.const
2367  001d               L736_nAddBuf:
2368  001d 00            	dc.b	0
2369  001e 000000000000  	ds.b	11
2430                     ; 583 u8 HD_AddressComparePro(u8 *pnAddr, u8 nLen)
2430                     ; 584 {		
2431                     	switch	.text
2432  06e2               _HD_AddressComparePro:
2434  06e2 89            	pushw	x
2435  06e3 520e          	subw	sp,#14
2436       0000000e      OFST:	set	14
2439                     ; 585 	u8 nAddBuf[12] = {0};
2441  06e5 96            	ldw	x,sp
2442  06e6 1c0002        	addw	x,#OFST-12
2443  06e9 90ae001d      	ldw	y,#L736_nAddBuf
2444  06ed a60c          	ld	a,#12
2445  06ef cd0000        	call	c_xymvx
2447                     ; 586 	u8 nLoop = 0;
2449  06f2 0f0e          	clr	(OFST+0,sp)
2450                     ; 588 	if(JX_IsAllFillDat(pnAddr, 0, nLen))
2452  06f4 7b13          	ld	a,(OFST+5,sp)
2453  06f6 b703          	ld	c_lreg+3,a
2454  06f8 3f02          	clr	c_lreg+2
2455  06fa 3f01          	clr	c_lreg+1
2456  06fc 3f00          	clr	c_lreg
2457  06fe be02          	ldw	x,c_lreg+2
2458  0700 89            	pushw	x
2459  0701 be00          	ldw	x,c_lreg
2460  0703 89            	pushw	x
2461  0704 4b00          	push	#0
2462  0706 1e14          	ldw	x,(OFST+6,sp)
2463  0708 cd0000        	call	_JX_IsAllFillDat
2465  070b 5b05          	addw	sp,#5
2466  070d 4d            	tnz	a
2467                     ; 590 		return TRUE;
2469  070e 2647          	jrne	L307
2470                     ; 593 	MemcpyFunc(nAddBuf, &tyParameter.Type, nLen);
2472  0710 7b13          	ld	a,(OFST+5,sp)
2473  0712 88            	push	a
2474  0713 ae0000        	ldw	x,#_tyParameter
2475  0716 89            	pushw	x
2476  0717 96            	ldw	x,sp
2477  0718 1c0005        	addw	x,#OFST-9
2478  071b cd0000        	call	_MemcpyFunc
2480  071e 5b03          	addw	sp,#3
2481                     ; 596 	for(nLoop = 0; nLoop < nLen; nLoop++)
2483  0720 0f0e          	clr	(OFST+0,sp)
2485  0722 202b          	jra	L576
2486  0724               L176:
2487                     ; 598 		if(nAddBuf[nLoop] != pnAddr[nLoop])
2489  0724 7b0f          	ld	a,(OFST+1,sp)
2490  0726 97            	ld	xl,a
2491  0727 7b10          	ld	a,(OFST+2,sp)
2492  0729 1b0e          	add	a,(OFST+0,sp)
2493  072b 2401          	jrnc	L262
2494  072d 5c            	incw	x
2495  072e               L262:
2496  072e 02            	rlwa	x,a
2497  072f f6            	ld	a,(x)
2498  0730 6b01          	ld	(OFST-13,sp),a
2499  0732 96            	ldw	x,sp
2500  0733 1c0002        	addw	x,#OFST-12
2501  0736 9f            	ld	a,xl
2502  0737 5e            	swapw	x
2503  0738 1b0e          	add	a,(OFST+0,sp)
2504  073a 2401          	jrnc	L462
2505  073c 5c            	incw	x
2506  073d               L462:
2507  073d 02            	rlwa	x,a
2508  073e f6            	ld	a,(x)
2509  073f 1101          	cp	a,(OFST-13,sp)
2510  0741 270a          	jreq	L107
2511                     ; 600 			break;
2512  0743               L776:
2513                     ; 604 	if(nLen > nLoop)
2515  0743 7b13          	ld	a,(OFST+5,sp)
2516  0745 110e          	cp	a,(OFST+0,sp)
2517  0747 230e          	jrule	L307
2518                     ; 606 		return FALSE;
2520  0749 4f            	clr	a
2522  074a               L662:
2524  074a 5b10          	addw	sp,#16
2525  074c 81            	ret	
2526  074d               L107:
2527                     ; 596 	for(nLoop = 0; nLoop < nLen; nLoop++)
2529  074d 0c0e          	inc	(OFST+0,sp)
2530  074f               L576:
2533  074f 7b0e          	ld	a,(OFST+0,sp)
2534  0751 1113          	cp	a,(OFST+5,sp)
2535  0753 25cf          	jrult	L176
2536  0755 20ec          	jra	L776
2537  0757               L307:
2538                     ; 609 	return TRUE;	
2541  0757 a601          	ld	a,#1
2543  0759 20ef          	jra	L662
2631                     ; 622 u8 HD_ProtolHandle(void)
2631                     ; 623 {
2632                     	switch	.text
2633  075b               _HD_ProtolHandle:
2635  075b 520e          	subw	sp,#14
2636       0000000e      OFST:	set	14
2639                     ; 624 	u8 nSendLen    = 0;
2641  075d 0f0e          	clr	(OFST+0,sp)
2642                     ; 625 	u16 wCommCtrlB = 0;
2644  075f 5f            	clrw	x
2645  0760 1f03          	ldw	(OFST-11,sp),x
2646                     ; 626 	u16 wCommPid   = 0;
2648  0762 1f05          	ldw	(OFST-9,sp),x
2649                     ; 627 	u8  nParaLen   = 0;
2651  0764 0f07          	clr	(OFST-7,sp)
2652                     ; 630 	int32_t dwTimeOffset = 0; 
2654  0766 1f0a          	ldw	(OFST-4,sp),x
2655  0768 1f08          	ldw	(OFST-6,sp),x
2656                     ; 631 	u8 nCmdId  = 0;
2658                     ; 632 	u8 nctrl  = 0;
2660                     ; 634 	nCmdId   = stDataPtrHD.Packet.Cmd;
2662  076a c60005        	ld	a,_stDataPtrHD+5
2663  076d 6b0c          	ld	(OFST-2,sp),a
2664                     ; 635 	nctrl	=  stDataPtrHD.Packet.Ctrl[0];
2666  076f c60000        	ld	a,_stDataPtrHD
2667  0772 6b0d          	ld	(OFST-1,sp),a
2668                     ; 636 	g_HD_Msg_Tag = stDataPtrHD.Packet.Ctrl[1]<<8 | stDataPtrHD.Packet.Ctrl[2]+1;
2670  0774 4f            	clr	a
2671  0775 97            	ld	xl,a
2672  0776 4c            	inc	a
2673  0777 cb0002        	add	a,_stDataPtrHD+2
2674  077a 2401          	jrnc	L272
2675  077c 5c            	incw	x
2676  077d               L272:
2677  077d 02            	rlwa	x,a
2678  077e 1f01          	ldw	(OFST-13,sp),x
2679  0780 c60001        	ld	a,_stDataPtrHD+1
2680  0783 97            	ld	xl,a
2681  0784 7b02          	ld	a,(OFST-12,sp)
2682  0786 01            	rrwa	x,a
2683  0787 1a01          	or	a,(OFST-13,sp)
2684  0789 01            	rrwa	x,a
2685  078a cf008d        	ldw	_g_HD_Msg_Tag,x
2686                     ; 638 	if(nctrl&Flag_Data_Is_Secret) //数据是否被加密
2688  078d 7b0d          	ld	a,(OFST-1,sp)
2689  078f 2a04          	jrpl	L577
2690                     ; 640 		return 0;
2692  0791 4f            	clr	a
2694  0792 cc0844        	jra	L433
2695  0795               L577:
2696                     ; 647 	switch(nCmdId)
2698  0795 7b0c          	ld	a,(OFST-2,sp)
2700                     ; 712 		default:break;
2701  0797 a00f          	sub	a,#15
2702  0799 2730          	jreq	L507
2703  079b a072          	sub	a,#114
2704  079d 2739          	jreq	L707
2705  079f 4a            	dec	a
2706  07a0 273e          	jreq	L117
2707  07a2 a002          	sub	a,#2
2708  07a4 2742          	jreq	L317
2709  07a6 4a            	dec	a
2710  07a7 2751          	jreq	L517
2711  07a9 4a            	dec	a
2712  07aa 2756          	jreq	L717
2713  07ac a003          	sub	a,#3
2714  07ae 275a          	jreq	L127
2715  07b0 a008          	sub	a,#8
2716  07b2 275e          	jreq	L327
2717  07b4 4a            	dec	a
2718  07b5 2763          	jreq	L527
2719  07b7 a002          	sub	a,#2
2720  07b9 2767          	jreq	L727
2721  07bb 4a            	dec	a
2722  07bc 273c          	jreq	L517
2723  07be 4a            	dec	a
2724  07bf 2769          	jreq	L337
2725  07c1 a003          	sub	a,#3
2726  07c3 276d          	jreq	L537
2727  07c5 a007          	sub	a,#7
2728  07c7 2771          	jreq	L737
2729  07c9 2077          	jra	L1001
2730  07cb               L507:
2731                     ; 650 		case HeDa_Cmd_Reply_Upload:
2731                     ; 651 			HeDa_Cmd_Reply_Upload_Handle(stDataPtrHD.Packet.Buf,nctrl);
2733  07cb 7b0d          	ld	a,(OFST-1,sp)
2734  07cd 88            	push	a
2735  07ce ae0006        	ldw	x,#_stDataPtrHD+6
2736  07d1 ad74          	call	_HeDa_Cmd_Reply_Upload_Handle
2738  07d3 84            	pop	a
2739                     ; 652 			nSendLen=0;
2741  07d4 0f0e          	clr	(OFST+0,sp)
2742                     ; 653 			break;
2744  07d6 206a          	jra	L1001
2745  07d8               L707:
2746                     ; 655 		case HeDa_Cmd_Set_Sampling_Interval://设置采样间隔（上行、下行）
2746                     ; 656 			nSendLen=HeDa_Cmd_Set_Sampling_Interval_Handle(stDataPtrHD.Packet.Buf);
2748  07d8 ae0006        	ldw	x,#_stDataPtrHD+6
2749  07db cd08a8        	call	_HeDa_Cmd_Set_Sampling_Interval_Handle
2751                     ; 657 			break;
2753  07de 2060          	jp	LC006
2754  07e0               L117:
2755                     ; 659 		case HeDa_Cmd_Set_Net_Param://设置网络参数（上行、下行）
2755                     ; 660 			nSendLen=HeDa_Cmd_Set_Net_Param_Handle((HD_CmdSetNetParam *)&stDataPtrHD.Packet.Buf);
2757  07e0 ae0006        	ldw	x,#_stDataPtrHD+6
2758  07e3 cd08e3        	call	_HeDa_Cmd_Set_Net_Param_Handle
2760                     ; 661 			break;
2762  07e6 2058          	jp	LC006
2763  07e8               L317:
2764                     ; 663 		case HeDa_Cmd_Set_Report_Cycle://设置上报周期（上行、下行）
2764                     ; 664 			nSendLen==HeDa_Cmd_Set_Report_Cycle_Handle(stDataPtrHD.Packet.Buf);
2766  07e8 ae0006        	ldw	x,#_stDataPtrHD+6
2767  07eb cd0a48        	call	_HeDa_Cmd_Set_Report_Cycle_Handle
2769  07ee 110e          	cp	a,(OFST+0,sp)
2770  07f0 2605          	jrne	L203
2771  07f2 ae0001        	ldw	x,#1
2772  07f5 204b          	jra	L1001
2773  07f7               L203:
2774  07f7 5f            	clrw	x
2775                     ; 665 			break;
2777  07f8 2048          	jra	L1001
2778  07fa               L517:
2779                     ; 667 		case HeDa_Cmd_Set_Pressure_Threshold://设置压力上下限阈值（上行、下行）
2779                     ; 668 			nSendLen=HeDa_Cmd_Get_Pressure_Threshold_Handle(stDataPtrHD.Packet.Buf);
2782  07fa ae0006        	ldw	x,#_stDataPtrHD+6
2783  07fd cd0c9e        	call	_HeDa_Cmd_Get_Pressure_Threshold_Handle
2785                     ; 669 			break;
2787  0800 203e          	jp	LC006
2788  0802               L717:
2789                     ; 671 		case HeDa_Cmd_Set_Secret_Key://设置秘钥（上行、下行）——预留
2789                     ; 672 			nSendLen=HeDa_Cmd_Set_Secret_Key_Handle(stDataPtrHD.Packet.Buf);
2791  0802 ae0006        	ldw	x,#_stDataPtrHD+6
2792  0805 cd0cbd        	call	_HeDa_Cmd_Set_Secret_Key_Handle
2794                     ; 673 			break;
2796  0808 2036          	jp	LC006
2797  080a               L127:
2798                     ; 675 		case HeDa_Cmd_Set_Addr://-------设置表地址    	和达原协议没有，自己添加
2798                     ; 676 			nSendLen=HeDa_Cmd_Get_Addr_Handle(stDataPtrHD.Packet.Buf);
2800  080a ae0006        	ldw	x,#_stDataPtrHD+6
2801  080d cd0d3d        	call	_HeDa_Cmd_Get_Addr_Handle
2803                     ; 677 			break;
2805  0810 202e          	jp	LC006
2806  0812               L327:
2807                     ; 681 		case HeDa_Cmd_Get_Sampling_Interval://查询采样间隔（上行、下行）
2807                     ; 682 			nSendLen=HeDa_Cmd_Get_Sampling_Interval_Handle(stDataPtrHD.Packet.Buf);
2809  0812 ae0006        	ldw	x,#_stDataPtrHD+6
2810  0815 cd08dc        	call	_HeDa_Cmd_Get_Sampling_Interval_Handle
2812                     ; 683 			break;
2814  0818 2026          	jp	LC006
2815  081a               L527:
2816                     ; 685 		case HeDa_Cmd_Get_Net_Param://查询网络参数（上行、下行）
2816                     ; 686 			nSendLen=HeDa_Cmd_Get_Net_Param_Handle(stDataPtrHD.Packet.Buf);
2818  081a ae0006        	ldw	x,#_stDataPtrHD+6
2819  081d cd0a05        	call	_HeDa_Cmd_Get_Net_Param_Handle
2821                     ; 687 			break;
2823  0820 201e          	jp	LC006
2824  0822               L727:
2825                     ; 689 		case HeDa_Cmd_Get_Report_Cycle://查询上报周期（上行、下行）
2825                     ; 690 			nSendLen=HeDa_Cmd_Get_Report_Cycle_Handle(stDataPtrHD.Packet.Buf);
2827  0822 ae0006        	ldw	x,#_stDataPtrHD+6
2828  0825 cd0a9d        	call	_HeDa_Cmd_Get_Report_Cycle_Handle
2830                     ; 691 			break;
2832  0828 2016          	jp	LC006
2833                     ; 693 		case HeDa_Cmd_Get_Pressure_Threshold://查询压力上下限阈值（上行、下行）
2833                     ; 694 			nSendLen=HeDa_Cmd_Get_Pressure_Threshold_Handle(stDataPtrHD.Packet.Buf);
2835                     ; 695 			break;
2837  082a               L337:
2838                     ; 697 		case HeDa_Cmd_Get_Secret_Key://查询秘钥（上行、下行）——预留
2838                     ; 698 			nSendLen=HeDa_Cmd_Get_Secret_Key_Handle(stDataPtrHD.Packet.Buf);
2840  082a ae0006        	ldw	x,#_stDataPtrHD+6
2841  082d cd0ce0        	call	_HeDa_Cmd_Get_Secret_Key_Handle
2843                     ; 699 			break;
2845  0830 200e          	jp	LC006
2846  0832               L537:
2847                     ; 701 		case HeDa_Cmd_Get_Addr://-------查询表地址    	和达原协议没有，自己添加
2847                     ; 702 			nSendLen=HeDa_Cmd_Get_Addr_Handle(stDataPtrHD.Packet.Buf);
2849  0832 ae0006        	ldw	x,#_stDataPtrHD+6
2850  0835 cd0d3d        	call	_HeDa_Cmd_Get_Addr_Handle
2852                     ; 703 			break;
2854  0838 2006          	jp	LC006
2855  083a               L737:
2856                     ; 706 		case HeDa_Cmd_Get_All_Param://获取所有参数（上行、下行）
2856                     ; 707 			nSendLen=HeDa_Cmd_Get_All_Param_Handle(stDataPtrHD.Packet.Buf);
2858  083a ae0006        	ldw	x,#_stDataPtrHD+6
2859  083d cd0d49        	call	_HeDa_Cmd_Get_All_Param_Handle
2861  0840               LC006:
2862  0840 6b0e          	ld	(OFST+0,sp),a
2863                     ; 708 			break;
2865                     ; 709 		case HeDa_Cmd_Get_Appoint_Data://获取指定数据（上行、下行）
2865                     ; 710 			break;
2867                     ; 712 		default:break;
2869  0842               L1001:
2870                     ; 715 	return nSendLen;
2872  0842 7b0e          	ld	a,(OFST+0,sp)
2874  0844               L433:
2876  0844 5b0e          	addw	sp,#14
2877  0846 81            	ret	
3003                     ; 727 void HeDa_Cmd_Reply_Upload_Handle(u8 *pData,u8 ctrl)
3003                     ; 728 {
3004                     	switch	.text
3005  0847               _HeDa_Cmd_Reply_Upload_Handle:
3007  0847 89            	pushw	x
3008  0848 520f          	subw	sp,#15
3009       0000000f      OFST:	set	15
3012                     ; 730 	u8 byte_manage=0;//管理字
3014  084a 0f0f          	clr	(OFST+0,sp)
3015                     ; 733 	if((stDataPtrHD.Packet.Data_Len-1) < 9)//数据域长度不够
3017  084c ce0003        	ldw	x,_stDataPtrHD+3
3018  084f 5a            	decw	x
3019  0850 a30009        	cpw	x,#9
3020  0853 2537          	jrult	L253
3021                     ; 735 		return;
3023                     ; 738 	MemcpyFunc((u8 *)&time_Server, pData, sizeof(TIME_BIN));
3025  0855 4b06          	push	#6
3026  0857 1e11          	ldw	x,(OFST+2,sp)
3027  0859 89            	pushw	x
3028  085a 96            	ldw	x,sp
3029  085b 1c0004        	addw	x,#OFST-11
3030  085e cd0000        	call	_MemcpyFunc
3032  0861 5b03          	addw	sp,#3
3033                     ; 739 	byte_manage = *(pData+6);
3035  0863 1e10          	ldw	x,(OFST+1,sp)
3036  0865 e606          	ld	a,(6,x)
3037  0867 6b0f          	ld	(OFST+0,sp),a
3038                     ; 742 	MemcpyFunc(&stTimeNow.wYear, pData, 6);
3040  0869 4b06          	push	#6
3041  086b 1e11          	ldw	x,(OFST+2,sp)
3042  086d 89            	pushw	x
3043  086e ae0000        	ldw	x,#_stTimeNow
3044  0871 cd0000        	call	_MemcpyFunc
3046  0874 5b03          	addw	sp,#3
3047                     ; 743 	TM_TimeChangeAToB(&stTimeNow, &stEnd);
3049  0876 96            	ldw	x,sp
3050  0877 1c0007        	addw	x,#OFST-8
3051  087a 89            	pushw	x
3052  087b ae0000        	ldw	x,#_stTimeNow
3053  087e cd0000        	call	_TM_TimeChangeAToB
3055  0881 85            	popw	x
3056                     ; 744 	if(FALSE == TM_IsValidTimePro(&stEnd))
3058  0882 96            	ldw	x,sp
3059  0883 1c0007        	addw	x,#OFST-8
3060  0886 cd0000        	call	_TM_IsValidTimePro
3062  0889 4d            	tnz	a
3063  088a 2603          	jrne	L7501
3064                     ; 746 		return;
3065  088c               L253:
3068  088c 5b11          	addw	sp,#17
3069  088e 81            	ret	
3070  088f               L7501:
3071                     ; 748 	STM8_RTC_Set(&stTimeNow);	
3073  088f ae0000        	ldw	x,#_stTimeNow
3074  0892 cd0000        	call	_STM8_RTC_Set
3076                     ; 751 	m_nUploadMode = UP_Free_HD;
3078  0895 35050000      	mov	_m_nUploadMode,#5
3079                     ; 753 	if(ctrl&Flag_Data_Is_Finish)
3081  0899 7b14          	ld	a,(OFST+5,sp)
3082  089b a540          	bcp	a,#64
3083  089d 26ed          	jrne	L253
3085                     ; 759 		if(0xFF == byte_manage)//表示该字段无效
3087  089f 7b0f          	ld	a,(OFST+0,sp)
3088  08a1 4c            	inc	a
3089  08a2 27e8          	jreq	L253
3091                     ; 762 		else if(0x00 == byte_manage)//可以结束本次通讯
3093  08a4 0d0f          	tnz	(OFST+0,sp)
3094                     ; 767 }
3096  08a6 20e4          	jra	L253
3144                     ; 778 u8 HeDa_Cmd_Set_Sampling_Interval_Handle(u8 *pData)
3144                     ; 779 {
3145                     	switch	.text
3146  08a8               _HeDa_Cmd_Set_Sampling_Interval_Handle:
3148  08a8 89            	pushw	x
3149  08a9 88            	push	a
3150       00000001      OFST:	set	1
3153                     ; 781 	if((stDataPtrHD.Packet.Data_Len-1) < 2)//数据域长度不够
3155  08aa ce0003        	ldw	x,_stDataPtrHD+3
3156  08ad 5a            	decw	x
3157  08ae a30002        	cpw	x,#2
3158  08b1 1e02          	ldw	x,(OFST+1,sp)
3159  08b3 240a          	jruge	L3111
3160                     ; 783 		*pData=0x10;	  //设置失败
3162  08b5 a610          	ld	a,#16
3163  08b7 f7            	ld	(x),a
3164                     ; 784 		*(pData+1)=tyReport.wGatherCycle;//终端当前采样间隔，分钟
3166  08b8 c60000        	ld	a,_tyReport
3167  08bb e701          	ld	(1,x),a
3169  08bd 2018          	jra	L5111
3170  08bf               L3111:
3171                     ; 788 		u8 hd_samling_interval=*pData;//采样间隔
3173  08bf f6            	ld	a,(x)
3174  08c0 6b01          	ld	(OFST+0,sp),a
3175                     ; 789 		*pData=0x01;	  //设置成功
3177  08c2 a601          	ld	a,#1
3178  08c4 f7            	ld	(x),a
3179                     ; 790 		*(pData+1)=hd_samling_interval;//终端当前采样间隔，分钟
3181  08c5 7b01          	ld	a,(OFST+0,sp)
3182  08c7 e701          	ld	(1,x),a
3183                     ; 793 		tyReport.wGatherCycle = hd_samling_interval;
3185  08c9 c70000        	ld	_tyReport,a
3186                     ; 794 		SaveParameterForType((u8 *)&tyReport, REPOERCYCLE_LEN, REPORT_PARA);
3188  08cc 4b03          	push	#3
3189  08ce 4b0a          	push	#10
3190  08d0 ae0000        	ldw	x,#_tyReport
3191  08d3 cd0000        	call	_SaveParameterForType
3193  08d6 85            	popw	x
3194  08d7               L5111:
3195                     ; 797 	return 2;
3197  08d7 a602          	ld	a,#2
3200  08d9 5b03          	addw	sp,#3
3201  08db 81            	ret	
3239                     ; 810 u8 HeDa_Cmd_Get_Sampling_Interval_Handle(u8 *pData)
3239                     ; 811 {
3240                     	switch	.text
3241  08dc               _HeDa_Cmd_Get_Sampling_Interval_Handle:
3245                     ; 812 	*pData=tyReport.wGatherCycle;
3247  08dc c60000        	ld	a,_tyReport
3248  08df f7            	ld	(x),a
3249                     ; 813 	return 1;
3251  08e0 a601          	ld	a,#1
3254  08e2 81            	ret	
3371                     ; 826 u8 HeDa_Cmd_Set_Net_Param_Handle(HD_CmdSetNetParam *pData)
3371                     ; 827 {
3372                     	switch	.text
3373  08e3               _HeDa_Cmd_Set_Net_Param_Handle:
3375  08e3 89            	pushw	x
3376  08e4 89            	pushw	x
3377       00000002      OFST:	set	2
3380                     ; 828 	u8 flag_change_response=0;//修改内容结果标志位
3382  08e5 0f02          	clr	(OFST+0,sp)
3383                     ; 830 	if((stDataPtrHD.Packet.Data_Len-1) < sizeof(HD_CmdSetNetParam))//数据域长度不够
3385  08e7 ce0003        	ldw	x,_stDataPtrHD+3
3386  08ea 5a            	decw	x
3387  08eb a3003c        	cpw	x,#60
3388  08ee 2404          	jruge	L5021
3389                     ; 832 		return 0;
3391  08f0 4f            	clr	a
3393  08f1 cc0a02        	jra	L604
3394  08f4               L5021:
3395                     ; 836 	if(pData->flag_change & 0x01)//设置IP地址
3397  08f4 1e03          	ldw	x,(OFST+1,sp)
3398  08f6 f6            	ld	a,(x)
3399  08f7 a501          	bcp	a,#1
3400  08f9 271f          	jreq	L7021
3401                     ; 838 		flag_change_response |=0x01;
3403  08fb 7b02          	ld	a,(OFST+0,sp)
3404  08fd aa01          	or	a,#1
3405  08ff 6b02          	ld	(OFST+0,sp),a
3406                     ; 839 		tyReportParameter.Main_IP=pData->ip_addr;
3408  0901 e604          	ld	a,(4,x)
3409  0903 c70003        	ld	_tyReportParameter+3,a
3410  0906 e603          	ld	a,(3,x)
3411  0908 c70002        	ld	_tyReportParameter+2,a
3412  090b e602          	ld	a,(2,x)
3413  090d c70001        	ld	_tyReportParameter+1,a
3414  0910 e601          	ld	a,(1,x)
3415  0912 c70000        	ld	_tyReportParameter,a
3416                     ; 840 		tyReportParameter.flag_Login_Mode=HD_Login_IP;
3418  0915 35010026      	mov	_tyReportParameter+38,#1
3419  0919 f6            	ld	a,(x)
3420  091a               L7021:
3421                     ; 842 	if(pData->flag_change & 0x04)//设置域名
3423  091a a504          	bcp	a,#4
3424  091c 2726          	jreq	L1121
3425                     ; 844 		if(pData->flag_change & 0x01)//如果设置了IP地址
3427  091e a501          	bcp	a,#1
3428  0920 2708          	jreq	L3121
3429                     ; 846 			flag_change_response |=0x40;
3431  0922 7b02          	ld	a,(OFST+0,sp)
3432  0924 aa40          	or	a,#64
3433  0926 6b02          	ld	(OFST+0,sp),a
3435  0928 201a          	jra	L1121
3436  092a               L3121:
3437                     ; 850 			flag_change_response |=0x04;		
3439  092a 7b02          	ld	a,(OFST+0,sp)
3440  092c aa04          	or	a,#4
3441  092e 6b02          	ld	(OFST+0,sp),a
3442                     ; 851 			MemcpyFunc((u8 *)&tyReportParameter.Main_domain_name, pData->domain_name, 32);
3444  0930 4b20          	push	#32
3445  0932 1e04          	ldw	x,(OFST+2,sp)
3446  0934 1c0007        	addw	x,#7
3447  0937 89            	pushw	x
3448  0938 ae0006        	ldw	x,#_tyReportParameter+6
3449  093b cd0000        	call	_MemcpyFunc
3451  093e 5b03          	addw	sp,#3
3452                     ; 852 			tyReportParameter.flag_Login_Mode=HD_Login_Domain_Name;
3454  0940 35020026      	mov	_tyReportParameter+38,#2
3455  0944               L1121:
3456                     ; 856 	if(pData->flag_change & 0x02)//设置端口号
3458  0944 1e03          	ldw	x,(OFST+1,sp)
3459  0946 f6            	ld	a,(x)
3460  0947 a502          	bcp	a,#2
3461  0949 270e          	jreq	L7121
3462                     ; 858 		flag_change_response |=0x02;
3464  094b 7b02          	ld	a,(OFST+0,sp)
3465  094d aa02          	or	a,#2
3466  094f 6b02          	ld	(OFST+0,sp),a
3467                     ; 859 		tyReportParameter.Main_Port=pData->port;
3469  0951 ee05          	ldw	x,(5,x)
3470  0953 cf0004        	ldw	_tyReportParameter+4,x
3471  0956 1e03          	ldw	x,(OFST+1,sp)
3472  0958 f6            	ld	a,(x)
3473  0959               L7121:
3474                     ; 861 	if(pData->flag_change & 0x08)//设置apn接入点
3476  0959 a508          	bcp	a,#8
3477  095b 2759          	jreq	L1221
3478                     ; 863 		u8 apn_len=0;
3480                     ; 864 		apn_len=HeDa_Get_String_len(pData->apn_point,20);
3482  095d 4b14          	push	#20
3483  095f 1e04          	ldw	x,(OFST+2,sp)
3484  0961 1c0027        	addw	x,#39
3485  0964 cd0000        	call	_HeDa_Get_String_len
3487  0967 5b01          	addw	sp,#1
3488  0969 6b01          	ld	(OFST-1,sp),a
3489                     ; 865 		if(apn_len>18 || apn_len==0)//设置apn失败
3491  096b a113          	cp	a,#19
3492  096d 2404          	jruge	L5221
3494  096f 7b01          	ld	a,(OFST-1,sp)
3495  0971 2608          	jrne	L3221
3496  0973               L5221:
3497                     ; 867 			flag_change_response |=0x80;
3499  0973 7b02          	ld	a,(OFST+0,sp)
3500  0975 aa80          	or	a,#128
3501  0977 6b02          	ld	(OFST+0,sp),a
3503  0979 203b          	jra	L1221
3504  097b               L3221:
3505                     ; 871 			flag_change_response |=0x08;
3507  097b 7b02          	ld	a,(OFST+0,sp)
3508  097d aa08          	or	a,#8
3509  097f 6b02          	ld	(OFST+0,sp),a
3510                     ; 872 			MemsetFunc((u8 *)&g_nApnBuf[1], 0,20-1);
3512  0981 4b13          	push	#19
3513  0983 4b00          	push	#0
3514  0985 ae0001        	ldw	x,#_g_nApnBuf+1
3515  0988 cd0000        	call	_MemsetFunc
3517  098b 85            	popw	x
3518                     ; 873 			MemcpyFunc((u8 *)&g_nApnBuf[1],pData->apn_point,apn_len);
3520  098c 7b01          	ld	a,(OFST-1,sp)
3521  098e 88            	push	a
3522  098f 1e04          	ldw	x,(OFST+2,sp)
3523  0991 1c0027        	addw	x,#39
3524  0994 89            	pushw	x
3525  0995 ae0001        	ldw	x,#_g_nApnBuf+1
3526  0998 cd0000        	call	_MemcpyFunc
3528  099b 5b03          	addw	sp,#3
3529                     ; 874 			JX_StringCat(g_nApnBuf, "\"", 2);
3531  099d 4b02          	push	#2
3532  099f ae005b        	ldw	x,#L1321
3533  09a2 89            	pushw	x
3534  09a3 ae0000        	ldw	x,#_g_nApnBuf
3535  09a6 cd0000        	call	_JX_StringCat
3537  09a9 5b03          	addw	sp,#3
3538                     ; 875 			SaveParameterForType((u8 *)&g_nApnType, APN_LEN, APN_PARA);
3540  09ab 4b02          	push	#2
3541  09ad 4b14          	push	#20
3542  09af ae0000        	ldw	x,#_g_nApnType
3543  09b2 cd0000        	call	_SaveParameterForType
3545  09b5 85            	popw	x
3546  09b6               L1221:
3547                     ; 878 	SaveParameterForType((u8 *)&tyReportParameter, ADDRESS_IPPARA_LEN, IPANDPORT_PARA);
3549  09b6 4b01          	push	#1
3550  09b8 4b27          	push	#39
3551  09ba ae0000        	ldw	x,#_tyReportParameter
3552  09bd cd0000        	call	_SaveParameterForType
3554  09c0 85            	popw	x
3555                     ; 880 	pData->flag_change=flag_change_response;
3557  09c1 7b02          	ld	a,(OFST+0,sp)
3558  09c3 1e03          	ldw	x,(OFST+1,sp)
3559  09c5 f7            	ld	(x),a
3560                     ; 881 	pData->ip_addr=tyReportParameter.Main_IP;
3562  09c6 c60003        	ld	a,_tyReportParameter+3
3563  09c9 e704          	ld	(4,x),a
3564  09cb c60002        	ld	a,_tyReportParameter+2
3565  09ce e703          	ld	(3,x),a
3566  09d0 c60001        	ld	a,_tyReportParameter+1
3567  09d3 e702          	ld	(2,x),a
3568  09d5 c60000        	ld	a,_tyReportParameter
3569  09d8 e701          	ld	(1,x),a
3570                     ; 882 	pData->port=tyReportParameter.Main_Port;
3572  09da 90ce0004      	ldw	y,_tyReportParameter+4
3573  09de ef05          	ldw	(5,x),y
3574                     ; 883 	MemcpyFunc( pData->domain_name,(u8 *)&tyReportParameter.Main_domain_name, 32);
3576  09e0 4b20          	push	#32
3577  09e2 ae0006        	ldw	x,#_tyReportParameter+6
3578  09e5 89            	pushw	x
3579  09e6 1e06          	ldw	x,(OFST+4,sp)
3580  09e8 1c0007        	addw	x,#7
3581  09eb cd0000        	call	_MemcpyFunc
3583  09ee 5b03          	addw	sp,#3
3584                     ; 884 	MemcpyFunc( pData->apn_point, g_nApnBuf,20);
3586  09f0 4b14          	push	#20
3587  09f2 ae0000        	ldw	x,#_g_nApnBuf
3588  09f5 89            	pushw	x
3589  09f6 1e06          	ldw	x,(OFST+4,sp)
3590  09f8 1c0027        	addw	x,#39
3591  09fb cd0000        	call	_MemcpyFunc
3593  09fe 5b03          	addw	sp,#3
3594                     ; 886 	return sizeof(HD_CmdSetNetParam);
3596  0a00 a63c          	ld	a,#60
3598  0a02               L604:
3600  0a02 5b04          	addw	sp,#4
3601  0a04 81            	ret	
3650                     ; 898 u8 HeDa_Cmd_Get_Net_Param_Handle(u8 *pData)
3650                     ; 899 {
3651                     	switch	.text
3652  0a05               _HeDa_Cmd_Get_Net_Param_Handle:
3654  0a05 89            	pushw	x
3655  0a06 523c          	subw	sp,#60
3656       0000003c      OFST:	set	60
3659                     ; 902 	temp.ip_addr=tyReportParameter.Main_IP;
3661  0a08 ce0002        	ldw	x,_tyReportParameter+2
3662  0a0b 1f04          	ldw	(OFST-56,sp),x
3663  0a0d ce0000        	ldw	x,_tyReportParameter
3664  0a10 1f02          	ldw	(OFST-58,sp),x
3665                     ; 903 	temp.port=tyReportParameter.Main_Port;
3667  0a12 ce0004        	ldw	x,_tyReportParameter+4
3668  0a15 1f06          	ldw	(OFST-54,sp),x
3669                     ; 904 	MemcpyFunc((u8 *)&temp.domain_name,(u8 *)&tyReportParameter.Main_domain_name,32);
3671  0a17 4b20          	push	#32
3672  0a19 ae0006        	ldw	x,#_tyReportParameter+6
3673  0a1c 89            	pushw	x
3674  0a1d 96            	ldw	x,sp
3675  0a1e 1c000b        	addw	x,#OFST-49
3676  0a21 cd0000        	call	_MemcpyFunc
3678  0a24 5b03          	addw	sp,#3
3679                     ; 905 	MemcpyFunc((u8 *)&temp.apn_point,g_nApnBuf,20);
3681  0a26 4b14          	push	#20
3682  0a28 ae0000        	ldw	x,#_g_nApnBuf
3683  0a2b 89            	pushw	x
3684  0a2c 96            	ldw	x,sp
3685  0a2d 1c002b        	addw	x,#OFST-17
3686  0a30 cd0000        	call	_MemcpyFunc
3688  0a33 5b03          	addw	sp,#3
3689                     ; 907 	MemcpyFunc(pData,(u8 *)&temp.ip_addr,sizeof(HD_CmdSetNetParam)-1);
3691  0a35 4b3b          	push	#59
3692  0a37 96            	ldw	x,sp
3693  0a38 1c0003        	addw	x,#OFST-57
3694  0a3b 89            	pushw	x
3695  0a3c 1e40          	ldw	x,(OFST+4,sp)
3696  0a3e cd0000        	call	_MemcpyFunc
3698  0a41 5b03          	addw	sp,#3
3699                     ; 908 	return sizeof(HD_CmdSetNetParam)-1;
3701  0a43 a63b          	ld	a,#59
3704  0a45 5b3e          	addw	sp,#62
3705  0a47 81            	ret	
3753                     ; 920 u8 HeDa_Cmd_Set_Report_Cycle_Handle(u8 *pData)
3753                     ; 921 {
3754                     	switch	.text
3755  0a48               _HeDa_Cmd_Set_Report_Cycle_Handle:
3757  0a48 89            	pushw	x
3758  0a49 88            	push	a
3759       00000001      OFST:	set	1
3762                     ; 922 	u8 hd_cycle=0;//上报周期缓存
3764  0a4a 0f01          	clr	(OFST+0,sp)
3765                     ; 924 	if((stDataPtrHD.Packet.Data_Len-1) < 1)//数据域长度不够
3767  0a4c ce0003        	ldw	x,_stDataPtrHD+3
3768  0a4f 5a            	decw	x
3769  0a50 2603          	jrne	L5721
3770                     ; 926 		return 0;
3772  0a52 4f            	clr	a
3774  0a53 2021          	jra	L034
3775  0a55               L5721:
3776                     ; 929 	hd_cycle=*pData;
3778  0a55 1e02          	ldw	x,(OFST+1,sp)
3779  0a57 f6            	ld	a,(x)
3780  0a58 6b01          	ld	(OFST+0,sp),a
3781                     ; 930 	if( (hd_cycle<HeDa_Report_Cycle_Min) || (hd_cycle<HeDa_Report_Cycle_Max))
3783  0a5a a137          	cp	a,#55
3784  0a5c 2504          	jrult	L1031
3786  0a5e a147          	cp	a,#71
3787  0a60 2417          	jruge	L7721
3788  0a62               L1031:
3789                     ; 932 		*pData=0x10;//设置失败
3791  0a62 a610          	ld	a,#16
3792  0a64 f7            	ld	(x),a
3793                     ; 933 		*(pData+1)=HeDa_TypeAddCycle_To_ReportCycleType(tyReport.nIntervalType,tyReport.cycle);
3795  0a65 c60002        	ld	a,_tyReport+2
3796  0a68 97            	ld	xl,a
3797  0a69 c60001        	ld	a,_tyReport+1
3798  0a6c 95            	ld	xh,a
3799  0a6d cd0b4e        	call	_HeDa_TypeAddCycle_To_ReportCycleType
3801  0a70 1e02          	ldw	x,(OFST+1,sp)
3802  0a72 e701          	ld	(1,x),a
3804  0a74               L3031:
3805                     ; 943 	return 2;
3807  0a74 a602          	ld	a,#2
3809  0a76               L034:
3811  0a76 5b03          	addw	sp,#3
3812  0a78 81            	ret	
3813  0a79               L7721:
3814                     ; 937 		*pData=0x01;//设置成功
3816  0a79 a601          	ld	a,#1
3817  0a7b f7            	ld	(x),a
3818                     ; 938 		HeDa_ReportCycleType_To_TypeAddCycle(hd_cycle,&tyReport.nIntervalType,&tyReport.cycle);
3820  0a7c ae0002        	ldw	x,#_tyReport+2
3821  0a7f 89            	pushw	x
3822  0a80 ae0001        	ldw	x,#_tyReport+1
3823  0a83 89            	pushw	x
3824  0a84 7b05          	ld	a,(OFST+4,sp)
3825  0a86 ad28          	call	_HeDa_ReportCycleType_To_TypeAddCycle
3827  0a88 5b04          	addw	sp,#4
3828                     ; 939 		*(pData+1)=hd_cycle;
3830  0a8a 7b01          	ld	a,(OFST+0,sp)
3831  0a8c 1e02          	ldw	x,(OFST+1,sp)
3832  0a8e e701          	ld	(1,x),a
3833                     ; 940 		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);//保存到eeprom中
3835  0a90 4b03          	push	#3
3836  0a92 4b0a          	push	#10
3837  0a94 ae0000        	ldw	x,#_tyReport
3838  0a97 cd0000        	call	_SaveParameterForType
3840  0a9a 85            	popw	x
3841  0a9b 20d7          	jra	L3031
3879                     ; 955 u8 HeDa_Cmd_Get_Report_Cycle_Handle(u8 *pData)
3879                     ; 956 {
3880                     	switch	.text
3881  0a9d               _HeDa_Cmd_Get_Report_Cycle_Handle:
3883  0a9d 89            	pushw	x
3884       00000000      OFST:	set	0
3887                     ; 957 	*pData=HeDa_TypeAddCycle_To_ReportCycleType(tyReport.nIntervalType,tyReport.cycle);;
3889  0a9e c60002        	ld	a,_tyReport+2
3890  0aa1 97            	ld	xl,a
3891  0aa2 c60001        	ld	a,_tyReport+1
3892  0aa5 95            	ld	xh,a
3893  0aa6 cd0b4e        	call	_HeDa_TypeAddCycle_To_ReportCycleType
3895  0aa9 1e01          	ldw	x,(OFST+1,sp)
3896  0aab f7            	ld	(x),a
3897                     ; 958 	return 1;
3900  0aac a601          	ld	a,#1
3903  0aae 85            	popw	x
3904  0aaf 81            	ret	
3957                     ; 970 void HeDa_ReportCycleType_To_TypeAddCycle(u8 Report_Cycle_Type,u8 *Report_Time_Type,u8 *cycle_num)
3957                     ; 971 {
3958                     	switch	.text
3959  0ab0               _HeDa_ReportCycleType_To_TypeAddCycle:
3961  0ab0 88            	push	a
3962       00000000      OFST:	set	0
3965                     ; 972 	switch(Report_Cycle_Type)
3968                     ; 1021 			break;
3969  0ab1 a037          	sub	a,#55
3970  0ab3 2725          	jreq	L3231
3971  0ab5 4a            	dec	a
3972  0ab6 272d          	jreq	L5231
3973  0ab8 4a            	dec	a
3974  0ab9 2735          	jreq	L7231
3975  0abb a007          	sub	a,#7
3976  0abd 273c          	jreq	L1331
3977  0abf 4a            	dec	a
3978  0ac0 2744          	jreq	L3331
3979  0ac2 4a            	dec	a
3980  0ac3 274c          	jreq	L5331
3981  0ac5 4a            	dec	a
3982  0ac6 2753          	jreq	L7331
3983  0ac8 4a            	dec	a
3984  0ac9 275a          	jreq	L1431
3985  0acb 4a            	dec	a
3986  0acc 2761          	jreq	L3431
3987  0ace 4a            	dec	a
3988  0acf 2768          	jreq	L5431
3989  0ad1 4a            	dec	a
3990  0ad2 276f          	jreq	L7431
3991                     ; 1018 		default:
3991                     ; 1019 			*Report_Time_Type=HD_INTERVAL_HOUR;
3993  0ad4 1e04          	ldw	x,(OFST+4,sp)
3994  0ad6 a601          	ld	a,#1
3995                     ; 1020 			*cycle_num=24;
3996                     ; 1021 			break;
3998  0ad8 206c          	jp	LC008
3999  0ada               L3231:
4000                     ; 974 		case HeDa_Report_Cycle_Minute_1:
4000                     ; 975 			*Report_Time_Type=HD_INTERVAL_MIN;
4002  0ada 1e04          	ldw	x,(OFST+4,sp)
4003  0adc a602          	ld	a,#2
4004  0ade f7            	ld	(x),a
4005                     ; 976 			*cycle_num=1;
4007  0adf 1e06          	ldw	x,(OFST+6,sp)
4008  0ae1 a601          	ld	a,#1
4009                     ; 977 			break;
4011  0ae3 2066          	jra	L1041
4012  0ae5               L5231:
4013                     ; 978 		case HeDa_Report_Cycle_Minute_5:
4013                     ; 979 			*Report_Time_Type=HD_INTERVAL_MIN;
4015  0ae5 1e04          	ldw	x,(OFST+4,sp)
4016  0ae7 a602          	ld	a,#2
4017  0ae9 f7            	ld	(x),a
4018                     ; 980 			*cycle_num=5;
4020  0aea 1e06          	ldw	x,(OFST+6,sp)
4021  0aec a605          	ld	a,#5
4022                     ; 981 			break;
4024  0aee 205b          	jra	L1041
4025  0af0               L7231:
4026                     ; 982 		case HeDa_Report_Cycle_Minute_10:
4026                     ; 983 			*Report_Time_Type=HD_INTERVAL_MIN;
4028  0af0 1e04          	ldw	x,(OFST+4,sp)
4029  0af2 a602          	ld	a,#2
4030  0af4 f7            	ld	(x),a
4031                     ; 984 			*cycle_num=10;
4033  0af5 1e06          	ldw	x,(OFST+6,sp)
4034  0af7 a60a          	ld	a,#10
4035                     ; 985 			break;
4037  0af9 2050          	jra	L1041
4038  0afb               L1331:
4039                     ; 986 		case HeDa_Report_Cycle_Minute_15:
4039                     ; 987 			*Report_Time_Type=HD_INTERVAL_MIN;
4041  0afb 1e04          	ldw	x,(OFST+4,sp)
4042  0afd a602          	ld	a,#2
4043  0aff f7            	ld	(x),a
4044                     ; 988 			*cycle_num=15;
4046  0b00 1e06          	ldw	x,(OFST+6,sp)
4047  0b02 a60f          	ld	a,#15
4048                     ; 989 			break;
4050  0b04 2045          	jra	L1041
4051  0b06               L3331:
4052                     ; 990 		case HeDa_Report_Cycle_Minute_30:
4052                     ; 991 			*Report_Time_Type=HD_INTERVAL_MIN;
4054  0b06 1e04          	ldw	x,(OFST+4,sp)
4055  0b08 a602          	ld	a,#2
4056  0b0a f7            	ld	(x),a
4057                     ; 992 			*cycle_num=30;
4059  0b0b 1e06          	ldw	x,(OFST+6,sp)
4060  0b0d a61e          	ld	a,#30
4061                     ; 993 			break;
4063  0b0f 203a          	jra	L1041
4064  0b11               L5331:
4065                     ; 994 		case HeDa_Report_Cycle_Hour_1:
4065                     ; 995 			*Report_Time_Type=HD_INTERVAL_HOUR;
4067  0b11 1e04          	ldw	x,(OFST+4,sp)
4068  0b13 4c            	inc	a
4069  0b14 f7            	ld	(x),a
4070                     ; 996 			*cycle_num=1;
4072  0b15 1e06          	ldw	x,(OFST+6,sp)
4073  0b17 a601          	ld	a,#1
4074                     ; 997 			break;
4076  0b19 2030          	jra	L1041
4077  0b1b               L7331:
4078                     ; 998 		case HeDa_Report_Cycle_Hour_2:
4078                     ; 999 			*Report_Time_Type=HD_INTERVAL_HOUR;
4080  0b1b 1e04          	ldw	x,(OFST+4,sp)
4081  0b1d 4c            	inc	a
4082  0b1e f7            	ld	(x),a
4083                     ; 1000 			*cycle_num=2;
4085  0b1f 1e06          	ldw	x,(OFST+6,sp)
4086  0b21 a602          	ld	a,#2
4087                     ; 1001 			break;
4089  0b23 2026          	jra	L1041
4090  0b25               L1431:
4091                     ; 1002 		case HeDa_Report_Cycle_Hour_4:
4091                     ; 1003 			*Report_Time_Type=HD_INTERVAL_HOUR;
4093  0b25 1e04          	ldw	x,(OFST+4,sp)
4094  0b27 4c            	inc	a
4095  0b28 f7            	ld	(x),a
4096                     ; 1004 			*cycle_num=4;
4098  0b29 1e06          	ldw	x,(OFST+6,sp)
4099  0b2b a604          	ld	a,#4
4100                     ; 1005 			break;
4102  0b2d 201c          	jra	L1041
4103  0b2f               L3431:
4104                     ; 1006 		case HeDa_Report_Cycle_Hour_6:
4104                     ; 1007 			*Report_Time_Type=HD_INTERVAL_HOUR;
4106  0b2f 1e04          	ldw	x,(OFST+4,sp)
4107  0b31 4c            	inc	a
4108  0b32 f7            	ld	(x),a
4109                     ; 1008 			*cycle_num=6;
4111  0b33 1e06          	ldw	x,(OFST+6,sp)
4112  0b35 a606          	ld	a,#6
4113                     ; 1009 			break;
4115  0b37 2012          	jra	L1041
4116  0b39               L5431:
4117                     ; 1010 		case HeDa_Report_Cycle_Hour_12:
4117                     ; 1011 			*Report_Time_Type=HD_INTERVAL_HOUR;
4119  0b39 1e04          	ldw	x,(OFST+4,sp)
4120  0b3b 4c            	inc	a
4121  0b3c f7            	ld	(x),a
4122                     ; 1012 			*cycle_num=12;
4124  0b3d 1e06          	ldw	x,(OFST+6,sp)
4125  0b3f a60c          	ld	a,#12
4126                     ; 1013 			break;
4128  0b41 2008          	jra	L1041
4129  0b43               L7431:
4130                     ; 1014 		case HeDa_Report_Cycle_Hour_24:
4130                     ; 1015 			*Report_Time_Type=HD_INTERVAL_HOUR;
4132  0b43 1e04          	ldw	x,(OFST+4,sp)
4133  0b45 4c            	inc	a
4134                     ; 1016 			*cycle_num=24;
4136  0b46               LC008:
4137  0b46 f7            	ld	(x),a
4139  0b47 1e06          	ldw	x,(OFST+6,sp)
4140  0b49 a618          	ld	a,#24
4141                     ; 1017 			break;
4143  0b4b               L1041:
4144  0b4b f7            	ld	(x),a
4145                     ; 1023 	return;
4148  0b4c 84            	pop	a
4149  0b4d 81            	ret	
4189                     ; 1035 u8 HeDa_TypeAddCycle_To_ReportCycleType(u8 Report_Time_Type,u8 cycle_num)
4189                     ; 1036 {
4190                     	switch	.text
4191  0b4e               _HeDa_TypeAddCycle_To_ReportCycleType:
4193  0b4e 89            	pushw	x
4194       00000000      OFST:	set	0
4197                     ; 1037 	switch(Report_Time_Type)
4199  0b4f 9e            	ld	a,xh
4201                     ; 1064 		default:
4201                     ; 1065 			return HeDa_Report_Cycle_Max;
4202  0b50 4a            	dec	a
4203  0b51 272c          	jreq	L1241
4204  0b53 4a            	dec	a
4205  0b54 2704          	jreq	L3041
4208  0b56 a647          	ld	a,#71
4210  0b58 2013          	jra	L244
4211  0b5a               L3041:
4212                     ; 1041 				switch(cycle_num)
4214  0b5a 7b02          	ld	a,(OFST+2,sp)
4216                     ; 1048 					default:	return HeDa_Report_Cycle_Minute_30;
4217  0b5c 4a            	dec	a
4218  0b5d 2710          	jreq	L5041
4219  0b5f a004          	sub	a,#4
4220  0b61 2710          	jreq	L7041
4221  0b63 a005          	sub	a,#5
4222  0b65 2710          	jreq	L1141
4223  0b67 a005          	sub	a,#5
4224  0b69 2710          	jreq	L3141
4228  0b6b a641          	ld	a,#65
4230  0b6d               L244:
4232  0b6d 85            	popw	x
4233  0b6e 81            	ret	
4234  0b6f               L5041:
4235                     ; 1043 					case	1:	return HeDa_Report_Cycle_Minute_1;
4237  0b6f a637          	ld	a,#55
4239  0b71 20fa          	jra	L244
4240  0b73               L7041:
4241                     ; 1044 					case	5:	return HeDa_Report_Cycle_Minute_5;
4243  0b73 a638          	ld	a,#56
4245  0b75 20f6          	jra	L244
4246  0b77               L1141:
4247                     ; 1045 					case	10:	return HeDa_Report_Cycle_Minute_10;
4249  0b77 a639          	ld	a,#57
4251  0b79 20f2          	jra	L244
4252  0b7b               L3141:
4253                     ; 1046 					case	15:	return HeDa_Report_Cycle_Minute_15;
4255  0b7b a640          	ld	a,#64
4257  0b7d 20ee          	jra	L244
4258                     ; 1047 					case	30:	return HeDa_Report_Cycle_Minute_30;
4260  0b7f               L1241:
4261                     ; 1053 				switch(cycle_num)
4263  0b7f 7b02          	ld	a,(OFST+2,sp)
4265                     ; 1061 					default:	return HeDa_Report_Cycle_Hour_24;
4266  0b81 4a            	dec	a
4267  0b82 2717          	jreq	L3241
4268  0b84 4a            	dec	a
4269  0b85 2718          	jreq	L5241
4270  0b87 a002          	sub	a,#2
4271  0b89 2718          	jreq	L7241
4272  0b8b a002          	sub	a,#2
4273  0b8d 2718          	jreq	L1341
4274  0b8f a006          	sub	a,#6
4275  0b91 2718          	jreq	L3341
4276  0b93 a00c          	sub	a,#12
4277  0b95 2718          	jreq	L5341
4280  0b97 a647          	ld	a,#71
4282  0b99 20d2          	jra	L244
4283  0b9b               L3241:
4284                     ; 1055 					case	1:	return HeDa_Report_Cycle_Hour_1;
4286  0b9b a642          	ld	a,#66
4288  0b9d 20ce          	jra	L244
4289  0b9f               L5241:
4290                     ; 1056 					case	2:	return HeDa_Report_Cycle_Hour_2;
4292  0b9f a643          	ld	a,#67
4294  0ba1 20ca          	jra	L244
4295  0ba3               L7241:
4296                     ; 1057 					case	4:	return HeDa_Report_Cycle_Hour_4;
4298  0ba3 a644          	ld	a,#68
4300  0ba5 20c6          	jra	L244
4301  0ba7               L1341:
4302                     ; 1058 					case	6:	return HeDa_Report_Cycle_Hour_6;
4304  0ba7 a645          	ld	a,#69
4306  0ba9 20c2          	jra	L244
4307  0bab               L3341:
4308                     ; 1059 					case	12:	return HeDa_Report_Cycle_Hour_12;
4310  0bab a646          	ld	a,#70
4312  0bad 20be          	jra	L244
4313  0baf               L5341:
4314                     ; 1060 					case	24:	return HeDa_Report_Cycle_Hour_24;
4316  0baf a647          	ld	a,#71
4318  0bb1 20ba          	jra	L244
4374                     ; 1079 u8 HeDa_Cmd_Set_Pressure_Threshold_Handle(u8 *pData)
4374                     ; 1080 {
4375                     	switch	.text
4376  0bb3               _HeDa_Cmd_Set_Pressure_Threshold_Handle:
4378  0bb3 89            	pushw	x
4379  0bb4 89            	pushw	x
4380       00000002      OFST:	set	2
4383                     ; 1081 	u8 flag_change=0;//修改内容标志位
4385                     ; 1082 	u8 flag_change_response=0;//修改内容结果标志位
4387  0bb5 0f01          	clr	(OFST-1,sp)
4388                     ; 1084 	if((stDataPtrHD.Packet.Data_Len-1) < 25)//数据域长度不够
4390  0bb7 ce0003        	ldw	x,_stDataPtrHD+3
4391  0bba 5a            	decw	x
4392  0bbb a30019        	cpw	x,#25
4393  0bbe 2404          	jruge	L7151
4394                     ; 1086 		return 0;
4396  0bc0 4f            	clr	a
4398  0bc1 cc0c8f        	jra	L454
4399  0bc4               L7151:
4400                     ; 1088 	flag_change=*pData;
4402  0bc4 1e03          	ldw	x,(OFST+1,sp)
4403  0bc6 f6            	ld	a,(x)
4404  0bc7 6b02          	ld	(OFST+0,sp),a
4405                     ; 1090 	if( (flag_change & 0x01) || (flag_change & 0x02)) //压力1上下限一起改
4407  0bc9 a501          	bcp	a,#1
4408  0bcb 2604          	jrne	L3251
4410  0bcd a502          	bcp	a,#2
4411  0bcf 274f          	jreq	L1251
4412  0bd1               L3251:
4413                     ; 1092 		if((flag_change & 0x01) && (flag_change & 0x02))//压力1上下限要一起改
4415  0bd1 a501          	bcp	a,#1
4416  0bd3 2737          	jreq	L5251
4418  0bd5 a502          	bcp	a,#2
4419  0bd7 2733          	jreq	L5251
4420                     ; 1094 			flag_change_response |=0x01;
4422  0bd9 7b01          	ld	a,(OFST-1,sp)
4423                     ; 1095 			flag_change_response |=0x02;
4425  0bdb aa03          	or	a,#3
4426  0bdd 6b01          	ld	(OFST-1,sp),a
4427                     ; 1096 			tyParameter.Pressure1_LimitUp=*(float *)(pData+1);
4429  0bdf e604          	ld	a,(4,x)
4430  0be1 c70014        	ld	_tyParameter+20,a
4431  0be4 e603          	ld	a,(3,x)
4432  0be6 c70013        	ld	_tyParameter+19,a
4433  0be9 e602          	ld	a,(2,x)
4434  0beb c70012        	ld	_tyParameter+18,a
4435  0bee e601          	ld	a,(1,x)
4436  0bf0 c70011        	ld	_tyParameter+17,a
4437                     ; 1097 			tyParameter.Pressure1_LimitDown=*(float *)(pData+5);
4439  0bf3 e608          	ld	a,(8,x)
4440  0bf5 c70018        	ld	_tyParameter+24,a
4441  0bf8 e607          	ld	a,(7,x)
4442  0bfa c70017        	ld	_tyParameter+23,a
4443  0bfd e606          	ld	a,(6,x)
4444  0bff c70016        	ld	_tyParameter+22,a
4445  0c02 e605          	ld	a,(5,x)
4446  0c04 c70015        	ld	_tyParameter+21,a
4447                     ; 1098 			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
4449  0c07 cd0c92        	call	LC012
4451  0c0a 2014          	jra	L1251
4452  0c0c               L5251:
4453                     ; 1100 		else if(flag_change & 0x01)
4455  0c0c a501          	bcp	a,#1
4456  0c0e 2706          	jreq	L1351
4457                     ; 1102 			flag_change_response |=0x10;
4459  0c10 7b01          	ld	a,(OFST-1,sp)
4460  0c12 aa10          	or	a,#16
4462  0c14 2008          	jp	LC010
4463  0c16               L1351:
4464                     ; 1104 		else if(flag_change & 0x02)
4466  0c16 a502          	bcp	a,#2
4467  0c18 2706          	jreq	L1251
4468                     ; 1106 			flag_change_response |=0x20;
4470  0c1a 7b01          	ld	a,(OFST-1,sp)
4471  0c1c aa20          	or	a,#32
4472  0c1e               LC010:
4473  0c1e 6b01          	ld	(OFST-1,sp),a
4474  0c20               L1251:
4475                     ; 1110 	if( (flag_change & 0x04) || (flag_change & 0x08)) //压力2上下限一起改
4477  0c20 7b02          	ld	a,(OFST+0,sp)
4478  0c22 a504          	bcp	a,#4
4479  0c24 2604          	jrne	L1451
4481  0c26 a508          	bcp	a,#8
4482  0c28 2750          	jreq	L7351
4483  0c2a               L1451:
4484                     ; 1112 		if((flag_change & 0x04) && (flag_change & 0x08))//压力2上下限要一起改
4486  0c2a a504          	bcp	a,#4
4487  0c2c 2738          	jreq	L3451
4489  0c2e a508          	bcp	a,#8
4490  0c30 2734          	jreq	L3451
4491                     ; 1114 			flag_change_response |=0x04;
4493  0c32 7b01          	ld	a,(OFST-1,sp)
4494                     ; 1115 			flag_change_response |=0x08;		
4496  0c34 aa0c          	or	a,#12
4497  0c36 6b01          	ld	(OFST-1,sp),a
4498                     ; 1116 			tyParameter.Pressure2_LimitUp=*(float *)(pData+9);
4500  0c38 1e03          	ldw	x,(OFST+1,sp)
4501  0c3a e60c          	ld	a,(12,x)
4502  0c3c c7001c        	ld	_tyParameter+28,a
4503  0c3f e60b          	ld	a,(11,x)
4504  0c41 c7001b        	ld	_tyParameter+27,a
4505  0c44 e60a          	ld	a,(10,x)
4506  0c46 c7001a        	ld	_tyParameter+26,a
4507  0c49 e609          	ld	a,(9,x)
4508  0c4b c70019        	ld	_tyParameter+25,a
4509                     ; 1117 			tyParameter.Pressure2_LimitDown=*(float *)(pData+13);
4511  0c4e e610          	ld	a,(16,x)
4512  0c50 c70020        	ld	_tyParameter+32,a
4513  0c53 e60f          	ld	a,(15,x)
4514  0c55 c7001f        	ld	_tyParameter+31,a
4515  0c58 e60e          	ld	a,(14,x)
4516  0c5a c7001e        	ld	_tyParameter+30,a
4517  0c5d e60d          	ld	a,(13,x)
4518  0c5f c7001d        	ld	_tyParameter+29,a
4519                     ; 1118 			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
4521  0c62 ad2e          	call	LC012
4523  0c64 2014          	jra	L7351
4524  0c66               L3451:
4525                     ; 1120 		else if(flag_change & 0x04)
4527  0c66 a504          	bcp	a,#4
4528  0c68 2706          	jreq	L7451
4529                     ; 1122 			flag_change_response |=0x40;
4531  0c6a 7b01          	ld	a,(OFST-1,sp)
4532  0c6c aa40          	or	a,#64
4534  0c6e 2008          	jp	LC011
4535  0c70               L7451:
4536                     ; 1124 		else if(flag_change & 0x08)
4538  0c70 a508          	bcp	a,#8
4539  0c72 2706          	jreq	L7351
4540                     ; 1126 			flag_change_response |=0x80;
4542  0c74 7b01          	ld	a,(OFST-1,sp)
4543  0c76 aa80          	or	a,#128
4544  0c78               LC011:
4545  0c78 6b01          	ld	(OFST-1,sp),a
4546  0c7a               L7351:
4547                     ; 1131 	*pData=flag_change_response;
4549  0c7a 7b01          	ld	a,(OFST-1,sp)
4550  0c7c 1e03          	ldw	x,(OFST+1,sp)
4551  0c7e f7            	ld	(x),a
4552                     ; 1132 	MemcpyFunc(pData+1, (u8 *)&tyParameter.Pressure1_LimitUp, 16);
4554  0c7f 4b10          	push	#16
4555  0c81 ae0011        	ldw	x,#_tyParameter+17
4556  0c84 89            	pushw	x
4557  0c85 1e06          	ldw	x,(OFST+4,sp)
4558  0c87 5c            	incw	x
4559  0c88 cd0000        	call	_MemcpyFunc
4561  0c8b 5b03          	addw	sp,#3
4562                     ; 1134 	return 25;
4564  0c8d a619          	ld	a,#25
4566  0c8f               L454:
4568  0c8f 5b04          	addw	sp,#4
4569  0c91 81            	ret	
4571  0c92               LC012:
4572  0c92 4b04          	push	#4
4573  0c94 4b21          	push	#33
4574  0c96 ae0000        	ldw	x,#_tyParameter
4575  0c99 cd0000        	call	_SaveParameterForType
4577  0c9c 85            	popw	x
4578  0c9d 81            	ret	
4617                     ; 1146 u8 HeDa_Cmd_Get_Pressure_Threshold_Handle(u8 *pData)
4617                     ; 1147 {
4618                     	switch	.text
4619  0c9e               _HeDa_Cmd_Get_Pressure_Threshold_Handle:
4621  0c9e 89            	pushw	x
4622       00000000      OFST:	set	0
4625                     ; 1148 	MemcpyFunc(pData, (u8 *)&tyParameter.Pressure1_LimitUp, 16);
4627  0c9f 4b10          	push	#16
4628  0ca1 ae0011        	ldw	x,#_tyParameter+17
4629  0ca4 89            	pushw	x
4630  0ca5 1e04          	ldw	x,(OFST+4,sp)
4631  0ca7 cd0000        	call	_MemcpyFunc
4633  0caa 5b03          	addw	sp,#3
4634                     ; 1149 	MemsetFunc(pData+16, 0, 8);
4636  0cac 4b08          	push	#8
4637  0cae 4b00          	push	#0
4638  0cb0 1e03          	ldw	x,(OFST+3,sp)
4639  0cb2 1c0010        	addw	x,#16
4640  0cb5 cd0000        	call	_MemsetFunc
4642  0cb8 a618          	ld	a,#24
4643  0cba 85            	popw	x
4644                     ; 1150 	return 24;
4648  0cbb 85            	popw	x
4649  0cbc 81            	ret	
4687                     ; 1162 u8 HeDa_Cmd_Set_Secret_Key_Handle(u8 *pData)
4687                     ; 1163 {
4688                     	switch	.text
4689  0cbd               _HeDa_Cmd_Set_Secret_Key_Handle:
4691  0cbd 89            	pushw	x
4692       00000000      OFST:	set	0
4695                     ; 1164 	if((stDataPtrHD.Packet.Data_Len-1) < 16)//数据域长度不够
4697  0cbe ce0003        	ldw	x,_stDataPtrHD+3
4698  0cc1 5a            	decw	x
4699  0cc2 a30010        	cpw	x,#16
4700  0cc5 2403          	jruge	L1161
4701                     ; 1166 		return 0;
4703  0cc7 4f            	clr	a
4705  0cc8 2014          	jra	L074
4706  0cca               L1161:
4707                     ; 1169 	*pData=0x01;
4709  0cca 1e01          	ldw	x,(OFST+1,sp)
4710  0ccc a601          	ld	a,#1
4711  0cce f7            	ld	(x),a
4712                     ; 1170 	MemcpyFunc(pData+1, pData, 16);
4714  0ccf 4b10          	push	#16
4715  0cd1 1e02          	ldw	x,(OFST+2,sp)
4716  0cd3 89            	pushw	x
4717  0cd4 1e04          	ldw	x,(OFST+4,sp)
4718  0cd6 5c            	incw	x
4719  0cd7 cd0000        	call	_MemcpyFunc
4721  0cda 5b03          	addw	sp,#3
4722                     ; 1171 	return 17;
4724  0cdc a611          	ld	a,#17
4726  0cde               L074:
4728  0cde 85            	popw	x
4729  0cdf 81            	ret	
4766                     ; 1183 u8 HeDa_Cmd_Get_Secret_Key_Handle(u8 *pData)
4766                     ; 1184 {
4767                     	switch	.text
4768  0ce0               _HeDa_Cmd_Get_Secret_Key_Handle:
4772                     ; 1185 	MemsetFunc(pData, 0, 16);
4774  0ce0 4b10          	push	#16
4775  0ce2 4b00          	push	#0
4776  0ce4 cd0000        	call	_MemsetFunc
4778  0ce7 a610          	ld	a,#16
4779  0ce9 85            	popw	x
4780                     ; 1186 	return 16;
4784  0cea 81            	ret	
4787                     	switch	.const
4788  0029               L1361_meter_addr:
4789  0029 00            	dc.b	0
4790  002a 00            	ds.b	1
4836                     ; 1198 u8 HeDa_Cmd_Set_Addr_Handle(u8 *pData)
4836                     ; 1199 {
4837                     	switch	.text
4838  0ceb               _HeDa_Cmd_Set_Addr_Handle:
4840  0ceb 89            	pushw	x
4841  0cec 89            	pushw	x
4842       00000002      OFST:	set	2
4845                     ; 1200 	u8 meter_addr[2]={0};//表地址缓存
4847  0ced c60029        	ld	a,L1361_meter_addr
4848  0cf0 6b01          	ld	(OFST-1,sp),a
4849  0cf2 c6002a        	ld	a,L1361_meter_addr+1
4850  0cf5 6b02          	ld	(OFST+0,sp),a
4851                     ; 1202 	if((stDataPtrHD.Packet.Data_Len-1) < 2)//数据域长度不够
4853  0cf7 ce0003        	ldw	x,_stDataPtrHD+3
4854  0cfa 5a            	decw	x
4855  0cfb a30002        	cpw	x,#2
4856  0cfe 2403          	jruge	L5561
4857                     ; 1204 		return 0;
4859  0d00 4f            	clr	a
4861  0d01 2037          	jra	L005
4862  0d03               L5561:
4863                     ; 1206 	meter_addr[0]=*pData;
4865  0d03 1e03          	ldw	x,(OFST+1,sp)
4866  0d05 f6            	ld	a,(x)
4867  0d06 6b01          	ld	(OFST-1,sp),a
4868                     ; 1207 	meter_addr[1]=*(pData+1);
4870  0d08 e601          	ld	a,(1,x)
4871  0d0a 6b02          	ld	(OFST+0,sp),a
4872                     ; 1210 	if((meter_addr[0]==0 && meter_addr[1]==0) || (meter_addr[0]==0xff && meter_addr[1]==0xff))
4874  0d0c 7b01          	ld	a,(OFST-1,sp)
4875  0d0e 2604          	jrne	L3661
4877  0d10 0d02          	tnz	(OFST+0,sp)
4878  0d12 2708          	jreq	L1661
4879  0d14               L3661:
4881  0d14 4c            	inc	a
4882  0d15 2614          	jrne	L7561
4884  0d17 7b02          	ld	a,(OFST+0,sp)
4885  0d19 4c            	inc	a
4886  0d1a 260f          	jrne	L7561
4887  0d1c               L1661:
4888                     ; 1212 		*pData=0x10;//设置失败
4890  0d1c a610          	ld	a,#16
4891  0d1e f7            	ld	(x),a
4892                     ; 1213 		*(pData+1)=tyParameter.Address[0];
4894  0d1f c60001        	ld	a,_tyParameter+1
4895  0d22 e701          	ld	(1,x),a
4896                     ; 1214 		*(pData+2)=tyParameter.Address[1];
4898  0d24 c60002        	ld	a,_tyParameter+2
4899  0d27 e702          	ld	(2,x),a
4901  0d29 200d          	jra	L5661
4902  0d2b               L7561:
4903                     ; 1218 		*pData=0x01;//设置成功
4905  0d2b a601          	ld	a,#1
4906  0d2d f7            	ld	(x),a
4907                     ; 1219 		tyParameter.Address[0]=meter_addr[0];
4909  0d2e 7b01          	ld	a,(OFST-1,sp)
4910  0d30 c70001        	ld	_tyParameter+1,a
4911                     ; 1220 		tyParameter.Address[1]=meter_addr[1];
4913  0d33 7b02          	ld	a,(OFST+0,sp)
4914  0d35 c70002        	ld	_tyParameter+2,a
4915  0d38               L5661:
4916                     ; 1222 	return 3;
4918  0d38 a603          	ld	a,#3
4920  0d3a               L005:
4922  0d3a 5b04          	addw	sp,#4
4923  0d3c 81            	ret	
4960                     ; 1234 u8 HeDa_Cmd_Get_Addr_Handle(u8 *pData)
4960                     ; 1235 {
4961                     	switch	.text
4962  0d3d               _HeDa_Cmd_Get_Addr_Handle:
4966                     ; 1236 	*pData=tyParameter.Address[0];
4968  0d3d c60001        	ld	a,_tyParameter+1
4969  0d40 f7            	ld	(x),a
4970                     ; 1237 	*(pData+1)=tyParameter.Address[1];
4972  0d41 c60002        	ld	a,_tyParameter+2
4973  0d44 e701          	ld	(1,x),a
4974                     ; 1238 	return 2;
4976  0d46 a602          	ld	a,#2
4979  0d48 81            	ret	
5015                     ; 1250 u8 HeDa_Cmd_Get_All_Param_Handle(u8 *pData)
5015                     ; 1251 {
5016                     	switch	.text
5017  0d49               _HeDa_Cmd_Get_All_Param_Handle:
5021                     ; 1252 	return 0;
5023  0d49 4f            	clr	a
5026  0d4a 81            	ret	
5062                     ; 1264 u8 HeDa_Cmd_Get_Appoint_Data_Handle(u8 *pData)
5062                     ; 1265 {
5063                     	switch	.text
5064  0d4b               _HeDa_Cmd_Get_Appoint_Data_Handle:
5068                     ; 1266 	return 0;
5070  0d4b 4f            	clr	a
5073  0d4c 81            	ret	
5076                     	switch	.const
5077  002b               L1471_nIPstr:
5078  002b 00            	dc.b	0
5079  002c 000000000000  	ds.b	31
5080  004b               L3471_nPort:
5081  004b 00            	dc.b	0
5082  004c 0000000000    	ds.b	5
5083  0051               L5471_nBuf:
5084  0051 00            	dc.b	0
5085  0052 000000000000  	ds.b	9
5174                     ; 1278 void HD_InitializeGsm(void)
5174                     ; 1279 {
5175                     	switch	.text
5176  0d4d               _HD_InitializeGsm:
5178  0d4d 5239          	subw	sp,#57
5179       00000039      OFST:	set	57
5182                     ; 1280 	char nIPstr[32] = {0};
5184  0d4f 96            	ldw	x,sp
5185  0d50 1c0010        	addw	x,#OFST-41
5186  0d53 90ae002b      	ldw	y,#L1471_nIPstr
5187  0d57 a620          	ld	a,#32
5188  0d59 cd0000        	call	c_xymvx
5190                     ; 1281 	u8 nPort[6]     = {0};
5192  0d5c 96            	ldw	x,sp
5193  0d5d 1c0003        	addw	x,#OFST-54
5194  0d60 90ae004b      	ldw	y,#L3471_nPort
5195  0d64 a606          	ld	a,#6
5196  0d66 cd0000        	call	c_xymvx
5198                     ; 1282 	u16 dwPortNum = 0;
5200  0d69 5f            	clrw	x
5201  0d6a 1f01          	ldw	(OFST-56,sp),x
5202                     ; 1284 	u8 nBuf[10]     = {0};
5204  0d6c 96            	ldw	x,sp
5205  0d6d 1c0030        	addw	x,#OFST-9
5206  0d70 90ae0051      	ldw	y,#L5471_nBuf
5207  0d74 a60a          	ld	a,#10
5208  0d76 cd0000        	call	c_xymvx
5210                     ; 1286 	MemsetFunc(nPort, 0, sizeof(nPort));
5212  0d79 4b06          	push	#6
5213  0d7b 4b00          	push	#0
5214  0d7d 96            	ldw	x,sp
5215  0d7e 1c0005        	addw	x,#OFST-52
5216  0d81 cd0000        	call	_MemsetFunc
5218  0d84 85            	popw	x
5219                     ; 1287 	MemsetFunc(nIPstr, 0, sizeof(nIPstr));	
5221  0d85 4b20          	push	#32
5222  0d87 4b00          	push	#0
5223  0d89 96            	ldw	x,sp
5224  0d8a 1c0012        	addw	x,#OFST-39
5225  0d8d cd0000        	call	_MemsetFunc
5227  0d90 a604          	ld	a,#4
5228  0d92 85            	popw	x
5229                     ; 1288 	SetLogonMode(UP_Upload_HD);
5231  0d93 cd0000        	call	_SetLogonMode
5233                     ; 1291 	if(TRUE == ReadParameterForType((u8 *)&tyReportParameter, sizeof(tyReportParameter), IPANDPORT_PARA))
5235  0d96 4b01          	push	#1
5236  0d98 4b27          	push	#39
5237  0d9a ae0000        	ldw	x,#_tyReportParameter
5238  0d9d cd0000        	call	_ReadParameterForType
5240  0da0 4a            	dec	a
5241  0da1 85            	popw	x
5242  0da2 2703cc0e5b    	jrne	L3002
5243                     ; 1293 		if(tyReportParameter.flag_Login_Mode==HD_Login_IP)//ip地址上报
5245  0da7 c60026        	ld	a,_tyReportParameter+38
5246  0daa 4a            	dec	a
5247  0dab 260e          	jrne	L5002
5248                     ; 1295 			JX_IpAddrToStr(nIPstr, (u8*)&tyReportParameter.Main_IP);
5250  0dad ae0000        	ldw	x,#_tyReportParameter
5251  0db0 89            	pushw	x
5252  0db1 96            	ldw	x,sp
5253  0db2 1c0012        	addw	x,#OFST-39
5254  0db5 cd0000        	call	_JX_IpAddrToStr
5256  0db8 85            	popw	x
5258  0db9 2016          	jra	L7002
5259  0dbb               L5002:
5260                     ; 1297 		else if(tyReportParameter.flag_Login_Mode==HD_Login_Domain_Name)//域名上报
5262  0dbb c60026        	ld	a,_tyReportParameter+38
5263  0dbe a102          	cp	a,#2
5264  0dc0 260f          	jrne	L7002
5265                     ; 1299 			MemcpyFunc(nIPstr, (u8*)&tyReportParameter.Main_domain_name, 32);
5267  0dc2 4b20          	push	#32
5268  0dc4 ae0006        	ldw	x,#_tyReportParameter+6
5269  0dc7 89            	pushw	x
5270  0dc8 96            	ldw	x,sp
5271  0dc9 1c0013        	addw	x,#OFST-38
5272  0dcc cd0000        	call	_MemcpyFunc
5274  0dcf 5b03          	addw	sp,#3
5275  0dd1               L7002:
5276                     ; 1302 		MemcpyFunc((u8*)&dwPortNum, (u8*)&tyReportParameter.Main_Port, 2);
5278  0dd1 4b02          	push	#2
5279  0dd3 ae0004        	ldw	x,#_tyReportParameter+4
5280  0dd6 89            	pushw	x
5281  0dd7 96            	ldw	x,sp
5282  0dd8 1c0004        	addw	x,#OFST-53
5283  0ddb cd0000        	call	_MemcpyFunc
5285  0dde 5b03          	addw	sp,#3
5286                     ; 1303 		JX_BL_Change(2, (u8*)&dwPortNum);
5288  0de0 96            	ldw	x,sp
5289  0de1 5c            	incw	x
5290  0de2 89            	pushw	x
5291  0de3 ae0002        	ldw	x,#2
5292  0de6 cd0000        	call	_JX_BL_Change
5294  0de9 85            	popw	x
5295                     ; 1304 		JX_U32ToStr(dwPortNum, nPort);
5297  0dea 96            	ldw	x,sp
5298  0deb 1c0003        	addw	x,#OFST-54
5299  0dee 89            	pushw	x
5300  0def 1e03          	ldw	x,(OFST-54,sp)
5301  0df1 cd0000        	call	c_uitolx
5303  0df4 be02          	ldw	x,c_lreg+2
5304  0df6 89            	pushw	x
5305  0df7 be00          	ldw	x,c_lreg
5306  0df9 89            	pushw	x
5307  0dfa cd0000        	call	_JX_U32ToStr
5309  0dfd 5b06          	addw	sp,#6
5310                     ; 1305 		MemsetFunc(&aucAtPServer1[1], 0, sizeof(aucAtPServer1)-1);
5312  0dff 4b13          	push	#19
5313  0e01 4b00          	push	#0
5314  0e03 ae0001        	ldw	x,#_aucAtPServer1+1
5315  0e06 cd0000        	call	_MemsetFunc
5317  0e09 85            	popw	x
5318                     ; 1306 		MemsetFunc(&aucAtPPort1[1], 0, sizeof(aucAtPPort1)-1);
5320  0e0a 4b07          	push	#7
5321  0e0c 4b00          	push	#0
5322  0e0e ae0001        	ldw	x,#_aucAtPPort1+1
5323  0e11 cd0000        	call	_MemsetFunc
5325  0e14 85            	popw	x
5326                     ; 1308 		MemcpyFunc((u8*)&aucAtPServer1[1], nIPstr, JX_Strlen(nIPstr));
5328  0e15 96            	ldw	x,sp
5329  0e16 1c0010        	addw	x,#OFST-41
5330  0e19 cd0000        	call	_JX_Strlen
5332  0e1c 88            	push	a
5333  0e1d 96            	ldw	x,sp
5334  0e1e 1c0011        	addw	x,#OFST-40
5335  0e21 89            	pushw	x
5336  0e22 ae0001        	ldw	x,#_aucAtPServer1+1
5337  0e25 cd0000        	call	_MemcpyFunc
5339  0e28 5b03          	addw	sp,#3
5340                     ; 1309 		JX_StringCat(aucAtPServer1,"\"", 2);
5342  0e2a 4b02          	push	#2
5343  0e2c ae005b        	ldw	x,#L1321
5344  0e2f 89            	pushw	x
5345  0e30 ae0000        	ldw	x,#_aucAtPServer1
5346  0e33 cd0000        	call	_JX_StringCat
5348  0e36 5b03          	addw	sp,#3
5349                     ; 1310 		MemcpyFunc((u8*)&aucAtPPort1[1], nPort, JX_Strlen(nPort));
5351  0e38 96            	ldw	x,sp
5352  0e39 1c0003        	addw	x,#OFST-54
5353  0e3c cd0000        	call	_JX_Strlen
5355  0e3f 88            	push	a
5356  0e40 96            	ldw	x,sp
5357  0e41 1c0004        	addw	x,#OFST-53
5358  0e44 89            	pushw	x
5359  0e45 ae0001        	ldw	x,#_aucAtPPort1+1
5360  0e48 cd0000        	call	_MemcpyFunc
5362  0e4b 5b03          	addw	sp,#3
5363                     ; 1311 		JX_StringCat(aucAtPPort1,"\"", 2);
5365  0e4d 4b02          	push	#2
5366  0e4f ae005b        	ldw	x,#L1321
5367  0e52 89            	pushw	x
5368  0e53 ae0000        	ldw	x,#_aucAtPPort1
5369  0e56 cd0000        	call	_JX_StringCat
5371  0e59 5b03          	addw	sp,#3
5372  0e5b               L3002:
5373                     ; 1315 	if(TRUE == ReadParameterForType(&g_nApnBuf[1], APN_LEN-1, APN_PARA))
5375  0e5b 4b02          	push	#2
5376  0e5d 4b13          	push	#19
5377  0e5f ae0001        	ldw	x,#_g_nApnBuf+1
5378  0e62 cd0000        	call	_ReadParameterForType
5380  0e65 4a            	dec	a
5381  0e66 85            	popw	x
5382  0e67 260e          	jrne	L3102
5383                     ; 1317 		JX_StringCat(g_nApnBuf, "\"", 2);
5385  0e69 4b02          	push	#2
5386  0e6b ae005b        	ldw	x,#L1321
5387  0e6e 89            	pushw	x
5388  0e6f ae0000        	ldw	x,#_g_nApnBuf
5389  0e72 cd0000        	call	_JX_StringCat
5391  0e75 5b03          	addw	sp,#3
5392  0e77               L3102:
5393                     ; 1321 	if(FALSE == ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA))
5395  0e77 4b03          	push	#3
5396  0e79 4b0a          	push	#10
5397  0e7b ae0000        	ldw	x,#_tyReport
5398  0e7e cd0000        	call	_ReadParameterForType
5400  0e81 4d            	tnz	a
5401  0e82 85            	popw	x
5402  0e83 262e          	jrne	L5102
5403                     ; 1323 		tyReport.nIntervalType=HD_INTERVAL_HOUR;//默认上报类型按小时计算
5405  0e85 35010001      	mov	_tyReport+1,#1
5406                     ; 1324 		tyReport.cycle 	= 24;	 				//默认24小时上报一次	
5408  0e89 35180002      	mov	_tyReport+2,#24
5409                     ; 1325 		tyReport.wGatherCycle = 60; 			//默认采样间隔60分钟,即抄表间隔
5411  0e8d 353c0000      	mov	_tyReport,#60
5412                     ; 1327 		tyReport.Time.Byte.Year = 0x15;//默认上报时间
5414  0e91 35150009      	mov	_tyReport+9,#21
5415                     ; 1328 		tyReport.Time.Byte.Month = 0x12;
5417  0e95 35120008      	mov	_tyReport+8,#18
5418                     ; 1329 		tyReport.Time.Byte.Day = 0x28;
5420  0e99 35280007      	mov	_tyReport+7,#40
5421                     ; 1330 		tyReport.Time.Byte.Hour = 0x00;
5423  0e9d 725f0006      	clr	_tyReport+6
5424                     ; 1331 		tyReport.Time.Byte.Minute= 0x00;
5426  0ea1 725f0005      	clr	_tyReport+5
5427                     ; 1332 		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);		
5429  0ea5 4b03          	push	#3
5430  0ea7 4b0a          	push	#10
5431  0ea9 ae0000        	ldw	x,#_tyReport
5432  0eac cd0000        	call	_SaveParameterForType
5434  0eaf 85            	popw	x
5435                     ; 1333 		UC_SleepFunc(1);
5437  0eb0 cd0f42        	call	LC013
5438  0eb3               L5102:
5439                     ; 1341 	if(FALSE == ReadParameterForType(nBuf, 10, LT_REP_TIME))
5441  0eb3 4b05          	push	#5
5442  0eb5 4b0a          	push	#10
5443  0eb7 96            	ldw	x,sp
5444  0eb8 1c0032        	addw	x,#OFST-7
5445  0ebb cd0000        	call	_ReadParameterForType
5447  0ebe 4d            	tnz	a
5448  0ebf 85            	popw	x
5449  0ec0 265f          	jrne	L7102
5450                     ; 1343 		g_wTmReportCnt = 0;
5452  0ec2 5f            	clrw	x
5453  0ec3 cf0000        	ldw	_g_wTmReportCnt,x
5454                     ; 1344 		MemcpyFunc((u8*)&stReportTime, (u8*)&tyReport.Time, sizeof(tyReport.Time));
5456  0ec6 4b06          	push	#6
5457  0ec8 ae0004        	ldw	x,#_tyReport+4
5458  0ecb 89            	pushw	x
5459  0ecc 96            	ldw	x,sp
5460  0ecd 1c000c        	addw	x,#OFST-45
5461  0ed0 cd0000        	call	_MemcpyFunc
5463  0ed3 5b03          	addw	sp,#3
5464                     ; 1345 		JX_BL_Change(6, (u8*)&stReportTime);
5466  0ed5 96            	ldw	x,sp
5467  0ed6 1c0009        	addw	x,#OFST-48
5468  0ed9 89            	pushw	x
5469  0eda ae0006        	ldw	x,#6
5470  0edd cd0000        	call	_JX_BL_Change
5472  0ee0 85            	popw	x
5473                     ; 1346 		stReportTime.nMonth = stReportTime.nMonth&0x1F;
5475  0ee1 7b0a          	ld	a,(OFST-47,sp)
5476  0ee3 a41f          	and	a,#31
5477  0ee5 6b0a          	ld	(OFST-47,sp),a
5478                     ; 1347 		TM_TimeChangeAToB(&stReportTime,&stLastReportT);
5480  0ee7 ae0000        	ldw	x,#_stLastReportT
5481  0eea 89            	pushw	x
5482  0eeb 96            	ldw	x,sp
5483  0eec 1c000b        	addw	x,#OFST-46
5484  0eef cd0000        	call	_TM_TimeChangeAToB
5486  0ef2 85            	popw	x
5487                     ; 1348 		MemcpyFunc(nBuf, (u8*)&stLastReportT, 8);
5489  0ef3 4b08          	push	#8
5490  0ef5 ae0000        	ldw	x,#_stLastReportT
5491  0ef8 89            	pushw	x
5492  0ef9 96            	ldw	x,sp
5493  0efa 1c0033        	addw	x,#OFST-6
5494  0efd cd0000        	call	_MemcpyFunc
5496  0f00 5b03          	addw	sp,#3
5497                     ; 1349 		MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
5499  0f02 4b02          	push	#2
5500  0f04 ae0000        	ldw	x,#_g_wTmReportCnt
5501  0f07 89            	pushw	x
5502  0f08 96            	ldw	x,sp
5503  0f09 1c003b        	addw	x,#OFST+2
5504  0f0c cd0000        	call	_MemcpyFunc
5506  0f0f 5b03          	addw	sp,#3
5507                     ; 1350 		SaveParameterForType(nBuf, 10, LT_REP_TIME);
5509  0f11 4b05          	push	#5
5510  0f13 4b0a          	push	#10
5511  0f15 96            	ldw	x,sp
5512  0f16 1c0032        	addw	x,#OFST-7
5513  0f19 cd0000        	call	_SaveParameterForType
5515  0f1c 85            	popw	x
5516                     ; 1351 		UC_SleepFunc(1);
5518  0f1d ad23          	call	LC013
5520  0f1f 201e          	jra	L1202
5521  0f21               L7102:
5522                     ; 1355 		MemcpyFunc((u8 *)&stLastReportT, nBuf, 8);
5524  0f21 4b08          	push	#8
5525  0f23 96            	ldw	x,sp
5526  0f24 1c0031        	addw	x,#OFST-8
5527  0f27 89            	pushw	x
5528  0f28 ae0000        	ldw	x,#_stLastReportT
5529  0f2b cd0000        	call	_MemcpyFunc
5531  0f2e 5b03          	addw	sp,#3
5532                     ; 1356 		MemcpyFunc((u8 *)&g_wTmReportCnt, &nBuf[8], 2);
5534  0f30 4b02          	push	#2
5535  0f32 96            	ldw	x,sp
5536  0f33 1c0039        	addw	x,#OFST+0
5537  0f36 89            	pushw	x
5538  0f37 ae0000        	ldw	x,#_g_wTmReportCnt
5539  0f3a cd0000        	call	_MemcpyFunc
5541  0f3d 5b03          	addw	sp,#3
5542  0f3f               L1202:
5543                     ; 1359 	return ;
5546  0f3f 5b39          	addw	sp,#57
5547  0f41 81            	ret	
5549  0f42               LC013:
5550  0f42 ae0001        	ldw	x,#1
5551  0f45 89            	pushw	x
5552  0f46 5f            	clrw	x
5553  0f47 89            	pushw	x
5554  0f48 cd0000        	call	_UC_SleepFunc
5556  0f4b 5b04          	addw	sp,#4
5557  0f4d 81            	ret	
5677                     	xdef	_g_HD_device_addr
5678                     	xdef	_g_HD_aralm_type
5679                     	xdef	_g_HD_Msg_Tag
5680                     	xdef	_g_HD_Ctrl
5681                     	xdef	_stDataPtrHD
5682                     	xdef	_HeDa_Cmd_Get_Appoint_Data_Handle
5683                     	xdef	_HeDa_Cmd_Get_All_Param_Handle
5684                     	xdef	_HeDa_Cmd_Get_Secret_Key_Handle
5685                     	xdef	_HeDa_Cmd_Set_Secret_Key_Handle
5686                     	xdef	_HeDa_Cmd_Get_Addr_Handle
5687                     	xdef	_HeDa_Cmd_Set_Addr_Handle
5688                     	xdef	_HeDa_Cmd_Get_Pressure_Threshold_Handle
5689                     	xdef	_HeDa_Cmd_Set_Pressure_Threshold_Handle
5690                     	xdef	_HeDa_Cmd_Get_Report_Cycle_Handle
5691                     	xdef	_HeDa_Cmd_Set_Report_Cycle_Handle
5692                     	xdef	_HeDa_ReportCycleType_To_TypeAddCycle
5693                     	xdef	_HeDa_TypeAddCycle_To_ReportCycleType
5694                     	xdef	_HeDa_Cmd_Get_Net_Param_Handle
5695                     	xdef	_HeDa_Cmd_Set_Net_Param_Handle
5696                     	xdef	_HeDa_Cmd_Get_Sampling_Interval_Handle
5697                     	xdef	_HeDa_Cmd_Set_Sampling_Interval_Handle
5698                     	xdef	_HeDa_Cmd_Reply_Upload_Handle
5699                     	xdef	_HD_ProtolHandle
5700                     	xdef	_HD_AddressComparePro
5701                     	xdef	_HD_DecodeParameter
5702                     	xdef	_HD_ProtolSend
5703                     	xdef	_HD_Online
5704                     	xdef	_HD_OnlineCtl
5705                     	xdef	_HD_ProtolProc
5706                     	xdef	_HD_TimeOutReUpLoad
5707                     	xdef	_LP_HD_CalReportConut
5708                     	xdef	_HD_ClaReportTimeToSec
5709                     	xdef	_HD_InitializeGsm
5710                     	xref	_g_Device_Info
5711                     	xref	_BAT_GetBatVol
5712                     	xref	_STM8_RTC_Set
5713                     	xref	_STM8_RTC_Get
5714                     	xref	_g_stNextGmTime
5715                     	xref	_g_stNextRepTime
5716                     	xref	_stRepFail
5717                     	xref	_tyParameter
5718                     	xref	_tyRecord
5719                     	xref	_ReadDayFreezeRecord
5720                     	xref	_SaveParameterForType
5721                     	xref	_ReadParameterForType
5722                     	xref	_ReadRecord
5723                     	xref	_JX_StringCat
5724                     	xref	_JX_Strlen
5725                     	xref	_FrameSendFunc
5726                     	xref	_M590_CloseConnect
5727                     	xref	_M590_TcpSendDatLen
5728                     	xref	_SetLogonMode
5729                     	xref	_WatitDataSendOk
5730                     	xref	_GetReportFailFlag
5731                     	xref	_UC_SleepFunc
5732                     	xref	_m_nUploadMode
5733                     	xref	_g_nSignal
5734                     	xref	_g_wTmReportCnt
5735                     	xref	_aucAtPPort1
5736                     	xref	_aucAtPServer1
5737                     	xref	_ucStatusGsm
5738                     	xref	_tyReportParameter
5739                     	xref	_g_nApnType
5740                     	xref	_m_nRepFailFlg
5741                     	xref	_tyGSMFlag
5742                     	xref	_ucLogonMode
5743                     	xref	_g_nDatRepCnt
5744                     	xref	_m_nRepEnableFlg
5745                     	xref	_g_dwRepTick
5746                     	xref	_stLastReportT
5747                     	xref	_stTimeNow
5748                     	xref	_g_nApnBuf
5749                     	xref	_tyReport
5750                     	xref	_GetUartRxBuf
5751                     	xref	_ClearRxBuff
5752                     	xref	_CheckRevDataLen
5753                     	xref	_aucUartTxBuffer
5754                     	xref	_GM_GetGatherMeterFlg
5755                     	xref	_tyTime
5756                     	xref	_HeDa_Get_String_len
5757                     	xref	_JX_U32ToStr
5758                     	xref	_JX_IpAddrToStr
5759                     	xref	_TM_RTimeDecnMinute
5760                     	xref	_TM_RTimeAddnMinute
5761                     	xref	_TM_DiffSecond
5762                     	xref	_TM_TimeChangeBToA
5763                     	xref	_TM_TimeChangeAToB
5764                     	xref	_TM_IsValidTimePro
5765                     	xref	_JX_IsAllFillDat
5766                     	xref	_JX_AddSum8Bit
5767                     	xref	_JX_BL_Change
5768                     	xref	_MemcpyFunc
5769                     	xref	_MemsetFunc
5770                     	xref	_GetSysTemTick
5771                     	switch	.const
5772  005b               L1321:
5773  005b 2200          	dc.b	34,0
5774                     	xref.b	c_lreg
5794                     	xref	c_xymvx
5795                     	xref	c_lcmp
5796                     	xref	c_smul
5797                     	xref	c_ludv
5798                     	xref	c_lsub
5799                     	xref	c_lumd
5800                     	xref	c_uitolx
5801                     	xref	c_lmod
5802                     	xref	c_ldiv
5803                     	xref	c_lzmp
5804                     	xref	c_rtol
5805                     	xref	c_ltor
5806                     	xref	c_lmul
5807                     	xref	c_umul
5808                     	xref	c_cmulx
5809                     	end
