   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     .const:	section	.text
   6  0000               L3_m_nMonthMaxDaysTab:
   7  0000 1f            	dc.b	31
   8  0001 1c            	dc.b	28
   9  0002 1f            	dc.b	31
  10  0003 1e            	dc.b	30
  11  0004 1f            	dc.b	31
  12  0005 1e            	dc.b	30
  13  0006 1f            	dc.b	31
  14  0007 1f            	dc.b	31
  15  0008 1e            	dc.b	30
  16  0009 1f            	dc.b	31
  17  000a 1e            	dc.b	30
  18  000b 1f            	dc.b	31
  19  000c 1f            	dc.b	31
  20  000d 1d            	dc.b	29
  21  000e 1f            	dc.b	31
  22  000f 1e            	dc.b	30
  23  0010 1f            	dc.b	31
  24  0011 1e            	dc.b	30
  25  0012 1f            	dc.b	31
  26  0013 1f            	dc.b	31
  27  0014 1e            	dc.b	30
  28  0015 1f            	dc.b	31
  29  0016 1e            	dc.b	30
  30  0017 1f            	dc.b	31
  95                     ; 29 u8 MemcpyFunc(u8 *pnDeStr, u8 *pnSrcStr, u8 nSize)
  95                     ; 30 {
  97                     	switch	.text
  98  0000               _MemcpyFunc:
 100  0000 89            	pushw	x
 101  0001 88            	push	a
 102       00000001      OFST:	set	1
 105                     ; 31 	u8 nLoop=0;
 107                     ; 32 	for(nLoop=0; nLoop<nSize; nLoop++)
 109  0002 0f01          	clr	(OFST+0,sp)
 111  0004 201c          	jra	L54
 112  0006               L14:
 113                     ; 34 		pnDeStr[nLoop] = pnSrcStr[nLoop];
 115  0006 7b02          	ld	a,(OFST+1,sp)
 116  0008 97            	ld	xl,a
 117  0009 7b03          	ld	a,(OFST+2,sp)
 118  000b 1b01          	add	a,(OFST+0,sp)
 119  000d 2401          	jrnc	L6
 120  000f 5c            	incw	x
 121  0010               L6:
 122  0010 02            	rlwa	x,a
 123  0011 89            	pushw	x
 124  0012 7b08          	ld	a,(OFST+7,sp)
 125  0014 97            	ld	xl,a
 126  0015 7b09          	ld	a,(OFST+8,sp)
 127  0017 1b03          	add	a,(OFST+2,sp)
 128  0019 2401          	jrnc	L01
 129  001b 5c            	incw	x
 130  001c               L01:
 131  001c 02            	rlwa	x,a
 132  001d f6            	ld	a,(x)
 133  001e 85            	popw	x
 134  001f f7            	ld	(x),a
 135                     ; 32 	for(nLoop=0; nLoop<nSize; nLoop++)
 137  0020 0c01          	inc	(OFST+0,sp)
 138  0022               L54:
 141  0022 7b01          	ld	a,(OFST+0,sp)
 142  0024 1108          	cp	a,(OFST+7,sp)
 143  0026 25de          	jrult	L14
 144                     ; 36 	return nLoop;
 148  0028 5b03          	addw	sp,#3
 149  002a 81            	ret	
 205                     ; 48 u8 MemsetFunc(u8 *pnDeStr, u8 nVal, u8 nSize)
 205                     ; 49 {
 206                     	switch	.text
 207  002b               _MemsetFunc:
 209  002b 89            	pushw	x
 210  002c 88            	push	a
 211       00000001      OFST:	set	1
 214                     ; 50 	u8 nLoop=0;
 216                     ; 51 	for(nLoop=0; nLoop<nSize; nLoop++)
 218  002d 0f01          	clr	(OFST+0,sp)
 220  002f 2010          	jra	L101
 221  0031               L57:
 222                     ; 53 		pnDeStr[nLoop] = nVal;
 224  0031 7b02          	ld	a,(OFST+1,sp)
 225  0033 97            	ld	xl,a
 226  0034 7b03          	ld	a,(OFST+2,sp)
 227  0036 1b01          	add	a,(OFST+0,sp)
 228  0038 2401          	jrnc	L41
 229  003a 5c            	incw	x
 230  003b               L41:
 231  003b 02            	rlwa	x,a
 232  003c 7b06          	ld	a,(OFST+5,sp)
 233  003e f7            	ld	(x),a
 234                     ; 51 	for(nLoop=0; nLoop<nSize; nLoop++)
 236  003f 0c01          	inc	(OFST+0,sp)
 237  0041               L101:
 240  0041 7b01          	ld	a,(OFST+0,sp)
 241  0043 1107          	cp	a,(OFST+6,sp)
 242  0045 25ea          	jrult	L57
 243                     ; 55 	return nLoop;
 247  0047 5b03          	addw	sp,#3
 248  0049 81            	ret	
 295                     ; 67 void delay_us(unsigned int us)
 295                     ; 68 {
 296                     	switch	.text
 297  004a               _delay_us:
 299  004a 89            	pushw	x
 300  004b 5204          	subw	sp,#4
 301       00000004      OFST:	set	4
 304                     ; 72   for(i=0;i<us;i++)
 306  004d 5f            	clrw	x
 308  004e 200d          	jra	L131
 309  0050               L521:
 310                     ; 74 		for(j=0;j<16;j++)
 312  0050 5f            	clrw	x
 313  0051               L531:
 314                     ; 76 			nop();
 317  0051 9d            	nop	
 319                     ; 74 		for(j=0;j<16;j++)
 322  0052 5c            	incw	x
 325  0053 a30010        	cpw	x,#16
 326  0056 25f9          	jrult	L531
 327  0058 1f03          	ldw	(OFST-1,sp),x
 328                     ; 72   for(i=0;i<us;i++)
 330  005a 1e01          	ldw	x,(OFST-3,sp)
 331  005c 5c            	incw	x
 332  005d               L131:
 333  005d 1f01          	ldw	(OFST-3,sp),x
 336  005f 1305          	cpw	x,(OFST+1,sp)
 337  0061 25ed          	jrult	L521
 338                     ; 79 }
 341  0063 5b06          	addw	sp,#6
 342  0065 81            	ret	
 382                     ; 90 void delay_ms(u16 ms)
 382                     ; 91 {
 383                     	switch	.text
 384  0066               _delay_ms:
 386  0066 89            	pushw	x
 387  0067 89            	pushw	x
 388       00000002      OFST:	set	2
 391                     ; 94   for(i=0;i<ms;i++)
 393  0068 5f            	clrw	x
 395  0069 2008          	jra	L561
 396  006b               L161:
 397                     ; 96 		delay_us(1000);
 399  006b ae03e8        	ldw	x,#1000
 400  006e adda          	call	_delay_us
 402                     ; 94   for(i=0;i<ms;i++)
 404  0070 1e01          	ldw	x,(OFST-1,sp)
 405  0072 5c            	incw	x
 406  0073               L561:
 407  0073 1f01          	ldw	(OFST-1,sp),x
 410  0075 1303          	cpw	x,(OFST+1,sp)
 411  0077 25f2          	jrult	L161
 412                     ; 98 }
 415  0079 5b04          	addw	sp,#4
 416  007b 81            	ret	
 509                     ; 106 u8 TM_IsValidDate(const TM_Time *time)
 509                     ; 107 {
 510                     	switch	.text
 511  007c               _TM_IsValidDate:
 515                     ; 108 	if ((time == NULL) || (time->wYear > JX_MAX_VALID_YEAR) || (time->wYear < JX_MIN_VALID_YEAR) ||
 515                     ; 109          (time->nMonth > 12) || (time->nMonth < 1) ||
 515                     ; 110           (time->nDay > 31) || (time->nDay < 1))
 517  007c a30000        	cpw	x,#0
 518  007f 2728          	jreq	L532
 520  0081 9093          	ldw	y,x
 521  0083 90fe          	ldw	y,(y)
 522  0085 90a30835      	cpw	y,#2101
 523  0089 241e          	jruge	L532
 525  008b 9093          	ldw	y,x
 526  008d 90fe          	ldw	y,(y)
 527  008f 90a307d0      	cpw	y,#2000
 528  0093 2514          	jrult	L532
 530  0095 e602          	ld	a,(2,x)
 531  0097 a10d          	cp	a,#13
 532  0099 240e          	jruge	L532
 534  009b e602          	ld	a,(2,x)
 535  009d 270a          	jreq	L532
 537  009f e603          	ld	a,(3,x)
 538  00a1 a120          	cp	a,#32
 539  00a3 2404          	jruge	L532
 541  00a5 e603          	ld	a,(3,x)
 542  00a7 2602          	jrne	L332
 543  00a9               L532:
 544                     ; 112 		return (FALSE);  
 546  00a9 4f            	clr	a
 549  00aa 81            	ret	
 550  00ab               L332:
 551                     ; 114 	return (TRUE);
 553  00ab a601          	ld	a,#1
 556  00ad 81            	ret	
 559                     	switch	.const
 560  0018               L152_Year:
 561  0018 016d          	dc.w	365
 562  001a 016e          	dc.w	366
 637                     ; 123 uint32_t  TM_CalPastedDays(const TM_Time *timeNow)
 637                     ; 124 {
 638                     	switch	.text
 639  00ae               _TM_CalPastedDays:
 641  00ae 89            	pushw	x
 642  00af 520f          	subw	sp,#15
 643       0000000f      OFST:	set	15
 646                     ; 125 	uint16_t  Year[2] = {365, 366};
 648  00b1 96            	ldw	x,sp
 649  00b2 1c0003        	addw	x,#OFST-12
 650  00b5 90ae0018      	ldw	y,#L152_Year
 651  00b9 a604          	ld	a,#4
 652  00bb cd0000        	call	c_xymvx
 654                     ; 126 	uint32_t  dwPastDays = 0;
 656  00be 5f            	clrw	x
 657  00bf 1f0a          	ldw	(OFST-5,sp),x
 658  00c1 1f08          	ldw	(OFST-7,sp),x
 659                     ; 127 	uint16_t  i = 2000, j;
 661  00c3 ae07d0        	ldw	x,#2000
 662  00c6 1f0c          	ldw	(OFST-3,sp),x
 663                     ; 128 	uint8_t   nLoopYear = 0;
 665                     ; 130 	if (TM_IsValidDate(timeNow) == FALSE)
 667  00c8 1e10          	ldw	x,(OFST+1,sp)
 668  00ca adb0          	call	_TM_IsValidDate
 670  00cc 4d            	tnz	a
 671  00cd 2607          	jrne	L113
 672                     ; 132 		 return (0);
 674  00cf 5f            	clrw	x
 675  00d0 bf02          	ldw	c_lreg+2,x
 676  00d2 bf00          	ldw	c_lreg,x
 678  00d4 2053          	jra	L04
 679  00d6               L113:
 680                     ; 137 		nLoopYear = ((i%4 == 0) && ((i%100 != 0) || (i%400 == 0))) ? 1:0;
 682  00d6 7b0d          	ld	a,(OFST-2,sp)
 683  00d8 a503          	bcp	a,#3
 684  00da 2619          	jrne	L23
 685  00dc 1e0c          	ldw	x,(OFST-3,sp)
 686  00de a664          	ld	a,#100
 687  00e0 62            	div	x,a
 688  00e1 5f            	clrw	x
 689  00e2 97            	ld	xl,a
 690  00e3 5d            	tnzw	x
 691  00e4 260b          	jrne	L43
 692  00e6 1e0c          	ldw	x,(OFST-3,sp)
 693  00e8 90ae0190      	ldw	y,#400
 694  00ec 65            	divw	x,y
 695  00ed 905d          	tnzw	y
 696  00ef 2604          	jrne	L23
 697  00f1               L43:
 698  00f1 a601          	ld	a,#1
 699  00f3 2001          	jra	L63
 700  00f5               L23:
 701  00f5 4f            	clr	a
 702  00f6               L63:
 703  00f6 6b07          	ld	(OFST-8,sp),a
 704                     ; 139 		if (i < timeNow->wYear)
 706  00f8 1e10          	ldw	x,(OFST+1,sp)
 707  00fa fe            	ldw	x,(x)
 708  00fb 130c          	cpw	x,(OFST-3,sp)
 709  00fd 232d          	jrule	L713
 710                     ; 141 			dwPastDays += Year[nLoopYear];
 712  00ff 96            	ldw	x,sp
 713  0100 1c0003        	addw	x,#OFST-12
 714  0103 1f01          	ldw	(OFST-14,sp),x
 715  0105 5f            	clrw	x
 716  0106 97            	ld	xl,a
 717  0107 58            	sllw	x
 718  0108 72fb01        	addw	x,(OFST-14,sp)
 719  010b fe            	ldw	x,(x)
 720  010c cd0000        	call	c_uitolx
 724  010f               L123:
 725  010f 96            	ldw	x,sp
 726  0110 1c0008        	addw	x,#OFST-7
 727  0113 cd0000        	call	c_lgadd
 728                     ; 152 		i += 1;
 730  0116 1e0c          	ldw	x,(OFST-3,sp)
 731  0118 5c            	incw	x
 732  0119 1f0c          	ldw	(OFST-3,sp),x
 733                     ; 153 	}while (i <= timeNow->wYear);
 735  011b 1e10          	ldw	x,(OFST+1,sp)
 736  011d fe            	ldw	x,(x)
 737  011e 130c          	cpw	x,(OFST-3,sp)
 738  0120 24b4          	jruge	L113
 739                     ; 155 	return (dwPastDays);
 741  0122 96            	ldw	x,sp
 742  0123 1c0008        	addw	x,#OFST-7
 743  0126 cd0000        	call	c_ltor
 746  0129               L04:
 748  0129 5b11          	addw	sp,#17
 749  012b 81            	ret	
 750  012c               L713:
 751                     ; 145 			for (j=1; j<timeNow->nMonth; j++)
 753  012c ae0001        	ldw	x,#1
 755  012f 201d          	jra	L723
 756  0131               L323:
 757                     ; 147 				dwPastDays += m_nMonthMaxDaysTab[nLoopYear][j-1];
 759  0131 1e0e          	ldw	x,(OFST-1,sp)
 760  0133 5a            	decw	x
 761  0134 1f01          	ldw	(OFST-14,sp),x
 762  0136 7b07          	ld	a,(OFST-8,sp)
 763  0138 97            	ld	xl,a
 764  0139 a60c          	ld	a,#12
 765  013b 42            	mul	x,a
 766  013c 72fb01        	addw	x,(OFST-14,sp)
 767  013f d60000        	ld	a,(L3_m_nMonthMaxDaysTab,x)
 768  0142 96            	ldw	x,sp
 769  0143 1c0008        	addw	x,#OFST-7
 770  0146 88            	push	a
 771  0147 cd0000        	call	c_lgadc
 773  014a 84            	pop	a
 774                     ; 145 			for (j=1; j<timeNow->nMonth; j++)
 776  014b 1e0e          	ldw	x,(OFST-1,sp)
 777  014d 5c            	incw	x
 778  014e               L723:
 779  014e 1f0e          	ldw	(OFST-1,sp),x
 782  0150 1e10          	ldw	x,(OFST+1,sp)
 783  0152 e602          	ld	a,(2,x)
 784  0154 5f            	clrw	x
 785  0155 97            	ld	xl,a
 786  0156 130e          	cpw	x,(OFST-1,sp)
 787  0158 22d7          	jrugt	L323
 788                     ; 149 			dwPastDays += (timeNow->nDay-1);
 790  015a 1e10          	ldw	x,(OFST+1,sp)
 791  015c e603          	ld	a,(3,x)
 792  015e 5f            	clrw	x
 793  015f 97            	ld	xl,a
 794  0160 5a            	decw	x
 795  0161 cd0000        	call	c_itolx
 798  0164 20a9          	jra	L123
 845                     	switch	.const
 846  001c               L05:
 847  001c 00015180      	dc.l	86400
 848                     ; 163 uint32_t  TM_CalPastedSeconds(const TM_Time *timeNow)
 848                     ; 164 {
 849                     	switch	.text
 850  0166               _TM_CalPastedSeconds:
 852  0166 89            	pushw	x
 853  0167 5208          	subw	sp,#8
 854       00000008      OFST:	set	8
 857                     ; 168 	if (TM_IsValidTimePro(timeNow) == FALSE)
 859  0169 cd058a        	call	_TM_IsValidTimePro
 861  016c 4d            	tnz	a
 862  016d 2607          	jrne	L553
 863                     ; 170 		 return (0);
 865  016f 5f            	clrw	x
 866  0170 bf02          	ldw	c_lreg+2,x
 867  0172 bf00          	ldw	c_lreg,x
 869  0174 2049          	jra	L25
 870  0176               L553:
 871                     ; 173 	pastSec = TM_CalPastedDays(timeNow) * 24 * 3600UL;
 873  0176 1e09          	ldw	x,(OFST+1,sp)
 874  0178 cd00ae        	call	_TM_CalPastedDays
 876  017b ae001c        	ldw	x,#L05
 877  017e cd0000        	call	c_lmul
 879  0181 96            	ldw	x,sp
 880  0182 1c0005        	addw	x,#OFST-3
 881  0185 cd0000        	call	c_rtol
 883                     ; 174 	pastSec += (timeNow->nHour * 3600UL + timeNow->nMinute * 60UL + timeNow->nSecond);
 885  0188 1e09          	ldw	x,(OFST+1,sp)
 886  018a e605          	ld	a,(5,x)
 887  018c 5f            	clrw	x
 888  018d 97            	ld	xl,a
 889  018e a63c          	ld	a,#60
 890  0190 cd0000        	call	c_cmulx
 892  0193 96            	ldw	x,sp
 893  0194 5c            	incw	x
 894  0195 cd0000        	call	c_rtol
 896  0198 1e09          	ldw	x,(OFST+1,sp)
 897  019a e604          	ld	a,(4,x)
 898  019c 5f            	clrw	x
 899  019d 97            	ld	xl,a
 900  019e 90ae0e10      	ldw	y,#3600
 901  01a2 cd0000        	call	c_umul
 903  01a5 96            	ldw	x,sp
 904  01a6 5c            	incw	x
 905  01a7 cd0000        	call	c_ladd
 907  01aa 1e09          	ldw	x,(OFST+1,sp)
 908  01ac e606          	ld	a,(6,x)
 909  01ae cd0000        	call	c_ladc
 911  01b1 96            	ldw	x,sp
 912  01b2 1c0005        	addw	x,#OFST-3
 913  01b5 cd0000        	call	c_lgadd
 915                     ; 176 	return (pastSec);
 917  01b8 96            	ldw	x,sp
 918  01b9 1c0005        	addw	x,#OFST-3
 919  01bc cd0000        	call	c_ltor
 922  01bf               L25:
 924  01bf 5b0a          	addw	sp,#10
 925  01c1 81            	ret	
 989                     ; 184 int32_t  TM_DiffSecond(const TM_Time *timeNowS, const TM_Time *timeNowE)
 989                     ; 185 {
 990                     	switch	.text
 991  01c2               _TM_DiffSecond:
 993  01c2 89            	pushw	x
 994  01c3 5208          	subw	sp,#8
 995       00000008      OFST:	set	8
 998                     ; 188 	nSecS = (int32_t)TM_CalPastedSeconds(timeNowS);
1000  01c5 ad9f          	call	_TM_CalPastedSeconds
1002  01c7 96            	ldw	x,sp
1003  01c8 5c            	incw	x
1004  01c9 cd0000        	call	c_rtol
1006                     ; 189 	nSecE = (int32_t)TM_CalPastedSeconds(timeNowE);
1008  01cc 1e0d          	ldw	x,(OFST+5,sp)
1009  01ce ad96          	call	_TM_CalPastedSeconds
1011  01d0 96            	ldw	x,sp
1012  01d1 1c0005        	addw	x,#OFST-3
1013  01d4 cd0000        	call	c_rtol
1015                     ; 191 	return (nSecE - nSecS);
1017  01d7 96            	ldw	x,sp
1018  01d8 1c0005        	addw	x,#OFST-3
1019  01db cd0000        	call	c_ltor
1021  01de 96            	ldw	x,sp
1022  01df 5c            	incw	x
1023  01e0 cd0000        	call	c_lsub
1027  01e3 5b0a          	addw	sp,#10
1028  01e5 81            	ret	
1141                     ; 201 int32_t TM_TimeChangeAToB(ST_Time *pstTimeA, TM_Time *pstTimeB)
1141                     ; 202 {
1142                     	switch	.text
1143  01e6               _TM_TimeChangeAToB:
1145  01e6 89            	pushw	x
1146  01e7 89            	pushw	x
1147       00000002      OFST:	set	2
1150                     ; 203 	u16 wTmp = 0;
1152  01e8 5f            	clrw	x
1153  01e9 1f01          	ldw	(OFST-1,sp),x
1154                     ; 205 	if((NULL == pstTimeA)||(NULL == pstTimeB))
1156  01eb 1e03          	ldw	x,(OFST+1,sp)
1157  01ed 2704          	jreq	L564
1159  01ef 1e07          	ldw	x,(OFST+5,sp)
1160  01f1 2605          	jrne	L364
1161  01f3               L564:
1162                     ; 207 		return FALSE;
1164  01f3 5f            	clrw	x
1165  01f4 bf02          	ldw	c_lreg+2,x
1167  01f6 2056          	jra	L001
1168  01f8               L364:
1169                     ; 210 	wTmp = JX_BcdToByte(pstTimeA->wYear);
1171  01f8 1e03          	ldw	x,(OFST+1,sp)
1172  01fa f6            	ld	a,(x)
1173  01fb cd0aa8        	call	_JX_BcdToByte
1175  01fe 5f            	clrw	x
1176  01ff 97            	ld	xl,a
1177  0200 1f01          	ldw	(OFST-1,sp),x
1178                     ; 211 	pstTimeB->wYear   = wTmp+2000;
1180  0202 1c07d0        	addw	x,#2000
1181  0205 1607          	ldw	y,(OFST+5,sp)
1182  0207 90ff          	ldw	(y),x
1183                     ; 212 	pstTimeB->nMonth  = JX_BcdToByte(pstTimeA->nMonth);
1185  0209 1e03          	ldw	x,(OFST+1,sp)
1186  020b e601          	ld	a,(1,x)
1187  020d cd0aa8        	call	_JX_BcdToByte
1189  0210 1e07          	ldw	x,(OFST+5,sp)
1190  0212 e702          	ld	(2,x),a
1191                     ; 213 	pstTimeB->nDay    = JX_BcdToByte(pstTimeA->nDay);
1193  0214 1e03          	ldw	x,(OFST+1,sp)
1194  0216 e602          	ld	a,(2,x)
1195  0218 cd0aa8        	call	_JX_BcdToByte
1197  021b 1e07          	ldw	x,(OFST+5,sp)
1198  021d e703          	ld	(3,x),a
1199                     ; 214 	pstTimeB->nHour   = JX_BcdToByte(pstTimeA->nHour);
1201  021f 1e03          	ldw	x,(OFST+1,sp)
1202  0221 e603          	ld	a,(3,x)
1203  0223 cd0aa8        	call	_JX_BcdToByte
1205  0226 1e07          	ldw	x,(OFST+5,sp)
1206  0228 e704          	ld	(4,x),a
1207                     ; 215 	pstTimeB->nMinute = JX_BcdToByte(pstTimeA->nMinute);
1209  022a 1e03          	ldw	x,(OFST+1,sp)
1210  022c e604          	ld	a,(4,x)
1211  022e cd0aa8        	call	_JX_BcdToByte
1213  0231 1e07          	ldw	x,(OFST+5,sp)
1214  0233 e705          	ld	(5,x),a
1215                     ; 216 	pstTimeB->nSecond = JX_BcdToByte(pstTimeA->nSecond);
1217  0235 1e03          	ldw	x,(OFST+1,sp)
1218  0237 e605          	ld	a,(5,x)
1219  0239 cd0aa8        	call	_JX_BcdToByte
1221  023c 1e07          	ldw	x,(OFST+5,sp)
1222  023e e706          	ld	(6,x),a
1223                     ; 217 	pstTimeB->nWeek   = pstTimeA->nWeek;
1225  0240 1e03          	ldw	x,(OFST+1,sp)
1226  0242 e606          	ld	a,(6,x)
1227  0244 1e07          	ldw	x,(OFST+5,sp)
1228  0246 e707          	ld	(7,x),a
1229                     ; 218 	return TRUE;
1231  0248 ae0001        	ldw	x,#1
1232  024b bf02          	ldw	c_lreg+2,x
1233  024d 5f            	clrw	x
1235  024e               L001:
1236  024e bf00          	ldw	c_lreg,x
1238  0250 5b04          	addw	sp,#4
1239  0252 81            	ret	
1289                     ; 227 int32_t TM_TimeChangeBToA(const TM_Time *pstTimeB, ST_Time *pstTimeA)
1289                     ; 228 {
1290                     	switch	.text
1291  0253               _TM_TimeChangeBToA:
1293  0253 89            	pushw	x
1294       00000000      OFST:	set	0
1297                     ; 229 	if((NULL == pstTimeA)||(NULL == pstTimeB))
1299  0254 1e05          	ldw	x,(OFST+5,sp)
1300  0256 2704          	jreq	L715
1302  0258 1e01          	ldw	x,(OFST+1,sp)
1303  025a 2605          	jrne	L515
1304  025c               L715:
1305                     ; 231 		return FALSE;
1307  025c 5f            	clrw	x
1308  025d bf02          	ldw	c_lreg+2,x
1310  025f 2051          	jra	L021
1311  0261               L515:
1312                     ; 234 	pstTimeA->wYear   = (uint8_t)JX_ByteToBcd(pstTimeB->wYear%100);
1314  0261 fe            	ldw	x,(x)
1315  0262 a664          	ld	a,#100
1316  0264 62            	div	x,a
1317  0265 5f            	clrw	x
1318  0266 97            	ld	xl,a
1319  0267 cd0abc        	call	_JX_ByteToBcd
1321  026a 1e05          	ldw	x,(OFST+5,sp)
1322  026c f7            	ld	(x),a
1323                     ; 235 	pstTimeA->nMonth  = JX_ByteToBcd(pstTimeB->nMonth);
1325  026d 1e01          	ldw	x,(OFST+1,sp)
1326  026f e602          	ld	a,(2,x)
1327  0271 cd0abc        	call	_JX_ByteToBcd
1329  0274 1e05          	ldw	x,(OFST+5,sp)
1330  0276 e701          	ld	(1,x),a
1331                     ; 236 	pstTimeA->nDay    = JX_ByteToBcd(pstTimeB->nDay);
1333  0278 1e01          	ldw	x,(OFST+1,sp)
1334  027a e603          	ld	a,(3,x)
1335  027c cd0abc        	call	_JX_ByteToBcd
1337  027f 1e05          	ldw	x,(OFST+5,sp)
1338  0281 e702          	ld	(2,x),a
1339                     ; 237 	pstTimeA->nHour   = JX_ByteToBcd(pstTimeB->nHour);
1341  0283 1e01          	ldw	x,(OFST+1,sp)
1342  0285 e604          	ld	a,(4,x)
1343  0287 cd0abc        	call	_JX_ByteToBcd
1345  028a 1e05          	ldw	x,(OFST+5,sp)
1346  028c e703          	ld	(3,x),a
1347                     ; 238 	pstTimeA->nMinute = JX_ByteToBcd(pstTimeB->nMinute);
1349  028e 1e01          	ldw	x,(OFST+1,sp)
1350  0290 e605          	ld	a,(5,x)
1351  0292 cd0abc        	call	_JX_ByteToBcd
1353  0295 1e05          	ldw	x,(OFST+5,sp)
1354  0297 e704          	ld	(4,x),a
1355                     ; 239 	pstTimeA->nSecond = JX_ByteToBcd(pstTimeB->nSecond);
1357  0299 1e01          	ldw	x,(OFST+1,sp)
1358  029b e606          	ld	a,(6,x)
1359  029d cd0abc        	call	_JX_ByteToBcd
1361  02a0 1e05          	ldw	x,(OFST+5,sp)
1362  02a2 e705          	ld	(5,x),a
1363                     ; 240 	pstTimeA->nWeek   = pstTimeB->nWeek;
1365  02a4 1e01          	ldw	x,(OFST+1,sp)
1366  02a6 e607          	ld	a,(7,x)
1367  02a8 1e05          	ldw	x,(OFST+5,sp)
1368  02aa e706          	ld	(6,x),a
1369                     ; 241 	return TRUE;
1371  02ac ae0001        	ldw	x,#1
1372  02af bf02          	ldw	c_lreg+2,x
1373  02b1 5f            	clrw	x
1375  02b2               L021:
1376  02b2 bf00          	ldw	c_lreg,x
1378  02b4 5b02          	addw	sp,#2
1379  02b6 81            	ret	
1431                     	switch	.const
1432  0020               L621:
1433  0020 00000007      	dc.l	7
1434                     ; 248 uint8_t  TM_DayOfWeek(const TM_Time *time)
1434                     ; 249 {
1435                     	switch	.text
1436  02b7               _TM_DayOfWeek:
1438  02b7 5205          	subw	sp,#5
1439       00000005      OFST:	set	5
1442                     ; 250 	uint32_t  dwDays = TM_CalPastedDays(time);
1444  02b9 cd00ae        	call	_TM_CalPastedDays
1446  02bc 96            	ldw	x,sp
1447  02bd 5c            	incw	x
1448  02be cd0000        	call	c_rtol
1450                     ; 251 	uint8_t   nWeek  = (uint8_t)(dwDays % 7);
1452  02c1 96            	ldw	x,sp
1453  02c2 5c            	incw	x
1454  02c3 cd0000        	call	c_ltor
1456  02c6 ae0020        	ldw	x,#L621
1457  02c9 cd0000        	call	c_lumd
1459  02cc b603          	ld	a,c_lreg+3
1460                     ; 254 	nWeek = (nWeek + 6) % 7;
1462  02ce 5f            	clrw	x
1463  02cf 97            	ld	xl,a
1464  02d0 1c0006        	addw	x,#6
1465  02d3 a607          	ld	a,#7
1466  02d5 cd0000        	call	c_smodx
1468  02d8 9f            	ld	a,xl
1469                     ; 255 	return (nWeek + 1);
1471  02d9 4c            	inc	a
1474  02da 5b05          	addw	sp,#5
1475  02dc 81            	ret	
1478                     	switch	.const
1479  0024               L545_MonthTab:
1480  0024 00            	dc.b	0
1481  0025 1f            	dc.b	31
1482  0026 1c            	dc.b	28
1483  0027 1f            	dc.b	31
1484  0028 1e            	dc.b	30
1485  0029 1f            	dc.b	31
1486  002a 1e            	dc.b	30
1487  002b 1f            	dc.b	31
1488  002c 1f            	dc.b	31
1489  002d 1e            	dc.b	30
1490  002e 1f            	dc.b	31
1491  002f 1e            	dc.b	30
1492  0030 1f            	dc.b	31
1594                     	switch	.const
1595  0031               L231:
1596  0031 00000004      	dc.l	4
1597  0035               L431:
1598  0035 00000064      	dc.l	100
1599  0039               L631:
1600  0039 00000190      	dc.l	400
1601  003d               L041:
1602  003d 00000002      	dc.l	2
1603  0041               L241:
1604  0041 00000e10      	dc.l	3600
1605  0045               L441:
1606  0045 0000003c      	dc.l	60
1607                     ; 265 void  TM_SecondsToTime(uint32_t  dwSeconds, TM_Time  *pTime)
1607                     ; 266 {
1608                     	switch	.text
1609  02dd               _TM_SecondsToTime:
1611  02dd 522d          	subw	sp,#45
1612       0000002d      OFST:	set	45
1615                     ; 267 	int32_t   year=2000, month=1, day=1, hour=0, minute=0, second=0;
1617  02df ae07d0        	ldw	x,#2000
1618  02e2 1f28          	ldw	(OFST-5,sp),x
1619  02e4 5f            	clrw	x
1620  02e5 1f26          	ldw	(OFST-7,sp),x
1623  02e7 5c            	incw	x
1624  02e8 1f24          	ldw	(OFST-9,sp),x
1625  02ea 5f            	clrw	x
1626  02eb 1f22          	ldw	(OFST-11,sp),x
1629  02ed 5c            	incw	x
1630  02ee 1f20          	ldw	(OFST-13,sp),x
1631  02f0 5f            	clrw	x
1632  02f1 1f1e          	ldw	(OFST-15,sp),x
1635  02f3 1f0b          	ldw	(OFST-34,sp),x
1636  02f5 1f09          	ldw	(OFST-36,sp),x
1639  02f7 1f0f          	ldw	(OFST-30,sp),x
1640  02f9 1f0d          	ldw	(OFST-32,sp),x
1643  02fb 1f07          	ldw	(OFST-38,sp),x
1644  02fd 1f05          	ldw	(OFST-40,sp),x
1645                     ; 269 	uint8_t   MonthTab[13] = {0, 31,28,31,30,31,30,31,31,30,31,30,31};
1647  02ff 96            	ldw	x,sp
1648  0300 1c0011        	addw	x,#OFST-28
1649  0303 90ae0024      	ldw	y,#L545_MonthTab
1650  0307 a60d          	ld	a,#13
1651  0309 cd0000        	call	c_xymvx
1654  030c 2050          	jra	L716
1655  030e               L316:
1656                     ; 274 		if ((year%4==0 && year%100!=0) || year%400==0)   //»ÚƒÍ
1658  030e 96            	ldw	x,sp
1659  030f cd04ce        	call	LC002
1661  0312 2606          	jrne	L726
1663  0314 96            	ldw	x,sp
1664  0315 cd04dd        	call	LC003
1666  0318 2606          	jrne	L526
1667  031a               L726:
1669  031a 96            	ldw	x,sp
1670  031b cd04ec        	call	LC004
1672  031e 260a          	jrne	L326
1673  0320               L526:
1674                     ; 275 			delta = 366UL*24*60*60;
1676  0320 ae8500        	ldw	x,#34048
1677  0323 1f2c          	ldw	(OFST-1,sp),x
1678  0325 ae01e2        	ldw	x,#482
1680  0328 2008          	jra	L136
1681  032a               L326:
1682                     ; 277 			delta = 365UL*24*60*60;
1684  032a ae3380        	ldw	x,#13184
1685  032d 1f2c          	ldw	(OFST-1,sp),x
1686  032f ae01e1        	ldw	x,#481
1687  0332               L136:
1688  0332 1f2a          	ldw	(OFST-3,sp),x
1689                     ; 279 		if (dwSeconds < delta)
1691  0334 96            	ldw	x,sp
1692  0335 1c0030        	addw	x,#OFST+3
1693  0338 cd0000        	call	c_ltor
1695  033b 96            	ldw	x,sp
1696  033c 1c002a        	addw	x,#OFST-3
1697  033f cd0000        	call	c_lcmp
1699  0342 2403cc049c    	jrult	L146
1700                     ; 281 			break;
1702                     ; 285 			dwSeconds -= delta;
1704  0347 96            	ldw	x,sp
1705  0348 1c002a        	addw	x,#OFST-3
1706  034b cd0000        	call	c_ltor
1708  034e 96            	ldw	x,sp
1709  034f 1c0030        	addw	x,#OFST+3
1710  0352 cd0000        	call	c_lgsub
1712                     ; 286 			year++;
1714  0355 96            	ldw	x,sp
1715  0356 1c0026        	addw	x,#OFST-7
1716  0359 a601          	ld	a,#1
1717  035b cd0000        	call	c_lgadc
1719  035e               L716:
1720                     ; 272 	while (dwSeconds > 0)
1722  035e 96            	ldw	x,sp
1723  035f 1c0030        	addw	x,#OFST+3
1724  0362 cd0000        	call	c_lzmp
1726  0365 26a7          	jrne	L316
1727  0367 cc049c        	jra	L146
1728  036a               L736:
1729                     ; 293 		if (month == 2)
1731  036a 96            	ldw	x,sp
1732  036b 1c0022        	addw	x,#OFST-11
1733  036e cd0000        	call	c_ltor
1735  0371 ae003d        	ldw	x,#L041
1736  0374 cd0000        	call	c_lcmp
1738  0377 96            	ldw	x,sp
1739  0378 2627          	jrne	L546
1740                     ; 295 			if (((year%4 == 0) && (year%100 != 0)) || (year%400 == 0))   //»ÚƒÍ
1742  037a cd04ce        	call	LC002
1744  037d 2606          	jrne	L356
1746  037f 96            	ldw	x,sp
1747  0380 cd04dd        	call	LC003
1749  0383 2606          	jrne	L156
1750  0385               L356:
1752  0385 96            	ldw	x,sp
1753  0386 cd04ec        	call	LC004
1755  0389 260a          	jrne	L746
1756  038b               L156:
1757                     ; 296 				delta = 29UL * 24 * 60 * 60L;
1759  038b ae3b80        	ldw	x,#15232
1760  038e 1f2c          	ldw	(OFST-1,sp),x
1761  0390 ae0026        	ldw	x,#38
1763  0393 2008          	jp	LC001
1764  0395               L746:
1765                     ; 298 				delta = 28UL * 24 * 60 * 60L;
1767  0395 aeea00        	ldw	x,#59904
1768  0398 1f2c          	ldw	(OFST-1,sp),x
1769  039a ae0024        	ldw	x,#36
1770  039d               LC001:
1771  039d 1f2a          	ldw	(OFST-3,sp),x
1772  039f 2020          	jra	L756
1773  03a1               L546:
1774                     ; 302 			delta = 60UL*MonthTab[month] * 24 * 60;
1776  03a1 1c0011        	addw	x,#OFST-28
1777  03a4 1f03          	ldw	(OFST-42,sp),x
1778  03a6 1e24          	ldw	x,(OFST-9,sp)
1779  03a8 72fb03        	addw	x,(OFST-42,sp)
1780  03ab f6            	ld	a,(x)
1781  03ac b703          	ld	c_lreg+3,a
1782  03ae 3f02          	clr	c_lreg+2
1783  03b0 3f01          	clr	c_lreg+1
1784  03b2 3f00          	clr	c_lreg
1785  03b4 ae001c        	ldw	x,#L05
1786  03b7 cd0000        	call	c_lmul
1788  03ba 96            	ldw	x,sp
1789  03bb 1c002a        	addw	x,#OFST-3
1790  03be cd0000        	call	c_rtol
1792  03c1               L756:
1793                     ; 305 		if (dwSeconds < delta)
1795  03c1 96            	ldw	x,sp
1796  03c2 1c0030        	addw	x,#OFST+3
1797  03c5 cd0000        	call	c_ltor
1799  03c8 96            	ldw	x,sp
1800  03c9 1c002a        	addw	x,#OFST-3
1801  03cc cd0000        	call	c_lcmp
1803  03cf 2503cc0485    	jruge	L166
1804                     ; 307 			break;
1805  03d4               L346:
1806                     ; 316 	if (dwSeconds > 0)
1808  03d4 96            	ldw	x,sp
1809  03d5 1c0030        	addw	x,#OFST+3
1810  03d8 cd0000        	call	c_lzmp
1812  03db 2603cc04ab    	jreq	L566
1813                     ; 318 		day = dwSeconds / (24UL * 60 * 60L);
1815  03e0 96            	ldw	x,sp
1816  03e1 1c0030        	addw	x,#OFST+3
1817  03e4 cd0000        	call	c_ltor
1819  03e7 ae001c        	ldw	x,#L05
1820  03ea cd0000        	call	c_ludv
1822  03ed 96            	ldw	x,sp
1823  03ee 1c001e        	addw	x,#OFST-15
1824  03f1 cd0000        	call	c_rtol
1826                     ; 319 		dwSeconds -= (day * 24UL * 60 * 60L);
1828  03f4 96            	ldw	x,sp
1829  03f5 1c001e        	addw	x,#OFST-15
1830  03f8 cd0000        	call	c_ltor
1832  03fb ae001c        	ldw	x,#L05
1833  03fe cd0000        	call	c_lmul
1835  0401 96            	ldw	x,sp
1836  0402 1c0030        	addw	x,#OFST+3
1837  0405 cd0000        	call	c_lgsub
1839                     ; 320 		day++;
1841  0408 96            	ldw	x,sp
1842  0409 1c001e        	addw	x,#OFST-15
1843  040c a601          	ld	a,#1
1844  040e cd0000        	call	c_lgadc
1846                     ; 322 		if (dwSeconds > 0)
1848  0411 96            	ldw	x,sp
1849  0412 1c0030        	addw	x,#OFST+3
1850  0415 cd0000        	call	c_lzmp
1852  0418 27c3          	jreq	L566
1853                     ; 324 			hour = dwSeconds / (60 * 60L);
1855  041a 96            	ldw	x,sp
1856  041b 1c0030        	addw	x,#OFST+3
1857  041e cd0000        	call	c_ltor
1859  0421 ae0041        	ldw	x,#L241
1860  0424 cd0000        	call	c_ludv
1862  0427 96            	ldw	x,sp
1863  0428 1c0009        	addw	x,#OFST-36
1864  042b cd0000        	call	c_rtol
1866                     ; 325 			dwSeconds -= (hour * 60 * 60L);
1868  042e 96            	ldw	x,sp
1869  042f 1c0009        	addw	x,#OFST-36
1870  0432 cd0000        	call	c_ltor
1872  0435 ae0041        	ldw	x,#L241
1873  0438 cd0000        	call	c_lmul
1875  043b 96            	ldw	x,sp
1876  043c 1c0030        	addw	x,#OFST+3
1877  043f cd0000        	call	c_lgsub
1879                     ; 327 			if (dwSeconds > 0)
1881  0442 96            	ldw	x,sp
1882  0443 1c0030        	addw	x,#OFST+3
1883  0446 cd0000        	call	c_lzmp
1885  0449 2760          	jreq	L566
1886                     ; 329 				minute = dwSeconds / 60;
1888  044b 96            	ldw	x,sp
1889  044c 1c0030        	addw	x,#OFST+3
1890  044f cd0000        	call	c_ltor
1892  0452 ae0045        	ldw	x,#L441
1893  0455 cd0000        	call	c_ludv
1895  0458 96            	ldw	x,sp
1896  0459 1c000d        	addw	x,#OFST-32
1897  045c cd0000        	call	c_rtol
1899                     ; 330 				second = dwSeconds - minute * 60L;
1901  045f 96            	ldw	x,sp
1902  0460 1c000d        	addw	x,#OFST-32
1903  0463 cd0000        	call	c_ltor
1905  0466 a63c          	ld	a,#60
1906  0468 cd0000        	call	c_smul
1908  046b 96            	ldw	x,sp
1909  046c 5c            	incw	x
1910  046d cd0000        	call	c_rtol
1912  0470 96            	ldw	x,sp
1913  0471 1c0030        	addw	x,#OFST+3
1914  0474 cd0000        	call	c_ltor
1916  0477 96            	ldw	x,sp
1917  0478 5c            	incw	x
1918  0479 cd0000        	call	c_lsub
1920  047c 96            	ldw	x,sp
1921  047d 1c0005        	addw	x,#OFST-40
1922  0480 cd0000        	call	c_rtol
1924  0483 2026          	jra	L566
1925  0485               L166:
1926                     ; 311 			dwSeconds -= delta;
1928  0485 96            	ldw	x,sp
1929  0486 1c002a        	addw	x,#OFST-3
1930  0489 cd0000        	call	c_ltor
1932  048c 96            	ldw	x,sp
1933  048d 1c0030        	addw	x,#OFST+3
1934  0490 cd0000        	call	c_lgsub
1936                     ; 312 			month++;
1938  0493 96            	ldw	x,sp
1939  0494 1c0022        	addw	x,#OFST-11
1940  0497 a601          	ld	a,#1
1941  0499 cd0000        	call	c_lgadc
1943  049c               L146:
1944                     ; 291 	while (dwSeconds > 0)
1946  049c 96            	ldw	x,sp
1947  049d 1c0030        	addw	x,#OFST+3
1948  04a0 cd0000        	call	c_lzmp
1950  04a3 2703cc036a    	jrne	L736
1951  04a8 cc03d4        	jra	L346
1952  04ab               L566:
1953                     ; 335 	pTime->wYear   = year;
1955  04ab 1e34          	ldw	x,(OFST+7,sp)
1956  04ad 1628          	ldw	y,(OFST-5,sp)
1957  04af ff            	ldw	(x),y
1958                     ; 336 	pTime->nMonth  = month;
1960  04b0 7b25          	ld	a,(OFST-8,sp)
1961  04b2 e702          	ld	(2,x),a
1962                     ; 337 	pTime->nDay    = day;
1964  04b4 7b21          	ld	a,(OFST-12,sp)
1965  04b6 e703          	ld	(3,x),a
1966                     ; 338 	pTime->nHour   = hour;
1968  04b8 7b0c          	ld	a,(OFST-33,sp)
1969  04ba e704          	ld	(4,x),a
1970                     ; 339 	pTime->nMinute = minute;
1972  04bc 7b10          	ld	a,(OFST-29,sp)
1973  04be e705          	ld	(5,x),a
1974                     ; 340 	pTime->nSecond = second;
1976  04c0 7b08          	ld	a,(OFST-37,sp)
1977  04c2 e706          	ld	(6,x),a
1978                     ; 341 	pTime->nWeek   = TM_DayOfWeek(pTime);
1980  04c4 cd02b7        	call	_TM_DayOfWeek
1982  04c7 1e34          	ldw	x,(OFST+7,sp)
1983  04c9 e707          	ld	(7,x),a
1984                     ; 342 }
1987  04cb 5b2d          	addw	sp,#45
1988  04cd 81            	ret	
1990  04ce               LC002:
1991  04ce 1c0026        	addw	x,#OFST-7
1992  04d1 cd0000        	call	c_ltor
1994  04d4 ae0031        	ldw	x,#L231
1995  04d7 cd0000        	call	c_lmod
1997  04da cc0000        	jp	c_lrzmp
1998  04dd               LC003:
1999  04dd 1c0026        	addw	x,#OFST-7
2000  04e0 cd0000        	call	c_ltor
2002  04e3 ae0035        	ldw	x,#L431
2003  04e6 cd0000        	call	c_lmod
2005  04e9 cc0000        	jp	c_lrzmp
2006  04ec               LC004:
2007  04ec 1c0026        	addw	x,#OFST-7
2008  04ef cd0000        	call	c_ltor
2010  04f2 ae0039        	ldw	x,#L631
2011  04f5 cd0000        	call	c_lmod
2013  04f8 cc0000        	jp	c_lrzmp
2065                     ; 363 void  TM_RTimeAddnDay(TM_Time  *time, uint32_t  nAddDays)
2065                     ; 364 {
2066                     	switch	.text
2067  04fb               _TM_RTimeAddnDay:
2069  04fb 89            	pushw	x
2070  04fc 5204          	subw	sp,#4
2071       00000004      OFST:	set	4
2074                     ; 367     if (nAddDays > 0)
2076  04fe 96            	ldw	x,sp
2077  04ff 1c0009        	addw	x,#OFST+5
2078  0502 cd0000        	call	c_lzmp
2080  0505 272a          	jreq	L717
2081                     ; 369 		nPastSeconds = TM_CalPastedSeconds(time);
2083  0507 1e05          	ldw	x,(OFST+1,sp)
2084  0509 cd0166        	call	_TM_CalPastedSeconds
2086  050c 96            	ldw	x,sp
2087  050d 5c            	incw	x
2088  050e cd0000        	call	c_rtol
2090                     ; 371 		nPastSeconds += (nAddDays * 24 * 3600L);
2092  0511 96            	ldw	x,sp
2093  0512 1c0009        	addw	x,#OFST+5
2094  0515 cd0000        	call	c_ltor
2096  0518 ae001c        	ldw	x,#L05
2097  051b cd0000        	call	c_lmul
2099  051e 96            	ldw	x,sp
2100  051f 5c            	incw	x
2101  0520 cd0000        	call	c_lgadd
2103                     ; 372 		TM_SecondsToTime(nPastSeconds, time);
2105  0523 1e05          	ldw	x,(OFST+1,sp)
2106  0525 89            	pushw	x
2107  0526 1e05          	ldw	x,(OFST+1,sp)
2108  0528 89            	pushw	x
2109  0529 1e05          	ldw	x,(OFST+1,sp)
2110  052b 89            	pushw	x
2111  052c cd02dd        	call	_TM_SecondsToTime
2113  052f 5b06          	addw	sp,#6
2114  0531               L717:
2115                     ; 374 }
2118  0531 5b06          	addw	sp,#6
2119  0533 81            	ret	
2172                     ; 382 void  TM_RTimeAddnMinute(TM_Time  *time, uint32_t  nAddMinuts)
2172                     ; 383 {
2173                     	switch	.text
2174  0534               _TM_RTimeAddnMinute:
2176  0534 89            	pushw	x
2177  0535 5204          	subw	sp,#4
2178       00000004      OFST:	set	4
2181                     ; 386 	nPastSeconds = TM_CalPastedSeconds(time);
2183  0537 cd0166        	call	_TM_CalPastedSeconds
2185  053a 96            	ldw	x,sp
2186  053b 5c            	incw	x
2187  053c cd0000        	call	c_rtol
2189                     ; 388 	nPastSeconds += (nAddMinuts * 60);
2191  053f 96            	ldw	x,sp
2192  0540 1c0009        	addw	x,#OFST+5
2193  0543 cd0000        	call	c_ltor
2195  0546 a63c          	ld	a,#60
2196  0548 cd0000        	call	c_smul
2198  054b 96            	ldw	x,sp
2199  054c 5c            	incw	x
2200  054d cd0000        	call	c_lgadd
2202                     ; 389 	TM_SecondsToTime(nPastSeconds, time);
2204  0550 1e05          	ldw	x,(OFST+1,sp)
2205  0552 89            	pushw	x
2206  0553 1e05          	ldw	x,(OFST+1,sp)
2207  0555 89            	pushw	x
2208  0556 1e05          	ldw	x,(OFST+1,sp)
2209  0558 89            	pushw	x
2210  0559 cd02dd        	call	_TM_SecondsToTime
2212  055c 5b0c          	addw	sp,#12
2213                     ; 390 }
2216  055e 81            	ret	
2269                     ; 398 void  TM_RTimeDecnMinute(TM_Time  *time, uint32_t  nDecMinuts)
2269                     ; 399 {
2270                     	switch	.text
2271  055f               _TM_RTimeDecnMinute:
2273  055f 89            	pushw	x
2274  0560 5204          	subw	sp,#4
2275       00000004      OFST:	set	4
2278                     ; 402 	nPastSeconds = TM_CalPastedSeconds(time);
2280  0562 cd0166        	call	_TM_CalPastedSeconds
2282  0565 96            	ldw	x,sp
2283  0566 5c            	incw	x
2284  0567 cd0000        	call	c_rtol
2286                     ; 404 	nPastSeconds -= (nDecMinuts * 60);
2288  056a 96            	ldw	x,sp
2289  056b 1c0009        	addw	x,#OFST+5
2290  056e cd0000        	call	c_ltor
2292  0571 a63c          	ld	a,#60
2293  0573 cd0000        	call	c_smul
2295  0576 96            	ldw	x,sp
2296  0577 5c            	incw	x
2297  0578 cd0000        	call	c_lgsub
2299                     ; 405 	TM_SecondsToTime(nPastSeconds, time);
2301  057b 1e05          	ldw	x,(OFST+1,sp)
2302  057d 89            	pushw	x
2303  057e 1e05          	ldw	x,(OFST+1,sp)
2304  0580 89            	pushw	x
2305  0581 1e05          	ldw	x,(OFST+1,sp)
2306  0583 89            	pushw	x
2307  0584 cd02dd        	call	_TM_SecondsToTime
2309  0587 5b0c          	addw	sp,#12
2310                     ; 406 }
2313  0589 81            	ret	
2316                     	switch	.const
2317  0049               L177_nCommYearDayBuf:
2318  0049 1f            	dc.b	31
2319  004a 1c            	dc.b	28
2320  004b 1f            	dc.b	31
2321  004c 1e            	dc.b	30
2322  004d 1f            	dc.b	31
2323  004e 1e            	dc.b	30
2324  004f 1f            	dc.b	31
2325  0050 1f            	dc.b	31
2326  0051 1e            	dc.b	30
2327  0052 1f            	dc.b	31
2328  0053 1e            	dc.b	30
2329  0054 1f            	dc.b	31
2330  0055               L377_nLeapYearDayBuf:
2331  0055 1f            	dc.b	31
2332  0056 1d            	dc.b	29
2333  0057 1f            	dc.b	31
2334  0058 1e            	dc.b	30
2335  0059 1f            	dc.b	31
2336  005a 1e            	dc.b	30
2337  005b 1f            	dc.b	31
2338  005c 1f            	dc.b	31
2339  005d 1e            	dc.b	30
2340  005e 1f            	dc.b	31
2341  005f 1e            	dc.b	30
2342  0060 1f            	dc.b	31
2397                     ; 413 u8  TM_IsValidTimePro(const TM_Time *time)
2397                     ; 414 {
2398                     	switch	.text
2399  058a               _TM_IsValidTimePro:
2401  058a 89            	pushw	x
2402  058b 521a          	subw	sp,#26
2403       0000001a      OFST:	set	26
2406                     ; 415     const uint8_t nCommYearDayBuf[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
2408  058d 96            	ldw	x,sp
2409  058e 1c0003        	addw	x,#OFST-23
2410  0591 90ae0049      	ldw	y,#L177_nCommYearDayBuf
2411  0595 a60c          	ld	a,#12
2412  0597 cd0000        	call	c_xymvx
2414                     ; 416     const uint8_t nLeapYearDayBuf[12] = {31,29,31,30,31,30,31,31,30,31,30,31};
2416  059a 96            	ldw	x,sp
2417  059b 1c000f        	addw	x,#OFST-11
2418  059e 90ae0055      	ldw	y,#L377_nLeapYearDayBuf
2419  05a2 a60c          	ld	a,#12
2420  05a4 cd0000        	call	c_xymvx
2422                     ; 418 	if ((time->wYear > JX_MAX_VALID_YEAR) || (time->wYear < JX_MIN_VALID_YEAR) ||
2422                     ; 419          (time->nMonth > 12) || (time->nMonth < 1) ||
2422                     ; 420           (time->nDay > 31) || (time->nDay < 1) ||
2422                     ; 421            (time->nHour > 23) || (time->nMinute > 59) || (time->nSecond > 59)
2422                     ; 422            )//||(time->nWeek != TM_DayOfWeek(time))
2424  05a7 1e1b          	ldw	x,(OFST+1,sp)
2425  05a9 9093          	ldw	y,x
2426  05ab 90fe          	ldw	y,(y)
2427  05ad 90a30835      	cpw	y,#2101
2428  05b1 2463          	jruge	LC005
2430  05b3 9093          	ldw	y,x
2431  05b5 90fe          	ldw	y,(y)
2432  05b7 90a307d0      	cpw	y,#2000
2433  05bb 2559          	jrult	LC005
2435  05bd e602          	ld	a,(2,x)
2436  05bf a10d          	cp	a,#13
2437  05c1 2453          	jruge	LC005
2439  05c3 e602          	ld	a,(2,x)
2440  05c5 274f          	jreq	LC005
2442  05c7 e603          	ld	a,(3,x)
2443  05c9 a120          	cp	a,#32
2444  05cb 2449          	jruge	LC005
2446  05cd e603          	ld	a,(3,x)
2447  05cf 2745          	jreq	LC005
2449  05d1 e604          	ld	a,(4,x)
2450  05d3 a118          	cp	a,#24
2451  05d5 243f          	jruge	LC005
2453  05d7 e605          	ld	a,(5,x)
2454  05d9 a13c          	cp	a,#60
2455  05db 2439          	jruge	LC005
2457  05dd e606          	ld	a,(6,x)
2458  05df a13c          	cp	a,#60
2459                     ; 424 		return (FALSE);
2461  05e1 2433          	jruge	LC005
2462                     ; 428 	if( ((time->wYear%4==0) && (time->wYear%100!=0)) || (time->wYear%400==0))
2464  05e3 e601          	ld	a,(1,x)
2465  05e5 a503          	bcp	a,#3
2466  05e7 260b          	jrne	L3501
2468  05e9 fe            	ldw	x,(x)
2469  05ea a664          	ld	a,#100
2470  05ec 62            	div	x,a
2471  05ed 5f            	clrw	x
2472  05ee 97            	ld	xl,a
2473  05ef 5d            	tnzw	x
2474  05f0 260c          	jrne	L1501
2475  05f2 1e1b          	ldw	x,(OFST+1,sp)
2476  05f4               L3501:
2478  05f4 fe            	ldw	x,(x)
2479  05f5 90ae0190      	ldw	y,#400
2480  05f9 65            	divw	x,y
2481  05fa 905d          	tnzw	y
2482  05fc 2620          	jrne	L7401
2483  05fe               L1501:
2484                     ; 430 		if(time->nDay > nLeapYearDayBuf[time->nMonth-1])
2486  05fe 96            	ldw	x,sp
2487  05ff 1c000f        	addw	x,#OFST-11
2488  0602 1f01          	ldw	(OFST-25,sp),x
2489  0604 1e1b          	ldw	x,(OFST+1,sp)
2490  0606 e602          	ld	a,(2,x)
2491  0608 5f            	clrw	x
2492  0609 97            	ld	xl,a
2493  060a 5a            	decw	x
2494  060b 72fb01        	addw	x,(OFST-25,sp)
2495  060e 161b          	ldw	y,(OFST+1,sp)
2496  0610 90e603        	ld	a,(3,y)
2497  0613 f1            	cp	a,(x)
2498  0614 2304          	jrule	L5501
2499                     ; 432 			return (FALSE);
2501  0616               LC005:
2504  0616 4f            	clr	a
2506  0617               L471:
2508  0617 5b1c          	addw	sp,#28
2509  0619 81            	ret	
2510  061a               L5501:
2511                     ; 436 			return (TRUE);
2514  061a a601          	ld	a,#1
2516  061c 20f9          	jra	L471
2517  061e               L7401:
2518                     ; 441 	if(time->nDay > nCommYearDayBuf[time->nMonth-1])
2520  061e 96            	ldw	x,sp
2521  061f 1c0003        	addw	x,#OFST-23
2522  0622 1f01          	ldw	(OFST-25,sp),x
2523  0624 1e1b          	ldw	x,(OFST+1,sp)
2524  0626 e602          	ld	a,(2,x)
2525  0628 5f            	clrw	x
2526  0629 97            	ld	xl,a
2527  062a 5a            	decw	x
2528  062b 72fb01        	addw	x,(OFST-25,sp)
2529  062e 161b          	ldw	y,(OFST+1,sp)
2530  0630 90e603        	ld	a,(3,y)
2531  0633 f1            	cp	a,(x)
2532  0634 23e4          	jrule	L5501
2533                     ; 443 		return (FALSE);
2535  0636 20de          	jp	LC005
2536                     ; 446 	return (TRUE);
2616                     ; 543 uint8_t JX_AsciiToBuf(uint8_t* ppASCII_Buf, uint8_t *pnOutBuf)
2616                     ; 544 {
2617                     	switch	.text
2618  0638               _JX_AsciiToBuf:
2620  0638 89            	pushw	x
2621  0639 5206          	subw	sp,#6
2622       00000006      OFST:	set	6
2625                     ; 545 	uint8_t  *p = ppASCII_Buf, *pOutByte = pnOutBuf;
2627  063b 1f05          	ldw	(OFST-1,sp),x
2630                     ; 546 	uint8_t  nTransLen = 0, nTempByte = 0;
2632  063d 0f03          	clr	(OFST-3,sp)
2635  063f               L1211:
2636                     ; 550 		if (*p >= 'A' && *p <= 'F')
2638  063f f6            	ld	a,(x)
2639  0640 a141          	cp	a,#65
2640  0642 2508          	jrult	L5211
2642  0644 a147          	cp	a,#71
2643  0646 2404          	jruge	L5211
2644                     ; 552 			nTempByte = *p - 'A' + 0x0a;
2646  0648 a037          	sub	a,#55
2648  064a 2016          	jra	L7211
2649  064c               L5211:
2650                     ; 554 		else if (*p >= 'a' && *p <= 'f')
2652  064c a161          	cp	a,#97
2653  064e 2508          	jrult	L1311
2655  0650 a167          	cp	a,#103
2656  0652 2404          	jruge	L1311
2657                     ; 556 			nTempByte = *p - 'a' + 0x0a;
2659  0654 a057          	sub	a,#87
2661  0656 200a          	jra	L7211
2662  0658               L1311:
2663                     ; 558 		else if (*p >= '0' && *p <= '9')
2665  0658 a130          	cp	a,#48
2666  065a 252c          	jrult	L3211
2668  065c a13a          	cp	a,#58
2669  065e 2428          	jruge	L3211
2670                     ; 560 			nTempByte = *p - '0';
2672  0660 a030          	sub	a,#48
2674  0662               L7211:
2675  0662 6b04          	ld	(OFST-2,sp),a
2676                     ; 567 		if ((nTransLen%2) == 0)
2678  0664 7b03          	ld	a,(OFST-3,sp)
2679  0666 a501          	bcp	a,#1
2680  0668 2609          	jrne	L1411
2681                     ; 569 			nTempByte <<= 4;
2683  066a 7b04          	ld	a,(OFST-2,sp)
2684  066c 4e            	swap	a
2685  066d a4f0          	and	a,#240
2686  066f 6b04          	ld	(OFST-2,sp),a
2687  0671 7b03          	ld	a,(OFST-3,sp)
2688  0673               L1411:
2689                     ; 571 		pOutByte = pnOutBuf + (nTransLen / 2);
2691  0673 44            	srl	a
2692  0674 5f            	clrw	x
2693  0675 97            	ld	xl,a
2694  0676 72fb0b        	addw	x,(OFST+5,sp)
2695  0679 1f01          	ldw	(OFST-5,sp),x
2696                     ; 572 		*pOutByte |= nTempByte;
2698  067b f6            	ld	a,(x)
2699  067c 1a04          	or	a,(OFST-2,sp)
2700  067e f7            	ld	(x),a
2701                     ; 574 		nTransLen++;			
2703  067f 0c03          	inc	(OFST-3,sp)
2704                     ; 575 		p++;  
2706  0681 1e05          	ldw	x,(OFST-1,sp)
2707  0683 5c            	incw	x
2708  0684 1f05          	ldw	(OFST-1,sp),x
2710  0686 20b7          	jra	L1211
2711  0688               L3211:
2712                     ; 579 	return (nTransLen);
2714  0688 7b03          	ld	a,(OFST-3,sp)
2717  068a 5b08          	addw	sp,#8
2718  068c 81            	ret	
2789                     ; 591 u8 JX_BcdStrToByte(u8* pnRxBuf, u8 nLen)
2789                     ; 592 {
2790                     	switch	.text
2791  068d               _JX_BcdStrToByte:
2793  068d 89            	pushw	x
2794  068e 5204          	subw	sp,#4
2795       00000004      OFST:	set	4
2798                     ; 593 	u8 i =0, nData = 0, nIndex = 1, j = 0;
2802  0690 0f01          	clr	(OFST-3,sp)
2807                     ; 595 	JX_BL_Change(nLen, pnRxBuf);
2809  0692 1e05          	ldw	x,(OFST+1,sp)
2810  0694 89            	pushw	x
2811  0695 7b0b          	ld	a,(OFST+7,sp)
2812  0697 5f            	clrw	x
2813  0698 97            	ld	xl,a
2814  0699 cd08ae        	call	_JX_BL_Change
2816  069c 85            	popw	x
2817                     ; 596 	for(i = 0; i < nLen; i++)
2819  069d 0f03          	clr	(OFST-1,sp)
2821  069f 2032          	jra	L7711
2822  06a1               L3711:
2823                     ; 598 		nIndex = 1;
2825  06a1 a601          	ld	a,#1
2826  06a3 6b04          	ld	(OFST+0,sp),a
2827                     ; 599 		for(j = 0; j < i; j++)
2829  06a5 0f02          	clr	(OFST-2,sp)
2831  06a7 200b          	jra	L7021
2832  06a9               L3021:
2833                     ; 601 			nIndex = nIndex*10;
2835  06a9 ae000a        	ldw	x,#10
2836  06ac 7b04          	ld	a,(OFST+0,sp)
2837  06ae 42            	mul	x,a
2838  06af 9f            	ld	a,xl
2839  06b0 6b04          	ld	(OFST+0,sp),a
2840                     ; 599 		for(j = 0; j < i; j++)
2842  06b2 0c02          	inc	(OFST-2,sp)
2843  06b4               L7021:
2846  06b4 7b02          	ld	a,(OFST-2,sp)
2847  06b6 1103          	cp	a,(OFST-1,sp)
2848  06b8 25ef          	jrult	L3021
2849                     ; 604 		nData += (pnRxBuf[i]-'0')*nIndex;
2851  06ba 7b05          	ld	a,(OFST+1,sp)
2852  06bc 97            	ld	xl,a
2853  06bd 7b06          	ld	a,(OFST+2,sp)
2854  06bf 1b03          	add	a,(OFST-1,sp)
2855  06c1 2401          	jrnc	L402
2856  06c3 5c            	incw	x
2857  06c4               L402:
2858  06c4 02            	rlwa	x,a
2859  06c5 f6            	ld	a,(x)
2860  06c6 a030          	sub	a,#48
2861  06c8 97            	ld	xl,a
2862  06c9 7b04          	ld	a,(OFST+0,sp)
2863  06cb 42            	mul	x,a
2864  06cc 9f            	ld	a,xl
2865  06cd 1b01          	add	a,(OFST-3,sp)
2866  06cf 6b01          	ld	(OFST-3,sp),a
2867                     ; 596 	for(i = 0; i < nLen; i++)
2869  06d1 0c03          	inc	(OFST-1,sp)
2870  06d3               L7711:
2873  06d3 7b03          	ld	a,(OFST-1,sp)
2874  06d5 1109          	cp	a,(OFST+5,sp)
2875  06d7 25c8          	jrult	L3711
2876                     ; 607 	return nData;	
2878  06d9 7b01          	ld	a,(OFST-3,sp)
2881  06db 5b06          	addw	sp,#6
2882  06dd 81            	ret	
2931                     ; 619 u8 JX_ByteToBcdStr(u8 nDat, u8* pnRxBuf)
2931                     ; 620 {
2932                     	switch	.text
2933  06de               _JX_ByteToBcdStr:
2935  06de 88            	push	a
2936  06df 88            	push	a
2937       00000001      OFST:	set	1
2940                     ; 621 	u8 i =0;
2942  06e0 0f01          	clr	(OFST+0,sp)
2943                     ; 623 	if(0 != nDat/100)
2945  06e2 5f            	clrw	x
2946  06e3 97            	ld	xl,a
2947  06e4 a664          	ld	a,#100
2948  06e6 cd0000        	call	c_sdivx
2950  06e9 5d            	tnzw	x
2951  06ea 2732          	jreq	L5321
2952                     ; 625 		pnRxBuf[i++] = '0'+nDat/100;
2954  06ec 7b01          	ld	a,(OFST+0,sp)
2955  06ee 0c01          	inc	(OFST+0,sp)
2956  06f0 5f            	clrw	x
2957  06f1 97            	ld	xl,a
2958  06f2 72fb05        	addw	x,(OFST+4,sp)
2959  06f5 7b02          	ld	a,(OFST+1,sp)
2960  06f7 90ae0064      	ldw	y,#100
2961  06fb ad5b          	call	LC007
2962                     ; 626 		pnRxBuf[i++] = '0'+(nDat%100)/10;
2964  06fd 7b02          	ld	a,(OFST+1,sp)
2965  06ff 5f            	clrw	x
2966  0700 97            	ld	xl,a
2967  0701 a664          	ld	a,#100
2968  0703 cd0000        	call	c_smodx
2970  0706 a60a          	ld	a,#10
2971  0708 cd0000        	call	c_sdivx
2973  070b 1c0030        	addw	x,#48
2974  070e 7b01          	ld	a,(OFST+0,sp)
2975  0710 0c01          	inc	(OFST+0,sp)
2976  0712 905f          	clrw	y
2977  0714 9097          	ld	yl,a
2978  0716 72f905        	addw	y,(OFST+4,sp)
2979  0719 01            	rrwa	x,a
2980  071a 90f7          	ld	(y),a
2981                     ; 627 		pnRxBuf[i++] = '0'+nDat%10;
2983  071c 201d          	jra	L1421
2984  071e               L5321:
2985                     ; 631 		if(0 != nDat/10)
2987  071e 7b02          	ld	a,(OFST+1,sp)
2988  0720 5f            	clrw	x
2989  0721 97            	ld	xl,a
2990  0722 a60a          	ld	a,#10
2991  0724 cd0000        	call	c_sdivx
2993  0727 5d            	tnzw	x
2994  0728 2711          	jreq	L1421
2995                     ; 633 			pnRxBuf[i++] = '0'+nDat/10;
2997  072a 7b01          	ld	a,(OFST+0,sp)
2998  072c 0c01          	inc	(OFST+0,sp)
2999  072e 5f            	clrw	x
3000  072f 97            	ld	xl,a
3001  0730 72fb05        	addw	x,(OFST+4,sp)
3002  0733 7b02          	ld	a,(OFST+1,sp)
3003  0735 90ae000a      	ldw	y,#10
3004  0739 ad1d          	call	LC007
3005                     ; 634 			pnRxBuf[i++] = '0'+nDat%10;
3007  073b               L1421:
3008                     ; 638 			pnRxBuf[i++] = '0'+nDat%10;
3012  073b 7b01          	ld	a,(OFST+0,sp)
3013  073d 0c01          	inc	(OFST+0,sp)
3014  073f 5f            	clrw	x
3015  0740 97            	ld	xl,a
3016  0741 72fb05        	addw	x,(OFST+4,sp)
3017  0744 7b02          	ld	a,(OFST+1,sp)
3018  0746 90ae000a      	ldw	y,#10
3019  074a 89            	pushw	x
3020  074b 5f            	clrw	x
3021  074c 97            	ld	xl,a
3022  074d 65            	divw	x,y
3023  074e 909f          	ld	a,yl
3024  0750 ab30          	add	a,#48
3025  0752 85            	popw	x
3026  0753 f7            	ld	(x),a
3027                     ; 642 	return i;	
3029  0754 7b01          	ld	a,(OFST+0,sp)
3032  0756 85            	popw	x
3033  0757 81            	ret	
3035  0758               LC007:
3036  0758 89            	pushw	x
3037  0759 5f            	clrw	x
3038  075a 97            	ld	xl,a
3039  075b 65            	divw	x,y
3040  075c 9f            	ld	a,xl
3041  075d ab30          	add	a,#48
3042  075f 85            	popw	x
3043  0760 f7            	ld	(x),a
3044  0761 81            	ret	
3123                     ; 651 uint32_t  JX_HexToASCII(uint8_t* in, uint8_t* out, uint16_t wInLen)
3123                     ; 652 {
3124                     	switch	.text
3125  0762               _JX_HexToASCII:
3127  0762 89            	pushw	x
3128  0763 520a          	subw	sp,#10
3129       0000000a      OFST:	set	10
3132                     ; 657 	if ((in == NULL) || (wInLen > 16384) || (in == NULL))
3134  0765 5d            	tnzw	x
3135  0766 270b          	jreq	L3031
3137  0768 1e11          	ldw	x,(OFST+7,sp)
3138  076a a34001        	cpw	x,#16385
3139  076d 2404          	jruge	L3031
3141  076f 1e0b          	ldw	x,(OFST+1,sp)
3142  0771 2607          	jrne	L1031
3143  0773               L3031:
3144                     ; 659 		return (0);
3146  0773 5f            	clrw	x
3147  0774 bf02          	ldw	c_lreg+2,x
3148  0776 bf00          	ldw	c_lreg,x
3150  0778 206d          	jra	L212
3151  077a               L1031:
3152                     ; 662     for (i=0; i<wInLen; i++)
3154  077a 5f            	clrw	x
3155  077b 1f07          	ldw	(OFST-3,sp),x
3156  077d 1f05          	ldw	(OFST-5,sp),x
3158  077f 203e          	jra	L3131
3159  0781               L7031:
3160                     ; 664 		b = *in++;
3162  0781 1e0b          	ldw	x,(OFST+1,sp)
3163  0783 f6            	ld	a,(x)
3164  0784 5c            	incw	x
3165  0785 1f0b          	ldw	(OFST+1,sp),x
3166  0787 6b0a          	ld	(OFST+0,sp),a
3167                     ; 665 		hi = b >> 4;
3169  0789 4e            	swap	a
3170  078a a40f          	and	a,#15
3171  078c 6b09          	ld	(OFST-1,sp),a
3172                     ; 666 		lo = b & 0x0f;
3174  078e 7b0a          	ld	a,(OFST+0,sp)
3175  0790 a40f          	and	a,#15
3176  0792 6b0a          	ld	(OFST+0,sp),a
3177                     ; 668 		if (hi >= 0x0a)
3179  0794 7b09          	ld	a,(OFST-1,sp)
3180  0796 a10a          	cp	a,#10
3181  0798 2504          	jrult	L7131
3182                     ; 669 			*out++ = hi - 0x0a + 'A';
3184  079a ab37          	add	a,#55
3186  079c 2002          	jra	L1231
3187  079e               L7131:
3188                     ; 671 			*out++ = hi + '0';
3190  079e ab30          	add	a,#48
3191  07a0               L1231:
3192  07a0 1e0f          	ldw	x,(OFST+5,sp)
3193  07a2 f7            	ld	(x),a
3194  07a3 5c            	incw	x
3195  07a4 1f0f          	ldw	(OFST+5,sp),x
3196                     ; 673 		if (lo >= 0x0a)
3198  07a6 7b0a          	ld	a,(OFST+0,sp)
3199  07a8 a10a          	cp	a,#10
3200  07aa 2504          	jrult	L3231
3201                     ; 674 			*out++ = lo - 0x0a + 'A';
3203  07ac ab37          	add	a,#55
3205  07ae 2002          	jra	L5231
3206  07b0               L3231:
3207                     ; 676 			*out++ = lo + '0';
3209  07b0 ab30          	add	a,#48
3210  07b2               L5231:
3211  07b2 f7            	ld	(x),a
3212  07b3 5c            	incw	x
3213  07b4 1f0f          	ldw	(OFST+5,sp),x
3214                     ; 662     for (i=0; i<wInLen; i++)
3216  07b6 96            	ldw	x,sp
3217  07b7 1c0005        	addw	x,#OFST-5
3218  07ba a601          	ld	a,#1
3219  07bc cd0000        	call	c_lgadc
3221  07bf               L3131:
3224  07bf 1e11          	ldw	x,(OFST+7,sp)
3225  07c1 cd0000        	call	c_uitolx
3227  07c4 96            	ldw	x,sp
3228  07c5 5c            	incw	x
3229  07c6 cd0000        	call	c_rtol
3231  07c9 96            	ldw	x,sp
3232  07ca 1c0005        	addw	x,#OFST-5
3233  07cd cd0000        	call	c_ltor
3235  07d0 96            	ldw	x,sp
3236  07d1 5c            	incw	x
3237  07d2 cd0000        	call	c_lcmp
3239  07d5 25aa          	jrult	L7031
3240                     ; 680 	*out = 0;
3242  07d7 1e0f          	ldw	x,(OFST+5,sp)
3243  07d9 7f            	clr	(x)
3244                     ; 682 	return  ((uint32_t)wInLen*2L);
3246  07da 1e11          	ldw	x,(OFST+7,sp)
3247  07dc cd0000        	call	c_uitolx
3249  07df 3803          	sll	c_lreg+3
3250  07e1 3902          	rlc	c_lreg+2
3251  07e3 3901          	rlc	c_lreg+1
3252  07e5 3900          	rlc	c_lreg
3254  07e7               L212:
3256  07e7 5b0c          	addw	sp,#12
3257  07e9 81            	ret	
3329                     ; 692 u16 JX_BcdStrTo16BitBin(uint8_t *pStr, u8 nLen)
3329                     ; 693 {
3330                     	switch	.text
3331  07ea               _JX_BcdStrTo16BitBin:
3333  07ea 89            	pushw	x
3334  07eb 5208          	subw	sp,#8
3335       00000008      OFST:	set	8
3338                     ; 694 	u16 i =0, wData = 0, wIndex = 1, j = 0;
3342  07ed 5f            	clrw	x
3343  07ee 1f01          	ldw	(OFST-7,sp),x
3348                     ; 696 	JX_BL_Change(nLen, pStr);
3350  07f0 1e09          	ldw	x,(OFST+1,sp)
3351  07f2 89            	pushw	x
3352  07f3 7b0f          	ld	a,(OFST+7,sp)
3353  07f5 5f            	clrw	x
3354  07f6 97            	ld	xl,a
3355  07f7 cd08ae        	call	_JX_BL_Change
3357  07fa 85            	popw	x
3358                     ; 697 	for(i = 0; i < nLen; i++)
3360  07fb 5f            	clrw	x
3362  07fc 2034          	jra	L3631
3363  07fe               L7531:
3364                     ; 699 		wIndex = 1;
3366  07fe ae0001        	ldw	x,#1
3367  0801 1f07          	ldw	(OFST-1,sp),x
3368                     ; 700 		for(j = 0; j < i; j++)
3370  0803 5f            	clrw	x
3372  0804 200e          	jra	L3731
3373  0806               L7631:
3374                     ; 702 			wIndex = wIndex*10;
3376  0806 1e07          	ldw	x,(OFST-1,sp)
3377  0808 90ae000a      	ldw	y,#10
3378  080c cd0000        	call	c_imul
3380  080f 1f07          	ldw	(OFST-1,sp),x
3381                     ; 700 		for(j = 0; j < i; j++)
3383  0811 1e03          	ldw	x,(OFST-5,sp)
3384  0813 5c            	incw	x
3385  0814               L3731:
3386  0814 1f03          	ldw	(OFST-5,sp),x
3389  0816 1305          	cpw	x,(OFST-3,sp)
3390  0818 25ec          	jrult	L7631
3391                     ; 705 		wData += (pStr[i]-'0')*wIndex;
3393  081a 1e09          	ldw	x,(OFST+1,sp)
3394  081c 72fb05        	addw	x,(OFST-3,sp)
3395  081f f6            	ld	a,(x)
3396  0820 5f            	clrw	x
3397  0821 97            	ld	xl,a
3398  0822 1d0030        	subw	x,#48
3399  0825 1607          	ldw	y,(OFST-1,sp)
3400  0827 cd0000        	call	c_imul
3402  082a 72fb01        	addw	x,(OFST-7,sp)
3403  082d 1f01          	ldw	(OFST-7,sp),x
3404                     ; 697 	for(i = 0; i < nLen; i++)
3406  082f 1e05          	ldw	x,(OFST-3,sp)
3407  0831 5c            	incw	x
3408  0832               L3631:
3409  0832 1f05          	ldw	(OFST-3,sp),x
3412  0834 7b0d          	ld	a,(OFST+5,sp)
3413  0836 5f            	clrw	x
3414  0837 97            	ld	xl,a
3415  0838 bf00          	ldw	c_x,x
3416  083a 1e05          	ldw	x,(OFST-3,sp)
3417  083c b300          	cpw	x,c_x
3418  083e 25be          	jrult	L7531
3419                     ; 708 	return wData;
3421  0840 1e01          	ldw	x,(OFST-7,sp)
3424  0842 5b0a          	addw	sp,#10
3425  0844 81            	ret	
3490                     ; 716 u16 JX_BcdStrTo16BitBcd(uint8_t *pStr, u8 nLen)
3490                     ; 717 {
3491                     	switch	.text
3492  0845               _JX_BcdStrTo16BitBcd:
3494  0845 89            	pushw	x
3495  0846 5206          	subw	sp,#6
3496       00000006      OFST:	set	6
3499                     ; 718 	u16 wData = 0, wIndex = 1, j = 0;
3501  0848 5f            	clrw	x
3502  0849 1f01          	ldw	(OFST-5,sp),x
3507                     ; 720 	JX_BL_Change(nLen, pStr);
3509  084b 1e07          	ldw	x,(OFST+1,sp)
3510  084d 89            	pushw	x
3511  084e 7b0d          	ld	a,(OFST+7,sp)
3512  0850 5f            	clrw	x
3513  0851 97            	ld	xl,a
3514  0852 ad5a          	call	_JX_BL_Change
3516  0854 85            	popw	x
3517                     ; 721 	for(j = 0; j < nLen; j++)
3519  0855 5f            	clrw	x
3521  0856 2043          	jra	L1341
3522  0858               L5241:
3523                     ; 723 		if (*pStr>='A' && *pStr<='F')
3525  0858 1e07          	ldw	x,(OFST+1,sp)
3526  085a f6            	ld	a,(x)
3527  085b a141          	cp	a,#65
3528  085d 250b          	jrult	L5341
3530  085f a147          	cp	a,#71
3531  0861 2407          	jruge	L5341
3532                     ; 724 			wIndex = *pStr - 'A' + 0x0a;
3534  0863 5f            	clrw	x
3535  0864 97            	ld	xl,a
3536  0865 1d0037        	subw	x,#55
3538  0868 2014          	jra	L7341
3539  086a               L5341:
3540                     ; 725 		else if (*pStr>='a' && *pStr<='f')
3542  086a a161          	cp	a,#97
3543  086c 250b          	jrult	L1441
3545  086e a167          	cp	a,#103
3546  0870 2407          	jruge	L1441
3547                     ; 726 			wIndex = *pStr - 'a' + 0x0a;
3549  0872 5f            	clrw	x
3550  0873 97            	ld	xl,a
3551  0874 1d0057        	subw	x,#87
3553  0877 2005          	jra	L7341
3554  0879               L1441:
3555                     ; 728 			wIndex = *pStr - '0';
3557  0879 5f            	clrw	x
3558  087a 97            	ld	xl,a
3559  087b 1d0030        	subw	x,#48
3560  087e               L7341:
3561  087e 1f05          	ldw	(OFST-1,sp),x
3562                     ; 730 		wData |= (wIndex<<(j*4));
3564  0880 7b04          	ld	a,(OFST-2,sp)
3565  0882 48            	sll	a
3566  0883 48            	sll	a
3567  0884 2704          	jreq	L422
3568  0886               L622:
3569  0886 58            	sllw	x
3570  0887 4a            	dec	a
3571  0888 26fc          	jrne	L622
3572  088a               L422:
3573  088a 01            	rrwa	x,a
3574  088b 1a02          	or	a,(OFST-4,sp)
3575  088d 01            	rrwa	x,a
3576  088e 1a01          	or	a,(OFST-5,sp)
3577  0890 01            	rrwa	x,a
3578  0891 1f01          	ldw	(OFST-5,sp),x
3579                     ; 731 		pStr++;
3581  0893 1e07          	ldw	x,(OFST+1,sp)
3582  0895 5c            	incw	x
3583  0896 1f07          	ldw	(OFST+1,sp),x
3584                     ; 721 	for(j = 0; j < nLen; j++)
3586  0898 1e03          	ldw	x,(OFST-3,sp)
3587  089a 5c            	incw	x
3588  089b               L1341:
3589  089b 1f03          	ldw	(OFST-3,sp),x
3592  089d 7b0b          	ld	a,(OFST+5,sp)
3593  089f 5f            	clrw	x
3594  08a0 97            	ld	xl,a
3595  08a1 bf00          	ldw	c_x,x
3596  08a3 1e03          	ldw	x,(OFST-3,sp)
3597  08a5 b300          	cpw	x,c_x
3598  08a7 25af          	jrult	L5241
3599                     ; 733 	return wData;
3601  08a9 1e01          	ldw	x,(OFST-5,sp)
3604  08ab 5b08          	addw	sp,#8
3605  08ad 81            	ret	
3675                     	switch	.const
3676  0061               L232:
3677  0061 00008000      	dc.l	32768
3678                     ; 742 void JX_BL_Change(uint16_t nLen, uint8_t* pnBuf)
3678                     ; 743 {
3679                     	switch	.text
3680  08ae               _JX_BL_Change:
3682  08ae 89            	pushw	x
3683  08af 520f          	subw	sp,#15
3684       0000000f      OFST:	set	15
3687                     ; 744 	uint32_t   i, dwPtr = 0;
3689  08b1 5f            	clrw	x
3690  08b2 1f0e          	ldw	(OFST-1,sp),x
3691  08b4 1f0c          	ldw	(OFST-3,sp),x
3692                     ; 748 	if ((nLen >= 2) && (nLen < 32768))
3694  08b6 1e10          	ldw	x,(OFST+1,sp)
3695  08b8 a30002        	cpw	x,#2
3696  08bb 2570          	jrult	L5741
3698  08bd cd0000        	call	c_uitolx
3700  08c0 ae0061        	ldw	x,#L232
3701  08c3 cd0000        	call	c_lcmp
3703  08c6 2e65          	jrsge	L5741
3704                     ; 750 		wMiddleLen = (nLen/2) + (nLen%2);
3706  08c8 7b11          	ld	a,(OFST+2,sp)
3707  08ca a401          	and	a,#1
3708  08cc 5f            	clrw	x
3709  08cd 02            	rlwa	x,a
3710  08ce 1f03          	ldw	(OFST-12,sp),x
3711  08d0 1e10          	ldw	x,(OFST+1,sp)
3712  08d2 54            	srlw	x
3713  08d3 72fb03        	addw	x,(OFST-12,sp)
3714  08d6 1f05          	ldw	(OFST-10,sp),x
3715                     ; 751 		for (i=0; i<wMiddleLen; i++)
3717  08d8 5f            	clrw	x
3718  08d9 1f0a          	ldw	(OFST-5,sp),x
3719  08db 1f08          	ldw	(OFST-7,sp),x
3721  08dd 2036          	jra	L3051
3722  08df               L7741:
3723                     ; 753 			nTemp = pnBuf[dwPtr];
3725  08df 1e14          	ldw	x,(OFST+5,sp)
3726  08e1 72fb0e        	addw	x,(OFST-1,sp)
3727  08e4 f6            	ld	a,(x)
3728  08e5 6b07          	ld	(OFST-8,sp),a
3729                     ; 754 			pnBuf[dwPtr] = pnBuf[nLen-dwPtr-1];
3731  08e7 1e10          	ldw	x,(OFST+1,sp)
3732  08e9 72f00e        	subw	x,(OFST-1,sp)
3733  08ec 5a            	decw	x
3734  08ed 72fb14        	addw	x,(OFST+5,sp)
3735  08f0 f6            	ld	a,(x)
3736  08f1 1e14          	ldw	x,(OFST+5,sp)
3737  08f3 72fb0e        	addw	x,(OFST-1,sp)
3738  08f6 f7            	ld	(x),a
3739                     ; 755 			pnBuf[nLen-dwPtr-1] = nTemp;
3741  08f7 7b07          	ld	a,(OFST-8,sp)
3742  08f9 1e10          	ldw	x,(OFST+1,sp)
3743  08fb 72f00e        	subw	x,(OFST-1,sp)
3744  08fe 5a            	decw	x
3745  08ff 72fb14        	addw	x,(OFST+5,sp)
3746  0902 f7            	ld	(x),a
3747                     ; 757 			dwPtr++;
3749  0903 96            	ldw	x,sp
3750  0904 1c000c        	addw	x,#OFST-3
3751  0907 a601          	ld	a,#1
3752  0909 cd0000        	call	c_lgadc
3754                     ; 751 		for (i=0; i<wMiddleLen; i++)
3756  090c 96            	ldw	x,sp
3757  090d 1c0008        	addw	x,#OFST-7
3758  0910 a601          	ld	a,#1
3759  0912 cd0000        	call	c_lgadc
3761  0915               L3051:
3764  0915 1e05          	ldw	x,(OFST-10,sp)
3765  0917 cd0000        	call	c_uitolx
3767  091a 96            	ldw	x,sp
3768  091b 5c            	incw	x
3769  091c cd0000        	call	c_rtol
3771  091f 96            	ldw	x,sp
3772  0920 1c0008        	addw	x,#OFST-7
3773  0923 cd0000        	call	c_ltor
3775  0926 96            	ldw	x,sp
3776  0927 5c            	incw	x
3777  0928 cd0000        	call	c_lcmp
3779  092b 25b2          	jrult	L7741
3780  092d               L5741:
3781                     ; 760 }
3784  092d 5b11          	addw	sp,#17
3785  092f 81            	ret	
3855                     ; 767 void JX_BL_DwordChange(uint16_t nLen, uint32_t* pdwBuf)
3855                     ; 768 {
3856                     	switch	.text
3857  0930               _JX_BL_DwordChange:
3859  0930 89            	pushw	x
3860  0931 5212          	subw	sp,#18
3861       00000012      OFST:	set	18
3864                     ; 769 	uint32_t   i, dwPtr = 0;
3866  0933 5f            	clrw	x
3867  0934 1f11          	ldw	(OFST-1,sp),x
3868  0936 1f0f          	ldw	(OFST-3,sp),x
3869                     ; 773 	if ((nLen >= 2) && (nLen < 32768))
3871  0938 1e13          	ldw	x,(OFST+1,sp)
3872  093a a30002        	cpw	x,#2
3873  093d 2403cc09db    	jrult	L7351
3875  0942 cd0000        	call	c_uitolx
3877  0945 ae0061        	ldw	x,#L232
3878  0948 cd0000        	call	c_lcmp
3880  094b 2ef2          	jrsge	L7351
3881                     ; 775 		wMiddleLen = (nLen/2) + (nLen%2);
3883  094d 7b14          	ld	a,(OFST+2,sp)
3884  094f a401          	and	a,#1
3885  0951 5f            	clrw	x
3886  0952 02            	rlwa	x,a
3887  0953 1f03          	ldw	(OFST-15,sp),x
3888  0955 1e13          	ldw	x,(OFST+1,sp)
3889  0957 54            	srlw	x
3890  0958 72fb03        	addw	x,(OFST-15,sp)
3891  095b 1f05          	ldw	(OFST-13,sp),x
3892                     ; 776 		for (i=0; i<wMiddleLen; i++)
3894  095d 5f            	clrw	x
3895  095e 1f0d          	ldw	(OFST-5,sp),x
3896  0960 1f0b          	ldw	(OFST-7,sp),x
3898  0962 205f          	jra	L5451
3899  0964               L1451:
3900                     ; 778 			dwTemp = pdwBuf[dwPtr];
3902  0964 1e11          	ldw	x,(OFST-1,sp)
3903  0966 58            	sllw	x
3904  0967 58            	sllw	x
3905  0968 72fb17        	addw	x,(OFST+5,sp)
3906  096b e603          	ld	a,(3,x)
3907  096d 6b0a          	ld	(OFST-8,sp),a
3908  096f e602          	ld	a,(2,x)
3909  0971 6b09          	ld	(OFST-9,sp),a
3910  0973 e601          	ld	a,(1,x)
3911  0975 6b08          	ld	(OFST-10,sp),a
3912  0977 f6            	ld	a,(x)
3913  0978 6b07          	ld	(OFST-11,sp),a
3914                     ; 779 			pdwBuf[dwPtr] = pdwBuf[nLen-dwPtr-1];
3916  097a 1e13          	ldw	x,(OFST+1,sp)
3917  097c 72f011        	subw	x,(OFST-1,sp)
3918  097f 58            	sllw	x
3919  0980 58            	sllw	x
3920  0981 1d0004        	subw	x,#4
3921  0984 72fb17        	addw	x,(OFST+5,sp)
3922  0987 1611          	ldw	y,(OFST-1,sp)
3923  0989 9058          	sllw	y
3924  098b 9058          	sllw	y
3925  098d 72f917        	addw	y,(OFST+5,sp)
3926  0990 e603          	ld	a,(3,x)
3927  0992 90e703        	ld	(3,y),a
3928  0995 e602          	ld	a,(2,x)
3929  0997 90e702        	ld	(2,y),a
3930  099a e601          	ld	a,(1,x)
3931  099c 90e701        	ld	(1,y),a
3932  099f f6            	ld	a,(x)
3933  09a0 90f7          	ld	(y),a
3934                     ; 780 			pdwBuf[nLen-dwPtr-1] = dwTemp;
3936  09a2 7b0a          	ld	a,(OFST-8,sp)
3937  09a4 e703          	ld	(3,x),a
3938  09a6 7b09          	ld	a,(OFST-9,sp)
3939  09a8 e702          	ld	(2,x),a
3940  09aa 7b08          	ld	a,(OFST-10,sp)
3941  09ac e701          	ld	(1,x),a
3942  09ae 7b07          	ld	a,(OFST-11,sp)
3943  09b0 f7            	ld	(x),a
3944                     ; 781 			dwPtr++;
3946  09b1 96            	ldw	x,sp
3947  09b2 1c000f        	addw	x,#OFST-3
3948  09b5 a601          	ld	a,#1
3949  09b7 cd0000        	call	c_lgadc
3951                     ; 776 		for (i=0; i<wMiddleLen; i++)
3953  09ba 96            	ldw	x,sp
3954  09bb 1c000b        	addw	x,#OFST-7
3955  09be a601          	ld	a,#1
3956  09c0 cd0000        	call	c_lgadc
3958  09c3               L5451:
3961  09c3 1e05          	ldw	x,(OFST-13,sp)
3962  09c5 cd0000        	call	c_uitolx
3964  09c8 96            	ldw	x,sp
3965  09c9 5c            	incw	x
3966  09ca cd0000        	call	c_rtol
3968  09cd 96            	ldw	x,sp
3969  09ce 1c000b        	addw	x,#OFST-7
3970  09d1 cd0000        	call	c_ltor
3972  09d4 96            	ldw	x,sp
3973  09d5 5c            	incw	x
3974  09d6 cd0000        	call	c_lcmp
3976  09d9 2589          	jrult	L1451
3977  09db               L7351:
3978                     ; 784 }
3981  09db 5b14          	addw	sp,#20
3982  09dd 81            	ret	
4038                     ; 792 uint8_t  JX_AddSum8Bit(uint8_t  *nSumDat, uint16_t  wSumDatLen)
4038                     ; 793 {
4039                     	switch	.text
4040  09de               _JX_AddSum8Bit:
4042  09de 89            	pushw	x
4043  09df 5204          	subw	sp,#4
4044       00000004      OFST:	set	4
4047                     ; 794 	uint16_t  i, wData = 0;
4049  09e1 5f            	clrw	x
4050  09e2 1f01          	ldw	(OFST-3,sp),x
4051                     ; 796 	for (i=0; i<wSumDatLen; i++)
4053  09e4 2011          	jra	L1061
4054  09e6               L5751:
4055                     ; 798 		wData += nSumDat[i];
4057  09e6 1e05          	ldw	x,(OFST+1,sp)
4058  09e8 72fb03        	addw	x,(OFST-1,sp)
4059  09eb f6            	ld	a,(x)
4060  09ec 1b02          	add	a,(OFST-2,sp)
4061  09ee 6b02          	ld	(OFST-2,sp),a
4062  09f0 2402          	jrnc	L042
4063  09f2 0c01          	inc	(OFST-3,sp)
4064  09f4               L042:
4065                     ; 796 	for (i=0; i<wSumDatLen; i++)
4067  09f4 1e03          	ldw	x,(OFST-1,sp)
4068  09f6 5c            	incw	x
4069  09f7               L1061:
4071  09f7 1f03          	ldw	(OFST-1,sp),x
4074  09f9 1309          	cpw	x,(OFST+5,sp)
4075  09fb 25e9          	jrult	L5751
4076                     ; 800 	return (u8)(wData);
4078  09fd 7b02          	ld	a,(OFST-2,sp)
4081  09ff 5b06          	addw	sp,#6
4082  0a01 81            	ret	
4138                     ; 809 u8  JX_IsAllFillDat(uint8_t  *nMatchDat, uint8_t nFillDat, uint32_t  nMatchLen)
4138                     ; 810 {
4139                     	switch	.text
4140  0a02               _JX_IsAllFillDat:
4142  0a02 89            	pushw	x
4143  0a03 5204          	subw	sp,#4
4144       00000004      OFST:	set	4
4147                     ; 813 	for (i=0; i<nMatchLen; i++)
4149  0a05 5f            	clrw	x
4150  0a06 1f03          	ldw	(OFST-1,sp),x
4151  0a08 1f01          	ldw	(OFST-3,sp),x
4153  0a0a 2014          	jra	L5361
4154  0a0c               L1361:
4155                     ; 815 		if (nMatchDat[i] != nFillDat)
4157  0a0c 1e05          	ldw	x,(OFST+1,sp)
4158  0a0e 72fb03        	addw	x,(OFST-1,sp)
4159  0a11 f6            	ld	a,(x)
4160  0a12 1109          	cp	a,(OFST+5,sp)
4161  0a14 2703          	jreq	L1461
4162                     ; 817 			return (FALSE);
4164  0a16 4f            	clr	a
4166  0a17 2017          	jra	L442
4167  0a19               L1461:
4168                     ; 813 	for (i=0; i<nMatchLen; i++)
4170  0a19 96            	ldw	x,sp
4171  0a1a 5c            	incw	x
4172  0a1b a601          	ld	a,#1
4173  0a1d cd0000        	call	c_lgadc
4175  0a20               L5361:
4178  0a20 96            	ldw	x,sp
4179  0a21 5c            	incw	x
4180  0a22 cd0000        	call	c_ltor
4182  0a25 96            	ldw	x,sp
4183  0a26 1c000a        	addw	x,#OFST+6
4184  0a29 cd0000        	call	c_lcmp
4186  0a2c 25de          	jrult	L1361
4187                     ; 820 	return (TRUE);
4189  0a2e a601          	ld	a,#1
4191  0a30               L442:
4193  0a30 5b06          	addw	sp,#6
4194  0a32 81            	ret	
4197                     	switch	.const
4198  0065               L3461_nBuf:
4199  0065 00            	dc.b	0
4200  0066 000000        	ds.b	3
4276                     ; 829 u8  JX_IpAddrToStr(uint8_t *pnIPStr, uint8_t pnIPAddr[4])
4276                     ; 830 {
4277                     	switch	.text
4278  0a33               _JX_IpAddrToStr:
4280  0a33 89            	pushw	x
4281  0a34 5207          	subw	sp,#7
4282       00000007      OFST:	set	7
4285                     ; 831 	u8 i = 0, nStrLen = 0, nOffset = 0;
4291  0a36 0f06          	clr	(OFST-1,sp)
4292                     ; 832 	u8 nBuf[4] = {0};
4294  0a38 96            	ldw	x,sp
4295  0a39 5c            	incw	x
4296  0a3a 90ae0065      	ldw	y,#L3461_nBuf
4297  0a3e a604          	ld	a,#4
4298  0a40 cd0000        	call	c_xymvx
4300                     ; 834 	if ((pnIPStr == NULL) || (pnIPAddr == NULL))
4302  0a43 1e08          	ldw	x,(OFST+1,sp)
4303  0a45 2704          	jreq	L3071
4305  0a47 1e0c          	ldw	x,(OFST+5,sp)
4306  0a49 2603          	jrne	L1071
4307  0a4b               L3071:
4308                     ; 836 		return (FALSE);
4310  0a4b 4f            	clr	a
4312  0a4c 2057          	jra	L262
4313  0a4e               L1071:
4314                     ; 839 	pnIPStr[31] = 0;
4316  0a4e 1e08          	ldw	x,(OFST+1,sp)
4317  0a50 6f1f          	clr	(31,x)
4318                     ; 840 	for (i=0; i<4; i++)
4320  0a52 0f07          	clr	(OFST+0,sp)
4321  0a54               L5071:
4322                     ; 842 		nStrLen = JX_ByteToBcdStr(pnIPAddr[i], nBuf);
4324  0a54 96            	ldw	x,sp
4325  0a55 5c            	incw	x
4326  0a56 89            	pushw	x
4327  0a57 7b0e          	ld	a,(OFST+7,sp)
4328  0a59 97            	ld	xl,a
4329  0a5a 7b0f          	ld	a,(OFST+8,sp)
4330  0a5c 1b09          	add	a,(OFST+2,sp)
4331  0a5e 2401          	jrnc	L252
4332  0a60 5c            	incw	x
4333  0a61               L252:
4334  0a61 02            	rlwa	x,a
4335  0a62 f6            	ld	a,(x)
4336  0a63 cd06de        	call	_JX_ByteToBcdStr
4338  0a66 85            	popw	x
4339  0a67 6b05          	ld	(OFST-2,sp),a
4340                     ; 843 		MemcpyFunc(&pnIPStr[nOffset], nBuf, nStrLen);
4342  0a69 88            	push	a
4343  0a6a 96            	ldw	x,sp
4344  0a6b 1c0002        	addw	x,#OFST-5
4345  0a6e 89            	pushw	x
4346  0a6f 7b0b          	ld	a,(OFST+4,sp)
4347  0a71 97            	ld	xl,a
4348  0a72 7b0c          	ld	a,(OFST+5,sp)
4349  0a74 1b09          	add	a,(OFST+2,sp)
4350  0a76 2401          	jrnc	L652
4351  0a78 5c            	incw	x
4352  0a79               L652:
4353  0a79 02            	rlwa	x,a
4354  0a7a cd0000        	call	_MemcpyFunc
4356  0a7d 5b03          	addw	sp,#3
4357                     ; 844 		nOffset +=nStrLen;
4359  0a7f 7b06          	ld	a,(OFST-1,sp)
4360  0a81 1b05          	add	a,(OFST-2,sp)
4361  0a83 6b06          	ld	(OFST-1,sp),a
4362                     ; 845 		if(i < 3)
4364  0a85 7b07          	ld	a,(OFST+0,sp)
4365  0a87 a103          	cp	a,#3
4366  0a89 2410          	jruge	L3171
4367                     ; 847 			pnIPStr[nOffset] = '.';
4369  0a8b 7b08          	ld	a,(OFST+1,sp)
4370  0a8d 97            	ld	xl,a
4371  0a8e 7b09          	ld	a,(OFST+2,sp)
4372  0a90 1b06          	add	a,(OFST-1,sp)
4373  0a92 2401          	jrnc	L062
4374  0a94 5c            	incw	x
4375  0a95               L062:
4376  0a95 02            	rlwa	x,a
4377  0a96 a62e          	ld	a,#46
4378  0a98 f7            	ld	(x),a
4379                     ; 848 			nOffset++;
4381  0a99 0c06          	inc	(OFST-1,sp)
4382  0a9b               L3171:
4383                     ; 840 	for (i=0; i<4; i++)
4385  0a9b 0c07          	inc	(OFST+0,sp)
4388  0a9d 7b07          	ld	a,(OFST+0,sp)
4389  0a9f a104          	cp	a,#4
4390  0aa1 25b1          	jrult	L5071
4391                     ; 852 	return (TRUE);
4393  0aa3 a601          	ld	a,#1
4395  0aa5               L262:
4397  0aa5 5b09          	addw	sp,#9
4398  0aa7 81            	ret	
4430                     ; 855 uint8_t  JX_BcdToByte(uint8_t  bcd) 
4430                     ; 856 {
4431                     	switch	.text
4432  0aa8               _JX_BcdToByte:
4434  0aa8 88            	push	a
4435  0aa9 88            	push	a
4436       00000001      OFST:	set	1
4439                     ; 857 	return (((bcd >> 4) & 0x0F) * 10 + (bcd & 0x0F));
4441  0aaa a40f          	and	a,#15
4442  0aac 6b01          	ld	(OFST+0,sp),a
4443  0aae 7b02          	ld	a,(OFST+1,sp)
4444  0ab0 4e            	swap	a
4445  0ab1 a40f          	and	a,#15
4446  0ab3 97            	ld	xl,a
4447  0ab4 a60a          	ld	a,#10
4448  0ab6 42            	mul	x,a
4449  0ab7 9f            	ld	a,xl
4450  0ab8 1b01          	add	a,(OFST+0,sp)
4453  0aba 85            	popw	x
4454  0abb 81            	ret	
4486                     ; 859 uint8_t  JX_ByteToBcd(uint8_t  b)
4486                     ; 860 {
4487                     	switch	.text
4488  0abc               _JX_ByteToBcd:
4490  0abc 88            	push	a
4491  0abd 88            	push	a
4492       00000001      OFST:	set	1
4495                     ; 861 	return ((b/10<<4) + b%10);
4497  0abe ad10          	call	LC008
4498  0ac0 909f          	ld	a,yl
4499  0ac2 6b01          	ld	(OFST+0,sp),a
4500  0ac4 7b02          	ld	a,(OFST+1,sp)
4501  0ac6 ad08          	call	LC008
4502  0ac8 a610          	ld	a,#16
4503  0aca 42            	mul	x,a
4504  0acb 9f            	ld	a,xl
4505  0acc 1b01          	add	a,(OFST+0,sp)
4508  0ace 85            	popw	x
4509  0acf 81            	ret	
4511  0ad0               LC008:
4512  0ad0 ae000a        	ldw	x,#10
4513  0ad3 9093          	ldw	y,x
4514  0ad5 5f            	clrw	x
4515  0ad6 97            	ld	xl,a
4516  0ad7 65            	divw	x,y
4517  0ad8 81            	ret	
4583                     ; 872 u32 JX_DwordBcdToBin(u32 dwBcd)  
4583                     ; 873 {  
4584                     	switch	.text
4585  0ad9               _JX_DwordBcdToBin:
4587  0ad9 520e          	subw	sp,#14
4588       0000000e      OFST:	set	14
4591                     ; 874 	u32 dwBin = 0, dwRate = 1, dwBit = 0;  
4593  0adb 5f            	clrw	x
4594  0adc 1f03          	ldw	(OFST-11,sp),x
4595  0ade 1f01          	ldw	(OFST-13,sp),x
4598  0ae0 96            	ldw	x,sp
4599  0ae1 1c0009        	addw	x,#OFST-5
4600  0ae4 cd0000        	call	c_ltor
4604  0ae7 96            	ldw	x,sp
4605  0ae8 1c0005        	addw	x,#OFST-9
4606  0aeb cd0000        	call	c_ltor
4608                     ; 875 	u8   i = 0, j = 0;  
4612                     ; 877 	for(i = 0; i < 8; i++) 
4614  0aee 0f0e          	clr	(OFST+0,sp)
4615  0af0               L3771:
4616                     ; 879 		dwRate = 1;
4618  0af0 ae0001        	ldw	x,#1
4619  0af3 1f0b          	ldw	(OFST-3,sp),x
4620  0af5 5f            	clrw	x
4621  0af6 1f09          	ldw	(OFST-5,sp),x
4622                     ; 880 		for(j = 1; j <= i; j++) 
4624  0af8 a601          	ld	a,#1
4625  0afa 6b0d          	ld	(OFST-1,sp),a
4627  0afc 2013          	jra	L5002
4628  0afe               L1002:
4629                     ; 882 			dwRate *=10;
4631  0afe ae000a        	ldw	x,#10
4632  0b01 bf02          	ldw	c_lreg+2,x
4633  0b03 5f            	clrw	x
4634  0b04 bf00          	ldw	c_lreg,x
4635  0b06 96            	ldw	x,sp
4636  0b07 1c0009        	addw	x,#OFST-5
4637  0b0a cd0000        	call	c_lgmul
4639                     ; 880 		for(j = 1; j <= i; j++) 
4641  0b0d 0c0d          	inc	(OFST-1,sp)
4642  0b0f 7b0d          	ld	a,(OFST-1,sp)
4643  0b11               L5002:
4646  0b11 110e          	cp	a,(OFST+0,sp)
4647  0b13 23e9          	jrule	L1002
4648                     ; 885 		dwBit = ((dwBcd >> (4*i))&0x0F);
4650  0b15 96            	ldw	x,sp
4651  0b16 1c0011        	addw	x,#OFST+3
4652  0b19 cd0000        	call	c_ltor
4654  0b1c 7b0e          	ld	a,(OFST+0,sp)
4655  0b1e 48            	sll	a
4656  0b1f 48            	sll	a
4657  0b20 cd0000        	call	c_lursh
4659  0b23 b603          	ld	a,c_lreg+3
4660  0b25 a40f          	and	a,#15
4661  0b27 b703          	ld	c_lreg+3,a
4662  0b29 3f02          	clr	c_lreg+2
4663  0b2b 3f01          	clr	c_lreg+1
4664  0b2d 3f00          	clr	c_lreg
4665  0b2f 96            	ldw	x,sp
4666  0b30 1c0005        	addw	x,#OFST-9
4667  0b33 cd0000        	call	c_rtol
4669                     ; 886 		if(dwBit)
4671  0b36 96            	ldw	x,sp
4672  0b37 1c0005        	addw	x,#OFST-9
4673  0b3a cd0000        	call	c_lzmp
4675  0b3d 2713          	jreq	L1102
4676                     ; 888 			dwBin += (dwRate*dwBit);
4678  0b3f 96            	ldw	x,sp
4679  0b40 1c0009        	addw	x,#OFST-5
4680  0b43 cd0000        	call	c_ltor
4682  0b46 96            	ldw	x,sp
4683  0b47 1c0005        	addw	x,#OFST-9
4684  0b4a cd0000        	call	c_lmul
4686  0b4d 96            	ldw	x,sp
4687  0b4e 5c            	incw	x
4688  0b4f cd0000        	call	c_lgadd
4690  0b52               L1102:
4691                     ; 877 	for(i = 0; i < 8; i++) 
4693  0b52 0c0e          	inc	(OFST+0,sp)
4696  0b54 7b0e          	ld	a,(OFST+0,sp)
4697  0b56 a108          	cp	a,#8
4698  0b58 2596          	jrult	L3771
4699                     ; 891 	return dwBin;
4701  0b5a 96            	ldw	x,sp
4702  0b5b 5c            	incw	x
4703  0b5c cd0000        	call	c_ltor
4707  0b5f 5b0e          	addw	sp,#14
4708  0b61 81            	ret	
4785                     	switch	.const
4786  0069               L003:
4787  0069 0000000a      	dc.l	10
4788                     ; 902 void  JX_DWORDToBCD(uint32_t val, uint8_t* bcd, uint8_t len)
4788                     ; 903 {
4789                     	switch	.text
4790  0b62               _JX_DWORDToBCD:
4792  0b62 520e          	subw	sp,#14
4793       0000000e      OFST:	set	14
4796                     ; 904 	uint32_t  power = 1, i;
4798  0b64 ae0001        	ldw	x,#1
4799  0b67 1f0d          	ldw	(OFST-1,sp),x
4800  0b69 5f            	clrw	x
4801  0b6a 1f0b          	ldw	(OFST-3,sp),x
4802                     ; 907 	len = (len > 4) ? 4:len;
4804  0b6c 7b17          	ld	a,(OFST+9,sp)
4805  0b6e a105          	cp	a,#5
4806  0b70 2502          	jrult	L472
4807  0b72 a604          	ld	a,#4
4808  0b74               L472:
4809  0b74 6b17          	ld	(OFST+9,sp),a
4810                     ; 908 	for (i=0; i<len; i++)
4812  0b76 1f09          	ldw	(OFST-5,sp),x
4813  0b78 1f07          	ldw	(OFST-7,sp),x
4815  0b7a 2018          	jra	L1502
4816  0b7c               L5402:
4817                     ; 910 		power *= 100; 
4819  0b7c ae0064        	ldw	x,#100
4820  0b7f bf02          	ldw	c_lreg+2,x
4821  0b81 5f            	clrw	x
4822  0b82 bf00          	ldw	c_lreg,x
4823  0b84 96            	ldw	x,sp
4824  0b85 1c000b        	addw	x,#OFST-3
4825  0b88 cd0000        	call	c_lgmul
4827                     ; 908 	for (i=0; i<len; i++)
4829  0b8b 96            	ldw	x,sp
4830  0b8c 1c0007        	addw	x,#OFST-7
4831  0b8f a601          	ld	a,#1
4832  0b91 cd0000        	call	c_lgadc
4834  0b94               L1502:
4837  0b94 7b17          	ld	a,(OFST+9,sp)
4838  0b96 b703          	ld	c_lreg+3,a
4839  0b98 3f02          	clr	c_lreg+2
4840  0b9a 3f01          	clr	c_lreg+1
4841  0b9c 3f00          	clr	c_lreg
4842  0b9e 96            	ldw	x,sp
4843  0b9f 5c            	incw	x
4844  0ba0 cd0000        	call	c_rtol
4846  0ba3 96            	ldw	x,sp
4847  0ba4 1c0007        	addw	x,#OFST-7
4848  0ba7 cd0000        	call	c_ltor
4850  0baa 96            	ldw	x,sp
4851  0bab 5c            	incw	x
4852  0bac cd0000        	call	c_lcmp
4854  0baf 25cb          	jrult	L5402
4856  0bb1 2068          	jra	L1602
4857  0bb3               L5502:
4858                     ; 914 	    val %= power;
4860  0bb3 96            	ldw	x,sp
4861  0bb4 1c0011        	addw	x,#OFST+3
4862  0bb7 cd0000        	call	c_ltor
4864  0bba 96            	ldw	x,sp
4865  0bbb 1c000b        	addw	x,#OFST-3
4866  0bbe cd0000        	call	c_lumd
4868  0bc1 96            	ldw	x,sp
4869  0bc2 1c0011        	addw	x,#OFST+3
4870  0bc5 cd0000        	call	c_rtol
4872                     ; 915 	    power /= 10;
4874  0bc8 96            	ldw	x,sp
4875  0bc9 ad57          	call	LC009
4877  0bcb 96            	ldw	x,sp
4878  0bcc 1c000b        	addw	x,#OFST-3
4879  0bcf cd0000        	call	c_rtol
4881                     ; 916 		bHigh = (uint8_t )(val / power);
4883  0bd2 96            	ldw	x,sp
4884  0bd3 1c0011        	addw	x,#OFST+3
4885  0bd6 cd0000        	call	c_ltor
4887  0bd9 96            	ldw	x,sp
4888  0bda ad52          	call	LC010
4889  0bdc 6b05          	ld	(OFST-9,sp),a
4890                     ; 918 	    val %= power;
4892  0bde 96            	ldw	x,sp
4893  0bdf 1c0011        	addw	x,#OFST+3
4894  0be2 cd0000        	call	c_ltor
4896  0be5 96            	ldw	x,sp
4897  0be6 1c000b        	addw	x,#OFST-3
4898  0be9 cd0000        	call	c_lumd
4900  0bec 96            	ldw	x,sp
4901  0bed 1c0011        	addw	x,#OFST+3
4902  0bf0 cd0000        	call	c_rtol
4904                     ; 919 	    power /= 10;
4906  0bf3 96            	ldw	x,sp
4907  0bf4 ad2c          	call	LC009
4909  0bf6 96            	ldw	x,sp
4910  0bf7 1c000b        	addw	x,#OFST-3
4911  0bfa cd0000        	call	c_rtol
4913                     ; 920 		bLow = (uint8_t )(val / power);
4915  0bfd 96            	ldw	x,sp
4916  0bfe 1c0011        	addw	x,#OFST+3
4917  0c01 cd0000        	call	c_ltor
4919  0c04 96            	ldw	x,sp
4920  0c05 ad27          	call	LC010
4921  0c07 6b06          	ld	(OFST-8,sp),a
4922                     ; 921 		bcd[len - 1] = (bHigh << 4) | bLow;
4924  0c09 7b17          	ld	a,(OFST+9,sp)
4925  0c0b 5f            	clrw	x
4926  0c0c 97            	ld	xl,a
4927  0c0d 5a            	decw	x
4928  0c0e 72fb15        	addw	x,(OFST+7,sp)
4929  0c11 7b05          	ld	a,(OFST-9,sp)
4930  0c13 4e            	swap	a
4931  0c14 a4f0          	and	a,#240
4932  0c16 1a06          	or	a,(OFST-8,sp)
4933  0c18 f7            	ld	(x),a
4934                     ; 912 	for (; len>0; len--)
4936  0c19 0a17          	dec	(OFST+9,sp)
4937  0c1b               L1602:
4940  0c1b 7b17          	ld	a,(OFST+9,sp)
4941  0c1d 2694          	jrne	L5502
4942                     ; 923 }
4945  0c1f 5b0e          	addw	sp,#14
4946  0c21 81            	ret	
4948  0c22               LC009:
4949  0c22 1c000b        	addw	x,#OFST-3
4950  0c25 cd0000        	call	c_ltor
4952  0c28 ae0069        	ldw	x,#L003
4953  0c2b cc0000        	jp	c_ludv
4954  0c2e               LC010:
4955  0c2e 1c000b        	addw	x,#OFST-3
4956  0c31 cd0000        	call	c_ludv
4958  0c34 b603          	ld	a,c_lreg+3
4959  0c36 81            	ret	
4961                     	switch	.const
4962  006d               L5602_base_tab:
4963  006d 3b9aca00      	dc.l	1000000000
4964  0071 05f5e100      	dc.l	100000000
4965  0075 00989680      	dc.l	10000000
4966  0079 000f4240      	dc.l	1000000
4967  007d 000186a0      	dc.l	100000
4968  0081 00002710      	dc.l	10000
4969  0085 000003e8      	dc.l	1000
4970  0089 00000064      	dc.l	100
4971  008d 0000000a      	dc.l	10
4972  0091 00000001      	dc.l	1
4973  0095 00000000      	dc.l	0
5065                     ; 934 void JX_U32ToStr(u32 value, char * p_str)  
5065                     ; 935 {  
5066                     	switch	.text
5067  0c37               _JX_U32ToStr:
5069  0c37 5234          	subw	sp,#52
5070       00000034      OFST:	set	52
5073                     ; 936 	const u32 base_tab[11]={1000000000,100000000,10000000,1000000,100000,10000,1000,100,10,1,0};  
5075  0c39 96            	ldw	x,sp
5076  0c3a 1c0007        	addw	x,#OFST-45
5077  0c3d 90ae006d      	ldw	y,#L5602_base_tab
5078  0c41 a62c          	ld	a,#44
5079  0c43 cd0000        	call	c_xymvx
5081                     ; 937 	u8 count = 0,index = 0, base_index = 0;  
5083  0c46 0f03          	clr	(OFST-49,sp)
5086  0c48 0f33          	clr	(OFST-1,sp)
5089  0c4a 0f34          	clr	(OFST+0,sp)
5090                     ; 938 	u8 flag = 0;  
5092  0c4c 0f06          	clr	(OFST-46,sp)
5093                     ; 939 	char i= 0 ,j = 0;  
5095  0c4e 0f04          	clr	(OFST-48,sp)
5098  0c50 0f05          	clr	(OFST-47,sp)
5100  0c52 cc0ce7        	jra	L3312
5101  0c55               L7212:
5102                     ; 943 		if(value>=base_tab[base_index])  
5104  0c55 96            	ldw	x,sp
5105  0c56 1c0007        	addw	x,#OFST-45
5106  0c59 1f01          	ldw	(OFST-51,sp),x
5107  0c5b 7b34          	ld	a,(OFST+0,sp)
5108  0c5d cd0d19        	call	LC011
5109  0c60 72fb01        	addw	x,(OFST-51,sp)
5110  0c63 cd0000        	call	c_ltor
5112  0c66 96            	ldw	x,sp
5113  0c67 1c0037        	addw	x,#OFST+3
5114  0c6a cd0000        	call	c_lcmp
5116  0c6d 2266          	jrugt	L7312
5117                     ; 945 		    p_str[index]=(unsigned char)(value/base_tab[base_index]);  
5119  0c6f 7b3b          	ld	a,(OFST+7,sp)
5120  0c71 97            	ld	xl,a
5121  0c72 7b3c          	ld	a,(OFST+8,sp)
5122  0c74 1b33          	add	a,(OFST-1,sp)
5123  0c76 2401          	jrnc	L403
5124  0c78 5c            	incw	x
5125  0c79               L403:
5126  0c79 02            	rlwa	x,a
5127  0c7a 89            	pushw	x
5128  0c7b 96            	ldw	x,sp
5129  0c7c 1c0039        	addw	x,#OFST+5
5130  0c7f cd0000        	call	c_ltor
5132  0c82 96            	ldw	x,sp
5133  0c83 1c0009        	addw	x,#OFST-43
5134  0c86 1f03          	ldw	(OFST-49,sp),x
5135  0c88 7b36          	ld	a,(OFST+2,sp)
5136  0c8a cd0d19        	call	LC011
5137  0c8d 72fb03        	addw	x,(OFST-49,sp)
5138  0c90 cd0000        	call	c_ludv
5140  0c93 b603          	ld	a,c_lreg+3
5141  0c95 85            	popw	x
5142  0c96 f7            	ld	(x),a
5143                     ; 946 		    value-=p_str[index]*base_tab[base_index];  
5145  0c97 7b3b          	ld	a,(OFST+7,sp)
5146  0c99 97            	ld	xl,a
5147  0c9a 7b3c          	ld	a,(OFST+8,sp)
5148  0c9c 1b33          	add	a,(OFST-1,sp)
5149  0c9e 2401          	jrnc	L603
5150  0ca0 5c            	incw	x
5151  0ca1               L603:
5152  0ca1 02            	rlwa	x,a
5153  0ca2 f6            	ld	a,(x)
5154  0ca3 b703          	ld	c_lreg+3,a
5155  0ca5 3f02          	clr	c_lreg+2
5156  0ca7 3f01          	clr	c_lreg+1
5157  0ca9 3f00          	clr	c_lreg
5158  0cab 96            	ldw	x,sp
5159  0cac 1c0007        	addw	x,#OFST-45
5160  0caf 1f01          	ldw	(OFST-51,sp),x
5161  0cb1 7b34          	ld	a,(OFST+0,sp)
5162  0cb3 ad64          	call	LC011
5163  0cb5 72fb01        	addw	x,(OFST-51,sp)
5164  0cb8 cd0000        	call	c_lmul
5166  0cbb 96            	ldw	x,sp
5167  0cbc 1c0037        	addw	x,#OFST+3
5168  0cbf cd0000        	call	c_lgsub
5170                     ; 947 		    p_str[index++]+='0';  
5172  0cc2 7b33          	ld	a,(OFST-1,sp)
5173  0cc4 0c33          	inc	(OFST-1,sp)
5174  0cc6 5f            	clrw	x
5175  0cc7 97            	ld	xl,a
5176  0cc8 72fb3b        	addw	x,(OFST+7,sp)
5177  0ccb f6            	ld	a,(x)
5178  0ccc ab30          	add	a,#48
5179  0cce f7            	ld	(x),a
5180                     ; 948 		    flag=1;  
5182  0ccf a601          	ld	a,#1
5183  0cd1 6b06          	ld	(OFST-46,sp),a
5185  0cd3 2010          	jra	L1412
5186  0cd5               L7312:
5187                     ; 950 		else if(flag)  
5189  0cd5 7b06          	ld	a,(OFST-46,sp)
5190  0cd7 270c          	jreq	L1412
5191                     ; 952 		    p_str[index++]='0';  
5193  0cd9 7b33          	ld	a,(OFST-1,sp)
5194  0cdb 0c33          	inc	(OFST-1,sp)
5195  0cdd 5f            	clrw	x
5196  0cde 97            	ld	xl,a
5197  0cdf 72fb3b        	addw	x,(OFST+7,sp)
5198  0ce2 a630          	ld	a,#48
5199  0ce4 f7            	ld	(x),a
5200  0ce5               L1412:
5201                     ; 954 		base_index++;  
5203  0ce5 0c34          	inc	(OFST+0,sp)
5204  0ce7               L3312:
5205                     ; 941 	while(base_tab[base_index])  
5207  0ce7 96            	ldw	x,sp
5208  0ce8 1c0007        	addw	x,#OFST-45
5209  0ceb 1f01          	ldw	(OFST-51,sp),x
5210  0ced 7b34          	ld	a,(OFST+0,sp)
5211  0cef ad28          	call	LC011
5212  0cf1 72fb01        	addw	x,(OFST-51,sp)
5213  0cf4 cd0000        	call	c_lzmp
5215  0cf7 2703cc0c55    	jrne	L7212
5216                     ; 956 	p_str[index]=0;  
5218  0cfc 7b3b          	ld	a,(OFST+7,sp)
5219  0cfe 97            	ld	xl,a
5220  0cff 7b3c          	ld	a,(OFST+8,sp)
5221  0d01 1b33          	add	a,(OFST-1,sp)
5222  0d03 2401          	jrnc	L013
5223  0d05 5c            	incw	x
5224  0d06               L013:
5225  0d06 02            	rlwa	x,a
5226  0d07 7f            	clr	(x)
5227                     ; 957 	if(index==0)  
5229  0d08 7b33          	ld	a,(OFST-1,sp)
5230  0d0a 260a          	jrne	L5412
5231                     ; 959 		p_str[0]='0';  
5233  0d0c 1e3b          	ldw	x,(OFST+7,sp)
5234  0d0e a630          	ld	a,#48
5235  0d10 f7            	ld	(x),a
5236                     ; 960 		p_str[1]=0;  
5238  0d11 6f01          	clr	(1,x)
5239                     ; 961 		index=1;  
5241  0d13 7b33          	ld	a,(OFST-1,sp)
5242  0d15 97            	ld	xl,a
5243  0d16               L5412:
5244                     ; 963 }  
5247  0d16 5b34          	addw	sp,#52
5248  0d18 81            	ret	
5250  0d19               LC011:
5251  0d19 97            	ld	xl,a
5252  0d1a a604          	ld	a,#4
5253  0d1c 42            	mul	x,a
5254  0d1d 81            	ret	
5312                     ; 970 uint32_t  JX_BcdToDWORD(uint8_t  *p, uint8_t  len)
5312                     ; 971 {
5313                     	switch	.text
5314  0d1e               _JX_BcdToDWORD:
5316  0d1e 89            	pushw	x
5317  0d1f 520a          	subw	sp,#10
5318       0000000a      OFST:	set	10
5321                     ; 972 	uint32_t  val = 0;
5323  0d21 5f            	clrw	x
5324  0d22 1f09          	ldw	(OFST-1,sp),x
5325  0d24 1f07          	ldw	(OFST-3,sp),x
5326                     ; 973 	uint8_t   *p0 = p;
5328  0d26 1e0b          	ldw	x,(OFST+1,sp)
5329  0d28 1f05          	ldw	(OFST-5,sp),x
5330                     ; 975 	len = (len > 4) ? 4:len;
5332  0d2a 7b0f          	ld	a,(OFST+5,sp)
5333  0d2c a105          	cp	a,#5
5334  0d2e 2502          	jrult	L413
5335  0d30 a604          	ld	a,#4
5336  0d32               L413:
5337  0d32 6b0f          	ld	(OFST+5,sp),a
5338                     ; 976 	p += (len - 1);
5340  0d34 5f            	clrw	x
5341  0d35 97            	ld	xl,a
5342  0d36 5a            	decw	x
5343  0d37 72fb0b        	addw	x,(OFST+1,sp)
5345  0d3a 2033          	jra	L1022
5346  0d3c               L5712:
5347                     ; 979 		val = val * 100 + ((*p >> 4) & 0x0f) * 10 + (*p & 0x0f);
5349  0d3c f6            	ld	a,(x)
5350  0d3d 4e            	swap	a
5351  0d3e a40f          	and	a,#15
5352  0d40 97            	ld	xl,a
5353  0d41 a60a          	ld	a,#10
5354  0d43 42            	mul	x,a
5355  0d44 cd0000        	call	c_itolx
5357  0d47 96            	ldw	x,sp
5358  0d48 5c            	incw	x
5359  0d49 cd0000        	call	c_rtol
5361  0d4c 96            	ldw	x,sp
5362  0d4d 1c0007        	addw	x,#OFST-3
5363  0d50 cd0000        	call	c_ltor
5365  0d53 a664          	ld	a,#100
5366  0d55 cd0000        	call	c_smul
5368  0d58 96            	ldw	x,sp
5369  0d59 5c            	incw	x
5370  0d5a cd0000        	call	c_ladd
5372  0d5d 1e0b          	ldw	x,(OFST+1,sp)
5373  0d5f f6            	ld	a,(x)
5374  0d60 a40f          	and	a,#15
5375  0d62 cd0000        	call	c_ladc
5377  0d65 96            	ldw	x,sp
5378  0d66 1c0007        	addw	x,#OFST-3
5379  0d69 cd0000        	call	c_rtol
5381                     ; 977 	for (; p>=p0; p--)
5383  0d6c 1e0b          	ldw	x,(OFST+1,sp)
5384  0d6e 5a            	decw	x
5385  0d6f               L1022:
5386  0d6f 1f0b          	ldw	(OFST+1,sp),x
5389  0d71 1305          	cpw	x,(OFST-5,sp)
5390  0d73 24c7          	jruge	L5712
5391                     ; 982 	return val;
5393  0d75 96            	ldw	x,sp
5394  0d76 1c0007        	addw	x,#OFST-3
5395  0d79 cd0000        	call	c_ltor
5399  0d7c 5b0c          	addw	sp,#12
5400  0d7e 81            	ret	
5446                     ; 994 u32 JX_FloatToBin(float dwInDat)  
5446                     ; 995 {  
5447                     	switch	.text
5448  0d7f               _JX_FloatToBin:
5450  0d7f 5204          	subw	sp,#4
5451       00000004      OFST:	set	4
5454                     ; 996 	u32 dwTmpDat = 0; 
5456  0d81 96            	ldw	x,sp
5457  0d82 5c            	incw	x
5458  0d83 cd0000        	call	c_ltor
5460                     ; 997 	float dwTmp = 0.0;
5462  0d86 96            	ldw	x,sp
5463  0d87 5c            	incw	x
5464  0d88 cd0000        	call	c_ltor
5466  0d8b ae009d        	ldw	x,#L1322
5467  0d8e cd0000        	call	c_ltor
5469                     ; 999 	dwTmp = dwInDat;
5471  0d91 1e09          	ldw	x,(OFST+5,sp)
5472  0d93 1f03          	ldw	(OFST-1,sp),x
5473  0d95 1e07          	ldw	x,(OFST+3,sp)
5474  0d97 1f01          	ldw	(OFST-3,sp),x
5475                     ; 1000 	dwTmp=dwTmp*1000;
5477  0d99 ae0099        	ldw	x,#L1422
5478  0d9c cd0000        	call	c_ltor
5480  0d9f 96            	ldw	x,sp
5481  0da0 5c            	incw	x
5482  0da1 cd0000        	call	c_fgmul
5484                     ; 1001 	dwTmpDat = (u32)dwTmp;
5486  0da4 96            	ldw	x,sp
5487  0da5 5c            	incw	x
5488  0da6 cd0000        	call	c_ltor
5490  0da9 cd0000        	call	c_ftol
5492  0dac 96            	ldw	x,sp
5493  0dad 5c            	incw	x
5494  0dae cd0000        	call	c_rtol
5496                     ; 1002 	return dwTmpDat;
5498  0db1 96            	ldw	x,sp
5499  0db2 5c            	incw	x
5500  0db3 cd0000        	call	c_ltor
5504  0db6 5b04          	addw	sp,#4
5505  0db8 81            	ret	
5531                     	xdef	_TM_SecondsToTime
5532                     	xdef	_JX_FloatToBin
5533                     	xdef	_JX_BcdToDWORD
5534                     	xdef	_JX_DWORDToBCD
5535                     	xdef	_JX_AsciiToBuf
5536                     	xdef	_JX_DwordBcdToBin
5537                     	xdef	_JX_BcdStrTo16BitBcd
5538                     	xdef	_JX_BcdStrTo16BitBin
5539                     	xdef	_JX_HexToASCII
5540                     	xdef	_JX_U32ToStr
5541                     	xdef	_JX_ByteToBcd
5542                     	xdef	_JX_BcdToByte
5543                     	xdef	_JX_IpAddrToStr
5544                     	xdef	_TM_CalPastedSeconds
5545                     	xdef	_TM_RTimeDecnMinute
5546                     	xdef	_TM_RTimeAddnMinute
5547                     	xdef	_TM_RTimeAddnDay
5548                     	xdef	_TM_DiffSecond
5549                     	xdef	_TM_IsValidDate
5550                     	xdef	_TM_CalPastedDays
5551                     	xdef	_TM_TimeChangeBToA
5552                     	xdef	_TM_TimeChangeAToB
5553                     	xdef	_TM_IsValidTimePro
5554                     	xdef	_TM_DayOfWeek
5555                     	xdef	_JX_IsAllFillDat
5556                     	xdef	_JX_AddSum8Bit
5557                     	xdef	_JX_ByteToBcdStr
5558                     	xdef	_JX_BcdStrToByte
5559                     	xdef	_JX_BL_DwordChange
5560                     	xdef	_JX_BL_Change
5561                     	xdef	_MemcpyFunc
5562                     	xdef	_MemsetFunc
5563                     	xdef	_delay_us
5564                     	xdef	_delay_ms
5565                     	switch	.const
5566  0099               L1422:
5567  0099 447a0000      	dc.w	17530,0
5568  009d               L1322:
5569  009d 00000000      	dc.w	0,0
5570                     	xref.b	c_lreg
5571                     	xref.b	c_x
5591                     	xref	c_ftol
5592                     	xref	c_fgmul
5593                     	xref	c_lursh
5594                     	xref	c_lgmul
5595                     	xref	c_imul
5596                     	xref	c_sdivx
5597                     	xref	c_smul
5598                     	xref	c_ludv
5599                     	xref	c_lzmp
5600                     	xref	c_lgsub
5601                     	xref	c_lcmp
5602                     	xref	c_lrzmp
5603                     	xref	c_lmod
5604                     	xref	c_smodx
5605                     	xref	c_lumd
5606                     	xref	c_lsub
5607                     	xref	c_ladc
5608                     	xref	c_ladd
5609                     	xref	c_cmulx
5610                     	xref	c_umul
5611                     	xref	c_rtol
5612                     	xref	c_lmul
5613                     	xref	c_ltor
5614                     	xref	c_itolx
5615                     	xref	c_lgadc
5616                     	xref	c_lgadd
5617                     	xref	c_uitolx
5618                     	xref	c_xymvx
5619                     	end
