   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     .const:	section	.text
   6  0000               _he00:
   7  0000 00            	dc.b	0
   8  0001 12            	dc.b	18
   9  0002 24            	dc.b	36
  10  0003 36            	dc.b	54
  11  0004 48            	dc.b	72
  12  0005 5a            	dc.b	90
  13  0006 6c            	dc.b	108
  14  0007 7e            	dc.b	126
  15  0008 91            	dc.b	145
  16  0009 83            	dc.b	131
  17  000a b5            	dc.b	181
  18  000b a7            	dc.b	167
  19  000c d9            	dc.b	217
  20  000d cb            	dc.b	203
  21  000e fd            	dc.b	253
  22  000f ef            	dc.b	239
  23  0010               _le00:
  24  0010 00            	dc.b	0
  25  0011 31            	dc.b	49
  26  0012 62            	dc.b	98
  27  0013 53            	dc.b	83
  28  0014 c4            	dc.b	196
  29  0015 f5            	dc.b	245
  30  0016 a6            	dc.b	166
  31  0017 97            	dc.b	151
  32  0018 88            	dc.b	136
  33  0019 b9            	dc.b	185
  34  001a ea            	dc.b	234
  35  001b db            	dc.b	219
  36  001c 4c            	dc.b	76
  37  001d 7d            	dc.b	125
  38  001e 2e            	dc.b	46
  39  001f 1f            	dc.b	31
  40  0020               _hf00:
  41  0020 00            	dc.b	0
  42  0021 10            	dc.b	16
  43  0022 20            	dc.b	32
  44  0023 30            	dc.b	48
  45  0024 40            	dc.b	64
  46  0025 50            	dc.b	80
  47  0026 60            	dc.b	96
  48  0027 70            	dc.b	112
  49  0028 81            	dc.b	129
  50  0029 91            	dc.b	145
  51  002a a1            	dc.b	161
  52  002b b1            	dc.b	177
  53  002c c1            	dc.b	193
  54  002d d1            	dc.b	209
  55  002e e1            	dc.b	225
  56  002f f1            	dc.b	241
  57  0030               _lf00:
  58  0030 00            	dc.b	0
  59  0031 21            	dc.b	33
  60  0032 42            	dc.b	66
  61  0033 63            	dc.b	99
  62  0034 84            	dc.b	132
  63  0035 a5            	dc.b	165
  64  0036 c6            	dc.b	198
  65  0037 e7            	dc.b	231
  66  0038 08            	dc.b	8
  67  0039 29            	dc.b	41
  68  003a 4a            	dc.b	74
  69  003b 6b            	dc.b	107
  70  003c 8c            	dc.b	140
  71  003d ad            	dc.b	173
  72  003e ce            	dc.b	206
  73  003f ef            	dc.b	239
 442                     	switch	.data
 443  0000               _dwTime:
 444  0000 00000000      	dc.l	0
 445  0004               _dwNowTime:
 446  0004 00000000      	dc.l	0
 447  0008               _g_nValveStat:
 448  0008 00            	dc.b	0
 449                     	switch	.const
 450  0040               L102_nAddr:
 451  0040 aa            	dc.b	170
 452  0041 aa            	dc.b	170
 453  0042 aa            	dc.b	170
 454  0043 aa            	dc.b	170
 455  0044 aa            	dc.b	170
 456  0045 aa            	dc.b	170
 457  0046 aa            	dc.b	170
 458  0047               L302_nTempBuf:
 459  0047 00            	dc.b	0
 460  0048 000000000000  	ds.b	18
 519                     ; 626 u8 CJ_T188ProtocolGM(void)
 519                     ; 627 {
 521                     	switch	.text
 522  0000               _CJ_T188ProtocolGM:
 524  0000 521a          	subw	sp,#26
 525       0000001a      OFST:	set	26
 528                     ; 628 	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
 530  0002 96            	ldw	x,sp
 531  0003 5c            	incw	x
 532  0004 90ae0040      	ldw	y,#L102_nAddr
 533  0008 a607          	ld	a,#7
 534  000a cd0000        	call	c_xymvx
 536                     ; 629 	u8 nTempBuf[19]  = {0};
 538  000d 96            	ldw	x,sp
 539  000e 1c0008        	addw	x,#OFST-18
 540  0011 90ae0047      	ldw	y,#L302_nTempBuf
 541  0015 a613          	ld	a,#19
 542  0017 cd0000        	call	c_xymvx
 544                     ; 631 	SetPortMeterPowerOn();
 546  001a 4b01          	push	#1
 547  001c 4b08          	push	#8
 548  001e ae5000        	ldw	x,#20480
 549  0021 cd0000        	call	_GPIO_WriteBit
 551  0024 85            	popw	x
 552                     ; 632 	UC_SleepFunc(GM_DELAY);
 554  0025 ae03e8        	ldw	x,#1000
 555  0028 89            	pushw	x
 556  0029 5f            	clrw	x
 557  002a 89            	pushw	x
 558  002b cd0000        	call	_UC_SleepFunc
 560  002e 5b04          	addw	sp,#4
 561                     ; 634 	if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
 561                     ; 635 		READDATA, NULL, 0, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
 563  0030 ae0258        	ldw	x,#600
 564  0033 89            	pushw	x
 565  0034 5f            	clrw	x
 566  0035 89            	pushw	x
 567  0036 89            	pushw	x
 568  0037 4b13          	push	#19
 569  0039 96            	ldw	x,sp
 570  003a 1c000f        	addw	x,#OFST-11
 571  003d 89            	pushw	x
 572  003e 4b00          	push	#0
 573  0040 5f            	clrw	x
 574  0041 89            	pushw	x
 575  0042 4b01          	push	#1
 576  0044 96            	ldw	x,sp
 577  0045 1c000e        	addw	x,#OFST-12
 578  0048 89            	pushw	x
 579  0049 a601          	ld	a,#1
 580  004b cd0000        	call	_CJ188GatherMeter
 582  004e 5b0f          	addw	sp,#15
 583  0050 a102          	cp	a,#2
 584  0052 2625          	jrne	L532
 585                     ; 637 		JX_BL_Change(4, &nTempBuf[0]);
 587  0054 96            	ldw	x,sp
 588  0055 1c0008        	addw	x,#OFST-18
 589  0058 89            	pushw	x
 590  0059 ae0004        	ldw	x,#4
 591  005c cd0000        	call	_JX_BL_Change
 593  005f 85            	popw	x
 594                     ; 638 		MemcpyFunc((u8*)&tyParameter.Value, &nTempBuf[0], 4);		
 596  0060 4b04          	push	#4
 597  0062 96            	ldw	x,sp
 598  0063 1c0009        	addw	x,#OFST-17
 599  0066 89            	pushw	x
 600  0067 ae0008        	ldw	x,#_tyParameter+8
 601  006a cd0000        	call	_MemcpyFunc
 603  006d 5b03          	addw	sp,#3
 604                     ; 643 		g_nValveStat = GetBoardVavleStat();
 606  006f cd0127        	call	_GetBoardVavleStat
 608  0072 c70008        	ld	_g_nValveStat,a
 609                     ; 648 		return TRUE;
 611  0075 a601          	ld	a,#1
 613  0077 2017          	jra	L62
 614  0079               L532:
 615                     ; 650 	SetPortMeterPowerOff();	
 617  0079 4b00          	push	#0
 618  007b 4b08          	push	#8
 619  007d ae5000        	ldw	x,#20480
 620  0080 cd0000        	call	_GPIO_WriteBit
 622  0083 85            	popw	x
 623                     ; 651 	UC_SleepFunc(GM_PWROFFDELAY); //add by maronglang 20160428
 625  0084 ae0064        	ldw	x,#100
 626  0087 89            	pushw	x
 627  0088 5f            	clrw	x
 628  0089 89            	pushw	x
 629  008a cd0000        	call	_UC_SleepFunc
 631  008d 5b04          	addw	sp,#4
 632                     ; 653 	return FALSE;
 634  008f 4f            	clr	a
 636  0090               L62:
 638  0090 5b1a          	addw	sp,#26
 639  0092 81            	ret	
 642                     	switch	.const
 643  005a               L732_nAddr:
 644  005a aa            	dc.b	170
 645  005b aa            	dc.b	170
 646  005c aa            	dc.b	170
 647  005d aa            	dc.b	170
 648  005e aa            	dc.b	170
 649  005f aa            	dc.b	170
 650  0060 aa            	dc.b	170
 651  0061               L142_nTempBuf:
 652  0061 00            	dc.b	0
 653  0062 000000000000  	ds.b	11
 711                     ; 664 u8 CJ_T188ProtocolReadAdd(u8* pnOutAddr)
 711                     ; 665 {
 712                     	switch	.text
 713  0093               _CJ_T188ProtocolReadAdd:
 715  0093 89            	pushw	x
 716  0094 5213          	subw	sp,#19
 717       00000013      OFST:	set	19
 720                     ; 666 	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
 722  0096 96            	ldw	x,sp
 723  0097 5c            	incw	x
 724  0098 90ae005a      	ldw	y,#L732_nAddr
 725  009c a607          	ld	a,#7
 726  009e cd0000        	call	c_xymvx
 728                     ; 667 	u8 nTempBuf[12]  = {0};
 730  00a1 96            	ldw	x,sp
 731  00a2 1c0008        	addw	x,#OFST-11
 732  00a5 90ae0061      	ldw	y,#L142_nTempBuf
 733  00a9 a60c          	ld	a,#12
 734  00ab cd0000        	call	c_xymvx
 736                     ; 669 	SetPortMeterPowerOn();
 738  00ae 4b01          	push	#1
 739  00b0 4b08          	push	#8
 740  00b2 ae5000        	ldw	x,#20480
 741  00b5 cd0000        	call	_GPIO_WriteBit
 743  00b8 85            	popw	x
 744                     ; 670 	UC_SleepFunc(GM_DELAY);
 746  00b9 ae03e8        	ldw	x,#1000
 747  00bc 89            	pushw	x
 748  00bd 5f            	clrw	x
 749  00be 89            	pushw	x
 750  00bf cd0000        	call	_UC_SleepFunc
 752  00c2 5b04          	addw	sp,#4
 753                     ; 672 	if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
 753                     ; 673 		READADDR, NULL, 0, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
 755  00c4 ae0258        	ldw	x,#600
 756  00c7 89            	pushw	x
 757  00c8 5f            	clrw	x
 758  00c9 89            	pushw	x
 759  00ca 89            	pushw	x
 760  00cb 4b0c          	push	#12
 761  00cd 96            	ldw	x,sp
 762  00ce 1c000f        	addw	x,#OFST-4
 763  00d1 89            	pushw	x
 764  00d2 4b00          	push	#0
 765  00d4 5f            	clrw	x
 766  00d5 89            	pushw	x
 767  00d6 4b06          	push	#6
 768  00d8 96            	ldw	x,sp
 769  00d9 1c000e        	addw	x,#OFST-5
 770  00dc 89            	pushw	x
 771  00dd a601          	ld	a,#1
 772  00df cd0000        	call	_CJ188GatherMeter
 774  00e2 5b0f          	addw	sp,#15
 775  00e4 a102          	cp	a,#2
 776  00e6 2612          	jrne	L172
 777                     ; 675 		MemcpyFunc(pnOutAddr, nTempBuf, 7);
 779  00e8 4b07          	push	#7
 780  00ea 96            	ldw	x,sp
 781  00eb 1c0009        	addw	x,#OFST-10
 782  00ee 89            	pushw	x
 783  00ef 1e17          	ldw	x,(OFST+4,sp)
 784  00f1 cd0000        	call	_MemcpyFunc
 786  00f4 5b03          	addw	sp,#3
 787                     ; 676 		return TRUE;
 789  00f6 a601          	ld	a,#1
 791  00f8 200c          	jra	L44
 792  00fa               L172:
 793                     ; 678 	SetPortMeterPowerOff();	  
 795  00fa 4b00          	push	#0
 796  00fc 4b08          	push	#8
 797  00fe ae5000        	ldw	x,#20480
 798  0101 cd0000        	call	_GPIO_WriteBit
 800  0104 4f            	clr	a
 801  0105 85            	popw	x
 802                     ; 679 	return FALSE;
 805  0106               L44:
 807  0106 5b15          	addw	sp,#21
 808  0108 81            	ret	
 843                     ; 973 u8 GatherMeterFun(void)
 843                     ; 974 {
 844                     	switch	.text
 845  0109               _GatherMeterFun:
 847  0109 88            	push	a
 848       00000001      OFST:	set	1
 851                     ; 975 	u8 nRef = FALSE;
 853  010a 0f01          	clr	(OFST+0,sp)
 854                     ; 979 	nRef = CJ_T188ProtocolGM();
 856  010c cd0000        	call	_CJ_T188ProtocolGM
 858  010f 6b01          	ld	(OFST+0,sp),a
 859                     ; 982 	if(GetTmDebugModeStat())
 861  0111 cd0000        	call	_GetTmDebugModeStat
 863  0114 4d            	tnz	a
 864  0115 270b          	jreq	L703
 865                     ; 984 		SetPortMeterPowerOn();
 867  0117 4b01          	push	#1
 868  0119 4b08          	push	#8
 869  011b ae5000        	ldw	x,#20480
 870  011e cd0000        	call	_GPIO_WriteBit
 872  0121 85            	popw	x
 873  0122               L703:
 874                     ; 986 	return nRef;
 876  0122 7b01          	ld	a,(OFST+0,sp)
 879  0124 5b01          	addw	sp,#1
 880  0126 81            	ret	
 929                     ; 1001 u8 GetBoardVavleStat(void)
 929                     ; 1002 {
 930                     	switch	.text
 931  0127               _GetBoardVavleStat:
 933  0127 89            	pushw	x
 934       00000002      OFST:	set	2
 937                     ; 1003 	u8 nMs1 = 0, nMs2 = 0, nVavleStat = VALVE_OPEN;
 943  0128 7b02          	ld	a,(OFST+0,sp)
 944  012a 97            	ld	xl,a
 945                     ; 1005 	ValveStatIoModeChange(PULLUPINPUT);	
 947  012b a602          	ld	a,#2
 948  012d cd0000        	call	_ValveStatIoModeChange
 950                     ; 1006 	UC_SleepFunc(3);
 952  0130 ae0003        	ldw	x,#3
 953  0133 89            	pushw	x
 954  0134 5f            	clrw	x
 955  0135 89            	pushw	x
 956  0136 cd0000        	call	_UC_SleepFunc
 958  0139 5b04          	addw	sp,#4
 959                     ; 1007 	nMs1 = GetMs1Stat();
 961  013b 4b08          	push	#8
 962  013d ae500f        	ldw	x,#20495
 963  0140 cd0000        	call	_GPIO_ReadInputDataBit
 965  0143 5b01          	addw	sp,#1
 966  0145 6b01          	ld	(OFST-1,sp),a
 967                     ; 1008 	nMs2 = GetMs2Stat();
 969  0147 4b04          	push	#4
 970  0149 ae500f        	ldw	x,#20495
 971  014c cd0000        	call	_GPIO_ReadInputDataBit
 973  014f 5b01          	addw	sp,#1
 974  0151 6b02          	ld	(OFST+0,sp),a
 975                     ; 1009 	ValveStatIoModeChange(FLOATINPUT);	
 977  0153 4f            	clr	a
 978  0154 cd0000        	call	_ValveStatIoModeChange
 980                     ; 1011 	if((0 == nMs1)&&(0 != nMs2))
 982  0157 7b01          	ld	a,(OFST-1,sp)
 983  0159 2604          	jrne	L133
 985  015b 0d02          	tnz	(OFST+0,sp)
 986                     ; 1013 		nVavleStat = VALVE_OPEN;
 989  015d 260d          	jrne	LC001
 990  015f               L133:
 991                     ; 1015 	else if((0 != nMs1)&&(0 == nMs2))
 993  015f 7b01          	ld	a,(OFST-1,sp)
 994  0161 2707          	jreq	L533
 996  0163 7b02          	ld	a,(OFST+0,sp)
 997  0165 2603          	jrne	L533
 998                     ; 1017 		nVavleStat = VALVE_CLOSE;
1000  0167 4c            	inc	a
1002  0168 2002          	jp	LC001
1003  016a               L533:
1004                     ; 1021 		nVavleStat = VALVE_ERROR;
1006  016a a603          	ld	a,#3
1007  016c               LC001:
1008                     ; 1024 	return nVavleStat;
1012  016c 85            	popw	x
1013  016d 81            	ret	
1072                     ; 1035 u8 VavleOperateFunExt(u8 nOptCmd)
1072                     ; 1036 {
1073                     	switch	.text
1074  016e               _VavleOperateFunExt:
1076  016e 88            	push	a
1077  016f 5204          	subw	sp,#4
1078       00000004      OFST:	set	4
1081                     ; 1037 	u8 nRef = FALSE, nCnt = 0;
1083  0171 0f03          	clr	(OFST-1,sp)
1086  0173 0f04          	clr	(OFST+0,sp)
1087                     ; 1038 	u16 wVol = 0;
1089  0175 5f            	clrw	x
1090  0176 1f01          	ldw	(OFST-3,sp),x
1091                     ; 1041 	g_nValveStat = GetBoardVavleStat();
1093  0178 adad          	call	_GetBoardVavleStat
1095  017a c70008        	ld	_g_nValveStat,a
1096                     ; 1043 	if(((VALVE_CLOSE == g_nValveStat)&&(VALVECLOSE == nOptCmd))
1096                     ; 1044 		|| ((VALVE_OPEN == g_nValveStat)&&(VALVEOPEN == nOptCmd)))
1098  017d 4a            	dec	a
1099  017e 2606          	jrne	L763
1101  0180 7b05          	ld	a,(OFST+1,sp)
1102  0182 a105          	cp	a,#5
1103  0184 270b          	jreq	L563
1104  0186               L763:
1106  0186 c60008        	ld	a,_g_nValveStat
1107  0189 260b          	jrne	L363
1109  018b 7b05          	ld	a,(OFST+1,sp)
1110  018d a103          	cp	a,#3
1111  018f 2605          	jrne	L363
1112  0191               L563:
1113                     ; 1046 		return TRUE;
1115  0191 a601          	ld	a,#1
1117  0193 cc0221        	jra	L241
1118  0196               L363:
1119                     ; 1051 		SetPortGsmPowerOn();
1121  0196 4b01          	push	#1
1122  0198 4b10          	push	#16
1123  019a ae500a        	ldw	x,#20490
1124  019d cd0000        	call	_GPIO_WriteBit
1126  01a0 85            	popw	x
1127                     ; 1054 	MotoVccOn();	
1129  01a1 4b01          	push	#1
1130  01a3 4b02          	push	#2
1131  01a5 ae500f        	ldw	x,#20495
1132  01a8 cd0000        	call	_GPIO_WriteBit
1134  01ab 85            	popw	x
1135                     ; 1055 	UC_SleepFunc(2000);
1137  01ac ae07d0        	ldw	x,#2000
1138  01af 89            	pushw	x
1139  01b0 5f            	clrw	x
1140  01b1 89            	pushw	x
1141  01b2 cd0000        	call	_UC_SleepFunc
1143  01b5 5b04          	addw	sp,#4
1144                     ; 1074 	if(VALVECLOSE == nOptCmd)
1146  01b7 7b05          	ld	a,(OFST+1,sp)
1147  01b9 a105          	cp	a,#5
1148  01bb 2621          	jrne	L173
1149                     ; 1076 		MotoPosiHigh();
1151  01bd 4b01          	push	#1
1152  01bf 4b02          	push	#2
1153  01c1 ae5005        	ldw	x,#20485
1154  01c4 cd0000        	call	_GPIO_WriteBit
1156  01c7 85            	popw	x
1157                     ; 1077 		MotoNegaLow();
1159  01c8 ad6c          	call	LC004
1160                     ; 1078 		nCnt = 0;
1162  01ca 0f04          	clr	(OFST+0,sp)
1163  01cc               L373:
1164                     ; 1081 			UC_SleepFunc(VAVLE_OPT_DELAY);
1166  01cc ad56          	call	LC003
1167                     ; 1083 			if(VALVE_CLOSE == g_nValveStat)
1169  01ce 4a            	dec	a
1170                     ; 1085 				nRef = TRUE;
1171                     ; 1086 				break;
1173  01cf 271e          	jreq	LC002
1174                     ; 1088 			nCnt++;			
1176  01d1 0c04          	inc	(OFST+0,sp)
1177                     ; 1089 			FeedSoftWareIwdg();
1179  01d3 cd0000        	call	_FeedSoftWareIwdg
1181                     ; 1090 		}while(VAVLE_TIMEOUT>nCnt);
1183  01d6 7b04          	ld	a,(OFST+0,sp)
1184  01d8 a128          	cp	a,#40
1185  01da 25f0          	jrult	L373
1186  01dc 2021          	jra	L304
1187  01de               L173:
1188                     ; 1094 		MotoPosiLow();
1190  01de ad62          	call	LC005
1191                     ; 1095 		MotoNegaHigh();
1193  01e0 4b01          	push	#1
1194  01e2 4b01          	push	#1
1195  01e4 ae5005        	ldw	x,#20485
1196  01e7 cd0000        	call	_GPIO_WriteBit
1198  01ea 85            	popw	x
1199  01eb               L504:
1200                     ; 1098 			UC_SleepFunc(VAVLE_OPT_DELAY);
1202  01eb ad37          	call	LC003
1203                     ; 1100 			if(VALVE_OPEN == g_nValveStat)
1205  01ed 2605          	jrne	L314
1206                     ; 1102 				nRef = TRUE;
1208  01ef               LC002:
1210  01ef 4c            	inc	a
1211  01f0 6b03          	ld	(OFST-1,sp),a
1212                     ; 1103 				break;
1214  01f2 200b          	jra	L304
1215  01f4               L314:
1216                     ; 1105 			nCnt++;			
1218  01f4 0c04          	inc	(OFST+0,sp)
1219                     ; 1106 			FeedSoftWareIwdg();
1221  01f6 cd0000        	call	_FeedSoftWareIwdg
1223                     ; 1107 		}while(VAVLE_TIMEOUT>nCnt);
1225  01f9 7b04          	ld	a,(OFST+0,sp)
1226  01fb a128          	cp	a,#40
1227  01fd 25ec          	jrult	L504
1228  01ff               L304:
1229                     ; 1110 	MotoVccOff();
1231  01ff 4b00          	push	#0
1232  0201 4b02          	push	#2
1233  0203 ae500f        	ldw	x,#20495
1234  0206 cd0000        	call	_GPIO_WriteBit
1236  0209 85            	popw	x
1237                     ; 1111 	if(GetTmDebugModeStat())
1239  020a cd0000        	call	_GetTmDebugModeStat
1241  020d 4d            	tnz	a
1242  020e 270b          	jreq	L514
1243                     ; 1113 		SetPortGsmPowerOff();
1245  0210 4b00          	push	#0
1246  0212 4b10          	push	#16
1247  0214 ae500a        	ldw	x,#20490
1248  0217 cd0000        	call	_GPIO_WriteBit
1250  021a 85            	popw	x
1251  021b               L514:
1252                     ; 1115 	MotoPosiLow();
1254  021b ad25          	call	LC005
1255                     ; 1116 	MotoNegaLow();	
1257  021d ad17          	call	LC004
1258                     ; 1118 	return nRef;
1260  021f 7b03          	ld	a,(OFST-1,sp)
1262  0221               L241:
1264  0221 5b05          	addw	sp,#5
1265  0223 81            	ret	
1267  0224               LC003:
1268  0224 ae01f4        	ldw	x,#500
1269  0227 89            	pushw	x
1270  0228 5f            	clrw	x
1271  0229 89            	pushw	x
1272  022a cd0000        	call	_UC_SleepFunc
1274  022d 5b04          	addw	sp,#4
1275                     ; 1082 			g_nValveStat = GetBoardVavleStat();
1277  022f cd0127        	call	_GetBoardVavleStat
1279  0232 c70008        	ld	_g_nValveStat,a
1280  0235 81            	ret	
1281  0236               LC004:
1282  0236 4b00          	push	#0
1283  0238 4b01          	push	#1
1284  023a ae5005        	ldw	x,#20485
1285  023d cd0000        	call	_GPIO_WriteBit
1287  0240 85            	popw	x
1288  0241 81            	ret	
1289  0242               LC005:
1290  0242 4b00          	push	#0
1291  0244 4b02          	push	#2
1292  0246 ae5005        	ldw	x,#20485
1293  0249 cd0000        	call	_GPIO_WriteBit
1295  024c 85            	popw	x
1296  024d 81            	ret	
1319                     ; 1129 u8 GetVavleStat(void)
1319                     ; 1130 {
1320                     	switch	.text
1321  024e               _GetVavleStat:
1325                     ; 1131 	return g_nValveStat;
1327  024e c60008        	ld	a,_g_nValveStat
1330  0251 81            	ret	
1370                     ; 1182 u8 VavleOperateFun(u8 nOptCmd)
1370                     ; 1183 {
1371                     	switch	.text
1372  0252               _VavleOperateFun:
1374  0252 88            	push	a
1375       00000001      OFST:	set	1
1378                     ; 1184 	u8 nRef = FALSE;
1380  0253 0f01          	clr	(OFST+0,sp)
1381                     ; 1186 	nRef = VavleOperateFunExt(nOptCmd);
1383  0255 cd016e        	call	_VavleOperateFunExt
1385                     ; 1187 	return nRef;
1389  0258 5b01          	addw	sp,#1
1390  025a 81            	ret	
1425                     ; 1269 u32 DG_DebugPrintfFun(u8 *pnBuf, u8 nLen, u8 nIndex)
1425                     ; 1270 {
1426                     	switch	.text
1427  025b               _DG_DebugPrintfFun:
1431                     ; 1277 }
1434  025b 81            	ret	
1480                     ; 1286 void fixTaskProtocolDebug(void)
1480                     ; 1287 {
1481                     	switch	.text
1482  025c               _fixTaskProtocolDebug:
1484  025c 89            	pushw	x
1485       00000002      OFST:	set	2
1488                     ; 1288 	u8 channel  = 0;
1490                     ; 1289 	u8 nSendLen = 0;
1492  025d 0f02          	clr	(OFST+0,sp)
1493                     ; 1291 	channel = CheckWhichBusUartReceive();		//接收到数据?
1495  025f cd0000        	call	_CheckWhichBusUartReceive
1497                     ; 1294 	if (COM_2 != CheckWhichBusUartReceive())
1499  0262 cd0000        	call	_CheckWhichBusUartReceive
1501  0265 a102          	cp	a,#2
1502  0267 2627          	jrne	L305
1503                     ; 1296 		return ;
1505                     ; 1299 	UC_SleepFunc(180);
1507  0269 ae00b4        	ldw	x,#180
1508  026c 89            	pushw	x
1509  026d 5f            	clrw	x
1510  026e 89            	pushw	x
1511  026f cd0000        	call	_UC_SleepFunc
1513  0272 5b04          	addw	sp,#4
1514                     ; 1311 	if(0 < (nSendLen = HD_DecodeParameter(GetUartRxBuf(), CheckRevDataLen())))
1516  0274 cd0000        	call	_CheckRevDataLen
1518  0277 88            	push	a
1519  0278 cd0000        	call	_GetUartRxBuf
1521  027b cd0000        	call	_HD_DecodeParameter
1523  027e 5b01          	addw	sp,#1
1524  0280 6b02          	ld	(OFST+0,sp),a
1525  0282 270c          	jreq	L305
1526                     ; 1313 		HD_ProtolSend(nSendLen, COM_2,0);
1528  0284 4b00          	push	#0
1529  0286 ae0002        	ldw	x,#2
1530  0289 7b03          	ld	a,(OFST+1,sp)
1531  028b 95            	ld	xh,a
1532  028c cd0000        	call	_HD_ProtolSend
1534  028f 84            	pop	a
1535  0290               L305:
1536                     ; 1316 }
1539  0290 85            	popw	x
1540  0291 81            	ret	
1564                     ; 1328 u32 GetSysTemTick(void)
1564                     ; 1329 {
1565                     	switch	.text
1566  0292               _GetSysTemTick:
1570                     ; 1330 	return g_dwSysTick;
1572  0292 ae0000        	ldw	x,#_g_dwSysTick
1576  0295 cc0000        	jp	c_ltor
1579                     	switch	.const
1580  006d               L515_nTmpBuf:
1581  006d 00            	dc.b	0
1582  006e 000000000000  	ds.b	6
1629                     ; 1341 void InitializeProtocol(void)
1629                     ; 1342 {
1630                     	switch	.text
1631  0298               _InitializeProtocol:
1633  0298 5208          	subw	sp,#8
1634       00000008      OFST:	set	8
1637                     ; 1343 	u8 nTmpBuf[7] = {0};
1639  029a 96            	ldw	x,sp
1640  029b 5c            	incw	x
1641  029c 90ae006d      	ldw	y,#L515_nTmpBuf
1642  02a0 a607          	ld	a,#7
1643  02a2 cd0000        	call	c_xymvx
1645                     ; 1344 	u8 i = 0;
1647  02a5 0f08          	clr	(OFST+0,sp)
1648                     ; 1346 	ucTimerProtocol = 10;
1650  02a7 350a002c      	mov	_ucTimerProtocol,#10
1651                     ; 1347 	ucMasterCmd = 0;
1653  02ab 725f002b      	clr	_ucMasterCmd
1654                     ; 1348 	ucSlaveCmd = 0;
1656  02af 725f002a      	clr	_ucSlaveCmd
1657                     ; 1349 	ClearRxBuff();
1659  02b3 cd0000        	call	_ClearRxBuff
1661                     ; 1351 	if ((FALSE == ReadParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA)))
1663  02b6 4b04          	push	#4
1664  02b8 4b21          	push	#33
1665  02ba ae0000        	ldw	x,#_tyParameter
1666  02bd cd0000        	call	_ReadParameterForType
1668  02c0 4d            	tnz	a
1669  02c1 85            	popw	x
1670                     ; 1378 	tyParameter.Value = INVALID_DATA;
1672  02c2 aeeeee        	ldw	x,#61166
1673  02c5 cf000a        	ldw	_tyParameter+10,x
1674  02c8 cf0008        	ldw	_tyParameter+8,x
1675                     ; 1380 	if ((FALSE == ReadParameterForType((u8*)&g_dwTmAddress, sizeof(g_dwTmAddress), TM_ADDRESS_PRAA)))
1677  02cb 4b07          	push	#7
1678  02cd 4b04          	push	#4
1679  02cf ae0000        	ldw	x,#_g_dwTmAddress
1680  02d2 cd0000        	call	_ReadParameterForType
1682  02d5 4d            	tnz	a
1683  02d6 85            	popw	x
1684  02d7 260a          	jrne	L145
1685                     ; 1382 		g_dwTmAddress = INIT_ADDRESS;
1687  02d9 ae0001        	ldw	x,#1
1688  02dc cf0002        	ldw	_g_dwTmAddress+2,x
1689  02df 5f            	clrw	x
1690  02e0 cf0000        	ldw	_g_dwTmAddress,x
1691  02e3               L145:
1692                     ; 1384 }
1695  02e3 5b08          	addw	sp,#8
1696  02e5 81            	ret	
1766                     	xdef	_VavleOperateFunExt
1767                     	xdef	_dwNowTime
1768                     	xdef	_dwTime
1769                     	switch	.bss
1770  0000               _U_TranShort:
1771  0000 0000          	ds.b	2
1772                     	xdef	_U_TranShort
1773                     	xref	_HD_DecodeParameter
1774                     	xref	_HD_ProtolSend
1775                     	xref	_CJ188GatherMeter
1776                     	xref	_ReadParameterForType
1777                     	xref	_UC_SleepFunc
1778                     	xref	_g_dwTmAddress
1779                     	xref	_GetUartRxBuf
1780                     	xref	_ClearRxBuff
1781                     	xref	_CheckRevDataLen
1782                     	xref	_CheckWhichBusUartReceive
1783                     	xref	_ValveStatIoModeChange
1784                     	xref	_FeedSoftWareIwdg
1785                     	xref	_GetTmDebugModeStat
1786                     	xref	_g_dwSysTick
1787                     	xref	_tyParameter
1788  0002               _tyJasonSlave:
1789  0002 000000000000  	ds.b	20
1790                     	xdef	_tyJasonSlave
1791  0016               _tyJasonMaster:
1792  0016 000000000000  	ds.b	20
1793                     	xdef	_tyJasonMaster
1794  002a               _ucSlaveCmd:
1795  002a 00            	ds.b	1
1796                     	xdef	_ucSlaveCmd
1797  002b               _ucMasterCmd:
1798  002b 00            	ds.b	1
1799                     	xdef	_ucMasterCmd
1800  002c               _ucTimerProtocol:
1801  002c 00            	ds.b	1
1802                     	xdef	_ucTimerProtocol
1803  002d               _ucTimerProtocol3:
1804  002d 00            	ds.b	1
1805                     	xdef	_ucTimerProtocol3
1806  002e               _ucTimerProtocol2:
1807  002e 00            	ds.b	1
1808                     	xdef	_ucTimerProtocol2
1809  002f               _ucStepUart:
1810  002f 00            	ds.b	1
1811                     	xdef	_ucStepUart
1812  0030               _ucStepUart3:
1813  0030 00            	ds.b	1
1814                     	xdef	_ucStepUart3
1815  0031               _ucStepUart2:
1816  0031 00            	ds.b	1
1817                     	xdef	_ucStepUart2
1818  0032               _ucStepProtocol:
1819  0032 00            	ds.b	1
1820                     	xdef	_ucStepProtocol
1821  0033               _ucStepProtocol3:
1822  0033 00            	ds.b	1
1823                     	xdef	_ucStepProtocol3
1824  0034               _ucStepProtocol2:
1825  0034 00            	ds.b	1
1826                     	xdef	_ucStepProtocol2
1827  0035               _ucStatusProtocol:
1828  0035 00            	ds.b	1
1829                     	xdef	_ucStatusProtocol
1830  0036               _ucStatusProtocol3:
1831  0036 00            	ds.b	1
1832                     	xdef	_ucStatusProtocol3
1833  0037               _ucStatusProtocol2:
1834  0037 00            	ds.b	1
1835                     	xdef	_ucStatusProtocol2
1836  0038               _ucNumberUart:
1837  0038 00            	ds.b	1
1838                     	xdef	_ucNumberUart
1839  0039               _ucNumberUart3:
1840  0039 00            	ds.b	1
1841                     	xdef	_ucNumberUart3
1842  003a               _ucNumberUart2:
1843  003a 00            	ds.b	1
1844                     	xdef	_ucNumberUart2
1845                     	xdef	_lf00
1846                     	xdef	_hf00
1847                     	xdef	_le00
1848                     	xdef	_he00
1849                     	xref	_JX_BL_Change
1850                     	xref	_MemcpyFunc
1851                     	xdef	_GetBoardVavleStat
1852                     	xdef	_DG_DebugPrintfFun
1853                     	xdef	_GetVavleStat
1854                     	xdef	_CJ_T188ProtocolReadAdd
1855                     	xdef	_VavleOperateFun
1856                     	xdef	_GatherMeterFun
1857                     	xdef	_CJ_T188ProtocolGM
1858                     	xdef	_GetSysTemTick
1859                     	xdef	_InitializeProtocol
1860                     	xdef	_fixTaskProtocolDebug
1861                     	xdef	_g_nValveStat
1862                     	xref	_GPIO_ReadInputDataBit
1863                     	xref	_GPIO_WriteBit
1883                     	xref	c_ltor
1884                     	xref	c_xymvx
1885                     	end
