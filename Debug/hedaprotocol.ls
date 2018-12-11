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
 859                     ; 209 		SetLogonMode(UP_Upload_HD);
 861  028e a604          	ld	a,#4
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
 955  02af cd0618        	call	_HD_DecodeParameter
 957  02b2 5b01          	addw	sp,#1
 958  02b4 6b04          	ld	(OFST+0,sp),a
 959                     ; 234 	if(0 < nSendLen)
 961  02b6 270c          	jreq	L552
 962                     ; 236 		HD_ProtolSend(nSendLen, COM_1,1);
 964  02b8 4b01          	push	#1
 965  02ba ae0001        	ldw	x,#1
 966  02bd 7b05          	ld	a,(OFST+1,sp)
 967  02bf 95            	ld	xh,a
 968  02c0 cd050e        	call	_HD_ProtolSend
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
1332                     ; 325 		pnBuf[nOffset]=1;										//报文中的数据条数
1334  034f 7b36          	ld	a,(OFST-2,sp)
1335  0351 97            	ld	xl,a
1336  0352 7b37          	ld	a,(OFST-1,sp)
1337  0354 1b38          	add	a,(OFST+0,sp)
1338  0356 2401          	jrnc	L251
1339  0358 5c            	incw	x
1340  0359               L251:
1341  0359 02            	rlwa	x,a
1342  035a a601          	ld	a,#1
1343  035c f7            	ld	(x),a
1344                     ; 326 		nOffset++;
1346  035d 0c38          	inc	(OFST+0,sp)
1347                     ; 328 		pnBuf[nOffset++]=0;										//报文中的数据间隔
1349  035f 7b38          	ld	a,(OFST+0,sp)
1350  0361 0c38          	inc	(OFST+0,sp)
1351  0363 5f            	clrw	x
1352  0364 97            	ld	xl,a
1353  0365 72fb36        	addw	x,(OFST-2,sp)
1354  0368 7f            	clr	(x)
1355                     ; 330 		Bat_value=BAT_GetBatVol();
1357  0369 cd0000        	call	_BAT_GetBatVol
1359  036c 1f17          	ldw	(OFST-33,sp),x
1360                     ; 331 		pnBuf[nOffset++]=(Bat_value>>8)&0xff;					//电池电压，除以100后为电池电压实际数值                   高位在前
1362  036e 7b38          	ld	a,(OFST+0,sp)
1363  0370 0c38          	inc	(OFST+0,sp)
1364  0372 5f            	clrw	x
1365  0373 97            	ld	xl,a
1366  0374 72fb36        	addw	x,(OFST-2,sp)
1367  0377 7b17          	ld	a,(OFST-33,sp)
1368  0379 f7            	ld	(x),a
1369                     ; 332 		pnBuf[nOffset++]=Bat_value&0xff;
1371  037a 7b38          	ld	a,(OFST+0,sp)
1372  037c 0c38          	inc	(OFST+0,sp)
1373  037e 5f            	clrw	x
1374  037f 97            	ld	xl,a
1375  0380 72fb36        	addw	x,(OFST-2,sp)
1376  0383 7b18          	ld	a,(OFST-32,sp)
1377  0385 f7            	ld	(x),a
1378                     ; 334 		pnBuf[nOffset++]=(g_HD_Msg_Tag>>8)&0xff;				//帧流水号     高位在前
1380  0386 7b38          	ld	a,(OFST+0,sp)
1381  0388 0c38          	inc	(OFST+0,sp)
1382  038a 5f            	clrw	x
1383  038b 97            	ld	xl,a
1384  038c 72fb36        	addw	x,(OFST-2,sp)
1385  038f c6008d        	ld	a,_g_HD_Msg_Tag
1386  0392 f7            	ld	(x),a
1387                     ; 335 		pnBuf[nOffset++]=g_HD_Msg_Tag&0xff;
1389  0393 7b38          	ld	a,(OFST+0,sp)
1390  0395 0c38          	inc	(OFST+0,sp)
1391  0397 5f            	clrw	x
1392  0398 97            	ld	xl,a
1393  0399 72fb36        	addw	x,(OFST-2,sp)
1394  039c c6008e        	ld	a,_g_HD_Msg_Tag+1
1395  039f f7            	ld	(x),a
1396                     ; 337 		pnBuf[nOffset++]=g_nSignal;								//信号强度
1398  03a0 7b38          	ld	a,(OFST+0,sp)
1399  03a2 0c38          	inc	(OFST+0,sp)
1400  03a4 5f            	clrw	x
1401  03a5 97            	ld	xl,a
1402  03a6 72fb36        	addw	x,(OFST-2,sp)
1403  03a9 c60000        	ld	a,_g_nSignal
1404  03ac f7            	ld	(x),a
1405                     ; 339 		pnBuf[nOffset++]=(g_HD_aralm_type>>8)&0xff;				//突发事件类型     高位在前
1407  03ad 7b38          	ld	a,(OFST+0,sp)
1408  03af 0c38          	inc	(OFST+0,sp)
1409  03b1 5f            	clrw	x
1410  03b2 97            	ld	xl,a
1411  03b3 72fb36        	addw	x,(OFST-2,sp)
1412  03b6 c6008f        	ld	a,_g_HD_aralm_type
1413  03b9 f7            	ld	(x),a
1414                     ; 340 		pnBuf[nOffset++]=g_HD_aralm_type&0xff;
1416  03ba 7b38          	ld	a,(OFST+0,sp)
1417  03bc 0c38          	inc	(OFST+0,sp)
1418  03be 5f            	clrw	x
1419  03bf 97            	ld	xl,a
1420  03c0 72fb36        	addw	x,(OFST-2,sp)
1421  03c3 c60090        	ld	a,_g_HD_aralm_type+1
1422  03c6 f7            	ld	(x),a
1423                     ; 342 		for(i=0;i<6;i++)pnBuf[nOffset++]=0;						//保留字段
1425  03c7 0f35          	clr	(OFST-3,sp)
1426  03c9               L773:
1429  03c9 7b38          	ld	a,(OFST+0,sp)
1430  03cb 0c38          	inc	(OFST+0,sp)
1431  03cd 5f            	clrw	x
1432  03ce 97            	ld	xl,a
1433  03cf 72fb36        	addw	x,(OFST-2,sp)
1434  03d2 7f            	clr	(x)
1437  03d3 0c35          	inc	(OFST-3,sp)
1440  03d5 7b35          	ld	a,(OFST-3,sp)
1441  03d7 a106          	cp	a,#6
1442  03d9 25ee          	jrult	L773
1443                     ; 344 		pnBuf[nOffset++]=0x01;									//通道类型 
1445  03db 7b38          	ld	a,(OFST+0,sp)
1446  03dd 0c38          	inc	(OFST+0,sp)
1447  03df 5f            	clrw	x
1448  03e0 97            	ld	xl,a
1449  03e1 72fb36        	addw	x,(OFST-2,sp)
1450  03e4 a601          	ld	a,#1
1451  03e6 f7            	ld	(x),a
1452                     ; 345 		pnBuf[nOffset++]=0x01;									//通道号 
1454  03e7 7b38          	ld	a,(OFST+0,sp)
1455  03e9 0c38          	inc	(OFST+0,sp)
1456  03eb 5f            	clrw	x
1457  03ec 97            	ld	xl,a
1458  03ed 72fb36        	addw	x,(OFST-2,sp)
1459  03f0 a601          	ld	a,#1
1460  03f2 f7            	ld	(x),a
1461                     ; 353 			if(TRUE == ReadDayFreezeRecord(0, (u8*)&stDayFreeze, sizeof(TypeRecordDay)))
1463  03f3 4b07          	push	#7
1464  03f5 96            	ldw	x,sp
1465  03f6 1c0011        	addw	x,#OFST-39
1466  03f9 89            	pushw	x
1467  03fa 4f            	clr	a
1468  03fb cd0000        	call	_ReadDayFreezeRecord
1470  03fe 5b03          	addw	sp,#3
1471  0400 4a            	dec	a
1472  0401 2703cc048f    	jrne	L504
1473                     ; 355 				STM8_RTC_Get(&now_time);
1475  0406 96            	ldw	x,sp
1476  0407 1c0019        	addw	x,#OFST-31
1477  040a cd0000        	call	_STM8_RTC_Get
1479                     ; 356 				TM_TimeChangeAToB(&now_time, &stTmpTime);
1481  040d 96            	ldw	x,sp
1482  040e 5c            	incw	x
1483  040f 89            	pushw	x
1484  0410 1c0018        	addw	x,#24
1485  0413 cd0000        	call	_TM_TimeChangeAToB
1487  0416 85            	popw	x
1488                     ; 357 				TM_RTimeDecnMinute(&stTmpTime, 1440);
1490  0417 ae05a0        	ldw	x,#1440
1491  041a 89            	pushw	x
1492  041b 5f            	clrw	x
1493  041c 89            	pushw	x
1494  041d 96            	ldw	x,sp
1495  041e 1c0005        	addw	x,#OFST-51
1496  0421 cd0000        	call	_TM_RTimeDecnMinute
1498  0424 5b04          	addw	sp,#4
1499                     ; 358 				TM_TimeChangeBToA(&stTmpTime, &stYesterDay);
1501  0426 96            	ldw	x,sp
1502  0427 1c0009        	addw	x,#OFST-47
1503  042a 89            	pushw	x
1504  042b 1d0008        	subw	x,#8
1505  042e cd0000        	call	_TM_TimeChangeBToA
1507  0431 85            	popw	x
1508                     ; 359 				if((stDayFreeze.nYear == stYesterDay.wYear) && 
1508                     ; 360 					(stDayFreeze.nMon == stYesterDay.nMonth) && (stDayFreeze.nDay == stYesterDay.nDay))
1510  0432 7b14          	ld	a,(OFST-36,sp)
1511  0434 1109          	cp	a,(OFST-47,sp)
1512  0436 263e          	jrne	L704
1514  0438 7b15          	ld	a,(OFST-35,sp)
1515  043a 110a          	cp	a,(OFST-46,sp)
1516  043c 2638          	jrne	L704
1518  043e 7b16          	ld	a,(OFST-34,sp)
1519  0440 110b          	cp	a,(OFST-45,sp)
1520  0442 2632          	jrne	L704
1521                     ; 362 					pnBuf[nOffset++]=stDayFreeze.Value&0xff;
1523  0444 7b38          	ld	a,(OFST+0,sp)
1524  0446 0c38          	inc	(OFST+0,sp)
1525  0448 5f            	clrw	x
1526  0449 97            	ld	xl,a
1527  044a 72fb36        	addw	x,(OFST-2,sp)
1528  044d 7b13          	ld	a,(OFST-37,sp)
1529  044f f7            	ld	(x),a
1530                     ; 363 					pnBuf[nOffset++]=(stDayFreeze.Value>>8)&0xff;
1532  0450 7b38          	ld	a,(OFST+0,sp)
1533  0452 0c38          	inc	(OFST+0,sp)
1534  0454 5f            	clrw	x
1535  0455 97            	ld	xl,a
1536  0456 72fb36        	addw	x,(OFST-2,sp)
1537  0459 7b12          	ld	a,(OFST-38,sp)
1538  045b f7            	ld	(x),a
1539                     ; 364 					pnBuf[nOffset++]=(stDayFreeze.Value>>16)&0xff;
1541  045c 7b38          	ld	a,(OFST+0,sp)
1542  045e 0c38          	inc	(OFST+0,sp)
1543  0460 5f            	clrw	x
1544  0461 97            	ld	xl,a
1545  0462 72fb36        	addw	x,(OFST-2,sp)
1546  0465 7b11          	ld	a,(OFST-39,sp)
1547  0467 f7            	ld	(x),a
1548                     ; 365 					pnBuf[nOffset++]=(stDayFreeze.Value>>24)&0xff;
1550  0468 7b38          	ld	a,(OFST+0,sp)
1551  046a 0c38          	inc	(OFST+0,sp)
1552  046c 5f            	clrw	x
1553  046d 97            	ld	xl,a
1554  046e 72fb36        	addw	x,(OFST-2,sp)
1555  0471 7b10          	ld	a,(OFST-40,sp)
1556  0473 f7            	ld	(x),a
1558  0474 2019          	jra	L504
1559  0476               L704:
1560                     ; 370 					MemsetFunc(&pnBuf[nOffset], 0x00, 4);
1562  0476 4b04          	push	#4
1563  0478 4b00          	push	#0
1564  047a 7b38          	ld	a,(OFST+0,sp)
1565  047c 97            	ld	xl,a
1566  047d 7b39          	ld	a,(OFST+1,sp)
1567  047f 1b3a          	add	a,(OFST+2,sp)
1568  0481 2401          	jrnc	L271
1569  0483 5c            	incw	x
1570  0484               L271:
1571  0484 02            	rlwa	x,a
1572  0485 cd0000        	call	_MemsetFunc
1574  0488 85            	popw	x
1575                     ; 371 					nOffset+=4;
1577  0489 7b38          	ld	a,(OFST+0,sp)
1578  048b ab04          	add	a,#4
1579  048d 6b38          	ld	(OFST+0,sp),a
1580  048f               L504:
1581                     ; 376 			if(FALSE == GM_GetGatherMeterFlg())
1583  048f cd0000        	call	_GM_GetGatherMeterFlg
1585  0492 4d            	tnz	a
1586  0493 2622          	jrne	L314
1587                     ; 378 				if(TRUE == ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord)))
1589  0495 4b0c          	push	#12
1590  0497 ae0000        	ldw	x,#_tyRecord
1591  049a 89            	pushw	x
1592  049b cd0000        	call	_ReadRecord
1594  049e 5b03          	addw	sp,#3
1595  04a0 4a            	dec	a
1596  04a1 260b          	jrne	L514
1597                     ; 380 					tyParameter.Value = tyRecord.Value;
1599  04a3 ce0002        	ldw	x,_tyRecord+2
1600  04a6 cf000a        	ldw	_tyParameter+10,x
1601  04a9 ce0000        	ldw	x,_tyRecord
1603  04ac 2006          	jp	LC002
1604  04ae               L514:
1605                     ; 382 				else tyParameter.Value = INVALID_DATA;
1607  04ae aeeeee        	ldw	x,#61166
1608  04b1 cf000a        	ldw	_tyParameter+10,x
1609  04b4               LC002:
1610  04b4 cf0008        	ldw	_tyParameter+8,x
1611  04b7               L314:
1612                     ; 384 			pnBuf[nOffset++]=tyParameter.Value&0xff;
1614  04b7 7b38          	ld	a,(OFST+0,sp)
1615  04b9 0c38          	inc	(OFST+0,sp)
1616  04bb 5f            	clrw	x
1617  04bc 97            	ld	xl,a
1618  04bd 72fb36        	addw	x,(OFST-2,sp)
1619  04c0 c6000b        	ld	a,_tyParameter+11
1620  04c3 f7            	ld	(x),a
1621                     ; 385 			pnBuf[nOffset++]=(tyParameter.Value>>8)&0xff;
1623  04c4 7b38          	ld	a,(OFST+0,sp)
1624  04c6 0c38          	inc	(OFST+0,sp)
1625  04c8 5f            	clrw	x
1626  04c9 97            	ld	xl,a
1627  04ca 72fb36        	addw	x,(OFST-2,sp)
1628  04cd c6000a        	ld	a,_tyParameter+10
1629  04d0 f7            	ld	(x),a
1630                     ; 386 			pnBuf[nOffset++]=(tyParameter.Value>>16)&0xff;
1632  04d1 7b38          	ld	a,(OFST+0,sp)
1633  04d3 0c38          	inc	(OFST+0,sp)
1634  04d5 5f            	clrw	x
1635  04d6 97            	ld	xl,a
1636  04d7 72fb36        	addw	x,(OFST-2,sp)
1637  04da c60009        	ld	a,_tyParameter+9
1638  04dd f7            	ld	(x),a
1639                     ; 387 			pnBuf[nOffset++]=(tyParameter.Value>>24)&0xff;
1641  04de 7b38          	ld	a,(OFST+0,sp)
1642  04e0 0c38          	inc	(OFST+0,sp)
1643  04e2 5f            	clrw	x
1644  04e3 97            	ld	xl,a
1645  04e4 72fb36        	addw	x,(OFST-2,sp)
1646  04e7 c60008        	ld	a,_tyParameter+8
1647  04ea f7            	ld	(x),a
1648                     ; 389 		nSendLen =nOffset;	
1650  04eb 7b38          	ld	a,(OFST+0,sp)
1651  04ed 6b35          	ld	(OFST-3,sp),a
1652                     ; 391 	HD_ProtolSend(nSendLen, COM_1,1);			//只有1组数据
1654  04ef 4b01          	push	#1
1655  04f1 ae0001        	ldw	x,#1
1656  04f4 7b36          	ld	a,(OFST-2,sp)
1657  04f6 95            	ld	xh,a
1658  04f7 ad15          	call	_HD_ProtolSend
1660  04f9 84            	pop	a
1661                     ; 394 	if(FALSE == WatitDataSendOk())
1663  04fa cd0000        	call	_WatitDataSendOk
1665  04fd 4d            	tnz	a
1666                     ; 396 		return FALSE;
1669  04fe 270b          	jreq	L602
1670                     ; 399 	g_dwRepTick = GetSysTemTick();
1672  0500 cd0000        	call	_GetSysTemTick
1674  0503 ae0000        	ldw	x,#_g_dwRepTick
1675  0506 cd0000        	call	c_rtol
1677                     ; 400 	return TRUE;
1679  0509 a601          	ld	a,#1
1681  050b               L602:
1683  050b 5b38          	addw	sp,#56
1684  050d 81            	ret	
1830                     ; 412 s8 HD_ProtolSend(u8 Size, u8 nComChannel,u8 device_info_flag)
1830                     ; 413 {
1831                     	switch	.text
1832  050e               _HD_ProtolSend:
1834  050e 89            	pushw	x
1835  050f 520e          	subw	sp,#14
1836       0000000e      OFST:	set	14
1839                     ; 415 	u16 length = 0;
1841  0511 1e0c          	ldw	x,(OFST-2,sp)
1842                     ; 417 	s8 nFailCnt = 0, nOptRelt = FALSE;
1844  0513 0f03          	clr	(OFST-11,sp)
1847                     ; 419 	if(device_info_flag)length=Size+15+HD_FRAME_OTHER_LEN;
1849  0515 7b13          	ld	a,(OFST+5,sp)
1850  0517 270a          	jreq	L305
1853  0519 4f            	clr	a
1854  051a 97            	ld	xl,a
1855  051b a618          	ld	a,#24
1856  051d 1b0f          	add	a,(OFST+1,sp)
1857  051f 240a          	jrnc	L412
1859  0521 2007          	jp	LC003
1860  0523               L305:
1861                     ; 420 	else length=Size+HD_FRAME_OTHER_LEN;
1863  0523 97            	ld	xl,a
1864  0524 a609          	ld	a,#9
1865  0526 1b0f          	add	a,(OFST+1,sp)
1866  0528 2401          	jrnc	L412
1867  052a               LC003:
1868  052a 5c            	incw	x
1869  052b               L412:
1870  052b 02            	rlwa	x,a
1871  052c 1f0c          	ldw	(OFST-2,sp),x
1872  052e 01            	rrwa	x,a
1873                     ; 423 	if(COM_1 == nComChannel)
1875  052f 7b10          	ld	a,(OFST+2,sp)
1876  0531 4a            	dec	a
1877  0532 2633          	jrne	L705
1879  0534 2027          	jra	L315
1880  0536               L115:
1881                     ; 428 			nOptRelt = M590_TcpSendDatLen(length); //0x0D不算入长度
1883  0536 7b0d          	ld	a,(OFST-1,sp)
1884  0538 cd0000        	call	_M590_TcpSendDatLen
1886  053b 6b0e          	ld	(OFST+0,sp),a
1887                     ; 429 			if(-1 == nOptRelt)
1889  053d a1ff          	cp	a,#255
1890  053f 260f          	jrne	L715
1891                     ; 431 				stRepFail.wError |= (1<<DATSEND_ERROR);
1893  0541 72100006      	bset	_stRepFail+6,#0
1894                     ; 432 				M590_CloseConnect();
1896  0545 cd0000        	call	_M590_CloseConnect
1898                     ; 433 				ucStatusGsm = GSM_SHAKEHAND;
1900  0548 35020000      	mov	_ucStatusGsm,#2
1901                     ; 434 				return -1;
1903  054c a6ff          	ld	a,#255
1905  054e 200a          	jra	L232
1906  0550               L715:
1907                     ; 436 			if(TRUE == nOptRelt)
1909  0550 4a            	dec	a
1910  0551 260a          	jrne	L315
1911                     ; 438 				break;
1912  0553               L515:
1913                     ; 441 		if(nFailCnt >= 3 )
1915  0553 7b03          	ld	a,(OFST-11,sp)
1916  0555 a103          	cp	a,#3
1917  0557 2f0e          	jrslt	L705
1918                     ; 443 			return FALSE;
1920  0559 4f            	clr	a
1922  055a               L232:
1924  055a 5b10          	addw	sp,#16
1925  055c 81            	ret	
1926  055d               L315:
1927                     ; 426 		while(3 > nFailCnt++)
1929  055d 7b03          	ld	a,(OFST-11,sp)
1930  055f 0c03          	inc	(OFST-11,sp)
1931  0561 a103          	cp	a,#3
1932  0563 2fd1          	jrslt	L115
1933  0565 20ec          	jra	L515
1934  0567               L705:
1935                     ; 447 	length = Size;		                   
1937  0567 7b0f          	ld	a,(OFST+1,sp)
1938  0569 5f            	clrw	x
1939  056a 97            	ld	xl,a
1940  056b 1f0c          	ldw	(OFST-2,sp),x
1941                     ; 448 	tyProtolHead.Head[0] = Packet_Head_0;				//数据包头
1943  056d a6a7          	ld	a,#167
1944  056f 6b04          	ld	(OFST-10,sp),a
1945                     ; 449 	tyProtolHead.Head[1] = Packet_Head_1;				//数据包头
1947  0571 6b05          	ld	(OFST-9,sp),a
1948                     ; 450 	tyProtolHead.Addr[0] = Maker_Addr;					//厂商地址
1950  0573 a601          	ld	a,#1
1951  0575 6b06          	ld	(OFST-8,sp),a
1952                     ; 451 	tyProtolHead.Addr[1] = (g_HD_device_addr&0xFF);		//设备地址
1954  0577 c60092        	ld	a,_g_HD_device_addr+1
1955  057a 6b07          	ld	(OFST-7,sp),a
1956                     ; 452 	tyProtolHead.Addr[2] = (g_HD_device_addr>>8)&0xFF;	//设备地址
1958  057c c60091        	ld	a,_g_HD_device_addr
1959  057f 6b08          	ld	(OFST-6,sp),a
1960                     ; 453 	tyProtolHead.Version = Protocol_Version;			//协议版本号
1962  0581 a614          	ld	a,#20
1963  0583 6b09          	ld	(OFST-5,sp),a
1964                     ; 455 	Point = aucUartTxBuffer;		//指针指向接收发送缓冲头
1966  0585 ae0000        	ldw	x,#_aucUartTxBuffer
1967  0588 1f0a          	ldw	(OFST-4,sp),x
1968                     ; 457 	MemcpyFunc(Point, (u8 *)&tyProtolHead, sizeof(tyProtolHead) );	//复制数据头到缓冲中
1970  058a 4b06          	push	#6
1971  058c 96            	ldw	x,sp
1972  058d 1c0005        	addw	x,#OFST-9
1973  0590 89            	pushw	x
1974  0591 1e0d          	ldw	x,(OFST-1,sp)
1975  0593 cd0000        	call	_MemcpyFunc
1977  0596 5b03          	addw	sp,#3
1978                     ; 458 	Point += sizeof(tyProtolHead);									//指针向下
1980  0598 1e0a          	ldw	x,(OFST-4,sp)
1981  059a 1c0006        	addw	x,#6
1982  059d 1f0a          	ldw	(OFST-4,sp),x
1983                     ; 459 	if(device_info_flag)
1985  059f 7b13          	ld	a,(OFST+5,sp)
1986  05a1 2718          	jreq	L525
1987                     ; 462 		MemsetFunc(Point,0, 15);
1989  05a3 4b0f          	push	#15
1990  05a5 4b00          	push	#0
1991  05a7 1e0c          	ldw	x,(OFST-2,sp)
1992  05a9 cd0000        	call	_MemsetFunc
1994  05ac 85            	popw	x
1995                     ; 463 		Point += sizeof(g_Device_Info);										//指针向下
1997  05ad 1e0a          	ldw	x,(OFST-4,sp)
1998  05af 1c000f        	addw	x,#15
1999  05b2 1f0a          	ldw	(OFST-4,sp),x
2000                     ; 464 		length +=sizeof(g_Device_Info);
2002  05b4 1e0c          	ldw	x,(OFST-2,sp)
2003  05b6 1c000f        	addw	x,#15
2004  05b9 1f0c          	ldw	(OFST-2,sp),x
2005  05bb               L525:
2006                     ; 467 	MemcpyFunc(Point, (u8 *)&stDataPtrHD, Size );
2008  05bb 7b0f          	ld	a,(OFST+1,sp)
2009  05bd 88            	push	a
2010  05be ae0000        	ldw	x,#_stDataPtrHD
2011  05c1 89            	pushw	x
2012  05c2 1e0d          	ldw	x,(OFST-1,sp)
2013  05c4 cd0000        	call	_MemcpyFunc
2015  05c7 5b03          	addw	sp,#3
2016                     ; 468 	Point += Size;	
2018  05c9 7b0f          	ld	a,(OFST+1,sp)
2019  05cb 5f            	clrw	x
2020  05cc 97            	ld	xl,a
2021  05cd 1f01          	ldw	(OFST-13,sp),x
2022  05cf 1e0a          	ldw	x,(OFST-4,sp)
2023  05d1 72fb01        	addw	x,(OFST-13,sp)
2024  05d4 1f0a          	ldw	(OFST-4,sp),x
2025                     ; 469 	length += Size;
2027  05d6 5f            	clrw	x
2028  05d7 97            	ld	xl,a
2029  05d8 1f01          	ldw	(OFST-13,sp),x
2030  05da 1e0c          	ldw	x,(OFST-2,sp)
2031  05dc 72fb01        	addw	x,(OFST-13,sp)
2032  05df 1f0c          	ldw	(OFST-2,sp),x
2033                     ; 471 	checksum = 0;					//校验和是累加和
2035  05e1 0f03          	clr	(OFST-11,sp)
2036                     ; 472 	for (nX = 0; nX < length; nX++)
2038  05e3 0f0e          	clr	(OFST+0,sp)
2040  05e5 200b          	jra	L335
2041  05e7               L725:
2042                     ; 474 		checksum += aucUartTxBuffer[nX];    //计算累加和
2044  05e7 5f            	clrw	x
2045  05e8 97            	ld	xl,a
2046  05e9 7b03          	ld	a,(OFST-11,sp)
2047  05eb db0000        	add	a,(_aucUartTxBuffer,x)
2048  05ee 6b03          	ld	(OFST-11,sp),a
2049                     ; 472 	for (nX = 0; nX < length; nX++)
2051  05f0 0c0e          	inc	(OFST+0,sp)
2052  05f2               L335:
2055  05f2 7b0e          	ld	a,(OFST+0,sp)
2056  05f4 5f            	clrw	x
2057  05f5 97            	ld	xl,a
2058  05f6 130c          	cpw	x,(OFST-2,sp)
2059  05f8 25ed          	jrult	L725
2060                     ; 476 	Point[length++] = checksum;
2062  05fa 1e0c          	ldw	x,(OFST-2,sp)
2063  05fc 5c            	incw	x
2064  05fd 1f0c          	ldw	(OFST-2,sp),x
2065  05ff 5a            	decw	x
2066  0600 72fb0a        	addw	x,(OFST-4,sp)
2067                     ; 477 	Point[length++] = Packet_End_0;
2069                     ; 478 	Point[length++] = Packet_End_1;
2071  0603 a60a          	ld	a,#10
2072  0605 f7            	ld	(x),a
2073                     ; 480 	FrameSendFunc(length, nComChannel, Point);
2075  0606 1e0a          	ldw	x,(OFST-4,sp)
2076  0608 89            	pushw	x
2077  0609 7b12          	ld	a,(OFST+4,sp)
2078  060b 97            	ld	xl,a
2079  060c 7b0f          	ld	a,(OFST+1,sp)
2080  060e 95            	ld	xh,a
2081  060f cd0000        	call	_FrameSendFunc
2083  0612 a601          	ld	a,#1
2084  0614 85            	popw	x
2085                     ; 481 	return TRUE;
2088  0615 cc055a        	jra	L232
2184                     ; 494 u8 HD_DecodeParameter(u8* pnRxBuf, u8 nRxLen)
2184                     ; 495 {
2185                     	switch	.text
2186  0618               _HD_DecodeParameter:
2188  0618 89            	pushw	x
2189  0619 520e          	subw	sp,#14
2190       0000000e      OFST:	set	14
2193                     ; 496 	u8 *Point = NULL;
2195                     ; 497 	u16 wDataLen = 0, wLen = 0;	
2199  061b 5f            	clrw	x
2200  061c 1f0b          	ldw	(OFST-3,sp),x
2201                     ; 499 	u8 nSendLen = 0;
2203  061e 0f08          	clr	(OFST-6,sp)
2204                     ; 501 	if(NULL == pnRxBuf)
2206  0620 1e0f          	ldw	x,(OFST+1,sp)
2207  0622 2603          	jrne	L106
2208                     ; 503 		return nSendLen;
2210  0624 4f            	clr	a
2212  0625 2020          	jra	L452
2213  0627               L106:
2214                     ; 505     Point = pnRxBuf;
2216  0627 1f0d          	ldw	(OFST-1,sp),x
2218  0629 201f          	jra	L706
2219  062b               L306:
2220                     ; 510 		Point++;
2222  062b 5c            	incw	x
2223  062c 1f0d          	ldw	(OFST-1,sp),x
2224                     ; 511 		wLen++;
2226  062e 1e0b          	ldw	x,(OFST-3,sp)
2227  0630 5c            	incw	x
2228  0631 1f0b          	ldw	(OFST-3,sp),x
2229                     ; 512 		if(nRxLen <= wLen)
2231  0633 7b13          	ld	a,(OFST+5,sp)
2232  0635 5f            	clrw	x
2233  0636 97            	ld	xl,a
2234  0637 130b          	cpw	x,(OFST-3,sp)
2235  0639 220f          	jrugt	L706
2236                     ; 514 		    if(NUMBER_UART_RX <= CheckRevDataLen())
2238  063b cd0000        	call	_CheckRevDataLen
2240  063e a1c0          	cp	a,#192
2241  0640 2503          	jrult	LC004
2242                     ; 516 			    goto __UC_Pro_Exit;
2243  0642               L735:
2244                     ; 568 __UC_Pro_Exit:
2244                     ; 569 
2244                     ; 570 	/* add by maronglang clear RxBuf */
2244                     ; 571 	ClearRxBuff();
2246  0642 cd0000        	call	_ClearRxBuff
2248                     ; 572 	return nSendLen;
2250  0645               LC004:
2252  0645 7b08          	ld	a,(OFST-6,sp)
2254  0647               L452:
2256  0647 5b10          	addw	sp,#16
2257  0649 81            	ret	
2258                     ; 518 			return nSendLen;
2260  064a               L706:
2261                     ; 508 	while((Packet_Head_0 != *Point)||(Packet_Head_1 != *(Point+1)))
2263  064a 1e0d          	ldw	x,(OFST-1,sp)
2264  064c f6            	ld	a,(x)
2265  064d a1a7          	cp	a,#167
2266  064f 26da          	jrne	L306
2268  0651 e601          	ld	a,(1,x)
2269  0653 a1a7          	cp	a,#167
2270  0655 26d4          	jrne	L306
2271                     ; 522 	if(NUMBER_UART_RX <= CheckRevDataLen())
2273  0657 cd0000        	call	_CheckRevDataLen
2275  065a a1c0          	cp	a,#192
2276  065c 24e4          	jruge	L735
2277                     ; 524 		goto __UC_Pro_Exit;
2279                     ; 527 	MemcpyFunc((u8 *)&tyProtolHead, Point, sizeof(tyProtolHead));		//复制字符串到缓冲中
2281  065e 4b06          	push	#6
2282  0660 1e0e          	ldw	x,(OFST+0,sp)
2283  0662 89            	pushw	x
2284  0663 96            	ldw	x,sp
2285  0664 1c0005        	addw	x,#OFST-9
2286  0667 cd0000        	call	_MemcpyFunc
2288  066a 5b03          	addw	sp,#3
2289                     ; 528 	Point += sizeof(tyProtolHead);
2291  066c 1e0d          	ldw	x,(OFST-1,sp)
2292  066e 1c0006        	addw	x,#6
2293  0671 1f0d          	ldw	(OFST-1,sp),x
2294                     ; 530 	if( (nRxLen-wLen) > (sizeof(tyProtolHead)+ 9) )//数据包的最小长度，包头结构体+3控制字+2长度+1命令+1校验+2包尾
2296  0673 7b13          	ld	a,(OFST+5,sp)
2297  0675 5f            	clrw	x
2298  0676 97            	ld	xl,a
2299  0677 72f00b        	subw	x,(OFST-3,sp)
2300  067a a30010        	cpw	x,#16
2301  067d 25c3          	jrult	L735
2302                     ; 532 		u16 msg_len= (u16)*(Point+3)+sizeof(tyProtolHead)+ 8;//计算该消息的总长度 datalen+3控制字+2长度+1校验+2包尾
2304  067f 1e0d          	ldw	x,(OFST-1,sp)
2305  0681 e603          	ld	a,(3,x)
2306  0683 5f            	clrw	x
2307  0684 97            	ld	xl,a
2308  0685 1c000e        	addw	x,#14
2309  0688 1f09          	ldw	(OFST-5,sp),x
2310                     ; 533 		if( msg_len <= (nRxLen-wLen) )
2312  068a 7b13          	ld	a,(OFST+5,sp)
2313  068c 5f            	clrw	x
2314  068d 97            	ld	xl,a
2315  068e 72f00b        	subw	x,(OFST-3,sp)
2316  0691 1309          	cpw	x,(OFST-5,sp)
2317  0693 25ad          	jrult	L735
2318                     ; 535 			wDataLen=stDataPtrHD.Packet.Data_Len+8;
2320  0695 ce0003        	ldw	x,_stDataPtrHD+3
2321  0698 1c0008        	addw	x,#8
2322  069b 1f09          	ldw	(OFST-5,sp),x
2323                     ; 536 			MemcpyFunc((u8 *)&stDataPtrHD, Point, wDataLen);		//复制字符串到缓冲中
2325  069d 7b0a          	ld	a,(OFST-4,sp)
2326  069f 88            	push	a
2327  06a0 1e0e          	ldw	x,(OFST+0,sp)
2328  06a2 89            	pushw	x
2329  06a3 ae0000        	ldw	x,#_stDataPtrHD
2330  06a6 cd0000        	call	_MemcpyFunc
2332  06a9 5b03          	addw	sp,#3
2334                     ; 549 	if( (Packet_End_0!=stDataPtrHD.Buffer[wDataLen-2]) || (Packet_End_1!=stDataPtrHD.Buffer[wDataLen-1]))
2336  06ab 1e09          	ldw	x,(OFST-5,sp)
2337  06ad 1d0002        	subw	x,#2
2338  06b0 d60000        	ld	a,(_stDataPtrHD,x)
2339  06b3 a10d          	cp	a,#13
2340  06b5 268b          	jrne	L735
2342  06b7 1e09          	ldw	x,(OFST-5,sp)
2343  06b9 5a            	decw	x
2344  06ba d60000        	ld	a,(_stDataPtrHD,x)
2345  06bd a10a          	cp	a,#10
2346  06bf 2681          	jrne	L735
2347                     ; 555 	if( stDataPtrHD.Buffer[wDataLen-3] != JX_AddSum8Bit(pnRxBuf+wLen, sizeof(tyProtolHead)+wDataLen+3))
2349  06c1 1e09          	ldw	x,(OFST-5,sp)
2350  06c3 1c0009        	addw	x,#9
2351  06c6 89            	pushw	x
2352  06c7 1e11          	ldw	x,(OFST+3,sp)
2353  06c9 72fb0d        	addw	x,(OFST-1,sp)
2354  06cc cd0000        	call	_JX_AddSum8Bit
2356  06cf 85            	popw	x
2357  06d0 6b01          	ld	(OFST-13,sp),a
2358  06d2 1e09          	ldw	x,(OFST-5,sp)
2359  06d4 1d0003        	subw	x,#3
2360  06d7 d60000        	ld	a,(_stDataPtrHD,x)
2361  06da 1101          	cp	a,(OFST-13,sp)
2362  06dc 2703cc0642    	jrne	L735
2363                     ; 557 		goto __UC_Pro_Exit;
2365                     ; 566 	nSendLen = HD_ProtolHandle();
2367  06e1 ad7e          	call	_HD_ProtolHandle
2369  06e3 6b08          	ld	(OFST-6,sp),a
2370  06e5 cc0642        	jra	L735
2373                     	switch	.const
2374  001d               L736_nAddBuf:
2375  001d 00            	dc.b	0
2376  001e 000000000000  	ds.b	11
2437                     ; 584 u8 HD_AddressComparePro(u8 *pnAddr, u8 nLen)
2437                     ; 585 {		
2438                     	switch	.text
2439  06e8               _HD_AddressComparePro:
2441  06e8 89            	pushw	x
2442  06e9 520e          	subw	sp,#14
2443       0000000e      OFST:	set	14
2446                     ; 586 	u8 nAddBuf[12] = {0};
2448  06eb 96            	ldw	x,sp
2449  06ec 1c0002        	addw	x,#OFST-12
2450  06ef 90ae001d      	ldw	y,#L736_nAddBuf
2451  06f3 a60c          	ld	a,#12
2452  06f5 cd0000        	call	c_xymvx
2454                     ; 587 	u8 nLoop = 0;
2456  06f8 0f0e          	clr	(OFST+0,sp)
2457                     ; 589 	if(JX_IsAllFillDat(pnAddr, 0, nLen))
2459  06fa 7b13          	ld	a,(OFST+5,sp)
2460  06fc b703          	ld	c_lreg+3,a
2461  06fe 3f02          	clr	c_lreg+2
2462  0700 3f01          	clr	c_lreg+1
2463  0702 3f00          	clr	c_lreg
2464  0704 be02          	ldw	x,c_lreg+2
2465  0706 89            	pushw	x
2466  0707 be00          	ldw	x,c_lreg
2467  0709 89            	pushw	x
2468  070a 4b00          	push	#0
2469  070c 1e14          	ldw	x,(OFST+6,sp)
2470  070e cd0000        	call	_JX_IsAllFillDat
2472  0711 5b05          	addw	sp,#5
2473  0713 4d            	tnz	a
2474                     ; 591 		return TRUE;
2476  0714 2647          	jrne	L307
2477                     ; 594 	MemcpyFunc(nAddBuf, &tyParameter.Type, nLen);
2479  0716 7b13          	ld	a,(OFST+5,sp)
2480  0718 88            	push	a
2481  0719 ae0000        	ldw	x,#_tyParameter
2482  071c 89            	pushw	x
2483  071d 96            	ldw	x,sp
2484  071e 1c0005        	addw	x,#OFST-9
2485  0721 cd0000        	call	_MemcpyFunc
2487  0724 5b03          	addw	sp,#3
2488                     ; 597 	for(nLoop = 0; nLoop < nLen; nLoop++)
2490  0726 0f0e          	clr	(OFST+0,sp)
2492  0728 202b          	jra	L576
2493  072a               L176:
2494                     ; 599 		if(nAddBuf[nLoop] != pnAddr[nLoop])
2496  072a 7b0f          	ld	a,(OFST+1,sp)
2497  072c 97            	ld	xl,a
2498  072d 7b10          	ld	a,(OFST+2,sp)
2499  072f 1b0e          	add	a,(OFST+0,sp)
2500  0731 2401          	jrnc	L462
2501  0733 5c            	incw	x
2502  0734               L462:
2503  0734 02            	rlwa	x,a
2504  0735 f6            	ld	a,(x)
2505  0736 6b01          	ld	(OFST-13,sp),a
2506  0738 96            	ldw	x,sp
2507  0739 1c0002        	addw	x,#OFST-12
2508  073c 9f            	ld	a,xl
2509  073d 5e            	swapw	x
2510  073e 1b0e          	add	a,(OFST+0,sp)
2511  0740 2401          	jrnc	L662
2512  0742 5c            	incw	x
2513  0743               L662:
2514  0743 02            	rlwa	x,a
2515  0744 f6            	ld	a,(x)
2516  0745 1101          	cp	a,(OFST-13,sp)
2517  0747 270a          	jreq	L107
2518                     ; 601 			break;
2519  0749               L776:
2520                     ; 605 	if(nLen > nLoop)
2522  0749 7b13          	ld	a,(OFST+5,sp)
2523  074b 110e          	cp	a,(OFST+0,sp)
2524  074d 230e          	jrule	L307
2525                     ; 607 		return FALSE;
2527  074f 4f            	clr	a
2529  0750               L072:
2531  0750 5b10          	addw	sp,#16
2532  0752 81            	ret	
2533  0753               L107:
2534                     ; 597 	for(nLoop = 0; nLoop < nLen; nLoop++)
2536  0753 0c0e          	inc	(OFST+0,sp)
2537  0755               L576:
2540  0755 7b0e          	ld	a,(OFST+0,sp)
2541  0757 1113          	cp	a,(OFST+5,sp)
2542  0759 25cf          	jrult	L176
2543  075b 20ec          	jra	L776
2544  075d               L307:
2545                     ; 610 	return TRUE;	
2548  075d a601          	ld	a,#1
2550  075f 20ef          	jra	L072
2638                     ; 623 u8 HD_ProtolHandle(void)
2638                     ; 624 {
2639                     	switch	.text
2640  0761               _HD_ProtolHandle:
2642  0761 520e          	subw	sp,#14
2643       0000000e      OFST:	set	14
2646                     ; 625 	u8 nSendLen    = 0;
2648  0763 0f0e          	clr	(OFST+0,sp)
2649                     ; 626 	u16 wCommCtrlB = 0;
2651  0765 5f            	clrw	x
2652  0766 1f03          	ldw	(OFST-11,sp),x
2653                     ; 627 	u16 wCommPid   = 0;
2655  0768 1f05          	ldw	(OFST-9,sp),x
2656                     ; 628 	u8  nParaLen   = 0;
2658  076a 0f07          	clr	(OFST-7,sp)
2659                     ; 631 	int32_t dwTimeOffset = 0; 
2661  076c 1f0a          	ldw	(OFST-4,sp),x
2662  076e 1f08          	ldw	(OFST-6,sp),x
2663                     ; 632 	u8 nCmdId  = 0;
2665                     ; 633 	u8 nctrl  = 0;
2667                     ; 635 	nCmdId   = stDataPtrHD.Packet.Cmd;
2669  0770 c60005        	ld	a,_stDataPtrHD+5
2670  0773 6b0c          	ld	(OFST-2,sp),a
2671                     ; 636 	nctrl	=  stDataPtrHD.Packet.Ctrl[0];
2673  0775 c60000        	ld	a,_stDataPtrHD
2674  0778 6b0d          	ld	(OFST-1,sp),a
2675                     ; 637 	g_HD_Msg_Tag = stDataPtrHD.Packet.Ctrl[1]<<8 | stDataPtrHD.Packet.Ctrl[2]+1;
2677  077a 4f            	clr	a
2678  077b 97            	ld	xl,a
2679  077c 4c            	inc	a
2680  077d cb0002        	add	a,_stDataPtrHD+2
2681  0780 2401          	jrnc	L472
2682  0782 5c            	incw	x
2683  0783               L472:
2684  0783 02            	rlwa	x,a
2685  0784 1f01          	ldw	(OFST-13,sp),x
2686  0786 c60001        	ld	a,_stDataPtrHD+1
2687  0789 97            	ld	xl,a
2688  078a 7b02          	ld	a,(OFST-12,sp)
2689  078c 01            	rrwa	x,a
2690  078d 1a01          	or	a,(OFST-13,sp)
2691  078f 01            	rrwa	x,a
2692  0790 cf008d        	ldw	_g_HD_Msg_Tag,x
2693                     ; 639 	if(nctrl&Flag_Data_Is_Secret) //数据是否被加密
2695  0793 7b0d          	ld	a,(OFST-1,sp)
2696  0795 2a04          	jrpl	L577
2697                     ; 641 		return 0;
2699  0797 4f            	clr	a
2701  0798 cc084a        	jra	L633
2702  079b               L577:
2703                     ; 648 	switch(nCmdId)
2705  079b 7b0c          	ld	a,(OFST-2,sp)
2707                     ; 713 		default:break;
2708  079d a00f          	sub	a,#15
2709  079f 2730          	jreq	L507
2710  07a1 a072          	sub	a,#114
2711  07a3 2739          	jreq	L707
2712  07a5 4a            	dec	a
2713  07a6 273e          	jreq	L117
2714  07a8 a002          	sub	a,#2
2715  07aa 2742          	jreq	L317
2716  07ac 4a            	dec	a
2717  07ad 2751          	jreq	L517
2718  07af 4a            	dec	a
2719  07b0 2756          	jreq	L717
2720  07b2 a003          	sub	a,#3
2721  07b4 275a          	jreq	L127
2722  07b6 a008          	sub	a,#8
2723  07b8 275e          	jreq	L327
2724  07ba 4a            	dec	a
2725  07bb 2763          	jreq	L527
2726  07bd a002          	sub	a,#2
2727  07bf 2767          	jreq	L727
2728  07c1 4a            	dec	a
2729  07c2 273c          	jreq	L517
2730  07c4 4a            	dec	a
2731  07c5 2769          	jreq	L337
2732  07c7 a003          	sub	a,#3
2733  07c9 276d          	jreq	L537
2734  07cb a007          	sub	a,#7
2735  07cd 2771          	jreq	L737
2736  07cf 2077          	jra	L1001
2737  07d1               L507:
2738                     ; 651 		case HeDa_Cmd_Reply_Upload:
2738                     ; 652 			HeDa_Cmd_Reply_Upload_Handle(stDataPtrHD.Packet.Buf,nctrl);
2740  07d1 7b0d          	ld	a,(OFST-1,sp)
2741  07d3 88            	push	a
2742  07d4 ae0006        	ldw	x,#_stDataPtrHD+6
2743  07d7 ad74          	call	_HeDa_Cmd_Reply_Upload_Handle
2745  07d9 84            	pop	a
2746                     ; 653 			nSendLen=0;
2748  07da 0f0e          	clr	(OFST+0,sp)
2749                     ; 654 			break;
2751  07dc 206a          	jra	L1001
2752  07de               L707:
2753                     ; 656 		case HeDa_Cmd_Set_Sampling_Interval://设置采样间隔（上行、下行）
2753                     ; 657 			nSendLen=HeDa_Cmd_Set_Sampling_Interval_Handle(stDataPtrHD.Packet.Buf);
2755  07de ae0006        	ldw	x,#_stDataPtrHD+6
2756  07e1 cd08ae        	call	_HeDa_Cmd_Set_Sampling_Interval_Handle
2758                     ; 658 			break;
2760  07e4 2060          	jp	LC006
2761  07e6               L117:
2762                     ; 660 		case HeDa_Cmd_Set_Net_Param://设置网络参数（上行、下行）
2762                     ; 661 			nSendLen=HeDa_Cmd_Set_Net_Param_Handle((HD_CmdSetNetParam *)&stDataPtrHD.Packet.Buf);
2764  07e6 ae0006        	ldw	x,#_stDataPtrHD+6
2765  07e9 cd08e9        	call	_HeDa_Cmd_Set_Net_Param_Handle
2767                     ; 662 			break;
2769  07ec 2058          	jp	LC006
2770  07ee               L317:
2771                     ; 664 		case HeDa_Cmd_Set_Report_Cycle://设置上报周期（上行、下行）
2771                     ; 665 			nSendLen==HeDa_Cmd_Set_Report_Cycle_Handle(stDataPtrHD.Packet.Buf);
2773  07ee ae0006        	ldw	x,#_stDataPtrHD+6
2774  07f1 cd0a4e        	call	_HeDa_Cmd_Set_Report_Cycle_Handle
2776  07f4 110e          	cp	a,(OFST+0,sp)
2777  07f6 2605          	jrne	L403
2778  07f8 ae0001        	ldw	x,#1
2779  07fb 204b          	jra	L1001
2780  07fd               L403:
2781  07fd 5f            	clrw	x
2782                     ; 666 			break;
2784  07fe 2048          	jra	L1001
2785  0800               L517:
2786                     ; 668 		case HeDa_Cmd_Set_Pressure_Threshold://设置压力上下限阈值（上行、下行）
2786                     ; 669 			nSendLen=HeDa_Cmd_Get_Pressure_Threshold_Handle(stDataPtrHD.Packet.Buf);
2789  0800 ae0006        	ldw	x,#_stDataPtrHD+6
2790  0803 cd0ca4        	call	_HeDa_Cmd_Get_Pressure_Threshold_Handle
2792                     ; 670 			break;
2794  0806 203e          	jp	LC006
2795  0808               L717:
2796                     ; 672 		case HeDa_Cmd_Set_Secret_Key://设置秘钥（上行、下行）——预留
2796                     ; 673 			nSendLen=HeDa_Cmd_Set_Secret_Key_Handle(stDataPtrHD.Packet.Buf);
2798  0808 ae0006        	ldw	x,#_stDataPtrHD+6
2799  080b cd0cc3        	call	_HeDa_Cmd_Set_Secret_Key_Handle
2801                     ; 674 			break;
2803  080e 2036          	jp	LC006
2804  0810               L127:
2805                     ; 676 		case HeDa_Cmd_Set_Addr://-------设置表地址    	和达原协议没有，自己添加
2805                     ; 677 			nSendLen=HeDa_Cmd_Get_Addr_Handle(stDataPtrHD.Packet.Buf);
2807  0810 ae0006        	ldw	x,#_stDataPtrHD+6
2808  0813 cd0d43        	call	_HeDa_Cmd_Get_Addr_Handle
2810                     ; 678 			break;
2812  0816 202e          	jp	LC006
2813  0818               L327:
2814                     ; 682 		case HeDa_Cmd_Get_Sampling_Interval://查询采样间隔（上行、下行）
2814                     ; 683 			nSendLen=HeDa_Cmd_Get_Sampling_Interval_Handle(stDataPtrHD.Packet.Buf);
2816  0818 ae0006        	ldw	x,#_stDataPtrHD+6
2817  081b cd08e2        	call	_HeDa_Cmd_Get_Sampling_Interval_Handle
2819                     ; 684 			break;
2821  081e 2026          	jp	LC006
2822  0820               L527:
2823                     ; 686 		case HeDa_Cmd_Get_Net_Param://查询网络参数（上行、下行）
2823                     ; 687 			nSendLen=HeDa_Cmd_Get_Net_Param_Handle(stDataPtrHD.Packet.Buf);
2825  0820 ae0006        	ldw	x,#_stDataPtrHD+6
2826  0823 cd0a0b        	call	_HeDa_Cmd_Get_Net_Param_Handle
2828                     ; 688 			break;
2830  0826 201e          	jp	LC006
2831  0828               L727:
2832                     ; 690 		case HeDa_Cmd_Get_Report_Cycle://查询上报周期（上行、下行）
2832                     ; 691 			nSendLen=HeDa_Cmd_Get_Report_Cycle_Handle(stDataPtrHD.Packet.Buf);
2834  0828 ae0006        	ldw	x,#_stDataPtrHD+6
2835  082b cd0aa3        	call	_HeDa_Cmd_Get_Report_Cycle_Handle
2837                     ; 692 			break;
2839  082e 2016          	jp	LC006
2840                     ; 694 		case HeDa_Cmd_Get_Pressure_Threshold://查询压力上下限阈值（上行、下行）
2840                     ; 695 			nSendLen=HeDa_Cmd_Get_Pressure_Threshold_Handle(stDataPtrHD.Packet.Buf);
2842                     ; 696 			break;
2844  0830               L337:
2845                     ; 698 		case HeDa_Cmd_Get_Secret_Key://查询秘钥（上行、下行）——预留
2845                     ; 699 			nSendLen=HeDa_Cmd_Get_Secret_Key_Handle(stDataPtrHD.Packet.Buf);
2847  0830 ae0006        	ldw	x,#_stDataPtrHD+6
2848  0833 cd0ce6        	call	_HeDa_Cmd_Get_Secret_Key_Handle
2850                     ; 700 			break;
2852  0836 200e          	jp	LC006
2853  0838               L537:
2854                     ; 702 		case HeDa_Cmd_Get_Addr://-------查询表地址    	和达原协议没有，自己添加
2854                     ; 703 			nSendLen=HeDa_Cmd_Get_Addr_Handle(stDataPtrHD.Packet.Buf);
2856  0838 ae0006        	ldw	x,#_stDataPtrHD+6
2857  083b cd0d43        	call	_HeDa_Cmd_Get_Addr_Handle
2859                     ; 704 			break;
2861  083e 2006          	jp	LC006
2862  0840               L737:
2863                     ; 707 		case HeDa_Cmd_Get_All_Param://获取所有参数（上行、下行）
2863                     ; 708 			nSendLen=HeDa_Cmd_Get_All_Param_Handle(stDataPtrHD.Packet.Buf);
2865  0840 ae0006        	ldw	x,#_stDataPtrHD+6
2866  0843 cd0d4f        	call	_HeDa_Cmd_Get_All_Param_Handle
2868  0846               LC006:
2869  0846 6b0e          	ld	(OFST+0,sp),a
2870                     ; 709 			break;
2872                     ; 710 		case HeDa_Cmd_Get_Appoint_Data://获取指定数据（上行、下行）
2872                     ; 711 			break;
2874                     ; 713 		default:break;
2876  0848               L1001:
2877                     ; 716 	return nSendLen;
2879  0848 7b0e          	ld	a,(OFST+0,sp)
2881  084a               L633:
2883  084a 5b0e          	addw	sp,#14
2884  084c 81            	ret	
3010                     ; 728 void HeDa_Cmd_Reply_Upload_Handle(u8 *pData,u8 ctrl)
3010                     ; 729 {
3011                     	switch	.text
3012  084d               _HeDa_Cmd_Reply_Upload_Handle:
3014  084d 89            	pushw	x
3015  084e 520f          	subw	sp,#15
3016       0000000f      OFST:	set	15
3019                     ; 731 	u8 byte_manage=0;//管理字
3021  0850 0f0f          	clr	(OFST+0,sp)
3022                     ; 734 	if((stDataPtrHD.Packet.Data_Len-1) < 9)//数据域长度不够
3024  0852 ce0003        	ldw	x,_stDataPtrHD+3
3025  0855 5a            	decw	x
3026  0856 a30009        	cpw	x,#9
3027  0859 2537          	jrult	L453
3028                     ; 736 		return;
3030                     ; 739 	MemcpyFunc((u8 *)&time_Server, pData, sizeof(TIME_BIN));
3032  085b 4b06          	push	#6
3033  085d 1e11          	ldw	x,(OFST+2,sp)
3034  085f 89            	pushw	x
3035  0860 96            	ldw	x,sp
3036  0861 1c0004        	addw	x,#OFST-11
3037  0864 cd0000        	call	_MemcpyFunc
3039  0867 5b03          	addw	sp,#3
3040                     ; 740 	byte_manage = *(pData+6);
3042  0869 1e10          	ldw	x,(OFST+1,sp)
3043  086b e606          	ld	a,(6,x)
3044  086d 6b0f          	ld	(OFST+0,sp),a
3045                     ; 743 	MemcpyFunc(&stTimeNow.wYear, pData, 6);
3047  086f 4b06          	push	#6
3048  0871 1e11          	ldw	x,(OFST+2,sp)
3049  0873 89            	pushw	x
3050  0874 ae0000        	ldw	x,#_stTimeNow
3051  0877 cd0000        	call	_MemcpyFunc
3053  087a 5b03          	addw	sp,#3
3054                     ; 744 	TM_TimeChangeAToB(&stTimeNow, &stEnd);
3056  087c 96            	ldw	x,sp
3057  087d 1c0007        	addw	x,#OFST-8
3058  0880 89            	pushw	x
3059  0881 ae0000        	ldw	x,#_stTimeNow
3060  0884 cd0000        	call	_TM_TimeChangeAToB
3062  0887 85            	popw	x
3063                     ; 745 	if(FALSE == TM_IsValidTimePro(&stEnd))
3065  0888 96            	ldw	x,sp
3066  0889 1c0007        	addw	x,#OFST-8
3067  088c cd0000        	call	_TM_IsValidTimePro
3069  088f 4d            	tnz	a
3070  0890 2603          	jrne	L7501
3071                     ; 747 		return;
3072  0892               L453:
3075  0892 5b11          	addw	sp,#17
3076  0894 81            	ret	
3077  0895               L7501:
3078                     ; 749 	STM8_RTC_Set(&stTimeNow);	
3080  0895 ae0000        	ldw	x,#_stTimeNow
3081  0898 cd0000        	call	_STM8_RTC_Set
3083                     ; 752 	m_nUploadMode = UP_Free_HD;
3085  089b 35050000      	mov	_m_nUploadMode,#5
3086                     ; 754 	if(ctrl&Flag_Data_Is_Finish)
3088  089f 7b14          	ld	a,(OFST+5,sp)
3089  08a1 a540          	bcp	a,#64
3090  08a3 26ed          	jrne	L453
3092                     ; 760 		if(0xFF == byte_manage)//表示该字段无效
3094  08a5 7b0f          	ld	a,(OFST+0,sp)
3095  08a7 4c            	inc	a
3096  08a8 27e8          	jreq	L453
3098                     ; 763 		else if(0x00 == byte_manage)//可以结束本次通讯
3100  08aa 0d0f          	tnz	(OFST+0,sp)
3101                     ; 768 }
3103  08ac 20e4          	jra	L453
3151                     ; 779 u8 HeDa_Cmd_Set_Sampling_Interval_Handle(u8 *pData)
3151                     ; 780 {
3152                     	switch	.text
3153  08ae               _HeDa_Cmd_Set_Sampling_Interval_Handle:
3155  08ae 89            	pushw	x
3156  08af 88            	push	a
3157       00000001      OFST:	set	1
3160                     ; 782 	if((stDataPtrHD.Packet.Data_Len-1) < 2)//数据域长度不够
3162  08b0 ce0003        	ldw	x,_stDataPtrHD+3
3163  08b3 5a            	decw	x
3164  08b4 a30002        	cpw	x,#2
3165  08b7 1e02          	ldw	x,(OFST+1,sp)
3166  08b9 240a          	jruge	L3111
3167                     ; 784 		*pData=0x10;	  //设置失败
3169  08bb a610          	ld	a,#16
3170  08bd f7            	ld	(x),a
3171                     ; 785 		*(pData+1)=tyReport.wGatherCycle;//终端当前采样间隔，分钟
3173  08be c60000        	ld	a,_tyReport
3174  08c1 e701          	ld	(1,x),a
3176  08c3 2018          	jra	L5111
3177  08c5               L3111:
3178                     ; 789 		u8 hd_samling_interval=*pData;//采样间隔
3180  08c5 f6            	ld	a,(x)
3181  08c6 6b01          	ld	(OFST+0,sp),a
3182                     ; 790 		*pData=0x01;	  //设置成功
3184  08c8 a601          	ld	a,#1
3185  08ca f7            	ld	(x),a
3186                     ; 791 		*(pData+1)=hd_samling_interval;//终端当前采样间隔，分钟
3188  08cb 7b01          	ld	a,(OFST+0,sp)
3189  08cd e701          	ld	(1,x),a
3190                     ; 794 		tyReport.wGatherCycle = hd_samling_interval;
3192  08cf c70000        	ld	_tyReport,a
3193                     ; 795 		SaveParameterForType((u8 *)&tyReport, REPOERCYCLE_LEN, REPORT_PARA);
3195  08d2 4b03          	push	#3
3196  08d4 4b0a          	push	#10
3197  08d6 ae0000        	ldw	x,#_tyReport
3198  08d9 cd0000        	call	_SaveParameterForType
3200  08dc 85            	popw	x
3201  08dd               L5111:
3202                     ; 798 	return 2;
3204  08dd a602          	ld	a,#2
3207  08df 5b03          	addw	sp,#3
3208  08e1 81            	ret	
3246                     ; 811 u8 HeDa_Cmd_Get_Sampling_Interval_Handle(u8 *pData)
3246                     ; 812 {
3247                     	switch	.text
3248  08e2               _HeDa_Cmd_Get_Sampling_Interval_Handle:
3252                     ; 813 	*pData=tyReport.wGatherCycle;
3254  08e2 c60000        	ld	a,_tyReport
3255  08e5 f7            	ld	(x),a
3256                     ; 814 	return 1;
3258  08e6 a601          	ld	a,#1
3261  08e8 81            	ret	
3378                     ; 827 u8 HeDa_Cmd_Set_Net_Param_Handle(HD_CmdSetNetParam *pData)
3378                     ; 828 {
3379                     	switch	.text
3380  08e9               _HeDa_Cmd_Set_Net_Param_Handle:
3382  08e9 89            	pushw	x
3383  08ea 89            	pushw	x
3384       00000002      OFST:	set	2
3387                     ; 829 	u8 flag_change_response=0;//修改内容结果标志位
3389  08eb 0f02          	clr	(OFST+0,sp)
3390                     ; 831 	if((stDataPtrHD.Packet.Data_Len-1) < sizeof(HD_CmdSetNetParam))//数据域长度不够
3392  08ed ce0003        	ldw	x,_stDataPtrHD+3
3393  08f0 5a            	decw	x
3394  08f1 a3003c        	cpw	x,#60
3395  08f4 2404          	jruge	L5021
3396                     ; 833 		return 0;
3398  08f6 4f            	clr	a
3400  08f7 cc0a08        	jra	L014
3401  08fa               L5021:
3402                     ; 837 	if(pData->flag_change & 0x01)//设置IP地址
3404  08fa 1e03          	ldw	x,(OFST+1,sp)
3405  08fc f6            	ld	a,(x)
3406  08fd a501          	bcp	a,#1
3407  08ff 271f          	jreq	L7021
3408                     ; 839 		flag_change_response |=0x01;
3410  0901 7b02          	ld	a,(OFST+0,sp)
3411  0903 aa01          	or	a,#1
3412  0905 6b02          	ld	(OFST+0,sp),a
3413                     ; 840 		tyReportParameter.Main_IP=pData->ip_addr;
3415  0907 e604          	ld	a,(4,x)
3416  0909 c70003        	ld	_tyReportParameter+3,a
3417  090c e603          	ld	a,(3,x)
3418  090e c70002        	ld	_tyReportParameter+2,a
3419  0911 e602          	ld	a,(2,x)
3420  0913 c70001        	ld	_tyReportParameter+1,a
3421  0916 e601          	ld	a,(1,x)
3422  0918 c70000        	ld	_tyReportParameter,a
3423                     ; 841 		tyReportParameter.flag_Login_Mode=HD_Login_IP;
3425  091b 35010026      	mov	_tyReportParameter+38,#1
3426  091f f6            	ld	a,(x)
3427  0920               L7021:
3428                     ; 843 	if(pData->flag_change & 0x04)//设置域名
3430  0920 a504          	bcp	a,#4
3431  0922 2726          	jreq	L1121
3432                     ; 845 		if(pData->flag_change & 0x01)//如果设置了IP地址
3434  0924 a501          	bcp	a,#1
3435  0926 2708          	jreq	L3121
3436                     ; 847 			flag_change_response |=0x40;
3438  0928 7b02          	ld	a,(OFST+0,sp)
3439  092a aa40          	or	a,#64
3440  092c 6b02          	ld	(OFST+0,sp),a
3442  092e 201a          	jra	L1121
3443  0930               L3121:
3444                     ; 851 			flag_change_response |=0x04;		
3446  0930 7b02          	ld	a,(OFST+0,sp)
3447  0932 aa04          	or	a,#4
3448  0934 6b02          	ld	(OFST+0,sp),a
3449                     ; 852 			MemcpyFunc((u8 *)&tyReportParameter.Main_domain_name, pData->domain_name, 32);
3451  0936 4b20          	push	#32
3452  0938 1e04          	ldw	x,(OFST+2,sp)
3453  093a 1c0007        	addw	x,#7
3454  093d 89            	pushw	x
3455  093e ae0006        	ldw	x,#_tyReportParameter+6
3456  0941 cd0000        	call	_MemcpyFunc
3458  0944 5b03          	addw	sp,#3
3459                     ; 853 			tyReportParameter.flag_Login_Mode=HD_Login_Domain_Name;
3461  0946 35020026      	mov	_tyReportParameter+38,#2
3462  094a               L1121:
3463                     ; 857 	if(pData->flag_change & 0x02)//设置端口号
3465  094a 1e03          	ldw	x,(OFST+1,sp)
3466  094c f6            	ld	a,(x)
3467  094d a502          	bcp	a,#2
3468  094f 270e          	jreq	L7121
3469                     ; 859 		flag_change_response |=0x02;
3471  0951 7b02          	ld	a,(OFST+0,sp)
3472  0953 aa02          	or	a,#2
3473  0955 6b02          	ld	(OFST+0,sp),a
3474                     ; 860 		tyReportParameter.Main_Port=pData->port;
3476  0957 ee05          	ldw	x,(5,x)
3477  0959 cf0004        	ldw	_tyReportParameter+4,x
3478  095c 1e03          	ldw	x,(OFST+1,sp)
3479  095e f6            	ld	a,(x)
3480  095f               L7121:
3481                     ; 862 	if(pData->flag_change & 0x08)//设置apn接入点
3483  095f a508          	bcp	a,#8
3484  0961 2759          	jreq	L1221
3485                     ; 864 		u8 apn_len=0;
3487                     ; 865 		apn_len=HeDa_Get_String_len(pData->apn_point,20);
3489  0963 4b14          	push	#20
3490  0965 1e04          	ldw	x,(OFST+2,sp)
3491  0967 1c0027        	addw	x,#39
3492  096a cd0000        	call	_HeDa_Get_String_len
3494  096d 5b01          	addw	sp,#1
3495  096f 6b01          	ld	(OFST-1,sp),a
3496                     ; 866 		if(apn_len>18 || apn_len==0)//设置apn失败
3498  0971 a113          	cp	a,#19
3499  0973 2404          	jruge	L5221
3501  0975 7b01          	ld	a,(OFST-1,sp)
3502  0977 2608          	jrne	L3221
3503  0979               L5221:
3504                     ; 868 			flag_change_response |=0x80;
3506  0979 7b02          	ld	a,(OFST+0,sp)
3507  097b aa80          	or	a,#128
3508  097d 6b02          	ld	(OFST+0,sp),a
3510  097f 203b          	jra	L1221
3511  0981               L3221:
3512                     ; 872 			flag_change_response |=0x08;
3514  0981 7b02          	ld	a,(OFST+0,sp)
3515  0983 aa08          	or	a,#8
3516  0985 6b02          	ld	(OFST+0,sp),a
3517                     ; 873 			MemsetFunc((u8 *)&g_nApnBuf[1], 0,20-1);
3519  0987 4b13          	push	#19
3520  0989 4b00          	push	#0
3521  098b ae0001        	ldw	x,#_g_nApnBuf+1
3522  098e cd0000        	call	_MemsetFunc
3524  0991 85            	popw	x
3525                     ; 874 			MemcpyFunc((u8 *)&g_nApnBuf[1],pData->apn_point,apn_len);
3527  0992 7b01          	ld	a,(OFST-1,sp)
3528  0994 88            	push	a
3529  0995 1e04          	ldw	x,(OFST+2,sp)
3530  0997 1c0027        	addw	x,#39
3531  099a 89            	pushw	x
3532  099b ae0001        	ldw	x,#_g_nApnBuf+1
3533  099e cd0000        	call	_MemcpyFunc
3535  09a1 5b03          	addw	sp,#3
3536                     ; 875 			JX_StringCat(g_nApnBuf, "\"", 2);
3538  09a3 4b02          	push	#2
3539  09a5 ae005b        	ldw	x,#L1321
3540  09a8 89            	pushw	x
3541  09a9 ae0000        	ldw	x,#_g_nApnBuf
3542  09ac cd0000        	call	_JX_StringCat
3544  09af 5b03          	addw	sp,#3
3545                     ; 876 			SaveParameterForType((u8 *)&g_nApnType, APN_LEN, APN_PARA);
3547  09b1 4b02          	push	#2
3548  09b3 4b14          	push	#20
3549  09b5 ae0000        	ldw	x,#_g_nApnType
3550  09b8 cd0000        	call	_SaveParameterForType
3552  09bb 85            	popw	x
3553  09bc               L1221:
3554                     ; 879 	SaveParameterForType((u8 *)&tyReportParameter, ADDRESS_IPPARA_LEN, IPANDPORT_PARA);
3556  09bc 4b01          	push	#1
3557  09be 4b27          	push	#39
3558  09c0 ae0000        	ldw	x,#_tyReportParameter
3559  09c3 cd0000        	call	_SaveParameterForType
3561  09c6 85            	popw	x
3562                     ; 881 	pData->flag_change=flag_change_response;
3564  09c7 7b02          	ld	a,(OFST+0,sp)
3565  09c9 1e03          	ldw	x,(OFST+1,sp)
3566  09cb f7            	ld	(x),a
3567                     ; 882 	pData->ip_addr=tyReportParameter.Main_IP;
3569  09cc c60003        	ld	a,_tyReportParameter+3
3570  09cf e704          	ld	(4,x),a
3571  09d1 c60002        	ld	a,_tyReportParameter+2
3572  09d4 e703          	ld	(3,x),a
3573  09d6 c60001        	ld	a,_tyReportParameter+1
3574  09d9 e702          	ld	(2,x),a
3575  09db c60000        	ld	a,_tyReportParameter
3576  09de e701          	ld	(1,x),a
3577                     ; 883 	pData->port=tyReportParameter.Main_Port;
3579  09e0 90ce0004      	ldw	y,_tyReportParameter+4
3580  09e4 ef05          	ldw	(5,x),y
3581                     ; 884 	MemcpyFunc( pData->domain_name,(u8 *)&tyReportParameter.Main_domain_name, 32);
3583  09e6 4b20          	push	#32
3584  09e8 ae0006        	ldw	x,#_tyReportParameter+6
3585  09eb 89            	pushw	x
3586  09ec 1e06          	ldw	x,(OFST+4,sp)
3587  09ee 1c0007        	addw	x,#7
3588  09f1 cd0000        	call	_MemcpyFunc
3590  09f4 5b03          	addw	sp,#3
3591                     ; 885 	MemcpyFunc( pData->apn_point, g_nApnBuf,20);
3593  09f6 4b14          	push	#20
3594  09f8 ae0000        	ldw	x,#_g_nApnBuf
3595  09fb 89            	pushw	x
3596  09fc 1e06          	ldw	x,(OFST+4,sp)
3597  09fe 1c0027        	addw	x,#39
3598  0a01 cd0000        	call	_MemcpyFunc
3600  0a04 5b03          	addw	sp,#3
3601                     ; 887 	return sizeof(HD_CmdSetNetParam);
3603  0a06 a63c          	ld	a,#60
3605  0a08               L014:
3607  0a08 5b04          	addw	sp,#4
3608  0a0a 81            	ret	
3657                     ; 899 u8 HeDa_Cmd_Get_Net_Param_Handle(u8 *pData)
3657                     ; 900 {
3658                     	switch	.text
3659  0a0b               _HeDa_Cmd_Get_Net_Param_Handle:
3661  0a0b 89            	pushw	x
3662  0a0c 523c          	subw	sp,#60
3663       0000003c      OFST:	set	60
3666                     ; 903 	temp.ip_addr=tyReportParameter.Main_IP;
3668  0a0e ce0002        	ldw	x,_tyReportParameter+2
3669  0a11 1f04          	ldw	(OFST-56,sp),x
3670  0a13 ce0000        	ldw	x,_tyReportParameter
3671  0a16 1f02          	ldw	(OFST-58,sp),x
3672                     ; 904 	temp.port=tyReportParameter.Main_Port;
3674  0a18 ce0004        	ldw	x,_tyReportParameter+4
3675  0a1b 1f06          	ldw	(OFST-54,sp),x
3676                     ; 905 	MemcpyFunc((u8 *)&temp.domain_name,(u8 *)&tyReportParameter.Main_domain_name,32);
3678  0a1d 4b20          	push	#32
3679  0a1f ae0006        	ldw	x,#_tyReportParameter+6
3680  0a22 89            	pushw	x
3681  0a23 96            	ldw	x,sp
3682  0a24 1c000b        	addw	x,#OFST-49
3683  0a27 cd0000        	call	_MemcpyFunc
3685  0a2a 5b03          	addw	sp,#3
3686                     ; 906 	MemcpyFunc((u8 *)&temp.apn_point,g_nApnBuf,20);
3688  0a2c 4b14          	push	#20
3689  0a2e ae0000        	ldw	x,#_g_nApnBuf
3690  0a31 89            	pushw	x
3691  0a32 96            	ldw	x,sp
3692  0a33 1c002b        	addw	x,#OFST-17
3693  0a36 cd0000        	call	_MemcpyFunc
3695  0a39 5b03          	addw	sp,#3
3696                     ; 908 	MemcpyFunc(pData,(u8 *)&temp.ip_addr,sizeof(HD_CmdSetNetParam)-1);
3698  0a3b 4b3b          	push	#59
3699  0a3d 96            	ldw	x,sp
3700  0a3e 1c0003        	addw	x,#OFST-57
3701  0a41 89            	pushw	x
3702  0a42 1e40          	ldw	x,(OFST+4,sp)
3703  0a44 cd0000        	call	_MemcpyFunc
3705  0a47 5b03          	addw	sp,#3
3706                     ; 909 	return sizeof(HD_CmdSetNetParam)-1;
3708  0a49 a63b          	ld	a,#59
3711  0a4b 5b3e          	addw	sp,#62
3712  0a4d 81            	ret	
3760                     ; 921 u8 HeDa_Cmd_Set_Report_Cycle_Handle(u8 *pData)
3760                     ; 922 {
3761                     	switch	.text
3762  0a4e               _HeDa_Cmd_Set_Report_Cycle_Handle:
3764  0a4e 89            	pushw	x
3765  0a4f 88            	push	a
3766       00000001      OFST:	set	1
3769                     ; 923 	u8 hd_cycle=0;//上报周期缓存
3771  0a50 0f01          	clr	(OFST+0,sp)
3772                     ; 925 	if((stDataPtrHD.Packet.Data_Len-1) < 1)//数据域长度不够
3774  0a52 ce0003        	ldw	x,_stDataPtrHD+3
3775  0a55 5a            	decw	x
3776  0a56 2603          	jrne	L5721
3777                     ; 927 		return 0;
3779  0a58 4f            	clr	a
3781  0a59 2021          	jra	L234
3782  0a5b               L5721:
3783                     ; 930 	hd_cycle=*pData;
3785  0a5b 1e02          	ldw	x,(OFST+1,sp)
3786  0a5d f6            	ld	a,(x)
3787  0a5e 6b01          	ld	(OFST+0,sp),a
3788                     ; 931 	if( (hd_cycle<HeDa_Report_Cycle_Min) || (hd_cycle<HeDa_Report_Cycle_Max))
3790  0a60 a137          	cp	a,#55
3791  0a62 2504          	jrult	L1031
3793  0a64 a147          	cp	a,#71
3794  0a66 2417          	jruge	L7721
3795  0a68               L1031:
3796                     ; 933 		*pData=0x10;//设置失败
3798  0a68 a610          	ld	a,#16
3799  0a6a f7            	ld	(x),a
3800                     ; 934 		*(pData+1)=HeDa_TypeAddCycle_To_ReportCycleType(tyReport.nIntervalType,tyReport.cycle);
3802  0a6b c60002        	ld	a,_tyReport+2
3803  0a6e 97            	ld	xl,a
3804  0a6f c60001        	ld	a,_tyReport+1
3805  0a72 95            	ld	xh,a
3806  0a73 cd0b54        	call	_HeDa_TypeAddCycle_To_ReportCycleType
3808  0a76 1e02          	ldw	x,(OFST+1,sp)
3809  0a78 e701          	ld	(1,x),a
3811  0a7a               L3031:
3812                     ; 944 	return 2;
3814  0a7a a602          	ld	a,#2
3816  0a7c               L234:
3818  0a7c 5b03          	addw	sp,#3
3819  0a7e 81            	ret	
3820  0a7f               L7721:
3821                     ; 938 		*pData=0x01;//设置成功
3823  0a7f a601          	ld	a,#1
3824  0a81 f7            	ld	(x),a
3825                     ; 939 		HeDa_ReportCycleType_To_TypeAddCycle(hd_cycle,&tyReport.nIntervalType,&tyReport.cycle);
3827  0a82 ae0002        	ldw	x,#_tyReport+2
3828  0a85 89            	pushw	x
3829  0a86 ae0001        	ldw	x,#_tyReport+1
3830  0a89 89            	pushw	x
3831  0a8a 7b05          	ld	a,(OFST+4,sp)
3832  0a8c ad28          	call	_HeDa_ReportCycleType_To_TypeAddCycle
3834  0a8e 5b04          	addw	sp,#4
3835                     ; 940 		*(pData+1)=hd_cycle;
3837  0a90 7b01          	ld	a,(OFST+0,sp)
3838  0a92 1e02          	ldw	x,(OFST+1,sp)
3839  0a94 e701          	ld	(1,x),a
3840                     ; 941 		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);//保存到eeprom中
3842  0a96 4b03          	push	#3
3843  0a98 4b0a          	push	#10
3844  0a9a ae0000        	ldw	x,#_tyReport
3845  0a9d cd0000        	call	_SaveParameterForType
3847  0aa0 85            	popw	x
3848  0aa1 20d7          	jra	L3031
3886                     ; 956 u8 HeDa_Cmd_Get_Report_Cycle_Handle(u8 *pData)
3886                     ; 957 {
3887                     	switch	.text
3888  0aa3               _HeDa_Cmd_Get_Report_Cycle_Handle:
3890  0aa3 89            	pushw	x
3891       00000000      OFST:	set	0
3894                     ; 958 	*pData=HeDa_TypeAddCycle_To_ReportCycleType(tyReport.nIntervalType,tyReport.cycle);;
3896  0aa4 c60002        	ld	a,_tyReport+2
3897  0aa7 97            	ld	xl,a
3898  0aa8 c60001        	ld	a,_tyReport+1
3899  0aab 95            	ld	xh,a
3900  0aac cd0b54        	call	_HeDa_TypeAddCycle_To_ReportCycleType
3902  0aaf 1e01          	ldw	x,(OFST+1,sp)
3903  0ab1 f7            	ld	(x),a
3904                     ; 959 	return 1;
3907  0ab2 a601          	ld	a,#1
3910  0ab4 85            	popw	x
3911  0ab5 81            	ret	
3964                     ; 971 void HeDa_ReportCycleType_To_TypeAddCycle(u8 Report_Cycle_Type,u8 *Report_Time_Type,u8 *cycle_num)
3964                     ; 972 {
3965                     	switch	.text
3966  0ab6               _HeDa_ReportCycleType_To_TypeAddCycle:
3968  0ab6 88            	push	a
3969       00000000      OFST:	set	0
3972                     ; 973 	switch(Report_Cycle_Type)
3975                     ; 1022 			break;
3976  0ab7 a037          	sub	a,#55
3977  0ab9 2725          	jreq	L3231
3978  0abb 4a            	dec	a
3979  0abc 272d          	jreq	L5231
3980  0abe 4a            	dec	a
3981  0abf 2735          	jreq	L7231
3982  0ac1 a007          	sub	a,#7
3983  0ac3 273c          	jreq	L1331
3984  0ac5 4a            	dec	a
3985  0ac6 2744          	jreq	L3331
3986  0ac8 4a            	dec	a
3987  0ac9 274c          	jreq	L5331
3988  0acb 4a            	dec	a
3989  0acc 2753          	jreq	L7331
3990  0ace 4a            	dec	a
3991  0acf 275a          	jreq	L1431
3992  0ad1 4a            	dec	a
3993  0ad2 2761          	jreq	L3431
3994  0ad4 4a            	dec	a
3995  0ad5 2768          	jreq	L5431
3996  0ad7 4a            	dec	a
3997  0ad8 276f          	jreq	L7431
3998                     ; 1019 		default:
3998                     ; 1020 			*Report_Time_Type=HD_INTERVAL_HOUR;
4000  0ada 1e04          	ldw	x,(OFST+4,sp)
4001  0adc a601          	ld	a,#1
4002                     ; 1021 			*cycle_num=24;
4003                     ; 1022 			break;
4005  0ade 206c          	jp	LC008
4006  0ae0               L3231:
4007                     ; 975 		case HeDa_Report_Cycle_Minute_1:
4007                     ; 976 			*Report_Time_Type=HD_INTERVAL_MIN;
4009  0ae0 1e04          	ldw	x,(OFST+4,sp)
4010  0ae2 a602          	ld	a,#2
4011  0ae4 f7            	ld	(x),a
4012                     ; 977 			*cycle_num=1;
4014  0ae5 1e06          	ldw	x,(OFST+6,sp)
4015  0ae7 a601          	ld	a,#1
4016                     ; 978 			break;
4018  0ae9 2066          	jra	L1041
4019  0aeb               L5231:
4020                     ; 979 		case HeDa_Report_Cycle_Minute_5:
4020                     ; 980 			*Report_Time_Type=HD_INTERVAL_MIN;
4022  0aeb 1e04          	ldw	x,(OFST+4,sp)
4023  0aed a602          	ld	a,#2
4024  0aef f7            	ld	(x),a
4025                     ; 981 			*cycle_num=5;
4027  0af0 1e06          	ldw	x,(OFST+6,sp)
4028  0af2 a605          	ld	a,#5
4029                     ; 982 			break;
4031  0af4 205b          	jra	L1041
4032  0af6               L7231:
4033                     ; 983 		case HeDa_Report_Cycle_Minute_10:
4033                     ; 984 			*Report_Time_Type=HD_INTERVAL_MIN;
4035  0af6 1e04          	ldw	x,(OFST+4,sp)
4036  0af8 a602          	ld	a,#2
4037  0afa f7            	ld	(x),a
4038                     ; 985 			*cycle_num=10;
4040  0afb 1e06          	ldw	x,(OFST+6,sp)
4041  0afd a60a          	ld	a,#10
4042                     ; 986 			break;
4044  0aff 2050          	jra	L1041
4045  0b01               L1331:
4046                     ; 987 		case HeDa_Report_Cycle_Minute_15:
4046                     ; 988 			*Report_Time_Type=HD_INTERVAL_MIN;
4048  0b01 1e04          	ldw	x,(OFST+4,sp)
4049  0b03 a602          	ld	a,#2
4050  0b05 f7            	ld	(x),a
4051                     ; 989 			*cycle_num=15;
4053  0b06 1e06          	ldw	x,(OFST+6,sp)
4054  0b08 a60f          	ld	a,#15
4055                     ; 990 			break;
4057  0b0a 2045          	jra	L1041
4058  0b0c               L3331:
4059                     ; 991 		case HeDa_Report_Cycle_Minute_30:
4059                     ; 992 			*Report_Time_Type=HD_INTERVAL_MIN;
4061  0b0c 1e04          	ldw	x,(OFST+4,sp)
4062  0b0e a602          	ld	a,#2
4063  0b10 f7            	ld	(x),a
4064                     ; 993 			*cycle_num=30;
4066  0b11 1e06          	ldw	x,(OFST+6,sp)
4067  0b13 a61e          	ld	a,#30
4068                     ; 994 			break;
4070  0b15 203a          	jra	L1041
4071  0b17               L5331:
4072                     ; 995 		case HeDa_Report_Cycle_Hour_1:
4072                     ; 996 			*Report_Time_Type=HD_INTERVAL_HOUR;
4074  0b17 1e04          	ldw	x,(OFST+4,sp)
4075  0b19 4c            	inc	a
4076  0b1a f7            	ld	(x),a
4077                     ; 997 			*cycle_num=1;
4079  0b1b 1e06          	ldw	x,(OFST+6,sp)
4080  0b1d a601          	ld	a,#1
4081                     ; 998 			break;
4083  0b1f 2030          	jra	L1041
4084  0b21               L7331:
4085                     ; 999 		case HeDa_Report_Cycle_Hour_2:
4085                     ; 1000 			*Report_Time_Type=HD_INTERVAL_HOUR;
4087  0b21 1e04          	ldw	x,(OFST+4,sp)
4088  0b23 4c            	inc	a
4089  0b24 f7            	ld	(x),a
4090                     ; 1001 			*cycle_num=2;
4092  0b25 1e06          	ldw	x,(OFST+6,sp)
4093  0b27 a602          	ld	a,#2
4094                     ; 1002 			break;
4096  0b29 2026          	jra	L1041
4097  0b2b               L1431:
4098                     ; 1003 		case HeDa_Report_Cycle_Hour_4:
4098                     ; 1004 			*Report_Time_Type=HD_INTERVAL_HOUR;
4100  0b2b 1e04          	ldw	x,(OFST+4,sp)
4101  0b2d 4c            	inc	a
4102  0b2e f7            	ld	(x),a
4103                     ; 1005 			*cycle_num=4;
4105  0b2f 1e06          	ldw	x,(OFST+6,sp)
4106  0b31 a604          	ld	a,#4
4107                     ; 1006 			break;
4109  0b33 201c          	jra	L1041
4110  0b35               L3431:
4111                     ; 1007 		case HeDa_Report_Cycle_Hour_6:
4111                     ; 1008 			*Report_Time_Type=HD_INTERVAL_HOUR;
4113  0b35 1e04          	ldw	x,(OFST+4,sp)
4114  0b37 4c            	inc	a
4115  0b38 f7            	ld	(x),a
4116                     ; 1009 			*cycle_num=6;
4118  0b39 1e06          	ldw	x,(OFST+6,sp)
4119  0b3b a606          	ld	a,#6
4120                     ; 1010 			break;
4122  0b3d 2012          	jra	L1041
4123  0b3f               L5431:
4124                     ; 1011 		case HeDa_Report_Cycle_Hour_12:
4124                     ; 1012 			*Report_Time_Type=HD_INTERVAL_HOUR;
4126  0b3f 1e04          	ldw	x,(OFST+4,sp)
4127  0b41 4c            	inc	a
4128  0b42 f7            	ld	(x),a
4129                     ; 1013 			*cycle_num=12;
4131  0b43 1e06          	ldw	x,(OFST+6,sp)
4132  0b45 a60c          	ld	a,#12
4133                     ; 1014 			break;
4135  0b47 2008          	jra	L1041
4136  0b49               L7431:
4137                     ; 1015 		case HeDa_Report_Cycle_Hour_24:
4137                     ; 1016 			*Report_Time_Type=HD_INTERVAL_HOUR;
4139  0b49 1e04          	ldw	x,(OFST+4,sp)
4140  0b4b 4c            	inc	a
4141                     ; 1017 			*cycle_num=24;
4143  0b4c               LC008:
4144  0b4c f7            	ld	(x),a
4146  0b4d 1e06          	ldw	x,(OFST+6,sp)
4147  0b4f a618          	ld	a,#24
4148                     ; 1018 			break;
4150  0b51               L1041:
4151  0b51 f7            	ld	(x),a
4152                     ; 1024 	return;
4155  0b52 84            	pop	a
4156  0b53 81            	ret	
4196                     ; 1036 u8 HeDa_TypeAddCycle_To_ReportCycleType(u8 Report_Time_Type,u8 cycle_num)
4196                     ; 1037 {
4197                     	switch	.text
4198  0b54               _HeDa_TypeAddCycle_To_ReportCycleType:
4200  0b54 89            	pushw	x
4201       00000000      OFST:	set	0
4204                     ; 1038 	switch(Report_Time_Type)
4206  0b55 9e            	ld	a,xh
4208                     ; 1065 		default:
4208                     ; 1066 			return HeDa_Report_Cycle_Max;
4209  0b56 4a            	dec	a
4210  0b57 272c          	jreq	L1241
4211  0b59 4a            	dec	a
4212  0b5a 2704          	jreq	L3041
4215  0b5c a647          	ld	a,#71
4217  0b5e 2013          	jra	L444
4218  0b60               L3041:
4219                     ; 1042 				switch(cycle_num)
4221  0b60 7b02          	ld	a,(OFST+2,sp)
4223                     ; 1049 					default:	return HeDa_Report_Cycle_Minute_30;
4224  0b62 4a            	dec	a
4225  0b63 2710          	jreq	L5041
4226  0b65 a004          	sub	a,#4
4227  0b67 2710          	jreq	L7041
4228  0b69 a005          	sub	a,#5
4229  0b6b 2710          	jreq	L1141
4230  0b6d a005          	sub	a,#5
4231  0b6f 2710          	jreq	L3141
4235  0b71 a641          	ld	a,#65
4237  0b73               L444:
4239  0b73 85            	popw	x
4240  0b74 81            	ret	
4241  0b75               L5041:
4242                     ; 1044 					case	1:	return HeDa_Report_Cycle_Minute_1;
4244  0b75 a637          	ld	a,#55
4246  0b77 20fa          	jra	L444
4247  0b79               L7041:
4248                     ; 1045 					case	5:	return HeDa_Report_Cycle_Minute_5;
4250  0b79 a638          	ld	a,#56
4252  0b7b 20f6          	jra	L444
4253  0b7d               L1141:
4254                     ; 1046 					case	10:	return HeDa_Report_Cycle_Minute_10;
4256  0b7d a639          	ld	a,#57
4258  0b7f 20f2          	jra	L444
4259  0b81               L3141:
4260                     ; 1047 					case	15:	return HeDa_Report_Cycle_Minute_15;
4262  0b81 a640          	ld	a,#64
4264  0b83 20ee          	jra	L444
4265                     ; 1048 					case	30:	return HeDa_Report_Cycle_Minute_30;
4267  0b85               L1241:
4268                     ; 1054 				switch(cycle_num)
4270  0b85 7b02          	ld	a,(OFST+2,sp)
4272                     ; 1062 					default:	return HeDa_Report_Cycle_Hour_24;
4273  0b87 4a            	dec	a
4274  0b88 2717          	jreq	L3241
4275  0b8a 4a            	dec	a
4276  0b8b 2718          	jreq	L5241
4277  0b8d a002          	sub	a,#2
4278  0b8f 2718          	jreq	L7241
4279  0b91 a002          	sub	a,#2
4280  0b93 2718          	jreq	L1341
4281  0b95 a006          	sub	a,#6
4282  0b97 2718          	jreq	L3341
4283  0b99 a00c          	sub	a,#12
4284  0b9b 2718          	jreq	L5341
4287  0b9d a647          	ld	a,#71
4289  0b9f 20d2          	jra	L444
4290  0ba1               L3241:
4291                     ; 1056 					case	1:	return HeDa_Report_Cycle_Hour_1;
4293  0ba1 a642          	ld	a,#66
4295  0ba3 20ce          	jra	L444
4296  0ba5               L5241:
4297                     ; 1057 					case	2:	return HeDa_Report_Cycle_Hour_2;
4299  0ba5 a643          	ld	a,#67
4301  0ba7 20ca          	jra	L444
4302  0ba9               L7241:
4303                     ; 1058 					case	4:	return HeDa_Report_Cycle_Hour_4;
4305  0ba9 a644          	ld	a,#68
4307  0bab 20c6          	jra	L444
4308  0bad               L1341:
4309                     ; 1059 					case	6:	return HeDa_Report_Cycle_Hour_6;
4311  0bad a645          	ld	a,#69
4313  0baf 20c2          	jra	L444
4314  0bb1               L3341:
4315                     ; 1060 					case	12:	return HeDa_Report_Cycle_Hour_12;
4317  0bb1 a646          	ld	a,#70
4319  0bb3 20be          	jra	L444
4320  0bb5               L5341:
4321                     ; 1061 					case	24:	return HeDa_Report_Cycle_Hour_24;
4323  0bb5 a647          	ld	a,#71
4325  0bb7 20ba          	jra	L444
4381                     ; 1080 u8 HeDa_Cmd_Set_Pressure_Threshold_Handle(u8 *pData)
4381                     ; 1081 {
4382                     	switch	.text
4383  0bb9               _HeDa_Cmd_Set_Pressure_Threshold_Handle:
4385  0bb9 89            	pushw	x
4386  0bba 89            	pushw	x
4387       00000002      OFST:	set	2
4390                     ; 1082 	u8 flag_change=0;//修改内容标志位
4392                     ; 1083 	u8 flag_change_response=0;//修改内容结果标志位
4394  0bbb 0f01          	clr	(OFST-1,sp)
4395                     ; 1085 	if((stDataPtrHD.Packet.Data_Len-1) < 25)//数据域长度不够
4397  0bbd ce0003        	ldw	x,_stDataPtrHD+3
4398  0bc0 5a            	decw	x
4399  0bc1 a30019        	cpw	x,#25
4400  0bc4 2404          	jruge	L7151
4401                     ; 1087 		return 0;
4403  0bc6 4f            	clr	a
4405  0bc7 cc0c95        	jra	L654
4406  0bca               L7151:
4407                     ; 1089 	flag_change=*pData;
4409  0bca 1e03          	ldw	x,(OFST+1,sp)
4410  0bcc f6            	ld	a,(x)
4411  0bcd 6b02          	ld	(OFST+0,sp),a
4412                     ; 1091 	if( (flag_change & 0x01) || (flag_change & 0x02)) //压力1上下限一起改
4414  0bcf a501          	bcp	a,#1
4415  0bd1 2604          	jrne	L3251
4417  0bd3 a502          	bcp	a,#2
4418  0bd5 274f          	jreq	L1251
4419  0bd7               L3251:
4420                     ; 1093 		if((flag_change & 0x01) && (flag_change & 0x02))//压力1上下限要一起改
4422  0bd7 a501          	bcp	a,#1
4423  0bd9 2737          	jreq	L5251
4425  0bdb a502          	bcp	a,#2
4426  0bdd 2733          	jreq	L5251
4427                     ; 1095 			flag_change_response |=0x01;
4429  0bdf 7b01          	ld	a,(OFST-1,sp)
4430                     ; 1096 			flag_change_response |=0x02;
4432  0be1 aa03          	or	a,#3
4433  0be3 6b01          	ld	(OFST-1,sp),a
4434                     ; 1097 			tyParameter.Pressure1_LimitUp=*(float *)(pData+1);
4436  0be5 e604          	ld	a,(4,x)
4437  0be7 c70014        	ld	_tyParameter+20,a
4438  0bea e603          	ld	a,(3,x)
4439  0bec c70013        	ld	_tyParameter+19,a
4440  0bef e602          	ld	a,(2,x)
4441  0bf1 c70012        	ld	_tyParameter+18,a
4442  0bf4 e601          	ld	a,(1,x)
4443  0bf6 c70011        	ld	_tyParameter+17,a
4444                     ; 1098 			tyParameter.Pressure1_LimitDown=*(float *)(pData+5);
4446  0bf9 e608          	ld	a,(8,x)
4447  0bfb c70018        	ld	_tyParameter+24,a
4448  0bfe e607          	ld	a,(7,x)
4449  0c00 c70017        	ld	_tyParameter+23,a
4450  0c03 e606          	ld	a,(6,x)
4451  0c05 c70016        	ld	_tyParameter+22,a
4452  0c08 e605          	ld	a,(5,x)
4453  0c0a c70015        	ld	_tyParameter+21,a
4454                     ; 1099 			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
4456  0c0d cd0c98        	call	LC012
4458  0c10 2014          	jra	L1251
4459  0c12               L5251:
4460                     ; 1101 		else if(flag_change & 0x01)
4462  0c12 a501          	bcp	a,#1
4463  0c14 2706          	jreq	L1351
4464                     ; 1103 			flag_change_response |=0x10;
4466  0c16 7b01          	ld	a,(OFST-1,sp)
4467  0c18 aa10          	or	a,#16
4469  0c1a 2008          	jp	LC010
4470  0c1c               L1351:
4471                     ; 1105 		else if(flag_change & 0x02)
4473  0c1c a502          	bcp	a,#2
4474  0c1e 2706          	jreq	L1251
4475                     ; 1107 			flag_change_response |=0x20;
4477  0c20 7b01          	ld	a,(OFST-1,sp)
4478  0c22 aa20          	or	a,#32
4479  0c24               LC010:
4480  0c24 6b01          	ld	(OFST-1,sp),a
4481  0c26               L1251:
4482                     ; 1111 	if( (flag_change & 0x04) || (flag_change & 0x08)) //压力2上下限一起改
4484  0c26 7b02          	ld	a,(OFST+0,sp)
4485  0c28 a504          	bcp	a,#4
4486  0c2a 2604          	jrne	L1451
4488  0c2c a508          	bcp	a,#8
4489  0c2e 2750          	jreq	L7351
4490  0c30               L1451:
4491                     ; 1113 		if((flag_change & 0x04) && (flag_change & 0x08))//压力2上下限要一起改
4493  0c30 a504          	bcp	a,#4
4494  0c32 2738          	jreq	L3451
4496  0c34 a508          	bcp	a,#8
4497  0c36 2734          	jreq	L3451
4498                     ; 1115 			flag_change_response |=0x04;
4500  0c38 7b01          	ld	a,(OFST-1,sp)
4501                     ; 1116 			flag_change_response |=0x08;		
4503  0c3a aa0c          	or	a,#12
4504  0c3c 6b01          	ld	(OFST-1,sp),a
4505                     ; 1117 			tyParameter.Pressure2_LimitUp=*(float *)(pData+9);
4507  0c3e 1e03          	ldw	x,(OFST+1,sp)
4508  0c40 e60c          	ld	a,(12,x)
4509  0c42 c7001c        	ld	_tyParameter+28,a
4510  0c45 e60b          	ld	a,(11,x)
4511  0c47 c7001b        	ld	_tyParameter+27,a
4512  0c4a e60a          	ld	a,(10,x)
4513  0c4c c7001a        	ld	_tyParameter+26,a
4514  0c4f e609          	ld	a,(9,x)
4515  0c51 c70019        	ld	_tyParameter+25,a
4516                     ; 1118 			tyParameter.Pressure2_LimitDown=*(float *)(pData+13);
4518  0c54 e610          	ld	a,(16,x)
4519  0c56 c70020        	ld	_tyParameter+32,a
4520  0c59 e60f          	ld	a,(15,x)
4521  0c5b c7001f        	ld	_tyParameter+31,a
4522  0c5e e60e          	ld	a,(14,x)
4523  0c60 c7001e        	ld	_tyParameter+30,a
4524  0c63 e60d          	ld	a,(13,x)
4525  0c65 c7001d        	ld	_tyParameter+29,a
4526                     ; 1119 			SaveParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA);
4528  0c68 ad2e          	call	LC012
4530  0c6a 2014          	jra	L7351
4531  0c6c               L3451:
4532                     ; 1121 		else if(flag_change & 0x04)
4534  0c6c a504          	bcp	a,#4
4535  0c6e 2706          	jreq	L7451
4536                     ; 1123 			flag_change_response |=0x40;
4538  0c70 7b01          	ld	a,(OFST-1,sp)
4539  0c72 aa40          	or	a,#64
4541  0c74 2008          	jp	LC011
4542  0c76               L7451:
4543                     ; 1125 		else if(flag_change & 0x08)
4545  0c76 a508          	bcp	a,#8
4546  0c78 2706          	jreq	L7351
4547                     ; 1127 			flag_change_response |=0x80;
4549  0c7a 7b01          	ld	a,(OFST-1,sp)
4550  0c7c aa80          	or	a,#128
4551  0c7e               LC011:
4552  0c7e 6b01          	ld	(OFST-1,sp),a
4553  0c80               L7351:
4554                     ; 1132 	*pData=flag_change_response;
4556  0c80 7b01          	ld	a,(OFST-1,sp)
4557  0c82 1e03          	ldw	x,(OFST+1,sp)
4558  0c84 f7            	ld	(x),a
4559                     ; 1133 	MemcpyFunc(pData+1, (u8 *)&tyParameter.Pressure1_LimitUp, 16);
4561  0c85 4b10          	push	#16
4562  0c87 ae0011        	ldw	x,#_tyParameter+17
4563  0c8a 89            	pushw	x
4564  0c8b 1e06          	ldw	x,(OFST+4,sp)
4565  0c8d 5c            	incw	x
4566  0c8e cd0000        	call	_MemcpyFunc
4568  0c91 5b03          	addw	sp,#3
4569                     ; 1135 	return 25;
4571  0c93 a619          	ld	a,#25
4573  0c95               L654:
4575  0c95 5b04          	addw	sp,#4
4576  0c97 81            	ret	
4578  0c98               LC012:
4579  0c98 4b04          	push	#4
4580  0c9a 4b21          	push	#33
4581  0c9c ae0000        	ldw	x,#_tyParameter
4582  0c9f cd0000        	call	_SaveParameterForType
4584  0ca2 85            	popw	x
4585  0ca3 81            	ret	
4624                     ; 1147 u8 HeDa_Cmd_Get_Pressure_Threshold_Handle(u8 *pData)
4624                     ; 1148 {
4625                     	switch	.text
4626  0ca4               _HeDa_Cmd_Get_Pressure_Threshold_Handle:
4628  0ca4 89            	pushw	x
4629       00000000      OFST:	set	0
4632                     ; 1149 	MemcpyFunc(pData, (u8 *)&tyParameter.Pressure1_LimitUp, 16);
4634  0ca5 4b10          	push	#16
4635  0ca7 ae0011        	ldw	x,#_tyParameter+17
4636  0caa 89            	pushw	x
4637  0cab 1e04          	ldw	x,(OFST+4,sp)
4638  0cad cd0000        	call	_MemcpyFunc
4640  0cb0 5b03          	addw	sp,#3
4641                     ; 1150 	MemsetFunc(pData+16, 0, 8);
4643  0cb2 4b08          	push	#8
4644  0cb4 4b00          	push	#0
4645  0cb6 1e03          	ldw	x,(OFST+3,sp)
4646  0cb8 1c0010        	addw	x,#16
4647  0cbb cd0000        	call	_MemsetFunc
4649  0cbe a618          	ld	a,#24
4650  0cc0 85            	popw	x
4651                     ; 1151 	return 24;
4655  0cc1 85            	popw	x
4656  0cc2 81            	ret	
4694                     ; 1163 u8 HeDa_Cmd_Set_Secret_Key_Handle(u8 *pData)
4694                     ; 1164 {
4695                     	switch	.text
4696  0cc3               _HeDa_Cmd_Set_Secret_Key_Handle:
4698  0cc3 89            	pushw	x
4699       00000000      OFST:	set	0
4702                     ; 1165 	if((stDataPtrHD.Packet.Data_Len-1) < 16)//数据域长度不够
4704  0cc4 ce0003        	ldw	x,_stDataPtrHD+3
4705  0cc7 5a            	decw	x
4706  0cc8 a30010        	cpw	x,#16
4707  0ccb 2403          	jruge	L1161
4708                     ; 1167 		return 0;
4710  0ccd 4f            	clr	a
4712  0cce 2014          	jra	L274
4713  0cd0               L1161:
4714                     ; 1170 	*pData=0x01;
4716  0cd0 1e01          	ldw	x,(OFST+1,sp)
4717  0cd2 a601          	ld	a,#1
4718  0cd4 f7            	ld	(x),a
4719                     ; 1171 	MemcpyFunc(pData+1, pData, 16);
4721  0cd5 4b10          	push	#16
4722  0cd7 1e02          	ldw	x,(OFST+2,sp)
4723  0cd9 89            	pushw	x
4724  0cda 1e04          	ldw	x,(OFST+4,sp)
4725  0cdc 5c            	incw	x
4726  0cdd cd0000        	call	_MemcpyFunc
4728  0ce0 5b03          	addw	sp,#3
4729                     ; 1172 	return 17;
4731  0ce2 a611          	ld	a,#17
4733  0ce4               L274:
4735  0ce4 85            	popw	x
4736  0ce5 81            	ret	
4773                     ; 1184 u8 HeDa_Cmd_Get_Secret_Key_Handle(u8 *pData)
4773                     ; 1185 {
4774                     	switch	.text
4775  0ce6               _HeDa_Cmd_Get_Secret_Key_Handle:
4779                     ; 1186 	MemsetFunc(pData, 0, 16);
4781  0ce6 4b10          	push	#16
4782  0ce8 4b00          	push	#0
4783  0cea cd0000        	call	_MemsetFunc
4785  0ced a610          	ld	a,#16
4786  0cef 85            	popw	x
4787                     ; 1187 	return 16;
4791  0cf0 81            	ret	
4794                     	switch	.const
4795  0029               L1361_meter_addr:
4796  0029 00            	dc.b	0
4797  002a 00            	ds.b	1
4843                     ; 1199 u8 HeDa_Cmd_Set_Addr_Handle(u8 *pData)
4843                     ; 1200 {
4844                     	switch	.text
4845  0cf1               _HeDa_Cmd_Set_Addr_Handle:
4847  0cf1 89            	pushw	x
4848  0cf2 89            	pushw	x
4849       00000002      OFST:	set	2
4852                     ; 1201 	u8 meter_addr[2]={0};//表地址缓存
4854  0cf3 c60029        	ld	a,L1361_meter_addr
4855  0cf6 6b01          	ld	(OFST-1,sp),a
4856  0cf8 c6002a        	ld	a,L1361_meter_addr+1
4857  0cfb 6b02          	ld	(OFST+0,sp),a
4858                     ; 1203 	if((stDataPtrHD.Packet.Data_Len-1) < 2)//数据域长度不够
4860  0cfd ce0003        	ldw	x,_stDataPtrHD+3
4861  0d00 5a            	decw	x
4862  0d01 a30002        	cpw	x,#2
4863  0d04 2403          	jruge	L5561
4864                     ; 1205 		return 0;
4866  0d06 4f            	clr	a
4868  0d07 2037          	jra	L205
4869  0d09               L5561:
4870                     ; 1207 	meter_addr[0]=*pData;
4872  0d09 1e03          	ldw	x,(OFST+1,sp)
4873  0d0b f6            	ld	a,(x)
4874  0d0c 6b01          	ld	(OFST-1,sp),a
4875                     ; 1208 	meter_addr[1]=*(pData+1);
4877  0d0e e601          	ld	a,(1,x)
4878  0d10 6b02          	ld	(OFST+0,sp),a
4879                     ; 1211 	if((meter_addr[0]==0 && meter_addr[1]==0) || (meter_addr[0]==0xff && meter_addr[1]==0xff))
4881  0d12 7b01          	ld	a,(OFST-1,sp)
4882  0d14 2604          	jrne	L3661
4884  0d16 0d02          	tnz	(OFST+0,sp)
4885  0d18 2708          	jreq	L1661
4886  0d1a               L3661:
4888  0d1a 4c            	inc	a
4889  0d1b 2614          	jrne	L7561
4891  0d1d 7b02          	ld	a,(OFST+0,sp)
4892  0d1f 4c            	inc	a
4893  0d20 260f          	jrne	L7561
4894  0d22               L1661:
4895                     ; 1213 		*pData=0x10;//设置失败
4897  0d22 a610          	ld	a,#16
4898  0d24 f7            	ld	(x),a
4899                     ; 1214 		*(pData+1)=tyParameter.Address[0];
4901  0d25 c60001        	ld	a,_tyParameter+1
4902  0d28 e701          	ld	(1,x),a
4903                     ; 1215 		*(pData+2)=tyParameter.Address[1];
4905  0d2a c60002        	ld	a,_tyParameter+2
4906  0d2d e702          	ld	(2,x),a
4908  0d2f 200d          	jra	L5661
4909  0d31               L7561:
4910                     ; 1219 		*pData=0x01;//设置成功
4912  0d31 a601          	ld	a,#1
4913  0d33 f7            	ld	(x),a
4914                     ; 1220 		tyParameter.Address[0]=meter_addr[0];
4916  0d34 7b01          	ld	a,(OFST-1,sp)
4917  0d36 c70001        	ld	_tyParameter+1,a
4918                     ; 1221 		tyParameter.Address[1]=meter_addr[1];
4920  0d39 7b02          	ld	a,(OFST+0,sp)
4921  0d3b c70002        	ld	_tyParameter+2,a
4922  0d3e               L5661:
4923                     ; 1223 	return 3;
4925  0d3e a603          	ld	a,#3
4927  0d40               L205:
4929  0d40 5b04          	addw	sp,#4
4930  0d42 81            	ret	
4967                     ; 1235 u8 HeDa_Cmd_Get_Addr_Handle(u8 *pData)
4967                     ; 1236 {
4968                     	switch	.text
4969  0d43               _HeDa_Cmd_Get_Addr_Handle:
4973                     ; 1237 	*pData=tyParameter.Address[0];
4975  0d43 c60001        	ld	a,_tyParameter+1
4976  0d46 f7            	ld	(x),a
4977                     ; 1238 	*(pData+1)=tyParameter.Address[1];
4979  0d47 c60002        	ld	a,_tyParameter+2
4980  0d4a e701          	ld	(1,x),a
4981                     ; 1239 	return 2;
4983  0d4c a602          	ld	a,#2
4986  0d4e 81            	ret	
5022                     ; 1251 u8 HeDa_Cmd_Get_All_Param_Handle(u8 *pData)
5022                     ; 1252 {
5023                     	switch	.text
5024  0d4f               _HeDa_Cmd_Get_All_Param_Handle:
5028                     ; 1253 	return 0;
5030  0d4f 4f            	clr	a
5033  0d50 81            	ret	
5069                     ; 1265 u8 HeDa_Cmd_Get_Appoint_Data_Handle(u8 *pData)
5069                     ; 1266 {
5070                     	switch	.text
5071  0d51               _HeDa_Cmd_Get_Appoint_Data_Handle:
5075                     ; 1267 	return 0;
5077  0d51 4f            	clr	a
5080  0d52 81            	ret	
5083                     	switch	.const
5084  002b               L1471_nIPstr:
5085  002b 00            	dc.b	0
5086  002c 000000000000  	ds.b	31
5087  004b               L3471_nPort:
5088  004b 00            	dc.b	0
5089  004c 0000000000    	ds.b	5
5090  0051               L5471_nBuf:
5091  0051 00            	dc.b	0
5092  0052 000000000000  	ds.b	9
5181                     ; 1279 void HD_InitializeGsm(void)
5181                     ; 1280 {
5182                     	switch	.text
5183  0d53               _HD_InitializeGsm:
5185  0d53 5239          	subw	sp,#57
5186       00000039      OFST:	set	57
5189                     ; 1281 	char nIPstr[32] = {0};
5191  0d55 96            	ldw	x,sp
5192  0d56 1c0010        	addw	x,#OFST-41
5193  0d59 90ae002b      	ldw	y,#L1471_nIPstr
5194  0d5d a620          	ld	a,#32
5195  0d5f cd0000        	call	c_xymvx
5197                     ; 1282 	u8 nPort[6]     = {0};
5199  0d62 96            	ldw	x,sp
5200  0d63 1c0003        	addw	x,#OFST-54
5201  0d66 90ae004b      	ldw	y,#L3471_nPort
5202  0d6a a606          	ld	a,#6
5203  0d6c cd0000        	call	c_xymvx
5205                     ; 1283 	u16 dwPortNum = 0;
5207  0d6f 5f            	clrw	x
5208  0d70 1f01          	ldw	(OFST-56,sp),x
5209                     ; 1285 	u8 nBuf[10]     = {0};
5211  0d72 96            	ldw	x,sp
5212  0d73 1c0030        	addw	x,#OFST-9
5213  0d76 90ae0051      	ldw	y,#L5471_nBuf
5214  0d7a a60a          	ld	a,#10
5215  0d7c cd0000        	call	c_xymvx
5217                     ; 1287 	MemsetFunc(nPort, 0, sizeof(nPort));
5219  0d7f 4b06          	push	#6
5220  0d81 4b00          	push	#0
5221  0d83 96            	ldw	x,sp
5222  0d84 1c0005        	addw	x,#OFST-52
5223  0d87 cd0000        	call	_MemsetFunc
5225  0d8a 85            	popw	x
5226                     ; 1288 	MemsetFunc(nIPstr, 0, sizeof(nIPstr));	
5228  0d8b 4b20          	push	#32
5229  0d8d 4b00          	push	#0
5230  0d8f 96            	ldw	x,sp
5231  0d90 1c0012        	addw	x,#OFST-39
5232  0d93 cd0000        	call	_MemsetFunc
5234  0d96 a604          	ld	a,#4
5235  0d98 85            	popw	x
5236                     ; 1289 	SetLogonMode(UP_Upload_HD);
5238  0d99 cd0000        	call	_SetLogonMode
5240                     ; 1292 	if(TRUE == ReadParameterForType((u8 *)&tyReportParameter, sizeof(tyReportParameter), IPANDPORT_PARA))
5242  0d9c 4b01          	push	#1
5243  0d9e 4b27          	push	#39
5244  0da0 ae0000        	ldw	x,#_tyReportParameter
5245  0da3 cd0000        	call	_ReadParameterForType
5247  0da6 4a            	dec	a
5248  0da7 85            	popw	x
5249  0da8 2703cc0e61    	jrne	L3002
5250                     ; 1294 		if(tyReportParameter.flag_Login_Mode==HD_Login_IP)//ip地址上报
5252  0dad c60026        	ld	a,_tyReportParameter+38
5253  0db0 4a            	dec	a
5254  0db1 260e          	jrne	L5002
5255                     ; 1296 			JX_IpAddrToStr(nIPstr, (u8*)&tyReportParameter.Main_IP);
5257  0db3 ae0000        	ldw	x,#_tyReportParameter
5258  0db6 89            	pushw	x
5259  0db7 96            	ldw	x,sp
5260  0db8 1c0012        	addw	x,#OFST-39
5261  0dbb cd0000        	call	_JX_IpAddrToStr
5263  0dbe 85            	popw	x
5265  0dbf 2016          	jra	L7002
5266  0dc1               L5002:
5267                     ; 1298 		else if(tyReportParameter.flag_Login_Mode==HD_Login_Domain_Name)//域名上报
5269  0dc1 c60026        	ld	a,_tyReportParameter+38
5270  0dc4 a102          	cp	a,#2
5271  0dc6 260f          	jrne	L7002
5272                     ; 1300 			MemcpyFunc(nIPstr, (u8*)&tyReportParameter.Main_domain_name, 32);
5274  0dc8 4b20          	push	#32
5275  0dca ae0006        	ldw	x,#_tyReportParameter+6
5276  0dcd 89            	pushw	x
5277  0dce 96            	ldw	x,sp
5278  0dcf 1c0013        	addw	x,#OFST-38
5279  0dd2 cd0000        	call	_MemcpyFunc
5281  0dd5 5b03          	addw	sp,#3
5282  0dd7               L7002:
5283                     ; 1303 		MemcpyFunc((u8*)&dwPortNum, (u8*)&tyReportParameter.Main_Port, 2);
5285  0dd7 4b02          	push	#2
5286  0dd9 ae0004        	ldw	x,#_tyReportParameter+4
5287  0ddc 89            	pushw	x
5288  0ddd 96            	ldw	x,sp
5289  0dde 1c0004        	addw	x,#OFST-53
5290  0de1 cd0000        	call	_MemcpyFunc
5292  0de4 5b03          	addw	sp,#3
5293                     ; 1304 		JX_BL_Change(2, (u8*)&dwPortNum);
5295  0de6 96            	ldw	x,sp
5296  0de7 5c            	incw	x
5297  0de8 89            	pushw	x
5298  0de9 ae0002        	ldw	x,#2
5299  0dec cd0000        	call	_JX_BL_Change
5301  0def 85            	popw	x
5302                     ; 1305 		JX_U32ToStr(dwPortNum, nPort);
5304  0df0 96            	ldw	x,sp
5305  0df1 1c0003        	addw	x,#OFST-54
5306  0df4 89            	pushw	x
5307  0df5 1e03          	ldw	x,(OFST-54,sp)
5308  0df7 cd0000        	call	c_uitolx
5310  0dfa be02          	ldw	x,c_lreg+2
5311  0dfc 89            	pushw	x
5312  0dfd be00          	ldw	x,c_lreg
5313  0dff 89            	pushw	x
5314  0e00 cd0000        	call	_JX_U32ToStr
5316  0e03 5b06          	addw	sp,#6
5317                     ; 1306 		MemsetFunc(&aucAtPServer1[1], 0, sizeof(aucAtPServer1)-1);
5319  0e05 4b13          	push	#19
5320  0e07 4b00          	push	#0
5321  0e09 ae0001        	ldw	x,#_aucAtPServer1+1
5322  0e0c cd0000        	call	_MemsetFunc
5324  0e0f 85            	popw	x
5325                     ; 1307 		MemsetFunc(&aucAtPPort1[1], 0, sizeof(aucAtPPort1)-1);
5327  0e10 4b07          	push	#7
5328  0e12 4b00          	push	#0
5329  0e14 ae0001        	ldw	x,#_aucAtPPort1+1
5330  0e17 cd0000        	call	_MemsetFunc
5332  0e1a 85            	popw	x
5333                     ; 1309 		MemcpyFunc((u8*)&aucAtPServer1[1], nIPstr, JX_Strlen(nIPstr));
5335  0e1b 96            	ldw	x,sp
5336  0e1c 1c0010        	addw	x,#OFST-41
5337  0e1f cd0000        	call	_JX_Strlen
5339  0e22 88            	push	a
5340  0e23 96            	ldw	x,sp
5341  0e24 1c0011        	addw	x,#OFST-40
5342  0e27 89            	pushw	x
5343  0e28 ae0001        	ldw	x,#_aucAtPServer1+1
5344  0e2b cd0000        	call	_MemcpyFunc
5346  0e2e 5b03          	addw	sp,#3
5347                     ; 1310 		JX_StringCat(aucAtPServer1,"\"", 2);
5349  0e30 4b02          	push	#2
5350  0e32 ae005b        	ldw	x,#L1321
5351  0e35 89            	pushw	x
5352  0e36 ae0000        	ldw	x,#_aucAtPServer1
5353  0e39 cd0000        	call	_JX_StringCat
5355  0e3c 5b03          	addw	sp,#3
5356                     ; 1311 		MemcpyFunc((u8*)&aucAtPPort1[1], nPort, JX_Strlen(nPort));
5358  0e3e 96            	ldw	x,sp
5359  0e3f 1c0003        	addw	x,#OFST-54
5360  0e42 cd0000        	call	_JX_Strlen
5362  0e45 88            	push	a
5363  0e46 96            	ldw	x,sp
5364  0e47 1c0004        	addw	x,#OFST-53
5365  0e4a 89            	pushw	x
5366  0e4b ae0001        	ldw	x,#_aucAtPPort1+1
5367  0e4e cd0000        	call	_MemcpyFunc
5369  0e51 5b03          	addw	sp,#3
5370                     ; 1312 		JX_StringCat(aucAtPPort1,"\"", 2);
5372  0e53 4b02          	push	#2
5373  0e55 ae005b        	ldw	x,#L1321
5374  0e58 89            	pushw	x
5375  0e59 ae0000        	ldw	x,#_aucAtPPort1
5376  0e5c cd0000        	call	_JX_StringCat
5378  0e5f 5b03          	addw	sp,#3
5379  0e61               L3002:
5380                     ; 1316 	if(TRUE == ReadParameterForType(&g_nApnBuf[1], APN_LEN-1, APN_PARA))
5382  0e61 4b02          	push	#2
5383  0e63 4b13          	push	#19
5384  0e65 ae0001        	ldw	x,#_g_nApnBuf+1
5385  0e68 cd0000        	call	_ReadParameterForType
5387  0e6b 4a            	dec	a
5388  0e6c 85            	popw	x
5389  0e6d 260e          	jrne	L3102
5390                     ; 1318 		JX_StringCat(g_nApnBuf, "\"", 2);
5392  0e6f 4b02          	push	#2
5393  0e71 ae005b        	ldw	x,#L1321
5394  0e74 89            	pushw	x
5395  0e75 ae0000        	ldw	x,#_g_nApnBuf
5396  0e78 cd0000        	call	_JX_StringCat
5398  0e7b 5b03          	addw	sp,#3
5399  0e7d               L3102:
5400                     ; 1322 	if(FALSE == ReadParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA))
5402  0e7d 4b03          	push	#3
5403  0e7f 4b0a          	push	#10
5404  0e81 ae0000        	ldw	x,#_tyReport
5405  0e84 cd0000        	call	_ReadParameterForType
5407  0e87 4d            	tnz	a
5408  0e88 85            	popw	x
5409  0e89 262e          	jrne	L5102
5410                     ; 1324 		tyReport.nIntervalType=HD_INTERVAL_HOUR;//默认上报类型按小时计算
5412  0e8b 35010001      	mov	_tyReport+1,#1
5413                     ; 1325 		tyReport.cycle 	= 24;	 				//默认24小时上报一次	
5415  0e8f 35180002      	mov	_tyReport+2,#24
5416                     ; 1326 		tyReport.wGatherCycle = 60; 			//默认采样间隔60分钟,即抄表间隔
5418  0e93 353c0000      	mov	_tyReport,#60
5419                     ; 1328 		tyReport.Time.Byte.Year = 0x15;//默认上报时间
5421  0e97 35150009      	mov	_tyReport+9,#21
5422                     ; 1329 		tyReport.Time.Byte.Month = 0x12;
5424  0e9b 35120008      	mov	_tyReport+8,#18
5425                     ; 1330 		tyReport.Time.Byte.Day = 0x28;
5427  0e9f 35280007      	mov	_tyReport+7,#40
5428                     ; 1331 		tyReport.Time.Byte.Hour = 0x00;
5430  0ea3 725f0006      	clr	_tyReport+6
5431                     ; 1332 		tyReport.Time.Byte.Minute= 0x00;
5433  0ea7 725f0005      	clr	_tyReport+5
5434                     ; 1333 		SaveParameterForType((u8 *)&tyReport, sizeof(tyReport), REPORT_PARA);		
5436  0eab 4b03          	push	#3
5437  0ead 4b0a          	push	#10
5438  0eaf ae0000        	ldw	x,#_tyReport
5439  0eb2 cd0000        	call	_SaveParameterForType
5441  0eb5 85            	popw	x
5442                     ; 1334 		UC_SleepFunc(1);
5444  0eb6 cd0f48        	call	LC013
5445  0eb9               L5102:
5446                     ; 1342 	if(FALSE == ReadParameterForType(nBuf, 10, LT_REP_TIME))
5448  0eb9 4b05          	push	#5
5449  0ebb 4b0a          	push	#10
5450  0ebd 96            	ldw	x,sp
5451  0ebe 1c0032        	addw	x,#OFST-7
5452  0ec1 cd0000        	call	_ReadParameterForType
5454  0ec4 4d            	tnz	a
5455  0ec5 85            	popw	x
5456  0ec6 265f          	jrne	L7102
5457                     ; 1344 		g_wTmReportCnt = 0;
5459  0ec8 5f            	clrw	x
5460  0ec9 cf0000        	ldw	_g_wTmReportCnt,x
5461                     ; 1345 		MemcpyFunc((u8*)&stReportTime, (u8*)&tyReport.Time, sizeof(tyReport.Time));
5463  0ecc 4b06          	push	#6
5464  0ece ae0004        	ldw	x,#_tyReport+4
5465  0ed1 89            	pushw	x
5466  0ed2 96            	ldw	x,sp
5467  0ed3 1c000c        	addw	x,#OFST-45
5468  0ed6 cd0000        	call	_MemcpyFunc
5470  0ed9 5b03          	addw	sp,#3
5471                     ; 1346 		JX_BL_Change(6, (u8*)&stReportTime);
5473  0edb 96            	ldw	x,sp
5474  0edc 1c0009        	addw	x,#OFST-48
5475  0edf 89            	pushw	x
5476  0ee0 ae0006        	ldw	x,#6
5477  0ee3 cd0000        	call	_JX_BL_Change
5479  0ee6 85            	popw	x
5480                     ; 1347 		stReportTime.nMonth = stReportTime.nMonth&0x1F;
5482  0ee7 7b0a          	ld	a,(OFST-47,sp)
5483  0ee9 a41f          	and	a,#31
5484  0eeb 6b0a          	ld	(OFST-47,sp),a
5485                     ; 1348 		TM_TimeChangeAToB(&stReportTime,&stLastReportT);
5487  0eed ae0000        	ldw	x,#_stLastReportT
5488  0ef0 89            	pushw	x
5489  0ef1 96            	ldw	x,sp
5490  0ef2 1c000b        	addw	x,#OFST-46
5491  0ef5 cd0000        	call	_TM_TimeChangeAToB
5493  0ef8 85            	popw	x
5494                     ; 1349 		MemcpyFunc(nBuf, (u8*)&stLastReportT, 8);
5496  0ef9 4b08          	push	#8
5497  0efb ae0000        	ldw	x,#_stLastReportT
5498  0efe 89            	pushw	x
5499  0eff 96            	ldw	x,sp
5500  0f00 1c0033        	addw	x,#OFST-6
5501  0f03 cd0000        	call	_MemcpyFunc
5503  0f06 5b03          	addw	sp,#3
5504                     ; 1350 		MemcpyFunc(&nBuf[8], (u8*)&g_wTmReportCnt, 2);
5506  0f08 4b02          	push	#2
5507  0f0a ae0000        	ldw	x,#_g_wTmReportCnt
5508  0f0d 89            	pushw	x
5509  0f0e 96            	ldw	x,sp
5510  0f0f 1c003b        	addw	x,#OFST+2
5511  0f12 cd0000        	call	_MemcpyFunc
5513  0f15 5b03          	addw	sp,#3
5514                     ; 1351 		SaveParameterForType(nBuf, 10, LT_REP_TIME);
5516  0f17 4b05          	push	#5
5517  0f19 4b0a          	push	#10
5518  0f1b 96            	ldw	x,sp
5519  0f1c 1c0032        	addw	x,#OFST-7
5520  0f1f cd0000        	call	_SaveParameterForType
5522  0f22 85            	popw	x
5523                     ; 1352 		UC_SleepFunc(1);
5525  0f23 ad23          	call	LC013
5527  0f25 201e          	jra	L1202
5528  0f27               L7102:
5529                     ; 1356 		MemcpyFunc((u8 *)&stLastReportT, nBuf, 8);
5531  0f27 4b08          	push	#8
5532  0f29 96            	ldw	x,sp
5533  0f2a 1c0031        	addw	x,#OFST-8
5534  0f2d 89            	pushw	x
5535  0f2e ae0000        	ldw	x,#_stLastReportT
5536  0f31 cd0000        	call	_MemcpyFunc
5538  0f34 5b03          	addw	sp,#3
5539                     ; 1357 		MemcpyFunc((u8 *)&g_wTmReportCnt, &nBuf[8], 2);
5541  0f36 4b02          	push	#2
5542  0f38 96            	ldw	x,sp
5543  0f39 1c0039        	addw	x,#OFST+0
5544  0f3c 89            	pushw	x
5545  0f3d ae0000        	ldw	x,#_g_wTmReportCnt
5546  0f40 cd0000        	call	_MemcpyFunc
5548  0f43 5b03          	addw	sp,#3
5549  0f45               L1202:
5550                     ; 1360 	return ;
5553  0f45 5b39          	addw	sp,#57
5554  0f47 81            	ret	
5556  0f48               LC013:
5557  0f48 ae0001        	ldw	x,#1
5558  0f4b 89            	pushw	x
5559  0f4c 5f            	clrw	x
5560  0f4d 89            	pushw	x
5561  0f4e cd0000        	call	_UC_SleepFunc
5563  0f51 5b04          	addw	sp,#4
5564  0f53 81            	ret	
5684                     	xdef	_g_HD_device_addr
5685                     	xdef	_g_HD_aralm_type
5686                     	xdef	_g_HD_Msg_Tag
5687                     	xdef	_g_HD_Ctrl
5688                     	xdef	_stDataPtrHD
5689                     	xdef	_HeDa_Cmd_Get_Appoint_Data_Handle
5690                     	xdef	_HeDa_Cmd_Get_All_Param_Handle
5691                     	xdef	_HeDa_Cmd_Get_Secret_Key_Handle
5692                     	xdef	_HeDa_Cmd_Set_Secret_Key_Handle
5693                     	xdef	_HeDa_Cmd_Get_Addr_Handle
5694                     	xdef	_HeDa_Cmd_Set_Addr_Handle
5695                     	xdef	_HeDa_Cmd_Get_Pressure_Threshold_Handle
5696                     	xdef	_HeDa_Cmd_Set_Pressure_Threshold_Handle
5697                     	xdef	_HeDa_Cmd_Get_Report_Cycle_Handle
5698                     	xdef	_HeDa_Cmd_Set_Report_Cycle_Handle
5699                     	xdef	_HeDa_ReportCycleType_To_TypeAddCycle
5700                     	xdef	_HeDa_TypeAddCycle_To_ReportCycleType
5701                     	xdef	_HeDa_Cmd_Get_Net_Param_Handle
5702                     	xdef	_HeDa_Cmd_Set_Net_Param_Handle
5703                     	xdef	_HeDa_Cmd_Get_Sampling_Interval_Handle
5704                     	xdef	_HeDa_Cmd_Set_Sampling_Interval_Handle
5705                     	xdef	_HeDa_Cmd_Reply_Upload_Handle
5706                     	xdef	_HD_ProtolHandle
5707                     	xdef	_HD_AddressComparePro
5708                     	xdef	_HD_DecodeParameter
5709                     	xdef	_HD_ProtolSend
5710                     	xdef	_HD_Online
5711                     	xdef	_HD_OnlineCtl
5712                     	xdef	_HD_ProtolProc
5713                     	xdef	_HD_TimeOutReUpLoad
5714                     	xdef	_LP_HD_CalReportConut
5715                     	xdef	_HD_ClaReportTimeToSec
5716                     	xdef	_HD_InitializeGsm
5717                     	xref	_g_Device_Info
5718                     	xref	_BAT_GetBatVol
5719                     	xref	_STM8_RTC_Set
5720                     	xref	_STM8_RTC_Get
5721                     	xref	_g_stNextGmTime
5722                     	xref	_g_stNextRepTime
5723                     	xref	_stRepFail
5724                     	xref	_tyParameter
5725                     	xref	_tyRecord
5726                     	xref	_ReadDayFreezeRecord
5727                     	xref	_SaveParameterForType
5728                     	xref	_ReadParameterForType
5729                     	xref	_ReadRecord
5730                     	xref	_JX_StringCat
5731                     	xref	_JX_Strlen
5732                     	xref	_FrameSendFunc
5733                     	xref	_M590_CloseConnect
5734                     	xref	_M590_TcpSendDatLen
5735                     	xref	_SetLogonMode
5736                     	xref	_WatitDataSendOk
5737                     	xref	_GetReportFailFlag
5738                     	xref	_UC_SleepFunc
5739                     	xref	_m_nUploadMode
5740                     	xref	_g_nSignal
5741                     	xref	_g_wTmReportCnt
5742                     	xref	_aucAtPPort1
5743                     	xref	_aucAtPServer1
5744                     	xref	_ucStatusGsm
5745                     	xref	_tyReportParameter
5746                     	xref	_g_nApnType
5747                     	xref	_m_nRepFailFlg
5748                     	xref	_tyGSMFlag
5749                     	xref	_ucLogonMode
5750                     	xref	_g_nDatRepCnt
5751                     	xref	_m_nRepEnableFlg
5752                     	xref	_g_dwRepTick
5753                     	xref	_stLastReportT
5754                     	xref	_stTimeNow
5755                     	xref	_g_nApnBuf
5756                     	xref	_tyReport
5757                     	xref	_GetUartRxBuf
5758                     	xref	_ClearRxBuff
5759                     	xref	_CheckRevDataLen
5760                     	xref	_aucUartTxBuffer
5761                     	xref	_GM_GetGatherMeterFlg
5762                     	xref	_tyTime
5763                     	xref	_HeDa_Get_String_len
5764                     	xref	_JX_U32ToStr
5765                     	xref	_JX_IpAddrToStr
5766                     	xref	_TM_RTimeDecnMinute
5767                     	xref	_TM_RTimeAddnMinute
5768                     	xref	_TM_DiffSecond
5769                     	xref	_TM_TimeChangeBToA
5770                     	xref	_TM_TimeChangeAToB
5771                     	xref	_TM_IsValidTimePro
5772                     	xref	_JX_IsAllFillDat
5773                     	xref	_JX_AddSum8Bit
5774                     	xref	_JX_BL_Change
5775                     	xref	_MemcpyFunc
5776                     	xref	_MemsetFunc
5777                     	xref	_GetSysTemTick
5778                     	switch	.const
5779  005b               L1321:
5780  005b 2200          	dc.b	34,0
5781                     	xref.b	c_lreg
5801                     	xref	c_xymvx
5802                     	xref	c_lcmp
5803                     	xref	c_smul
5804                     	xref	c_ludv
5805                     	xref	c_lsub
5806                     	xref	c_lumd
5807                     	xref	c_uitolx
5808                     	xref	c_lmod
5809                     	xref	c_ldiv
5810                     	xref	c_lzmp
5811                     	xref	c_rtol
5812                     	xref	c_ltor
5813                     	xref	c_lmul
5814                     	xref	c_umul
5815                     	xref	c_cmulx
5816                     	end
