   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  73                     ; 38 ErrorStatus RTC_EnterInitMode(void)
  73                     ; 39 {
  75                     	switch	.text
  76  0000               _RTC_EnterInitMode:
  78  0000 5203          	subw	sp,#3
  79       00000003      OFST:	set	3
  82                     ; 40   ErrorStatus status = ERROR;
  84                     ; 41   uint16_t initfcount = 0;
  86  0002 5f            	clrw	x
  87  0003 1f02          	ldw	(OFST-1,sp),x
  88                     ; 44   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
  90  0005 720c514c13    	btjt	20812,#6,L14
  91                     ; 47     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
  93  000a 3580514c      	mov	20812,#128
  95  000e 2003          	jra	L74
  96  0010               L34:
  97                     ; 52       initfcount++;
  99  0010 5c            	incw	x
 100  0011 1f02          	ldw	(OFST-1,sp),x
 101  0013               L74:
 102                     ; 50     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 104  0013 720c514c05    	btjt	20812,#6,L14
 106  0018 a3ffff        	cpw	x,#65535
 107  001b 26f3          	jrne	L34
 108  001d               L14:
 109                     ; 56   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 111  001d 720c514c04    	btjt	20812,#6,L55
 112                     ; 58     status = ERROR;
 114  0022 a6ff          	ld	a,#255
 116  0024 2002          	jra	L75
 117  0026               L55:
 118                     ; 62     status = SUCCESS;
 120  0026 a601          	ld	a,#1
 121  0028               L75:
 122                     ; 65   return (ErrorStatus)status;
 126  0028 5b03          	addw	sp,#3
 127  002a 81            	ret	
 166                     ; 77 static uint8_t ByteToBcd2(uint8_t Value)
 166                     ; 78 {
 167                     	switch	.text
 168  002b               L16_ByteToBcd2:
 170  002b 88            	push	a
 171  002c 88            	push	a
 172       00000001      OFST:	set	1
 175                     ; 79   uint8_t bcdhigh = 0;
 177  002d 0f01          	clr	(OFST+0,sp)
 179  002f 7b02          	ld	a,(OFST+1,sp)
 180  0031 2006          	jra	L501
 181  0033               L101:
 182                     ; 83     bcdhigh++;
 184  0033 0c01          	inc	(OFST+0,sp)
 185                     ; 84     Value -= 10;
 187  0035 a00a          	sub	a,#10
 188  0037 6b02          	ld	(OFST+1,sp),a
 189  0039               L501:
 190                     ; 81   while (Value >= 10)
 192  0039 a10a          	cp	a,#10
 193  003b 24f6          	jruge	L101
 194                     ; 87   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
 196  003d 7b01          	ld	a,(OFST+0,sp)
 197  003f 97            	ld	xl,a
 198  0040 a610          	ld	a,#16
 199  0042 42            	mul	x,a
 200  0043 9f            	ld	a,xl
 201  0044 1a02          	or	a,(OFST+1,sp)
 204  0046 85            	popw	x
 205  0047 81            	ret	
 244                     ; 95 static uint8_t Bcd2ToByte(uint8_t Value)
 244                     ; 96 {
 245                     	switch	.text
 246  0048               L111_Bcd2ToByte:
 248  0048 88            	push	a
 249  0049 88            	push	a
 250       00000001      OFST:	set	1
 253                     ; 97   uint8_t tmp = 0;
 255  004a 0f01          	clr	(OFST+0,sp)
 256                     ; 99   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
 258  004c 4e            	swap	a
 259  004d a40f          	and	a,#15
 260  004f 97            	ld	xl,a
 261  0050 a60a          	ld	a,#10
 262  0052 42            	mul	x,a
 263  0053 9f            	ld	a,xl
 264  0054 6b01          	ld	(OFST+0,sp),a
 265                     ; 101   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
 267  0056 7b02          	ld	a,(OFST+1,sp)
 268  0058 a40f          	and	a,#15
 269  005a 1b01          	add	a,(OFST+0,sp)
 272  005c 85            	popw	x
 273  005d 81            	ret	
 545                     ; 118 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
 545                     ; 119                         RTC_DateTypeDef* RTC_DateStruct)
 545                     ; 120 {
 546                     	switch	.text
 547  005e               _RTC_SetDate:
 549  005e 88            	push	a
 550  005f 89            	pushw	x
 551       00000002      OFST:	set	2
 554                     ; 121   ErrorStatus status = ERROR;
 556  0060 a6ff          	ld	a,#255
 557  0062 6b02          	ld	(OFST+0,sp),a
 558                     ; 123   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
 560  0064 7b03          	ld	a,(OFST+1,sp)
 561  0066 2610          	jrne	L762
 563  0068 1e06          	ldw	x,(OFST+4,sp)
 564  006a e601          	ld	a,(1,x)
 565  006c a410          	and	a,#16
 566  006e 2708          	jreq	L762
 567                     ; 125     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
 569  0070 e601          	ld	a,(1,x)
 570  0072 a4ef          	and	a,#239
 571  0074 ab0a          	add	a,#10
 572  0076 e701          	ld	(1,x),a
 573  0078               L762:
 574                     ; 129   assert_param(IS_RTC_FORMAT(RTC_Format));
 576                     ; 130   if (RTC_Format == RTC_Format_BIN)
 578  0078 0d03          	tnz	(OFST+1,sp)
 579                     ; 132     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
 581                     ; 133     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
 583                     ; 134     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
 585                     ; 135     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
 587                     ; 136     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
 590                     ; 140     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
 592                     ; 141     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
 594                     ; 142     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
 596                     ; 143     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
 598                     ; 144     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
 600                     ; 146   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
 602                     ; 149   RTC->WPR = 0xCA;
 604  007a 35ca5159      	mov	20825,#202
 605                     ; 150   RTC->WPR = 0x53;
 607  007e 35535159      	mov	20825,#83
 608                     ; 153   if (RTC_EnterInitMode() == ERROR)
 610  0082 cd0000        	call	_RTC_EnterInitMode
 613                     ; 161     (void)(RTC->TR1);
 617  0085 c65140        	ld	a,20800
 618                     ; 164     if (RTC_Format != RTC_Format_BIN)
 620  0088 7b03          	ld	a,(OFST+1,sp)
 621  008a 2718          	jreq	L103
 622                     ; 166       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
 624  008c 1e06          	ldw	x,(OFST+4,sp)
 625  008e e602          	ld	a,(2,x)
 626  0090 c75144        	ld	20804,a
 627                     ; 167       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
 629  0093 f6            	ld	a,(x)
 630  0094 97            	ld	xl,a
 631  0095 a620          	ld	a,#32
 632  0097 42            	mul	x,a
 633  0098 9f            	ld	a,xl
 634  0099 1e06          	ldw	x,(OFST+4,sp)
 635  009b ea01          	or	a,(1,x)
 636  009d c75145        	ld	20805,a
 637                     ; 168       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
 639  00a0 e603          	ld	a,(3,x)
 641  00a2 2026          	jra	L303
 642  00a4               L103:
 643                     ; 172       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
 645  00a4 1e06          	ldw	x,(OFST+4,sp)
 646  00a6 e602          	ld	a,(2,x)
 647  00a8 ad81          	call	L16_ByteToBcd2
 649  00aa c75144        	ld	20804,a
 650                     ; 173       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
 652  00ad 1e06          	ldw	x,(OFST+4,sp)
 653  00af f6            	ld	a,(x)
 654  00b0 97            	ld	xl,a
 655  00b1 a620          	ld	a,#32
 656  00b3 42            	mul	x,a
 657  00b4 9f            	ld	a,xl
 658  00b5 6b01          	ld	(OFST-1,sp),a
 659  00b7 1e06          	ldw	x,(OFST+4,sp)
 660  00b9 e601          	ld	a,(1,x)
 661  00bb cd002b        	call	L16_ByteToBcd2
 663  00be 1a01          	or	a,(OFST-1,sp)
 664  00c0 c75145        	ld	20805,a
 665                     ; 174       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
 667  00c3 1e06          	ldw	x,(OFST+4,sp)
 668  00c5 e603          	ld	a,(3,x)
 669  00c7 cd002b        	call	L16_ByteToBcd2
 671  00ca               L303:
 672  00ca c75146        	ld	20806,a
 673                     ; 178     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 675  00cd 721f514c      	bres	20812,#7
 676                     ; 181     RTC->WPR = 0xFF; 
 678  00d1 35ff5159      	mov	20825,#255
 679                     ; 184     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
 681  00d5 7208514802    	btjt	20808,#4,L503
 682                     ; 186       if (RTC_WaitForSynchro() == ERROR)
 684  00da ad70          	call	_RTC_WaitForSynchro
 687                     ; 192         status = SUCCESS;
 689  00dc               L503:
 690                     ; 197       status = SUCCESS;
 693  00dc a601          	ld	a,#1
 694                     ; 201   return (ErrorStatus)status;
 698  00de 5b03          	addw	sp,#3
 699  00e0 81            	ret	
 825                     ; 238 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
 825                     ; 239                         RTC_TimeTypeDef* RTC_TimeStruct)
 825                     ; 240 {
 826                     	switch	.text
 827  00e1               _RTC_SetTime:
 829  00e1 88            	push	a
 830  00e2 88            	push	a
 831       00000001      OFST:	set	1
 834                     ; 241   ErrorStatus status = ERROR;
 836                     ; 242   uint8_t temp = 0;
 838                     ; 245   assert_param(IS_RTC_FORMAT(RTC_Format));
 840                     ; 247   if (RTC_Format == RTC_Format_BIN)
 842  00e3 0d02          	tnz	(OFST+1,sp)
 843                     ; 250     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
 844                     ; 252       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
 846                     ; 253       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
 849                     ; 257       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
 851                     ; 259     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
 853                     ; 260     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
 856                     ; 265     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
 858                     ; 267       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
 860                     ; 268       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
 864  00e5 c65148        	ld	a,20808
 865  00e8 a540          	bcp	a,#64
 866                     ; 272       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
 868                     ; 274     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
 870                     ; 275     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
 872                     ; 280   RTC->WPR = 0xCA;
 874  00ea 35ca5159      	mov	20825,#202
 875                     ; 281   RTC->WPR = 0x53;
 877  00ee 35535159      	mov	20825,#83
 878                     ; 284   if (RTC_EnterInitMode() == ERROR)
 880  00f2 cd0000        	call	_RTC_EnterInitMode
 883                     ; 293     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
 887  00f5 720d514808    	btjf	20808,#6,L514
 888                     ; 295       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
 890                     ; 296       temp = RTC_TimeStruct->RTC_H12;
 892  00fa 1e05          	ldw	x,(OFST+4,sp)
 893  00fc e603          	ld	a,(3,x)
 894  00fe 6b01          	ld	(OFST+0,sp),a
 896  0100 2002          	jra	L714
 897  0102               L514:
 898                     ; 300       temp = 0;
 900  0102 0f01          	clr	(OFST+0,sp)
 901  0104               L714:
 902                     ; 303     if (RTC_Format != RTC_Format_BIN)
 904  0104 7b02          	ld	a,(OFST+1,sp)
 905  0106 270f          	jreq	L124
 906                     ; 305       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
 908  0108 1e05          	ldw	x,(OFST+4,sp)
 909  010a e602          	ld	a,(2,x)
 910  010c c75140        	ld	20800,a
 911                     ; 306       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
 913  010f e601          	ld	a,(1,x)
 914  0111 c75141        	ld	20801,a
 915                     ; 307       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
 917  0114 f6            	ld	a,(x)
 919  0115 201a          	jra	L324
 920  0117               L124:
 921                     ; 311       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
 923  0117 1e05          	ldw	x,(OFST+4,sp)
 924  0119 e602          	ld	a,(2,x)
 925  011b cd002b        	call	L16_ByteToBcd2
 927  011e c75140        	ld	20800,a
 928                     ; 312       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
 930  0121 1e05          	ldw	x,(OFST+4,sp)
 931  0123 e601          	ld	a,(1,x)
 932  0125 cd002b        	call	L16_ByteToBcd2
 934  0128 c75141        	ld	20801,a
 935                     ; 313       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
 937  012b 1e05          	ldw	x,(OFST+4,sp)
 938  012d f6            	ld	a,(x)
 939  012e cd002b        	call	L16_ByteToBcd2
 941  0131               L324:
 942  0131 1a01          	or	a,(OFST+0,sp)
 943  0133 c75142        	ld	20802,a
 944                     ; 316     (void)(RTC->DR3);
 946  0136 c65146        	ld	a,20806
 947                     ; 319     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 949  0139 721f514c      	bres	20812,#7
 950                     ; 322     RTC->WPR = 0xFF; 
 952  013d 35ff5159      	mov	20825,#255
 953                     ; 325     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
 955  0141 7208514802    	btjt	20808,#4,L524
 956                     ; 327       if (RTC_WaitForSynchro() == ERROR)
 958  0146 ad04          	call	_RTC_WaitForSynchro
 961                     ; 333         status = SUCCESS;
 963  0148               L524:
 964                     ; 338       status = SUCCESS;
 967  0148 a601          	ld	a,#1
 968                     ; 342   return (ErrorStatus)status;
 972  014a 85            	popw	x
 973  014b 81            	ret	
1016                     ; 368 ErrorStatus RTC_WaitForSynchro(void)
1016                     ; 369 {
1017                     	switch	.text
1018  014c               _RTC_WaitForSynchro:
1020  014c 5203          	subw	sp,#3
1021       00000003      OFST:	set	3
1024                     ; 370   uint16_t rsfcount = 0;
1026  014e 5f            	clrw	x
1027  014f 1f02          	ldw	(OFST-1,sp),x
1028                     ; 371   ErrorStatus status = ERROR;
1030  0151 7b01          	ld	a,(OFST-2,sp)
1031  0153 97            	ld	xl,a
1032                     ; 374   RTC->WPR = 0xCA;
1034  0154 35ca5159      	mov	20825,#202
1035                     ; 375   RTC->WPR = 0x53;
1037  0158 35535159      	mov	20825,#83
1038                     ; 378   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
1040  015c c6514c        	ld	a,20812
1041  015f a45f          	and	a,#95
1042  0161 c7514c        	ld	20812,a
1044  0164 2003          	jra	L754
1045  0166               L554:
1046                     ; 383     rsfcount++;
1048  0166 5c            	incw	x
1049  0167 1f02          	ldw	(OFST-1,sp),x
1050  0169               L754:
1051                     ; 381   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
1053  0169 720a514c07    	btjt	20812,#5,L364
1055  016e 1e02          	ldw	x,(OFST-1,sp)
1056  0170 a3ffff        	cpw	x,#65535
1057  0173 26f1          	jrne	L554
1058  0175               L364:
1059                     ; 387   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
1061  0175 720b514c04    	btjf	20812,#5,L564
1062                     ; 389     status = SUCCESS;
1064  017a a601          	ld	a,#1
1066  017c 2002          	jra	L764
1067  017e               L564:
1068                     ; 393     status = ERROR;
1070  017e a6ff          	ld	a,#255
1071  0180               L764:
1072                     ; 397   RTC->WPR = 0xFF; 
1074  0180 35ff5159      	mov	20825,#255
1075                     ; 399   return (ErrorStatus)status;
1079  0184 5b03          	addw	sp,#3
1080  0186 81            	ret	
1180                     ; 413 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
1180                     ; 414 {
1181                     	switch	.text
1182  0187               _RTC_Init:
1184  0187 89            	pushw	x
1185  0188 88            	push	a
1186       00000001      OFST:	set	1
1189                     ; 415   ErrorStatus status = ERROR;
1191  0189 a6ff          	ld	a,#255
1192  018b 6b01          	ld	(OFST+0,sp),a
1193                     ; 418   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
1195                     ; 419   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
1197                     ; 420   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
1199                     ; 423   RTC->WPR = 0xCA;
1201  018d 35ca5159      	mov	20825,#202
1202                     ; 424   RTC->WPR = 0x53;
1204  0191 35535159      	mov	20825,#83
1205                     ; 427   if (RTC_EnterInitMode() == ERROR)
1207  0195 cd0000        	call	_RTC_EnterInitMode
1210                     ; 434     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
1213  0198 721d5148      	bres	20808,#6
1214                     ; 437     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
1216  019c 1e02          	ldw	x,(OFST+1,sp)
1217  019e c65148        	ld	a,20808
1218  01a1 fa            	or	a,(x)
1219  01a2 c75148        	ld	20808,a
1220                     ; 440     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
1222  01a5 ee02          	ldw	x,(2,x)
1223  01a7 4f            	clr	a
1224  01a8 01            	rrwa	x,a
1225  01a9 9f            	ld	a,xl
1226  01aa c75150        	ld	20816,a
1227                     ; 441     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
1229  01ad 1e02          	ldw	x,(OFST+1,sp)
1230  01af e603          	ld	a,(3,x)
1231  01b1 c75151        	ld	20817,a
1232                     ; 442     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
1234  01b4 e601          	ld	a,(1,x)
1235  01b6 c75152        	ld	20818,a
1236                     ; 445     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1238  01b9 721f514c      	bres	20812,#7
1239                     ; 447     status = SUCCESS;
1241  01bd a601          	ld	a,#1
1242                     ; 451   RTC->WPR = 0xFF; 
1244  01bf 35ff5159      	mov	20825,#255
1245                     ; 454   return (ErrorStatus)(status);
1249  01c3 5b03          	addw	sp,#3
1250  01c5 81            	ret	
1277                     ; 467 void Calendar_Init(void)
1277                     ; 468 { 
1278                     	switch	.text
1279  01c6               _Calendar_Init:
1283                     ; 469   RTC_DateStr.RTC_WeekDay = RTC_Weekday_Monday;
1285  01c6 35010000      	mov	_RTC_DateStr,#1
1286                     ; 470   RTC_DateStr.RTC_Date = 28;
1288  01ca 351c0002      	mov	_RTC_DateStr+2,#28
1289                     ; 471   RTC_DateStr.RTC_Month = RTC_Month_December;
1291  01ce 35120001      	mov	_RTC_DateStr+1,#18
1292                     ; 472   RTC_DateStr.RTC_Year = 15;
1294  01d2 350f0003      	mov	_RTC_DateStr+3,#15
1295                     ; 473   RTC_SetDate(RTC_Format_BIN, &RTC_DateStr);
1297  01d6 ae0000        	ldw	x,#_RTC_DateStr
1298  01d9 89            	pushw	x
1299  01da 4f            	clr	a
1300  01db cd005e        	call	_RTC_SetDate
1302  01de 725f0007      	clr	_RTC_TimeStr+3
1303  01e2 35010004      	mov	_RTC_TimeStr,#1
1304  01e6 725f0005      	clr	_RTC_TimeStr+1
1305  01ea 725f0006      	clr	_RTC_TimeStr+2
1306  01ee 85            	popw	x
1307                     ; 475   RTC_TimeStr.RTC_H12 = RTC_H12_AM;
1309                     ; 476   RTC_TimeStr.RTC_Hours   = 01;
1311                     ; 477   RTC_TimeStr.RTC_Minutes = 00;
1313                     ; 478   RTC_TimeStr.RTC_Seconds = 00;
1315                     ; 479   RTC_SetTime(RTC_Format_BIN, &RTC_TimeStr);
1317  01ef ae0004        	ldw	x,#_RTC_TimeStr
1318  01f2 89            	pushw	x
1319  01f3 4f            	clr	a
1320  01f4 cd00e1        	call	_RTC_SetTime
1322  01f7 85            	popw	x
1323                     ; 480 }
1326  01f8 81            	ret	
1494                     ; 492 void  STM8_RTC_Init(void)
1494                     ; 493 {	
1495                     	switch	.text
1496  01f9               _STM8_RTC_Init:
1498  01f9 520f          	subw	sp,#15
1499       0000000f      OFST:	set	15
1502                     ; 510 	CLK_LSEConfig(CLK_LSE_ON);
1504  01fb a604          	ld	a,#4
1505  01fd cd0000        	call	_CLK_LSEConfig
1508  0200               L546:
1509                     ; 513 	while (CLK_GetFlagStatus(CLK_FLAG_LSERDY) == RESET)
1511  0200 a633          	ld	a,#51
1512  0202 cd0000        	call	_CLK_GetFlagStatus
1514  0205 4d            	tnz	a
1515  0206 27f8          	jreq	L546
1516                     ; 517 	CLK_RTCClockConfig(CLK_RTCCLKSource_LSE, CLK_RTCCLKDiv_1);
1518  0208 5f            	clrw	x
1519  0209 a610          	ld	a,#16
1520  020b 95            	ld	xh,a
1521  020c cd0000        	call	_CLK_RTCClockConfig
1523                     ; 520 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, ENABLE);
1525  020f ae0001        	ldw	x,#1
1526  0212 a612          	ld	a,#18
1527  0214 95            	ld	xh,a
1528  0215 cd0000        	call	_CLK_PeripheralClockConfig
1530                     ; 522 	RTC_InitStr.RTC_HourFormat = RTC_HourFormat_24;
1532  0218 725f0008      	clr	_RTC_InitStr
1533                     ; 523 	RTC_InitStr.RTC_AsynchPrediv = 0x7F;
1535  021c 357f0009      	mov	_RTC_InitStr+1,#127
1536                     ; 524 	RTC_InitStr.RTC_SynchPrediv = 0x00FF;
1538  0220 ae00ff        	ldw	x,#255
1539  0223 cf000a        	ldw	_RTC_InitStr+2,x
1540                     ; 525 	RTC_Init(&RTC_InitStr);
1542  0226 ae0008        	ldw	x,#_RTC_InitStr
1543  0229 cd0187        	call	_RTC_Init
1545                     ; 528 	RTC_WaitForSynchro();
1547  022c cd014c        	call	_RTC_WaitForSynchro
1549                     ; 530 	STM8_RTC_Get(&stTime);
1551  022f 96            	ldw	x,sp
1552  0230 5c            	incw	x
1553  0231 ad23          	call	_STM8_RTC_Get
1555                     ; 531 	TM_TimeChangeAToB(&stTime, &stTmTime);		
1557  0233 96            	ldw	x,sp
1558  0234 1c0008        	addw	x,#OFST-7
1559  0237 89            	pushw	x
1560  0238 1d0007        	subw	x,#7
1561  023b cd0000        	call	_TM_TimeChangeAToB
1563  023e 85            	popw	x
1564                     ; 532 	if ((stTmTime.wYear < 2015)||(TM_IsValidTimePro(&stTmTime) == FALSE))
1566  023f 1e08          	ldw	x,(OFST-7,sp)
1567  0241 a307df        	cpw	x,#2015
1568  0244 250a          	jrult	L356
1570  0246 96            	ldw	x,sp
1571  0247 1c0008        	addw	x,#OFST-7
1572  024a cd0000        	call	_TM_IsValidTimePro
1574  024d 4d            	tnz	a
1575  024e 2603          	jrne	L156
1576  0250               L356:
1577                     ; 534 		Calendar_Init();
1579  0250 cd01c6        	call	_Calendar_Init
1581  0253               L156:
1582                     ; 536 	return ;
1585  0253 5b0f          	addw	sp,#15
1586  0255 81            	ret	
1650                     ; 548 void  STM8_RTC_Get(ST_Time *pStTimeNow)
1650                     ; 549 {	
1651                     	switch	.text
1652  0256               _STM8_RTC_Get:
1654  0256 89            	pushw	x
1655  0257 5209          	subw	sp,#9
1656       00000009      OFST:	set	9
1659                     ; 550 	uint8_t tmpreg = 0;
1661  0259 0f01          	clr	(OFST-8,sp)
1662                     ; 559 	stTmpTime.RTC_Seconds = RTC->TR1;	
1664  025b c65140        	ld	a,20800
1665  025e 6b04          	ld	(OFST-5,sp),a
1666                     ; 561 	stTmpTime.RTC_Minutes = RTC->TR2;
1668  0260 c65141        	ld	a,20801
1669  0263 6b03          	ld	(OFST-6,sp),a
1670                     ; 563 	tmpreg = (uint8_t)RTC->TR3;
1672  0265 c65142        	ld	a,20802
1673  0268 6b01          	ld	(OFST-8,sp),a
1674                     ; 565 	(void) (RTC->DR3) ;
1676  026a c65146        	ld	a,20806
1677                     ; 567 	stTmpTime.RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1679  026d 7b01          	ld	a,(OFST-8,sp)
1680  026f a4bf          	and	a,#191
1681  0271 6b02          	ld	(OFST-7,sp),a
1682                     ; 569 	stTmpTime.RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1684  0273 7b01          	ld	a,(OFST-8,sp)
1685  0275 a440          	and	a,#64
1686  0277 6b05          	ld	(OFST-4,sp),a
1687                     ; 572 	(void) (RTC->TR1) ;
1689  0279 c65140        	ld	a,20800
1690                     ; 573 	stTmpDate.RTC_Date = (uint8_t)(RTC->DR1);
1692  027c c65144        	ld	a,20804
1693  027f 6b08          	ld	(OFST-1,sp),a
1694                     ; 574 	tmpreg = (uint8_t)RTC->DR2;
1696  0281 c65145        	ld	a,20805
1697  0284 6b01          	ld	(OFST-8,sp),a
1698                     ; 575 	stTmpDate.RTC_Year = (uint8_t)(RTC->DR3);	
1700  0286 c65146        	ld	a,20806
1701  0289 6b09          	ld	(OFST+0,sp),a
1702                     ; 576 	stTmpDate.RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
1704  028b 7b01          	ld	a,(OFST-8,sp)
1705  028d a41f          	and	a,#31
1706  028f 6b07          	ld	(OFST-2,sp),a
1707                     ; 577 	stTmpDate.RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
1709  0291 7b01          	ld	a,(OFST-8,sp)
1710  0293 4e            	swap	a
1711  0294 a40e          	and	a,#14
1712  0296 44            	srl	a
1713  0297 6b06          	ld	(OFST-3,sp),a
1714                     ; 579 	pStTimeNow->wYear   = stTmpDate.RTC_Year;
1716  0299 7b09          	ld	a,(OFST+0,sp)
1717  029b 1e0a          	ldw	x,(OFST+1,sp)
1718  029d f7            	ld	(x),a
1719                     ; 580 	pStTimeNow->nMonth  = stTmpDate.RTC_Month;
1721  029e 7b07          	ld	a,(OFST-2,sp)
1722  02a0 e701          	ld	(1,x),a
1723                     ; 581 	pStTimeNow->nDay	= stTmpDate.RTC_Date;
1725  02a2 7b08          	ld	a,(OFST-1,sp)
1726  02a4 e702          	ld	(2,x),a
1727                     ; 582 	pStTimeNow->nHour   = stTmpTime.RTC_Hours;
1729  02a6 7b02          	ld	a,(OFST-7,sp)
1730  02a8 e703          	ld	(3,x),a
1731                     ; 583 	pStTimeNow->nMinute = stTmpTime.RTC_Minutes;
1733  02aa 7b03          	ld	a,(OFST-6,sp)
1734  02ac e704          	ld	(4,x),a
1735                     ; 584 	pStTimeNow->nSecond = stTmpTime.RTC_Seconds;
1737  02ae 7b04          	ld	a,(OFST-5,sp)
1738  02b0 e705          	ld	(5,x),a
1739                     ; 585 	pStTimeNow->nWeek   = stTmpDate.RTC_WeekDay;
1741  02b2 7b06          	ld	a,(OFST-3,sp)
1742  02b4 e706          	ld	(6,x),a
1743                     ; 586 }
1746  02b6 5b0b          	addw	sp,#11
1747  02b8 81            	ret	
1820                     ; 597 u8  STM8_RTC_Set(ST_Time *time)
1820                     ; 598 {	
1821                     	switch	.text
1822  02b9               _STM8_RTC_Set:
1824  02b9 89            	pushw	x
1825  02ba 5210          	subw	sp,#16
1826       00000010      OFST:	set	16
1829                     ; 603 	TM_TimeChangeAToB(time, &stTmTime);		
1831  02bc 96            	ldw	x,sp
1832  02bd 1c0009        	addw	x,#OFST-7
1833  02c0 89            	pushw	x
1834  02c1 1e13          	ldw	x,(OFST+3,sp)
1835  02c3 cd0000        	call	_TM_TimeChangeAToB
1837  02c6 85            	popw	x
1838                     ; 604 	if (TM_IsValidTimePro(&stTmTime) == FALSE)
1840  02c7 96            	ldw	x,sp
1841  02c8 1c0009        	addw	x,#OFST-7
1842  02cb cd0000        	call	_TM_IsValidTimePro
1844  02ce 4d            	tnz	a
1845                     ; 606 		return (FALSE);
1848  02cf 2746          	jreq	L421
1849                     ; 609 	stTmpDate.RTC_Year    = time->wYear;
1851  02d1 1e11          	ldw	x,(OFST+1,sp)
1852  02d3 f6            	ld	a,(x)
1853  02d4 6b08          	ld	(OFST-8,sp),a
1854                     ; 610 	stTmpDate.RTC_Month   = time->nMonth;
1856  02d6 e601          	ld	a,(1,x)
1857  02d8 6b06          	ld	(OFST-10,sp),a
1858                     ; 611 	stTmpDate.RTC_Date    = time->nDay;
1860  02da e602          	ld	a,(2,x)
1861  02dc 6b07          	ld	(OFST-9,sp),a
1862                     ; 612 	stTmpTime.RTC_Hours   = time->nHour;
1864  02de e603          	ld	a,(3,x)
1865  02e0 6b01          	ld	(OFST-15,sp),a
1866                     ; 613 	stTmpTime.RTC_Minutes = time->nMinute;
1868  02e2 e604          	ld	a,(4,x)
1869  02e4 6b02          	ld	(OFST-14,sp),a
1870                     ; 614 	stTmpTime.RTC_Seconds = time->nSecond;
1872  02e6 e605          	ld	a,(5,x)
1873  02e8 6b03          	ld	(OFST-13,sp),a
1874                     ; 616 	stTmTime.nWeek  = TM_DayOfWeek(&stTmTime);
1876  02ea 96            	ldw	x,sp
1877  02eb 1c0009        	addw	x,#OFST-7
1878  02ee cd0000        	call	_TM_DayOfWeek
1880  02f1 6b10          	ld	(OFST+0,sp),a
1881                     ; 617 	if(1 == stTmTime.nWeek)
1883  02f3 a101          	cp	a,#1
1884  02f5 2604          	jrne	L547
1885                     ; 619 		stTmpDate.RTC_WeekDay = 7;
1887  02f7 a607          	ld	a,#7
1889  02f9 2001          	jra	L747
1890  02fb               L547:
1891                     ; 623 		stTmpDate.RTC_WeekDay = stTmTime.nWeek-1;
1893  02fb 4a            	dec	a
1894  02fc               L747:
1895  02fc 6b05          	ld	(OFST-11,sp),a
1896                     ; 626 	RTC_SetTime(RTC_Format_BCD, &stTmpTime);
1898  02fe 96            	ldw	x,sp
1899  02ff 5c            	incw	x
1900  0300 89            	pushw	x
1901  0301 a601          	ld	a,#1
1902  0303 cd00e1        	call	_RTC_SetTime
1904  0306 85            	popw	x
1905                     ; 627 	RTC_SetDate(RTC_Format_BCD, &stTmpDate);
1907  0307 96            	ldw	x,sp
1908  0308 1c0005        	addw	x,#OFST-11
1909  030b 89            	pushw	x
1910  030c a601          	ld	a,#1
1911  030e cd005e        	call	_RTC_SetDate
1913  0311 85            	popw	x
1914                     ; 630 	RTC_WaitForSynchro();
1916  0312 cd014c        	call	_RTC_WaitForSynchro
1918                     ; 632 	return TRUE;
1920  0315 a601          	ld	a,#1
1922  0317               L421:
1924  0317 5b12          	addw	sp,#18
1925  0319 81            	ret	
1970                     	xdef	_Calendar_Init
1971                     	switch	.bss
1972  0000               _RTC_DateStr:
1973  0000 00000000      	ds.b	4
1974                     	xdef	_RTC_DateStr
1975  0004               _RTC_TimeStr:
1976  0004 00000000      	ds.b	4
1977                     	xdef	_RTC_TimeStr
1978  0008               _RTC_InitStr:
1979  0008 00000000      	ds.b	4
1980                     	xdef	_RTC_InitStr
1981                     	xdef	_STM8_RTC_Set
1982                     	xdef	_STM8_RTC_Get
1983                     	xdef	_STM8_RTC_Init
1984                     	xref	_TM_TimeChangeAToB
1985                     	xref	_TM_IsValidTimePro
1986                     	xref	_TM_DayOfWeek
1987                     	xdef	_RTC_SetDate
1988                     	xdef	_RTC_SetTime
1989                     	xdef	_RTC_WaitForSynchro
1990                     	xdef	_RTC_EnterInitMode
1991                     	xdef	_RTC_Init
1992                     	xref	_CLK_GetFlagStatus
1993                     	xref	_CLK_PeripheralClockConfig
1994                     	xref	_CLK_RTCClockConfig
1995                     	xref	_CLK_LSEConfig
2015                     	end
