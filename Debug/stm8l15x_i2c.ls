   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 188                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 188                     ; 142 {
 190                     	switch	.text
 191  0000               _I2C_DeInit:
 195                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 197  0000 7f            	clr	(x)
 198                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 200  0001 6f01          	clr	(1,x)
 201                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 203  0003 6f02          	clr	(2,x)
 204                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 206  0005 6f03          	clr	(3,x)
 207                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 209  0007 6f04          	clr	(4,x)
 210                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 212  0009 6f05          	clr	(5,x)
 213                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 215  000b 6f0a          	clr	(10,x)
 216                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 218  000d 6f0b          	clr	(11,x)
 219                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 221  000f 6f0c          	clr	(12,x)
 222                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 224  0011 a602          	ld	a,#2
 225  0013 e70d          	ld	(13,x),a
 226                     ; 153 }
 229  0015 81            	ret
 441                     .const:	section	.text
 442  0000               L01:
 443  0000 000f4240      	dc.l	1000000
 444  0004               L21:
 445  0004 000186a1      	dc.l	100001
 446  0008               L41:
 447  0008 00000004      	dc.l	4
 448                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 448                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 448                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 448                     ; 187 {
 449                     	switch	.text
 450  0016               _I2C_Init:
 452  0016 89            	pushw	x
 453  0017 520c          	subw	sp,#12
 454       0000000c      OFST:	set	12
 457                     ; 188   uint32_t result = 0x0004;
 459  0019 96            	ldw	x,sp
 460  001a 1c0009        	addw	x,#OFST-3
 461  001d cd0000        	call	c_ltor
 463                     ; 189   uint16_t tmpval = 0;
 465  0020 1e05          	ldw	x,(OFST-7,sp)
 466                     ; 190   uint8_t tmpccrh = 0;
 468  0022 0f07          	clr	(OFST-5,sp)
 469                     ; 191   uint8_t input_clock = 0;
 471  0024 7b08          	ld	a,(OFST-4,sp)
 472  0026 97            	ld	xl,a
 473                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 475                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 477                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 479                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 481                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 483                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 485                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 487  0027 cd0000        	call	_CLK_GetClockFreq
 489  002a ae0000        	ldw	x,#L01
 490  002d cd0000        	call	c_ludv
 492  0030 b603          	ld	a,c_lreg+3
 493  0032 6b08          	ld	(OFST-4,sp),a
 494                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 496  0034 1e0d          	ldw	x,(OFST+1,sp)
 497  0036 e602          	ld	a,(2,x)
 498  0038 a4c0          	and	a,#192
 499  003a e702          	ld	(2,x),a
 500                     ; 209   I2Cx->FREQR |= input_clock;
 502  003c 1e0d          	ldw	x,(OFST+1,sp)
 503  003e e602          	ld	a,(2,x)
 504  0040 1a08          	or	a,(OFST-4,sp)
 505  0042 e702          	ld	(2,x),a
 506                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 508  0044 1e0d          	ldw	x,(OFST+1,sp)
 509  0046 f6            	ld	a,(x)
 510  0047 a4fe          	and	a,#254
 511  0049 f7            	ld	(x),a
 512                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 514  004a 1e0d          	ldw	x,(OFST+1,sp)
 515  004c e60c          	ld	a,(12,x)
 516  004e a430          	and	a,#48
 517  0050 e70c          	ld	(12,x),a
 518                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 520  0052 1e0d          	ldw	x,(OFST+1,sp)
 521  0054 6f0b          	clr	(11,x)
 522                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 524  0056 96            	ldw	x,sp
 525  0057 1c0011        	addw	x,#OFST+5
 526  005a cd0000        	call	c_ltor
 528  005d ae0004        	ldw	x,#L21
 529  0060 cd0000        	call	c_lcmp
 531  0063 2403          	jruge	L02
 532  0065 cc0103        	jp	L742
 533  0068               L02:
 534                     ; 223     tmpccrh = I2C_CCRH_FS;
 536  0068 a680          	ld	a,#128
 537  006a 6b07          	ld	(OFST-5,sp),a
 538                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 540  006c 0d18          	tnz	(OFST+12,sp)
 541  006e 2633          	jrne	L152
 542                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 544  0070 96            	ldw	x,sp
 545  0071 1c0011        	addw	x,#OFST+5
 546  0074 cd0000        	call	c_ltor
 548  0077 a603          	ld	a,#3
 549  0079 cd0000        	call	c_smul
 551  007c 96            	ldw	x,sp
 552  007d 1c0001        	addw	x,#OFST-11
 553  0080 cd0000        	call	c_rtol
 555  0083 7b08          	ld	a,(OFST-4,sp)
 556  0085 b703          	ld	c_lreg+3,a
 557  0087 3f02          	clr	c_lreg+2
 558  0089 3f01          	clr	c_lreg+1
 559  008b 3f00          	clr	c_lreg
 560  008d ae0000        	ldw	x,#L01
 561  0090 cd0000        	call	c_lmul
 563  0093 96            	ldw	x,sp
 564  0094 1c0001        	addw	x,#OFST-11
 565  0097 cd0000        	call	c_ludv
 567  009a 96            	ldw	x,sp
 568  009b 1c0009        	addw	x,#OFST-3
 569  009e cd0000        	call	c_rtol
 572  00a1 2037          	jra	L352
 573  00a3               L152:
 574                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 576  00a3 96            	ldw	x,sp
 577  00a4 1c0011        	addw	x,#OFST+5
 578  00a7 cd0000        	call	c_ltor
 580  00aa a619          	ld	a,#25
 581  00ac cd0000        	call	c_smul
 583  00af 96            	ldw	x,sp
 584  00b0 1c0001        	addw	x,#OFST-11
 585  00b3 cd0000        	call	c_rtol
 587  00b6 7b08          	ld	a,(OFST-4,sp)
 588  00b8 b703          	ld	c_lreg+3,a
 589  00ba 3f02          	clr	c_lreg+2
 590  00bc 3f01          	clr	c_lreg+1
 591  00be 3f00          	clr	c_lreg
 592  00c0 ae0000        	ldw	x,#L01
 593  00c3 cd0000        	call	c_lmul
 595  00c6 96            	ldw	x,sp
 596  00c7 1c0001        	addw	x,#OFST-11
 597  00ca cd0000        	call	c_ludv
 599  00cd 96            	ldw	x,sp
 600  00ce 1c0009        	addw	x,#OFST-3
 601  00d1 cd0000        	call	c_rtol
 603                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 605  00d4 7b07          	ld	a,(OFST-5,sp)
 606  00d6 aa40          	or	a,#64
 607  00d8 6b07          	ld	(OFST-5,sp),a
 608  00da               L352:
 609                     ; 239     if (result < (uint16_t)0x01)
 611  00da 96            	ldw	x,sp
 612  00db 1c0009        	addw	x,#OFST-3
 613  00de cd0000        	call	c_lzmp
 615  00e1 260a          	jrne	L552
 616                     ; 242       result = (uint16_t)0x0001;
 618  00e3 ae0001        	ldw	x,#1
 619  00e6 1f0b          	ldw	(OFST-1,sp),x
 620  00e8 ae0000        	ldw	x,#0
 621  00eb 1f09          	ldw	(OFST-3,sp),x
 622  00ed               L552:
 623                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 625  00ed 7b08          	ld	a,(OFST-4,sp)
 626  00ef 97            	ld	xl,a
 627  00f0 a603          	ld	a,#3
 628  00f2 42            	mul	x,a
 629  00f3 a60a          	ld	a,#10
 630  00f5 cd0000        	call	c_sdivx
 632  00f8 5c            	incw	x
 633  00f9 1f05          	ldw	(OFST-7,sp),x
 634                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 636  00fb 7b06          	ld	a,(OFST-6,sp)
 637  00fd 1e0d          	ldw	x,(OFST+1,sp)
 638  00ff e70d          	ld	(13,x),a
 640  0101 2059          	jra	L752
 641  0103               L742:
 642                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 644  0103 96            	ldw	x,sp
 645  0104 1c0011        	addw	x,#OFST+5
 646  0107 cd0000        	call	c_ltor
 648  010a 3803          	sll	c_lreg+3
 649  010c 3902          	rlc	c_lreg+2
 650  010e 3901          	rlc	c_lreg+1
 651  0110 3900          	rlc	c_lreg
 652  0112 96            	ldw	x,sp
 653  0113 1c0001        	addw	x,#OFST-11
 654  0116 cd0000        	call	c_rtol
 656  0119 7b08          	ld	a,(OFST-4,sp)
 657  011b b703          	ld	c_lreg+3,a
 658  011d 3f02          	clr	c_lreg+2
 659  011f 3f01          	clr	c_lreg+1
 660  0121 3f00          	clr	c_lreg
 661  0123 ae0000        	ldw	x,#L01
 662  0126 cd0000        	call	c_lmul
 664  0129 96            	ldw	x,sp
 665  012a 1c0001        	addw	x,#OFST-11
 666  012d cd0000        	call	c_ludv
 668  0130 be02          	ldw	x,c_lreg+2
 669  0132 cd0000        	call	c_uitolx
 671  0135 96            	ldw	x,sp
 672  0136 1c0009        	addw	x,#OFST-3
 673  0139 cd0000        	call	c_rtol
 675                     ; 259     if (result < (uint16_t)0x0004)
 677  013c 96            	ldw	x,sp
 678  013d 1c0009        	addw	x,#OFST-3
 679  0140 cd0000        	call	c_ltor
 681  0143 ae0008        	ldw	x,#L41
 682  0146 cd0000        	call	c_lcmp
 684  0149 240a          	jruge	L162
 685                     ; 262       result = (uint16_t)0x0004;
 687  014b ae0004        	ldw	x,#4
 688  014e 1f0b          	ldw	(OFST-1,sp),x
 689  0150 ae0000        	ldw	x,#0
 690  0153 1f09          	ldw	(OFST-3,sp),x
 691  0155               L162:
 692                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 694  0155 7b08          	ld	a,(OFST-4,sp)
 695  0157 4c            	inc	a
 696  0158 1e0d          	ldw	x,(OFST+1,sp)
 697  015a e70d          	ld	(13,x),a
 698  015c               L752:
 699                     ; 273   I2Cx->CCRL = (uint8_t)result;
 701  015c 7b0c          	ld	a,(OFST+0,sp)
 702  015e 1e0d          	ldw	x,(OFST+1,sp)
 703  0160 e70b          	ld	(11,x),a
 704                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 706  0162 7b07          	ld	a,(OFST-5,sp)
 707  0164 1e0d          	ldw	x,(OFST+1,sp)
 708  0166 e70c          	ld	(12,x),a
 709                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 711  0168 1e0d          	ldw	x,(OFST+1,sp)
 712  016a 7b17          	ld	a,(OFST+11,sp)
 713  016c aa01          	or	a,#1
 714  016e fa            	or	a,(x)
 715  016f f7            	ld	(x),a
 716                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 718  0170 1e0d          	ldw	x,(OFST+1,sp)
 719  0172 e601          	ld	a,(1,x)
 720  0174 1a19          	or	a,(OFST+13,sp)
 721  0176 e701          	ld	(1,x),a
 722                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 724  0178 7b16          	ld	a,(OFST+10,sp)
 725  017a 1e0d          	ldw	x,(OFST+1,sp)
 726  017c e703          	ld	(3,x),a
 727                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 727                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 729  017e 7b15          	ld	a,(OFST+9,sp)
 730  0180 97            	ld	xl,a
 731  0181 7b16          	ld	a,(OFST+10,sp)
 732  0183 9f            	ld	a,xl
 733  0184 a403          	and	a,#3
 734  0186 97            	ld	xl,a
 735  0187 4f            	clr	a
 736  0188 02            	rlwa	x,a
 737  0189 a607          	ld	a,#7
 738  018b               L61:
 739  018b 54            	srlw	x
 740  018c 4a            	dec	a
 741  018d 26fc          	jrne	L61
 742  018f 9f            	ld	a,xl
 743  0190 6b04          	ld	(OFST-8,sp),a
 744  0192 7b1a          	ld	a,(OFST+14,sp)
 745  0194 aa40          	or	a,#64
 746  0196 1a04          	or	a,(OFST-8,sp)
 747  0198 1e0d          	ldw	x,(OFST+1,sp)
 748  019a e704          	ld	(4,x),a
 749                     ; 286 }
 752  019c 5b0e          	addw	sp,#14
 753  019e 81            	ret
 820                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 820                     ; 296 {
 821                     	switch	.text
 822  019f               _I2C_Cmd:
 824  019f 89            	pushw	x
 825       00000000      OFST:	set	0
 828                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 830                     ; 301   if (NewState != DISABLE)
 832  01a0 0d05          	tnz	(OFST+5,sp)
 833  01a2 2706          	jreq	L713
 834                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 836  01a4 f6            	ld	a,(x)
 837  01a5 aa01          	or	a,#1
 838  01a7 f7            	ld	(x),a
 840  01a8 2006          	jra	L123
 841  01aa               L713:
 842                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 844  01aa 1e01          	ldw	x,(OFST+1,sp)
 845  01ac f6            	ld	a,(x)
 846  01ad a4fe          	and	a,#254
 847  01af f7            	ld	(x),a
 848  01b0               L123:
 849                     ; 311 }
 852  01b0 85            	popw	x
 853  01b1 81            	ret
 900                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 900                     ; 321 {
 901                     	switch	.text
 902  01b2               _I2C_GeneralCallCmd:
 904  01b2 89            	pushw	x
 905       00000000      OFST:	set	0
 908                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 910                     ; 326   if (NewState != DISABLE)
 912  01b3 0d05          	tnz	(OFST+5,sp)
 913  01b5 2706          	jreq	L743
 914                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 916  01b7 f6            	ld	a,(x)
 917  01b8 aa40          	or	a,#64
 918  01ba f7            	ld	(x),a
 920  01bb 2006          	jra	L153
 921  01bd               L743:
 922                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 924  01bd 1e01          	ldw	x,(OFST+1,sp)
 925  01bf f6            	ld	a,(x)
 926  01c0 a4bf          	and	a,#191
 927  01c2 f7            	ld	(x),a
 928  01c3               L153:
 929                     ; 336 }
 932  01c3 85            	popw	x
 933  01c4 81            	ret
 980                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 980                     ; 348 {
 981                     	switch	.text
 982  01c5               _I2C_GenerateSTART:
 984  01c5 89            	pushw	x
 985       00000000      OFST:	set	0
 988                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 990                     ; 353   if (NewState != DISABLE)
 992  01c6 0d05          	tnz	(OFST+5,sp)
 993  01c8 2708          	jreq	L773
 994                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
 996  01ca e601          	ld	a,(1,x)
 997  01cc aa01          	or	a,#1
 998  01ce e701          	ld	(1,x),a
1000  01d0 2008          	jra	L104
1001  01d2               L773:
1002                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1004  01d2 1e01          	ldw	x,(OFST+1,sp)
1005  01d4 e601          	ld	a,(1,x)
1006  01d6 a4fe          	and	a,#254
1007  01d8 e701          	ld	(1,x),a
1008  01da               L104:
1009                     ; 363 }
1012  01da 85            	popw	x
1013  01db 81            	ret
1060                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1060                     ; 373 {
1061                     	switch	.text
1062  01dc               _I2C_GenerateSTOP:
1064  01dc 89            	pushw	x
1065       00000000      OFST:	set	0
1068                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1070                     ; 378   if (NewState != DISABLE)
1072  01dd 0d05          	tnz	(OFST+5,sp)
1073  01df 2708          	jreq	L724
1074                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1076  01e1 e601          	ld	a,(1,x)
1077  01e3 aa02          	or	a,#2
1078  01e5 e701          	ld	(1,x),a
1080  01e7 2008          	jra	L134
1081  01e9               L724:
1082                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1084  01e9 1e01          	ldw	x,(OFST+1,sp)
1085  01eb e601          	ld	a,(1,x)
1086  01ed a4fd          	and	a,#253
1087  01ef e701          	ld	(1,x),a
1088  01f1               L134:
1089                     ; 388 }
1092  01f1 85            	popw	x
1093  01f2 81            	ret
1141                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1141                     ; 398 {
1142                     	switch	.text
1143  01f3               _I2C_SoftwareResetCmd:
1145  01f3 89            	pushw	x
1146       00000000      OFST:	set	0
1149                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1151                     ; 402   if (NewState != DISABLE)
1153  01f4 0d05          	tnz	(OFST+5,sp)
1154  01f6 2708          	jreq	L754
1155                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1157  01f8 e601          	ld	a,(1,x)
1158  01fa aa80          	or	a,#128
1159  01fc e701          	ld	(1,x),a
1161  01fe 2008          	jra	L164
1162  0200               L754:
1163                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1165  0200 1e01          	ldw	x,(OFST+1,sp)
1166  0202 e601          	ld	a,(1,x)
1167  0204 a47f          	and	a,#127
1168  0206 e701          	ld	(1,x),a
1169  0208               L164:
1170                     ; 412 }
1173  0208 85            	popw	x
1174  0209 81            	ret
1222                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1222                     ; 422 {
1223                     	switch	.text
1224  020a               _I2C_StretchClockCmd:
1226  020a 89            	pushw	x
1227       00000000      OFST:	set	0
1230                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1232                     ; 426   if (NewState != DISABLE)
1234  020b 0d05          	tnz	(OFST+5,sp)
1235  020d 2706          	jreq	L705
1236                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1238  020f f6            	ld	a,(x)
1239  0210 a47f          	and	a,#127
1240  0212 f7            	ld	(x),a
1242  0213 2006          	jra	L115
1243  0215               L705:
1244                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1246  0215 1e01          	ldw	x,(OFST+1,sp)
1247  0217 f6            	ld	a,(x)
1248  0218 aa80          	or	a,#128
1249  021a f7            	ld	(x),a
1250  021b               L115:
1251                     ; 437 }
1254  021b 85            	popw	x
1255  021c 81            	ret
1302                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1302                     ; 447 {
1303                     	switch	.text
1304  021d               _I2C_ARPCmd:
1306  021d 89            	pushw	x
1307       00000000      OFST:	set	0
1310                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1312                     ; 451   if (NewState != DISABLE)
1314  021e 0d05          	tnz	(OFST+5,sp)
1315  0220 2706          	jreq	L735
1316                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1318  0222 f6            	ld	a,(x)
1319  0223 aa10          	or	a,#16
1320  0225 f7            	ld	(x),a
1322  0226 2006          	jra	L145
1323  0228               L735:
1324                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1326  0228 1e01          	ldw	x,(OFST+1,sp)
1327  022a f6            	ld	a,(x)
1328  022b a4ef          	and	a,#239
1329  022d f7            	ld	(x),a
1330  022e               L145:
1331                     ; 462 }
1334  022e 85            	popw	x
1335  022f 81            	ret
1383                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1383                     ; 472 {
1384                     	switch	.text
1385  0230               _I2C_AcknowledgeConfig:
1387  0230 89            	pushw	x
1388       00000000      OFST:	set	0
1391                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1393                     ; 476   if (NewState != DISABLE)
1395  0231 0d05          	tnz	(OFST+5,sp)
1396  0233 2708          	jreq	L765
1397                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1399  0235 e601          	ld	a,(1,x)
1400  0237 aa04          	or	a,#4
1401  0239 e701          	ld	(1,x),a
1403  023b 2008          	jra	L175
1404  023d               L765:
1405                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1407  023d 1e01          	ldw	x,(OFST+1,sp)
1408  023f e601          	ld	a,(1,x)
1409  0241 a4fb          	and	a,#251
1410  0243 e701          	ld	(1,x),a
1411  0245               L175:
1412                     ; 486 }
1415  0245 85            	popw	x
1416  0246 81            	ret
1468                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1468                     ; 495 {
1469                     	switch	.text
1470  0247               _I2C_OwnAddress2Config:
1472  0247 89            	pushw	x
1473  0248 88            	push	a
1474       00000001      OFST:	set	1
1477                     ; 496   uint8_t tmpreg = 0;
1479  0249 0f01          	clr	(OFST+0,sp)
1480                     ; 499   tmpreg = I2Cx->OAR2;
1482  024b e605          	ld	a,(5,x)
1483  024d 6b01          	ld	(OFST+0,sp),a
1484                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1486  024f 7b01          	ld	a,(OFST+0,sp)
1487  0251 a401          	and	a,#1
1488  0253 6b01          	ld	(OFST+0,sp),a
1489                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1491  0255 7b06          	ld	a,(OFST+5,sp)
1492  0257 a4fe          	and	a,#254
1493  0259 1a01          	or	a,(OFST+0,sp)
1494  025b 6b01          	ld	(OFST+0,sp),a
1495                     ; 508   I2Cx->OAR2 = tmpreg;
1497  025d 7b01          	ld	a,(OFST+0,sp)
1498  025f 1e02          	ldw	x,(OFST+1,sp)
1499  0261 e705          	ld	(5,x),a
1500                     ; 509 }
1503  0263 5b03          	addw	sp,#3
1504  0265 81            	ret
1551                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1551                     ; 519 {
1552                     	switch	.text
1553  0266               _I2C_DualAddressCmd:
1555  0266 89            	pushw	x
1556       00000000      OFST:	set	0
1559                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1561                     ; 523   if (NewState != DISABLE)
1563  0267 0d05          	tnz	(OFST+5,sp)
1564  0269 2708          	jreq	L346
1565                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1567  026b e605          	ld	a,(5,x)
1568  026d aa01          	or	a,#1
1569  026f e705          	ld	(5,x),a
1571  0271 2008          	jra	L546
1572  0273               L346:
1573                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1575  0273 1e01          	ldw	x,(OFST+1,sp)
1576  0275 e605          	ld	a,(5,x)
1577  0277 a4fe          	and	a,#254
1578  0279 e705          	ld	(5,x),a
1579  027b               L546:
1580                     ; 533 }
1583  027b 85            	popw	x
1584  027c 81            	ret
1654                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1654                     ; 546 {
1655                     	switch	.text
1656  027d               _I2C_AckPositionConfig:
1658  027d 89            	pushw	x
1659       00000000      OFST:	set	0
1662                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1664                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1666  027e e601          	ld	a,(1,x)
1667  0280 a4f7          	and	a,#247
1668  0282 e701          	ld	(1,x),a
1669                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1671  0284 e601          	ld	a,(1,x)
1672  0286 1a05          	or	a,(OFST+5,sp)
1673  0288 e701          	ld	(1,x),a
1674                     ; 554 }
1677  028a 85            	popw	x
1678  028b 81            	ret
1747                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1747                     ; 566 {
1748                     	switch	.text
1749  028c               _I2C_SMBusAlertConfig:
1751  028c 89            	pushw	x
1752       00000000      OFST:	set	0
1755                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1757                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1759  028d 0d05          	tnz	(OFST+5,sp)
1760  028f 2708          	jreq	L737
1761                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1763  0291 e601          	ld	a,(1,x)
1764  0293 aa20          	or	a,#32
1765  0295 e701          	ld	(1,x),a
1767  0297 2008          	jra	L147
1768  0299               L737:
1769                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1771  0299 1e01          	ldw	x,(OFST+1,sp)
1772  029b e601          	ld	a,(1,x)
1773  029d a4df          	and	a,#223
1774  029f e701          	ld	(1,x),a
1775  02a1               L147:
1776                     ; 581 }
1779  02a1 85            	popw	x
1780  02a2 81            	ret
1828                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1828                     ; 593 {
1829                     	switch	.text
1830  02a3               _I2C_FastModeDutyCycleConfig:
1832  02a3 89            	pushw	x
1833       00000000      OFST:	set	0
1836                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1838                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1840  02a4 7b05          	ld	a,(OFST+5,sp)
1841  02a6 a140          	cp	a,#64
1842  02a8 2608          	jrne	L767
1843                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1845  02aa e60c          	ld	a,(12,x)
1846  02ac aa40          	or	a,#64
1847  02ae e70c          	ld	(12,x),a
1849  02b0 2008          	jra	L177
1850  02b2               L767:
1851                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1853  02b2 1e01          	ldw	x,(OFST+1,sp)
1854  02b4 e60c          	ld	a,(12,x)
1855  02b6 a4bf          	and	a,#191
1856  02b8 e70c          	ld	(12,x),a
1857  02ba               L177:
1858                     ; 608 }
1861  02ba 85            	popw	x
1862  02bb 81            	ret
1939                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1939                     ; 622 {
1940                     	switch	.text
1941  02bc               _I2C_Send7bitAddress:
1943  02bc 89            	pushw	x
1944       00000000      OFST:	set	0
1947                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1949                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1951                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1953  02bd 0d06          	tnz	(OFST+6,sp)
1954  02bf 2708          	jreq	L1301
1955                     ; 631     Address |= OAR1_ADD0_Set;
1957  02c1 7b05          	ld	a,(OFST+5,sp)
1958  02c3 aa01          	or	a,#1
1959  02c5 6b05          	ld	(OFST+5,sp),a
1961  02c7 2006          	jra	L3301
1962  02c9               L1301:
1963                     ; 636     Address &= OAR1_ADD0_Reset;
1965  02c9 7b05          	ld	a,(OFST+5,sp)
1966  02cb a4fe          	and	a,#254
1967  02cd 6b05          	ld	(OFST+5,sp),a
1968  02cf               L3301:
1969                     ; 639   I2Cx->DR = Address;
1971  02cf 7b05          	ld	a,(OFST+5,sp)
1972  02d1 1e01          	ldw	x,(OFST+1,sp)
1973  02d3 e706          	ld	(6,x),a
1974                     ; 640 }
1977  02d5 85            	popw	x
1978  02d6 81            	ret
2022                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2022                     ; 665 {
2023                     	switch	.text
2024  02d7               _I2C_SendData:
2026  02d7 89            	pushw	x
2027       00000000      OFST:	set	0
2030                     ; 667   I2Cx->DR = Data;
2032  02d8 7b05          	ld	a,(OFST+5,sp)
2033  02da 1e01          	ldw	x,(OFST+1,sp)
2034  02dc e706          	ld	(6,x),a
2035                     ; 668 }
2038  02de 85            	popw	x
2039  02df 81            	ret
2076                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2076                     ; 677 {
2077                     	switch	.text
2078  02e0               _I2C_ReceiveData:
2082                     ; 679   return ((uint8_t)I2Cx->DR);
2084  02e0 e606          	ld	a,(6,x)
2087  02e2 81            	ret
2134                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2134                     ; 706 {
2135                     	switch	.text
2136  02e3               _I2C_TransmitPEC:
2138  02e3 89            	pushw	x
2139       00000000      OFST:	set	0
2142                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2144                     ; 710   if (NewState != DISABLE)
2146  02e4 0d05          	tnz	(OFST+5,sp)
2147  02e6 2708          	jreq	L3211
2148                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2150  02e8 e601          	ld	a,(1,x)
2151  02ea aa10          	or	a,#16
2152  02ec e701          	ld	(1,x),a
2154  02ee 2008          	jra	L5211
2155  02f0               L3211:
2156                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2158  02f0 1e01          	ldw	x,(OFST+1,sp)
2159  02f2 e601          	ld	a,(1,x)
2160  02f4 a4ef          	and	a,#239
2161  02f6 e701          	ld	(1,x),a
2162  02f8               L5211:
2163                     ; 720 }
2166  02f8 85            	popw	x
2167  02f9 81            	ret
2214                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2214                     ; 730 {
2215                     	switch	.text
2216  02fa               _I2C_CalculatePEC:
2218  02fa 89            	pushw	x
2219       00000000      OFST:	set	0
2222                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2224                     ; 734   if (NewState != DISABLE)
2226  02fb 0d05          	tnz	(OFST+5,sp)
2227  02fd 2706          	jreq	L3511
2228                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2230  02ff f6            	ld	a,(x)
2231  0300 aa20          	or	a,#32
2232  0302 f7            	ld	(x),a
2234  0303 2006          	jra	L5511
2235  0305               L3511:
2236                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2238  0305 1e01          	ldw	x,(OFST+1,sp)
2239  0307 f6            	ld	a,(x)
2240  0308 a4df          	and	a,#223
2241  030a f7            	ld	(x),a
2242  030b               L5511:
2243                     ; 744 }
2246  030b 85            	popw	x
2247  030c 81            	ret
2317                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2317                     ; 756 {
2318                     	switch	.text
2319  030d               _I2C_PECPositionConfig:
2321  030d 89            	pushw	x
2322       00000000      OFST:	set	0
2325                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2327                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2329  030e e601          	ld	a,(1,x)
2330  0310 a4f7          	and	a,#247
2331  0312 e701          	ld	(1,x),a
2332                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2334  0314 e601          	ld	a,(1,x)
2335  0316 1a05          	or	a,(OFST+5,sp)
2336  0318 e701          	ld	(1,x),a
2337                     ; 764 }
2340  031a 85            	popw	x
2341  031b 81            	ret
2378                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2378                     ; 773 {
2379                     	switch	.text
2380  031c               _I2C_GetPEC:
2384                     ; 775   return (I2Cx->PECR);
2386  031c e60e          	ld	a,(14,x)
2389  031e 81            	ret
2436                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2436                     ; 804 {
2437                     	switch	.text
2438  031f               _I2C_DMACmd:
2440  031f 89            	pushw	x
2441       00000000      OFST:	set	0
2444                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2446                     ; 808   if (NewState != DISABLE)
2448  0320 0d05          	tnz	(OFST+5,sp)
2449  0322 2708          	jreq	L7521
2450                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2452  0324 e60a          	ld	a,(10,x)
2453  0326 aa08          	or	a,#8
2454  0328 e70a          	ld	(10,x),a
2456  032a 2008          	jra	L1621
2457  032c               L7521:
2458                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2460  032c 1e01          	ldw	x,(OFST+1,sp)
2461  032e e60a          	ld	a,(10,x)
2462  0330 a4f7          	and	a,#247
2463  0332 e70a          	ld	(10,x),a
2464  0334               L1621:
2465                     ; 818 }
2468  0334 85            	popw	x
2469  0335 81            	ret
2517                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2517                     ; 828 {
2518                     	switch	.text
2519  0336               _I2C_DMALastTransferCmd:
2521  0336 89            	pushw	x
2522       00000000      OFST:	set	0
2525                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2527                     ; 832   if (NewState != DISABLE)
2529  0337 0d05          	tnz	(OFST+5,sp)
2530  0339 2708          	jreq	L7031
2531                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2533  033b e60a          	ld	a,(10,x)
2534  033d aa10          	or	a,#16
2535  033f e70a          	ld	(10,x),a
2537  0341 2008          	jra	L1131
2538  0343               L7031:
2539                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2541  0343 1e01          	ldw	x,(OFST+1,sp)
2542  0345 e60a          	ld	a,(10,x)
2543  0347 a4ef          	and	a,#239
2544  0349 e70a          	ld	(10,x),a
2545  034b               L1131:
2546                     ; 842 }
2549  034b 85            	popw	x
2550  034c 81            	ret
2739                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2739                     ; 955 {
2740                     	switch	.text
2741  034d               _I2C_ITConfig:
2743  034d 89            	pushw	x
2744       00000000      OFST:	set	0
2747                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2749                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2751                     ; 960   if (NewState != DISABLE)
2753  034e 0d07          	tnz	(OFST+7,sp)
2754  0350 2708          	jreq	L3141
2755                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2757  0352 e60a          	ld	a,(10,x)
2758  0354 1a06          	or	a,(OFST+6,sp)
2759  0356 e70a          	ld	(10,x),a
2761  0358 2009          	jra	L5141
2762  035a               L3141:
2763                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2765  035a 1e01          	ldw	x,(OFST+1,sp)
2766  035c 7b06          	ld	a,(OFST+6,sp)
2767  035e 43            	cpl	a
2768  035f e40a          	and	a,(10,x)
2769  0361 e70a          	ld	(10,x),a
2770  0363               L5141:
2771                     ; 970 }
2774  0363 85            	popw	x
2775  0364 81            	ret
2936                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2936                     ; 995 {
2937                     	switch	.text
2938  0365               _I2C_ReadRegister:
2940  0365 89            	pushw	x
2941  0366 5204          	subw	sp,#4
2942       00000004      OFST:	set	4
2945                     ; 996   __IO uint16_t tmp = 0;
2947  0368 5f            	clrw	x
2948  0369 1f03          	ldw	(OFST-1,sp),x
2949                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2951                     ; 1000   tmp = (uint16_t) I2Cx;
2953  036b 1e05          	ldw	x,(OFST+1,sp)
2954  036d 1f03          	ldw	(OFST-1,sp),x
2955                     ; 1001   tmp += I2C_Register;
2957  036f 7b09          	ld	a,(OFST+5,sp)
2958  0371 5f            	clrw	x
2959  0372 97            	ld	xl,a
2960  0373 1f01          	ldw	(OFST-3,sp),x
2961  0375 1e03          	ldw	x,(OFST-1,sp)
2962  0377 72fb01        	addw	x,(OFST-3,sp)
2963  037a 1f03          	ldw	(OFST-1,sp),x
2964                     ; 1004   return (*(__IO uint8_t *) tmp);
2966  037c 1e03          	ldw	x,(OFST-1,sp)
2967  037e f6            	ld	a,(x)
2970  037f 5b06          	addw	sp,#6
2971  0381 81            	ret
3221                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3221                     ; 1045 {
3222                     	switch	.text
3223  0382               _I2C_CheckEvent:
3225  0382 89            	pushw	x
3226  0383 5206          	subw	sp,#6
3227       00000006      OFST:	set	6
3230                     ; 1046   __IO uint16_t lastevent = 0x00;
3232  0385 5f            	clrw	x
3233  0386 1f04          	ldw	(OFST-2,sp),x
3234                     ; 1047   uint8_t flag1 = 0x00 ;
3236  0388 7b03          	ld	a,(OFST-3,sp)
3237  038a 97            	ld	xl,a
3238                     ; 1048   uint8_t flag2 = 0x00;
3240  038b 7b06          	ld	a,(OFST+0,sp)
3241  038d 97            	ld	xl,a
3242                     ; 1049   ErrorStatus status = ERROR;
3244  038e 7b06          	ld	a,(OFST+0,sp)
3245  0390 97            	ld	xl,a
3246                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3248                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3250  0391 1e0b          	ldw	x,(OFST+5,sp)
3251  0393 a30004        	cpw	x,#4
3252  0396 260c          	jrne	L5261
3253                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3255  0398 1e07          	ldw	x,(OFST+1,sp)
3256  039a e608          	ld	a,(8,x)
3257  039c a404          	and	a,#4
3258  039e 5f            	clrw	x
3259  039f 97            	ld	xl,a
3260  03a0 1f04          	ldw	(OFST-2,sp),x
3262  03a2 2021          	jra	L7261
3263  03a4               L5261:
3264                     ; 1060     flag1 = I2Cx->SR1;
3266  03a4 1e07          	ldw	x,(OFST+1,sp)
3267  03a6 e607          	ld	a,(7,x)
3268  03a8 6b03          	ld	(OFST-3,sp),a
3269                     ; 1061     flag2 = I2Cx->SR3;
3271  03aa 1e07          	ldw	x,(OFST+1,sp)
3272  03ac e609          	ld	a,(9,x)
3273  03ae 6b06          	ld	(OFST+0,sp),a
3274                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3276  03b0 7b03          	ld	a,(OFST-3,sp)
3277  03b2 5f            	clrw	x
3278  03b3 97            	ld	xl,a
3279  03b4 1f01          	ldw	(OFST-5,sp),x
3280  03b6 7b06          	ld	a,(OFST+0,sp)
3281  03b8 5f            	clrw	x
3282  03b9 97            	ld	xl,a
3283  03ba 4f            	clr	a
3284  03bb 02            	rlwa	x,a
3285  03bc 01            	rrwa	x,a
3286  03bd 1a02          	or	a,(OFST-4,sp)
3287  03bf 01            	rrwa	x,a
3288  03c0 1a01          	or	a,(OFST-5,sp)
3289  03c2 01            	rrwa	x,a
3290  03c3 1f04          	ldw	(OFST-2,sp),x
3291  03c5               L7261:
3292                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3294  03c5 1e04          	ldw	x,(OFST-2,sp)
3295  03c7 01            	rrwa	x,a
3296  03c8 140c          	and	a,(OFST+6,sp)
3297  03ca 01            	rrwa	x,a
3298  03cb 140b          	and	a,(OFST+5,sp)
3299  03cd 01            	rrwa	x,a
3300  03ce 130b          	cpw	x,(OFST+5,sp)
3301  03d0 2606          	jrne	L1361
3302                     ; 1068     status = SUCCESS;
3304  03d2 a601          	ld	a,#1
3305  03d4 6b06          	ld	(OFST+0,sp),a
3307  03d6 2002          	jra	L3361
3308  03d8               L1361:
3309                     ; 1073     status = ERROR;
3311  03d8 0f06          	clr	(OFST+0,sp)
3312  03da               L3361:
3313                     ; 1077   return status;
3315  03da 7b06          	ld	a,(OFST+0,sp)
3318  03dc 5b08          	addw	sp,#8
3319  03de 81            	ret
3380                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3380                     ; 1096 {
3381                     	switch	.text
3382  03df               _I2C_GetLastEvent:
3384  03df 89            	pushw	x
3385  03e0 5206          	subw	sp,#6
3386       00000006      OFST:	set	6
3389                     ; 1097   __IO uint16_t lastevent = 0;
3391  03e2 5f            	clrw	x
3392  03e3 1f05          	ldw	(OFST-1,sp),x
3393                     ; 1098   uint16_t flag1 = 0;
3395  03e5 1e01          	ldw	x,(OFST-5,sp)
3396                     ; 1099   uint16_t flag2 = 0;
3398  03e7 1e03          	ldw	x,(OFST-3,sp)
3399                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3401  03e9 1e07          	ldw	x,(OFST+1,sp)
3402  03eb e608          	ld	a,(8,x)
3403  03ed a504          	bcp	a,#4
3404  03ef 2707          	jreq	L5661
3405                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3407  03f1 ae0004        	ldw	x,#4
3408  03f4 1f05          	ldw	(OFST-1,sp),x
3410  03f6 201d          	jra	L7661
3411  03f8               L5661:
3412                     ; 1108     flag1 = I2Cx->SR1;
3414  03f8 1e07          	ldw	x,(OFST+1,sp)
3415  03fa e607          	ld	a,(7,x)
3416  03fc 5f            	clrw	x
3417  03fd 97            	ld	xl,a
3418  03fe 1f01          	ldw	(OFST-5,sp),x
3419                     ; 1109     flag2 = I2Cx->SR3;
3421  0400 1e07          	ldw	x,(OFST+1,sp)
3422  0402 e609          	ld	a,(9,x)
3423  0404 5f            	clrw	x
3424  0405 97            	ld	xl,a
3425  0406 1f03          	ldw	(OFST-3,sp),x
3426                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3428  0408 1e03          	ldw	x,(OFST-3,sp)
3429  040a 4f            	clr	a
3430  040b 02            	rlwa	x,a
3431  040c 01            	rrwa	x,a
3432  040d 1a02          	or	a,(OFST-4,sp)
3433  040f 01            	rrwa	x,a
3434  0410 1a01          	or	a,(OFST-5,sp)
3435  0412 01            	rrwa	x,a
3436  0413 1f05          	ldw	(OFST-1,sp),x
3437  0415               L7661:
3438                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3440  0415 1e05          	ldw	x,(OFST-1,sp)
3443  0417 5b08          	addw	sp,#8
3444  0419 81            	ret
3697                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3697                     ; 1153 {
3698                     	switch	.text
3699  041a               _I2C_GetFlagStatus:
3701  041a 89            	pushw	x
3702  041b 89            	pushw	x
3703       00000002      OFST:	set	2
3706                     ; 1154   uint8_t tempreg = 0;
3708  041c 0f02          	clr	(OFST+0,sp)
3709                     ; 1155   uint8_t regindex = 0;
3711  041e 7b01          	ld	a,(OFST-1,sp)
3712  0420 97            	ld	xl,a
3713                     ; 1156   FlagStatus bitstatus = RESET;
3715  0421 7b02          	ld	a,(OFST+0,sp)
3716  0423 97            	ld	xl,a
3717                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3719                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3721  0424 7b07          	ld	a,(OFST+5,sp)
3722  0426 6b01          	ld	(OFST-1,sp),a
3723                     ; 1164   switch (regindex)
3725  0428 7b01          	ld	a,(OFST-1,sp)
3727                     ; 1181     default:
3727                     ; 1182       break;
3728  042a 4a            	dec	a
3729  042b 2708          	jreq	L1761
3730  042d 4a            	dec	a
3731  042e 270d          	jreq	L3761
3732  0430 4a            	dec	a
3733  0431 2712          	jreq	L5761
3734  0433 2016          	jra	L7202
3735  0435               L1761:
3736                     ; 1167     case 0x01:
3736                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3738  0435 1e03          	ldw	x,(OFST+1,sp)
3739  0437 e607          	ld	a,(7,x)
3740  0439 6b02          	ld	(OFST+0,sp),a
3741                     ; 1169       break;
3743  043b 200e          	jra	L7202
3744  043d               L3761:
3745                     ; 1172     case 0x02:
3745                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3747  043d 1e03          	ldw	x,(OFST+1,sp)
3748  043f e608          	ld	a,(8,x)
3749  0441 6b02          	ld	(OFST+0,sp),a
3750                     ; 1174       break;
3752  0443 2006          	jra	L7202
3753  0445               L5761:
3754                     ; 1177     case 0x03:
3754                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3756  0445 1e03          	ldw	x,(OFST+1,sp)
3757  0447 e609          	ld	a,(9,x)
3758  0449 6b02          	ld	(OFST+0,sp),a
3759                     ; 1179       break;
3761  044b               L7761:
3762                     ; 1181     default:
3762                     ; 1182       break;
3764  044b               L7202:
3765                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3767  044b 7b08          	ld	a,(OFST+6,sp)
3768  044d 1502          	bcp	a,(OFST+0,sp)
3769  044f 2706          	jreq	L1302
3770                     ; 1189     bitstatus = SET;
3772  0451 a601          	ld	a,#1
3773  0453 6b02          	ld	(OFST+0,sp),a
3775  0455 2002          	jra	L3302
3776  0457               L1302:
3777                     ; 1194     bitstatus = RESET;
3779  0457 0f02          	clr	(OFST+0,sp)
3780  0459               L3302:
3781                     ; 1197   return bitstatus;
3783  0459 7b02          	ld	a,(OFST+0,sp)
3786  045b 5b04          	addw	sp,#4
3787  045d 81            	ret
3841                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3841                     ; 1230 {
3842                     	switch	.text
3843  045e               _I2C_ClearFlag:
3845  045e 89            	pushw	x
3846  045f 89            	pushw	x
3847       00000002      OFST:	set	2
3850                     ; 1231   uint16_t flagpos = 0;
3852  0460 5f            	clrw	x
3853  0461 1f01          	ldw	(OFST-1,sp),x
3854                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3856                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3858  0463 7b07          	ld	a,(OFST+5,sp)
3859  0465 97            	ld	xl,a
3860  0466 7b08          	ld	a,(OFST+6,sp)
3861  0468 a4ff          	and	a,#255
3862  046a 5f            	clrw	x
3863  046b 02            	rlwa	x,a
3864  046c 1f01          	ldw	(OFST-1,sp),x
3865  046e 01            	rrwa	x,a
3866                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3868  046f 7b02          	ld	a,(OFST+0,sp)
3869  0471 43            	cpl	a
3870  0472 1e03          	ldw	x,(OFST+1,sp)
3871  0474 e708          	ld	(8,x),a
3872                     ; 1239 }
3875  0476 5b04          	addw	sp,#4
3876  0478 81            	ret
3950                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3950                     ; 1265 {
3951                     	switch	.text
3952  0479               _I2C_GetITStatus:
3954  0479 89            	pushw	x
3955  047a 5204          	subw	sp,#4
3956       00000004      OFST:	set	4
3959                     ; 1266   ITStatus bitstatus = RESET;
3961  047c 7b04          	ld	a,(OFST+0,sp)
3962  047e 97            	ld	xl,a
3963                     ; 1267   __IO uint8_t enablestatus = 0;
3965  047f 0f03          	clr	(OFST-1,sp)
3966                     ; 1268   uint16_t tempregister = 0;
3968  0481 1e01          	ldw	x,(OFST-3,sp)
3969                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3971                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3973  0483 7b09          	ld	a,(OFST+5,sp)
3974  0485 97            	ld	xl,a
3975  0486 7b0a          	ld	a,(OFST+6,sp)
3976  0488 9f            	ld	a,xl
3977  0489 a407          	and	a,#7
3978  048b 97            	ld	xl,a
3979  048c 4f            	clr	a
3980  048d 02            	rlwa	x,a
3981  048e 4f            	clr	a
3982  048f 01            	rrwa	x,a
3983  0490 9f            	ld	a,xl
3984  0491 5f            	clrw	x
3985  0492 97            	ld	xl,a
3986  0493 1f01          	ldw	(OFST-3,sp),x
3987                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3989  0495 1e05          	ldw	x,(OFST+1,sp)
3990  0497 e60a          	ld	a,(10,x)
3991  0499 1402          	and	a,(OFST-2,sp)
3992  049b 6b03          	ld	(OFST-1,sp),a
3993                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3995  049d 7b09          	ld	a,(OFST+5,sp)
3996  049f 97            	ld	xl,a
3997  04a0 7b0a          	ld	a,(OFST+6,sp)
3998  04a2 9f            	ld	a,xl
3999  04a3 a430          	and	a,#48
4000  04a5 97            	ld	xl,a
4001  04a6 4f            	clr	a
4002  04a7 02            	rlwa	x,a
4003  04a8 a30100        	cpw	x,#256
4004  04ab 2616          	jrne	L1212
4005                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4007  04ad 1e05          	ldw	x,(OFST+1,sp)
4008  04af e607          	ld	a,(7,x)
4009  04b1 150a          	bcp	a,(OFST+6,sp)
4010  04b3 270a          	jreq	L3212
4012  04b5 0d03          	tnz	(OFST-1,sp)
4013  04b7 2706          	jreq	L3212
4014                     ; 1284       bitstatus = SET;
4016  04b9 a601          	ld	a,#1
4017  04bb 6b04          	ld	(OFST+0,sp),a
4019  04bd 2018          	jra	L7212
4020  04bf               L3212:
4021                     ; 1289       bitstatus = RESET;
4023  04bf 0f04          	clr	(OFST+0,sp)
4024  04c1 2014          	jra	L7212
4025  04c3               L1212:
4026                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4028  04c3 1e05          	ldw	x,(OFST+1,sp)
4029  04c5 e608          	ld	a,(8,x)
4030  04c7 150a          	bcp	a,(OFST+6,sp)
4031  04c9 270a          	jreq	L1312
4033  04cb 0d03          	tnz	(OFST-1,sp)
4034  04cd 2706          	jreq	L1312
4035                     ; 1298       bitstatus = SET;
4037  04cf a601          	ld	a,#1
4038  04d1 6b04          	ld	(OFST+0,sp),a
4040  04d3 2002          	jra	L7212
4041  04d5               L1312:
4042                     ; 1303       bitstatus = RESET;
4044  04d5 0f04          	clr	(OFST+0,sp)
4045  04d7               L7212:
4046                     ; 1307   return  bitstatus;
4048  04d7 7b04          	ld	a,(OFST+0,sp)
4051  04d9 5b06          	addw	sp,#6
4052  04db 81            	ret
4107                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4107                     ; 1341 {
4108                     	switch	.text
4109  04dc               _I2C_ClearITPendingBit:
4111  04dc 89            	pushw	x
4112  04dd 89            	pushw	x
4113       00000002      OFST:	set	2
4116                     ; 1342   uint16_t flagpos = 0;
4118  04de 5f            	clrw	x
4119  04df 1f01          	ldw	(OFST-1,sp),x
4120                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4122                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4124  04e1 7b07          	ld	a,(OFST+5,sp)
4125  04e3 97            	ld	xl,a
4126  04e4 7b08          	ld	a,(OFST+6,sp)
4127  04e6 a4ff          	and	a,#255
4128  04e8 5f            	clrw	x
4129  04e9 02            	rlwa	x,a
4130  04ea 1f01          	ldw	(OFST-1,sp),x
4131  04ec 01            	rrwa	x,a
4132                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4134  04ed 7b02          	ld	a,(OFST+0,sp)
4135  04ef 43            	cpl	a
4136  04f0 1e03          	ldw	x,(OFST+1,sp)
4137  04f2 e708          	ld	(8,x),a
4138                     ; 1352 }
4141  04f4 5b04          	addw	sp,#4
4142  04f6 81            	ret
4155                     	xdef	_I2C_ClearITPendingBit
4156                     	xdef	_I2C_GetITStatus
4157                     	xdef	_I2C_ClearFlag
4158                     	xdef	_I2C_GetFlagStatus
4159                     	xdef	_I2C_GetLastEvent
4160                     	xdef	_I2C_CheckEvent
4161                     	xdef	_I2C_ReadRegister
4162                     	xdef	_I2C_ITConfig
4163                     	xdef	_I2C_DMALastTransferCmd
4164                     	xdef	_I2C_DMACmd
4165                     	xdef	_I2C_CalculatePEC
4166                     	xdef	_I2C_TransmitPEC
4167                     	xdef	_I2C_GetPEC
4168                     	xdef	_I2C_PECPositionConfig
4169                     	xdef	_I2C_ReceiveData
4170                     	xdef	_I2C_SendData
4171                     	xdef	_I2C_Send7bitAddress
4172                     	xdef	_I2C_SMBusAlertConfig
4173                     	xdef	_I2C_FastModeDutyCycleConfig
4174                     	xdef	_I2C_AckPositionConfig
4175                     	xdef	_I2C_DualAddressCmd
4176                     	xdef	_I2C_OwnAddress2Config
4177                     	xdef	_I2C_AcknowledgeConfig
4178                     	xdef	_I2C_GenerateSTOP
4179                     	xdef	_I2C_GenerateSTART
4180                     	xdef	_I2C_ARPCmd
4181                     	xdef	_I2C_StretchClockCmd
4182                     	xdef	_I2C_SoftwareResetCmd
4183                     	xdef	_I2C_GeneralCallCmd
4184                     	xdef	_I2C_Cmd
4185                     	xdef	_I2C_Init
4186                     	xdef	_I2C_DeInit
4187                     	xref	_CLK_GetClockFreq
4188                     	xref.b	c_lreg
4207                     	xref	c_uitolx
4208                     	xref	c_sdivx
4209                     	xref	c_lzmp
4210                     	xref	c_rtol
4211                     	xref	c_smul
4212                     	xref	c_lmul
4213                     	xref	c_lcmp
4214                     	xref	c_ludv
4215                     	xref	c_ltor
4216                     	end
