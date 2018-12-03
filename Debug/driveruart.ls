   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               _tyUartBusyFlag:
   7  0000 00            	dc.b	0
   8  0001               _tyUartModeFlag:
   9  0001 00            	dc.b	0
  10  0002               _tyUartParityFlag:
  11  0002 00            	dc.b	0
  12  0003               _tyUartParityFlagError:
  13  0003 00            	dc.b	0
  14  0004               _nReceiveDataFlg:
  15  0004 00            	dc.b	0
  16  0005               L3_m_nUartRxLockFlg:
  17  0005 00            	dc.b	0
  55                     ; 60 void Time1ReloadVal(u16 TIM1_Period)
  55                     ; 61 {
  57                     	switch	.text
  58  0000               _Time1ReloadVal:
  62                     ; 63 	TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
  64  0000 9e            	ld	a,xh
  65  0001 c752c3        	ld	21187,a
  66                     ; 64 	TIM1->ARRL = (uint8_t)(TIM1_Period);
  68  0004 9f            	ld	a,xl
  69  0005 c752c4        	ld	21188,a
  70                     ; 65 }
  73  0008 81            	ret	
 100                     ; 76 void TurnOnTimerUart(void)
 100                     ; 77 {
 101                     	switch	.text
 102  0009               _TurnOnTimerUart:
 106                     ; 78 	TurnOffExit();			//关闭外部中断
 108  0009 cd0000        	call	_TurnOffExit
 110                     ; 79 	switch (ucBusUartBaudate)		//1MHZ
 112  000c c60007        	ld	a,_ucBusUartBaudate
 114                     ; 104 		break;
 115  000f 4a            	dec	a
 116  0010 2717          	jreq	L72
 117  0012 4a            	dec	a
 118  0013 2719          	jreq	L13
 119  0015 4a            	dec	a
 120  0016 271b          	jreq	L33
 121  0018 4a            	dec	a
 122  0019 271d          	jreq	L53
 123  001b 4a            	dec	a
 124  001c 271f          	jreq	L73
 125  001e 4a            	dec	a
 126  001f 2721          	jreq	L14
 127  0021 4a            	dec	a
 128  0022 2723          	jreq	L34
 129  0024 4a            	dec	a
 130  0025 2725          	jreq	L54
 131  0027 2028          	jra	L16
 132  0029               L72:
 133                     ; 81 	case BAUDRATE_1200:
 133                     ; 82 		Time1ReloadVal(6666 - 1);		//定时器初值,8000000/1200=6666.6		
 135  0029 ae1a09        	ldw	x,#6665
 137                     ; 83 		break;
 139  002c 2021          	jp	LC001
 140  002e               L13:
 141                     ; 84 	case BAUDRATE_2400:
 141                     ; 85 		Time1ReloadVal(3407 - 1);		//A,定时器初值,8000000/2400=3333.3,微调 //3335-3480
 143  002e ae0d4e        	ldw	x,#3406
 145                     ; 86 		break;
 147  0031 201c          	jp	LC001
 148  0033               L33:
 149                     ; 87 	case BAUDRATE_4800:
 149                     ; 88 		Time1ReloadVal(1667 - 1);		//定时器初值,8000000/4800=1666.6
 151  0033 ae0682        	ldw	x,#1666
 153                     ; 89 		break;
 155  0036 2017          	jp	LC001
 156  0038               L53:
 157                     ; 90 	case BAUDRATE_9600:
 157                     ; 91 		Time1ReloadVal(847 - 1);			//定时器初值,8000000/9600=833.3
 159  0038 ae034e        	ldw	x,#846
 161                     ; 92 		break;
 163  003b 2012          	jp	LC001
 164  003d               L73:
 165                     ; 93 	case BAUDRATE_19200:
 165                     ; 94 		Time1ReloadVal(417 - 1);			//定时器初值,8000000/19200=416.6
 167  003d ae01a0        	ldw	x,#416
 169                     ; 95 		break;
 171  0040 200d          	jp	LC001
 172  0042               L14:
 173                     ; 96 	case BAUDRATE_38400:
 173                     ; 97 		Time1ReloadVal(208 - 1);			//定时器初值,8000000/38400=208.3us
 175  0042 ae00cf        	ldw	x,#207
 177                     ; 98 		break;
 179  0045 2008          	jp	LC001
 180  0047               L34:
 181                     ; 99 	case BAUDRATE_57600:
 181                     ; 100 		Time1ReloadVal(139 - 1); 		//定时器初值,8000000/57600=138.8
 183  0047 ae008a        	ldw	x,#138
 185                     ; 101 		break;
 187  004a 2003          	jp	LC001
 188  004c               L54:
 189                     ; 102 	case BAUDRATE_115200:
 189                     ; 103 		Time1ReloadVal(69- 1);  		    //定时器初值,8000000/115200=69.4
 191  004c ae0044        	ldw	x,#68
 192  004f               LC001:
 193  004f adaf          	call	_Time1ReloadVal
 195                     ; 104 		break;
 197  0051               L16:
 198                     ; 108     TIM1->CR1 |= TIM1_CR1_CEN;
 200  0051 721052b0      	bset	21168,#0
 201                     ; 109 	tyUartParityFlag = 0;				//串口接收发送校验位清零	
 203  0055 725f0002      	clr	_tyUartParityFlag
 204                     ; 110 }
 207  0059 81            	ret	
 231                     ; 121 void TurnOffTimerUart(void)
 231                     ; 122 {
 232                     	switch	.text
 233  005a               _TurnOffTimerUart:
 237                     ; 124     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
 239  005a 721152b0      	bres	21168,#0
 240                     ; 125 	TurnOnExit();			        //打开外部中断
 243                     ; 126 }
 246  005e cc0000        	jp	_TurnOnExit
 281                     ; 137 void BusUartReceiveSave(u8 Data)
 281                     ; 138 {
 282                     	switch	.text
 283  0061               _BusUartReceiveSave:
 285  0061 88            	push	a
 286       00000000      OFST:	set	0
 289                     ; 140 	if(NUMBER_UART_RX == ucBusUartReciveLen)
 291  0062 c60004        	ld	a,_ucBusUartReciveLen
 292  0065 a1c0          	cp	a,#192
 293  0067 2606          	jrne	L701
 294                     ; 142 		ucBusUartReciveLen = NUMBER_UART_RX-1;
 296  0069 35bf0004      	mov	_ucBusUartReciveLen,#191
 297                     ; 143 		return ;
 300  006d 84            	pop	a
 301  006e 81            	ret	
 302  006f               L701:
 303                     ; 145 	ucBusUartReciveLen++;
 305  006f 725c0004      	inc	_ucBusUartReciveLen
 306                     ; 147 	aucUartRxBuffer[ucBusUartReceiveTail] = Data;	//读接收到的数据,同时清除中断标记
 308  0073 c60005        	ld	a,_ucBusUartReceiveTail
 309  0076 5f            	clrw	x
 310  0077 97            	ld	xl,a
 311  0078 7b01          	ld	a,(OFST+1,sp)
 312  007a d70009        	ld	(_aucUartRxBuffer,x),a
 313                     ; 148 	ucBusUartReceiveTail++;			                //接收缓冲中数据尾位置
 315  007d 725c0005      	inc	_ucBusUartReceiveTail
 316                     ; 149 	if (ucBusUartReceiveTail > (NUMBER_UART_RX - 1) )		//尾到头?
 318  0081 c60005        	ld	a,_ucBusUartReceiveTail
 319  0084 a1c0          	cp	a,#192
 320  0086 2504          	jrult	L111
 321                     ; 151 		ucBusUartReceiveTail = 0;			//接收缓冲中数据尾位置
 323  0088 725f0005      	clr	_ucBusUartReceiveTail
 324  008c               L111:
 325                     ; 153 }
 328  008c 84            	pop	a
 329  008d 81            	ret	
 360                     ; 164 void ReceivedBusUart2Tail(void)
 360                     ; 165 {
 361                     	switch	.text
 362  008e               _ReceivedBusUart2Tail:
 366                     ; 166 	TurnOffTimerUart();		//关闭定时器
 368  008e adca          	call	_TurnOffTimerUart
 370                     ; 167 	if (CheckUart2Rx())		//尾必须为高 
 372  0090 4b10          	push	#16
 373  0092 ae500f        	ldw	x,#20495
 374  0095 cd0000        	call	_GPIO_ReadInputDataBit
 376  0098 5b01          	addw	sp,#1
 377  009a 4d            	tnz	a
 378  009b 2709          	jreq	L321
 379                     ; 169 		BusUartReceiveSave(ucDataBusUart2SoftReceive);	//读接收到的数据,同时清除中断标记
 381  009d c60002        	ld	a,_ucDataBusUart2SoftReceive
 382  00a0 adbf          	call	_BusUartReceiveSave
 384                     ; 170 		ucBusUartChannel = COM_2;		//收到数据
 386  00a2 350200ca      	mov	_ucBusUartChannel,#2
 387  00a6               L321:
 388                     ; 172 	ucNumberBusUart2SoftReceive = 0;		//接收数据2位数	
 390  00a6 725f00c9      	clr	_ucNumberBusUart2SoftReceive
 391                     ; 173 	nReceiveDataFlg = FALSE;
 393  00aa 725f0004      	clr	_nReceiveDataFlg
 394                     ; 174 }
 397  00ae 81            	ret	
 427                     ; 185 void ReceivedBusUart2(void)
 427                     ; 186 {
 428                     	switch	.text
 429  00af               _ReceivedBusUart2:
 433                     ; 187 	switch (ucNumberBusUart2SoftReceive)		//接收数据2位数
 435  00af c600c9        	ld	a,_ucNumberBusUart2SoftReceive
 437                     ; 261 		break;
 438  00b2 2720          	jreq	L521
 439  00b4 a009          	sub	a,#9
 440  00b6 272b          	jreq	L131
 441  00b8 4a            	dec	a
 442  00b9 2763          	jreq	L541
 443                     ; 197 	default:		//1~8
 443                     ; 198 		ucNumberBusUart2SoftReceive++;		//接收数据2位数
 445  00bb 725c00c9      	inc	_ucNumberBusUart2SoftReceive
 446                     ; 199 		ucDataBusUart2SoftReceive >>= 1;			//LSB,数据右移1位
 448  00bf 72540002      	srl	_ucDataBusUart2SoftReceive
 449                     ; 200 		if (CheckUart2Rx() )		//判断数据位
 451  00c3 ad5d          	call	LC005
 452  00c5 275a          	jreq	L161
 453                     ; 202 			ucDataBusUart2SoftReceive |= 0x80;		//接收数据2
 455  00c7 721e0002      	bset	_ucDataBusUart2SoftReceive,#7
 456                     ; 203 			b2ParityReceive ^= 1;
 458  00cb c60002        	ld	a,_tyUartParityFlag
 459  00ce a801          	xor	a,#1
 460  00d0 c70002        	ld	_tyUartParityFlag,a
 462  00d3 81            	ret	
 463  00d4               L521:
 464                     ; 189 	case 0:
 464                     ; 190 		b2ParityReceiveError = 0;			//串口2接收数据校验位错误
 466  00d4 c70003        	ld	_tyUartParityFlagError,a
 467                     ; 191 		if (!CheckUart2Rx() )		//头为高?
 469  00d7 ad49          	call	LC005
 470  00d9 2646          	jrne	L161
 471                     ; 193 			ucNumberBusUart2SoftReceive++;		//接收数据2位数
 473  00db 725c00c9      	inc	_ucNumberBusUart2SoftReceive
 474                     ; 194 			ucDataBusUart2SoftReceive = 0;		//接收数据2
 476  00df c70002        	ld	_ucDataBusUart2SoftReceive,a
 478  00e2 81            	ret	
 479  00e3               L131:
 480                     ; 206 	case 9:		//停止位,or校验位
 480                     ; 207 		ucNumberBusUart2SoftReceive++;		//接收数据2位数
 482  00e3 725c00c9      	inc	_ucNumberBusUart2SoftReceive
 483                     ; 208 		switch (d2ParityMode)
 485  00e7 c60001        	ld	a,_tyUartModeFlag
 487                     ; 256 			break;
 488  00ea 2732          	jreq	L541
 489  00ec 4a            	dec	a
 490  00ed 2720          	jreq	LC004
 491  00ef 4a            	dec	a
 492  00f0 2707          	jreq	L531
 493  00f2 4a            	dec	a
 494  00f3 270a          	jreq	L141
 495  00f5 4a            	dec	a
 496  00f6 2712          	jreq	L341
 498  00f8 81            	ret	
 499                     ; 210 		case PARITY_NULL:
 499                     ; 211 			ReceivedBusUart2Tail();
 501                     ; 212 			break;
 503  00f9               L531:
 504                     ; 213 		case PARITY_HIGH:
 504                     ; 214 			if (!CheckUart2Rx() )		//判断校验位
 506  00f9 ad27          	call	LC005
 507  00fb 2624          	jrne	L161
 508                     ; 216 				b2ParityReceiveError = 1;			//串口2接收数据校验位错误
 509  00fd 2014          	jp	LC003
 510                     ; 219 		case PARITY_LOW:
 510                     ; 220 			if (CheckUart2Rx() )		//判断校验位
 512                     ; 222 				b2ParityReceiveError = 1;			//串口2接收数据校验位错误
 513  00ff               L141:
 514                     ; 225 		case PARITY_EVEN:
 514                     ; 226 			if (b2ParityReceive)
 516  00ff c60002        	ld	a,_tyUartParityFlag
 517  0102 270b          	jreq	LC004
 518                     ; 228 				if (!CheckUart2Rx() )		//判断校验位
 520  0104 ad1c          	call	LC005
 521  0106 2619          	jrne	L161
 522                     ; 230 					b2ParityReceiveError = 1;			//串口2接收数据校验位错误
 523  0108 2009          	jp	LC003
 524                     ; 235 				if (CheckUart2Rx() )		//判断校验位
 526                     ; 237 					b2ParityReceiveError = 1;			//串口2接收数据校验位错误
 527  010a               L341:
 528                     ; 241 		case PARITY_ODD:
 528                     ; 242 			if (b2ParityReceive)
 530  010a c60002        	ld	a,_tyUartParityFlag
 531  010d 2709          	jreq	L702
 532                     ; 244 				if (CheckUart2Rx() )		//判断校验位
 535  010f               LC004:
 538  010f ad11          	call	LC005
 539  0111 270e          	jreq	L161
 540                     ; 246 					b2ParityReceiveError = 1;			//串口2接收数据校验位错误
 542  0113               LC003:
 548  0113 35010003      	mov	_tyUartParityFlagError,#1
 550  0117 81            	ret	
 551  0118               L702:
 552                     ; 251 				if (!CheckUart2Rx() )		//判断校验位
 554  0118 ad08          	call	LC005
 555  011a 2605          	jrne	L161
 556                     ; 253 					b2ParityReceiveError = 1;			//串口2接收数据校验位错误
 557  011c 20f5          	jp	LC003
 558                     ; 258 		break;
 560  011e               L541:
 561                     ; 259 	case 10:		//停止位
 561                     ; 260 		ReceivedBusUart2Tail();
 564  011e cd008e        	call	_ReceivedBusUart2Tail
 566                     ; 261 		break;
 568  0121               L161:
 569                     ; 263 }
 572  0121 81            	ret	
 574  0122               LC005:
 575  0122 4b10          	push	#16
 576  0124 ae500f        	ldw	x,#20495
 577  0127 cd0000        	call	_GPIO_ReadInputDataBit
 579  012a 5b01          	addw	sp,#1
 580  012c 4d            	tnz	a
 581  012d 81            	ret	
 621                     ; 274 void SetBusUart(u8 Channel, u8 Parity)
 621                     ; 275 {
 622                     	switch	.text
 623  012e               _SetBusUart:
 625  012e 89            	pushw	x
 626       00000000      OFST:	set	0
 629                     ; 276 	ucBusUartChannel = Channel;
 631  012f 9e            	ld	a,xh
 632  0130 c700ca        	ld	_ucBusUartChannel,a
 633                     ; 277 	switch (ucBusUartChannel)		//只有2,3通道才可以设置校验位
 635  0133 a102          	cp	a,#2
 636  0135 2605          	jrne	L142
 639                     ; 279 	case COM_2:
 639                     ; 280 		d2ParityMode = Parity;		//设置校验位模式
 641  0137 7b02          	ld	a,(OFST+2,sp)
 642  0139 c70001        	ld	_tyUartModeFlag,a
 643                     ; 281 		break;
 645  013c               L142:
 646                     ; 283 }
 649  013c 85            	popw	x
 650  013d 81            	ret	
 684                     ; 295 void SetBusUartBaudate(u8 Baudate)
 684                     ; 296 {
 685                     	switch	.text
 686  013e               _SetBusUartBaudate:
 688  013e 88            	push	a
 689       00000000      OFST:	set	0
 692                     ; 297 	TurnOffTimerUart();		//关闭定时器 add by maronglang 20170524
 694  013f cd005a        	call	_TurnOffTimerUart
 696                     ; 298 	ucBusUartBaudate = Baudate;	
 698  0142 7b01          	ld	a,(OFST+1,sp)
 699  0144 c70007        	ld	_ucBusUartBaudate,a
 700                     ; 299 }
 703  0147 84            	pop	a
 704  0148 81            	ret	
 739                     ; 310 void HandleBusUartSoft(void)
 739                     ; 311 {
 740                     	switch	.text
 741  0149               _HandleBusUartSoft:
 745                     ; 312 	if (b2SendingData)
 747  0149 c60000        	ld	a,_tyUartBusyFlag
 748  014c 2603cc0203    	jreq	L703
 749                     ; 314 		switch (ucNumberBusUart2SoftSend)		//发送数据2位数
 751  0151 c60000        	ld	a,_ucNumberBusUart2SoftSend
 753                     ; 379 			break;
 754  0154 2720          	jreq	L752
 755  0156 a009          	sub	a,#9
 756  0158 274f          	jreq	L362
 757  015a 4a            	dec	a
 758  015b 277b          	jreq	L572
 759                     ; 322 		default:			//1~8
 759                     ; 323 			if (ucDataBusUart2SoftSend & 1)		//LSB
 761  015d 7201000333    	btjf	_ucDataBusUart2SoftSend,#0,L513
 762                     ; 325 				SendUart2PinHigh();
 764  0162 4b01          	push	#1
 765  0164 4b80          	push	#128
 766  0166 ae5005        	ldw	x,#20485
 767  0169 cd0000        	call	_GPIO_WriteBit
 769  016c c60002        	ld	a,_tyUartParityFlag
 770  016f a801          	xor	a,#1
 771  0171 c70002        	ld	_tyUartParityFlag,a
 772                     ; 326 				b2ParitySend ^= 1;
 775  0174 2029          	jra	L713
 776  0176               L752:
 777                     ; 316 		case 0:
 777                     ; 317 			ucNumberBusUart2SoftSend++;		//发送数据2位数
 779  0176 725c0000      	inc	_ucNumberBusUart2SoftSend
 780                     ; 318 			ucDataBusUart2SoftSend = aucUartTxBuffer[uCountBusUartSend];
 782  017a c60008        	ld	a,_uCountBusUartSend
 783  017d 5f            	clrw	x
 784  017e 97            	ld	xl,a
 785  017f d600cb        	ld	a,(_aucUartTxBuffer,x)
 786  0182 c70003        	ld	_ucDataBusUart2SoftSend,a
 787                     ; 319 			SendUart2PinLow();		//开始位
 789  0185 4b00          	push	#0
 790  0187 4b80          	push	#128
 791  0189 ae5005        	ldw	x,#20485
 792  018c cd0000        	call	_GPIO_WriteBit
 794  018f 725f0002      	clr	_tyUartParityFlag
 795  0193 85            	popw	x
 796                     ; 320 			b2ParitySend = 0;
 798                     ; 321 			break;
 801  0194 81            	ret	
 802  0195               L513:
 803                     ; 330 				SendUart2PinLow();
 805  0195 4b00          	push	#0
 806  0197 4b80          	push	#128
 807  0199 ae5005        	ldw	x,#20485
 808  019c cd0000        	call	_GPIO_WriteBit
 810  019f               L713:
 811  019f 72540003      	srl	_ucDataBusUart2SoftSend
 812  01a3 725c0000      	inc	_ucNumberBusUart2SoftSend
 813  01a7 85            	popw	x
 814                     ; 332 			ucDataBusUart2SoftSend >>= 1;			//LSB,数据右移1位
 816                     ; 333 			ucNumberBusUart2SoftSend++;		//发送数据2位数
 818                     ; 334 			break;
 821  01a8 81            	ret	
 822  01a9               L362:
 823                     ; 335 		case 9:		//停止位,or校验位
 823                     ; 336 			switch (d2ParityMode)
 825  01a9 c60001        	ld	a,_tyUartModeFlag
 827                     ; 363 				break;
 828  01ac a002          	sub	a,#2
 829  01ae 2708          	jreq	L762
 830  01b0 4a            	dec	a
 831  01b1 2710          	jreq	L372
 832  01b3 4a            	dec	a
 833  01b4 2706          	jreq	L172
 834  01b6 201b          	jra	L323
 835                     ; 338 			case PARITY_NULL:
 835                     ; 339 				break;//ucNumberBusUart2SoftSend++;		//跳过校验位 edit by maronglang 20170524
 837  01b8               L762:
 838                     ; 340 			case PARITY_HIGH:
 838                     ; 341 				SendUart2PinHigh();
 842  01b8 4b01          	push	#1
 844                     ; 342 				break;
 846  01ba 200e          	jp	LC006
 847  01bc               L172:
 848                     ; 343 			case PARITY_ODD:
 848                     ; 344 				if (b2ParitySend)
 850  01bc c60002        	ld	a,_tyUartParityFlag
 851  01bf 27f7          	jreq	L762
 852                     ; 346 					SendUart2PinLow();
 855  01c1 2005          	jp	L133
 856                     ; 350 					SendUart2PinHigh();
 858  01c3               L372:
 859                     ; 353 			case PARITY_EVEN:
 859                     ; 354 				if (b2ParitySend)
 861  01c3 c60002        	ld	a,_tyUartParityFlag
 862                     ; 356 					SendUart2PinHigh();
 865  01c6 26f0          	jrne	L762
 866  01c8               L133:
 867                     ; 361 					SendUart2PinLow();
 870  01c8 4b00          	push	#0
 872  01ca               LC006:
 873  01ca 4b80          	push	#128
 874  01cc ae5005        	ldw	x,#20485
 875  01cf cd0000        	call	_GPIO_WriteBit
 876  01d2 85            	popw	x
 877  01d3               L323:
 878                     ; 365 			ucNumberBusUart2SoftSend++;		//发送数据2位数
 880  01d3 725c0000      	inc	_ucNumberBusUart2SoftSend
 881                     ; 366 			break;
 884  01d7 81            	ret	
 885  01d8               L572:
 886                     ; 367 		case 10:		//停止位
 886                     ; 368 			//ucNumberBusUart2SoftSend++;		//发送数据尾
 886                     ; 369 			SendUart2PinHigh();			
 888  01d8 4b01          	push	#1
 889  01da 4b80          	push	#128
 890  01dc ae5005        	ldw	x,#20485
 891  01df cd0000        	call	_GPIO_WriteBit
 893  01e2 725c0008      	inc	_uCountBusUartSend
 894  01e6 c60008        	ld	a,_uCountBusUartSend
 895  01e9 c10001        	cp	a,_ucNumberBusUartSend
 896  01ec 85            	popw	x
 897                     ; 370 			uCountBusUartSend++;			//已经发送数据的数量
 899                     ; 371 			if (uCountBusUartSend >= ucNumberBusUartSend)		//全部数据发送完?
 901  01ed 250f          	jrult	L533
 902                     ; 373 				TurnOffTimerUart(); 	        //关闭定时器
 904  01ef cd005a        	call	_TurnOffTimerUart
 906                     ; 374 				ucNumberBusUartSend = 0;		//需要发送数据的数量
 908  01f2 725f0001      	clr	_ucNumberBusUartSend
 909                     ; 375 				uCountBusUartSend = 0;			//已经发送数据的数量
 911  01f6 725f0008      	clr	_uCountBusUartSend
 912                     ; 376 				b2SendingData = 0;
 914  01fa 725f0000      	clr	_tyUartBusyFlag
 915  01fe               L533:
 916                     ; 378 			ucNumberBusUart2SoftSend = 0;		//发送数据2位数			
 918  01fe 725f0000      	clr	_ucNumberBusUart2SoftSend
 919                     ; 379 			break;
 922  0202 81            	ret	
 924  0203               L703:
 925                     ; 395 	else if (nReceiveDataFlg)				//接收数据
 927  0203 c60004        	ld	a,_nReceiveDataFlg
 928  0206 2703          	jreq	L733
 929                     ; 397 		ReceivedBusUart2();
 931  0208 cd00af        	call	_ReceivedBusUart2
 933  020b               L733:
 934                     ; 399 }
 937  020b 81            	ret	
1203                     ; 508 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
1203                     ; 509 {
1204                     	switch	.text
1205  020c               _USART_ITConfig:
1207  020c 89            	pushw	x
1208  020d 89            	pushw	x
1209       00000002      OFST:	set	2
1212                     ; 510   uint8_t usartreg, itpos = 0x00;
1214                     ; 511   assert_param(IS_USART_CONFIG_IT(USART_IT));
1216                     ; 512   assert_param(IS_FUNCTIONAL_STATE(NewState));
1218                     ; 515   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
1220  020e 7b07          	ld	a,(OFST+5,sp)
1221  0210 6b01          	ld	(OFST-1,sp),a
1222                     ; 517   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
1224  0212 7b08          	ld	a,(OFST+6,sp)
1225  0214 a40f          	and	a,#15
1226  0216 5f            	clrw	x
1227  0217 97            	ld	xl,a
1228  0218 a601          	ld	a,#1
1229  021a 5d            	tnzw	x
1230  021b 2704          	jreq	L631
1231  021d               L041:
1232  021d 48            	sll	a
1233  021e 5a            	decw	x
1234  021f 26fc          	jrne	L041
1235  0221               L631:
1236  0221 6b02          	ld	(OFST+0,sp),a
1237                     ; 519   if (NewState != DISABLE)
1239  0223 7b09          	ld	a,(OFST+7,sp)
1240  0225 2722          	jreq	L515
1241                     ; 522     if (usartreg == 0x01)
1243  0227 7b01          	ld	a,(OFST-1,sp)
1244  0229 a101          	cp	a,#1
1245  022b 2608          	jrne	L715
1246                     ; 524       USARTx->CR1 |= itpos;
1248  022d 1e03          	ldw	x,(OFST+1,sp)
1249  022f e604          	ld	a,(4,x)
1250  0231 1a02          	or	a,(OFST+0,sp)
1252  0233 2021          	jp	LC010
1253  0235               L715:
1254                     ; 526     else if (usartreg == 0x05)
1256  0235 a105          	cp	a,#5
1257  0237 2608          	jrne	L325
1258                     ; 528       USARTx->CR5 |= itpos;
1260  0239 1e03          	ldw	x,(OFST+1,sp)
1261  023b e608          	ld	a,(8,x)
1262  023d 1a02          	or	a,(OFST+0,sp)
1264  023f 2024          	jp	LC011
1265  0241               L325:
1266                     ; 533       USARTx->CR2 |= itpos;
1268  0241 1e03          	ldw	x,(OFST+1,sp)
1269  0243 e605          	ld	a,(5,x)
1270  0245 1a02          	or	a,(OFST+0,sp)
1271  0247 2027          	jp	LC009
1272  0249               L515:
1273                     ; 539     if (usartreg == 0x01)
1275  0249 7b01          	ld	a,(OFST-1,sp)
1276  024b a101          	cp	a,#1
1277  024d 260b          	jrne	L135
1278                     ; 541       USARTx->CR1 &= (uint8_t)(~itpos);
1280  024f 1e03          	ldw	x,(OFST+1,sp)
1281  0251 7b02          	ld	a,(OFST+0,sp)
1282  0253 43            	cpl	a
1283  0254 e404          	and	a,(4,x)
1284  0256               LC010:
1285  0256 e704          	ld	(4,x),a
1287  0258 2018          	jra	L725
1288  025a               L135:
1289                     ; 543     else if (usartreg == 0x05)
1291  025a a105          	cp	a,#5
1292  025c 260b          	jrne	L535
1293                     ; 545       USARTx->CR5 &= (uint8_t)(~itpos);
1295  025e 1e03          	ldw	x,(OFST+1,sp)
1296  0260 7b02          	ld	a,(OFST+0,sp)
1297  0262 43            	cpl	a
1298  0263 e408          	and	a,(8,x)
1299  0265               LC011:
1300  0265 e708          	ld	(8,x),a
1302  0267 2009          	jra	L725
1303  0269               L535:
1304                     ; 550       USARTx->CR2 &= (uint8_t)(~itpos);
1306  0269 1e03          	ldw	x,(OFST+1,sp)
1307  026b 7b02          	ld	a,(OFST+0,sp)
1308  026d 43            	cpl	a
1309  026e e405          	and	a,(5,x)
1310  0270               LC009:
1311  0270 e705          	ld	(5,x),a
1312  0272               L725:
1313                     ; 553 }
1316  0272 5b04          	addw	sp,#4
1317  0274 81            	ret	
1362                     .const:	section	.text
1363  0000               L641:
1364  0000 00004b00      	dc.l	19200
1365                     ; 564 void Usart1Initialize(void)
1365                     ; 565 {
1366                     	switch	.text
1367  0275               _Usart1Initialize:
1369  0275 5205          	subw	sp,#5
1370       00000005      OFST:	set	5
1373                     ; 566 	uint32_t BaudRate_Mantissa = 0;
1375  0277 5f            	clrw	x
1376  0278 1f04          	ldw	(OFST-1,sp),x
1377  027a 1f02          	ldw	(OFST-3,sp),x
1378                     ; 567 	uint8_t usartreg, itpos = 0x00;
1380  027c 0f01          	clr	(OFST-4,sp)
1381                     ; 571 	(void) USART1->SR;
1383  027e c65230        	ld	a,21040
1384                     ; 572 	(void) USART1->DR;	
1386  0281 c65231        	ld	a,21041
1387                     ; 573 	USART1->BRR2 = USART_BRR2_RESET_VALUE;	/* Set USART_BRR2 to reset value 0x00 */
1389  0284 725f5233      	clr	21043
1390                     ; 574 	USART1->BRR1 = USART_BRR1_RESET_VALUE;	/* Set USART_BRR1 to reset value 0x00 */
1392  0288 725f5232      	clr	21042
1393                     ; 576 	USART1->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
1395  028c 725f5234      	clr	21044
1396                     ; 577 	USART1->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
1398  0290 725f5235      	clr	21045
1399                     ; 578 	USART1->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
1401  0294 725f5236      	clr	21046
1402                     ; 579 	USART1->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
1404  0298 725f5237      	clr	21047
1405                     ; 585 	USART1->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
1407  029c c65234        	ld	a,21044
1408  029f a4e9          	and	a,#233
1409  02a1 c75234        	ld	21044,a
1410                     ; 588 	USART1->CR1 |= (uint8_t)((uint8_t)USART_WordLength_8b | (uint8_t)USART_Parity_No);
1412  02a4 c65234        	ld	a,21044
1413                     ; 591 	USART1->CR3 &= (uint8_t)(~USART_CR3_STOP);
1415  02a7 c65236        	ld	a,21046
1416  02aa a4cf          	and	a,#207
1417  02ac c75236        	ld	21046,a
1418                     ; 593 	USART1->CR3 |= (uint8_t)USART_StopBits_1;
1420  02af c65236        	ld	a,21046
1421                     ; 596 	USART1->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
1423  02b2 725f5232      	clr	21042
1424                     ; 598 	USART1->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
1426  02b6 c65233        	ld	a,21043
1427  02b9 a40f          	and	a,#15
1428  02bb c75233        	ld	21043,a
1429                     ; 600 	USART1->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
1431  02be c65233        	ld	a,21043
1432  02c1 a4f0          	and	a,#240
1433  02c3 c75233        	ld	21043,a
1434                     ; 602 	BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / 19200 ); //115200
1436  02c6 cd0000        	call	_CLK_GetClockFreq
1438  02c9 ae0000        	ldw	x,#L641
1439  02cc cd0000        	call	c_ludv
1441  02cf 96            	ldw	x,sp
1442  02d0 1c0002        	addw	x,#OFST-3
1443  02d3 cd0000        	call	c_rtol
1445                     ; 604 	USART1->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
1447  02d6 7b04          	ld	a,(OFST-1,sp)
1448  02d8 a4f0          	and	a,#240
1449  02da c75233        	ld	21043,a
1450                     ; 606 	USART1->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
1452  02dd 7b05          	ld	a,(OFST+0,sp)
1453  02df a40f          	and	a,#15
1454  02e1 ca5233        	or	a,21043
1455  02e4 c75233        	ld	21043,a
1456                     ; 608 	USART1->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
1458  02e7 96            	ldw	x,sp
1459  02e8 1c0002        	addw	x,#OFST-3
1460  02eb cd0000        	call	c_ltor
1462  02ee a604          	ld	a,#4
1463  02f0 cd0000        	call	c_lursh
1465  02f3 5500035232    	mov	21042,c_lreg+3
1466                     ; 611 	USART1->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
1468  02f8 c65235        	ld	a,21045
1469  02fb a4f3          	and	a,#243
1470  02fd c75235        	ld	21045,a
1471                     ; 613 	USART1->CR2 |= (uint8_t)USART_Mode_Rx|USART_Mode_Tx;
1473  0300 c65235        	ld	a,21045
1474  0303 aa0c          	or	a,#12
1475  0305 c75235        	ld	21045,a
1476                     ; 617 	USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
1478  0308 4b01          	push	#1
1479  030a ae0255        	ldw	x,#597
1480  030d 89            	pushw	x
1481  030e ae5230        	ldw	x,#21040
1482  0311 cd020c        	call	_USART_ITConfig
1484  0314 5b03          	addw	sp,#3
1485                     ; 621 	USART_ITConfig(USART1, USART_IT_TC, ENABLE);
1487  0316 4b01          	push	#1
1488  0318 ae0266        	ldw	x,#614
1489  031b 89            	pushw	x
1490  031c ae5230        	ldw	x,#21040
1491  031f cd020c        	call	_USART_ITConfig
1493  0322 5b03          	addw	sp,#3
1494                     ; 623 	TurnBusUartOn();
1496  0324 cd0402        	call	_TurnBusUartOn
1498                     ; 625 	SetBusUartBaudate(BAUDRATE_2400);
1500  0327 a602          	ld	a,#2
1501  0329 cd013e        	call	_SetBusUartBaudate
1503                     ; 626 	SetBusUart(COM_2, PARITY_EVEN); 
1505  032c ae0003        	ldw	x,#3
1506  032f a602          	ld	a,#2
1507  0331 95            	ld	xh,a
1508  0332 cd012e        	call	_SetBusUart
1510                     ; 630 	ClearRxBuff();
1512  0335 cd0424        	call	_ClearRxBuff
1514                     ; 631 }
1517  0338 5b05          	addw	sp,#5
1518  033a 81            	ret	
1545                     ; 642 void SendBusUartOver(void)
1545                     ; 643 {
1546                     	switch	.text
1547  033b               _SendBusUartOver:
1551                     ; 644 	uCountBusUartSend++;			//已经发送数据的数量++
1553  033b 725c0008      	inc	_uCountBusUartSend
1554                     ; 645 	if (uCountBusUartSend < ucNumberBusUartSend)		//全部数据发送完?
1556  033f c60008        	ld	a,_uCountBusUartSend
1557  0342 c10001        	cp	a,_ucNumberBusUartSend
1558  0345 2409          	jruge	L765
1559                     ; 647 		USART1->DR = aucUartTxBuffer[uCountBusUartSend];
1561  0347 5f            	clrw	x
1562  0348 97            	ld	xl,a
1563  0349 d600cb        	ld	a,(_aucUartTxBuffer,x)
1564  034c c75231        	ld	21041,a
1567  034f 81            	ret	
1568  0350               L765:
1569                     ; 652 		ucNumberBusUartSend = 0;		//需要发送数据的数量
1571  0350 725f0001      	clr	_ucNumberBusUartSend
1572                     ; 653 		uCountBusUartSend = 0;			//已经发送数据的数量		
1574  0354 725f0008      	clr	_uCountBusUartSend
1575                     ; 654 		USART_ITConfig(USART1, USART_IT_TC, DISABLE);
1577  0358 4b00          	push	#0
1578  035a ae0266        	ldw	x,#614
1579  035d 89            	pushw	x
1580  035e ae5230        	ldw	x,#21040
1581  0361 cd020c        	call	_USART_ITConfig
1583  0364 5b03          	addw	sp,#3
1584                     ; 658 }
1587  0366 81            	ret	
1612                     ; 669 void ReceivedBusUart(void)
1612                     ; 670 {
1613                     	switch	.text
1614  0367               _ReceivedBusUart:
1618                     ; 671 	ucBusUartChannel = COM_1;
1620  0367 350100ca      	mov	_ucBusUartChannel,#1
1621                     ; 672 	BusUartReceiveSave(USART1->DR);	//读接收到的数据,同时清除中断标记
1623  036b c65231        	ld	a,21041
1625                     ; 673 }
1628  036e cc0061        	jp	_BusUartReceiveSave
1678                     	switch	.const
1679  0004               L012:
1680  0004 000003e9      	dc.l	1001
1681                     ; 684 void StartSendBusUartGroup(u8 Length)
1681                     ; 685 {
1682                     	switch	.text
1683  0371               _StartSendBusUartGroup:
1685  0371 5204          	subw	sp,#4
1686       00000004      OFST:	set	4
1689                     ; 686 	u32 dwTick = 0;
1691  0373 5f            	clrw	x
1692  0374 1f03          	ldw	(OFST-1,sp),x
1693  0376 1f01          	ldw	(OFST-3,sp),x
1694                     ; 688 	ucNumberBusUartSend = Length;		            //需要发送数据的数量
1696  0378 c70001        	ld	_ucNumberBusUartSend,a
1697                     ; 689 	uCountBusUartSend = 0;			                //已经发送数据的数量
1699  037b 725f0008      	clr	_uCountBusUartSend
1700                     ; 690 	switch (ucBusUartChannel)
1702  037f c600ca        	ld	a,_ucBusUartChannel
1704                     ; 702 		break;
1705  0382 4a            	dec	a
1706  0383 2705          	jreq	L306
1707  0385 4a            	dec	a
1708  0386 2717          	jreq	L506
1709  0388 202b          	jra	L726
1710  038a               L306:
1711                     ; 692 	case COM_1:		
1711                     ; 693 		USART_ITConfig(USART1, USART_IT_TC, ENABLE);
1713  038a 4b01          	push	#1
1714  038c ae0266        	ldw	x,#614
1715  038f 89            	pushw	x
1716  0390 ae5230        	ldw	x,#21040
1717  0393 cd020c        	call	_USART_ITConfig
1719  0396 5b03          	addw	sp,#3
1720                     ; 694 		USART1->DR = aucUartTxBuffer[0]; //发送第一个数据
1722  0398 5500cb5231    	mov	21041,_aucUartTxBuffer
1723                     ; 695 		break;
1725  039d 2016          	jra	L726
1726  039f               L506:
1727                     ; 697 	case COM_2:
1727                     ; 698 		b2SendingData = TRUE;			//正在发送数据
1729  039f 35010000      	mov	_tyUartBusyFlag,#1
1730                     ; 699 		SendUart2PinHigh();		    //485转换到发送模式
1732  03a3 4b01          	push	#1
1733  03a5 4b80          	push	#128
1734  03a7 ae5005        	ldw	x,#20485
1735  03aa cd0000        	call	_GPIO_WriteBit
1737  03ad 725f0000      	clr	_ucNumberBusUart2SoftSend
1738  03b1 85            	popw	x
1739                     ; 700 		ucNumberBusUart2SoftSend = 0;		//发送数据2位数
1741                     ; 701 		TurnOnTimerUart();
1743  03b2 cd0009        	call	_TurnOnTimerUart
1745                     ; 702 		break;
1747  03b5               L726:
1748                     ; 706 	dwTick = GetSysTemTick();
1750  03b5 cd0000        	call	_GetSysTemTick
1752  03b8 96            	ldw	x,sp
1753  03b9 5c            	incw	x
1754  03ba cd0000        	call	c_rtol
1757  03bd 2013          	jra	L536
1758  03bf               L136:
1759                     ; 709 		if(1000 < GetSysTemTick() - dwTick)
1761  03bf cd0000        	call	_GetSysTemTick
1763  03c2 96            	ldw	x,sp
1764  03c3 5c            	incw	x
1765  03c4 cd0000        	call	c_lsub
1767  03c7 ae0004        	ldw	x,#L012
1768  03ca cd0000        	call	c_lcmp
1770  03cd 2503          	jrult	L536
1771                     ; 711 			break;
1772  03cf               L736:
1773                     ; 714 	return ;
1776  03cf 5b04          	addw	sp,#4
1777  03d1 81            	ret	
1778  03d2               L536:
1779                     ; 707 	while(0 < ucNumberBusUartSend)
1781  03d2 c60001        	ld	a,_ucNumberBusUartSend
1782  03d5 26e8          	jrne	L136
1783  03d7 20f6          	jra	L736
1818                     ; 726 u8 GetBusUartData(void)		//从缓冲区读取一组UART数据
1818                     ; 727 {
1819                     	switch	.text
1820  03d9               _GetBusUartData:
1822  03d9 88            	push	a
1823       00000001      OFST:	set	1
1826                     ; 729 	code = aucUartRxBuffer[ucBusUartReceiveHead];	//读接收到的数据,同时清除中断标记
1828  03da c60006        	ld	a,_ucBusUartReceiveHead
1829  03dd 5f            	clrw	x
1830  03de 97            	ld	xl,a
1831  03df d60009        	ld	a,(_aucUartRxBuffer,x)
1832  03e2 6b01          	ld	(OFST+0,sp),a
1833                     ; 730 	ucBusUartReceiveHead++;
1835  03e4 725c0006      	inc	_ucBusUartReceiveHead
1836                     ; 731 	if (ucBusUartReceiveHead > (NUMBER_UART_RX - 1) )
1838  03e8 c60006        	ld	a,_ucBusUartReceiveHead
1839  03eb a1c0          	cp	a,#192
1840  03ed 2504          	jrult	L756
1841                     ; 733 		ucBusUartReceiveHead = 0;
1843  03ef 725f0006      	clr	_ucBusUartReceiveHead
1844  03f3               L756:
1845                     ; 736 	ucBusUartReciveLen--;
1847  03f3 725a0004      	dec	_ucBusUartReciveLen
1848                     ; 737 	if(0 == ucBusUartReciveLen)
1850  03f7 2604          	jrne	L166
1851                     ; 739 		ucBusUartReciveLen = 0;
1853  03f9 725f0004      	clr	_ucBusUartReciveLen
1854  03fd               L166:
1855                     ; 741 	return code;
1857  03fd 7b01          	ld	a,(OFST+0,sp)
1860  03ff 5b01          	addw	sp,#1
1861  0401 81            	ret	
1884                     ; 753 void TurnBusUartOn(void)			//打开UART
1884                     ; 754 {
1885                     	switch	.text
1886  0402               _TurnBusUartOn:
1890                     ; 756     USART1->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
1892  0402 721b5234      	bres	21044,#5
1893                     ; 757 }
1896  0406 81            	ret	
1919                     ; 768 void TurnBusUartOff(void)
1919                     ; 769 {
1920                     	switch	.text
1921  0407               _TurnBusUartOff:
1925                     ; 771     USART1->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
1927  0407 721a5234      	bset	21044,#5
1928                     ; 772 }
1931  040b 81            	ret	
1967                     ; 783 u8 CheckWhichBusUartReceive(void)
1967                     ; 784 {
1968                     	switch	.text
1969  040c               _CheckWhichBusUartReceive:
1971  040c 88            	push	a
1972       00000001      OFST:	set	1
1975                     ; 785 	u8 code = 0;
1977  040d 0f01          	clr	(OFST+0,sp)
1978                     ; 787 	if (ucBusUartReceiveHead == ucBusUartReceiveTail)		//头等于尾? 后续增加计算接收数据
1980  040f c60006        	ld	a,_ucBusUartReceiveHead
1981  0412 c10005        	cp	a,_ucBusUartReceiveTail
1982  0415 2603          	jrne	L717
1983                     ; 789 		code = COM_0;			//无数据
1985  0417 4f            	clr	a
1987  0418 2003          	jra	L127
1988  041a               L717:
1989                     ; 793 		code = ucBusUartChannel;		//输出通道号
1991  041a c600ca        	ld	a,_ucBusUartChannel
1992  041d               L127:
1993                     ; 795 	return code;
1997  041d 5b01          	addw	sp,#1
1998  041f 81            	ret	
2022                     ; 809 u8 CheckRevDataLen(void)
2022                     ; 810 {
2023                     	switch	.text
2024  0420               _CheckRevDataLen:
2028                     ; 811 	return ucBusUartReciveLen;
2030  0420 c60004        	ld	a,_ucBusUartReciveLen
2033  0423 81            	ret	
2061                     ; 823 void ClearRxBuff(void)
2061                     ; 824 {
2062                     	switch	.text
2063  0424               _ClearRxBuff:
2067                     ; 825 	ucBusUartReciveLen = 0;
2069  0424 725f0004      	clr	_ucBusUartReciveLen
2070                     ; 826 	ucBusUartReceiveHead = 0;
2072  0428 725f0006      	clr	_ucBusUartReceiveHead
2073                     ; 827 	ucBusUartReceiveTail = 0;
2075  042c 725f0005      	clr	_ucBusUartReceiveTail
2076                     ; 828 	MemsetFunc(aucUartRxBuffer, 0, sizeof(aucUartRxBuffer));
2078  0430 4bc0          	push	#192
2079  0432 4b00          	push	#0
2080  0434 ae0009        	ldw	x,#_aucUartRxBuffer
2081  0437 cd0000        	call	_MemsetFunc
2083  043a 85            	popw	x
2084                     ; 829 }
2087  043b 81            	ret	
2125                     ; 840 void ClearRxBuffUnUsedLen(u8 UnUsednLen)
2125                     ; 841 {
2126                     	switch	.text
2127  043c               _ClearRxBuffUnUsedLen:
2129  043c 88            	push	a
2130       00000000      OFST:	set	0
2133                     ; 842 	if((ucBusUartReceiveHead+UnUsednLen+100 >= (NUMBER_UART_RX - 1) )||(ucBusUartReciveLen >= 100+ucBusUartReceiveHead))
2135  043d c60006        	ld	a,_ucBusUartReceiveHead
2136  0440 5f            	clrw	x
2137  0441 1b01          	add	a,(OFST+1,sp)
2138  0443 59            	rlcw	x
2139  0444 02            	rlwa	x,a
2140  0445 1c0064        	addw	x,#100
2141  0448 a300bf        	cpw	x,#191
2142  044b 2e17          	jrsge	L167
2144  044d c60004        	ld	a,_ucBusUartReciveLen
2145  0450 5f            	clrw	x
2146  0451 97            	ld	xl,a
2147  0452 bf01          	ldw	c_x+1,x
2148  0454 c60006        	ld	a,_ucBusUartReceiveHead
2149  0457 905f          	clrw	y
2150  0459 9097          	ld	yl,a
2151  045b 72a90064      	addw	y,#100
2152  045f 90b301        	cpw	y,c_x+1
2153  0462 2c04          	jrsgt	L757
2154  0464               L167:
2155                     ; 844 		ClearRxBuff();
2157  0464 adbe          	call	_ClearRxBuff
2159                     ; 845 		return ;
2162  0466 84            	pop	a
2163  0467 81            	ret	
2164  0468               L757:
2165                     ; 847 	ucBusUartReciveLen = ucBusUartReciveLen - UnUsednLen;
2167  0468 c60004        	ld	a,_ucBusUartReciveLen
2168  046b 1001          	sub	a,(OFST+1,sp)
2169  046d c70004        	ld	_ucBusUartReciveLen,a
2170                     ; 848 	MemsetFunc(&aucUartRxBuffer[ucBusUartReceiveHead], 0, UnUsednLen);
2172  0470 7b01          	ld	a,(OFST+1,sp)
2173  0472 88            	push	a
2174  0473 4b00          	push	#0
2175  0475 c60006        	ld	a,_ucBusUartReceiveHead
2176  0478 5f            	clrw	x
2177  0479 97            	ld	xl,a
2178  047a 1c0009        	addw	x,#_aucUartRxBuffer
2179  047d cd0000        	call	_MemsetFunc
2181  0480 c60006        	ld	a,_ucBusUartReceiveHead
2182  0483 85            	popw	x
2183                     ; 849 	ucBusUartReceiveHead = ucBusUartReceiveHead+UnUsednLen;
2185  0484 1b01          	add	a,(OFST+1,sp)
2186  0486 c70006        	ld	_ucBusUartReceiveHead,a
2187                     ; 850 }
2190  0489 84            	pop	a
2191  048a 81            	ret	
2217                     ; 861 u8* GetUartRxBuf(void)
2217                     ; 862 {
2218                     	switch	.text
2219  048b               _GetUartRxBuf:
2223                     ; 863 	return &aucUartRxBuffer[ucBusUartReceiveHead];
2225  048b c60006        	ld	a,_ucBusUartReceiveHead
2226  048e 5f            	clrw	x
2227  048f 97            	ld	xl,a
2228  0490 1c0009        	addw	x,#_aucUartRxBuffer
2231  0493 81            	ret	
2393                     	xdef	_ReceivedBusUart2Tail
2394                     	xdef	_BusUartReceiveSave
2395                     	xdef	_TurnOffTimerUart
2396                     	xdef	_Time1ReloadVal
2397                     	xdef	_tyUartParityFlagError
2398                     	xdef	_tyUartParityFlag
2399                     	xdef	_tyUartModeFlag
2400                     	xdef	_tyUartBusyFlag
2401                     	switch	.bss
2402  0000               _ucNumberBusUart2SoftSend:
2403  0000 00            	ds.b	1
2404                     	xdef	_ucNumberBusUart2SoftSend
2405  0001               _ucNumberBusUartSend:
2406  0001 00            	ds.b	1
2407                     	xdef	_ucNumberBusUartSend
2408  0002               _ucDataBusUart2SoftReceive:
2409  0002 00            	ds.b	1
2410                     	xdef	_ucDataBusUart2SoftReceive
2411  0003               _ucDataBusUart2SoftSend:
2412  0003 00            	ds.b	1
2413                     	xdef	_ucDataBusUart2SoftSend
2414  0004               _ucBusUartReciveLen:
2415  0004 00            	ds.b	1
2416                     	xdef	_ucBusUartReciveLen
2417  0005               _ucBusUartReceiveTail:
2418  0005 00            	ds.b	1
2419                     	xdef	_ucBusUartReceiveTail
2420  0006               _ucBusUartReceiveHead:
2421  0006 00            	ds.b	1
2422                     	xdef	_ucBusUartReceiveHead
2423  0007               _ucBusUartBaudate:
2424  0007 00            	ds.b	1
2425                     	xdef	_ucBusUartBaudate
2426  0008               _uCountBusUartSend:
2427  0008 00            	ds.b	1
2428                     	xdef	_uCountBusUartSend
2429  0009               _aucUartRxBuffer:
2430  0009 000000000000  	ds.b	192
2431                     	xdef	_aucUartRxBuffer
2432                     	xdef	_nReceiveDataFlg
2433                     	xdef	_ClearRxBuffUnUsedLen
2434                     	xdef	_Usart1Initialize
2435                     	xdef	_GetUartRxBuf
2436                     	xdef	_ClearRxBuff
2437                     	xdef	_CheckRevDataLen
2438                     	xdef	_TurnOnTimerUart
2439                     	xdef	_TurnBusUartOff
2440                     	xdef	_TurnBusUartOn
2441                     	xdef	_StartSendBusUartGroup
2442                     	xdef	_SetBusUart
2443                     	xdef	_SetBusUartBaudate
2444                     	xdef	_SendBusUartOver
2445                     	xdef	_ReceivedBusUart2
2446                     	xdef	_ReceivedBusUart
2447                     	xdef	_HandleBusUartSoft
2448                     	xdef	_GetBusUartData
2449                     	xdef	_CheckWhichBusUartReceive
2450  00c9               _ucNumberBusUart2SoftReceive:
2451  00c9 00            	ds.b	1
2452                     	xdef	_ucNumberBusUart2SoftReceive
2453  00ca               _ucBusUartChannel:
2454  00ca 00            	ds.b	1
2455                     	xdef	_ucBusUartChannel
2456  00cb               _aucUartTxBuffer:
2457  00cb 000000000000  	ds.b	192
2458                     	xdef	_aucUartTxBuffer
2459                     	xref	_TurnOffExit
2460                     	xref	_TurnOnExit
2461                     	xref	_MemsetFunc
2462                     	xref	_GetSysTemTick
2463                     	xdef	_USART_ITConfig
2464                     	xref	_GPIO_ReadInputDataBit
2465                     	xref	_GPIO_WriteBit
2466                     	xref	_CLK_GetClockFreq
2467                     	xref.b	c_lreg
2468                     	xref.b	c_x
2488                     	xref	c_lcmp
2489                     	xref	c_lsub
2490                     	xref	c_lursh
2491                     	xref	c_ltor
2492                     	xref	c_rtol
2493                     	xref	c_ludv
2494                     	end
