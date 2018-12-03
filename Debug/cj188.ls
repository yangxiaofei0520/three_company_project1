   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               _g_nSeqNum:
   7  0000 00            	dc.b	0
  38                     ; 26 void Comm_Rst(void)
  38                     ; 27 {
  40                     	switch	.text
  41  0000               _Comm_Rst:
  45                     ; 28 	ClearRxBuff();
  47  0000 cd0000        	call	_ClearRxBuff
  49                     ; 29 	comm.status = CJ188_HEAD;//接收超时
  51  0003 725f0026      	clr	_comm+38
  52                     ; 30 }
  55  0007 81            	ret	
 123                     ; 39 void CJ188CommSendData(void)
 123                     ; 40 {
 124                     	switch	.text
 125  0008               _CJ188CommSendData:
 127  0008 5205          	subw	sp,#5
 128       00000005      OFST:	set	5
 131                     ; 41 	u8 i,cs,lenth, nTxLen = 0;
 133                     ; 42 	u8 *pnBuf = NULL;
 135                     ; 44 	pnBuf = aucUartTxBuffer;
 137  000a ae0000        	ldw	x,#_aucUartTxBuffer
 138  000d 1f03          	ldw	(OFST-2,sp),x
 139                     ; 45 	cs = COMM_HEAD;
 141  000f a668          	ld	a,#104
 142  0011 6b01          	ld	(OFST-4,sp),a
 143                     ; 46 	lenth = (u8)(PUBLIC_LENTH+CommF.meter_lenth);
 145  0013 c60009        	ld	a,_comm+9
 146  0016 ab0a          	add	a,#10
 147  0018 6b02          	ld	(OFST-3,sp),a
 148                     ; 48 	for(i=0;i<lenth;i++)
 150  001a 0f05          	clr	(OFST+0,sp)
 152  001c 200b          	jra	L35
 153  001e               L74:
 154                     ; 50 		cs += CommUF.buff[i];
 156  001e 5f            	clrw	x
 157  001f 97            	ld	xl,a
 158  0020 7b01          	ld	a,(OFST-4,sp)
 159  0022 db0000        	add	a,(_comm,x)
 160  0025 6b01          	ld	(OFST-4,sp),a
 161                     ; 48 	for(i=0;i<lenth;i++)
 163  0027 0c05          	inc	(OFST+0,sp)
 164  0029               L35:
 167  0029 7b05          	ld	a,(OFST+0,sp)
 168  002b 1102          	cp	a,(OFST-3,sp)
 169  002d 25ef          	jrult	L74
 170                     ; 52 	for(i=0;i<3;i++) // 3个0xFE引导码
 172  002f 0f05          	clr	(OFST+0,sp)
 173  0031               L75:
 174                     ; 54 		pnBuf[i] = LOND_COND;
 176  0031 7b03          	ld	a,(OFST-2,sp)
 177  0033 97            	ld	xl,a
 178  0034 7b04          	ld	a,(OFST-1,sp)
 179  0036 1b05          	add	a,(OFST+0,sp)
 180  0038 2401          	jrnc	L21
 181  003a 5c            	incw	x
 182  003b               L21:
 183  003b 02            	rlwa	x,a
 184  003c a6fe          	ld	a,#254
 185  003e f7            	ld	(x),a
 186                     ; 52 	for(i=0;i<3;i++) // 3个0xFE引导码
 188  003f 0c05          	inc	(OFST+0,sp)
 191  0041 7b05          	ld	a,(OFST+0,sp)
 192  0043 a103          	cp	a,#3
 193  0045 25ea          	jrult	L75
 194                     ; 57 	pnBuf[i++] = COMM_HEAD;
 196  0047 0c05          	inc	(OFST+0,sp)
 197  0049 5f            	clrw	x
 198  004a 97            	ld	xl,a
 199  004b 72fb03        	addw	x,(OFST-2,sp)
 200  004e a668          	ld	a,#104
 201  0050 f7            	ld	(x),a
 202                     ; 58 	MemcpyFunc(&pnBuf[i], CommUF.buff, lenth);
 204  0051 7b02          	ld	a,(OFST-3,sp)
 205  0053 88            	push	a
 206  0054 ae0000        	ldw	x,#_comm
 207  0057 89            	pushw	x
 208  0058 7b06          	ld	a,(OFST+1,sp)
 209  005a 97            	ld	xl,a
 210  005b 7b07          	ld	a,(OFST+2,sp)
 211  005d 1b08          	add	a,(OFST+3,sp)
 212  005f 2401          	jrnc	L61
 213  0061 5c            	incw	x
 214  0062               L61:
 215  0062 02            	rlwa	x,a
 216  0063 cd0000        	call	_MemcpyFunc
 218  0066 5b03          	addw	sp,#3
 219                     ; 59 	pnBuf[i+lenth] = cs;
 221  0068 7b05          	ld	a,(OFST+0,sp)
 222  006a 5f            	clrw	x
 223  006b 1b02          	add	a,(OFST-3,sp)
 224  006d 59            	rlcw	x
 225  006e 02            	rlwa	x,a
 226  006f 72fb03        	addw	x,(OFST-2,sp)
 227  0072 7b01          	ld	a,(OFST-4,sp)
 228  0074 f7            	ld	(x),a
 229                     ; 60 	pnBuf[i+lenth+1] = COMM_END;
 231  0075 a616          	ld	a,#22
 232  0077 e701          	ld	(1,x),a
 233                     ; 61 	nTxLen = i+lenth+2;
 235  0079 7b05          	ld	a,(OFST+0,sp)
 236  007b 1b02          	add	a,(OFST-3,sp)
 237  007d ab02          	add	a,#2
 238  007f 6b01          	ld	(OFST-4,sp),a
 239                     ; 63 	SetBusUart(COM_2, PARITY_EVEN);		//设置串口通道号
 241  0081 ae0003        	ldw	x,#3
 242  0084 a602          	ld	a,#2
 243  0086 95            	ld	xh,a
 244  0087 cd0000        	call	_SetBusUart
 246                     ; 64 	StartSendBusUartGroup(nTxLen);
 248  008a 7b01          	ld	a,(OFST-4,sp)
 249  008c cd0000        	call	_StartSendBusUartGroup
 251                     ; 65 }
 254  008f 5b05          	addw	sp,#5
 255  0091 81            	ret	
 316                     ; 74 void CJ188SendReadMeter(u8 nPtrType, u8* pnInBuf, u8 nLen)
 316                     ; 75 {
 317                     	switch	.text
 318  0092               _CJ188SendReadMeter:
 320  0092 88            	push	a
 321  0093 88            	push	a
 322       00000001      OFST:	set	1
 325                     ; 76 	u8 nDataLen = 0;
 327  0094 0f01          	clr	(OFST+0,sp)
 328                     ; 78 	CommF.meter_type = 0x10;  //先写死为冷水表
 330  0096 35100000      	mov	_comm,#16
 331                     ; 81 	if(CJ188_READ_VALUE == CommF.meter_cmd)
 333  009a c60008        	ld	a,_comm+8
 334  009d a101          	cp	a,#1
 335  009f 2617          	jrne	L111
 336                     ; 83 		if(PTR_CJ_T188 == nPtrType)
 338  00a1 7b02          	ld	a,(OFST+1,sp)
 339  00a3 4a            	dec	a
 340  00a4 2605          	jrne	L311
 341                     ; 85 			MeterID.meter_ID = CJ188_READ_VALUE_ID;
 343  00a6 ae1f90        	ldw	x,#8080
 345  00a9 2003          	jra	L511
 346  00ab               L311:
 347                     ; 89 			MeterID.meter_ID = CJ188_READ_VALUE_ID1;
 349  00ab ae901f        	ldw	x,#36895
 350  00ae               L511:
 351  00ae cf000a        	ldw	_comm+10,x
 352                     ; 91 		nDataLen = 0x03;
 354  00b1 a603          	ld	a,#3
 355  00b3 6b01          	ld	(OFST+0,sp),a
 356  00b5 c60008        	ld	a,_comm+8
 357  00b8               L111:
 358                     ; 95 	if(CJ188_READ_ADDR == CommF.meter_cmd)
 360  00b8 a103          	cp	a,#3
 361  00ba 2622          	jrne	L711
 362                     ; 97 		MemsetFunc(CommF.meter_addr, 0xAA, sizeof(CommF.meter_addr));
 364  00bc 4b07          	push	#7
 365  00be 4baa          	push	#170
 366  00c0 ae0001        	ldw	x,#_comm+1
 367  00c3 cd0000        	call	_MemsetFunc
 369  00c6 85            	popw	x
 370                     ; 98 		if(PTR_CJ_T188 == nPtrType)
 372  00c7 7b02          	ld	a,(OFST+1,sp)
 373  00c9 4a            	dec	a
 374  00ca 2605          	jrne	L121
 375                     ; 100 			MeterID.meter_ID = CJ188_READ_ADDR_ID;
 377  00cc ae0a81        	ldw	x,#2689
 379  00cf 2003          	jra	L321
 380  00d1               L121:
 381                     ; 104 			MeterID.meter_ID = CJ188_READ_ADDR_ID1;
 383  00d1 ae810a        	ldw	x,#33034
 384  00d4               L321:
 385  00d4 cf000a        	ldw	_comm+10,x
 386                     ; 106 		nDataLen = 0x03;
 388  00d7 a603          	ld	a,#3
 389  00d9 6b01          	ld	(OFST+0,sp),a
 390  00db c60008        	ld	a,_comm+8
 391  00de               L711:
 392                     ; 110 	if(CJ188_WRITE_ADDR == CommF.meter_cmd)
 394  00de a115          	cp	a,#21
 395  00e0 2635          	jrne	L521
 396                     ; 112 		if((NULL != pnInBuf)&&(sizeof(CommTx.buff) > nLen))
 398  00e2 1e05          	ldw	x,(OFST+4,sp)
 399  00e4 2718          	jreq	L721
 401  00e6 7b07          	ld	a,(OFST+6,sp)
 402  00e8 a10a          	cp	a,#10
 403  00ea 2412          	jruge	L721
 404                     ; 114 			nDataLen = 0x03+nLen;    
 406  00ec ab03          	add	a,#3
 407  00ee 6b01          	ld	(OFST+0,sp),a
 408                     ; 115 			MemcpyFunc(&CommUF.buff[PUBLIC_LENTH+3], pnInBuf, nLen); //四字节对齐问题直接用buff进行处理
 410  00f0 7b07          	ld	a,(OFST+6,sp)
 411  00f2 88            	push	a
 412  00f3 1e06          	ldw	x,(OFST+5,sp)
 413  00f5 89            	pushw	x
 414  00f6 ae000d        	ldw	x,#_comm+13
 415  00f9 cd0000        	call	_MemcpyFunc
 417  00fc 5b03          	addw	sp,#3
 418  00fe               L721:
 419                     ; 118 		if(PTR_CJ_T188 == nPtrType)
 421  00fe 7b02          	ld	a,(OFST+1,sp)
 422  0100 4a            	dec	a
 423  0101 2605          	jrne	L131
 424                     ; 120 			MeterID.meter_ID = CJ188_WRITE_ADDR_ID;
 426  0103 ae18a0        	ldw	x,#6304
 428  0106 2003          	jra	L331
 429  0108               L131:
 430                     ; 124 			MeterID.meter_ID = CJ188_WRITE_ADDR_ID1;
 432  0108 aea018        	ldw	x,#40984
 433  010b               L331:
 434  010b cf000a        	ldw	_comm+10,x
 435                     ; 126 		nDataLen = 0x03+nLen;
 437  010e 7b07          	ld	a,(OFST+6,sp)
 438  0110 ab03          	add	a,#3
 439  0112 6b01          	ld	(OFST+0,sp),a
 440  0114 c60008        	ld	a,_comm+8
 441  0117               L521:
 442                     ; 130 	if(CJ188_WRITE_JSVALVE == CommF.meter_cmd)
 444  0117 a12a          	cp	a,#42
 445  0119 262e          	jrne	L531
 446                     ; 132 		if((NULL != pnInBuf)&&(0 < nLen))
 448  011b 1e05          	ldw	x,(OFST+4,sp)
 449  011d 2716          	jreq	L731
 451  011f 7b07          	ld	a,(OFST+6,sp)
 452  0121 2712          	jreq	L731
 453                     ; 134 			nDataLen = 0x03+nLen;    
 455  0123 ab03          	add	a,#3
 456  0125 6b01          	ld	(OFST+0,sp),a
 457                     ; 135 			MemcpyFunc(&CommUF.buff[PUBLIC_LENTH+3], pnInBuf, nLen); //四字节对齐问题直接用buff进行处理
 459  0127 7b07          	ld	a,(OFST+6,sp)
 460  0129 88            	push	a
 461  012a 1e06          	ldw	x,(OFST+5,sp)
 462  012c 89            	pushw	x
 463  012d ae000d        	ldw	x,#_comm+13
 464  0130 cd0000        	call	_MemcpyFunc
 466  0133 5b03          	addw	sp,#3
 467  0135               L731:
 468                     ; 138 		if(PTR_CJ_T188 == nPtrType)
 470  0135 7b02          	ld	a,(OFST+1,sp)
 471  0137 4a            	dec	a
 472  0138 2609          	jrne	L141
 473                     ; 140 			CommF.meter_cmd = CJ188_WRITE_COMMON;
 475  013a 35040008      	mov	_comm+8,#4
 476                     ; 141 			MeterID.meter_ID = CJ188_WRITE_VALVE_ID; //标准188
 478  013e ae17a0        	ldw	x,#6048
 480  0141 2003          	jp	LC001
 481  0143               L141:
 482                     ; 145 			MeterID.meter_ID = CJ188_WRITE_VALVE_ID1; //非标188
 484  0143 aea017        	ldw	x,#40983
 485  0146               LC001:
 486  0146 cf000a        	ldw	_comm+10,x
 487  0149               L531:
 488                     ; 149 	CommF.meter_lenth = nDataLen;		
 490  0149 7b01          	ld	a,(OFST+0,sp)
 491  014b c70009        	ld	_comm+9,a
 492                     ; 150 	CommF.meter_ser = g_nSeqNum++;
 494  014e c60000        	ld	a,_g_nSeqNum
 495  0151 725c0000      	inc	_g_nSeqNum
 496  0155 c7000c        	ld	_comm+12,a
 497                     ; 151 	CJ188CommSendData();
 499  0158 cd0008        	call	_CJ188CommSendData
 501                     ; 152 	return ;
 504  015b 85            	popw	x
 505  015c 81            	ret	
 556                     ; 163 u8 CJ188RecDataPro(u8 nCmd, u8 *pnOutBuf, u8 nOutLen)
 556                     ; 164 {
 557                     	switch	.text
 558  015d               _CJ188RecDataPro:
 560  015d 88            	push	a
 561       00000000      OFST:	set	0
 564                     ; 165 	if(CJ188_READ_VALUE_RE == CommF.meter_cmd)//抄表应答命令
 566  015e c60008        	ld	a,_comm+8
 567  0161 a181          	cp	a,#129
 568  0163 262a          	jrne	L761
 569                     ; 168 		if(3+4+2 > CommF.meter_lenth)
 571  0165 c60009        	ld	a,_comm+9
 572  0168 a109          	cp	a,#9
 573  016a 2403          	jruge	L171
 574                     ; 170 			return FALSE;
 576  016c cc0213        	jp	LC003
 577  016f               L171:
 578                     ; 174 		if((CJ188_READ_VALUE_ID1 != MeterID.meter_ID)&&(CJ188_READ_VALUE_ID != MeterID.meter_ID))
 580  016f ce000a        	ldw	x,_comm+10
 581  0172 a3901f        	cpw	x,#36895
 582  0175 2708          	jreq	L371
 584  0177 a31f90        	cpw	x,#8080
 585  017a 2703          	jreq	L371
 586                     ; 176 			return FALSE;
 588  017c cc0213        	jp	LC003
 589  017f               L371:
 590                     ; 180 		if(SUCCESS_GLOBAL != (JX_FAULT_BIT& CommRxDat.status))
 592  017f 7205001f03    	btjf	_comm+31,#2,L571
 593                     ; 182 			return FALSE;
 595  0184 cc0213        	jp	LC003
 596  0187               L571:
 597                     ; 184 		MemcpyFunc(pnOutBuf, CommRx.buff, nOutLen);
 599  0187 7b06          	ld	a,(OFST+6,sp)
 600  0189 88            	push	a
 601  018a ae000d        	ldw	x,#_comm+13
 604  018d 2027          	jp	LC002
 605  018f               L761:
 606                     ; 186 	else if(CJ188_READ_ADDR_RE == CommF.meter_cmd)// 读表地址
 608  018f a183          	cp	a,#131
 609  0191 262d          	jrne	L102
 610                     ; 189 		if(3 != CommF.meter_lenth)
 612  0193 c60009        	ld	a,_comm+9
 613  0196 a103          	cp	a,#3
 614  0198 2702          	jreq	L302
 615                     ; 191 			return FALSE;
 617  019a 2077          	jp	LC003
 618  019c               L302:
 619                     ; 195 		if((CJ188_READ_ADDR_ID != MeterID.meter_ID)&&(CJ188_READ_ADDR_ID1 != MeterID.meter_ID))
 621  019c ce000a        	ldw	x,_comm+10
 622  019f a30a81        	cpw	x,#2689
 623  01a2 2707          	jreq	L502
 625  01a4 a3810a        	cpw	x,#33034
 626  01a7 2702          	jreq	L502
 627                     ; 197 			return FALSE;
 629  01a9 2068          	jp	LC003
 630  01ab               L502:
 631                     ; 201 		if(NULL == pnOutBuf)
 633  01ab 1e04          	ldw	x,(OFST+4,sp)
 634  01ad 2602          	jrne	L702
 635                     ; 203 			return FALSE;
 637  01af 2062          	jp	LC003
 638  01b1               L702:
 639                     ; 206 		MemcpyFunc(pnOutBuf, CommF.meter_addr, sizeof(CommF.meter_addr));
 641  01b1 4b07          	push	#7
 642  01b3 ae0001        	ldw	x,#_comm+1
 644  01b6               LC002:
 645  01b6 89            	pushw	x
 646  01b7 1e07          	ldw	x,(OFST+7,sp)
 647  01b9 cd0000        	call	_MemcpyFunc
 648  01bc 5b03          	addw	sp,#3
 650  01be 204e          	jra	L771
 651  01c0               L102:
 652                     ; 208 	else if(CJ188_WRITE_ADDR_RE == CommF.meter_cmd)// 写表地址
 654  01c0 a195          	cp	a,#149
 655  01c2 2618          	jrne	L312
 656                     ; 211 		if(3 != CommF.meter_lenth)
 658  01c4 c60009        	ld	a,_comm+9
 659  01c7 a103          	cp	a,#3
 660  01c9 2702          	jreq	L512
 661                     ; 213 			return FALSE;
 663  01cb 2046          	jp	LC003
 664  01cd               L512:
 665                     ; 217 		if((CJ188_WRITE_ADDR_ID1 != MeterID.meter_ID)&&(CJ188_WRITE_ADDR_ID != MeterID.meter_ID))
 667  01cd ce000a        	ldw	x,_comm+10
 668  01d0 a3a018        	cpw	x,#40984
 669  01d3 2739          	jreq	L771
 671  01d5 a318a0        	cpw	x,#6304
 672  01d8 2734          	jreq	L771
 673                     ; 219 			return FALSE;
 675  01da 2037          	jp	LC003
 676  01dc               L312:
 677                     ; 225 		if(3 > CommF.meter_lenth)
 679  01dc c60009        	ld	a,_comm+9
 680  01df a103          	cp	a,#3
 681  01e1 2402          	jruge	L322
 682                     ; 227 			return FALSE;
 684  01e3 202e          	jp	LC003
 685  01e5               L322:
 686                     ; 231 		if((CJ188_WRITE_VALVE_ID1 != MeterID.meter_ID)&&(CJ188_WRITE_VALVE_ID != MeterID.meter_ID))
 688  01e5 ce000a        	ldw	x,_comm+10
 689  01e8 a3a017        	cpw	x,#40983
 690  01eb 2707          	jreq	L522
 692  01ed a317a0        	cpw	x,#6048
 693  01f0 2702          	jreq	L522
 694                     ; 233 			return FALSE;
 696  01f2 201f          	jp	LC003
 697  01f4               L522:
 698                     ; 236 		if((JX_VALVE_OPEN == nCmd)&&(0 != CommRx.buff[0]))
 700  01f4 7b01          	ld	a,(OFST+1,sp)
 701  01f6 a155          	cp	a,#85
 702  01f8 2608          	jrne	L722
 704  01fa 725d000d      	tnz	_comm+13
 705  01fe 2702          	jreq	L722
 706                     ; 238 			return FALSE;
 708  0200 2011          	jp	LC003
 709  0202               L722:
 710                     ; 241 		if((JX_VALVE_CLOSE == nCmd)&&(1 != CommRx.buff[0]))
 712  0202 a199          	cp	a,#153
 713  0204 2608          	jrne	L771
 715  0206 c6000d        	ld	a,_comm+13
 716  0209 4a            	dec	a
 717  020a 2702          	jreq	L771
 718                     ; 243 			return FALSE;
 720  020c 2005          	jp	LC003
 721  020e               L771:
 722                     ; 247 	return TRUE;
 724  020e a601          	ld	a,#1
 727  0210 5b01          	addw	sp,#1
 728  0212 81            	ret	
 730  0213               LC003:
 731  0213 4f            	clr	a
 732                     ; 243 			return FALSE;
 734  0214 5b01          	addw	sp,#1
 735  0216 81            	ret	
 784                     ; 258 void CJ188Comm_SendCmd(u8 nPtrType, u8* pnInBuf, u8 nLen)
 784                     ; 259 {
 785                     	switch	.text
 786  0217               _CJ188Comm_SendCmd:
 788  0217 88            	push	a
 789       00000000      OFST:	set	0
 792                     ; 261 	CJ188SendReadMeter(nPtrType, pnInBuf, nLen);
 794  0218 7b06          	ld	a,(OFST+6,sp)
 795  021a 88            	push	a
 796  021b 1e05          	ldw	x,(OFST+5,sp)
 797  021d 89            	pushw	x
 798  021e 7b04          	ld	a,(OFST+4,sp)
 799  0220 cd0092        	call	_CJ188SendReadMeter
 801  0223 5b03          	addw	sp,#3
 802                     ; 262 	return ;
 805  0225 84            	pop	a
 806  0226 81            	ret	
 809                     .const:	section	.text
 810  0000               L552_nCurrAdd:
 811  0000 00            	dc.b	0
 812  0001 000000000000  	ds.b	6
 900                     ; 273 u8 CJ188Comm_OkProc(u8 nCmd, u8 *pnAddr, u8 *pnOutBuf, u8 nOutLen, u8* pnNewAdd)
 900                     ; 274 {
 901                     	switch	.text
 902  0227               _CJ188Comm_OkProc:
 904  0227 88            	push	a
 905  0228 5208          	subw	sp,#8
 906       00000008      OFST:	set	8
 909                     ; 275 	u8 i = 0;
 911  022a 0f08          	clr	(OFST+0,sp)
 912                     ; 276 	u8 nCurrAdd[7] = {0};
 914  022c 96            	ldw	x,sp
 915  022d 5c            	incw	x
 916  022e 90ae0000      	ldw	y,#L552_nCurrAdd
 917  0232 a607          	ld	a,#7
 918  0234 cd0000        	call	c_xymvx
 920                     ; 278 	MemsetFunc(nCurrAdd, 0, sizeof(nCurrAdd));
 922  0237 4b07          	push	#7
 923  0239 4b00          	push	#0
 924  023b 96            	ldw	x,sp
 925  023c 1c0003        	addw	x,#OFST-5
 926  023f cd0000        	call	_MemsetFunc
 928  0242 c60008        	ld	a,_comm+8
 929  0245 a195          	cp	a,#149
 930  0247 85            	popw	x
 931                     ; 279 	if(CJ188_WRITE_ADDR_RE == CommF.meter_cmd)
 933  0248 2606          	jrne	L713
 934                     ; 281 		MemcpyFunc(nCurrAdd, pnNewAdd, sizeof(nCurrAdd));
 936  024a 4b07          	push	#7
 937  024c 1e12          	ldw	x,(OFST+10,sp)
 940  024e 2004          	jra	L123
 941  0250               L713:
 942                     ; 285 		MemcpyFunc(nCurrAdd, pnAddr, sizeof(nCurrAdd));
 944  0250 4b07          	push	#7
 945  0252 1e0d          	ldw	x,(OFST+5,sp)
 947  0254               L123:
 948  0254 89            	pushw	x
 949  0255 96            	ldw	x,sp
 950  0256 1c0004        	addw	x,#OFST-4
 951  0259 cd0000        	call	_MemcpyFunc
 952  025c 5b03          	addw	sp,#3
 953                     ; 288 	for(i=0;i<7;i++)//确认地址
 955  025e 0f08          	clr	(OFST+0,sp)
 956  0260               L323:
 957                     ; 290 		if((nCurrAdd[i]!=COM_188CODE)&&(CommF.meter_addr[i]!=nCurrAdd[i]))
 959  0260 96            	ldw	x,sp
 960  0261 5c            	incw	x
 961  0262 9f            	ld	a,xl
 962  0263 5e            	swapw	x
 963  0264 1b08          	add	a,(OFST+0,sp)
 964  0266 2401          	jrnc	L46
 965  0268 5c            	incw	x
 966  0269               L46:
 967  0269 02            	rlwa	x,a
 968  026a f6            	ld	a,(x)
 969  026b a1aa          	cp	a,#170
 970  026d 271a          	jreq	L133
 972  026f 96            	ldw	x,sp
 973  0270 5c            	incw	x
 974  0271 9f            	ld	a,xl
 975  0272 5e            	swapw	x
 976  0273 1b08          	add	a,(OFST+0,sp)
 977  0275 2401          	jrnc	L66
 978  0277 5c            	incw	x
 979  0278               L66:
 980  0278 02            	rlwa	x,a
 981  0279 7b08          	ld	a,(OFST+0,sp)
 982  027b 905f          	clrw	y
 983  027d 9097          	ld	yl,a
 984  027f 90d60001      	ld	a,(_comm+1,y)
 985  0283 f1            	cp	a,(x)
 986  0284 2703          	jreq	L133
 987                     ; 292 			return FALSE;//不是广播地址而且地址错误则不处理
 989  0286 4f            	clr	a
 991  0287 2015          	jra	L27
 992  0289               L133:
 993                     ; 288 	for(i=0;i<7;i++)//确认地址
 995  0289 0c08          	inc	(OFST+0,sp)
 998  028b 7b08          	ld	a,(OFST+0,sp)
 999  028d a107          	cp	a,#7
1000  028f 25cf          	jrult	L323
1001                     ; 296 	return CJ188RecDataPro(nCmd, pnOutBuf, nOutLen);
1003  0291 7b10          	ld	a,(OFST+8,sp)
1004  0293 88            	push	a
1005  0294 1e0f          	ldw	x,(OFST+7,sp)
1006  0296 89            	pushw	x
1007  0297 7b0c          	ld	a,(OFST+4,sp)
1008  0299 cd015d        	call	_CJ188RecDataPro
1010  029c 5b03          	addw	sp,#3
1012  029e               L27:
1014  029e 5b09          	addw	sp,#9
1015  02a0 81            	ret	
1018                     	switch	.data
1019  0001               L333_nDatRevCnt:
1020  0001 00            	dc.b	0
1079                     ; 307 s8 CJ188RecProc(u8 Data)
1079                     ; 308 {
1080                     	switch	.text
1081  02a1               _CJ188RecProc:
1083  02a1 88            	push	a
1084  02a2 5203          	subw	sp,#3
1085       00000003      OFST:	set	3
1088                     ; 312 	switch(comm.status)
1090  02a4 c60026        	ld	a,_comm+38
1092                     ; 412 			break;
1093  02a7 272a          	jreq	L533
1094  02a9 4a            	dec	a
1095  02aa 273b          	jreq	L733
1096  02ac 4a            	dec	a
1097  02ad 2744          	jreq	L143
1098  02af 4a            	dec	a
1099  02b0 2761          	jreq	L343
1100  02b2 4a            	dec	a
1101  02b3 276a          	jreq	L543
1102  02b5 4a            	dec	a
1103  02b6 2777          	jreq	L743
1104  02b8 4a            	dec	a
1105  02b9 2603cc0357    	jreq	L153
1106  02be 4a            	dec	a
1107  02bf 2603cc0376    	jreq	L353
1108  02c4 4a            	dec	a
1109  02c5 2603cc039a    	jreq	L553
1110  02ca 4a            	dec	a
1111  02cb 2603cc03a5    	jreq	L753
1112  02d0 cc03fe        	jra	L163
1113  02d3               L533:
1114                     ; 314 		case CJ188_HEAD://接收头
1114                     ; 315 			if(Data==COMM_HEAD)
1116  02d3 7b04          	ld	a,(OFST+1,sp)
1117  02d5 a168          	cp	a,#104
1118  02d7 2703cc0402    	jrne	L114
1119                     ; 317 				comm.status = CJ188_TYPE;
1121  02dc 35010026      	mov	_comm+38,#1
1122                     ; 318 				comm.cnt = 0;
1124  02e0 725f0025      	clr	_comm+37
1125  02e4 cc0402        	jra	L114
1126  02e7               L733:
1127                     ; 321 		case CJ188_TYPE://接收表类型
1127                     ; 322 			CommF.meter_type  = Data;
1129  02e7 7b04          	ld	a,(OFST+1,sp)
1130  02e9 c70000        	ld	_comm,a
1131                     ; 323 			comm.status = CJ188_ADDR;
1133  02ec 35020026      	mov	_comm+38,#2
1134                     ; 324 			break;
1136  02f0 cc0402        	jra	L114
1137  02f3               L143:
1138                     ; 325 		case CJ188_ADDR://接收7个地址位
1138                     ; 326 			CommF.meter_addr[comm.cnt++] = Data;
1140  02f3 c60025        	ld	a,_comm+37
1141  02f6 725c0025      	inc	_comm+37
1142  02fa 5f            	clrw	x
1143  02fb 97            	ld	xl,a
1144  02fc 7b04          	ld	a,(OFST+1,sp)
1145  02fe d70001        	ld	(_comm+1,x),a
1146                     ; 327 			if(comm.cnt>=7)
1148  0301 c60025        	ld	a,_comm+37
1149  0304 a107          	cp	a,#7
1150  0306 25e8          	jrult	L114
1151                     ; 329 				comm.cnt = 0;
1153  0308 725f0025      	clr	_comm+37
1154                     ; 330 				comm.status = CJ188_CMD;
1156  030c 35030026      	mov	_comm+38,#3
1157  0310 cc0402        	jra	L114
1158  0313               L343:
1159                     ; 333 		case CJ188_CMD://接收操作命令
1159                     ; 334 			CommF.meter_cmd = Data;
1161  0313 7b04          	ld	a,(OFST+1,sp)
1162  0315 c70008        	ld	_comm+8,a
1163                     ; 335 			comm.status = CJ188_LENTH;			
1165  0318 35040026      	mov	_comm+38,#4
1166                     ; 336 			break;			
1168  031c cc0402        	jra	L114
1169  031f               L543:
1170                     ; 337 		case CJ188_LENTH://接收到数据长度
1170                     ; 338 			CommF.meter_lenth = Data;
1172  031f 7b04          	ld	a,(OFST+1,sp)
1173  0321 c70009        	ld	_comm+9,a
1174                     ; 339 			comm.cnt = 0;
1176  0324 725f0025      	clr	_comm+37
1177                     ; 340 			comm.status = CJ188_ID;
1179  0328 35050026      	mov	_comm+38,#5
1180                     ; 341 			break;
1182  032c cc0402        	jra	L114
1183  032f               L743:
1184                     ; 342 		case CJ188_ID://接收2个标识位
1184                     ; 343 			MeterID.meter_id[comm.cnt++] = Data;
1186  032f c60025        	ld	a,_comm+37
1187  0332 725c0025      	inc	_comm+37
1188  0336 5f            	clrw	x
1189  0337 97            	ld	xl,a
1190  0338 7b04          	ld	a,(OFST+1,sp)
1191  033a d7000a        	ld	(_comm+10,x),a
1192                     ; 344 			if(comm.cnt>=CommF.meter_lenth)//如果lenth==2则跳至校验
1194  033d c60025        	ld	a,_comm+37
1195  0340 c10009        	cp	a,_comm+9
1196  0343 2507          	jrult	L714
1197                     ; 346 				comm.status = CJ188_CS;
1199  0345 35080026      	mov	_comm+38,#8
1201  0349 cc0402        	jra	L114
1202  034c               L714:
1203                     ; 348 			else if(comm.cnt>=2)
1205  034c a102          	cp	a,#2
1206  034e 25f9          	jrult	L114
1207                     ; 350 				comm.status = CJ188_SER;
1209  0350 35060026      	mov	_comm+38,#6
1210  0354 cc0402        	jra	L114
1211  0357               L153:
1212                     ; 353 		case CJ188_SER://接收1个序号
1212                     ; 354 			CommF.meter_ser = Data;
1214  0357 7b04          	ld	a,(OFST+1,sp)
1215  0359 c7000c        	ld	_comm+12,a
1216                     ; 355 			comm.cnt++;
1218  035c 725c0025      	inc	_comm+37
1219                     ; 357 			if(comm.cnt<CommF.meter_lenth)//如果lenth>3则有数据 
1221  0360 c60025        	ld	a,_comm+37
1222  0363 c10009        	cp	a,_comm+9
1223  0366 2407          	jruge	L524
1224                     ; 359 				comm.status = CJ188_DATA;
1226  0368 35070026      	mov	_comm+38,#7
1228  036c cc0402        	jra	L114
1229  036f               L524:
1230                     ; 363 				comm.status = CJ188_CS;
1232  036f 35080026      	mov	_comm+38,#8
1233  0373 cc0402        	jra	L114
1234  0376               L353:
1235                     ; 366 		case CJ188_DATA://接收有效数据 只有长度大于3的才会出现
1235                     ; 367 			CommRx.buff[nDatRevCnt++] = Data; //从单片机移植过来导致出现4字节对齐问题已经修改
1237  0376 c60001        	ld	a,L333_nDatRevCnt
1238  0379 725c0001      	inc	L333_nDatRevCnt
1239  037d 5f            	clrw	x
1240  037e 97            	ld	xl,a
1241  037f 7b04          	ld	a,(OFST+1,sp)
1242  0381 d7000d        	ld	(_comm+13,x),a
1243                     ; 368 			comm.cnt++;
1245  0384 725c0025      	inc	_comm+37
1246                     ; 369 			if(comm.cnt==CommF.meter_lenth)
1248  0388 c60025        	ld	a,_comm+37
1249  038b c10009        	cp	a,_comm+9
1250  038e 2672          	jrne	L114
1251                     ; 371 				nDatRevCnt = 0;
1253  0390 725f0001      	clr	L333_nDatRevCnt
1254                     ; 372 				comm.status = CJ188_CS;
1256  0394 35080026      	mov	_comm+38,#8
1257  0398 2068          	jra	L114
1258  039a               L553:
1259                     ; 375 		case CJ188_CS://接收校验和 
1259                     ; 376 			comm.checksum = Data;
1261  039a 7b04          	ld	a,(OFST+1,sp)
1262  039c c70024        	ld	_comm+36,a
1263                     ; 377 			comm.status = CJ188_END;
1265  039f 35090026      	mov	_comm+38,#9
1266                     ; 378 			break;
1268  03a3 205d          	jra	L114
1269  03a5               L753:
1270                     ; 379 		case CJ188_END://接收尾
1270                     ; 380 			if(Data==COMM_END)
1272  03a5 7b04          	ld	a,(OFST+1,sp)
1273  03a7 a116          	cp	a,#22
1274  03a9 2653          	jrne	L163
1275                     ; 382 				checksum = COMM_HEAD;
1277  03ab a668          	ld	a,#104
1278  03ad 6b02          	ld	(OFST-1,sp),a
1279                     ; 390 				lenth = (u8)(PUBLIC_LENTH+3); //特殊处理4字节对齐问题
1281  03af a60d          	ld	a,#13
1282  03b1 6b01          	ld	(OFST-2,sp),a
1283                     ; 391 				for(i=0;i<lenth;i++)
1285  03b3 0f03          	clr	(OFST+0,sp)
1287  03b5 200b          	jra	L144
1288  03b7               L534:
1289                     ; 393 					checksum += CommUF.buff[i];
1291  03b7 5f            	clrw	x
1292  03b8 97            	ld	xl,a
1293  03b9 7b02          	ld	a,(OFST-1,sp)
1294  03bb db0000        	add	a,(_comm,x)
1295  03be 6b02          	ld	(OFST-1,sp),a
1296                     ; 391 				for(i=0;i<lenth;i++)
1298  03c0 0c03          	inc	(OFST+0,sp)
1299  03c2               L144:
1302  03c2 7b03          	ld	a,(OFST+0,sp)
1303  03c4 1101          	cp	a,(OFST-2,sp)
1304  03c6 25ef          	jrult	L534
1305                     ; 395 				for(i = 0; i < CommF.meter_lenth - 3; i++)
1307  03c8 0f03          	clr	(OFST+0,sp)
1309  03ca 200b          	jra	L154
1310  03cc               L544:
1311                     ; 397 					checksum += CommRx.buff[i];
1313  03cc 5f            	clrw	x
1314  03cd 97            	ld	xl,a
1315  03ce 7b02          	ld	a,(OFST-1,sp)
1316  03d0 db000d        	add	a,(_comm+13,x)
1317  03d3 6b02          	ld	(OFST-1,sp),a
1318                     ; 395 				for(i = 0; i < CommF.meter_lenth - 3; i++)
1320  03d5 0c03          	inc	(OFST+0,sp)
1321  03d7               L154:
1324  03d7 c60009        	ld	a,_comm+9
1325  03da 5f            	clrw	x
1326  03db 97            	ld	xl,a
1327  03dc 1d0003        	subw	x,#3
1328  03df 7b03          	ld	a,(OFST+0,sp)
1329  03e1 905f          	clrw	y
1330  03e3 9097          	ld	yl,a
1331  03e5 90bf01        	ldw	c_y+1,y
1332  03e8 b301          	cpw	x,c_y+1
1333  03ea 2ce0          	jrsgt	L544
1334                     ; 400 				if(checksum == comm.checksum)
1336  03ec 7b02          	ld	a,(OFST-1,sp)
1337  03ee c10024        	cp	a,_comm+36
1338  03f1 2607          	jrne	L554
1339                     ; 402 					comm.flagok = 1;//接收数据OK 
1341  03f3 a601          	ld	a,#1
1342  03f5 c70027        	ld	_comm+39,a
1343                     ; 403 					return TRUE;
1346  03f8 2009          	jra	L67
1347  03fa               L554:
1348                     ; 407 					comm.flag_error = 1;					
1350  03fa 35010028      	mov	_comm+40,#1
1351  03fe               L163:
1352                     ; 410 		default:
1352                     ; 411 			comm.status = CJ188_HEAD;
1354  03fe 725f0026      	clr	_comm+38
1355                     ; 412 			break;
1357  0402               L114:
1358                     ; 415 	return FALSE;
1360  0402 4f            	clr	a
1362  0403               L67:
1364  0403 5b04          	addw	sp,#4
1365  0405 81            	ret	
1445                     ; 427 s8 CJ188RecvData(u32 dwTimeMs)
1445                     ; 428 {
1446                     	switch	.text
1447  0406               _CJ188RecvData:
1449  0406 520f          	subw	sp,#15
1450       0000000f      OFST:	set	15
1453                     ; 429 	u8  nLoop     = 0, nData = 0;
1455  0408 0f01          	clr	(OFST-14,sp)
1458                     ; 430 	u32 dwTimeOut = 0, dwTime = 0, dwNowTime = 0;
1460  040a 96            	ldw	x,sp
1461  040b 1c0004        	addw	x,#OFST-11
1462  040e cd0000        	call	c_ltor
1466  0411 96            	ldw	x,sp
1467  0412 1c0008        	addw	x,#OFST-7
1468  0415 cd0000        	call	c_ltor
1472  0418 96            	ldw	x,sp
1473  0419 1c000c        	addw	x,#OFST-3
1474  041c cd0000        	call	c_ltor
1476                     ; 431 	u8 nRxHead    = 0;
1478  041f 0f02          	clr	(OFST-13,sp)
1479                     ; 433 	dwTimeOut = dwTimeMs;
1481  0421 1e14          	ldw	x,(OFST+5,sp)
1482  0423 1f06          	ldw	(OFST-9,sp),x
1483  0425 1e12          	ldw	x,(OFST+3,sp)
1484  0427 1f04          	ldw	(OFST-11,sp),x
1485                     ; 436 	FeedSoftWareIwdg();
1487  0429 cd0000        	call	_FeedSoftWareIwdg
1489                     ; 438 	dwTime = GetSysTemTick();
1491  042c cd0000        	call	_GetSysTemTick
1493  042f 96            	ldw	x,sp
1494  0430 1c0008        	addw	x,#OFST-7
1495  0433 cd0000        	call	c_rtol
1497  0436               L115:
1498                     ; 443 		FeedSoftWareIwdg();
1500  0436 cd0000        	call	_FeedSoftWareIwdg
1502                     ; 444 		dwNowTime = GetSysTemTick();
1504  0439 cd0000        	call	_GetSysTemTick
1506  043c 96            	ldw	x,sp
1507  043d 1c000c        	addw	x,#OFST-3
1508  0440 cd0000        	call	c_rtol
1510                     ; 445 		if (dwTime < dwNowTime)
1512  0443 96            	ldw	x,sp
1513  0444 1c0008        	addw	x,#OFST-7
1514  0447 cd0000        	call	c_ltor
1516  044a 96            	ldw	x,sp
1517  044b 1c000c        	addw	x,#OFST-3
1518  044e cd0000        	call	c_lcmp
1520  0451 96            	ldw	x,sp
1521  0452 240c          	jruge	L515
1522                     ; 447 	         if(dwNowTime - dwTime > dwTimeOut)
1524  0454 1c000c        	addw	x,#OFST-3
1525  0457 cd0000        	call	c_ltor
1527  045a 96            	ldw	x,sp
1528  045b 1c0008        	addw	x,#OFST-7
1531                     ; 449 	         	break;
1533  045e 200a          	jra	L315
1534  0460               L515:
1535                     ; 452 	    else if ((dwTime - dwNowTime) > dwTimeOut)
1537  0460 1c0008        	addw	x,#OFST-7
1538  0463 cd0000        	call	c_ltor
1540  0466 96            	ldw	x,sp
1541  0467 1c000c        	addw	x,#OFST-3
1544                     ; 454 	    	break;
1545  046a               L315:
1546  046a cd0000        	call	c_lsub
1547  046d 96            	ldw	x,sp
1548  046e 1c0004        	addw	x,#OFST-11
1549  0471 cd0000        	call	c_lcmp
1550  0474 2306          	jrule	L125
1551                     ; 472 	Comm_Rst();
1553  0476 cd0000        	call	_Comm_Rst
1555                     ; 473 	return FALSE;
1557  0479 4f            	clr	a
1559  047a 2016          	jra	L421
1560  047c               L125:
1561                     ; 458 		if(0 >= CheckRevDataLen())
1563  047c cd0000        	call	_CheckRevDataLen
1565  047f 4d            	tnz	a
1566  0480 27b4          	jreq	L115
1567                     ; 460 			continue;
1569                     ; 464 		nData = GetBusUartData();
1571  0482 cd0000        	call	_GetBusUartData
1573  0485 6b03          	ld	(OFST-12,sp),a
1574                     ; 465 		if(CJ188RecProc(nData))
1576  0487 cd02a1        	call	_CJ188RecProc
1578  048a 4d            	tnz	a
1579  048b 27a9          	jreq	L115
1580                     ; 467 			Comm_Rst();
1582  048d cd0000        	call	_Comm_Rst
1584                     ; 468 			return TRUE;
1586  0490 a601          	ld	a,#1
1588  0492               L421:
1590  0492 5b0f          	addw	sp,#15
1591  0494 81            	ret	
1594                     	switch	.const
1595  0007               L135_nTmpBuf:
1596  0007 00            	dc.b	0
1597  0008 000000000000  	ds.b	18
1728                     ; 485 s8 CJ188GatherMeter(u8 nPtrType, u8 *pnAddr, u8 nCmd, u8 *pnInBuf, 
1728                     ; 486 					u8 nLen, u8 *pnOutBuf, u8 nOutLen, u8 *pnOutAdd, u32 dwTimeMs)
1728                     ; 487 {
1729                     	switch	.text
1730  0495               _CJ188GatherMeter:
1732  0495 88            	push	a
1733  0496 521c          	subw	sp,#28
1734       0000001c      OFST:	set	28
1737                     ; 488 	u8 nDataLen = 0;
1739  0498 0f01          	clr	(OFST-27,sp)
1740                     ; 489 	s8 nRef = 0;
1742                     ; 491 	u8 nTmpBuf[19]  = {0};
1744  049a 96            	ldw	x,sp
1745  049b 1c0002        	addw	x,#OFST-26
1746  049e 90ae0007      	ldw	y,#L135_nTmpBuf
1747  04a2 a613          	ld	a,#19
1748  04a4 cd0000        	call	c_xymvx
1750                     ; 492 	u8 nTmpCmd     = 0;
1752                     ; 494 	MemsetFunc(nTmpBuf, 0, sizeof(nTmpBuf));
1754  04a7 4b13          	push	#19
1755  04a9 4b00          	push	#0
1756  04ab 96            	ldw	x,sp
1757  04ac 1c0004        	addw	x,#OFST-24
1758  04af cd0000        	call	_MemsetFunc
1760  04b2 85            	popw	x
1761                     ; 496 	Comm_Rst();
1763  04b3 cd0000        	call	_Comm_Rst
1765                     ; 499 	MemcpyFunc(CommF.meter_addr, pnAddr, sizeof(CommF.meter_addr));
1767  04b6 4b07          	push	#7
1768  04b8 1e21          	ldw	x,(OFST+5,sp)
1769  04ba 89            	pushw	x
1770  04bb ae0001        	ldw	x,#_comm+1
1771  04be cd0000        	call	_MemcpyFunc
1773  04c1 5b03          	addw	sp,#3
1774                     ; 502 	if(READDATA == nCmd)
1776  04c3 7b22          	ld	a,(OFST+6,sp)
1777  04c5 a101          	cp	a,#1
1778  04c7 2604          	jrne	L706
1779                     ; 504 		nTmpCmd = CJ188_READ_VALUE;
1781  04c9 a601          	ld	a,#1
1783  04cb 2038          	jp	LC004
1784  04cd               L706:
1785                     ; 506 	else if(WRITEADDR == nCmd)
1787  04cd a102          	cp	a,#2
1788  04cf 261a          	jrne	L316
1789                     ; 508 		nTmpCmd = CJ188_WRITE_ADDR;
1791  04d1 a615          	ld	a,#21
1792  04d3 6b1c          	ld	(OFST+0,sp),a
1793                     ; 509 		MemcpyFunc(nNewAddr, pnInBuf, sizeof(nNewAddr));
1795  04d5 4b07          	push	#7
1796  04d7 1e24          	ldw	x,(OFST+8,sp)
1797  04d9 89            	pushw	x
1798  04da 96            	ldw	x,sp
1799  04db 1c0018        	addw	x,#OFST-4
1800  04de cd0000        	call	_MemcpyFunc
1802  04e1 5b03          	addw	sp,#3
1803                     ; 510 		nDataLen = sizeof(nNewAddr);
1805  04e3 a607          	ld	a,#7
1806  04e5 6b01          	ld	(OFST-27,sp),a
1808  04e7 7b1c          	ld	a,(OFST+0,sp)
1809  04e9 201c          	jra	L116
1810  04eb               L316:
1811                     ; 512 	else if(READADDR == nCmd)
1813  04eb a106          	cp	a,#6
1814  04ed 2604          	jrne	L716
1815                     ; 514 		nTmpCmd = CJ188_READ_ADDR;
1817  04ef a603          	ld	a,#3
1819  04f1 2012          	jp	LC004
1820  04f3               L716:
1821                     ; 518 		if(VALVEOPEN == nCmd)
1823  04f3 a103          	cp	a,#3
1824  04f5 2604          	jrne	L326
1825                     ; 520 			nNewAddr[0] = JX_VALVE_OPEN;
1827  04f7 a655          	ld	a,#85
1829  04f9 2002          	jra	L526
1830  04fb               L326:
1831                     ; 524 			nNewAddr[0] = JX_VALVE_CLOSE;
1833  04fb a699          	ld	a,#153
1834  04fd               L526:
1835  04fd 6b15          	ld	(OFST-7,sp),a
1836                     ; 526 		nDataLen = 1;
1838  04ff a601          	ld	a,#1
1839  0501 6b01          	ld	(OFST-27,sp),a
1840                     ; 527 		nTmpCmd     = CJ188_WRITE_JSVALVE;
1842  0503 a62a          	ld	a,#42
1843  0505               LC004:
1844  0505 6b1c          	ld	(OFST+0,sp),a
1845  0507               L116:
1846                     ; 529 	CommF.meter_cmd = nTmpCmd;
1848  0507 c70008        	ld	_comm+8,a
1849                     ; 532 	DecIoModeChange(PULLUPOUTPUT);
1851  050a a601          	ld	a,#1
1852  050c cd0000        	call	_DecIoModeChange
1854                     ; 533 	SetPortRS485Tx();
1856  050f 4b01          	push	#1
1857  0511 4b10          	push	#16
1858  0513 ae5000        	ldw	x,#20480
1859  0516 cd0000        	call	_GPIO_WriteBit
1861  0519 85            	popw	x
1862                     ; 537 	CJ188Comm_SendCmd(nPtrType, nNewAddr, nDataLen);
1864  051a 7b01          	ld	a,(OFST-27,sp)
1865  051c 88            	push	a
1866  051d 96            	ldw	x,sp
1867  051e 1c0016        	addw	x,#OFST-6
1868  0521 89            	pushw	x
1869  0522 7b20          	ld	a,(OFST+4,sp)
1870  0524 cd0217        	call	_CJ188Comm_SendCmd
1872  0527 5b03          	addw	sp,#3
1873                     ; 540 	SetPortRS485Rx();
1875  0529 4b00          	push	#0
1876  052b 4b10          	push	#16
1877  052d ae5000        	ldw	x,#20480
1878  0530 cd0000        	call	_GPIO_WriteBit
1880  0533 85            	popw	x
1881                     ; 544 	nRef = CJ188RecvData(dwTimeMs);
1883  0534 1e2d          	ldw	x,(OFST+17,sp)
1884  0536 89            	pushw	x
1885  0537 1e2d          	ldw	x,(OFST+17,sp)
1886  0539 89            	pushw	x
1887  053a cd0406        	call	_CJ188RecvData
1889  053d 5b04          	addw	sp,#4
1890  053f 6b1c          	ld	(OFST+0,sp),a
1891                     ; 546 	DecIoModeChange(FLOATINPUT);
1893  0541 4f            	clr	a
1894  0542 cd0000        	call	_DecIoModeChange
1896                     ; 549 	if(FALSE > nRef)
1898  0545 7b1c          	ld	a,(OFST+0,sp)
1899  0547 2a04          	jrpl	L726
1900                     ; 551 		return GM_EXIT;
1902  0549 a6ff          	ld	a,#255
1904  054b 2003          	jra	L261
1905  054d               L726:
1906                     ; 553 	if(FALSE == nRef)
1908  054d 2604          	jrne	L136
1909                     ; 555 		return GM_FAIL;
1911  054f               LC005:
1915  054f 4f            	clr	a
1917  0550               L261:
1919  0550 5b1d          	addw	sp,#29
1920  0552 81            	ret	
1921  0553               L136:
1922                     ; 558 	if(comm.flagok)//接收数据OK 则处理
1924  0553 c60027        	ld	a,_comm+39
1925  0556 27f7          	jreq	LC005
1926                     ; 561 		nRef = CJ188Comm_OkProc(nNewAddr[0], pnAddr, nTmpBuf, sizeof(nTmpBuf), nNewAddr);
1928  0558 96            	ldw	x,sp
1929  0559 1c0015        	addw	x,#OFST-7
1930  055c 89            	pushw	x
1931  055d 4b13          	push	#19
1932  055f 1d0013        	subw	x,#19
1933  0562 89            	pushw	x
1934  0563 1e25          	ldw	x,(OFST+9,sp)
1935  0565 89            	pushw	x
1936  0566 7b1c          	ld	a,(OFST+0,sp)
1937  0568 cd0227        	call	_CJ188Comm_OkProc
1939  056b 5b07          	addw	sp,#7
1940  056d 6b1c          	ld	(OFST+0,sp),a
1941                     ; 562 		comm.flagok = 0;
1943  056f 725f0027      	clr	_comm+39
1944                     ; 563 		comm.flag_error = 0;
1946  0573 725f0028      	clr	_comm+40
1947                     ; 564 		if(FALSE == nRef)
1949  0577 7b1c          	ld	a,(OFST+0,sp)
1950                     ; 566 			return GM_FAIL;
1952  0579 27d4          	jreq	LC005
1953                     ; 569 		if((CJ188_READ_VALUE_RE == CommF.meter_cmd)&&((NULL != pnOutBuf)&&(nOutLen > 0)))
1955  057b c60008        	ld	a,_comm+8
1956  057e a181          	cp	a,#129
1957  0580 2615          	jrne	L736
1959  0582 1e26          	ldw	x,(OFST+10,sp)
1960  0584 2711          	jreq	L736
1962  0586 7b28          	ld	a,(OFST+12,sp)
1963  0588 270d          	jreq	L736
1964                     ; 571 			MemcpyFunc(pnOutBuf, &nTmpBuf[0], nOutLen);
1966  058a 88            	push	a
1967  058b 96            	ldw	x,sp
1968  058c 1c0003        	addw	x,#OFST-25
1969  058f 89            	pushw	x
1970  0590 1e29          	ldw	x,(OFST+13,sp)
1971  0592 cd0000        	call	_MemcpyFunc
1973  0595 5b03          	addw	sp,#3
1974  0597               L736:
1975                     ; 574 		if((CJ188_READ_ADDR_RE == CommF.meter_cmd)&&(NULL != nTmpBuf))
1977  0597 c60008        	ld	a,_comm+8
1978  059a a183          	cp	a,#131
1979  059c 2610          	jrne	L146
1981  059e 96            	ldw	x,sp
1982  059f 1c0002        	addw	x,#OFST-26
1983  05a2 270a          	jreq	L146
1984                     ; 576 			MemcpyFunc(pnOutBuf, nTmpBuf, 7);
1986  05a4 4b07          	push	#7
1987  05a6 89            	pushw	x
1988  05a7 1e29          	ldw	x,(OFST+13,sp)
1989  05a9 cd0000        	call	_MemcpyFunc
1991  05ac 5b03          	addw	sp,#3
1992  05ae               L146:
1993                     ; 579 		if((READDATA == nCmd)||(READADDR == nCmd))
1995  05ae 7b22          	ld	a,(OFST+6,sp)
1996  05b0 a101          	cp	a,#1
1997  05b2 2704          	jreq	L546
1999  05b4 a106          	cp	a,#6
2000  05b6 2604          	jrne	L346
2001  05b8               L546:
2002                     ; 581 			return GM_SUCC;
2004  05b8 a602          	ld	a,#2
2006  05ba 2094          	jra	L261
2007  05bc               L346:
2008                     ; 583 		else if(WRITEADDR == nCmd)
2010  05bc a102          	cp	a,#2
2011  05be 2604          	jrne	L156
2012                     ; 585 			return GM_WR_ADDR;
2014  05c0 a603          	ld	a,#3
2016  05c2 208c          	jra	L261
2017  05c4               L156:
2018                     ; 587 		else if(VALVEOPEN == nCmd)
2020  05c4 a103          	cp	a,#3
2021  05c6 2604          	jrne	L556
2022                     ; 589 			return GM_ON_VALVE;
2024  05c8 a604          	ld	a,#4
2026  05ca 2084          	jra	L261
2027  05cc               L556:
2028                     ; 591 		else if(VALVECLOSE == nCmd)
2030  05cc a105          	cp	a,#5
2031  05ce 2703cc054f    	jrne	LC005
2032                     ; 593 			return GM_OFF_VALVE;
2034  05d3 a605          	ld	a,#5
2036  05d5 cc0550        	jra	L261
2037                     ; 597 			return GM_FAIL;
2039                     ; 600 	return GM_FAIL;
2548                     	xdef	_CJ188RecvData
2549                     	xdef	_CJ188RecProc
2550                     	xdef	_CJ188Comm_OkProc
2551                     	xdef	_CJ188Comm_SendCmd
2552                     	xdef	_CJ188RecDataPro
2553                     	xdef	_CJ188SendReadMeter
2554                     	xdef	_CJ188CommSendData
2555                     	xdef	_Comm_Rst
2556                     	xdef	_g_nSeqNum
2557                     	xref	_ClearRxBuff
2558                     	xref	_CheckRevDataLen
2559                     	xref	_StartSendBusUartGroup
2560                     	xref	_SetBusUart
2561                     	xref	_GetBusUartData
2562                     	xref	_aucUartTxBuffer
2563                     	xref	_DecIoModeChange
2564                     	xref	_FeedSoftWareIwdg
2565                     	xdef	_CJ188GatherMeter
2566                     	switch	.bss
2567  0000               _comm:
2568  0000 000000000000  	ds.b	41
2569                     	xdef	_comm
2570                     	xref	_MemcpyFunc
2571                     	xref	_MemsetFunc
2572                     	xref	_GetSysTemTick
2573                     	xref	_GPIO_WriteBit
2574                     	xref.b	c_y
2594                     	xref	c_lsub
2595                     	xref	c_lcmp
2596                     	xref	c_rtol
2597                     	xref	c_ltor
2598                     	xref	c_xymvx
2599                     	end
