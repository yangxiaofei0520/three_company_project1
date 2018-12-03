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
 519                     ; 625 u8 CJ_T188ProtocolGM(void)
 519                     ; 626 {
 521                     	switch	.text
 522  0000               _CJ_T188ProtocolGM:
 524  0000 521a          	subw	sp,#26
 525       0000001a      OFST:	set	26
 528                     ; 627 	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
 530  0002 96            	ldw	x,sp
 531  0003 5c            	incw	x
 532  0004 90ae0040      	ldw	y,#L102_nAddr
 533  0008 a607          	ld	a,#7
 534  000a cd0000        	call	c_xymvx
 536                     ; 628 	u8 nTempBuf[19]  = {0};
 538  000d 96            	ldw	x,sp
 539  000e 1c0008        	addw	x,#OFST-18
 540  0011 90ae0047      	ldw	y,#L302_nTempBuf
 541  0015 a613          	ld	a,#19
 542  0017 cd0000        	call	c_xymvx
 544                     ; 630 	SetPortMeterPowerOn();
 546  001a 4b01          	push	#1
 547  001c 4b08          	push	#8
 548  001e ae5000        	ldw	x,#20480
 549  0021 cd0000        	call	_GPIO_WriteBit
 551  0024 85            	popw	x
 552                     ; 631 	UC_SleepFunc(GM_DELAY);
 554  0025 ae03e8        	ldw	x,#1000
 555  0028 89            	pushw	x
 556  0029 5f            	clrw	x
 557  002a 89            	pushw	x
 558  002b cd0000        	call	_UC_SleepFunc
 560  002e 5b04          	addw	sp,#4
 561                     ; 633 	if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
 561                     ; 634 		READDATA, NULL, 0, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
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
 585                     ; 636 		JX_BL_Change(4, &nTempBuf[0]);
 587  0054 96            	ldw	x,sp
 588  0055 1c0008        	addw	x,#OFST-18
 589  0058 89            	pushw	x
 590  0059 ae0004        	ldw	x,#4
 591  005c cd0000        	call	_JX_BL_Change
 593  005f 85            	popw	x
 594                     ; 637 		MemcpyFunc((u8*)&tyParameter.Value, &nTempBuf[0], 4);		
 596  0060 4b04          	push	#4
 597  0062 96            	ldw	x,sp
 598  0063 1c0009        	addw	x,#OFST-17
 599  0066 89            	pushw	x
 600  0067 ae0002        	ldw	x,#_tyParameter+2
 601  006a cd0000        	call	_MemcpyFunc
 603  006d 5b03          	addw	sp,#3
 604                     ; 642 		g_nValveStat = GetBoardVavleStat();
 606  006f cd03d8        	call	_GetBoardVavleStat
 608  0072 c70008        	ld	_g_nValveStat,a
 609                     ; 647 		return TRUE;
 611  0075 a601          	ld	a,#1
 613  0077 2017          	jra	L62
 614  0079               L532:
 615                     ; 649 	SetPortMeterPowerOff();	
 617  0079 4b00          	push	#0
 618  007b 4b08          	push	#8
 619  007d ae5000        	ldw	x,#20480
 620  0080 cd0000        	call	_GPIO_WriteBit
 622  0083 85            	popw	x
 623                     ; 650 	UC_SleepFunc(GM_PWROFFDELAY); //add by maronglang 20160428
 625  0084 ae0064        	ldw	x,#100
 626  0087 89            	pushw	x
 627  0088 5f            	clrw	x
 628  0089 89            	pushw	x
 629  008a cd0000        	call	_UC_SleepFunc
 631  008d 5b04          	addw	sp,#4
 632                     ; 652 	return FALSE;
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
 711                     ; 663 u8 CJ_T188ProtocolReadAdd(u8* pnOutAddr)
 711                     ; 664 {
 712                     	switch	.text
 713  0093               _CJ_T188ProtocolReadAdd:
 715  0093 89            	pushw	x
 716  0094 5213          	subw	sp,#19
 717       00000013      OFST:	set	19
 720                     ; 665 	u8 nAddr[7] = {0xAA,0xAA,0xAA,0xAA,0xAA,0xAA,0xAA}; //广播标志
 722  0096 96            	ldw	x,sp
 723  0097 5c            	incw	x
 724  0098 90ae005a      	ldw	y,#L732_nAddr
 725  009c a607          	ld	a,#7
 726  009e cd0000        	call	c_xymvx
 728                     ; 666 	u8 nTempBuf[12]  = {0};
 730  00a1 96            	ldw	x,sp
 731  00a2 1c0008        	addw	x,#OFST-11
 732  00a5 90ae0061      	ldw	y,#L142_nTempBuf
 733  00a9 a60c          	ld	a,#12
 734  00ab cd0000        	call	c_xymvx
 736                     ; 668 	SetPortMeterPowerOn();
 738  00ae 4b01          	push	#1
 739  00b0 4b08          	push	#8
 740  00b2 ae5000        	ldw	x,#20480
 741  00b5 cd0000        	call	_GPIO_WriteBit
 743  00b8 85            	popw	x
 744                     ; 669 	UC_SleepFunc(GM_DELAY);
 746  00b9 ae03e8        	ldw	x,#1000
 747  00bc 89            	pushw	x
 748  00bd 5f            	clrw	x
 749  00be 89            	pushw	x
 750  00bf cd0000        	call	_UC_SleepFunc
 752  00c2 5b04          	addw	sp,#4
 753                     ; 671 	if(GM_SUCC == CJ188GatherMeter(PTR_CJ_T188, nAddr, 
 753                     ; 672 		READADDR, NULL, 0, nTempBuf, sizeof(nTempBuf), NULL, GM_TIMEOUT))
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
 777                     ; 674 		MemcpyFunc(pnOutAddr, nTempBuf, 7);
 779  00e8 4b07          	push	#7
 780  00ea 96            	ldw	x,sp
 781  00eb 1c0009        	addw	x,#OFST-10
 782  00ee 89            	pushw	x
 783  00ef 1e17          	ldw	x,(OFST+4,sp)
 784  00f1 cd0000        	call	_MemcpyFunc
 786  00f4 5b03          	addw	sp,#3
 787                     ; 675 		return TRUE;
 789  00f6 a601          	ld	a,#1
 791  00f8 200c          	jra	L44
 792  00fa               L172:
 793                     ; 677 	SetPortMeterPowerOff();	  
 795  00fa 4b00          	push	#0
 796  00fc 4b08          	push	#8
 797  00fe ae5000        	ldw	x,#20480
 798  0101 cd0000        	call	_GPIO_WriteBit
 800  0104 4f            	clr	a
 801  0105 85            	popw	x
 802                     ; 678 	return FALSE;
 805  0106               L44:
 807  0106 5b15          	addw	sp,#21
 808  0108 81            	ret	
 892                     ; 778 unsigned short CRC16check(unsigned char *pcrc, unsigned char count)
 892                     ; 779 {
 893                     	switch	.text
 894  0109               _CRC16check:
 896  0109 89            	pushw	x
 897  010a 5208          	subw	sp,#8
 898       00000008      OFST:	set	8
 901                     ; 780 	unsigned short crc16       = 0xA001;
 903  010c aea001        	ldw	x,#40961
 904  010f 1f03          	ldw	(OFST-5,sp),x
 905                     ; 781 	unsigned short crcregister = 0xFFFF;
 907  0111 aeffff        	ldw	x,#65535
 908  0114 1f07          	ldw	(OFST-1,sp),x
 909                     ; 782 	unsigned char  nTmp = 0, nCnt = 0, i = 0, j = 0;
 911  0116 0f01          	clr	(OFST-7,sp)
 914  0118 0f02          	clr	(OFST-6,sp)
 919                     ; 784 	for(i = 0; i < count; i++)
 921  011a 0f05          	clr	(OFST-3,sp)
 923  011c 203b          	jra	L333
 924  011e               L723:
 925                     ; 786 		crcregister = ((unsigned short)pcrc[i]^crcregister);	
 927  011e 7b09          	ld	a,(OFST+1,sp)
 928  0120 97            	ld	xl,a
 929  0121 7b0a          	ld	a,(OFST+2,sp)
 930  0123 1b05          	add	a,(OFST-3,sp)
 931  0125 2401          	jrnc	L05
 932  0127 5c            	incw	x
 933  0128               L05:
 934  0128 02            	rlwa	x,a
 935  0129 f6            	ld	a,(x)
 936  012a 5f            	clrw	x
 937  012b 97            	ld	xl,a
 938  012c 01            	rrwa	x,a
 939  012d 1808          	xor	a,(OFST+0,sp)
 940  012f 01            	rrwa	x,a
 941  0130 1807          	xor	a,(OFST-1,sp)
 942  0132 01            	rrwa	x,a
 943  0133 1f07          	ldw	(OFST-1,sp),x
 944                     ; 788 		for(j = 0; j < 8; j++)
 946  0135 0f06          	clr	(OFST-2,sp)
 947  0137               L733:
 948                     ; 790 			if((crcregister&0x01))   //注意先检测最低位是否为0再移位
 950  0137 7b08          	ld	a,(OFST+0,sp)
 951  0139 a501          	bcp	a,#1
 952  013b 270e          	jreq	L543
 953                     ; 791 				crcregister = ((crcregister>>1)^crc16);
 955  013d 1e07          	ldw	x,(OFST-1,sp)
 956  013f 54            	srlw	x
 957  0140 01            	rrwa	x,a
 958  0141 1804          	xor	a,(OFST-4,sp)
 959  0143 01            	rrwa	x,a
 960  0144 1803          	xor	a,(OFST-5,sp)
 961  0146 01            	rrwa	x,a
 962  0147 1f07          	ldw	(OFST-1,sp),x
 964  0149 2004          	jra	L743
 965  014b               L543:
 966                     ; 793 				crcregister = (crcregister>>1);
 968  014b 0407          	srl	(OFST-1,sp)
 969  014d 0608          	rrc	(OFST+0,sp)
 970  014f               L743:
 971                     ; 788 		for(j = 0; j < 8; j++)
 973  014f 0c06          	inc	(OFST-2,sp)
 976  0151 7b06          	ld	a,(OFST-2,sp)
 977  0153 a108          	cp	a,#8
 978  0155 25e0          	jrult	L733
 979                     ; 784 	for(i = 0; i < count; i++)
 981  0157 0c05          	inc	(OFST-3,sp)
 982  0159               L333:
 985  0159 7b05          	ld	a,(OFST-3,sp)
 986  015b 110d          	cp	a,(OFST+5,sp)
 987  015d 25bf          	jrult	L723
 988                     ; 797 	return(crcregister);
 990  015f 1e07          	ldw	x,(OFST-1,sp)
 993  0161 5b0a          	addw	sp,#10
 994  0163 81            	ret	
1111                     ; 809 uint8_t*  ACR_Modbus_FindFrame(uint8_t* pnRecvBuf, uint16_t wRecvLen, 
1111                     ; 810 								uint16_t *pwFrameLen,uint16_t *pwDatLen, uint8_t *pnDatBuf)
1111                     ; 811 {
1112                     	switch	.text
1113  0164               _ACR_Modbus_FindFrame:
1115  0164 89            	pushw	x
1116  0165 5210          	subw	sp,#16
1117       00000010      OFST:	set	16
1120                     ; 813 	uint16_t  wFrmDatLen = 0, wCrcResult = 0, wFrameCrc = 0;
1126                     ; 817 	for (i=0; (i<wRecvLen) && (pnRecvBuf!=NULL); i++)
1128  0167 5f            	clrw	x
1129  0168 1f0f          	ldw	(OFST-1,sp),x
1130  016a 1f0d          	ldw	(OFST-3,sp),x
1132  016c cc022f        	jra	L524
1133  016f               L124:
1134                     ; 819 		if ((pnRecvBuf[i] != 0) && (pnRecvBuf[i + 1] != 0) && (pnRecvBuf[i + 2] != 0))
1136  016f 72fb0f        	addw	x,(OFST-1,sp)
1137  0172 f6            	ld	a,(x)
1138  0173 2603cc0226    	jreq	L134
1140  0178 1e0f          	ldw	x,(OFST-1,sp)
1141  017a 72fb11        	addw	x,(OFST+1,sp)
1142  017d e601          	ld	a,(1,x)
1143  017f 27f4          	jreq	L134
1145  0181 e602          	ld	a,(2,x)
1146  0183 27f0          	jreq	L134
1147                     ; 822 			wFrmDatLen = (uint16_t)(pnRecvBuf[i + _ACR_LEN_OFFSET]+5);
1149  0185 5f            	clrw	x
1150  0186 97            	ld	xl,a
1151  0187 1c0005        	addw	x,#5
1152  018a 1f0b          	ldw	(OFST-5,sp),x
1153                     ; 823 			if(wRecvLen < wFrmDatLen)
1155  018c 1e15          	ldw	x,(OFST+5,sp)
1156  018e 130b          	cpw	x,(OFST-5,sp)
1157                     ; 825 				return NULL;
1159  0190 2403cc024e    	jrult	L544
1160                     ; 827 			wCrcResult = CRC16check(pnRecvBuf, pnRecvBuf[i + _ACR_LEN_OFFSET]+_ACR_DAT_OFFSET);			
1162  0195 1e0f          	ldw	x,(OFST-1,sp)
1163  0197 72fb11        	addw	x,(OFST+1,sp)
1164  019a e602          	ld	a,(2,x)
1165  019c ab03          	add	a,#3
1166  019e 88            	push	a
1167  019f 1e12          	ldw	x,(OFST+2,sp)
1168  01a1 cd0109        	call	_CRC16check
1170  01a4 84            	pop	a
1171  01a5 1f06          	ldw	(OFST-10,sp),x
1172                     ; 829 			wFrameCrc = pnRecvBuf[i +wFrmDatLen-1];
1174  01a7 1e0f          	ldw	x,(OFST-1,sp)
1175  01a9 72fb0b        	addw	x,(OFST-5,sp)
1176  01ac 5a            	decw	x
1177  01ad 72fb11        	addw	x,(OFST+1,sp)
1178  01b0 f6            	ld	a,(x)
1179  01b1 5f            	clrw	x
1180  01b2 97            	ld	xl,a
1181  01b3 1f09          	ldw	(OFST-7,sp),x
1182                     ; 830 			wFrameCrc = (wFrameCrc<<8);
1184  01b5 7b0a          	ld	a,(OFST-6,sp)
1185  01b7 6b09          	ld	(OFST-7,sp),a
1186  01b9 0f0a          	clr	(OFST-6,sp)
1187                     ; 831 			wFrameCrc += pnRecvBuf[i +wFrmDatLen-2];
1189  01bb 1e0f          	ldw	x,(OFST-1,sp)
1190  01bd 72fb0b        	addw	x,(OFST-5,sp)
1191  01c0 1d0002        	subw	x,#2
1192  01c3 72fb11        	addw	x,(OFST+1,sp)
1193  01c6 f6            	ld	a,(x)
1194  01c7 1b0a          	add	a,(OFST-6,sp)
1195  01c9 6b0a          	ld	(OFST-6,sp),a
1196  01cb 2402          	jrnc	L65
1197  01cd 0c09          	inc	(OFST-7,sp)
1198  01cf               L65:
1199                     ; 834 			if ((wFrameCrc == wCrcResult) &&
1199                     ; 835 				 ((i+wFrmDatLen) <= wRecvLen))
1201  01cf 1e09          	ldw	x,(OFST-7,sp)
1202  01d1 1306          	cpw	x,(OFST-10,sp)
1203  01d3 2651          	jrne	L134
1205  01d5 1e15          	ldw	x,(OFST+5,sp)
1206  01d7 cd0000        	call	c_uitolx
1208  01da 96            	ldw	x,sp
1209  01db 5c            	incw	x
1210  01dc cd0000        	call	c_rtol
1212  01df 1e0b          	ldw	x,(OFST-5,sp)
1213  01e1 cd0000        	call	c_uitolx
1215  01e4 96            	ldw	x,sp
1216  01e5 1c000d        	addw	x,#OFST-3
1217  01e8 cd0000        	call	c_ladd
1219  01eb 96            	ldw	x,sp
1220  01ec 5c            	incw	x
1221  01ed cd0000        	call	c_lcmp
1223  01f0 2234          	jrugt	L134
1224                     ; 838 				nCmd = pnRecvBuf[i + _ACR_CMD_OFFSET];
1226                     ; 841 				if (pwDatLen != NULL)
1228  01f2 1e19          	ldw	x,(OFST+9,sp)
1229  01f4 271b          	jreq	L734
1230                     ; 843 					nLen = (uint16_t)pnRecvBuf[i +  _ACR_LEN_OFFSET];
1232  01f6 1e0f          	ldw	x,(OFST-1,sp)
1233  01f8 72fb11        	addw	x,(OFST+1,sp)
1234  01fb e602          	ld	a,(2,x)
1235  01fd 6b08          	ld	(OFST-8,sp),a
1236                     ; 844 					if (nLen  == 0)
1238  01ff 2605          	jrne	L144
1239                     ; 846 						wFrmDatLen -= 1;
1241  0201 1e0b          	ldw	x,(OFST-5,sp)
1242  0203 5a            	decw	x
1243  0204 1f0b          	ldw	(OFST-5,sp),x
1244  0206               L144:
1245                     ; 848 					*pwFrameLen = wFrmDatLen;
1247  0206 1e17          	ldw	x,(OFST+7,sp)
1248  0208 160b          	ldw	y,(OFST-5,sp)
1249  020a ff            	ldw	(x),y
1250                     ; 849 					*pwDatLen   = nLen;
1252  020b 5f            	clrw	x
1253  020c 97            	ld	xl,a
1254  020d 1619          	ldw	y,(OFST+9,sp)
1255  020f 90ff          	ldw	(y),x
1256  0211               L734:
1257                     ; 853 				if (pnDatBuf != NULL)
1259  0211 1e1b          	ldw	x,(OFST+11,sp)
1260  0213 2709          	jreq	L344
1261                     ; 855 					pnDatBuf[0] = pnRecvBuf[i];
1263  0215 1e11          	ldw	x,(OFST+1,sp)
1264  0217 72fb0f        	addw	x,(OFST-1,sp)
1265  021a f6            	ld	a,(x)
1266  021b 1e1b          	ldw	x,(OFST+11,sp)
1267  021d f7            	ld	(x),a
1268  021e               L344:
1269                     ; 859 				return (pnRecvBuf+i);
1271  021e 1e11          	ldw	x,(OFST+1,sp)
1272  0220 72fb0f        	addw	x,(OFST-1,sp)
1274  0223               L06:
1276  0223 5b12          	addw	sp,#18
1277  0225 81            	ret	
1278  0226               L134:
1279                     ; 817 	for (i=0; (i<wRecvLen) && (pnRecvBuf!=NULL); i++)
1281  0226 96            	ldw	x,sp
1282  0227 1c000d        	addw	x,#OFST-3
1283  022a a601          	ld	a,#1
1284  022c cd0000        	call	c_lgadc
1286  022f               L524:
1289  022f 1e15          	ldw	x,(OFST+5,sp)
1290  0231 cd0000        	call	c_uitolx
1292  0234 96            	ldw	x,sp
1293  0235 5c            	incw	x
1294  0236 cd0000        	call	c_rtol
1296  0239 96            	ldw	x,sp
1297  023a 1c000d        	addw	x,#OFST-3
1298  023d cd0000        	call	c_ltor
1300  0240 96            	ldw	x,sp
1301  0241 5c            	incw	x
1302  0242 cd0000        	call	c_lcmp
1304  0245 2407          	jruge	L544
1306  0247 1e11          	ldw	x,(OFST+1,sp)
1307  0249 2703cc016f    	jrne	L124
1308  024e               L544:
1309                     ; 864 	return (NULL);
1312  024e 5f            	clrw	x
1314  024f 20d2          	jra	L06
1317                     	switch	.const
1318  006d               L744_nSendBuf:
1319  006d 00            	dc.b	0
1320  006e 03            	dc.b	3
1321  006f 00            	dc.b	0
1322  0070 16            	dc.b	22
1323  0071 00            	dc.b	0
1324  0072 02            	dc.b	2
1325  0073 24            	dc.b	36
1326  0074 1e            	dc.b	30
1327  0075               L154_nBuf:
1328  0075 3a            	dc.b	58
1329  0076 2b            	dc.b	43
1330  0077 a5            	dc.b	165
1331  0078 84            	dc.b	132
1445                     	switch	.const
1446  0079               L021:
1447  0079 000003e9      	dc.l	1001
1448                     ; 875 u32 MODBUS_GetPizeometer(u8 nCmd)
1448                     ; 876 {
1449                     	switch	.text
1450  0251               _MODBUS_GetPizeometer:
1452  0251 88            	push	a
1453  0252 521b          	subw	sp,#27
1454       0000001b      OFST:	set	27
1457                     ; 877 	u8 nSendBuf[8] = {0x00,0x03,0x00,0x16,0x00,0x02,0x24,0x1e}; //抄表  
1459  0254 96            	ldw	x,sp
1460  0255 1c0005        	addw	x,#OFST-22
1461  0258 90ae006d      	ldw	y,#L744_nSendBuf
1462  025c a608          	ld	a,#8
1463  025e cd0000        	call	c_xymvx
1465                     ; 880 	u8 nRecvlen = 0;
1467                     ; 881 	u16 wRevFrameLen = 0, wFrameLen = 0;
1469  0261 5f            	clrw	x
1470  0262 1f12          	ldw	(OFST-9,sp),x
1473  0264 1f18          	ldw	(OFST-3,sp),x
1474                     ; 882 	float dwPressure = 0.0;
1476  0266 ce0086        	ldw	x,L125+2
1477  0269 1f16          	ldw	(OFST-5,sp),x
1478  026b ce0084        	ldw	x,L125
1479  026e 1f14          	ldw	(OFST-7,sp),x
1480                     ; 883 	u32 dwPizeometer = INVALID_DATA;
1482  0270 aeeeee        	ldw	x,#61166
1483  0273 1f0f          	ldw	(OFST-12,sp),x
1484  0275 1f0d          	ldw	(OFST-14,sp),x
1485                     ; 884 	u8* pnBuf = NULL;
1487                     ; 885 	u8 nBuf[4] = {0x3a,0x2b,0xa5,0x84};
1489  0277 96            	ldw	x,sp
1490  0278 5c            	incw	x
1491  0279 90ae0075      	ldw	y,#L154_nBuf
1492  027d a604          	ld	a,#4
1493  027f cd0000        	call	c_xymvx
1495                     ; 887 	SetPortMeterPowerOn();
1497  0282 4b01          	push	#1
1498  0284 4b08          	push	#8
1499  0286 ae5000        	ldw	x,#20480
1500  0289 cd0000        	call	_GPIO_WriteBit
1502  028c 85            	popw	x
1503                     ; 888 	if(READ_CMD == nCmd)
1505  028d 7b1c          	ld	a,(OFST+1,sp)
1506  028f 260f          	jrne	L525
1507                     ; 890 		MemcpyFunc(aucUartTxBuffer,nSendBuf,8);
1509  0291 4b08          	push	#8
1510  0293 96            	ldw	x,sp
1511  0294 1c0006        	addw	x,#OFST-21
1512  0297 89            	pushw	x
1513  0298 ae0000        	ldw	x,#_aucUartTxBuffer
1514  029b cd0000        	call	_MemcpyFunc
1516  029e 5b03          	addw	sp,#3
1517  02a0               L525:
1518                     ; 892 	ClearRxBuff();
1520  02a0 cd0000        	call	_ClearRxBuff
1522                     ; 893 	SetBusUartBaudate(BAUDRATE_9600);	
1524  02a3 a604          	ld	a,#4
1525  02a5 cd0000        	call	_SetBusUartBaudate
1527                     ; 894 	SetBusUart(COM_2, PARITY_NULL);		//设置串口通道号
1529  02a8 5f            	clrw	x
1530  02a9 a602          	ld	a,#2
1531  02ab 95            	ld	xh,a
1532  02ac cd0000        	call	_SetBusUart
1534                     ; 895 	UC_SleepFunc(3000); //add by maronglang 20160428
1536  02af ae0bb8        	ldw	x,#3000
1537  02b2 cd039e        	call	LC002
1538                     ; 897 	DecIoModeChange(PULLUPOUTPUT);
1540  02b5 a601          	ld	a,#1
1541  02b7 cd0000        	call	_DecIoModeChange
1543                     ; 898 	SetPortRS485Tx();		
1545  02ba 4b01          	push	#1
1546  02bc 4b10          	push	#16
1547  02be ae5000        	ldw	x,#20480
1548  02c1 cd0000        	call	_GPIO_WriteBit
1550  02c4 a608          	ld	a,#8
1551  02c6 85            	popw	x
1552                     ; 900 	StartSendBusUartGroup(8);	
1554  02c7 cd0000        	call	_StartSendBusUartGroup
1556                     ; 901 	SetPortRS485Rx();
1558  02ca 4b00          	push	#0
1559  02cc 4b10          	push	#16
1560  02ce ae5000        	ldw	x,#20480
1561  02d1 cd0000        	call	_GPIO_WriteBit
1563  02d4 85            	popw	x
1564                     ; 902 	UC_SleepFunc(GM_PWROFFDELAY); //add by maronglang 20160428
1566  02d5 ae0064        	ldw	x,#100
1567  02d8 cd039e        	call	LC002
1568                     ; 903 	dwTime = GetSysTemTick();
1570  02db cd053e        	call	_GetSysTemTick
1572  02de ae0000        	ldw	x,#_dwTime
1573  02e1 cd0000        	call	c_rtol
1575  02e4               L725:
1576                     ; 907 		FeedSoftWareIwdg();
1578  02e4 cd0000        	call	_FeedSoftWareIwdg
1580                     ; 908 		dwNowTime = GetSysTemTick();
1582  02e7 cd053e        	call	_GetSysTemTick
1584  02ea ae0004        	ldw	x,#_dwNowTime
1585  02ed cd0000        	call	c_rtol
1587                     ; 909 		if (dwTime < dwNowTime)
1589  02f0 cd03a7        	call	LC003
1590  02f3 cd0000        	call	c_lcmp
1592  02f6 240d          	jruge	L335
1593                     ; 911 	         if(dwNowTime - dwTime > GM_DELAY)
1595  02f8 cd0000        	call	c_ltor
1597  02fb ae0000        	ldw	x,#_dwTime
1598  02fe cd03b1        	call	LC004
1600  0301 250a          	jrult	L735
1601                     ; 913 	         	break;
1603  0303 2064          	jra	L135
1604  0305               L335:
1605                     ; 916 	    else if ((dwTime - dwNowTime) > GM_DELAY)
1607  0305 cd03a7        	call	LC003
1608  0308 cd03b1        	call	LC004
1610  030b 245c          	jruge	L135
1611                     ; 918 	    	break;
1613  030d               L735:
1614                     ; 922 		if(0 >= CheckRevDataLen())
1616  030d cd0000        	call	_CheckRevDataLen
1618  0310 4d            	tnz	a
1619  0311 27d1          	jreq	L725
1620                     ; 924 			continue;
1622                     ; 926 		nRecvlen = CheckRevDataLen();
1624  0313 cd0000        	call	_CheckRevDataLen
1626  0316 6b11          	ld	(OFST-10,sp),a
1627                     ; 927 		wFrameLen = 0;
1629  0318 5f            	clrw	x
1630  0319 1f18          	ldw	(OFST-3,sp),x
1631                     ; 930 		pnBuf = ACR_Modbus_FindFrame(GetUartRxBuf(), 
1631                     ; 931 									nRecvlen, &wRevFrameLen, &wFrameLen, NULL);
1633  031b 89            	pushw	x
1634  031c 96            	ldw	x,sp
1635  031d 1c001a        	addw	x,#OFST-1
1636  0320 89            	pushw	x
1637  0321 1d0006        	subw	x,#6
1638  0324 89            	pushw	x
1639  0325 7b17          	ld	a,(OFST-4,sp)
1640  0327 5f            	clrw	x
1641  0328 97            	ld	xl,a
1642  0329 89            	pushw	x
1643  032a cd0000        	call	_GetUartRxBuf
1645  032d cd0164        	call	_ACR_Modbus_FindFrame
1647  0330 5b08          	addw	sp,#8
1648  0332 1f1a          	ldw	(OFST-1,sp),x
1649                     ; 933 		if ((pnBuf != NULL) && (wRevFrameLen >= 4) )
1651  0334 27ae          	jreq	L725
1653  0336 1e12          	ldw	x,(OFST-9,sp)
1654  0338 a30004        	cpw	x,#4
1655  033b 25a7          	jrult	L725
1656                     ; 935 			if (pnBuf[1] == 0x03)
1658  033d 1e1a          	ldw	x,(OFST-1,sp)
1659  033f e601          	ld	a,(1,x)
1660  0341 a103          	cp	a,#3
1661  0343 269f          	jrne	L725
1662                     ; 937 				MemcpyFunc((u8*)&dwPressure, &pnBuf[_ACR_DAT_OFFSET], wFrameLen);				
1664  0345 7b19          	ld	a,(OFST-2,sp)
1665  0347 88            	push	a
1666  0348 1e1b          	ldw	x,(OFST+0,sp)
1667  034a 1c0003        	addw	x,#3
1668  034d 89            	pushw	x
1669  034e 96            	ldw	x,sp
1670  034f 1c0017        	addw	x,#OFST-4
1671  0352 cd0000        	call	_MemcpyFunc
1673  0355 5b03          	addw	sp,#3
1674                     ; 938 				dwPizeometer = JX_FloatToBin(dwPressure);				
1676  0357 1e16          	ldw	x,(OFST-5,sp)
1677  0359 89            	pushw	x
1678  035a 1e16          	ldw	x,(OFST-5,sp)
1679  035c 89            	pushw	x
1680  035d cd0000        	call	_JX_FloatToBin
1682  0360 5b04          	addw	sp,#4
1683  0362 96            	ldw	x,sp
1684  0363 1c000d        	addw	x,#OFST-14
1685  0366 cd0000        	call	c_rtol
1687                     ; 939 				break;
1688  0369               L135:
1689                     ; 949 	ClearRxBuff();
1691  0369 cd0000        	call	_ClearRxBuff
1693                     ; 950 	DecIoModeChange(FLOATINPUT);
1695  036c 4f            	clr	a
1696  036d cd0000        	call	_DecIoModeChange
1698                     ; 951 	UC_SleepFunc(GM_PWROFFDELAY); //add by maronglang 20160428	
1700  0370 ae0064        	ldw	x,#100
1701  0373 ad29          	call	LC002
1702                     ; 952 	SetBusUartBaudate(BAUDRATE_2400);	
1704  0375 a602          	ld	a,#2
1705  0377 cd0000        	call	_SetBusUartBaudate
1707                     ; 953 	SetBusUart(COM_2, PARITY_EVEN);		//设置串口通道号
1709  037a ae0003        	ldw	x,#3
1710  037d a602          	ld	a,#2
1711  037f 95            	ld	xh,a
1712  0380 cd0000        	call	_SetBusUart
1714                     ; 954 	if(FALSE == GetTmDebugModeStat())
1716  0383 cd0000        	call	_GetTmDebugModeStat
1718  0386 4d            	tnz	a
1719  0387 260b          	jrne	L155
1720                     ; 956 		SetPortMeterPowerOff(); 
1722  0389 4b00          	push	#0
1723  038b 4b08          	push	#8
1724  038d ae5000        	ldw	x,#20480
1725  0390 cd0000        	call	_GPIO_WriteBit
1727  0393 85            	popw	x
1728  0394               L155:
1729                     ; 958 	return dwPizeometer;
1731  0394 96            	ldw	x,sp
1732  0395 1c000d        	addw	x,#OFST-14
1733  0398 cd0000        	call	c_ltor
1737  039b 5b1c          	addw	sp,#28
1738  039d 81            	ret	
1740  039e               LC002:
1741  039e 89            	pushw	x
1742  039f 5f            	clrw	x
1743  03a0 89            	pushw	x
1744  03a1 cd0000        	call	_UC_SleepFunc
1746  03a4 5b04          	addw	sp,#4
1747  03a6 81            	ret	
1748  03a7               LC003:
1749  03a7 ae0000        	ldw	x,#_dwTime
1750  03aa cd0000        	call	c_ltor
1752  03ad ae0004        	ldw	x,#_dwNowTime
1753  03b0 81            	ret	
1754  03b1               LC004:
1755  03b1 cd0000        	call	c_lsub
1757  03b4 ae0079        	ldw	x,#L021
1758  03b7 cc0000        	jp	c_lcmp
1792                     ; 972 u8 GatherMeterFun(void)
1792                     ; 973 {
1793                     	switch	.text
1794  03ba               _GatherMeterFun:
1796  03ba 88            	push	a
1797       00000001      OFST:	set	1
1800                     ; 974 	u8 nRef = FALSE;
1802  03bb 0f01          	clr	(OFST+0,sp)
1803                     ; 978 	nRef = CJ_T188ProtocolGM();
1805  03bd cd0000        	call	_CJ_T188ProtocolGM
1807  03c0 6b01          	ld	(OFST+0,sp),a
1808                     ; 981 	if(GetTmDebugModeStat())
1810  03c2 cd0000        	call	_GetTmDebugModeStat
1812  03c5 4d            	tnz	a
1813  03c6 270b          	jreq	L765
1814                     ; 983 		SetPortMeterPowerOn();
1816  03c8 4b01          	push	#1
1817  03ca 4b08          	push	#8
1818  03cc ae5000        	ldw	x,#20480
1819  03cf cd0000        	call	_GPIO_WriteBit
1821  03d2 85            	popw	x
1822  03d3               L765:
1823                     ; 985 	return nRef;
1825  03d3 7b01          	ld	a,(OFST+0,sp)
1828  03d5 5b01          	addw	sp,#1
1829  03d7 81            	ret	
1878                     ; 1000 u8 GetBoardVavleStat(void)
1878                     ; 1001 {
1879                     	switch	.text
1880  03d8               _GetBoardVavleStat:
1882  03d8 89            	pushw	x
1883       00000002      OFST:	set	2
1886                     ; 1002 	u8 nMs1 = 0, nMs2 = 0, nVavleStat = VALVE_OPEN;
1892  03d9 7b02          	ld	a,(OFST+0,sp)
1893  03db 97            	ld	xl,a
1894                     ; 1004 	ValveStatIoModeChange(PULLUPINPUT);	
1896  03dc a602          	ld	a,#2
1897  03de cd0000        	call	_ValveStatIoModeChange
1899                     ; 1005 	UC_SleepFunc(3);
1901  03e1 ae0003        	ldw	x,#3
1902  03e4 89            	pushw	x
1903  03e5 5f            	clrw	x
1904  03e6 89            	pushw	x
1905  03e7 cd0000        	call	_UC_SleepFunc
1907  03ea 5b04          	addw	sp,#4
1908                     ; 1006 	nMs1 = GetMs1Stat();
1910  03ec 4b08          	push	#8
1911  03ee ae500f        	ldw	x,#20495
1912  03f1 cd0000        	call	_GPIO_ReadInputDataBit
1914  03f4 5b01          	addw	sp,#1
1915  03f6 6b01          	ld	(OFST-1,sp),a
1916                     ; 1007 	nMs2 = GetMs2Stat();
1918  03f8 4b04          	push	#4
1919  03fa ae500f        	ldw	x,#20495
1920  03fd cd0000        	call	_GPIO_ReadInputDataBit
1922  0400 5b01          	addw	sp,#1
1923  0402 6b02          	ld	(OFST+0,sp),a
1924                     ; 1008 	ValveStatIoModeChange(FLOATINPUT);	
1926  0404 4f            	clr	a
1927  0405 cd0000        	call	_ValveStatIoModeChange
1929                     ; 1010 	if((0 == nMs1)&&(0 != nMs2))
1931  0408 7b01          	ld	a,(OFST-1,sp)
1932  040a 2604          	jrne	L116
1934  040c 0d02          	tnz	(OFST+0,sp)
1935                     ; 1012 		nVavleStat = VALVE_OPEN;
1938  040e 260d          	jrne	LC005
1939  0410               L116:
1940                     ; 1014 	else if((0 != nMs1)&&(0 == nMs2))
1942  0410 7b01          	ld	a,(OFST-1,sp)
1943  0412 2707          	jreq	L516
1945  0414 7b02          	ld	a,(OFST+0,sp)
1946  0416 2603          	jrne	L516
1947                     ; 1016 		nVavleStat = VALVE_CLOSE;
1949  0418 4c            	inc	a
1951  0419 2002          	jp	LC005
1952  041b               L516:
1953                     ; 1020 		nVavleStat = VALVE_ERROR;
1955  041b a603          	ld	a,#3
1956  041d               LC005:
1957                     ; 1023 	return nVavleStat;
1961  041d 85            	popw	x
1962  041e 81            	ret	
2021                     ; 1034 u8 VavleOperateFunExt(u8 nOptCmd)
2021                     ; 1035 {
2022                     	switch	.text
2023  041f               _VavleOperateFunExt:
2025  041f 88            	push	a
2026  0420 5204          	subw	sp,#4
2027       00000004      OFST:	set	4
2030                     ; 1036 	u8 nRef = FALSE, nCnt = 0;
2032  0422 0f03          	clr	(OFST-1,sp)
2035  0424 0f04          	clr	(OFST+0,sp)
2036                     ; 1037 	u16 wVol = 0;
2038  0426 5f            	clrw	x
2039  0427 1f01          	ldw	(OFST-3,sp),x
2040                     ; 1040 	g_nValveStat = GetBoardVavleStat();
2042  0429 adad          	call	_GetBoardVavleStat
2044  042b c70008        	ld	_g_nValveStat,a
2045                     ; 1042 	if(((VALVE_CLOSE == g_nValveStat)&&(VALVECLOSE == nOptCmd))
2045                     ; 1043 		|| ((VALVE_OPEN == g_nValveStat)&&(VALVEOPEN == nOptCmd)))
2047  042e 4a            	dec	a
2048  042f 2606          	jrne	L746
2050  0431 7b05          	ld	a,(OFST+1,sp)
2051  0433 a105          	cp	a,#5
2052  0435 270b          	jreq	L546
2053  0437               L746:
2055  0437 c60008        	ld	a,_g_nValveStat
2056  043a 260b          	jrne	L346
2058  043c 7b05          	ld	a,(OFST+1,sp)
2059  043e a103          	cp	a,#3
2060  0440 2605          	jrne	L346
2061  0442               L546:
2062                     ; 1045 		return TRUE;
2064  0442 a601          	ld	a,#1
2066  0444 cc04d2        	jra	L052
2067  0447               L346:
2068                     ; 1050 		SetPortGsmPowerOn();
2070  0447 4b01          	push	#1
2071  0449 4b10          	push	#16
2072  044b ae500a        	ldw	x,#20490
2073  044e cd0000        	call	_GPIO_WriteBit
2075  0451 85            	popw	x
2076                     ; 1053 	MotoVccOn();	
2078  0452 4b01          	push	#1
2079  0454 4b02          	push	#2
2080  0456 ae500f        	ldw	x,#20495
2081  0459 cd0000        	call	_GPIO_WriteBit
2083  045c 85            	popw	x
2084                     ; 1054 	UC_SleepFunc(2000);
2086  045d ae07d0        	ldw	x,#2000
2087  0460 89            	pushw	x
2088  0461 5f            	clrw	x
2089  0462 89            	pushw	x
2090  0463 cd0000        	call	_UC_SleepFunc
2092  0466 5b04          	addw	sp,#4
2093                     ; 1073 	if(VALVECLOSE == nOptCmd)
2095  0468 7b05          	ld	a,(OFST+1,sp)
2096  046a a105          	cp	a,#5
2097  046c 2621          	jrne	L156
2098                     ; 1075 		MotoPosiHigh();
2100  046e 4b01          	push	#1
2101  0470 4b02          	push	#2
2102  0472 ae5005        	ldw	x,#20485
2103  0475 cd0000        	call	_GPIO_WriteBit
2105  0478 85            	popw	x
2106                     ; 1076 		MotoNegaLow();
2108  0479 ad6c          	call	LC008
2109                     ; 1077 		nCnt = 0;
2111  047b 0f04          	clr	(OFST+0,sp)
2112  047d               L356:
2113                     ; 1080 			UC_SleepFunc(VAVLE_OPT_DELAY);
2115  047d ad56          	call	LC007
2116                     ; 1082 			if(VALVE_CLOSE == g_nValveStat)
2118  047f 4a            	dec	a
2119                     ; 1084 				nRef = TRUE;
2120                     ; 1085 				break;
2122  0480 271e          	jreq	LC006
2123                     ; 1087 			nCnt++;			
2125  0482 0c04          	inc	(OFST+0,sp)
2126                     ; 1088 			FeedSoftWareIwdg();
2128  0484 cd0000        	call	_FeedSoftWareIwdg
2130                     ; 1089 		}while(VAVLE_TIMEOUT>nCnt);
2132  0487 7b04          	ld	a,(OFST+0,sp)
2133  0489 a128          	cp	a,#40
2134  048b 25f0          	jrult	L356
2135  048d 2021          	jra	L366
2136  048f               L156:
2137                     ; 1093 		MotoPosiLow();
2139  048f ad62          	call	LC009
2140                     ; 1094 		MotoNegaHigh();
2142  0491 4b01          	push	#1
2143  0493 4b01          	push	#1
2144  0495 ae5005        	ldw	x,#20485
2145  0498 cd0000        	call	_GPIO_WriteBit
2147  049b 85            	popw	x
2148  049c               L566:
2149                     ; 1097 			UC_SleepFunc(VAVLE_OPT_DELAY);
2151  049c ad37          	call	LC007
2152                     ; 1099 			if(VALVE_OPEN == g_nValveStat)
2154  049e 2605          	jrne	L376
2155                     ; 1101 				nRef = TRUE;
2157  04a0               LC006:
2159  04a0 4c            	inc	a
2160  04a1 6b03          	ld	(OFST-1,sp),a
2161                     ; 1102 				break;
2163  04a3 200b          	jra	L366
2164  04a5               L376:
2165                     ; 1104 			nCnt++;			
2167  04a5 0c04          	inc	(OFST+0,sp)
2168                     ; 1105 			FeedSoftWareIwdg();
2170  04a7 cd0000        	call	_FeedSoftWareIwdg
2172                     ; 1106 		}while(VAVLE_TIMEOUT>nCnt);
2174  04aa 7b04          	ld	a,(OFST+0,sp)
2175  04ac a128          	cp	a,#40
2176  04ae 25ec          	jrult	L566
2177  04b0               L366:
2178                     ; 1109 	MotoVccOff();
2180  04b0 4b00          	push	#0
2181  04b2 4b02          	push	#2
2182  04b4 ae500f        	ldw	x,#20495
2183  04b7 cd0000        	call	_GPIO_WriteBit
2185  04ba 85            	popw	x
2186                     ; 1110 	if(GetTmDebugModeStat())
2188  04bb cd0000        	call	_GetTmDebugModeStat
2190  04be 4d            	tnz	a
2191  04bf 270b          	jreq	L576
2192                     ; 1112 		SetPortGsmPowerOff();
2194  04c1 4b00          	push	#0
2195  04c3 4b10          	push	#16
2196  04c5 ae500a        	ldw	x,#20490
2197  04c8 cd0000        	call	_GPIO_WriteBit
2199  04cb 85            	popw	x
2200  04cc               L576:
2201                     ; 1114 	MotoPosiLow();
2203  04cc ad25          	call	LC009
2204                     ; 1115 	MotoNegaLow();	
2206  04ce ad17          	call	LC008
2207                     ; 1117 	return nRef;
2209  04d0 7b03          	ld	a,(OFST-1,sp)
2211  04d2               L052:
2213  04d2 5b05          	addw	sp,#5
2214  04d4 81            	ret	
2216  04d5               LC007:
2217  04d5 ae01f4        	ldw	x,#500
2218  04d8 89            	pushw	x
2219  04d9 5f            	clrw	x
2220  04da 89            	pushw	x
2221  04db cd0000        	call	_UC_SleepFunc
2223  04de 5b04          	addw	sp,#4
2224                     ; 1081 			g_nValveStat = GetBoardVavleStat();
2226  04e0 cd03d8        	call	_GetBoardVavleStat
2228  04e3 c70008        	ld	_g_nValveStat,a
2229  04e6 81            	ret	
2230  04e7               LC008:
2231  04e7 4b00          	push	#0
2232  04e9 4b01          	push	#1
2233  04eb ae5005        	ldw	x,#20485
2234  04ee cd0000        	call	_GPIO_WriteBit
2236  04f1 85            	popw	x
2237  04f2 81            	ret	
2238  04f3               LC009:
2239  04f3 4b00          	push	#0
2240  04f5 4b02          	push	#2
2241  04f7 ae5005        	ldw	x,#20485
2242  04fa cd0000        	call	_GPIO_WriteBit
2244  04fd 85            	popw	x
2245  04fe 81            	ret	
2268                     ; 1128 u8 GetVavleStat(void)
2268                     ; 1129 {
2269                     	switch	.text
2270  04ff               _GetVavleStat:
2274                     ; 1130 	return g_nValveStat;
2276  04ff c60008        	ld	a,_g_nValveStat
2279  0502 81            	ret	
2319                     ; 1181 u8 VavleOperateFun(u8 nOptCmd)
2319                     ; 1182 {
2320                     	switch	.text
2321  0503               _VavleOperateFun:
2323  0503 88            	push	a
2324       00000001      OFST:	set	1
2327                     ; 1183 	u8 nRef = FALSE;
2329  0504 0f01          	clr	(OFST+0,sp)
2330                     ; 1185 	nRef = VavleOperateFunExt(nOptCmd);
2332  0506 cd041f        	call	_VavleOperateFunExt
2334                     ; 1186 	return nRef;
2338  0509 5b01          	addw	sp,#1
2339  050b 81            	ret	
2374                     ; 1268 u32 DG_DebugPrintfFun(u8 *pnBuf, u8 nLen, u8 nIndex)
2374                     ; 1269 {
2375                     	switch	.text
2376  050c               _DG_DebugPrintfFun:
2380                     ; 1276 }
2383  050c 81            	ret	
2429                     ; 1285 void fixTaskProtocolDebug(void)
2429                     ; 1286 {
2430                     	switch	.text
2431  050d               _fixTaskProtocolDebug:
2433  050d 89            	pushw	x
2434       00000002      OFST:	set	2
2437                     ; 1287 	u8 channel  = 0;
2439                     ; 1288 	u8 nSendLen = 0;
2441  050e 0f02          	clr	(OFST+0,sp)
2442                     ; 1290 	channel = CheckWhichBusUartReceive();		//接收到数据?
2444  0510 cd0000        	call	_CheckWhichBusUartReceive
2446                     ; 1293 	if (COM_2 != CheckWhichBusUartReceive())
2448  0513 cd0000        	call	_CheckWhichBusUartReceive
2450  0516 a102          	cp	a,#2
2451  0518 2622          	jrne	L367
2452                     ; 1295 		return ;
2454                     ; 1298 	UC_SleepFunc(180);
2456  051a ae00b4        	ldw	x,#180
2457  051d 89            	pushw	x
2458  051e 5f            	clrw	x
2459  051f 89            	pushw	x
2460  0520 cd0000        	call	_UC_SleepFunc
2462  0523 5b04          	addw	sp,#4
2463                     ; 1300 	if(0 < (nSendLen = DecodeParameter(GetUartRxBuf(), CheckRevDataLen())))
2465  0525 cd0000        	call	_CheckRevDataLen
2467  0528 88            	push	a
2468  0529 cd0000        	call	_GetUartRxBuf
2470  052c cd0000        	call	_DecodeParameter
2472  052f 5b01          	addw	sp,#1
2473  0531 6b02          	ld	(OFST+0,sp),a
2474  0533 2707          	jreq	L367
2475                     ; 1302 		Protol130Send(nSendLen, COM_2);
2477  0535 ae0002        	ldw	x,#2
2478  0538 95            	ld	xh,a
2479  0539 cd0000        	call	_Protol130Send
2481  053c               L367:
2482                     ; 1310 }
2485  053c 85            	popw	x
2486  053d 81            	ret	
2510                     ; 1322 u32 GetSysTemTick(void)
2510                     ; 1323 {
2511                     	switch	.text
2512  053e               _GetSysTemTick:
2516                     ; 1324 	return g_dwSysTick;
2518  053e ae0000        	ldw	x,#_g_dwSysTick
2522  0541 cc0000        	jp	c_ltor
2525                     	switch	.const
2526  007d               L577_nTmpBuf:
2527  007d 00            	dc.b	0
2528  007e 000000000000  	ds.b	6
2575                     ; 1335 void InitializeProtocol(void)
2575                     ; 1336 {
2576                     	switch	.text
2577  0544               _InitializeProtocol:
2579  0544 5208          	subw	sp,#8
2580       00000008      OFST:	set	8
2583                     ; 1337 	u8 nTmpBuf[7] = {0};
2585  0546 96            	ldw	x,sp
2586  0547 5c            	incw	x
2587  0548 90ae007d      	ldw	y,#L577_nTmpBuf
2588  054c a607          	ld	a,#7
2589  054e cd0000        	call	c_xymvx
2591                     ; 1338 	u8 i = 0;
2593  0551 0f08          	clr	(OFST+0,sp)
2594                     ; 1340 	ucTimerProtocol = 10;
2596  0553 350a002c      	mov	_ucTimerProtocol,#10
2597                     ; 1341 	ucMasterCmd = 0;
2599  0557 725f002b      	clr	_ucMasterCmd
2600                     ; 1342 	ucSlaveCmd = 0;
2602  055b 725f002a      	clr	_ucSlaveCmd
2603                     ; 1343 	ClearRxBuff();
2605  055f cd0000        	call	_ClearRxBuff
2607                     ; 1345 	if ((FALSE == ReadParameterForType((u8*)&tyParameter, sizeof(tyParameter), METER_PARA)))
2609  0562 4b04          	push	#4
2610  0564 4b1a          	push	#26
2611  0566 ae0000        	ldw	x,#_tyParameter
2612  0569 cd0000        	call	_ReadParameterForType
2614  056c 4d            	tnz	a
2615  056d 85            	popw	x
2616  056e 2639          	jrne	L7101
2617                     ; 1348 		tyParameter.Type = COLD_WATER_METER;
2619  0570 35100000      	mov	_tyParameter,#16
2620                     ; 1349 		tyParameter.Status = INIT_STATUS;
2622  0574 725f0001      	clr	_tyParameter+1
2623                     ; 1350 		tyParameter.Password = INIT_PASSWORD;
2625  0578 ae8888        	ldw	x,#34952
2626  057b cf0008        	ldw	_tyParameter+8,x
2627  057e ae6666        	ldw	x,#26214
2628  0581 cf0006        	ldw	_tyParameter+6,x
2629                     ; 1351 		tyParameter.dwPurchaseVal = 0;
2631  0584 5f            	clrw	x
2632  0585 cf000c        	ldw	_tyParameter+12,x
2633  0588 cf000a        	ldw	_tyParameter+10,x
2634                     ; 1352 		tyParameter.nEmergencyVal = 5;
2636  058b 3505000e      	mov	_tyParameter+14,#5
2637                     ; 1353 		tyParameter.nOverBuyFlg = 0;
2639  058f 725f000f      	clr	_tyParameter+15
2640                     ; 1355 		tyParameter.nAlmCtl[0]= 0x00; // 01
2642  0593 725f0014      	clr	_tyParameter+20
2643                     ; 1356 		tyParameter.wBasePress = 500;
2645  0597 ae01f4        	ldw	x,#500
2646  059a cf0012        	ldw	_tyParameter+18,x
2647  059d 5f            	clrw	x
2648  059e cf0010        	ldw	_tyParameter+16,x
2649                     ; 1357 		tyParameter.nUpLmtRate = 20;
2651  05a1 35140018      	mov	_tyParameter+24,#20
2652                     ; 1358 		tyParameter.nDownLmtRate = 20;
2654  05a5 35140019      	mov	_tyParameter+25,#20
2655  05a9               L7101:
2656                     ; 1369 	tyParameter.Value = INVALID_DATA;
2658  05a9 aeeeee        	ldw	x,#61166
2659  05ac cf0004        	ldw	_tyParameter+4,x
2660  05af cf0002        	ldw	_tyParameter+2,x
2661                     ; 1371 	if ((FALSE == ReadParameterForType((u8*)&g_dwTmAddress, sizeof(g_dwTmAddress), TM_ADDRESS_PRAA)))
2663  05b2 4b07          	push	#7
2664  05b4 4b04          	push	#4
2665  05b6 ae0000        	ldw	x,#_g_dwTmAddress
2666  05b9 cd0000        	call	_ReadParameterForType
2668  05bc 4d            	tnz	a
2669  05bd 85            	popw	x
2670  05be 260a          	jrne	L1201
2671                     ; 1373 		g_dwTmAddress = INIT_ADDRESS;
2673  05c0 ae0001        	ldw	x,#1
2674  05c3 cf0002        	ldw	_g_dwTmAddress+2,x
2675  05c6 5f            	clrw	x
2676  05c7 cf0000        	ldw	_g_dwTmAddress,x
2677  05ca               L1201:
2678                     ; 1375 }
2681  05ca 5b08          	addw	sp,#8
2682  05cc 81            	ret	
2752                     	xdef	_VavleOperateFunExt
2753                     	xdef	_ACR_Modbus_FindFrame
2754                     	xdef	_CRC16check
2755                     	xdef	_dwNowTime
2756                     	xdef	_dwTime
2757                     	switch	.bss
2758  0000               _U_TranShort:
2759  0000 0000          	ds.b	2
2760                     	xdef	_U_TranShort
2761                     	xref	_CJ188GatherMeter
2762                     	xref	_ReadParameterForType
2763                     	xref	_UC_SleepFunc
2764                     	xref	_Protol130Send
2765                     	xref	_DecodeParameter
2766                     	xref	_g_dwTmAddress
2767                     	xref	_GetUartRxBuf
2768                     	xref	_ClearRxBuff
2769                     	xref	_CheckRevDataLen
2770                     	xref	_StartSendBusUartGroup
2771                     	xref	_SetBusUart
2772                     	xref	_SetBusUartBaudate
2773                     	xref	_CheckWhichBusUartReceive
2774                     	xref	_ValveStatIoModeChange
2775                     	xref	_DecIoModeChange
2776                     	xref	_FeedSoftWareIwdg
2777                     	xref	_GetTmDebugModeStat
2778                     	xref	_g_dwSysTick
2779                     	xref	_aucUartTxBuffer
2780                     	xref	_tyParameter
2781  0002               _tyJasonSlave:
2782  0002 000000000000  	ds.b	20
2783                     	xdef	_tyJasonSlave
2784  0016               _tyJasonMaster:
2785  0016 000000000000  	ds.b	20
2786                     	xdef	_tyJasonMaster
2787  002a               _ucSlaveCmd:
2788  002a 00            	ds.b	1
2789                     	xdef	_ucSlaveCmd
2790  002b               _ucMasterCmd:
2791  002b 00            	ds.b	1
2792                     	xdef	_ucMasterCmd
2793  002c               _ucTimerProtocol:
2794  002c 00            	ds.b	1
2795                     	xdef	_ucTimerProtocol
2796  002d               _ucTimerProtocol3:
2797  002d 00            	ds.b	1
2798                     	xdef	_ucTimerProtocol3
2799  002e               _ucTimerProtocol2:
2800  002e 00            	ds.b	1
2801                     	xdef	_ucTimerProtocol2
2802  002f               _ucStepUart:
2803  002f 00            	ds.b	1
2804                     	xdef	_ucStepUart
2805  0030               _ucStepUart3:
2806  0030 00            	ds.b	1
2807                     	xdef	_ucStepUart3
2808  0031               _ucStepUart2:
2809  0031 00            	ds.b	1
2810                     	xdef	_ucStepUart2
2811  0032               _ucStepProtocol:
2812  0032 00            	ds.b	1
2813                     	xdef	_ucStepProtocol
2814  0033               _ucStepProtocol3:
2815  0033 00            	ds.b	1
2816                     	xdef	_ucStepProtocol3
2817  0034               _ucStepProtocol2:
2818  0034 00            	ds.b	1
2819                     	xdef	_ucStepProtocol2
2820  0035               _ucStatusProtocol:
2821  0035 00            	ds.b	1
2822                     	xdef	_ucStatusProtocol
2823  0036               _ucStatusProtocol3:
2824  0036 00            	ds.b	1
2825                     	xdef	_ucStatusProtocol3
2826  0037               _ucStatusProtocol2:
2827  0037 00            	ds.b	1
2828                     	xdef	_ucStatusProtocol2
2829  0038               _ucNumberUart:
2830  0038 00            	ds.b	1
2831                     	xdef	_ucNumberUart
2832  0039               _ucNumberUart3:
2833  0039 00            	ds.b	1
2834                     	xdef	_ucNumberUart3
2835  003a               _ucNumberUart2:
2836  003a 00            	ds.b	1
2837                     	xdef	_ucNumberUart2
2838                     	xdef	_lf00
2839                     	xdef	_hf00
2840                     	xdef	_le00
2841                     	xdef	_he00
2842                     	xref	_JX_FloatToBin
2843                     	xref	_JX_BL_Change
2844                     	xref	_MemcpyFunc
2845                     	xdef	_GetBoardVavleStat
2846                     	xdef	_DG_DebugPrintfFun
2847                     	xdef	_MODBUS_GetPizeometer
2848                     	xdef	_GetVavleStat
2849                     	xdef	_CJ_T188ProtocolReadAdd
2850                     	xdef	_VavleOperateFun
2851                     	xdef	_GatherMeterFun
2852                     	xdef	_CJ_T188ProtocolGM
2853                     	xdef	_GetSysTemTick
2854                     	xdef	_InitializeProtocol
2855                     	xdef	_fixTaskProtocolDebug
2856                     	xdef	_g_nValveStat
2857                     	xref	_GPIO_ReadInputDataBit
2858                     	xref	_GPIO_WriteBit
2859                     	switch	.const
2860  0084               L125:
2861  0084 00000000      	dc.w	0,0
2881                     	xref	c_lsub
2882                     	xref	c_ltor
2883                     	xref	c_lgadc
2884                     	xref	c_lcmp
2885                     	xref	c_rtol
2886                     	xref	c_ladd
2887                     	xref	c_uitolx
2888                     	xref	c_xymvx
2889                     	end
