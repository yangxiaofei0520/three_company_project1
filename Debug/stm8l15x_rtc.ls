   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  81                     ; 232 ErrorStatus RTC_DeInit(void)
  81                     ; 233 {
  83                     	switch	.text
  84  0000               _RTC_DeInit:
  86  0000 5205          	subw	sp,#5
  87       00000005      OFST:	set	5
  90                     ; 234   ErrorStatus status = ERROR;
  92  0002 7b01          	ld	a,(OFST-4,sp)
  93  0004 97            	ld	xl,a
  94                     ; 235   uint16_t wutwfcount = 0;
  96  0005 5f            	clrw	x
  97  0006 1f02          	ldw	(OFST-3,sp),x
  98                     ; 236   uint16_t recalpfcount = 0;
 100  0008 5f            	clrw	x
 101  0009 1f04          	ldw	(OFST-1,sp),x
 102                     ; 239   RTC->WPR = 0xCA;
 104  000b 35ca5159      	mov	20825,#202
 105                     ; 240   RTC->WPR = 0x53;
 107  000f 35535159      	mov	20825,#83
 108                     ; 243   if (RTC_EnterInitMode() == ERROR)
 110  0013 cd0166        	call	_RTC_EnterInitMode
 112  0016 4d            	tnz	a
 113  0017 260b          	jrne	L74
 114                     ; 245     status = ERROR;
 116  0019 0f01          	clr	(OFST-4,sp)
 117                     ; 247     RTC->WPR = 0xFF; 
 119  001b 35ff5159      	mov	20825,#255
 121  001f               L15:
 122                     ; 343   return (ErrorStatus)status;
 124  001f 7b01          	ld	a,(OFST-4,sp)
 127  0021 5b05          	addw	sp,#5
 128  0023 81            	ret
 129  0024               L74:
 130                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 132  0024 725f5140      	clr	20800
 133                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 135  0028 725f5141      	clr	20801
 136                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 138  002c 725f5142      	clr	20802
 139                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 141  0030 35015144      	mov	20804,#1
 142                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 144  0034 35215145      	mov	20805,#33
 145                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 147  0038 725f5146      	clr	20806
 148                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 150  003c 725f5150      	clr	20816
 151                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 153  0040 35ff5151      	mov	20817,#255
 154                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 156  0044 357f5152      	mov	20818,#127
 157                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 159  0048 725f516c      	clr	20844
 160                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 162  004c 725f516d      	clr	20845
 163                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 165  0050 725f5148      	clr	20808
 166                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 168  0054 725f5149      	clr	20809
 169                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 171  0058 725f514a      	clr	20810
 173  005c 200b          	jra	L75
 174  005e               L35:
 175                     ; 278       wutwfcount++;
 177  005e 1e02          	ldw	x,(OFST-3,sp)
 178  0060 1c0001        	addw	x,#1
 179  0063 1f02          	ldw	(OFST-3,sp),x
 180                     ; 279       RTC->ISR1 = 0;
 182  0065 725f514c      	clr	20812
 183  0069               L75:
 184                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 186  0069 c6514c        	ld	a,20812
 187  006c a504          	bcp	a,#4
 188  006e 2607          	jrne	L36
 190  0070 1e02          	ldw	x,(OFST-3,sp)
 191  0072 a3ffff        	cpw	x,#65535
 192  0075 26e7          	jrne	L35
 193  0077               L36:
 194                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 196  0077 c6514c        	ld	a,20812
 197  007a a504          	bcp	a,#4
 198  007c 2608          	jrne	L56
 199                     ; 284       status = ERROR;
 201  007e 0f01          	clr	(OFST-4,sp)
 202                     ; 286       RTC->WPR = 0xFF; 
 204  0080 35ff5159      	mov	20825,#255
 206  0084 2099          	jra	L15
 207  0086               L56:
 208                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 210  0086 725f5148      	clr	20808
 211                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 213  008a 35ff5154      	mov	20820,#255
 214                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 216  008e 35ff5155      	mov	20821,#255
 217                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 219  0092 725f515c      	clr	20828
 220                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 222  0096 725f515d      	clr	20829
 223                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 225  009a 725f515e      	clr	20830
 226                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 228  009e 725f515f      	clr	20831
 229                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 231  00a2 725f5164      	clr	20836
 232                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 234  00a6 725f5165      	clr	20837
 235                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 237  00aa 725f5166      	clr	20838
 238                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 240  00ae 725f514c      	clr	20812
 241                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 243  00b2 725f514d      	clr	20813
 244                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 246  00b6 c6514c        	ld	a,20812
 247  00b9 a502          	bcp	a,#2
 248  00bb 2717          	jreq	L17
 250  00bd 2007          	jra	L57
 251  00bf               L37:
 252                     ; 315           recalpfcount++;
 254  00bf 1e04          	ldw	x,(OFST-1,sp)
 255  00c1 1c0001        	addw	x,#1
 256  00c4 1f04          	ldw	(OFST-1,sp),x
 257  00c6               L57:
 258                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 260  00c6 c6514c        	ld	a,20812
 261  00c9 a502          	bcp	a,#2
 262  00cb 2707          	jreq	L17
 264  00cd 1e04          	ldw	x,(OFST-1,sp)
 265  00cf a3ffff        	cpw	x,#65535
 266  00d2 26eb          	jrne	L37
 267  00d4               L17:
 268                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 270  00d4 c6514c        	ld	a,20812
 271  00d7 a502          	bcp	a,#2
 272  00d9 2618          	jrne	L301
 273                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 275  00db 725f516a      	clr	20842
 276                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 278  00df 725f516b      	clr	20843
 279                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 281  00e3 cd01a9        	call	_RTC_WaitForSynchro
 283  00e6 4d            	tnz	a
 284  00e7 2604          	jrne	L501
 285                     ; 325           status = ERROR;
 287  00e9 0f01          	clr	(OFST-4,sp)
 289  00eb 2008          	jra	L111
 290  00ed               L501:
 291                     ; 329           status = SUCCESS;
 293  00ed a601          	ld	a,#1
 294  00ef 6b01          	ld	(OFST-4,sp),a
 295  00f1 2002          	jra	L111
 296  00f3               L301:
 297                     ; 334         status = ERROR;
 299  00f3 0f01          	clr	(OFST-4,sp)
 300  00f5               L111:
 301                     ; 338       RTC->WPR = 0xFF; 
 303  00f5 35ff5159      	mov	20825,#255
 304  00f9 ac1f001f      	jpf	L15
 404                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 404                     ; 360 {
 405                     	switch	.text
 406  00fd               _RTC_Init:
 408  00fd 89            	pushw	x
 409  00fe 88            	push	a
 410       00000001      OFST:	set	1
 413                     ; 361   ErrorStatus status = ERROR;
 415  00ff 0f01          	clr	(OFST+0,sp)
 416                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 418                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 420                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 422                     ; 369   RTC->WPR = 0xCA;
 424  0101 35ca5159      	mov	20825,#202
 425                     ; 370   RTC->WPR = 0x53;
 427  0105 35535159      	mov	20825,#83
 428                     ; 373   if (RTC_EnterInitMode() == ERROR)
 430  0109 ad5b          	call	_RTC_EnterInitMode
 432  010b 4d            	tnz	a
 433  010c 2604          	jrne	L361
 434                     ; 375     status = ERROR;
 436  010e 0f01          	clr	(OFST+0,sp)
 438  0110 202d          	jra	L561
 439  0112               L361:
 440                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 442  0112 721d5148      	bres	20808,#6
 443                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 445  0116 1e02          	ldw	x,(OFST+1,sp)
 446  0118 c65148        	ld	a,20808
 447  011b fa            	or	a,(x)
 448  011c c75148        	ld	20808,a
 449                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 451  011f 1e02          	ldw	x,(OFST+1,sp)
 452  0121 ee02          	ldw	x,(2,x)
 453  0123 4f            	clr	a
 454  0124 01            	rrwa	x,a
 455  0125 9f            	ld	a,xl
 456  0126 c75150        	ld	20816,a
 457                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 459  0129 1e02          	ldw	x,(OFST+1,sp)
 460  012b e603          	ld	a,(3,x)
 461  012d c75151        	ld	20817,a
 462                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 464  0130 1e02          	ldw	x,(OFST+1,sp)
 465  0132 e601          	ld	a,(1,x)
 466  0134 c75152        	ld	20818,a
 467                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 469  0137 721f514c      	bres	20812,#7
 470                     ; 393     status = SUCCESS;
 472  013b a601          	ld	a,#1
 473  013d 6b01          	ld	(OFST+0,sp),a
 474  013f               L561:
 475                     ; 397   RTC->WPR = 0xFF; 
 477  013f 35ff5159      	mov	20825,#255
 478                     ; 400   return (ErrorStatus)(status);
 480  0143 7b01          	ld	a,(OFST+0,sp)
 483  0145 5b03          	addw	sp,#3
 484  0147 81            	ret
 521                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 521                     ; 411 {
 522                     	switch	.text
 523  0148               _RTC_StructInit:
 527                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 529  0148 7f            	clr	(x)
 530                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 532  0149 a67f          	ld	a,#127
 533  014b e701          	ld	(1,x),a
 534                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 536  014d 90ae00ff      	ldw	y,#255
 537  0151 ef02          	ldw	(2,x),y
 538                     ; 420 }
 541  0153 81            	ret
 597                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 597                     ; 431 {
 598                     	switch	.text
 599  0154               _RTC_WriteProtectionCmd:
 603                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 605                     ; 435   if (NewState != DISABLE)
 607  0154 4d            	tnz	a
 608  0155 2706          	jreq	L532
 609                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 611  0157 35ff5159      	mov	20825,#255
 613  015b 2008          	jra	L732
 614  015d               L532:
 615                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 617  015d 35ca5159      	mov	20825,#202
 618                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 620  0161 35535159      	mov	20825,#83
 621  0165               L732:
 622                     ; 446 }
 625  0165 81            	ret
 668                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 668                     ; 459 {
 669                     	switch	.text
 670  0166               _RTC_EnterInitMode:
 672  0166 5203          	subw	sp,#3
 673       00000003      OFST:	set	3
 676                     ; 460   ErrorStatus status = ERROR;
 678  0168 7b01          	ld	a,(OFST-2,sp)
 679  016a 97            	ld	xl,a
 680                     ; 461   uint16_t initfcount = 0;
 682  016b 5f            	clrw	x
 683  016c 1f02          	ldw	(OFST-1,sp),x
 684                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 686  016e c6514c        	ld	a,20812
 687  0171 a540          	bcp	a,#64
 688  0173 261b          	jrne	L162
 689                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 691  0175 3580514c      	mov	20812,#128
 693  0179 2007          	jra	L762
 694  017b               L362:
 695                     ; 472       initfcount++;
 697  017b 1e02          	ldw	x,(OFST-1,sp)
 698  017d 1c0001        	addw	x,#1
 699  0180 1f02          	ldw	(OFST-1,sp),x
 700  0182               L762:
 701                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 703  0182 c6514c        	ld	a,20812
 704  0185 a540          	bcp	a,#64
 705  0187 2607          	jrne	L162
 707  0189 1e02          	ldw	x,(OFST-1,sp)
 708  018b a3ffff        	cpw	x,#65535
 709  018e 26eb          	jrne	L362
 710  0190               L162:
 711                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 713  0190 c6514c        	ld	a,20812
 714  0193 a540          	bcp	a,#64
 715  0195 2604          	jrne	L572
 716                     ; 478     status = ERROR;
 718  0197 0f01          	clr	(OFST-2,sp)
 720  0199 2004          	jra	L772
 721  019b               L572:
 722                     ; 482     status = SUCCESS;
 724  019b a601          	ld	a,#1
 725  019d 6b01          	ld	(OFST-2,sp),a
 726  019f               L772:
 727                     ; 485   return (ErrorStatus)status;
 729  019f 7b01          	ld	a,(OFST-2,sp)
 732  01a1 5b03          	addw	sp,#3
 733  01a3 81            	ret
 756                     ; 498 void RTC_ExitInitMode(void)
 756                     ; 499 {
 757                     	switch	.text
 758  01a4               _RTC_ExitInitMode:
 762                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 764  01a4 721f514c      	bres	20812,#7
 765                     ; 502 }
 768  01a8 81            	ret
 811                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 811                     ; 528 {
 812                     	switch	.text
 813  01a9               _RTC_WaitForSynchro:
 815  01a9 5203          	subw	sp,#3
 816       00000003      OFST:	set	3
 819                     ; 529   uint16_t rsfcount = 0;
 821  01ab 5f            	clrw	x
 822  01ac 1f02          	ldw	(OFST-1,sp),x
 823                     ; 530   ErrorStatus status = ERROR;
 825  01ae 7b01          	ld	a,(OFST-2,sp)
 826  01b0 97            	ld	xl,a
 827                     ; 533   RTC->WPR = 0xCA;
 829  01b1 35ca5159      	mov	20825,#202
 830                     ; 534   RTC->WPR = 0x53;
 832  01b5 35535159      	mov	20825,#83
 833                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 835  01b9 c6514c        	ld	a,20812
 836  01bc a45f          	and	a,#95
 837  01be c7514c        	ld	20812,a
 839  01c1 2007          	jra	L333
 840  01c3               L133:
 841                     ; 542     rsfcount++;
 843  01c3 1e02          	ldw	x,(OFST-1,sp)
 844  01c5 1c0001        	addw	x,#1
 845  01c8 1f02          	ldw	(OFST-1,sp),x
 846  01ca               L333:
 847                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 849  01ca c6514c        	ld	a,20812
 850  01cd a520          	bcp	a,#32
 851  01cf 2607          	jrne	L733
 853  01d1 1e02          	ldw	x,(OFST-1,sp)
 854  01d3 a3ffff        	cpw	x,#65535
 855  01d6 26eb          	jrne	L133
 856  01d8               L733:
 857                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 859  01d8 c6514c        	ld	a,20812
 860  01db a520          	bcp	a,#32
 861  01dd 2706          	jreq	L143
 862                     ; 548     status = SUCCESS;
 864  01df a601          	ld	a,#1
 865  01e1 6b01          	ld	(OFST-2,sp),a
 867  01e3 2002          	jra	L343
 868  01e5               L143:
 869                     ; 552     status = ERROR;
 871  01e5 0f01          	clr	(OFST-2,sp)
 872  01e7               L343:
 873                     ; 556   RTC->WPR = 0xFF; 
 875  01e7 35ff5159      	mov	20825,#255
 876                     ; 558   return (ErrorStatus)status;
 878  01eb 7b01          	ld	a,(OFST-2,sp)
 881  01ed 5b03          	addw	sp,#3
 882  01ef 81            	ret
 917                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 917                     ; 569 {
 918                     	switch	.text
 919  01f0               _RTC_RatioCmd:
 923                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 925                     ; 574   RTC->WPR = 0xCA;
 927  01f0 35ca5159      	mov	20825,#202
 928                     ; 575   RTC->WPR = 0x53;
 930  01f4 35535159      	mov	20825,#83
 931                     ; 577   if (NewState != DISABLE)
 933  01f8 4d            	tnz	a
 934  01f9 2706          	jreq	L363
 935                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 937  01fb 721a5148      	bset	20808,#5
 939  01ff 2004          	jra	L563
 940  0201               L363:
 941                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 943  0201 721b5148      	bres	20808,#5
 944  0205               L563:
 945                     ; 589   RTC->WPR = 0xFF; 
 947  0205 35ff5159      	mov	20825,#255
 948                     ; 590 }
 951  0209 81            	ret
 987                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
 987                     ; 599 {
 988                     	switch	.text
 989  020a               _RTC_BypassShadowCmd:
 993                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
 995                     ; 604   RTC->WPR = 0xCA;
 997  020a 35ca5159      	mov	20825,#202
 998                     ; 605   RTC->WPR = 0x53;
1000  020e 35535159      	mov	20825,#83
1001                     ; 607   if (NewState != DISABLE)
1003  0212 4d            	tnz	a
1004  0213 2706          	jreq	L504
1005                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1007  0215 72185148      	bset	20808,#4
1009  0219 2004          	jra	L704
1010  021b               L504:
1011                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1013  021b 72195148      	bres	20808,#4
1014  021f               L704:
1015                     ; 619   RTC->WPR = 0xFF; 
1017  021f 35ff5159      	mov	20825,#255
1018                     ; 620 }
1021  0223 81            	ret
1167                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1167                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1167                     ; 661 {
1168                     	switch	.text
1169  0224               _RTC_SetTime:
1171  0224 88            	push	a
1172  0225 88            	push	a
1173       00000001      OFST:	set	1
1176                     ; 662   ErrorStatus status = ERROR;
1178  0226 7b01          	ld	a,(OFST+0,sp)
1179  0228 97            	ld	xl,a
1180                     ; 663   uint8_t temp = 0;
1182  0229 7b01          	ld	a,(OFST+0,sp)
1183  022b 97            	ld	xl,a
1184                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1186                     ; 668   if (RTC_Format == RTC_Format_BIN)
1188  022c 0d02          	tnz	(OFST+1,sp)
1189  022e 2609          	jrne	L105
1190                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1192  0230 c65148        	ld	a,20808
1193  0233 a540          	bcp	a,#64
1194  0235 2700          	jreq	L305
1195                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1197                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1200  0237               L305:
1201                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1203                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1205                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1208  0237 2007          	jra	L705
1209  0239               L105:
1210                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1212  0239 c65148        	ld	a,20808
1213  023c a540          	bcp	a,#64
1214  023e 2700          	jreq	L115
1215                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1217                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1220  0240               L115:
1221                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1223                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1225                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1227  0240               L705:
1228                     ; 701   RTC->WPR = 0xCA;
1230  0240 35ca5159      	mov	20825,#202
1231                     ; 702   RTC->WPR = 0x53;
1233  0244 35535159      	mov	20825,#83
1234                     ; 705   if (RTC_EnterInitMode() == ERROR)
1236  0248 cd0166        	call	_RTC_EnterInitMode
1238  024b 4d            	tnz	a
1239  024c 2608          	jrne	L515
1240                     ; 707     status = ERROR;
1242  024e 0f01          	clr	(OFST+0,sp)
1243                     ; 709     RTC->WPR = 0xFF; 
1245  0250 35ff5159      	mov	20825,#255
1247  0254 2073          	jra	L715
1248  0256               L515:
1249                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1251  0256 c65148        	ld	a,20808
1252  0259 a540          	bcp	a,#64
1253  025b 2708          	jreq	L125
1254                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1256                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1258  025d 1e05          	ldw	x,(OFST+4,sp)
1259  025f e603          	ld	a,(3,x)
1260  0261 6b01          	ld	(OFST+0,sp),a
1262  0263 2002          	jra	L325
1263  0265               L125:
1264                     ; 721       temp = 0;
1266  0265 0f01          	clr	(OFST+0,sp)
1267  0267               L325:
1268                     ; 724     if (RTC_Format != RTC_Format_BIN)
1270  0267 0d02          	tnz	(OFST+1,sp)
1271  0269 2718          	jreq	L525
1272                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1274  026b 1e05          	ldw	x,(OFST+4,sp)
1275  026d e602          	ld	a,(2,x)
1276  026f c75140        	ld	20800,a
1277                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1279  0272 1e05          	ldw	x,(OFST+4,sp)
1280  0274 e601          	ld	a,(1,x)
1281  0276 c75141        	ld	20801,a
1282                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1284  0279 1e05          	ldw	x,(OFST+4,sp)
1285  027b f6            	ld	a,(x)
1286  027c 1a01          	or	a,(OFST+0,sp)
1287  027e c75142        	ld	20802,a
1289  0281 201f          	jra	L725
1290  0283               L525:
1291                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1293  0283 1e05          	ldw	x,(OFST+4,sp)
1294  0285 e602          	ld	a,(2,x)
1295  0287 cd0a07        	call	L3_ByteToBcd2
1297  028a c75140        	ld	20800,a
1298                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1300  028d 1e05          	ldw	x,(OFST+4,sp)
1301  028f e601          	ld	a,(1,x)
1302  0291 cd0a07        	call	L3_ByteToBcd2
1304  0294 c75141        	ld	20801,a
1305                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1307  0297 1e05          	ldw	x,(OFST+4,sp)
1308  0299 f6            	ld	a,(x)
1309  029a cd0a07        	call	L3_ByteToBcd2
1311  029d 1a01          	or	a,(OFST+0,sp)
1312  029f c75142        	ld	20802,a
1313  02a2               L725:
1314                     ; 737     (void)(RTC->DR3);
1316  02a2 c65146        	ld	a,20806
1317  02a5 97            	ld	xl,a
1318                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1320  02a6 721f514c      	bres	20812,#7
1321                     ; 743     RTC->WPR = 0xFF; 
1323  02aa 35ff5159      	mov	20825,#255
1324                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1326  02ae c65148        	ld	a,20808
1327  02b1 a510          	bcp	a,#16
1328  02b3 2610          	jrne	L135
1329                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1331  02b5 cd01a9        	call	_RTC_WaitForSynchro
1333  02b8 4d            	tnz	a
1334  02b9 2604          	jrne	L335
1335                     ; 750         status = ERROR;
1337  02bb 0f01          	clr	(OFST+0,sp)
1339  02bd 200a          	jra	L715
1340  02bf               L335:
1341                     ; 754         status = SUCCESS;
1343  02bf a601          	ld	a,#1
1344  02c1 6b01          	ld	(OFST+0,sp),a
1345  02c3 2004          	jra	L715
1346  02c5               L135:
1347                     ; 759       status = SUCCESS;
1349  02c5 a601          	ld	a,#1
1350  02c7 6b01          	ld	(OFST+0,sp),a
1351  02c9               L715:
1352                     ; 763   return (ErrorStatus)status;
1354  02c9 7b01          	ld	a,(OFST+0,sp)
1357  02cb 85            	popw	x
1358  02cc 81            	ret
1395                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1395                     ; 776 {
1396                     	switch	.text
1397  02cd               _RTC_TimeStructInit:
1401                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1403  02cd 6f03          	clr	(3,x)
1404                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1406  02cf 7f            	clr	(x)
1407                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1409  02d0 6f01          	clr	(1,x)
1410                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1412  02d2 6f02          	clr	(2,x)
1413                     ; 782 }
1416  02d4 81            	ret
1471                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1471                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1471                     ; 800 {
1472                     	switch	.text
1473  02d5               _RTC_GetTime:
1475  02d5 88            	push	a
1476  02d6 88            	push	a
1477       00000001      OFST:	set	1
1480                     ; 801   uint8_t  tmpreg = 0;
1482  02d7 0f01          	clr	(OFST+0,sp)
1483                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1485                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1487  02d9 1e05          	ldw	x,(OFST+4,sp)
1488  02db c65140        	ld	a,20800
1489  02de e702          	ld	(2,x),a
1490                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1492  02e0 1e05          	ldw	x,(OFST+4,sp)
1493  02e2 c65141        	ld	a,20801
1494  02e5 e701          	ld	(1,x),a
1495                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1497  02e7 c65142        	ld	a,20802
1498  02ea 6b01          	ld	(OFST+0,sp),a
1499                     ; 817   (void) (RTC->DR3) ;
1501  02ec c65146        	ld	a,20806
1502  02ef 97            	ld	xl,a
1503                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1505  02f0 7b01          	ld	a,(OFST+0,sp)
1506  02f2 a4bf          	and	a,#191
1507  02f4 1e05          	ldw	x,(OFST+4,sp)
1508  02f6 f7            	ld	(x),a
1509                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1511  02f7 7b01          	ld	a,(OFST+0,sp)
1512  02f9 a440          	and	a,#64
1513  02fb 1e05          	ldw	x,(OFST+4,sp)
1514  02fd e703          	ld	(3,x),a
1515                     ; 827   if (RTC_Format == RTC_Format_BIN)
1517  02ff 0d02          	tnz	(OFST+1,sp)
1518  0301 261f          	jrne	L706
1519                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1521  0303 1e05          	ldw	x,(OFST+4,sp)
1522  0305 f6            	ld	a,(x)
1523  0306 cd0a26        	call	L5_Bcd2ToByte
1525  0309 1e05          	ldw	x,(OFST+4,sp)
1526  030b f7            	ld	(x),a
1527                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1529  030c 1e05          	ldw	x,(OFST+4,sp)
1530  030e e601          	ld	a,(1,x)
1531  0310 cd0a26        	call	L5_Bcd2ToByte
1533  0313 1e05          	ldw	x,(OFST+4,sp)
1534  0315 e701          	ld	(1,x),a
1535                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1537  0317 1e05          	ldw	x,(OFST+4,sp)
1538  0319 e602          	ld	a,(2,x)
1539  031b cd0a26        	call	L5_Bcd2ToByte
1541  031e 1e05          	ldw	x,(OFST+4,sp)
1542  0320 e702          	ld	(2,x),a
1543  0322               L706:
1544                     ; 834 }
1547  0322 85            	popw	x
1548  0323 81            	ret
1594                     ; 845 uint16_t RTC_GetSubSecond(void)
1594                     ; 846 {
1595                     	switch	.text
1596  0324               _RTC_GetSubSecond:
1598  0324 5206          	subw	sp,#6
1599       00000006      OFST:	set	6
1602                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1604  0326 7b03          	ld	a,(OFST-3,sp)
1605  0328 97            	ld	xl,a
1608  0329 7b04          	ld	a,(OFST-2,sp)
1609  032b 97            	ld	xl,a
1610                     ; 848   uint16_t ssrreg = 0;
1612  032c 1e05          	ldw	x,(OFST-1,sp)
1613                     ; 851   ssrhreg = RTC->SSRH;
1615  032e c65157        	ld	a,20823
1616  0331 6b03          	ld	(OFST-3,sp),a
1617                     ; 852   ssrlreg = RTC->SSRL;
1619  0333 c65158        	ld	a,20824
1620  0336 6b04          	ld	(OFST-2,sp),a
1621                     ; 855   (void) (RTC->DR3);
1623  0338 c65146        	ld	a,20806
1624  033b 97            	ld	xl,a
1625                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1627  033c 7b04          	ld	a,(OFST-2,sp)
1628  033e 5f            	clrw	x
1629  033f 97            	ld	xl,a
1630  0340 1f01          	ldw	(OFST-5,sp),x
1631  0342 7b03          	ld	a,(OFST-3,sp)
1632  0344 5f            	clrw	x
1633  0345 97            	ld	xl,a
1634  0346 4f            	clr	a
1635  0347 02            	rlwa	x,a
1636  0348 01            	rrwa	x,a
1637  0349 1a02          	or	a,(OFST-4,sp)
1638  034b 01            	rrwa	x,a
1639  034c 1a01          	or	a,(OFST-5,sp)
1640  034e 01            	rrwa	x,a
1641  034f 1f05          	ldw	(OFST-1,sp),x
1642                     ; 859   return (uint16_t)(ssrreg);
1644  0351 1e05          	ldw	x,(OFST-1,sp)
1647  0353 5b06          	addw	sp,#6
1648  0355 81            	ret
1900                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1900                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1900                     ; 878 {
1901                     	switch	.text
1902  0356               _RTC_SetDate:
1904  0356 88            	push	a
1905  0357 89            	pushw	x
1906       00000002      OFST:	set	2
1909                     ; 879   ErrorStatus status = ERROR;
1911  0358 0f02          	clr	(OFST+0,sp)
1912                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1914  035a 4d            	tnz	a
1915  035b 2616          	jrne	L757
1917  035d 1e06          	ldw	x,(OFST+4,sp)
1918  035f e601          	ld	a,(1,x)
1919  0361 a410          	and	a,#16
1920  0363 a110          	cp	a,#16
1921  0365 260c          	jrne	L757
1922                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1924  0367 1e06          	ldw	x,(OFST+4,sp)
1925  0369 e601          	ld	a,(1,x)
1926  036b a4ef          	and	a,#239
1927  036d ab0a          	add	a,#10
1928  036f 1e06          	ldw	x,(OFST+4,sp)
1929  0371 e701          	ld	(1,x),a
1930  0373               L757:
1931                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1933                     ; 888   if (RTC_Format == RTC_Format_BIN)
1935  0373 0d03          	tnz	(OFST+1,sp)
1936  0375 2600          	jrne	L167
1937                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1939                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1941                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1943                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1945                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1948  0377               L167:
1949                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1951                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1953                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1955                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1957                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1959                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1961                     ; 907   RTC->WPR = 0xCA;
1963  0377 35ca5159      	mov	20825,#202
1964                     ; 908   RTC->WPR = 0x53;
1966  037b 35535159      	mov	20825,#83
1967                     ; 911   if (RTC_EnterInitMode() == ERROR)
1969  037f cd0166        	call	_RTC_EnterInitMode
1971  0382 4d            	tnz	a
1972  0383 2608          	jrne	L567
1973                     ; 913     status = ERROR;
1975  0385 0f02          	clr	(OFST+0,sp)
1976                     ; 915     RTC->WPR = 0xFF; 
1978  0387 35ff5159      	mov	20825,#255
1980  038b 2074          	jra	L767
1981  038d               L567:
1982                     ; 919     (void)(RTC->TR1);
1984  038d c65140        	ld	a,20800
1985  0390 97            	ld	xl,a
1986                     ; 922     if (RTC_Format != RTC_Format_BIN)
1988  0391 0d03          	tnz	(OFST+1,sp)
1989  0393 271f          	jreq	L177
1990                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1992  0395 1e06          	ldw	x,(OFST+4,sp)
1993  0397 e602          	ld	a,(2,x)
1994  0399 c75144        	ld	20804,a
1995                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1997  039c 1e06          	ldw	x,(OFST+4,sp)
1998  039e f6            	ld	a,(x)
1999  039f 97            	ld	xl,a
2000  03a0 a620          	ld	a,#32
2001  03a2 42            	mul	x,a
2002  03a3 9f            	ld	a,xl
2003  03a4 1e06          	ldw	x,(OFST+4,sp)
2004  03a6 ea01          	or	a,(1,x)
2005  03a8 c75145        	ld	20805,a
2006                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2008  03ab 1e06          	ldw	x,(OFST+4,sp)
2009  03ad e603          	ld	a,(3,x)
2010  03af c75146        	ld	20806,a
2012  03b2 202a          	jra	L377
2013  03b4               L177:
2014                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2016  03b4 1e06          	ldw	x,(OFST+4,sp)
2017  03b6 e602          	ld	a,(2,x)
2018  03b8 cd0a07        	call	L3_ByteToBcd2
2020  03bb c75144        	ld	20804,a
2021                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2023  03be 1e06          	ldw	x,(OFST+4,sp)
2024  03c0 f6            	ld	a,(x)
2025  03c1 97            	ld	xl,a
2026  03c2 a620          	ld	a,#32
2027  03c4 42            	mul	x,a
2028  03c5 9f            	ld	a,xl
2029  03c6 6b01          	ld	(OFST-1,sp),a
2030  03c8 1e06          	ldw	x,(OFST+4,sp)
2031  03ca e601          	ld	a,(1,x)
2032  03cc cd0a07        	call	L3_ByteToBcd2
2034  03cf 1a01          	or	a,(OFST-1,sp)
2035  03d1 c75145        	ld	20805,a
2036                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2038  03d4 1e06          	ldw	x,(OFST+4,sp)
2039  03d6 e603          	ld	a,(3,x)
2040  03d8 cd0a07        	call	L3_ByteToBcd2
2042  03db c75146        	ld	20806,a
2043  03de               L377:
2044                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2046  03de 721f514c      	bres	20812,#7
2047                     ; 939     RTC->WPR = 0xFF; 
2049  03e2 35ff5159      	mov	20825,#255
2050                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2052  03e6 c65148        	ld	a,20808
2053  03e9 a510          	bcp	a,#16
2054  03eb 2610          	jrne	L577
2055                     ; 944       if (RTC_WaitForSynchro() == ERROR)
2057  03ed cd01a9        	call	_RTC_WaitForSynchro
2059  03f0 4d            	tnz	a
2060  03f1 2604          	jrne	L777
2061                     ; 946         status = ERROR;
2063  03f3 0f02          	clr	(OFST+0,sp)
2065  03f5 200a          	jra	L767
2066  03f7               L777:
2067                     ; 950         status = SUCCESS;
2069  03f7 a601          	ld	a,#1
2070  03f9 6b02          	ld	(OFST+0,sp),a
2071  03fb 2004          	jra	L767
2072  03fd               L577:
2073                     ; 955       status = SUCCESS;
2075  03fd a601          	ld	a,#1
2076  03ff 6b02          	ld	(OFST+0,sp),a
2077  0401               L767:
2078                     ; 959   return (ErrorStatus)status;
2080  0401 7b02          	ld	a,(OFST+0,sp)
2083  0403 5b03          	addw	sp,#3
2084  0405 81            	ret
2121                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2121                     ; 969 {
2122                     	switch	.text
2123  0406               _RTC_DateStructInit:
2127                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2129  0406 a601          	ld	a,#1
2130  0408 f7            	ld	(x),a
2131                     ; 972   RTC_DateStruct->RTC_Date = 1;
2133  0409 a601          	ld	a,#1
2134  040b e702          	ld	(2,x),a
2135                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2137  040d a601          	ld	a,#1
2138  040f e701          	ld	(1,x),a
2139                     ; 974   RTC_DateStruct->RTC_Year = 0;
2141  0411 6f03          	clr	(3,x)
2142                     ; 975 }
2145  0413 81            	ret
2200                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2200                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2200                     ; 990 {
2201                     	switch	.text
2202  0414               _RTC_GetDate:
2204  0414 88            	push	a
2205  0415 88            	push	a
2206       00000001      OFST:	set	1
2209                     ; 991   uint8_t tmpreg = 0;
2211  0416 0f01          	clr	(OFST+0,sp)
2212                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2214                     ; 997   (void) (RTC->TR1) ;
2216  0418 c65140        	ld	a,20800
2217  041b 97            	ld	xl,a
2218                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2220  041c 1e05          	ldw	x,(OFST+4,sp)
2221  041e c65144        	ld	a,20804
2222  0421 e702          	ld	(2,x),a
2223                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2225  0423 c65145        	ld	a,20805
2226  0426 6b01          	ld	(OFST+0,sp),a
2227                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2229  0428 1e05          	ldw	x,(OFST+4,sp)
2230  042a c65146        	ld	a,20806
2231  042d e703          	ld	(3,x),a
2232                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2234  042f 7b01          	ld	a,(OFST+0,sp)
2235  0431 a41f          	and	a,#31
2236  0433 1e05          	ldw	x,(OFST+4,sp)
2237  0435 e701          	ld	(1,x),a
2238                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2240  0437 7b01          	ld	a,(OFST+0,sp)
2241  0439 a4e0          	and	a,#224
2242  043b 4e            	swap	a
2243  043c 44            	srl	a
2244  043d a407          	and	a,#7
2245  043f 1e05          	ldw	x,(OFST+4,sp)
2246  0441 f7            	ld	(x),a
2247                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2249  0442 0d02          	tnz	(OFST+1,sp)
2250  0444 2621          	jrne	L3501
2251                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2253  0446 1e05          	ldw	x,(OFST+4,sp)
2254  0448 e603          	ld	a,(3,x)
2255  044a cd0a26        	call	L5_Bcd2ToByte
2257  044d 1e05          	ldw	x,(OFST+4,sp)
2258  044f e703          	ld	(3,x),a
2259                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2261  0451 1e05          	ldw	x,(OFST+4,sp)
2262  0453 e601          	ld	a,(1,x)
2263  0455 cd0a26        	call	L5_Bcd2ToByte
2265  0458 1e05          	ldw	x,(OFST+4,sp)
2266  045a e701          	ld	(1,x),a
2267                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2269  045c 1e05          	ldw	x,(OFST+4,sp)
2270  045e e602          	ld	a,(2,x)
2271  0460 cd0a26        	call	L5_Bcd2ToByte
2273  0463 1e05          	ldw	x,(OFST+4,sp)
2274  0465 e702          	ld	(2,x),a
2275  0467               L3501:
2276                     ; 1014 }
2279  0467 85            	popw	x
2280  0468 81            	ret
2421                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2421                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2421                     ; 1046 {
2422                     	switch	.text
2423  0469               _RTC_SetAlarm:
2425  0469 88            	push	a
2426  046a 5205          	subw	sp,#5
2427       00000005      OFST:	set	5
2430                     ; 1047   uint8_t tmpreg1 = 0;
2432  046c 7b02          	ld	a,(OFST-3,sp)
2433  046e 97            	ld	xl,a
2434                     ; 1048   uint8_t tmpreg2 = 0;
2436  046f 7b03          	ld	a,(OFST-2,sp)
2437  0471 97            	ld	xl,a
2438                     ; 1049   uint8_t tmpreg3 = 0;
2440  0472 7b04          	ld	a,(OFST-1,sp)
2441  0474 97            	ld	xl,a
2442                     ; 1050   uint8_t tmpreg4 = 0;
2444  0475 7b05          	ld	a,(OFST+0,sp)
2445  0477 97            	ld	xl,a
2446                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2448                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2450                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2452                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2454                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2456  0478 0d06          	tnz	(OFST+1,sp)
2457  047a 2609          	jrne	L1411
2458                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2460  047c c65148        	ld	a,20808
2461  047f a540          	bcp	a,#64
2462  0481 2700          	jreq	L3411
2463                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2465                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2468  0483               L3411:
2469                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2471                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2473                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2476  0483 2007          	jra	L7411
2477  0485               L1411:
2478                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2480  0485 c65148        	ld	a,20808
2481  0488 a540          	bcp	a,#64
2482  048a 2700          	jreq	L1511
2483                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2485                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2488  048c               L1511:
2489                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2491                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2493                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2495  048c               L7411:
2496                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2498  048c 1e09          	ldw	x,(OFST+4,sp)
2499  048e e604          	ld	a,(4,x)
2500  0490 a510          	bcp	a,#16
2501  0492 2608          	jrne	L5511
2502                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2504  0494 1e09          	ldw	x,(OFST+4,sp)
2505  0496 e605          	ld	a,(5,x)
2506  0498 a140          	cp	a,#64
2507  049a 2600          	jrne	L7511
2508                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2511  049c               L7511:
2512                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2514                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2516  049c               L5511:
2517                     ; 1108   RTC->WPR = 0xCA;
2519  049c 35ca5159      	mov	20825,#202
2520                     ; 1109   RTC->WPR = 0x53;
2522  04a0 35535159      	mov	20825,#83
2523                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2525  04a4 0d06          	tnz	(OFST+1,sp)
2526  04a6 2747          	jreq	L3611
2527                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2527                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2529  04a8 1e09          	ldw	x,(OFST+4,sp)
2530  04aa e604          	ld	a,(4,x)
2531  04ac a480          	and	a,#128
2532  04ae 1e09          	ldw	x,(OFST+4,sp)
2533  04b0 ea02          	or	a,(2,x)
2534  04b2 6b02          	ld	(OFST-3,sp),a
2535                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2535                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2537  04b4 1e09          	ldw	x,(OFST+4,sp)
2538  04b6 e604          	ld	a,(4,x)
2539  04b8 48            	sll	a
2540  04b9 a480          	and	a,#128
2541  04bb 1e09          	ldw	x,(OFST+4,sp)
2542  04bd ea01          	or	a,(1,x)
2543  04bf 6b03          	ld	(OFST-2,sp),a
2544                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2544                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2544                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2546  04c1 1e09          	ldw	x,(OFST+4,sp)
2547  04c3 e604          	ld	a,(4,x)
2548  04c5 48            	sll	a
2549  04c6 48            	sll	a
2550  04c7 a480          	and	a,#128
2551  04c9 6b01          	ld	(OFST-4,sp),a
2552  04cb 1e09          	ldw	x,(OFST+4,sp)
2553  04cd e603          	ld	a,(3,x)
2554  04cf 1e09          	ldw	x,(OFST+4,sp)
2555  04d1 fa            	or	a,(x)
2556  04d2 1a01          	or	a,(OFST-4,sp)
2557  04d4 6b04          	ld	(OFST-1,sp),a
2558                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2558                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2558                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2560  04d6 1e09          	ldw	x,(OFST+4,sp)
2561  04d8 e604          	ld	a,(4,x)
2562  04da 48            	sll	a
2563  04db 48            	sll	a
2564  04dc 48            	sll	a
2565  04dd a480          	and	a,#128
2566  04df 6b01          	ld	(OFST-4,sp),a
2567  04e1 1e09          	ldw	x,(OFST+4,sp)
2568  04e3 e605          	ld	a,(5,x)
2569  04e5 1e09          	ldw	x,(OFST+4,sp)
2570  04e7 ea06          	or	a,(6,x)
2571  04e9 1a01          	or	a,(OFST-4,sp)
2572  04eb 6b05          	ld	(OFST+0,sp),a
2574  04ed 2059          	jra	L5611
2575  04ef               L3611:
2576                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2576                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2578  04ef 1e09          	ldw	x,(OFST+4,sp)
2579  04f1 e604          	ld	a,(4,x)
2580  04f3 a480          	and	a,#128
2581  04f5 6b01          	ld	(OFST-4,sp),a
2582  04f7 1e09          	ldw	x,(OFST+4,sp)
2583  04f9 e602          	ld	a,(2,x)
2584  04fb cd0a07        	call	L3_ByteToBcd2
2586  04fe 1a01          	or	a,(OFST-4,sp)
2587  0500 6b02          	ld	(OFST-3,sp),a
2588                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2588                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2590  0502 1e09          	ldw	x,(OFST+4,sp)
2591  0504 e604          	ld	a,(4,x)
2592  0506 48            	sll	a
2593  0507 a480          	and	a,#128
2594  0509 6b01          	ld	(OFST-4,sp),a
2595  050b 1e09          	ldw	x,(OFST+4,sp)
2596  050d e601          	ld	a,(1,x)
2597  050f cd0a07        	call	L3_ByteToBcd2
2599  0512 1a01          	or	a,(OFST-4,sp)
2600  0514 6b03          	ld	(OFST-2,sp),a
2601                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2601                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2601                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2603  0516 1e09          	ldw	x,(OFST+4,sp)
2604  0518 e604          	ld	a,(4,x)
2605  051a 48            	sll	a
2606  051b 48            	sll	a
2607  051c a480          	and	a,#128
2608  051e 6b01          	ld	(OFST-4,sp),a
2609  0520 1e09          	ldw	x,(OFST+4,sp)
2610  0522 f6            	ld	a,(x)
2611  0523 cd0a07        	call	L3_ByteToBcd2
2613  0526 1e09          	ldw	x,(OFST+4,sp)
2614  0528 ea03          	or	a,(3,x)
2615  052a 1a01          	or	a,(OFST-4,sp)
2616  052c 6b04          	ld	(OFST-1,sp),a
2617                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2617                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2617                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2619  052e 1e09          	ldw	x,(OFST+4,sp)
2620  0530 e604          	ld	a,(4,x)
2621  0532 48            	sll	a
2622  0533 48            	sll	a
2623  0534 48            	sll	a
2624  0535 a480          	and	a,#128
2625  0537 6b01          	ld	(OFST-4,sp),a
2626  0539 1e09          	ldw	x,(OFST+4,sp)
2627  053b e606          	ld	a,(6,x)
2628  053d cd0a07        	call	L3_ByteToBcd2
2630  0540 1e09          	ldw	x,(OFST+4,sp)
2631  0542 ea05          	or	a,(5,x)
2632  0544 1a01          	or	a,(OFST-4,sp)
2633  0546 6b05          	ld	(OFST+0,sp),a
2634  0548               L5611:
2635                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2637  0548 7b02          	ld	a,(OFST-3,sp)
2638  054a c7515c        	ld	20828,a
2639                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2641  054d 7b03          	ld	a,(OFST-2,sp)
2642  054f c7515d        	ld	20829,a
2643                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2645  0552 7b04          	ld	a,(OFST-1,sp)
2646  0554 c7515e        	ld	20830,a
2647                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2649  0557 7b05          	ld	a,(OFST+0,sp)
2650  0559 c7515f        	ld	20831,a
2651                     ; 1154   RTC->WPR = 0xFF; 
2653  055c 35ff5159      	mov	20825,#255
2654                     ; 1155 }
2657  0560 5b06          	addw	sp,#6
2658  0562 81            	ret
2696                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2696                     ; 1166 {
2697                     	switch	.text
2698  0563               _RTC_AlarmStructInit:
2702                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2704  0563 6f03          	clr	(3,x)
2705                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2707  0565 7f            	clr	(x)
2708                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2710  0566 6f01          	clr	(1,x)
2711                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2713  0568 6f02          	clr	(2,x)
2714                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2716  056a 6f05          	clr	(5,x)
2717                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2719  056c a601          	ld	a,#1
2720  056e e706          	ld	(6,x),a
2721                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2723  0570 a6f0          	ld	a,#240
2724  0572 e704          	ld	(4,x),a
2725                     ; 1179 }
2728  0574 81            	ret
2811                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2811                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2811                     ; 1190 {
2812                     	switch	.text
2813  0575               _RTC_GetAlarm:
2815  0575 88            	push	a
2816  0576 5204          	subw	sp,#4
2817       00000004      OFST:	set	4
2820                     ; 1191   uint8_t tmpreg1 = 0;
2822  0578 7b04          	ld	a,(OFST+0,sp)
2823  057a 97            	ld	xl,a
2824                     ; 1192   uint8_t tmpreg2 = 0;
2826  057b 7b01          	ld	a,(OFST-3,sp)
2827  057d 97            	ld	xl,a
2828                     ; 1193   uint8_t tmpreg3 = 0;
2830  057e 7b02          	ld	a,(OFST-2,sp)
2831  0580 97            	ld	xl,a
2832                     ; 1194   uint8_t tmpreg4 = 0;
2834  0581 7b03          	ld	a,(OFST-1,sp)
2835  0583 97            	ld	xl,a
2836                     ; 1195   uint8_t alarmmask = 0;
2838  0584 7b04          	ld	a,(OFST+0,sp)
2839  0586 97            	ld	xl,a
2840                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2842                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2844  0587 c6515c        	ld	a,20828
2845  058a 6b04          	ld	(OFST+0,sp),a
2846                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2848  058c c6515d        	ld	a,20829
2849  058f 6b01          	ld	(OFST-3,sp),a
2850                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2852  0591 c6515e        	ld	a,20830
2853  0594 6b02          	ld	(OFST-2,sp),a
2854                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2856  0596 c6515f        	ld	a,20831
2857  0599 6b03          	ld	(OFST-1,sp),a
2858                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2860  059b 7b04          	ld	a,(OFST+0,sp)
2861  059d a47f          	and	a,#127
2862  059f 1e08          	ldw	x,(OFST+4,sp)
2863  05a1 e702          	ld	(2,x),a
2864                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2866  05a3 7b04          	ld	a,(OFST+0,sp)
2867  05a5 a480          	and	a,#128
2868  05a7 6b04          	ld	(OFST+0,sp),a
2869                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2871  05a9 7b01          	ld	a,(OFST-3,sp)
2872  05ab a47f          	and	a,#127
2873  05ad 1e08          	ldw	x,(OFST+4,sp)
2874  05af e701          	ld	(1,x),a
2875                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2877  05b1 7b01          	ld	a,(OFST-3,sp)
2878  05b3 a480          	and	a,#128
2879  05b5 44            	srl	a
2880  05b6 1a04          	or	a,(OFST+0,sp)
2881  05b8 6b04          	ld	(OFST+0,sp),a
2882                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2884  05ba 7b02          	ld	a,(OFST-2,sp)
2885  05bc a43f          	and	a,#63
2886  05be 1e08          	ldw	x,(OFST+4,sp)
2887  05c0 f7            	ld	(x),a
2888                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2890  05c1 7b02          	ld	a,(OFST-2,sp)
2891  05c3 a440          	and	a,#64
2892  05c5 1e08          	ldw	x,(OFST+4,sp)
2893  05c7 e703          	ld	(3,x),a
2894                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2896  05c9 7b02          	ld	a,(OFST-2,sp)
2897  05cb a480          	and	a,#128
2898  05cd 44            	srl	a
2899  05ce 44            	srl	a
2900  05cf 1a04          	or	a,(OFST+0,sp)
2901  05d1 6b04          	ld	(OFST+0,sp),a
2902                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2904  05d3 7b03          	ld	a,(OFST-1,sp)
2905  05d5 a43f          	and	a,#63
2906  05d7 1e08          	ldw	x,(OFST+4,sp)
2907  05d9 e706          	ld	(6,x),a
2908                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2910  05db 7b03          	ld	a,(OFST-1,sp)
2911  05dd a440          	and	a,#64
2912  05df 1e08          	ldw	x,(OFST+4,sp)
2913  05e1 e705          	ld	(5,x),a
2914                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2916  05e3 7b03          	ld	a,(OFST-1,sp)
2917  05e5 a480          	and	a,#128
2918  05e7 44            	srl	a
2919  05e8 44            	srl	a
2920  05e9 44            	srl	a
2921  05ea 1a04          	or	a,(OFST+0,sp)
2922  05ec 6b04          	ld	(OFST+0,sp),a
2923                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2925  05ee 7b04          	ld	a,(OFST+0,sp)
2926  05f0 1e08          	ldw	x,(OFST+4,sp)
2927  05f2 e704          	ld	(4,x),a
2928                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2930  05f4 0d05          	tnz	(OFST+1,sp)
2931  05f6 262a          	jrne	L5421
2932                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2934  05f8 1e08          	ldw	x,(OFST+4,sp)
2935  05fa f6            	ld	a,(x)
2936  05fb cd0a26        	call	L5_Bcd2ToByte
2938  05fe 1e08          	ldw	x,(OFST+4,sp)
2939  0600 f7            	ld	(x),a
2940                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2942  0601 1e08          	ldw	x,(OFST+4,sp)
2943  0603 e601          	ld	a,(1,x)
2944  0605 cd0a26        	call	L5_Bcd2ToByte
2946  0608 1e08          	ldw	x,(OFST+4,sp)
2947  060a e701          	ld	(1,x),a
2948                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2950  060c 1e08          	ldw	x,(OFST+4,sp)
2951  060e e602          	ld	a,(2,x)
2952  0610 cd0a26        	call	L5_Bcd2ToByte
2954  0613 1e08          	ldw	x,(OFST+4,sp)
2955  0615 e702          	ld	(2,x),a
2956                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2958  0617 1e08          	ldw	x,(OFST+4,sp)
2959  0619 e606          	ld	a,(6,x)
2960  061b cd0a26        	call	L5_Bcd2ToByte
2962  061e 1e08          	ldw	x,(OFST+4,sp)
2963  0620 e706          	ld	(6,x),a
2964  0622               L5421:
2965                     ; 1233 }
2968  0622 5b05          	addw	sp,#5
2969  0624 81            	ret
3031                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3031                     ; 1243 {
3032                     	switch	.text
3033  0625               _RTC_AlarmCmd:
3035  0625 88            	push	a
3036  0626 5203          	subw	sp,#3
3037       00000003      OFST:	set	3
3040                     ; 1244   __IO uint16_t alrawfcount = 0;
3042  0628 5f            	clrw	x
3043  0629 1f01          	ldw	(OFST-2,sp),x
3044                     ; 1245   ErrorStatus status = ERROR;
3046  062b 7b03          	ld	a,(OFST+0,sp)
3047  062d 97            	ld	xl,a
3048                     ; 1246   uint8_t temp1 = 0;
3050  062e 7b03          	ld	a,(OFST+0,sp)
3051  0630 97            	ld	xl,a
3052                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
3054                     ; 1252   RTC->WPR = 0xCA;
3056  0631 35ca5159      	mov	20825,#202
3057                     ; 1253   RTC->WPR = 0x53;
3059  0635 35535159      	mov	20825,#83
3060                     ; 1256   if (NewState != DISABLE)
3062  0639 0d04          	tnz	(OFST+1,sp)
3063  063b 2711          	jreq	L7721
3064                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3066  063d 72105149      	bset	20809,#0
3067                     ; 1259     status = SUCCESS;
3069  0641 a601          	ld	a,#1
3070  0643 6b03          	ld	(OFST+0,sp),a
3072  0645               L1031:
3073                     ; 1283   RTC->WPR = 0xFF; 
3075  0645 35ff5159      	mov	20825,#255
3076                     ; 1286   return (ErrorStatus)status;
3078  0649 7b03          	ld	a,(OFST+0,sp)
3081  064b 5b04          	addw	sp,#4
3082  064d 81            	ret
3083  064e               L7721:
3084                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3086  064e 72115149      	bres	20809,#0
3087                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3089  0652 c6514c        	ld	a,20812
3090  0655 a401          	and	a,#1
3091  0657 6b03          	ld	(OFST+0,sp),a
3093  0659 2007          	jra	L7031
3094  065b               L3031:
3095                     ; 1269       alrawfcount++;
3097  065b 1e01          	ldw	x,(OFST-2,sp)
3098  065d 1c0001        	addw	x,#1
3099  0660 1f01          	ldw	(OFST-2,sp),x
3100  0662               L7031:
3101                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3103  0662 1e01          	ldw	x,(OFST-2,sp)
3104  0664 a3ffff        	cpw	x,#65535
3105  0667 2704          	jreq	L3131
3107  0669 0d03          	tnz	(OFST+0,sp)
3108  066b 27ee          	jreq	L3031
3109  066d               L3131:
3110                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3112  066d c6514c        	ld	a,20812
3113  0670 a501          	bcp	a,#1
3114  0672 2604          	jrne	L5131
3115                     ; 1274       status = ERROR;
3117  0674 0f03          	clr	(OFST+0,sp)
3119  0676 20cd          	jra	L1031
3120  0678               L5131:
3121                     ; 1278       status = SUCCESS;
3123  0678 a601          	ld	a,#1
3124  067a 6b03          	ld	(OFST+0,sp),a
3125  067c 20c7          	jra	L1031
3322                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3322                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3322                     ; 1300 {
3323                     	switch	.text
3324  067e               _RTC_AlarmSubSecondConfig:
3326  067e 89            	pushw	x
3327  067f 88            	push	a
3328       00000001      OFST:	set	1
3331                     ; 1301   uint8_t alarmstatus = 0;
3333  0680 7b01          	ld	a,(OFST+0,sp)
3334  0682 97            	ld	xl,a
3335                     ; 1302   ErrorStatus status = ERROR;
3337  0683 7b01          	ld	a,(OFST+0,sp)
3338  0685 97            	ld	xl,a
3339                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3341                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3343                     ; 1309   RTC->WPR = 0xCA;
3345  0686 35ca5159      	mov	20825,#202
3346                     ; 1310   RTC->WPR = 0x53;
3348  068a 35535159      	mov	20825,#83
3349                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3351  068e c6514c        	ld	a,20812
3352  0691 a540          	bcp	a,#64
3353  0693 2628          	jrne	L3141
3354                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3356  0695 c65149        	ld	a,20809
3357  0698 aa01          	or	a,#1
3358  069a 6b01          	ld	(OFST+0,sp),a
3359                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3361  069c 72115149      	bres	20809,#0
3362                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3364  06a0 7b02          	ld	a,(OFST+1,sp)
3365  06a2 c75164        	ld	20836,a
3366                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3368  06a5 7b03          	ld	a,(OFST+2,sp)
3369  06a7 c75165        	ld	20837,a
3370                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3372  06aa 7b06          	ld	a,(OFST+5,sp)
3373  06ac c75166        	ld	20838,a
3374                     ; 1327     RTC->CR2 |= alarmstatus;
3376  06af c65149        	ld	a,20809
3377  06b2 1a01          	or	a,(OFST+0,sp)
3378  06b4 c75149        	ld	20809,a
3379                     ; 1329     status = SUCCESS;
3381  06b7 a601          	ld	a,#1
3382  06b9 6b01          	ld	(OFST+0,sp),a
3384  06bb 2002          	jra	L5141
3385  06bd               L3141:
3386                     ; 1333     status = ERROR;
3388  06bd 0f01          	clr	(OFST+0,sp)
3389  06bf               L5141:
3390                     ; 1337   RTC->WPR = 0xFF; 
3392  06bf 35ff5159      	mov	20825,#255
3393                     ; 1339   return (ErrorStatus)status;
3395  06c3 7b01          	ld	a,(OFST+0,sp)
3398  06c5 5b03          	addw	sp,#3
3399  06c7 81            	ret
3489                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3489                     ; 1370 {
3490                     	switch	.text
3491  06c8               _RTC_WakeUpClockConfig:
3493  06c8 88            	push	a
3494       00000000      OFST:	set	0
3497                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3499                     ; 1376   RTC->WPR = 0xCA;
3501  06c9 35ca5159      	mov	20825,#202
3502                     ; 1377   RTC->WPR = 0x53;
3504  06cd 35535159      	mov	20825,#83
3505                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3507  06d1 72155149      	bres	20809,#2
3508                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3510  06d5 c65148        	ld	a,20808
3511  06d8 a4f8          	and	a,#248
3512  06da c75148        	ld	20808,a
3513                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3515  06dd c65148        	ld	a,20808
3516  06e0 1a01          	or	a,(OFST+1,sp)
3517  06e2 c75148        	ld	20808,a
3518                     ; 1389   RTC->WPR = 0xFF; 
3520  06e5 35ff5159      	mov	20825,#255
3521                     ; 1390 }
3524  06e9 84            	pop	a
3525  06ea 81            	ret
3558                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3558                     ; 1401 {
3559                     	switch	.text
3560  06eb               _RTC_SetWakeUpCounter:
3564                     ; 1403   RTC->WPR = 0xCA;
3566  06eb 35ca5159      	mov	20825,#202
3567                     ; 1404   RTC->WPR = 0x53;
3569  06ef 35535159      	mov	20825,#83
3570                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3572  06f3 9e            	ld	a,xh
3573  06f4 c75154        	ld	20820,a
3574                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3576  06f7 9f            	ld	a,xl
3577  06f8 c75155        	ld	20821,a
3578                     ; 1412   RTC->WPR = 0xFF; 
3580  06fb 35ff5159      	mov	20825,#255
3581                     ; 1413 }
3584  06ff 81            	ret
3617                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3617                     ; 1421 {
3618                     	switch	.text
3619  0700               _RTC_GetWakeUpCounter:
3621  0700 89            	pushw	x
3622       00000002      OFST:	set	2
3625                     ; 1422   uint16_t tmpreg = 0;
3627  0701 5f            	clrw	x
3628  0702 1f01          	ldw	(OFST-1,sp),x
3629                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3631  0704 c65154        	ld	a,20820
3632  0707 5f            	clrw	x
3633  0708 97            	ld	xl,a
3634  0709 4f            	clr	a
3635  070a 02            	rlwa	x,a
3636  070b 1f01          	ldw	(OFST-1,sp),x
3637                     ; 1426   tmpreg |= RTC->WUTRL;
3639  070d c65155        	ld	a,20821
3640  0710 5f            	clrw	x
3641  0711 97            	ld	xl,a
3642  0712 01            	rrwa	x,a
3643  0713 1a02          	or	a,(OFST+0,sp)
3644  0715 01            	rrwa	x,a
3645  0716 1a01          	or	a,(OFST-1,sp)
3646  0718 01            	rrwa	x,a
3647  0719 1f01          	ldw	(OFST-1,sp),x
3648                     ; 1429   return (uint16_t)tmpreg;
3650  071b 1e01          	ldw	x,(OFST-1,sp)
3653  071d 5b02          	addw	sp,#2
3654  071f 81            	ret
3707                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3707                     ; 1441 {
3708                     	switch	.text
3709  0720               _RTC_WakeUpCmd:
3711  0720 88            	push	a
3712  0721 5203          	subw	sp,#3
3713       00000003      OFST:	set	3
3716                     ; 1442   ErrorStatus status = ERROR;
3718  0723 7b01          	ld	a,(OFST-2,sp)
3719  0725 97            	ld	xl,a
3720                     ; 1443   uint16_t wutwfcount = 0;
3722  0726 5f            	clrw	x
3723  0727 1f02          	ldw	(OFST-1,sp),x
3724                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3726                     ; 1449   RTC->WPR = 0xCA;
3728  0729 35ca5159      	mov	20825,#202
3729                     ; 1450   RTC->WPR = 0x53;
3731  072d 35535159      	mov	20825,#83
3732                     ; 1452   if (NewState != DISABLE)
3734  0731 0d04          	tnz	(OFST+1,sp)
3735  0733 2711          	jreq	L1351
3736                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3738  0735 72145149      	bset	20809,#2
3739                     ; 1457     status = SUCCESS;
3741  0739 a601          	ld	a,#1
3742  073b 6b01          	ld	(OFST-2,sp),a
3744  073d               L3351:
3745                     ; 1482   RTC->WPR = 0xFF; 
3747  073d 35ff5159      	mov	20825,#255
3748                     ; 1485   return (ErrorStatus)status;
3750  0741 7b01          	ld	a,(OFST-2,sp)
3753  0743 5b04          	addw	sp,#4
3754  0745 81            	ret
3755  0746               L1351:
3756                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3758  0746 72155149      	bres	20809,#2
3760  074a 2007          	jra	L7351
3761  074c               L5351:
3762                     ; 1467       wutwfcount++;
3764  074c 1e02          	ldw	x,(OFST-1,sp)
3765  074e 1c0001        	addw	x,#1
3766  0751 1f02          	ldw	(OFST-1,sp),x
3767  0753               L7351:
3768                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3770  0753 c6514c        	ld	a,20812
3771  0756 a504          	bcp	a,#4
3772  0758 2607          	jrne	L3451
3774  075a 1e02          	ldw	x,(OFST-1,sp)
3775  075c a3ffff        	cpw	x,#65535
3776  075f 26eb          	jrne	L5351
3777  0761               L3451:
3778                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3780  0761 c6514c        	ld	a,20812
3781  0764 a504          	bcp	a,#4
3782  0766 2604          	jrne	L5451
3783                     ; 1473       status = ERROR;
3785  0768 0f01          	clr	(OFST-2,sp)
3787  076a 20d1          	jra	L3351
3788  076c               L5451:
3789                     ; 1477       status = SUCCESS;
3791  076c a601          	ld	a,#1
3792  076e 6b01          	ld	(OFST-2,sp),a
3793  0770 20cb          	jra	L3351
3883                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3883                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3883                     ; 1524 {
3884                     	switch	.text
3885  0772               _RTC_DayLightSavingConfig:
3887  0772 89            	pushw	x
3888       00000000      OFST:	set	0
3891                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3893                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3895                     ; 1530   RTC->WPR = 0xCA;
3897  0773 35ca5159      	mov	20825,#202
3898                     ; 1531   RTC->WPR = 0x53;
3900  0777 35535159      	mov	20825,#83
3901                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3903  077b 7215514a      	bres	20810,#2
3904                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3906  077f 9f            	ld	a,xl
3907  0780 1a01          	or	a,(OFST+1,sp)
3908  0782 ca514a        	or	a,20810
3909  0785 c7514a        	ld	20810,a
3910                     ; 1540   RTC->WPR = 0xFF; 
3912  0788 35ff5159      	mov	20825,#255
3913                     ; 1541 }
3916  078c 85            	popw	x
3917  078d 81            	ret
3942                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3942                     ; 1550 {
3943                     	switch	.text
3944  078e               _RTC_GetStoreOperation:
3948                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3950  078e c6514a        	ld	a,20810
3951  0791 a404          	and	a,#4
3954  0793 81            	ret
4048                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4048                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4048                     ; 1589 {
4049                     	switch	.text
4050  0794               _RTC_OutputConfig:
4052  0794 89            	pushw	x
4053       00000000      OFST:	set	0
4056                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4058                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4060                     ; 1595   RTC->WPR = 0xCA;
4062  0795 35ca5159      	mov	20825,#202
4063                     ; 1596   RTC->WPR = 0x53;
4065  0799 35535159      	mov	20825,#83
4066                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4068  079d c6514a        	ld	a,20810
4069  07a0 a48f          	and	a,#143
4070  07a2 c7514a        	ld	20810,a
4071                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4073  07a5 9f            	ld	a,xl
4074  07a6 1a01          	or	a,(OFST+1,sp)
4075  07a8 ca514a        	or	a,20810
4076  07ab c7514a        	ld	20810,a
4077                     ; 1605   RTC->WPR = 0xFF; 
4079  07ae 35ff5159      	mov	20825,#255
4080                     ; 1606 }
4083  07b2 85            	popw	x
4084  07b3 81            	ret
4173                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4173                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4173                     ; 1641 {
4174                     	switch	.text
4175  07b4               _RTC_SynchroShiftConfig:
4177  07b4 88            	push	a
4178  07b5 5203          	subw	sp,#3
4179       00000003      OFST:	set	3
4182                     ; 1642   uint8_t shiftrhreg = 0;
4184  07b7 7b01          	ld	a,(OFST-2,sp)
4185  07b9 97            	ld	xl,a
4186                     ; 1643   ErrorStatus status = ERROR;
4188  07ba 7b01          	ld	a,(OFST-2,sp)
4189  07bc 97            	ld	xl,a
4190                     ; 1644   uint16_t shpfcount = 0;
4192  07bd 5f            	clrw	x
4193  07be 1f02          	ldw	(OFST-1,sp),x
4194                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4196                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4198                     ; 1651   RTC->WPR = 0xCA;
4200  07c0 35ca5159      	mov	20825,#202
4201                     ; 1652   RTC->WPR = 0x53;
4203  07c4 35535159      	mov	20825,#83
4204                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4206  07c8 c6514c        	ld	a,20812
4207  07cb a508          	bcp	a,#8
4208  07cd 2717          	jreq	L7271
4210  07cf 2007          	jra	L3371
4211  07d1               L1371:
4212                     ; 1660       shpfcount++;
4214  07d1 1e02          	ldw	x,(OFST-1,sp)
4215  07d3 1c0001        	addw	x,#1
4216  07d6 1f02          	ldw	(OFST-1,sp),x
4217  07d8               L3371:
4218                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4220  07d8 c6514c        	ld	a,20812
4221  07db a508          	bcp	a,#8
4222  07dd 2707          	jreq	L7271
4224  07df 1e02          	ldw	x,(OFST-1,sp)
4225  07e1 a3ffff        	cpw	x,#65535
4226  07e4 26eb          	jrne	L1371
4227  07e6               L7271:
4228                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4230  07e6 c6514c        	ld	a,20812
4231  07e9 a508          	bcp	a,#8
4232  07eb 2616          	jrne	L1471
4233                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4235  07ed 7b07          	ld	a,(OFST+4,sp)
4236  07ef 1a04          	or	a,(OFST+1,sp)
4237  07f1 6b01          	ld	(OFST-2,sp),a
4238                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4240  07f3 7b01          	ld	a,(OFST-2,sp)
4241  07f5 c7515a        	ld	20826,a
4242                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4244  07f8 7b08          	ld	a,(OFST+5,sp)
4245  07fa c7515b        	ld	20827,a
4246                     ; 1672     status = SUCCESS;
4248  07fd a601          	ld	a,#1
4249  07ff 6b01          	ld	(OFST-2,sp),a
4251  0801 2002          	jra	L3471
4252  0803               L1471:
4253                     ; 1676     status = ERROR;
4255  0803 0f01          	clr	(OFST-2,sp)
4256  0805               L3471:
4257                     ; 1680   RTC->WPR = 0xFF; 
4259  0805 35ff5159      	mov	20825,#255
4260                     ; 1682   return (ErrorStatus)(status);
4262  0809 7b01          	ld	a,(OFST-2,sp)
4265  080b 5b04          	addw	sp,#4
4266  080d 81            	ret
4392                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4392                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4392                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4392                     ; 1721 {
4393                     	switch	.text
4394  080e               _RTC_SmoothCalibConfig:
4396  080e 89            	pushw	x
4397  080f 5203          	subw	sp,#3
4398       00000003      OFST:	set	3
4401                     ; 1722   ErrorStatus status = ERROR;
4403  0811 7b01          	ld	a,(OFST-2,sp)
4404  0813 97            	ld	xl,a
4405                     ; 1723   uint16_t recalpfcount = 0;
4407  0814 5f            	clrw	x
4408  0815 1f02          	ldw	(OFST-1,sp),x
4409                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4411                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4413                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4415                     ; 1731   RTC->WPR = 0xCA;
4417  0817 35ca5159      	mov	20825,#202
4418                     ; 1732   RTC->WPR = 0x53;
4420  081b 35535159      	mov	20825,#83
4421                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4423  081f c6514c        	ld	a,20812
4424  0822 a502          	bcp	a,#2
4425  0824 2717          	jreq	L1202
4427  0826 2007          	jra	L5202
4428  0828               L3202:
4429                     ; 1740       recalpfcount++;
4431  0828 1e02          	ldw	x,(OFST-1,sp)
4432  082a 1c0001        	addw	x,#1
4433  082d 1f02          	ldw	(OFST-1,sp),x
4434  082f               L5202:
4435                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4437  082f c6514c        	ld	a,20812
4438  0832 a502          	bcp	a,#2
4439  0834 2707          	jreq	L1202
4441  0836 1e02          	ldw	x,(OFST-1,sp)
4442  0838 a3ffff        	cpw	x,#65535
4443  083b 26eb          	jrne	L3202
4444  083d               L1202:
4445                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4447  083d c6514c        	ld	a,20812
4448  0840 a502          	bcp	a,#2
4449  0842 2614          	jrne	L3302
4450                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4450                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4450                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4452  0844 7b04          	ld	a,(OFST+1,sp)
4453  0846 1a05          	or	a,(OFST+2,sp)
4454  0848 1a08          	or	a,(OFST+5,sp)
4455  084a c7516a        	ld	20842,a
4456                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4458  084d 7b09          	ld	a,(OFST+6,sp)
4459  084f c7516b        	ld	20843,a
4460                     ; 1754     status = SUCCESS;
4462  0852 a601          	ld	a,#1
4463  0854 6b01          	ld	(OFST-2,sp),a
4465  0856 2002          	jra	L5302
4466  0858               L3302:
4467                     ; 1758     status = ERROR;
4469  0858 0f01          	clr	(OFST-2,sp)
4470  085a               L5302:
4471                     ; 1762   RTC->WPR = 0xFF; 
4473  085a 35ff5159      	mov	20825,#255
4474                     ; 1764   return (ErrorStatus)(status);
4476  085e 7b01          	ld	a,(OFST-2,sp)
4479  0860 5b05          	addw	sp,#5
4480  0862 81            	ret
4538                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4538                     ; 1791 {
4539                     	switch	.text
4540  0863               _RTC_CalibOutputConfig:
4544                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4546                     ; 1796   RTC->WPR = 0xCA;
4548  0863 35ca5159      	mov	20825,#202
4549                     ; 1797   RTC->WPR = 0x53;
4551  0867 35535159      	mov	20825,#83
4552                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4554  086b 4d            	tnz	a
4555  086c 2706          	jreq	L5602
4556                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4558  086e 7216514a      	bset	20810,#3
4560  0872 2004          	jra	L7602
4561  0874               L5602:
4562                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4564  0874 7217514a      	bres	20810,#3
4565  0878               L7602:
4566                     ; 1811   RTC->WPR = 0xFF; 
4568  0878 35ff5159      	mov	20825,#255
4569                     ; 1812 }
4572  087c 81            	ret
4607                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4607                     ; 1821 {
4608                     	switch	.text
4609  087d               _RTC_CalibOutputCmd:
4613                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4615                     ; 1826   RTC->WPR = 0xCA;
4617  087d 35ca5159      	mov	20825,#202
4618                     ; 1827   RTC->WPR = 0x53;
4620  0881 35535159      	mov	20825,#83
4621                     ; 1829   if (NewState != DISABLE)
4623  0885 4d            	tnz	a
4624  0886 2706          	jreq	L7012
4625                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4627  0888 721e514a      	bset	20810,#7
4629  088c 2004          	jra	L1112
4630  088e               L7012:
4631                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4633  088e 721f514a      	bres	20810,#7
4634  0892               L1112:
4635                     ; 1841   RTC->WPR = 0xFF; 
4637  0892 35ff5159      	mov	20825,#255
4638                     ; 1842 }
4641  0896 81            	ret
4736                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4736                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4736                     ; 1873 {
4737                     	switch	.text
4738  0897               _RTC_TamperLevelConfig:
4740  0897 89            	pushw	x
4741       00000000      OFST:	set	0
4744                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4746                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4748                     ; 1879   RTC->WPR = 0xCA;
4750  0898 35ca5159      	mov	20825,#202
4751                     ; 1880   RTC->WPR = 0x53;
4753  089c 35535159      	mov	20825,#83
4754                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4756  08a0 9f            	ld	a,xl
4757  08a1 4d            	tnz	a
4758  08a2 270a          	jreq	L7512
4759                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4761  08a4 9e            	ld	a,xh
4762  08a5 48            	sll	a
4763  08a6 ca516c        	or	a,20844
4764  08a9 c7516c        	ld	20844,a
4766  08ac 200a          	jra	L1612
4767  08ae               L7512:
4768                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4770  08ae 7b01          	ld	a,(OFST+1,sp)
4771  08b0 48            	sll	a
4772  08b1 43            	cpl	a
4773  08b2 c4516c        	and	a,20844
4774  08b5 c7516c        	ld	20844,a
4775  08b8               L1612:
4776                     ; 1894   RTC->WPR = 0xFF; 
4778  08b8 35ff5159      	mov	20825,#255
4779                     ; 1895 }
4782  08bc 85            	popw	x
4783  08bd 81            	ret
4857                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4857                     ; 1904 {
4858                     	switch	.text
4859  08be               _RTC_TamperFilterConfig:
4861  08be 88            	push	a
4862       00000000      OFST:	set	0
4865                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4867                     ; 1910   RTC->WPR = 0xCA;
4869  08bf 35ca5159      	mov	20825,#202
4870                     ; 1911   RTC->WPR = 0x53;
4872  08c3 35535159      	mov	20825,#83
4873                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4875  08c7 c6516d        	ld	a,20845
4876  08ca a4e7          	and	a,#231
4877  08cc c7516d        	ld	20845,a
4878                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4880  08cf c6516d        	ld	a,20845
4881  08d2 1a01          	or	a,(OFST+1,sp)
4882  08d4 c7516d        	ld	20845,a
4883                     ; 1920   RTC->WPR = 0xFF; 
4885  08d7 35ff5159      	mov	20825,#255
4886                     ; 1922 }
4889  08db 84            	pop	a
4890  08dc 81            	ret
5003                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5003                     ; 1932 {
5004                     	switch	.text
5005  08dd               _RTC_TamperSamplingFreqConfig:
5007  08dd 88            	push	a
5008       00000000      OFST:	set	0
5011                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5013                     ; 1937   RTC->WPR = 0xCA;
5015  08de 35ca5159      	mov	20825,#202
5016                     ; 1938   RTC->WPR = 0x53;
5018  08e2 35535159      	mov	20825,#83
5019                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5021  08e6 c6516d        	ld	a,20845
5022  08e9 a4f8          	and	a,#248
5023  08eb c7516d        	ld	20845,a
5024                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5026  08ee c6516d        	ld	a,20845
5027  08f1 1a01          	or	a,(OFST+1,sp)
5028  08f3 c7516d        	ld	20845,a
5029                     ; 1947   RTC->WPR = 0xFF; 
5031  08f6 35ff5159      	mov	20825,#255
5032                     ; 1948 }
5035  08fa 84            	pop	a
5036  08fb 81            	ret
5119                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5119                     ; 1959 {
5120                     	switch	.text
5121  08fc               _RTC_TamperPinsPrechargeDuration:
5123  08fc 88            	push	a
5124       00000000      OFST:	set	0
5127                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5129                     ; 1964   RTC->WPR = 0xCA;
5131  08fd 35ca5159      	mov	20825,#202
5132                     ; 1965   RTC->WPR = 0x53;
5134  0901 35535159      	mov	20825,#83
5135                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5137  0905 c6516d        	ld	a,20845
5138  0908 a41f          	and	a,#31
5139  090a c7516d        	ld	20845,a
5140                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5142  090d c6516d        	ld	a,20845
5143  0910 1a01          	or	a,(OFST+1,sp)
5144  0912 c7516d        	ld	20845,a
5145                     ; 1974   RTC->WPR = 0xFF; 
5147  0915 35ff5159      	mov	20825,#255
5148                     ; 1975 }
5151  0919 84            	pop	a
5152  091a 81            	ret
5197                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5197                     ; 1988                    FunctionalState NewState)
5197                     ; 1989 {
5198                     	switch	.text
5199  091b               _RTC_TamperCmd:
5201  091b 89            	pushw	x
5202       00000000      OFST:	set	0
5205                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5207                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5209                     ; 1996   RTC->WPR = 0xCA;
5211  091c 35ca5159      	mov	20825,#202
5212                     ; 1997   RTC->WPR = 0x53;
5214  0920 35535159      	mov	20825,#83
5215                     ; 2000   if (NewState != DISABLE)
5217  0924 9f            	ld	a,xl
5218  0925 4d            	tnz	a
5219  0926 2709          	jreq	L5332
5220                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5222  0928 9e            	ld	a,xh
5223  0929 ca516c        	or	a,20844
5224  092c c7516c        	ld	20844,a
5226  092f 2009          	jra	L7332
5227  0931               L5332:
5228                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5230  0931 7b01          	ld	a,(OFST+1,sp)
5231  0933 43            	cpl	a
5232  0934 c4516c        	and	a,20844
5233  0937 c7516c        	ld	20844,a
5234  093a               L7332:
5235                     ; 2013   RTC->WPR = 0xFF; 
5237  093a 35ff5159      	mov	20825,#255
5238                     ; 2014 }
5241  093e 85            	popw	x
5242  093f 81            	ret
5314                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5314                     ; 2059 {
5315                     	switch	.text
5316  0940               _RTC_ITConfig:
5318  0940 89            	pushw	x
5319       00000000      OFST:	set	0
5322                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5324                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5326                     ; 2065   RTC->WPR = 0xCA;
5328  0941 35ca5159      	mov	20825,#202
5329                     ; 2066   RTC->WPR = 0x53;
5331  0945 35535159      	mov	20825,#83
5332                     ; 2068   if (NewState != DISABLE)
5334  0949 0d05          	tnz	(OFST+5,sp)
5335  094b 2715          	jreq	L5732
5336                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5338  094d 9f            	ld	a,xl
5339  094e a4f0          	and	a,#240
5340  0950 ca5149        	or	a,20809
5341  0953 c75149        	ld	20809,a
5342                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5344  0956 7b02          	ld	a,(OFST+2,sp)
5345  0958 a401          	and	a,#1
5346  095a ca516c        	or	a,20844
5347  095d c7516c        	ld	20844,a
5349  0960 2016          	jra	L7732
5350  0962               L5732:
5351                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5353  0962 7b02          	ld	a,(OFST+2,sp)
5354  0964 a4f0          	and	a,#240
5355  0966 43            	cpl	a
5356  0967 c45149        	and	a,20809
5357  096a c75149        	ld	20809,a
5358                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5360  096d 7b02          	ld	a,(OFST+2,sp)
5361  096f a401          	and	a,#1
5362  0971 43            	cpl	a
5363  0972 c4516c        	and	a,20844
5364  0975 c7516c        	ld	20844,a
5365  0978               L7732:
5366                     ; 2082   RTC->WPR = 0xFF; 
5368  0978 35ff5159      	mov	20825,#255
5369                     ; 2083 }
5372  097c 85            	popw	x
5373  097d 81            	ret
5543                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5543                     ; 2091 {
5544                     	switch	.text
5545  097e               _RTC_GetFlagStatus:
5547  097e 89            	pushw	x
5548  097f 5203          	subw	sp,#3
5549       00000003      OFST:	set	3
5552                     ; 2092   FlagStatus flagstatus = RESET;
5554  0981 7b01          	ld	a,(OFST-2,sp)
5555  0983 97            	ld	xl,a
5556                     ; 2093   uint16_t tmpreg1 = 0;
5558  0984 1e02          	ldw	x,(OFST-1,sp)
5559                     ; 2094   uint16_t tmpreg2 = 0;
5561  0986 1e02          	ldw	x,(OFST-1,sp)
5562                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5564                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5566  0988 c6514c        	ld	a,20812
5567  098b 5f            	clrw	x
5568  098c 97            	ld	xl,a
5569  098d 4f            	clr	a
5570  098e 02            	rlwa	x,a
5571  098f 1f02          	ldw	(OFST-1,sp),x
5572                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5574  0991 c6514d        	ld	a,20813
5575  0994 5f            	clrw	x
5576  0995 97            	ld	xl,a
5577  0996 01            	rrwa	x,a
5578  0997 1a03          	or	a,(OFST+0,sp)
5579  0999 01            	rrwa	x,a
5580  099a 1a02          	or	a,(OFST-1,sp)
5581  099c 01            	rrwa	x,a
5582  099d 1f02          	ldw	(OFST-1,sp),x
5583                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5585  099f 1e02          	ldw	x,(OFST-1,sp)
5586  09a1 01            	rrwa	x,a
5587  09a2 1405          	and	a,(OFST+2,sp)
5588  09a4 01            	rrwa	x,a
5589  09a5 1404          	and	a,(OFST+1,sp)
5590  09a7 01            	rrwa	x,a
5591  09a8 a30000        	cpw	x,#0
5592  09ab 2706          	jreq	L3742
5593                     ; 2106     flagstatus = SET;
5595  09ad a601          	ld	a,#1
5596  09af 6b01          	ld	(OFST-2,sp),a
5598  09b1 2002          	jra	L5742
5599  09b3               L3742:
5600                     ; 2110     flagstatus = RESET;
5602  09b3 0f01          	clr	(OFST-2,sp)
5603  09b5               L5742:
5604                     ; 2112   return (FlagStatus)flagstatus;
5606  09b5 7b01          	ld	a,(OFST-2,sp)
5609  09b7 5b05          	addw	sp,#5
5610  09b9 81            	ret
5645                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5645                     ; 2123 {
5646                     	switch	.text
5647  09ba               _RTC_ClearFlag:
5649  09ba 89            	pushw	x
5650       00000000      OFST:	set	0
5653                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5655                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5657  09bb 9f            	ld	a,xl
5658  09bc 43            	cpl	a
5659  09bd c7514d        	ld	20813,a
5660                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5662  09c0 7b01          	ld	a,(OFST+1,sp)
5663  09c2 43            	cpl	a
5664  09c3 a47f          	and	a,#127
5665  09c5 c7514c        	ld	20812,a
5666                     ; 2130 }
5669  09c8 85            	popw	x
5670  09c9 81            	ret
5730                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5730                     ; 2139 {
5731                     	switch	.text
5732  09ca               _RTC_GetITStatus:
5734  09ca 89            	pushw	x
5735  09cb 89            	pushw	x
5736       00000002      OFST:	set	2
5739                     ; 2140   ITStatus itstatus = RESET;
5741  09cc 7b02          	ld	a,(OFST+0,sp)
5742  09ce 97            	ld	xl,a
5743                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5745  09cf 7b01          	ld	a,(OFST-1,sp)
5746  09d1 97            	ld	xl,a
5749  09d2 7b02          	ld	a,(OFST+0,sp)
5750  09d4 97            	ld	xl,a
5751                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5753                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5755  09d5 c65149        	ld	a,20809
5756  09d8 1404          	and	a,(OFST+2,sp)
5757  09da 6b01          	ld	(OFST-1,sp),a
5758                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5760  09dc 1e03          	ldw	x,(OFST+1,sp)
5761  09de 54            	srlw	x
5762  09df 54            	srlw	x
5763  09e0 54            	srlw	x
5764  09e1 54            	srlw	x
5765  09e2 9f            	ld	a,xl
5766  09e3 c4514d        	and	a,20813
5767  09e6 6b02          	ld	(OFST+0,sp),a
5768                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5770  09e8 0d01          	tnz	(OFST-1,sp)
5771  09ea 270a          	jreq	L3452
5773  09ec 0d02          	tnz	(OFST+0,sp)
5774  09ee 2706          	jreq	L3452
5775                     ; 2155     itstatus = SET;
5777  09f0 a601          	ld	a,#1
5778  09f2 6b02          	ld	(OFST+0,sp),a
5780  09f4 2002          	jra	L5452
5781  09f6               L3452:
5782                     ; 2159     itstatus = RESET;
5784  09f6 0f02          	clr	(OFST+0,sp)
5785  09f8               L5452:
5786                     ; 2162   return (ITStatus)itstatus;
5788  09f8 7b02          	ld	a,(OFST+0,sp)
5791  09fa 5b04          	addw	sp,#4
5792  09fc 81            	ret
5828                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5828                     ; 2173 {
5829                     	switch	.text
5830  09fd               _RTC_ClearITPendingBit:
5834                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5836                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5838  09fd 54            	srlw	x
5839  09fe 54            	srlw	x
5840  09ff 54            	srlw	x
5841  0a00 54            	srlw	x
5842  0a01 9f            	ld	a,xl
5843  0a02 43            	cpl	a
5844  0a03 c7514d        	ld	20813,a
5845                     ; 2179 }
5848  0a06 81            	ret
5887                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5887                     ; 2203 {
5888                     	switch	.text
5889  0a07               L3_ByteToBcd2:
5891  0a07 88            	push	a
5892  0a08 88            	push	a
5893       00000001      OFST:	set	1
5896                     ; 2204   uint8_t bcdhigh = 0;
5898  0a09 0f01          	clr	(OFST+0,sp)
5900  0a0b 2008          	jra	L7062
5901  0a0d               L3062:
5902                     ; 2208     bcdhigh++;
5904  0a0d 0c01          	inc	(OFST+0,sp)
5905                     ; 2209     Value -= 10;
5907  0a0f 7b02          	ld	a,(OFST+1,sp)
5908  0a11 a00a          	sub	a,#10
5909  0a13 6b02          	ld	(OFST+1,sp),a
5910  0a15               L7062:
5911                     ; 2206   while (Value >= 10)
5913  0a15 7b02          	ld	a,(OFST+1,sp)
5914  0a17 a10a          	cp	a,#10
5915  0a19 24f2          	jruge	L3062
5916                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5918  0a1b 7b01          	ld	a,(OFST+0,sp)
5919  0a1d 97            	ld	xl,a
5920  0a1e a610          	ld	a,#16
5921  0a20 42            	mul	x,a
5922  0a21 9f            	ld	a,xl
5923  0a22 1a02          	or	a,(OFST+1,sp)
5926  0a24 85            	popw	x
5927  0a25 81            	ret
5966                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5966                     ; 2221 {
5967                     	switch	.text
5968  0a26               L5_Bcd2ToByte:
5970  0a26 88            	push	a
5971  0a27 88            	push	a
5972       00000001      OFST:	set	1
5975                     ; 2222   uint8_t tmp = 0;
5977  0a28 0f01          	clr	(OFST+0,sp)
5978                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5980  0a2a a4f0          	and	a,#240
5981  0a2c 4e            	swap	a
5982  0a2d a40f          	and	a,#15
5983  0a2f 97            	ld	xl,a
5984  0a30 a60a          	ld	a,#10
5985  0a32 42            	mul	x,a
5986  0a33 9f            	ld	a,xl
5987  0a34 6b01          	ld	(OFST+0,sp),a
5988                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5990  0a36 7b02          	ld	a,(OFST+1,sp)
5991  0a38 a40f          	and	a,#15
5992  0a3a 1b01          	add	a,(OFST+0,sp)
5995  0a3c 85            	popw	x
5996  0a3d 81            	ret
6009                     	xdef	_RTC_ClearITPendingBit
6010                     	xdef	_RTC_GetITStatus
6011                     	xdef	_RTC_ClearFlag
6012                     	xdef	_RTC_GetFlagStatus
6013                     	xdef	_RTC_ITConfig
6014                     	xdef	_RTC_TamperCmd
6015                     	xdef	_RTC_TamperPinsPrechargeDuration
6016                     	xdef	_RTC_TamperSamplingFreqConfig
6017                     	xdef	_RTC_TamperFilterConfig
6018                     	xdef	_RTC_TamperLevelConfig
6019                     	xdef	_RTC_CalibOutputCmd
6020                     	xdef	_RTC_CalibOutputConfig
6021                     	xdef	_RTC_SmoothCalibConfig
6022                     	xdef	_RTC_SynchroShiftConfig
6023                     	xdef	_RTC_OutputConfig
6024                     	xdef	_RTC_GetStoreOperation
6025                     	xdef	_RTC_DayLightSavingConfig
6026                     	xdef	_RTC_WakeUpCmd
6027                     	xdef	_RTC_GetWakeUpCounter
6028                     	xdef	_RTC_SetWakeUpCounter
6029                     	xdef	_RTC_WakeUpClockConfig
6030                     	xdef	_RTC_AlarmSubSecondConfig
6031                     	xdef	_RTC_AlarmCmd
6032                     	xdef	_RTC_GetAlarm
6033                     	xdef	_RTC_AlarmStructInit
6034                     	xdef	_RTC_SetAlarm
6035                     	xdef	_RTC_GetDate
6036                     	xdef	_RTC_DateStructInit
6037                     	xdef	_RTC_SetDate
6038                     	xdef	_RTC_GetSubSecond
6039                     	xdef	_RTC_GetTime
6040                     	xdef	_RTC_TimeStructInit
6041                     	xdef	_RTC_SetTime
6042                     	xdef	_RTC_BypassShadowCmd
6043                     	xdef	_RTC_RatioCmd
6044                     	xdef	_RTC_WaitForSynchro
6045                     	xdef	_RTC_ExitInitMode
6046                     	xdef	_RTC_EnterInitMode
6047                     	xdef	_RTC_WriteProtectionCmd
6048                     	xdef	_RTC_StructInit
6049                     	xdef	_RTC_Init
6050                     	xdef	_RTC_DeInit
6069                     	end
