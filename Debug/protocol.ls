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
 518                     ; 626 u8 CJ_T188ProtocolGM(void)
 518                     ; 627 {
 520                     	switch	.text
 521  0000               _CJ_T188ProtocolGM:
 523  0000 521a          	subw	sp,#26
 524       0000001a      OFST:	set	26
 527                     ; 628 	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
 529  0002 96            	ldw	x,sp
 530  0003 5c            	incw	x
 531  0004 90ae0040      	ldw	y,#L102_nAddr
 532  0008 a607          	ld	a,#7
 533  000a cd0000        	call	c_xymvx
 535                     ; 629 	u8 nTempBuf[19]  = {0};
 537  000d 96            	ldw	x,sp
 538  000e 1c0008        	addw	x,#OFST-18
 539  0011 90ae0047      	ldw	y,#L302_nTempBuf
 540  0015 a613          	ld	a,#19
 541  0017 cd0000        	call	c_xymvx
 543                     ; 631 	SetPortMeterPowerOn();
 545  001a 4b01          	push	#1
 546  001c 4b08          	push	#8
 547  001e ae5000        	ldw	x,#20480
 548  0021 cd0000        	call	_GPIO_WriteBit
 550  0024 85            	popw	x
 551                     ; 632 	UC_SleepFunc(GM_DELAY);
 553  0025 ae03e8        	ldw	x,#1000
 554  0028 89            	pushw	x
 555  0029 5f            	clrw	x
 556  002a 89            	pushw	x
 557  002b cd0000        	call	_UC_SleepFunc
 559  002e 5b04          	addw	sp,#4
 560                     ; 634 	if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
 560                     ; 635 		READDATA, NULL, 0, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
 562  0030 ae0258        	ldw	x,#600
 563  0033 89            	pushw	x
 564  0034 5f            	clrw	x
 565  0035 89            	pushw	x
 566  0036 89            	pushw	x
 567  0037 4b13          	push	#19
 568  0039 96            	ldw	x,sp
 569  003a 1c000f        	addw	x,#OFST-11
 570  003d 89            	pushw	x
 571  003e 4b00          	push	#0
 572  0040 5f            	clrw	x
 573  0041 89            	pushw	x
 574  0042 4b01          	push	#1
 575  0044 96            	ldw	x,sp
 576  0045 1c000e        	addw	x,#OFST-12
 577  0048 89            	pushw	x
 578  0049 a601          	ld	a,#1
 579  004b cd0000        	call	_CJ188GatherMeter
 581  004e 5b0f          	addw	sp,#15
 582  0050 a102          	cp	a,#2
 583  0052 2623          	jrne	L532
 584                     ; 637 		JX_BL_Change(4, &nTempBuf[0]);
 586  0054 96            	ldw	x,sp
 587  0055 1c0008        	addw	x,#OFST-18
 588  0058 89            	pushw	x
 589  0059 ae0004        	ldw	x,#4
 590  005c cd0000        	call	_JX_BL_Change
 592  005f 85            	popw	x
 593                     ; 638 		MemcpyFunc((u8*)&tyParameter.Value, &nTempBuf[0], 4);		
 595  0060 4b04          	push	#4
 596  0062 96            	ldw	x,sp
 597  0063 1c0009        	addw	x,#OFST-17
 598  0066 89            	pushw	x
 599  0067 ae0008        	ldw	x,#_tyParameter+8
 600  006a cd0000        	call	_MemcpyFunc
 602  006d 5b03          	addw	sp,#3
 603                     ; 646 		g_nValveStat = 0;
 605  006f 725f0008      	clr	_g_nValveStat
 606                     ; 648 		return TRUE;
 608  0073 a601          	ld	a,#1
 610  0075 2017          	jra	L42
 611  0077               L532:
 612                     ; 650 	SetPortMeterPowerOff();	
 614  0077 4b00          	push	#0
 615  0079 4b08          	push	#8
 616  007b ae5000        	ldw	x,#20480
 617  007e cd0000        	call	_GPIO_WriteBit
 619  0081 85            	popw	x
 620                     ; 651 	UC_SleepFunc(GM_PWROFFDELAY); //add by maronglang 20160428
 622  0082 ae0064        	ldw	x,#100
 623  0085 89            	pushw	x
 624  0086 5f            	clrw	x
 625  0087 89            	pushw	x
 626  0088 cd0000        	call	_UC_SleepFunc
 628  008b 5b04          	addw	sp,#4
 629                     ; 653 	return FALSE;
 631  008d 4f            	clr	a
 633  008e               L42:
 635  008e 5b1a          	addw	sp,#26
 636  0090 81            	ret	
 639                     	switch	.const
 640  005a               L732_nAddr:
 641  005a aa            	dc.b	170
 642  005b aa            	dc.b	170
 643  005c aa            	dc.b	170
 644  005d aa            	dc.b	170
 645  005e aa            	dc.b	170
 646  005f aa            	dc.b	170
 647  0060 aa            	dc.b	170
 648  0061               L142_nTempBuf:
 649  0061 00            	dc.b	0
 650  0062 000000000000  	ds.b	11
 708                     ; 664 u8 CJ_T188ProtocolReadAdd(u8* pnOutAddr)
 708                     ; 665 {
 709                     	switch	.text
 710  0091               _CJ_T188ProtocolReadAdd:
 712  0091 89            	pushw	x
 713  0092 5213          	subw	sp,#19
 714       00000013      OFST:	set	19
 717                     ; 666 	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
 719  0094 96            	ldw	x,sp
 720  0095 5c            	incw	x
 721  0096 90ae005a      	ldw	y,#L732_nAddr
 722  009a a607          	ld	a,#7
 723  009c cd0000        	call	c_xymvx
 725                     ; 667 	u8 nTempBuf[12]  = {0};
 727  009f 96            	ldw	x,sp
 728  00a0 1c0008        	addw	x,#OFST-11
 729  00a3 90ae0061      	ldw	y,#L142_nTempBuf
 730  00a7 a60c          	ld	a,#12
 731  00a9 cd0000        	call	c_xymvx
 733                     ; 669 	SetPortMeterPowerOn();
 735  00ac 4b01          	push	#1
 736  00ae 4b08          	push	#8
 737  00b0 ae5000        	ldw	x,#20480
 738  00b3 cd0000        	call	_GPIO_WriteBit
 740  00b6 85            	popw	x
 741                     ; 670 	UC_SleepFunc(GM_DELAY);
 743  00b7 ae03e8        	ldw	x,#1000
 744  00ba 89            	pushw	x
 745  00bb 5f            	clrw	x
 746  00bc 89            	pushw	x
 747  00bd cd0000        	call	_UC_SleepFunc
 749  00c0 5b04          	addw	sp,#4
 750                     ; 672 	if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
 750                     ; 673 		READADDR, NULL, 0, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
 752  00c2 ae0258        	ldw	x,#600
 753  00c5 89            	pushw	x
 754  00c6 5f            	clrw	x
 755  00c7 89            	pushw	x
 756  00c8 89            	pushw	x
 757  00c9 4b0c          	push	#12
 758  00cb 96            	ldw	x,sp
 759  00cc 1c000f        	addw	x,#OFST-4
 760  00cf 89            	pushw	x
 761  00d0 4b00          	push	#0
 762  00d2 5f            	clrw	x
 763  00d3 89            	pushw	x
 764  00d4 4b06          	push	#6
 765  00d6 96            	ldw	x,sp
 766  00d7 1c000e        	addw	x,#OFST-5
 767  00da 89            	pushw	x
 768  00db a601          	ld	a,#1
 769  00dd cd0000        	call	_CJ188GatherMeter
 771  00e0 5b0f          	addw	sp,#15
 772  00e2 a102          	cp	a,#2
 773  00e4 2612          	jrne	L172
 774                     ; 675 		MemcpyFunc(pnOutAddr, nTempBuf, 7);
 776  00e6 4b07          	push	#7
 777  00e8 96            	ldw	x,sp
 778  00e9 1c0009        	addw	x,#OFST-10
 779  00ec 89            	pushw	x
 780  00ed 1e17          	ldw	x,(OFST+4,sp)
 781  00ef cd0000        	call	_MemcpyFunc
 783  00f2 5b03          	addw	sp,#3
 784                     ; 676 		return TRUE;
 786  00f4 a601          	ld	a,#1
 788  00f6 200c          	jra	L24
 789  00f8               L172:
 790                     ; 678 	SetPortMeterPowerOff();	  
 792  00f8 4b00          	push	#0
 793  00fa 4b08          	push	#8
 794  00fc ae5000        	ldw	x,#20480
 795  00ff cd0000        	call	_GPIO_WriteBit
 797  0102 4f            	clr	a
 798  0103 85            	popw	x
 799                     ; 679 	return FALSE;
 802  0104               L24:
 804  0104 5b15          	addw	sp,#21
 805  0106 81            	ret	
 840                     ; 973 u8 GatherMeterFun(void)
 840                     ; 974 {
 841                     	switch	.text
 842  0107               _GatherMeterFun:
 844  0107 88            	push	a
 845       00000001      OFST:	set	1
 848                     ; 975 	u8 nRef = FALSE;
 850  0108 0f01          	clr	(OFST+0,sp)
 851                     ; 979 	nRef = CJ_T188ProtocolGM();
 853  010a cd0000        	call	_CJ_T188ProtocolGM
 855  010d 6b01          	ld	(OFST+0,sp),a
 856                     ; 982 	if(GetTmDebugModeStat())
 858  010f cd0000        	call	_GetTmDebugModeStat
 860  0112 4d            	tnz	a
 861  0113 270b          	jreq	L703
 862                     ; 984 		SetPortMeterPowerOn();
 864  0115 4b01          	push	#1
 865  0117 4b08          	push	#8
 866  0119 ae5000        	ldw	x,#20480
 867  011c cd0000        	call	_GPIO_WriteBit
 869  011f 85            	popw	x
 870  0120               L703:
 871                     ; 986 	return nRef;
 873  0120 7b01          	ld	a,(OFST+0,sp)
 876  0122 5b01          	addw	sp,#1
 877  0124 81            	ret	
 930                     ; 1035 u8 VavleOperateFunExt(u8 nOptCmd)
 930                     ; 1036 {
 931                     	switch	.text
 932  0125               _VavleOperateFunExt:
 934  0125 5204          	subw	sp,#4
 935       00000004      OFST:	set	4
 938                     ; 1037 	u8 nRef = FALSE, nCnt = 0;
 940  0127 0f04          	clr	(OFST+0,sp)
 943  0129 0f01          	clr	(OFST-3,sp)
 944                     ; 1038 	u16 wVol = 0;
 946  012b 5f            	clrw	x
 947                     ; 1118 	return nRef;
 949  012c 4f            	clr	a
 952  012d 5b04          	addw	sp,#4
 953  012f 81            	ret	
 977                     ; 1129 u8 GetVavleStat(void)
 977                     ; 1130 {
 978                     	switch	.text
 979  0130               _GetVavleStat:
 983                     ; 1131 	return g_nValveStat;
 985  0130 c60008        	ld	a,_g_nValveStat
 988  0133 81            	ret	
1028                     ; 1182 u8 VavleOperateFun(u8 nOptCmd)
1028                     ; 1183 {
1029                     	switch	.text
1030  0134               _VavleOperateFun:
1032  0134 88            	push	a
1033       00000001      OFST:	set	1
1036                     ; 1184 	u8 nRef = FALSE;
1038  0135 0f01          	clr	(OFST+0,sp)
1039                     ; 1186 	nRef = VavleOperateFunExt(nOptCmd);
1041  0137 adec          	call	_VavleOperateFunExt
1043                     ; 1187 	return nRef;
1047  0139 5b01          	addw	sp,#1
1048  013b 81            	ret	
1083                     ; 1269 u32 DG_DebugPrintfFun(u8 *pnBuf, u8 nLen, u8 nIndex)
1083                     ; 1270 {
1084                     	switch	.text
1085  013c               _DG_DebugPrintfFun:
1089                     ; 1277 }
1092  013c 81            	ret	
1138                     ; 1286 void fixTaskProtocolDebug(void)
1138                     ; 1287 {
1139                     	switch	.text
1140  013d               _fixTaskProtocolDebug:
1142  013d 89            	pushw	x
1143       00000002      OFST:	set	2
1146                     ; 1288 	u8 channel  = 0;
1148                     ; 1289 	u8 nSendLen = 0;
1150  013e 0f02          	clr	(OFST+0,sp)
1151                     ; 1291 	channel = CheckWhichBusUartReceive();		//接收到数据?
1153  0140 cd0000        	call	_CheckWhichBusUartReceive
1155                     ; 1294 	if (COM_2 != CheckWhichBusUartReceive())
1157  0143 cd0000        	call	_CheckWhichBusUartReceive
1159  0146 a102          	cp	a,#2
1160  0148 2627          	jrne	L714
1161                     ; 1296 		return ;
1163                     ; 1299 	UC_SleepFunc(180);
1165  014a ae00b4        	ldw	x,#180
1166  014d 89            	pushw	x
1167  014e 5f            	clrw	x
1168  014f 89            	pushw	x
1169  0150 cd0000        	call	_UC_SleepFunc
1171  0153 5b04          	addw	sp,#4
1172                     ; 1311 	if(0 < (nSendLen = HD_DecodeParameter(GetUartRxBuf(), CheckRevDataLen())))
1174  0155 cd0000        	call	_CheckRevDataLen
1176  0158 88            	push	a
1177  0159 cd0000        	call	_GetUartRxBuf
1179  015c cd0000        	call	_HD_DecodeParameter
1181  015f 5b01          	addw	sp,#1
1182  0161 6b02          	ld	(OFST+0,sp),a
1183  0163 270c          	jreq	L714
1184                     ; 1313 		HD_ProtolSend(nSendLen, COM_2,0);
1186  0165 4b00          	push	#0
1187  0167 ae0002        	ldw	x,#2
1188  016a 7b03          	ld	a,(OFST+1,sp)
1189  016c 95            	ld	xh,a
1190  016d cd0000        	call	_HD_ProtolSend
1192  0170 84            	pop	a
1193  0171               L714:
1194                     ; 1316 }
1197  0171 85            	popw	x
1198  0172 81            	ret	
1222                     ; 1328 u32 GetSysTemTick(void)
1222                     ; 1329 {
1223                     	switch	.text
1224  0173               _GetSysTemTick:
1228                     ; 1330 	return g_dwSysTick;
1230  0173 ae0000        	ldw	x,#_g_dwSysTick
1234  0176 cc0000        	jp	c_ltor
1237                     	switch	.const
1238  006d               L134_nTmpBuf:
1239  006d 00            	dc.b	0
1240  006e 000000000000  	ds.b	6
1287                     ; 1341 void InitializeProtocol(void)
1287                     ; 1342 {
1288                     	switch	.text
1289  0179               _InitializeProtocol:
1291  0179 5208          	subw	sp,#8
1292       00000008      OFST:	set	8
1295                     ; 1343 	u8 nTmpBuf[7] = {0};
1297  017b 96            	ldw	x,sp
1298  017c 5c            	incw	x
1299  017d 90ae006d      	ldw	y,#L134_nTmpBuf
1300  0181 a607          	ld	a,#7
1301  0183 cd0000        	call	c_xymvx
1303                     ; 1344 	u8 i = 0;
1305  0186 0f08          	clr	(OFST+0,sp)
1306                     ; 1346 	ucTimerProtocol = 10;
1308  0188 350a002c      	mov	_ucTimerProtocol,#10
1309                     ; 1347 	ucMasterCmd = 0;
1311  018c 725f002b      	clr	_ucMasterCmd
1312                     ; 1348 	ucSlaveCmd = 0;
1314  0190 725f002a      	clr	_ucSlaveCmd
1315                     ; 1349 	ClearRxBuff();
1317  0194 cd0000        	call	_ClearRxBuff
1319                     ; 1351 	if ((FALSE == ReadParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA)))
1321  0197 4b04          	push	#4
1322  0199 4b21          	push	#33
1323  019b ae0000        	ldw	x,#_tyParameter
1324  019e cd0000        	call	_ReadParameterForType
1326  01a1 4d            	tnz	a
1327  01a2 85            	popw	x
1328                     ; 1378 	tyParameter.Value = INVALID_DATA;
1330  01a3 aeeeee        	ldw	x,#61166
1331  01a6 cf000a        	ldw	_tyParameter+10,x
1332  01a9 cf0008        	ldw	_tyParameter+8,x
1333                     ; 1380 	if ((FALSE == ReadParameterForType((u8*)&g_dwTmAddress, sizeof(g_dwTmAddress), TM_ADDRESS_PRAA)))
1335  01ac 4b07          	push	#7
1336  01ae 4b04          	push	#4
1337  01b0 ae0000        	ldw	x,#_g_dwTmAddress
1338  01b3 cd0000        	call	_ReadParameterForType
1340  01b6 4d            	tnz	a
1341  01b7 85            	popw	x
1342  01b8 260a          	jrne	L554
1343                     ; 1382 		g_dwTmAddress = INIT_ADDRESS;
1345  01ba ae0001        	ldw	x,#1
1346  01bd cf0002        	ldw	_g_dwTmAddress+2,x
1347  01c0 5f            	clrw	x
1348  01c1 cf0000        	ldw	_g_dwTmAddress,x
1349  01c4               L554:
1350                     ; 1384 }
1353  01c4 5b08          	addw	sp,#8
1354  01c6 81            	ret	
1424                     	xdef	_VavleOperateFunExt
1425                     	xdef	_dwNowTime
1426                     	xdef	_dwTime
1427                     	switch	.bss
1428  0000               _U_TranShort:
1429  0000 0000          	ds.b	2
1430                     	xdef	_U_TranShort
1431                     	xref	_HD_DecodeParameter
1432                     	xref	_HD_ProtolSend
1433                     	xref	_CJ188GatherMeter
1434                     	xref	_ReadParameterForType
1435                     	xref	_UC_SleepFunc
1436                     	xref	_g_dwTmAddress
1437                     	xref	_GetUartRxBuf
1438                     	xref	_ClearRxBuff
1439                     	xref	_CheckRevDataLen
1440                     	xref	_CheckWhichBusUartReceive
1441                     	xref	_GetTmDebugModeStat
1442                     	xref	_g_dwSysTick
1443                     	xref	_tyParameter
1444  0002               _tyJasonSlave:
1445  0002 000000000000  	ds.b	20
1446                     	xdef	_tyJasonSlave
1447  0016               _tyJasonMaster:
1448  0016 000000000000  	ds.b	20
1449                     	xdef	_tyJasonMaster
1450  002a               _ucSlaveCmd:
1451  002a 00            	ds.b	1
1452                     	xdef	_ucSlaveCmd
1453  002b               _ucMasterCmd:
1454  002b 00            	ds.b	1
1455                     	xdef	_ucMasterCmd
1456  002c               _ucTimerProtocol:
1457  002c 00            	ds.b	1
1458                     	xdef	_ucTimerProtocol
1459  002d               _ucTimerProtocol3:
1460  002d 00            	ds.b	1
1461                     	xdef	_ucTimerProtocol3
1462  002e               _ucTimerProtocol2:
1463  002e 00            	ds.b	1
1464                     	xdef	_ucTimerProtocol2
1465  002f               _ucStepUart:
1466  002f 00            	ds.b	1
1467                     	xdef	_ucStepUart
1468  0030               _ucStepUart3:
1469  0030 00            	ds.b	1
1470                     	xdef	_ucStepUart3
1471  0031               _ucStepUart2:
1472  0031 00            	ds.b	1
1473                     	xdef	_ucStepUart2
1474  0032               _ucStepProtocol:
1475  0032 00            	ds.b	1
1476                     	xdef	_ucStepProtocol
1477  0033               _ucStepProtocol3:
1478  0033 00            	ds.b	1
1479                     	xdef	_ucStepProtocol3
1480  0034               _ucStepProtocol2:
1481  0034 00            	ds.b	1
1482                     	xdef	_ucStepProtocol2
1483  0035               _ucStatusProtocol:
1484  0035 00            	ds.b	1
1485                     	xdef	_ucStatusProtocol
1486  0036               _ucStatusProtocol3:
1487  0036 00            	ds.b	1
1488                     	xdef	_ucStatusProtocol3
1489  0037               _ucStatusProtocol2:
1490  0037 00            	ds.b	1
1491                     	xdef	_ucStatusProtocol2
1492  0038               _ucNumberUart:
1493  0038 00            	ds.b	1
1494                     	xdef	_ucNumberUart
1495  0039               _ucNumberUart3:
1496  0039 00            	ds.b	1
1497                     	xdef	_ucNumberUart3
1498  003a               _ucNumberUart2:
1499  003a 00            	ds.b	1
1500                     	xdef	_ucNumberUart2
1501                     	xdef	_lf00
1502                     	xdef	_hf00
1503                     	xdef	_le00
1504                     	xdef	_he00
1505                     	xref	_JX_BL_Change
1506                     	xref	_MemcpyFunc
1507                     	xdef	_DG_DebugPrintfFun
1508                     	xdef	_GetVavleStat
1509                     	xdef	_CJ_T188ProtocolReadAdd
1510                     	xdef	_VavleOperateFun
1511                     	xdef	_GatherMeterFun
1512                     	xdef	_CJ_T188ProtocolGM
1513                     	xdef	_GetSysTemTick
1514                     	xdef	_InitializeProtocol
1515                     	xdef	_fixTaskProtocolDebug
1516                     	xdef	_g_nValveStat
1517                     	xref	_GPIO_WriteBit
1537                     	xref	c_ltor
1538                     	xref	c_xymvx
1539                     	end
