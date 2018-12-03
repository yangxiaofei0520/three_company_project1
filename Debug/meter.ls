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
  18  000a               L3_nGmPiezoFlg:
  19  000a 01            	dc.b	1
  84                     .const:	section	.text
  85  0000               L01:
  86  0000 eeeeeeee      	dc.l	-286331154
  87                     ; 205 void JASON_GmPiezometer(u8 nRepFlg)
  87                     ; 206 {
  88                     	scross	off
  89                     	switch	.text
  90  0000               _JASON_GmPiezometer:
  92  0000 88            	push	a
  93  0001 5205          	subw	sp,#5
  94       00000005      OFST:	set	5
  97                     ; 207 	u8 nLoop = 0;
  99                     ; 208 	u32 wPizeometerVol = 0; 
 101  0003 5f            	clrw	x
 102  0004 1f04          	ldw	(OFST-1,sp),x
 103  0006 1f02          	ldw	(OFST-3,sp),x
 104                     ; 211 	if(FALSE == nGmPiezoFlg)
 106  0008 c6000a        	ld	a,L3_nGmPiezoFlg
 107  000b 2769          	jreq	L35
 108                     ; 213 		return ;
 110                     ; 215 	nGmPiezoFlg = FALSE;
 112  000d 725f000a      	clr	L3_nGmPiezoFlg
 113                     ; 216 	for(nLoop = 0; nLoop <3; nLoop++)
 115  0011 0f01          	clr	(OFST-4,sp)
 116  0013               L73:
 117                     ; 219 		wPizeometerVol = MODBUS_GetPizeometer(READ_CMD);
 119  0013 4f            	clr	a
 120  0014 cd0000        	call	_MODBUS_GetPizeometer
 122  0017 96            	ldw	x,sp
 123  0018 1c0002        	addw	x,#OFST-3
 124  001b cd0000        	call	c_rtol
 126                     ; 223 		if(INVALID_DATA  != wPizeometerVol)
 128  001e 96            	ldw	x,sp
 129  001f 1c0002        	addw	x,#OFST-3
 130  0022 cd0000        	call	c_ltor
 132  0025 ae0000        	ldw	x,#L01
 133  0028 cd0000        	call	c_lcmp
 135  002b 271b          	jreq	L54
 136                     ; 226 			tyRecord.wPressure = wPizeometerVol;
 138  002d 1e04          	ldw	x,(OFST-1,sp)
 139  002f cf000c        	ldw	_tyRecord+12,x
 140  0032 1e02          	ldw	x,(OFST-3,sp)
 141  0034 cf000a        	ldw	_tyRecord+10,x
 142                     ; 227 			if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
 144  0037 7b06          	ld	a,(OFST+1,sp)
 145  0039 a501          	bcp	a,#1
 146  003b 2602          	jrne	L74
 147                     ; 229 				AddRecord((u8*)&tyRecord, sizeof(tyRecord));
 149  003d ad3a          	call	LC001
 150  003f               L74:
 151                     ; 234 			ALM_ClrAlmStatus(PIEZOMETER_ERROR);
 153  003f a610          	ld	a,#16
 154  0041 cd0000        	call	_ALM_ClrAlmStatus
 156                     ; 235 			break;
 158  0044 7b01          	ld	a,(OFST-4,sp)
 159  0046 2013          	jra	L34
 160  0048               L54:
 161                     ; 239 			UC_SleepFunc(1000);
 163  0048 ae03e8        	ldw	x,#1000
 164  004b 89            	pushw	x
 165  004c 5f            	clrw	x
 166  004d 89            	pushw	x
 167  004e cd0000        	call	_UC_SleepFunc
 169  0051 5b04          	addw	sp,#4
 170                     ; 216 	for(nLoop = 0; nLoop <3; nLoop++)
 172  0053 0c01          	inc	(OFST-4,sp)
 175  0055 7b01          	ld	a,(OFST-4,sp)
 176  0057 a103          	cp	a,#3
 177  0059 25b8          	jrult	L73
 178  005b               L34:
 179                     ; 242 	if(3 <= nLoop)
 181  005b a103          	cp	a,#3
 182  005d 2517          	jrult	L35
 183                     ; 244 		tyRecord.wPressure = wPizeometerVol;
 185  005f 1e04          	ldw	x,(OFST-1,sp)
 186  0061 cf000c        	ldw	_tyRecord+12,x
 187  0064 1e02          	ldw	x,(OFST-3,sp)
 188  0066 cf000a        	ldw	_tyRecord+10,x
 189                     ; 245 		if(FALSE == (nRepFlg&KEY_WUAKEUP_FLG))
 191  0069 7b06          	ld	a,(OFST+1,sp)
 192  006b a501          	bcp	a,#1
 193  006d 2602          	jrne	L55
 194                     ; 247 			AddRecord((u8*)&tyRecord, sizeof(tyRecord));
 196  006f ad08          	call	LC001
 197  0071               L55:
 198                     ; 251 		ALM_SetAlmStatus(PIEZOMETER_ERROR);
 200  0071 a610          	ld	a,#16
 201  0073 cd0000        	call	_ALM_SetAlmStatus
 203  0076               L35:
 204                     ; 261 	return ;
 207  0076 5b06          	addw	sp,#6
 208  0078 81            	ret	
 210  0079               LC001:
 211  0079 4b10          	push	#16
 212  007b ae0000        	ldw	x,#_tyRecord
 213  007e cd0000        	call	_AddRecord
 215  0081 ae003c        	ldw	x,#60
 216  0084 84            	pop	a
 217                     ; 230 				UC_SleepFunc(60);
 219  0085 89            	pushw	x
 220  0086 5f            	clrw	x
 221  0087 89            	pushw	x
 222  0088 cd0000        	call	_UC_SleepFunc
 224  008b 5b04          	addw	sp,#4
 225  008d 81            	ret	
 248                     ; 274 void JASON_130PurchasePro(void)
 248                     ; 275 {
 249                     	switch	.text
 250  008e               _JASON_130PurchasePro:
 254                     ; 416 }
 257  008e 81            	ret	
 260                     	switch	.data
 261  000b               L76_nTimeOut:
 262  000b 00            	dc.b	0
 346                     	switch	.const
 347  0004               L04:
 348  0004 00001770      	dc.l	6000
 349  0008               L45:
 350  0008 0000003c      	dc.l	60
 351  000c               L46:
 352  000c 00000002      	dc.l	2
 353                     ; 426 void JASON_130TaskMeter(void)
 353                     ; 427 {
 354                     	switch	.text
 355  008f               _JASON_130TaskMeter:
 357  008f 520c          	subw	sp,#12
 358       0000000c      OFST:	set	12
 361                     ; 429 	int32_t dwOffset   = 0;
 363  0091 96            	ldw	x,sp
 364  0092 1c0009        	addw	x,#OFST-3
 365  0095 cd0000        	call	c_ltor
 367                     ; 430 	u8 nRepFlg = 0, nReadFlg = FALSE;
 371                     ; 431 	u16 wGatherInterval = 0; 
 373  0098 5f            	clrw	x
 374  0099 1f07          	ldw	(OFST-5,sp),x
 375                     ; 435 	if((GetReportFlag())&&g_dwSysTick<6000)
 377  009b cd0000        	call	_GetReportFlag
 379  009e 4d            	tnz	a
 380  009f 2711          	jreq	L511
 382  00a1 ae0000        	ldw	x,#_g_dwSysTick
 383  00a4 cd0000        	call	c_ltor
 385  00a7 ae0004        	ldw	x,#L04
 386  00aa cd0000        	call	c_lcmp
 388  00ad 2403cc0138    	jrult	L031
 389                     ; 437 		return ;
 391  00b2               L511:
 392                     ; 440 	nRepFlg = GetReportFailFlag();
 394  00b2 cd0000        	call	_GetReportFailFlag
 396  00b5 6b06          	ld	(OFST-6,sp),a
 397                     ; 441 	if(TRUE == g_nGmFlg)
 399  00b7 c60002        	ld	a,_g_nGmFlg
 400  00ba 4a            	dec	a
 401  00bb 2703cc0282    	jrne	L711
 402                     ; 443 		MemsetFunc((u8*)&tyRecord, 0, sizeof(tyRecord));
 404  00c0 4b10          	push	#16
 405  00c2 4b00          	push	#0
 406  00c4 ae0000        	ldw	x,#_tyRecord
 407  00c7 cd0000        	call	_MemsetFunc
 409  00ca 85            	popw	x
 410                     ; 444 		nReadFlg = ReadRecord(0, (u8*)&tyRecord, sizeof(tyRecord));
 412  00cb 4b10          	push	#16
 413  00cd ae0000        	ldw	x,#_tyRecord
 414  00d0 89            	pushw	x
 415  00d1 4f            	clr	a
 416  00d2 cd0000        	call	_ReadRecord
 418  00d5 5b03          	addw	sp,#3
 419  00d7 6b05          	ld	(OFST-7,sp),a
 420                     ; 445 		dwOffset = ClaGatherMeterTime(tyRecord.Time);
 422  00d9 ae0000        	ldw	x,#_tyRecord
 423  00dc bf00          	ldw	c_x,x
 424  00de ae0006        	ldw	x,#6
 425  00e1               L25:
 426  00e1 5a            	decw	x
 427  00e2 92d600        	ld	a,([c_x.w],x)
 428  00e5 88            	push	a
 429  00e6 5d            	tnzw	x
 430  00e7 26f8          	jrne	L25
 431  00e9 cd0293        	call	_ClaGatherMeterTime
 433  00ec 5b06          	addw	sp,#6
 434  00ee 96            	ldw	x,sp
 435  00ef 1c0009        	addw	x,#OFST-3
 436  00f2 cd0000        	call	c_rtol
 438                     ; 447 		if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&(TRUE == nReadFlg))
 440  00f5 7b06          	ld	a,(OFST-6,sp)
 441  00f7 a501          	bcp	a,#1
 442  00f9 2640          	jrne	L121
 444  00fb 7b05          	ld	a,(OFST-7,sp)
 445  00fd 4a            	dec	a
 446  00fe 263b          	jrne	L121
 447                     ; 449 			wGatherInterval = tyReport.wGatherCycle;
 449  0100 ce0000        	ldw	x,_tyReport
 450  0103 1f07          	ldw	(OFST-5,sp),x
 451                     ; 452 			if((0x15 >= stTimeNow.wYear)||((0xFF != tyRecord.Time.Byte.Day) && (0 < dwOffset)
 451                     ; 453 				&& (wGatherInterval-1 > (u32)((dwOffset)/60)))) //(FALSE != tyRecord.nRepFlg)
 453  0105 c60000        	ld	a,_stTimeNow
 454  0108 a116          	cp	a,#22
 455  010a 2528          	jrult	L521
 457  010c c60003        	ld	a,_tyRecord+3
 458  010f 4c            	inc	a
 459  0110 2729          	jreq	L121
 461  0112 96            	ldw	x,sp
 462  0113 1c0009        	addw	x,#OFST-3
 463  0116 cd0000        	call	c_lzmp
 465  0119 2d20          	jrsle	L121
 467  011b 96            	ldw	x,sp
 468  011c cd0289        	call	LC003
 469  011f cd0000        	call	c_ludv
 471  0122 96            	ldw	x,sp
 472  0123 5c            	incw	x
 473  0124 cd0000        	call	c_rtol
 475  0127 1e07          	ldw	x,(OFST-5,sp)
 476  0129 5a            	decw	x
 477  012a cd0000        	call	c_uitolx
 479  012d 96            	ldw	x,sp
 480  012e 5c            	incw	x
 481  012f cd0000        	call	c_lcmp
 483  0132 2307          	jrule	L121
 484  0134               L521:
 485                     ; 456 				LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 489  0134 4f            	clr	a
 490  0135 cd0000        	call	_LP_SetLowPwrStartFlg
 492                     ; 457 				return ;
 493  0138               L031:
 496  0138 5b0c          	addw	sp,#12
 497  013a 81            	ret	
 498  013b               L121:
 499                     ; 460 		dwOffset = ClaGatherMeterTime(tyReport.Time);		
 501  013b ae0004        	ldw	x,#_tyReport+4
 502  013e bf00          	ldw	c_x,x
 503  0140 ae0006        	ldw	x,#6
 504  0143               L26:
 505  0143 5a            	decw	x
 506  0144 92d600        	ld	a,([c_x.w],x)
 507  0147 88            	push	a
 508  0148 5d            	tnzw	x
 509  0149 26f8          	jrne	L26
 510  014b cd0293        	call	_ClaGatherMeterTime
 512  014e 5b06          	addw	sp,#6
 513  0150 96            	ldw	x,sp
 514  0151 1c0009        	addw	x,#OFST-3
 515  0154 cd0000        	call	c_rtol
 517                     ; 463 		if((FALSE == (nRepFlg&KEY_WUAKEUP_FLG))&&((0 > dwOffset)||(1 < (u32)((dwOffset/60)%(u32)wGatherInterval))))
 519  0157 7b06          	ld	a,(OFST-6,sp)
 520  0159 a501          	bcp	a,#1
 521  015b 2622          	jrne	L721
 523  015d 7b09          	ld	a,(OFST-3,sp)
 524  015f 2bd3          	jrmi	L521
 526  0161 1e07          	ldw	x,(OFST-5,sp)
 527  0163 cd0000        	call	c_uitolx
 529  0166 96            	ldw	x,sp
 530  0167 5c            	incw	x
 531  0168 cd0000        	call	c_rtol
 533  016b 96            	ldw	x,sp
 534  016c cd0289        	call	LC003
 535  016f cd0000        	call	c_ldiv
 537  0172 96            	ldw	x,sp
 538  0173 5c            	incw	x
 539  0174 cd0000        	call	c_lumd
 541  0177 ae000c        	ldw	x,#L46
 542  017a cd0000        	call	c_lcmp
 544                     ; 466 			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 546                     ; 467 			return ;
 548  017d 24b5          	jruge	L521
 549  017f               L721:
 550                     ; 471 		if(FALSE == nReadFlg)
 552  017f 7b05          	ld	a,(OFST-7,sp)
 553  0181 2603          	jrne	L331
 554                     ; 473 			ReWriteRepFlg();
 556  0183 cd0000        	call	_ReWriteRepFlg
 558  0186               L331:
 559                     ; 479 		if(TRUE == (g_nGatherMeterFlg = GatherMeterFun()))
 561  0186 cd0000        	call	_GatherMeterFun
 563  0189 c70004        	ld	_g_nGatherMeterFlg,a
 564  018c 4a            	dec	a
 565  018d 2678          	jrne	L531
 566                     ; 482 			SetPortMeterPowerOff();
 568  018f 4b00          	push	#0
 569  0191 4b08          	push	#8
 570  0193 ae5000        	ldw	x,#20480
 571  0196 cd0000        	call	_GPIO_WriteBit
 573  0199 725f0002      	clr	_g_nGmFlg
 574  019d 5500000005    	mov	_tyRecord+5,_stTimeNow
 575  01a2 5500010004    	mov	_tyRecord+4,_stTimeNow+1
 576  01a7 5500020003    	mov	_tyRecord+3,_stTimeNow+2
 577  01ac 5500030002    	mov	_tyRecord+2,_stTimeNow+3
 578  01b1 85            	popw	x
 579                     ; 484 			g_nGmFlg = FALSE;
 581                     ; 487 			tyRecord.Time.Byte.Year = stTimeNow.wYear;
 583                     ; 488 			tyRecord.Time.Byte.Month = stTimeNow.nMonth;
 585                     ; 489 			tyRecord.Time.Byte.Day = stTimeNow.nDay;
 587                     ; 490 			tyRecord.Time.Byte.Hour = stTimeNow.nHour;
 589                     ; 491 			if(60 <= wGatherInterval)
 591  01b2 1e07          	ldw	x,(OFST-5,sp)
 592  01b4 a3003c        	cpw	x,#60
 593  01b7 2506          	jrult	L731
 594                     ; 493 				tyRecord.Time.Byte.Minute = 0;
 596  01b9 725f0001      	clr	_tyRecord+1
 598  01bd 2005          	jra	L141
 599  01bf               L731:
 600                     ; 497 				tyRecord.Time.Byte.Minute = stTimeNow.nMinute;
 602  01bf 5500040001    	mov	_tyRecord+1,_stTimeNow+4
 603  01c4               L141:
 604                     ; 500 			tyRecord.Time.Byte.Second = 0;               /* 存储只精确到分钟 */
 606  01c4 725f0000      	clr	_tyRecord
 607                     ; 501 			tyRecord.Value = tyParameter.Value;
 609  01c8 ce0004        	ldw	x,_tyParameter+4
 610  01cb cf0008        	ldw	_tyRecord+8,x
 611  01ce ce0002        	ldw	x,_tyParameter+2
 612  01d1 cf0006        	ldw	_tyRecord+6,x
 613                     ; 503 			if(VALVE_CLOSE == g_nValveStat)
 615  01d4 c60000        	ld	a,_g_nValveStat
 616  01d7 a101          	cp	a,#1
 617  01d9 2606          	jrne	L341
 618                     ; 505 				tyParameter.Status = OLD_VAVLE_CLOSE;	
 620  01db 35080001      	mov	_tyParameter+1,#8
 622  01df 200f          	jra	L541
 623  01e1               L341:
 624                     ; 507 			else if(VALVE_ERROR == g_nValveStat)
 626  01e1 a103          	cp	a,#3
 627  01e3 2606          	jrne	L741
 628                     ; 509 				tyParameter.Status = OLD_VAVLE_ERROR;	
 630  01e5 35ff0001      	mov	_tyParameter+1,#255
 632  01e9 2005          	jra	L541
 633  01eb               L741:
 634                     ; 513 				tyParameter.Status = g_nValveStat;
 636  01eb 5500000001    	mov	_tyParameter+1,_g_nValveStat
 637  01f0               L541:
 638                     ; 518 			tyRecord.nStatus = tyParameter.Status;
 640  01f0 550001000e    	mov	_tyRecord+14,_tyParameter+1
 641                     ; 519 			tyRecord.nRepFlg = TRUE;
 643  01f5 3501000f      	mov	_tyRecord+15,#1
 644                     ; 528 			LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 646  01f9 4f            	clr	a
 647  01fa cd0000        	call	_LP_SetLowPwrStartFlg
 649                     ; 530 			JASON_130PurchasePro();
 651  01fd cd008e        	call	_JASON_130PurchasePro
 653                     ; 533 			ALM_ClrAlmStatus(METER_ERROR);
 655  0200 a604          	ld	a,#4
 656  0202 cd0000        	call	_ALM_ClrAlmStatus
 659  0205 206e          	jra	L351
 660  0207               L531:
 661                     ; 537 			nTimeOut++;
 663  0207 725c000b      	inc	L76_nTimeOut
 664                     ; 538 			UC_SleepFunc(1000);
 666  020b ae03e8        	ldw	x,#1000
 667  020e 89            	pushw	x
 668  020f 5f            	clrw	x
 669  0210 89            	pushw	x
 670  0211 cd0000        	call	_UC_SleepFunc
 672  0214 5b04          	addw	sp,#4
 673                     ; 539 			if(3 < nTimeOut)
 675  0216 c6000b        	ld	a,L76_nTimeOut
 676  0219 a104          	cp	a,#4
 677  021b 2403cc0138    	jrult	L031
 678                     ; 541 				g_nGmFlg = FALSE;					
 680  0220 725f0002      	clr	_g_nGmFlg
 681                     ; 542 				LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 683  0224 4f            	clr	a
 684  0225 cd0000        	call	_LP_SetLowPwrStartFlg
 686                     ; 543 				MemsetFunc((u8*)&tyRecord, 0xFF, sizeof(tyRecord));
 688  0228 4b10          	push	#16
 689  022a 4bff          	push	#255
 690  022c ae0000        	ldw	x,#_tyRecord
 691  022f cd0000        	call	_MemsetFunc
 693  0232 85            	popw	x
 694                     ; 544 				tyRecord.Value = INVALID_DATA;
 696  0233 aeeeee        	ldw	x,#61166
 697  0236 cf0008        	ldw	_tyRecord+8,x
 698  0239 cf0006        	ldw	_tyRecord+6,x
 699                     ; 545 				tyRecord.nRepFlg = TRUE;
 701  023c 3501000f      	mov	_tyRecord+15,#1
 702                     ; 554 				ALM_SetAlmStatus(METER_ERROR);
 704  0240 a604          	ld	a,#4
 705  0242 cd0000        	call	_ALM_SetAlmStatus
 707                     ; 557 				stRepFail.wError |= (1<<GM_GATHERMETER_FAIL);
 709  0245 721a0007      	bset	_stRepFail+7,#5
 710                     ; 558 				STM8_RTC_Get(&stTimeNow);
 712  0249 ae0000        	ldw	x,#_stTimeNow
 713  024c cd0000        	call	_STM8_RTC_Get
 715                     ; 559 				MemcpyFunc((u8*)&stRepFail.stTime, (u8*)&stTimeNow, sizeof(stRepFail.stTime));
 717  024f 4b06          	push	#6
 718  0251 ae0000        	ldw	x,#_stTimeNow
 719  0254 89            	pushw	x
 720  0255 ae0000        	ldw	x,#_stRepFail
 721  0258 cd0000        	call	_MemcpyFunc
 723  025b 5b03          	addw	sp,#3
 724                     ; 560 				stRepFail.nSigal = 0xFF;			//信号大小,固定值
 726  025d 35ff0008      	mov	_stRepFail+8,#255
 727                     ; 561 				AddAlmRecord((u8*)&stRepFail, sizeof(stRepFail));
 729  0261 4b09          	push	#9
 730  0263 ae0000        	ldw	x,#_stRepFail
 731  0266 cd0000        	call	_AddAlmRecord
 733  0269 ae003c        	ldw	x,#60
 734  026c 84            	pop	a
 735                     ; 562 				UC_SleepFunc(60);
 737  026d 89            	pushw	x
 738  026e 5f            	clrw	x
 739  026f 89            	pushw	x
 740  0270 cd0000        	call	_UC_SleepFunc
 742  0273 5b04          	addw	sp,#4
 744  0275               L351:
 745                     ; 570 		if(FALSE == g_nGmFlg)
 747  0275 c60002        	ld	a,_g_nGmFlg
 748  0278 26a3          	jrne	L031
 749                     ; 572 			JASON_GmPiezometer(nRepFlg);
 751  027a 7b06          	ld	a,(OFST-6,sp)
 752  027c cd0000        	call	_JASON_GmPiezometer
 754  027f cc0138        	jra	L031
 755                     ; 566 				return ;
 757  0282               L711:
 758                     ; 599 		g_nGmFlg = FALSE; //补报则不再抄表
 760  0282 725f0002      	clr	_g_nGmFlg
 761                     ; 600 		LP_SetLowPwrStartFlg(LP_GM_FLG_OK);
 763                     ; 602 	return ;
 765  0286 cc0134        	jp	L521
 767  0289               LC003:
 768  0289 1c0009        	addw	x,#OFST-3
 769  028c cd0000        	call	c_ltor
 771  028f ae0008        	ldw	x,#L45
 772  0292 81            	ret	
1065                     ; 614 int32_t ClaGatherMeterTime(TypeTime stTime)
1065                     ; 615 {
1066                     	switch	.text
1067  0293               _ClaGatherMeterTime:
1069  0293 521b          	subw	sp,#27
1070       0000001b      OFST:	set	27
1073                     ; 618 	int32_t dwOffset = 0;
1075  0295 5f            	clrw	x
1076  0296 1f1a          	ldw	(OFST-1,sp),x
1077  0298 1f18          	ldw	(OFST-3,sp),x
1078                     ; 620 	JX_BL_Change((u16)sizeof(TypeTime), (u8*)&stTime);
1080  029a 96            	ldw	x,sp
1081  029b 1c001e        	addw	x,#OFST+3
1082  029e 89            	pushw	x
1083  029f ae0006        	ldw	x,#6
1084  02a2 cd0000        	call	_JX_BL_Change
1086  02a5 85            	popw	x
1087                     ; 621 	MemcpyFunc((u8*)&stLastTime, (u8*)&stTime, sizeof(TypeTime));
1089  02a6 4b06          	push	#6
1090  02a8 96            	ldw	x,sp
1091  02a9 1c001f        	addw	x,#OFST+4
1092  02ac 89            	pushw	x
1093  02ad 1d001d        	subw	x,#29
1094  02b0 cd0000        	call	_MemcpyFunc
1096  02b3 5b03          	addw	sp,#3
1097                     ; 622 	STM8_RTC_Get(&stTimeNow);
1099  02b5 ae0000        	ldw	x,#_stTimeNow
1100  02b8 cd0000        	call	_STM8_RTC_Get
1102                     ; 623 	TM_TimeChangeAToB(&stTimeNow, &stEnd);
1104  02bb 96            	ldw	x,sp
1105  02bc 1c0010        	addw	x,#OFST-11
1106  02bf 89            	pushw	x
1107  02c0 ae0000        	ldw	x,#_stTimeNow
1108  02c3 cd0000        	call	_TM_TimeChangeAToB
1110  02c6 85            	popw	x
1111                     ; 624 	TM_TimeChangeAToB(&stLastTime, &stStar);
1113  02c7 96            	ldw	x,sp
1114  02c8 1c0008        	addw	x,#OFST-19
1115  02cb 89            	pushw	x
1116  02cc 1d0007        	subw	x,#7
1117  02cf cd0000        	call	_TM_TimeChangeAToB
1119  02d2 85            	popw	x
1120                     ; 625 	dwOffset = TM_DiffSecond(&stStar, &stEnd);	
1122  02d3 96            	ldw	x,sp
1123  02d4 1c0010        	addw	x,#OFST-11
1124  02d7 89            	pushw	x
1125  02d8 1d0008        	subw	x,#8
1126  02db cd0000        	call	_TM_DiffSecond
1128  02de 85            	popw	x
1129  02df 96            	ldw	x,sp
1130  02e0 1c0018        	addw	x,#OFST-3
1131  02e3 cd0000        	call	c_rtol
1133                     ; 627 	return dwOffset;
1135  02e6 96            	ldw	x,sp
1136  02e7 1c0018        	addw	x,#OFST-3
1137  02ea cd0000        	call	c_ltor
1141  02ed 5b1b          	addw	sp,#27
1142  02ef 81            	ret	
1198                     ; 638 void fixTaskVavle(void)
1198                     ; 639 {
1199                     	switch	.text
1200  02f0               _fixTaskVavle:
1202  02f0 520f          	subw	sp,#15
1203       0000000f      OFST:	set	15
1206                     ; 653 	if(CTL_VAVLE_ENABLE != stOptValve.nEnableFlg)
1208  02f2 c60000        	ld	a,_stOptValve
1209  02f5 a1aa          	cp	a,#170
1210  02f7 2607          	jrne	L402
1211                     ; 655 		return ;
1213                     ; 658 	if(CTL_VALVE_OVER == stOptValve.nOptFlg)
1215  02f9 c60001        	ld	a,_stOptValve+1
1216  02fc a1ee          	cp	a,#238
1217  02fe 2603          	jrne	L753
1218                     ; 660 		return ;
1219  0300               L402:
1222  0300 5b0f          	addw	sp,#15
1223  0302 81            	ret	
1224  0303               L753:
1225                     ; 663 	STM8_RTC_Get(&stTimeNow);
1227  0303 ae0000        	ldw	x,#_stTimeNow
1228  0306 cd0000        	call	_STM8_RTC_Get
1230                     ; 664 	if((((0 != stOptValve.nVavleCycle)&&(stOptValve.nDay == stTimeNow.nDay)&&(stOptValve.nMonth == stTimeNow.nMonth))
1230                     ; 665 		||((0 == stOptValve.nVavleCycle)&&((0x01 == stTimeNow.nDay)||(0x15 == stTimeNow.nDay))))	
1230                     ; 666 		&&(stTimeNow.nHour >= stOptValve.nStartHour)&&(stTimeNow.nHour <= stOptValve.nEndHour))
1232  0309 c60009        	ld	a,_stOptValve+9
1233  030c 2710          	jreq	L563
1235  030e c60004        	ld	a,_stOptValve+4
1236  0311 c10002        	cp	a,_stTimeNow+2
1237  0314 2608          	jrne	L563
1239  0316 c60003        	ld	a,_stOptValve+3
1240  0319 c10001        	cp	a,_stTimeNow+1
1241  031c 2713          	jreq	L363
1242  031e               L563:
1244  031e c60009        	ld	a,_stOptValve+9
1245  0321 2703cc03d6    	jrne	L163
1247  0326 c60002        	ld	a,_stTimeNow+2
1248  0329 a101          	cp	a,#1
1249  032b 2704          	jreq	L363
1251  032d a115          	cp	a,#21
1252  032f 26f2          	jrne	L163
1253  0331               L363:
1255  0331 c60003        	ld	a,_stTimeNow+3
1256  0334 c10005        	cp	a,_stOptValve+5
1257  0337 25ea          	jrult	L163
1259  0339 c10006        	cp	a,_stOptValve+6
1260  033c 22e5          	jrugt	L163
1261                     ; 668 		if(0 == stOptValve.nOptFlg)
1263  033e c60001        	ld	a,_stOptValve+1
1264  0341 27bd          	jreq	L402
1265                     ; 670 			return ;
1267                     ; 673 		CJ_T188ProtocolGM();
1269  0343 cd0000        	call	_CJ_T188ProtocolGM
1271                     ; 674 		if((VALVE_CLOSE != g_nValveStat)&&(VALVE_OPEN != g_nValveStat))
1273  0346 c60000        	ld	a,_g_nValveStat
1274  0349 a101          	cp	a,#1
1275  034b 270b          	jreq	L573
1277  034d c60000        	ld	a,_g_nValveStat
1278  0350 2706          	jreq	L573
1279                     ; 676 			stOptValve.nVavleStat = 0x78;
1281  0352 35780007      	mov	_stOptValve+7,#120
1283  0356 2050          	jra	L773
1284  0358               L573:
1285                     ; 680 			stOptValve.nVavleStat = g_nValveStat;
1287  0358 c70007        	ld	_stOptValve+7,a
1288                     ; 681 			stOptValve.nVavleStat|=(g_nValveStat<<5);
1290  035b 97            	ld	xl,a
1291  035c a620          	ld	a,#32
1292  035e 42            	mul	x,a
1293  035f 9f            	ld	a,xl
1294  0360 ca0007        	or	a,_stOptValve+7
1295  0363 c70007        	ld	_stOptValve+7,a
1296                     ; 682 			if(VALVE_OPEN == g_nValveStat)
1298  0366 c60000        	ld	a,_g_nValveStat
1299  0369 261a          	jrne	L104
1300                     ; 684 				if(TRUE == VavleOperateFun(VALVECLOSE))
1302  036b a605          	ld	a,#5
1303  036d cd0000        	call	_VavleOperateFun
1305  0370 4a            	dec	a
1306  0371 260e          	jrne	L304
1307                     ; 686 					if(TRUE == VavleOperateFun(VALVEOPEN))
1309  0373 a603          	ld	a,#3
1310  0375 cd0000        	call	_VavleOperateFun
1312  0378 4a            	dec	a
1313  0379 2621          	jrne	L714
1314                     ; 688 						stOptValve.nVavleStat |= 0x80;
1316  037b               LC007:
1318  037b 721e0007      	bset	_stOptValve+7,#7
1319  037f 201b          	jra	L714
1320  0381               L304:
1321                     ; 693 					VavleOperateFun(VALVEOPEN);
1323  0381 a603          	ld	a,#3
1325                     ; 695 				stOptValve.nVavleStat |=(g_nValveStat<<3);
1327  0383 2014          	jp	LC006
1328  0385               L104:
1329                     ; 699 				if(TRUE == VavleOperateFun(VALVEOPEN))
1331  0385 a603          	ld	a,#3
1332  0387 cd0000        	call	_VavleOperateFun
1334  038a 4a            	dec	a
1335  038b 260a          	jrne	L314
1336                     ; 701 					if(TRUE == VavleOperateFun(VALVECLOSE))
1338  038d a605          	ld	a,#5
1339  038f cd0000        	call	_VavleOperateFun
1341  0392 4a            	dec	a
1342  0393 2607          	jrne	L714
1343                     ; 703 						stOptValve.nVavleStat |= 0x80;
1344  0395 20e4          	jp	LC007
1345  0397               L314:
1346                     ; 708 					VavleOperateFun(VALVECLOSE);
1348  0397 a605          	ld	a,#5
1349  0399               LC006:
1350  0399 cd0000        	call	_VavleOperateFun
1352  039c               L714:
1353                     ; 710 				stOptValve.nVavleStat |=(g_nValveStat<<3);
1356  039c c60000        	ld	a,_g_nValveStat
1357  039f 48            	sll	a
1358  03a0 48            	sll	a
1359  03a1 48            	sll	a
1360  03a2 ca0007        	or	a,_stOptValve+7
1361  03a5 c70007        	ld	_stOptValve+7,a
1362  03a8               L773:
1363                     ; 713 		g_OptValveRepFlg = TRUE;
1365  03a8 35010000      	mov	_g_OptValveRepFlg,#1
1366                     ; 714 		stOptValve.nRepFailCnt = 0;
1368  03ac 725f0008      	clr	_stOptValve+8
1369                     ; 715 		stOptValve.nOptFlg = CTL_VALVE_OVER;	
1371  03b0 35ee0001      	mov	_stOptValve+1,#238
1372                     ; 716 		stOptValve.nYear = stTimeNow.wYear;
1374  03b4 5500000002    	mov	_stOptValve+2,_stTimeNow
1375                     ; 717 		stOptValve.nMonth= stTimeNow.nMonth;
1377  03b9 5500010003    	mov	_stOptValve+3,_stTimeNow+1
1378                     ; 718 		stOptValve.nDay  = stTimeNow.nDay;
1380  03be 5500020004    	mov	_stOptValve+4,_stTimeNow+2
1381                     ; 719 		stOptValve.nStartHour = stTimeNow.nHour;
1383  03c3 5500030005    	mov	_stOptValve+5,_stTimeNow+3
1384                     ; 720 		SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
1387  03c8               LC004:
1389  03c8 4b06          	push	#6
1390  03ca 4b0a          	push	#10
1391  03cc ae0000        	ldw	x,#_stOptValve
1392  03cf cd0000        	call	_SaveParameterForType
1393  03d2 85            	popw	x
1395  03d3 cc0300        	jra	L402
1396  03d6               L163:
1397                     ; 724 		if(CTL_VAVLE_ENABLE != stOptValve.nOptFlg)
1399  03d6 c60001        	ld	a,_stOptValve+1
1400  03d9 a1aa          	cp	a,#170
1401  03db 27f6          	jreq	L402
1402                     ; 726 			stOptValve.nRepFailCnt = 0;
1404  03dd 725f0008      	clr	_stOptValve+8
1405                     ; 727 			stOptValve.nOptFlg = stOptValve.nEnableFlg;
1407  03e1 5500000001    	mov	_stOptValve+1,_stOptValve
1408                     ; 729 			if(0 != stOptValve.nVavleCycle)
1410  03e6 c60009        	ld	a,_stOptValve+9
1411  03e9 27dd          	jreq	LC004
1412                     ; 731 				stTimeTmp.wYear   = stOptValve.nYear;
1414  03eb c60002        	ld	a,_stOptValve+2
1415  03ee 6b09          	ld	(OFST-6,sp),a
1416                     ; 732 				stTimeTmp.nMonth  = stOptValve.nMonth;
1418  03f0 c60003        	ld	a,_stOptValve+3
1419  03f3 6b0a          	ld	(OFST-5,sp),a
1420                     ; 733 				stTimeTmp.nDay	  = stOptValve.nDay;
1422  03f5 c60004        	ld	a,_stOptValve+4
1423  03f8 6b0b          	ld	(OFST-4,sp),a
1424                     ; 734 				stTimeTmp.nHour   = stOptValve.nStartHour;
1426  03fa c60005        	ld	a,_stOptValve+5
1427  03fd 6b0c          	ld	(OFST-3,sp),a
1428                     ; 735 				stTimeTmp.nMinute = 0;
1430  03ff 0f0d          	clr	(OFST-2,sp)
1431                     ; 736 				stTimeTmp.nSecond = 0;
1433  0401 0f0e          	clr	(OFST-1,sp)
1434                     ; 737 				TM_TimeChangeAToB(&stTimeTmp, &stStarTime);
1436  0403 96            	ldw	x,sp
1437  0404 5c            	incw	x
1438  0405 89            	pushw	x
1439  0406 1c0008        	addw	x,#8
1440  0409 cd0000        	call	_TM_TimeChangeAToB
1442  040c 5500090003    	mov	c_lreg+3,_stOptValve+9
1443  0411 3f02          	clr	c_lreg+2
1444  0413 3f01          	clr	c_lreg+1
1445  0415 3f00          	clr	c_lreg
1446  0417 85            	popw	x
1447                     ; 738 				TM_RTimeAddnDay(&stStarTime, stOptValve.nVavleCycle);
1449  0418 be02          	ldw	x,c_lreg+2
1450  041a 89            	pushw	x
1451  041b be00          	ldw	x,c_lreg
1452  041d 89            	pushw	x
1453  041e 96            	ldw	x,sp
1454  041f 1c0005        	addw	x,#OFST-10
1455  0422 cd0000        	call	_TM_RTimeAddnDay
1457  0425 5b04          	addw	sp,#4
1458                     ; 739 				TM_TimeChangeBToA(&stStarTime, &stTimeTmp);
1460  0427 96            	ldw	x,sp
1461  0428 1c0009        	addw	x,#OFST-6
1462  042b 89            	pushw	x
1463  042c 1d0008        	subw	x,#8
1464  042f cd0000        	call	_TM_TimeChangeBToA
1466  0432 85            	popw	x
1467                     ; 740 				stOptValve.nYear = stTimeTmp.wYear;
1469  0433 7b09          	ld	a,(OFST-6,sp)
1470  0435 c70002        	ld	_stOptValve+2,a
1471                     ; 741 				stOptValve.nMonth= stTimeTmp.nMonth;
1473  0438 7b0a          	ld	a,(OFST-5,sp)
1474  043a c70003        	ld	_stOptValve+3,a
1475                     ; 742 				stOptValve.nDay  = stTimeTmp.nDay;
1477  043d 7b0b          	ld	a,(OFST-4,sp)
1478  043f c70004        	ld	_stOptValve+4,a
1479                     ; 745 			SaveParameterForType((u8*)&stOptValve, OPTVALVE_LEN, OPT_VALVE_PRAA);
1481                     ; 750 	return ;
1483  0442 2084          	jp	LC004
1508                     ; 897 u8 GM_GetGatherMeterFlg(void)
1508                     ; 898 {
1509                     	switch	.text
1510  0444               _GM_GetGatherMeterFlg:
1514                     ; 899 	return g_nGatherMeterFlg;
1516  0444 c60004        	ld	a,_g_nGatherMeterFlg
1519  0447 81            	ret	
1543                     ; 910 void fixTaskMeterTestCode(void)
1543                     ; 911 {
1544                     	switch	.text
1545  0448               _fixTaskMeterTestCode:
1549                     ; 1089 	return ;
1552  0448 81            	ret	
1576                     ; 1100 void fixTaskMeter(void)
1576                     ; 1101 {
1577                     	switch	.text
1578  0449               _fixTaskMeter:
1582                     ; 1110 	JASON_130TaskMeter();
1585                     ; 1125 	return ;
1588  0449 cc008f        	jp	_JASON_130TaskMeter
1614                     ; 1128 void InitializeMeter(void)
1614                     ; 1129 {
1615                     	switch	.text
1616  044c               _InitializeMeter:
1620                     ; 1130 	MemsetFunc((u8*)&tyTime, 0x00, sizeof(tyTime));
1622  044c 4b06          	push	#6
1623  044e 4b00          	push	#0
1624  0450 ae0002        	ldw	x,#_tyTime
1625  0453 cd0000        	call	_MemsetFunc
1627  0456 85            	popw	x
1628                     ; 1131 	MemsetFunc((u8*)&tyRecord, 0xff, sizeof(tyRecord));
1630  0457 4b10          	push	#16
1631  0459 4bff          	push	#255
1632  045b ae0000        	ldw	x,#_tyRecord
1633  045e cd0000        	call	_MemsetFunc
1635  0461 85            	popw	x
1636                     ; 1132 }
1639  0462 81            	ret	
1720                     	xdef	_fixTaskMeterTestCode
1721                     	xdef	_JASON_130TaskMeter
1722                     	xdef	_JASON_GmPiezometer
1723                     	xdef	_g_nGatherMeterFlg
1724                     	xdef	_g_nErrFlg
1725                     	xdef	_g_nGmFlg
1726                     	xdef	_g_wGMInterval
1727                     	switch	.bss
1728  0000               _ucStepMeter:
1729  0000 00            	ds.b	1
1730                     	xdef	_ucStepMeter
1731  0001               _ucStatusMeter:
1732  0001 00            	ds.b	1
1733                     	xdef	_ucStatusMeter
1734                     	xref	_ALM_ClrAlmStatus
1735                     	xref	_ALM_SetAlmStatus
1736                     	xref	_LP_SetLowPwrStartFlg
1737                     	xref	_STM8_RTC_Get
1738                     	xref	_stRepFail
1739                     	xref	_tyParameter
1740                     	xref	_tyRecord
1741                     	xref	_AddAlmRecord
1742                     	xref	_SaveParameterForType
1743                     	xref	_ReadRecord
1744                     	xref	_AddRecord
1745                     	xref	_GetReportFailFlag
1746                     	xref	_ReWriteRepFlg
1747                     	xref	_UC_SleepFunc
1748                     	xref	_GetReportFlag
1749                     	xref	_g_OptValveRepFlg
1750                     	xref	_stOptValve
1751                     	xref	_stTimeNow
1752                     	xref	_tyReport
1753                     	xref	_g_dwSysTick
1754                     	xdef	_JASON_130PurchasePro
1755                     	xdef	_ClaGatherMeterTime
1756                     	xdef	_fixTaskVavle
1757                     	xdef	_GM_GetGatherMeterFlg
1758                     	xdef	_InitializeMeter
1759                     	xdef	_fixTaskMeter
1760                     	xdef	_g_dwNowMeterVal
1761                     	xdef	_g_nOptValveTask
1762  0002               _tyTime:
1763  0002 000000000000  	ds.b	6
1764                     	xdef	_tyTime
1765                     	xref	_TM_RTimeAddnDay
1766                     	xref	_TM_DiffSecond
1767                     	xref	_TM_TimeChangeBToA
1768                     	xref	_TM_TimeChangeAToB
1769                     	xref	_JX_BL_Change
1770                     	xref	_MemcpyFunc
1771                     	xref	_MemsetFunc
1772                     	xref	_MODBUS_GetPizeometer
1773                     	xref	_VavleOperateFun
1774                     	xref	_GatherMeterFun
1775                     	xref	_CJ_T188ProtocolGM
1776                     	xref	_g_nValveStat
1777                     	xref	_GPIO_WriteBit
1778                     	xref.b	c_lreg
1779                     	xref.b	c_x
1799                     	xref	c_lumd
1800                     	xref	c_ldiv
1801                     	xref	c_ludv
1802                     	xref	c_uitolx
1803                     	xref	c_lzmp
1804                     	xref	c_lcmp
1805                     	xref	c_ltor
1806                     	xref	c_rtol
1807                     	end
