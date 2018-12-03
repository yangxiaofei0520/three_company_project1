   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 123 void EXTI_DeInit(void)
  33                     ; 124 {
  35                     	switch	.text
  36  0000               _EXTI_DeInit:
  40                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  42  0000 725f50a0      	clr	20640
  43                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  45  0004 725f50a1      	clr	20641
  46                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  48  0008 725f50a2      	clr	20642
  49                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  51  000c 725f50aa      	clr	20650
  52                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  54  0010 35ff50a3      	mov	20643,#255
  55                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  57  0014 35ff50a4      	mov	20644,#255
  58                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  60  0018 725f50a5      	clr	20645
  61                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  63  001c 725f50ab      	clr	20651
  64                     ; 133 }
  67  0020 81            	ret	
 213                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 213                     ; 161 {
 214                     	switch	.text
 215  0021               _EXTI_SetPinSensitivity:
 217  0021 89            	pushw	x
 218       00000000      OFST:	set	0
 221                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 223                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 225                     ; 168   switch (EXTI_Pin)
 227  0022 9e            	ld	a,xh
 229                     ; 202     default:
 229                     ; 203       break;
 230  0023 4d            	tnz	a
 231  0024 2728          	jreq	L12
 232  0026 a002          	sub	a,#2
 233  0028 273b          	jreq	L32
 234  002a a002          	sub	a,#2
 235  002c 274e          	jreq	L52
 236  002e a002          	sub	a,#2
 237  0030 2761          	jreq	L72
 238  0032 a00a          	sub	a,#10
 239  0034 277a          	jreq	L13
 240  0036 a002          	sub	a,#2
 241  0038 2603cc00c7    	jreq	L33
 242  003d a002          	sub	a,#2
 243  003f 2603cc00de    	jreq	L53
 244  0044 a002          	sub	a,#2
 245  0046 2603cc00f5    	jreq	L73
 246  004b cc0110        	jra	L721
 247  004e               L12:
 248                     ; 170     case EXTI_Pin_0:
 248                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 250  004e c650a0        	ld	a,20640
 251  0051 a4fc          	and	a,#252
 252  0053 c750a0        	ld	20640,a
 253                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 255  0056 7b01          	ld	a,(OFST+1,sp)
 256  0058 5f            	clrw	x
 257  0059 97            	ld	xl,a
 258  005a 7b02          	ld	a,(OFST+2,sp)
 259  005c 5d            	tnzw	x
 260  005d 2749          	jreq	L42
 261  005f               L21:
 262  005f 48            	sll	a
 263  0060 5a            	decw	x
 264  0061 26fc          	jrne	L21
 265                     ; 173       break;
 267  0063 2043          	jp	L42
 268  0065               L32:
 269                     ; 174     case EXTI_Pin_1:
 269                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 271  0065 c650a0        	ld	a,20640
 272  0068 a4f3          	and	a,#243
 273  006a c750a0        	ld	20640,a
 274                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 276  006d 7b01          	ld	a,(OFST+1,sp)
 277  006f 5f            	clrw	x
 278  0070 97            	ld	xl,a
 279  0071 7b02          	ld	a,(OFST+2,sp)
 280  0073 5d            	tnzw	x
 281  0074 2732          	jreq	L42
 282  0076               L61:
 283  0076 48            	sll	a
 284  0077 5a            	decw	x
 285  0078 26fc          	jrne	L61
 286                     ; 177       break;
 288  007a 202c          	jp	L42
 289  007c               L52:
 290                     ; 178     case EXTI_Pin_2:
 290                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 292  007c c650a0        	ld	a,20640
 293  007f a4cf          	and	a,#207
 294  0081 c750a0        	ld	20640,a
 295                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 297  0084 7b01          	ld	a,(OFST+1,sp)
 298  0086 5f            	clrw	x
 299  0087 97            	ld	xl,a
 300  0088 7b02          	ld	a,(OFST+2,sp)
 301  008a 5d            	tnzw	x
 302  008b 271b          	jreq	L42
 303  008d               L22:
 304  008d 48            	sll	a
 305  008e 5a            	decw	x
 306  008f 26fc          	jrne	L22
 307                     ; 181       break;
 309  0091 2015          	jp	L42
 310  0093               L72:
 311                     ; 182     case EXTI_Pin_3:
 311                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 313  0093 c650a0        	ld	a,20640
 314  0096 a43f          	and	a,#63
 315  0098 c750a0        	ld	20640,a
 316                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 318  009b 7b01          	ld	a,(OFST+1,sp)
 319  009d 5f            	clrw	x
 320  009e 97            	ld	xl,a
 321  009f 7b02          	ld	a,(OFST+2,sp)
 322  00a1 5d            	tnzw	x
 323  00a2 2704          	jreq	L42
 324  00a4               L62:
 325  00a4 48            	sll	a
 326  00a5 5a            	decw	x
 327  00a6 26fc          	jrne	L62
 328  00a8               L42:
 329  00a8 ca50a0        	or	a,20640
 330  00ab c750a0        	ld	20640,a
 331                     ; 185       break;
 333  00ae 2060          	jra	L721
 334  00b0               L13:
 335                     ; 186     case EXTI_Pin_4:
 335                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 337  00b0 c650a1        	ld	a,20641
 338  00b3 a4fc          	and	a,#252
 339  00b5 c750a1        	ld	20641,a
 340                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 342  00b8 7b01          	ld	a,(OFST+1,sp)
 343  00ba ad56          	call	LC003
 344  00bc 7b02          	ld	a,(OFST+2,sp)
 345  00be 5d            	tnzw	x
 346  00bf 2749          	jreq	L44
 347  00c1               L23:
 348  00c1 48            	sll	a
 349  00c2 5a            	decw	x
 350  00c3 26fc          	jrne	L23
 351                     ; 189       break;
 353  00c5 2043          	jp	L44
 354  00c7               L33:
 355                     ; 190     case EXTI_Pin_5:
 355                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 357  00c7 c650a1        	ld	a,20641
 358  00ca a4f3          	and	a,#243
 359  00cc c750a1        	ld	20641,a
 360                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 362  00cf 7b01          	ld	a,(OFST+1,sp)
 363  00d1 ad3f          	call	LC003
 364  00d3 7b02          	ld	a,(OFST+2,sp)
 365  00d5 5d            	tnzw	x
 366  00d6 2732          	jreq	L44
 367  00d8               L63:
 368  00d8 48            	sll	a
 369  00d9 5a            	decw	x
 370  00da 26fc          	jrne	L63
 371                     ; 193       break;
 373  00dc 202c          	jp	L44
 374  00de               L53:
 375                     ; 194     case EXTI_Pin_6:
 375                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 377  00de c650a1        	ld	a,20641
 378  00e1 a4cf          	and	a,#207
 379  00e3 c750a1        	ld	20641,a
 380                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 382  00e6 7b01          	ld	a,(OFST+1,sp)
 383  00e8 ad28          	call	LC003
 384  00ea 7b02          	ld	a,(OFST+2,sp)
 385  00ec 5d            	tnzw	x
 386  00ed 271b          	jreq	L44
 387  00ef               L24:
 388  00ef 48            	sll	a
 389  00f0 5a            	decw	x
 390  00f1 26fc          	jrne	L24
 391                     ; 197       break;
 393  00f3 2015          	jp	L44
 394  00f5               L73:
 395                     ; 198     case EXTI_Pin_7:
 395                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 397  00f5 c650a1        	ld	a,20641
 398  00f8 a43f          	and	a,#63
 399  00fa c750a1        	ld	20641,a
 400                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 402  00fd 7b01          	ld	a,(OFST+1,sp)
 403  00ff ad11          	call	LC003
 404  0101 7b02          	ld	a,(OFST+2,sp)
 405  0103 5d            	tnzw	x
 406  0104 2704          	jreq	L44
 407  0106               L64:
 408  0106 48            	sll	a
 409  0107 5a            	decw	x
 410  0108 26fc          	jrne	L64
 411  010a               L44:
 412  010a ca50a1        	or	a,20641
 413  010d c750a1        	ld	20641,a
 414                     ; 201       break;
 416                     ; 202     default:
 416                     ; 203       break;
 418  0110               L721:
 419                     ; 205 }
 422  0110 85            	popw	x
 423  0111 81            	ret	
 425  0112               LC003:
 426  0112 a4ef          	and	a,#239
 427  0114 5f            	clrw	x
 428  0115 97            	ld	xl,a
 429  0116 81            	ret	
 511                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 511                     ; 220 {
 512                     	switch	.text
 513  0117               _EXTI_SelectPort:
 515  0117 88            	push	a
 516       00000000      OFST:	set	0
 519                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 521                     ; 224   if (EXTI_Port == EXTI_Port_B)
 523  0118 4d            	tnz	a
 524  0119 2606          	jrne	L761
 525                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 527  011b 721b50ab      	bres	20651,#5
 529  011f 202e          	jra	L171
 530  0121               L761:
 531                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 533  0121 7b01          	ld	a,(OFST+1,sp)
 534  0123 a102          	cp	a,#2
 535  0125 2606          	jrne	L371
 536                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 538  0127 721d50ab      	bres	20651,#6
 540  012b 2022          	jra	L171
 541  012d               L371:
 542                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 544  012d a104          	cp	a,#4
 545  012f 2606          	jrne	L771
 546                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 548  0131 721f50a5      	bres	20645,#7
 550  0135 2018          	jra	L171
 551  0137               L771:
 552                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 554  0137 a106          	cp	a,#6
 555  0139 2606          	jrne	L302
 556                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 558  013b 721e50a5      	bset	20645,#7
 560  013f 200e          	jra	L171
 561  0141               L302:
 562                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 564  0141 a110          	cp	a,#16
 565  0143 2606          	jrne	L702
 566                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 568  0145 721a50ab      	bset	20651,#5
 570  0149 2004          	jra	L171
 571  014b               L702:
 572                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 574  014b 721c50ab      	bset	20651,#6
 575  014f               L171:
 576                     ; 254 }
 579  014f 84            	pop	a
 580  0150 81            	ret	
 748                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 748                     ; 281                                FunctionalState NewState)
 748                     ; 282 {
 749                     	switch	.text
 750  0151               _EXTI_SetHalfPortSelection:
 752  0151 89            	pushw	x
 753       00000000      OFST:	set	0
 756                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 758                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 760                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 762  0152 9e            	ld	a,xh
 763  0153 a580          	bcp	a,#128
 764  0155 2616          	jrne	L103
 765                     ; 289     if (NewState != DISABLE)
 767  0157 7b02          	ld	a,(OFST+2,sp)
 768  0159 2707          	jreq	L303
 769                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 771  015b c650a5        	ld	a,20645
 772  015e 1a01          	or	a,(OFST+1,sp)
 774  0160 2006          	jp	LC005
 775  0162               L303:
 776                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 778  0162 7b01          	ld	a,(OFST+1,sp)
 779  0164 43            	cpl	a
 780  0165 c450a5        	and	a,20645
 781  0168               LC005:
 782  0168 c750a5        	ld	20645,a
 783  016b 2018          	jra	L703
 784  016d               L103:
 785                     ; 302     if (NewState != DISABLE)
 787  016d 7b02          	ld	a,(OFST+2,sp)
 788  016f 2709          	jreq	L113
 789                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 791  0171 7b01          	ld	a,(OFST+1,sp)
 792  0173 a47f          	and	a,#127
 793  0175 ca50ab        	or	a,20651
 795  0178 2008          	jp	LC004
 796  017a               L113:
 797                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 799  017a 7b01          	ld	a,(OFST+1,sp)
 800  017c a47f          	and	a,#127
 801  017e 43            	cpl	a
 802  017f c450ab        	and	a,20651
 803  0182               LC004:
 804  0182 c750ab        	ld	20651,a
 805  0185               L703:
 806                     ; 313 }
 809  0185 85            	popw	x
 810  0186 81            	ret	
 856                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 856                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 856                     ; 340 {
 857                     	switch	.text
 858  0187               _EXTI_SetPortSensitivity:
 860  0187 89            	pushw	x
 861       00000000      OFST:	set	0
 864                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 866                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 868                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 870  0188 9e            	ld	a,xh
 871  0189 a5f0          	bcp	a,#240
 872  018b 2629          	jrne	L733
 873                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 875  018d 7b01          	ld	a,(OFST+1,sp)
 876  018f 5f            	clrw	x
 877  0190 97            	ld	xl,a
 878  0191 a603          	ld	a,#3
 879  0193 5d            	tnzw	x
 880  0194 2704          	jreq	L65
 881  0196               L06:
 882  0196 48            	sll	a
 883  0197 5a            	decw	x
 884  0198 26fc          	jrne	L06
 885  019a               L65:
 886  019a 43            	cpl	a
 887  019b c450a2        	and	a,20642
 888  019e c750a2        	ld	20642,a
 889                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 891  01a1 7b01          	ld	a,(OFST+1,sp)
 892  01a3 5f            	clrw	x
 893  01a4 97            	ld	xl,a
 894  01a5 7b02          	ld	a,(OFST+2,sp)
 895  01a7 5d            	tnzw	x
 896  01a8 2704          	jreq	L26
 897  01aa               L46:
 898  01aa 48            	sll	a
 899  01ab 5a            	decw	x
 900  01ac 26fc          	jrne	L46
 901  01ae               L26:
 902  01ae ca50a2        	or	a,20642
 903  01b1 c750a2        	ld	20642,a
 905  01b4 202b          	jra	L143
 906  01b6               L733:
 907                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 909  01b6 7b01          	ld	a,(OFST+1,sp)
 910  01b8 a40f          	and	a,#15
 911  01ba 5f            	clrw	x
 912  01bb 97            	ld	xl,a
 913  01bc a603          	ld	a,#3
 914  01be 5d            	tnzw	x
 915  01bf 2704          	jreq	L66
 916  01c1               L07:
 917  01c1 48            	sll	a
 918  01c2 5a            	decw	x
 919  01c3 26fc          	jrne	L07
 920  01c5               L66:
 921  01c5 43            	cpl	a
 922  01c6 c450aa        	and	a,20650
 923  01c9 c750aa        	ld	20650,a
 924                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 926  01cc 7b01          	ld	a,(OFST+1,sp)
 927  01ce a40f          	and	a,#15
 928  01d0 5f            	clrw	x
 929  01d1 97            	ld	xl,a
 930  01d2 7b02          	ld	a,(OFST+2,sp)
 931  01d4 5d            	tnzw	x
 932  01d5 2704          	jreq	L27
 933  01d7               L47:
 934  01d7 48            	sll	a
 935  01d8 5a            	decw	x
 936  01d9 26fc          	jrne	L47
 937  01db               L27:
 938  01db ca50aa        	or	a,20650
 939  01de c750aa        	ld	20650,a
 940  01e1               L143:
 941                     ; 360 }
 944  01e1 85            	popw	x
 945  01e2 81            	ret	
 989                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
 989                     ; 377 {
 990                     	switch	.text
 991  01e3               _EXTI_GetPinSensitivity:
 993  01e3 88            	push	a
 994       00000001      OFST:	set	1
 997                     ; 378   uint8_t value = 0;
 999  01e4 0f01          	clr	(OFST+0,sp)
1000                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1002                     ; 383   switch (EXTI_Pin)
1005                     ; 409     default:
1005                     ; 410       break;
1006  01e6 4d            	tnz	a
1007  01e7 2720          	jreq	L343
1008  01e9 a002          	sub	a,#2
1009  01eb 2721          	jreq	L543
1010  01ed a002          	sub	a,#2
1011  01ef 2722          	jreq	L743
1012  01f1 a002          	sub	a,#2
1013  01f3 2724          	jreq	L153
1014  01f5 a00a          	sub	a,#10
1015  01f7 2725          	jreq	L353
1016  01f9 a002          	sub	a,#2
1017  01fb 2726          	jreq	L553
1018  01fd a002          	sub	a,#2
1019  01ff 272b          	jreq	L753
1020  0201 a002          	sub	a,#2
1021  0203 272d          	jreq	L163
1022  0205 7b01          	ld	a,(OFST+0,sp)
1023  0207 2033          	jra	LC006
1024  0209               L343:
1025                     ; 385     case EXTI_Pin_0:
1025                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1027  0209 c650a0        	ld	a,20640
1028                     ; 387       break;
1030  020c 202c          	jp	LC007
1031  020e               L543:
1032                     ; 388     case EXTI_Pin_1:
1032                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1034  020e c650a0        	ld	a,20640
1035                     ; 390       break;
1037  0211 2013          	jp	LC009
1038  0213               L743:
1039                     ; 391     case EXTI_Pin_2:
1039                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1041  0213 c650a0        	ld	a,20640
1042  0216 4e            	swap	a
1043                     ; 393       break;
1045  0217 2021          	jp	LC007
1046  0219               L153:
1047                     ; 394     case EXTI_Pin_3:
1047                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1049  0219 c650a0        	ld	a,20640
1050                     ; 396       break;
1052  021c 2017          	jp	LC008
1053  021e               L353:
1054                     ; 397     case EXTI_Pin_4:
1054                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1056  021e c650a1        	ld	a,20641
1057                     ; 399       break;
1059  0221 2017          	jp	LC007
1060  0223               L553:
1061                     ; 400     case EXTI_Pin_5:
1061                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1063  0223 c650a1        	ld	a,20641
1064  0226               LC009:
1065  0226 a40c          	and	a,#12
1066  0228 44            	srl	a
1067  0229 44            	srl	a
1068                     ; 402       break;
1070  022a 2010          	jp	LC006
1071  022c               L753:
1072                     ; 403     case EXTI_Pin_6:
1072                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1074  022c c650a1        	ld	a,20641
1075  022f 4e            	swap	a
1076                     ; 405       break;
1078  0230 2008          	jp	LC007
1079  0232               L163:
1080                     ; 406     case EXTI_Pin_7:
1080                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1082  0232 c650a1        	ld	a,20641
1083  0235               LC008:
1084  0235 4e            	swap	a
1085  0236 a40c          	and	a,#12
1086  0238 44            	srl	a
1087  0239 44            	srl	a
1088  023a               LC007:
1089  023a a403          	and	a,#3
1090  023c               LC006:
1091                     ; 408       break;
1093                     ; 409     default:
1093                     ; 410       break;
1095                     ; 412   return((EXTI_Trigger_TypeDef)value);
1099  023c 5b01          	addw	sp,#1
1100  023e 81            	ret	
1144                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1144                     ; 428 {
1145                     	switch	.text
1146  023f               _EXTI_GetPortSensitivity:
1148  023f 88            	push	a
1149  0240 88            	push	a
1150       00000001      OFST:	set	1
1153                     ; 429   uint8_t portsensitivity = 0;
1155  0241 0f01          	clr	(OFST+0,sp)
1156                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1158                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1160  0243 a5f0          	bcp	a,#240
1161  0245 2610          	jrne	L134
1162                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1164  0247 7b02          	ld	a,(OFST+1,sp)
1165  0249 5f            	clrw	x
1166  024a 97            	ld	xl,a
1167  024b c650a2        	ld	a,20642
1168  024e 5d            	tnzw	x
1169  024f 2716          	jreq	L601
1170  0251               L401:
1171  0251 44            	srl	a
1172  0252 5a            	decw	x
1173  0253 26fc          	jrne	L401
1175  0255 2010          	jra	L601
1176  0257               L134:
1177                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1179  0257 7b02          	ld	a,(OFST+1,sp)
1180  0259 a40f          	and	a,#15
1181  025b 5f            	clrw	x
1182  025c 97            	ld	xl,a
1183  025d c650aa        	ld	a,20650
1184  0260 5d            	tnzw	x
1185  0261 2704          	jreq	L601
1186  0263               L011:
1187  0263 44            	srl	a
1188  0264 5a            	decw	x
1189  0265 26fc          	jrne	L011
1190  0267               L601:
1191  0267 a403          	and	a,#3
1192                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1196  0269 85            	popw	x
1197  026a 81            	ret	
1367                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1367                     ; 488 {
1368                     	switch	.text
1369  026b               _EXTI_GetITStatus:
1371  026b 89            	pushw	x
1372  026c 88            	push	a
1373       00000001      OFST:	set	1
1376                     ; 489   ITStatus status = RESET;
1378  026d 0f01          	clr	(OFST+0,sp)
1379                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1381                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1383  026f 01            	rrwa	x,a
1384  0270 4f            	clr	a
1385  0271 02            	rlwa	x,a
1386  0272 a30100        	cpw	x,#256
1387  0275 2607          	jrne	L725
1388                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1390  0277 7b03          	ld	a,(OFST+2,sp)
1391  0279 c450a4        	and	a,20644
1393  027c 2005          	jra	L135
1394  027e               L725:
1395                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1397  027e 7b03          	ld	a,(OFST+2,sp)
1398  0280 c450a3        	and	a,20643
1399  0283               L135:
1400                     ; 501   return((ITStatus)status);
1404  0283 5b03          	addw	sp,#3
1405  0285 81            	ret	
1448                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1448                     ; 525 {
1449                     	switch	.text
1450  0286               _EXTI_ClearITPendingBit:
1452  0286 89            	pushw	x
1453  0287 89            	pushw	x
1454       00000002      OFST:	set	2
1457                     ; 526   uint16_t tempvalue = 0;
1459                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1461                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1463  0288 7b03          	ld	a,(OFST+1,sp)
1464  028a 97            	ld	xl,a
1465  028b 4f            	clr	a
1466  028c 02            	rlwa	x,a
1467  028d 1f01          	ldw	(OFST-1,sp),x
1468                     ; 533   if ( tempvalue == 0x0100)
1470  028f a30100        	cpw	x,#256
1471  0292 2607          	jrne	L355
1472                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1474  0294 7b04          	ld	a,(OFST+2,sp)
1475  0296 c750a4        	ld	20644,a
1477  0299 2005          	jra	L555
1478  029b               L355:
1479                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1481  029b 7b04          	ld	a,(OFST+2,sp)
1482  029d c750a3        	ld	20643,a
1483  02a0               L555:
1484                     ; 541 }
1487  02a0 5b04          	addw	sp,#4
1488  02a2 81            	ret	
1501                     	xdef	_EXTI_ClearITPendingBit
1502                     	xdef	_EXTI_GetITStatus
1503                     	xdef	_EXTI_GetPortSensitivity
1504                     	xdef	_EXTI_GetPinSensitivity
1505                     	xdef	_EXTI_SetPortSensitivity
1506                     	xdef	_EXTI_SetHalfPortSelection
1507                     	xdef	_EXTI_SelectPort
1508                     	xdef	_EXTI_SetPinSensitivity
1509                     	xdef	_EXTI_DeInit
1528                     	end
