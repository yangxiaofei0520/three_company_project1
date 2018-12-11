   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               _g_dwSysTick:
   7  0000 00000000      	dc.l	0
   8  0004               _g_wIwdgTick:
   9  0004 0000          	dc.w	0
  10  0006               _g_wIwdgTickExt:
  11  0006 0000          	dc.w	0
  12  0008               L3_nDebugFlg:
  13  0008 00            	dc.b	0
  14  0009               _m_nWorkMode:
  15  0009 00            	dc.b	0
  16  000a               _m_dwSecTick:
  17  000a 00000000      	dc.l	0
  18  000e               _m_dw500MsTick:
  19  000e 00000000      	dc.l	0
 472                     ; 108 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
 472                     ; 109 {
 474                     	switch	.text
 475  0000               _ADC_ChannelCmd:
 477  0000 89            	pushw	x
 478  0001 88            	push	a
 479       00000001      OFST:	set	1
 482                     ; 110   uint8_t regindex = 0;
 484  0002 0f01          	clr	(OFST+0,sp)
 485                     ; 112   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
 487  0004 7b06          	ld	a,(OFST+5,sp)
 488  0006 6b01          	ld	(OFST+0,sp),a
 489                     ; 114   if (NewState != DISABLE)
 491  0008 0d08          	tnz	(OFST+7,sp)
 492  000a 270d          	jreq	L152
 493                     ; 117     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
 495  000c 01            	rrwa	x,a
 496  000d 1b01          	add	a,(OFST+0,sp)
 497  000f 2401          	jrnc	L6
 498  0011 5c            	incw	x
 499  0012               L6:
 500  0012 02            	rlwa	x,a
 501  0013 e60a          	ld	a,(10,x)
 502  0015 1a07          	or	a,(OFST+6,sp)
 504  0017 2010          	jra	L352
 505  0019               L152:
 506                     ; 122     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
 508  0019 7b02          	ld	a,(OFST+1,sp)
 509  001b 97            	ld	xl,a
 510  001c 7b03          	ld	a,(OFST+2,sp)
 511  001e 1b01          	add	a,(OFST+0,sp)
 512  0020 2401          	jrnc	L01
 513  0022 5c            	incw	x
 514  0023               L01:
 515  0023 02            	rlwa	x,a
 516  0024 7b07          	ld	a,(OFST+6,sp)
 517  0026 43            	cpl	a
 518  0027 e40a          	and	a,(10,x)
 519  0029               L352:
 520  0029 e70a          	ld	(10,x),a
 521                     ; 124 }
 524  002b 5b03          	addw	sp,#3
 525  002d 81            	ret	
 557                     ; 135 void IWDG_Config(void)
 557                     ; 136 {
 558                     	switch	.text
 559  002e               _IWDG_Config:
 561  002e 88            	push	a
 562       00000001      OFST:	set	1
 565                     ; 137 	u8 nTemp = 0;
 567  002f 0f01          	clr	(OFST+0,sp)
 568                     ; 140   IWDG->KR = IWDG_KEY_ENABLE;
 570  0031 35cc50e0      	mov	20704,#204
 571                     ; 145   IWDG->KR = IWDG_WriteAccess_Enable; /* Write Access */
 573  0035 355550e0      	mov	20704,#85
 574                     ; 148   IWDG->PR = IWDG_Prescaler_256;
 576  0039 350650e1      	mov	20705,#6
 577                     ; 154   IWDG->RLR = RELOAD_VALUE;
 579  003d 35fe50e2      	mov	20706,#254
 580                     ; 157   IWDG->KR = IWDG_KEY_REFRESH;
 582  0041 35aa50e0      	mov	20704,#170
 583                     ; 158 }
 586  0045 84            	pop	a
 587  0046 81            	ret	
 901                     .const:	section	.text
 902  0000               L03:
 903  0000 007f          	dc.w	L172
 904  0002 007f          	dc.w	L172
 905  0004 007f          	dc.w	L172
 906  0006 0091          	dc.w	L372
 907  0008 0091          	dc.w	L372
 908  000a 0091          	dc.w	L372
 909  000c 0091          	dc.w	L372
 910  000e 00a3          	dc.w	L572
 911  0010 00a3          	dc.w	L572
 912  0012 00a3          	dc.w	L572
 913  0014 00a3          	dc.w	L572
 914  0016 00b5          	dc.w	L772
 915  0018 00b5          	dc.w	L772
 916  001a 00b5          	dc.w	L772
 917  001c 00b5          	dc.w	L772
 918  001e 00c7          	dc.w	L103
 919  0020 00c7          	dc.w	L103
 920  0022 00c7          	dc.w	L103
 921  0024 00c7          	dc.w	L103
 922  0026 00d9          	dc.w	L303
 923  0028 00d9          	dc.w	L303
 924  002a 00d9          	dc.w	L303
 925  002c 00d9          	dc.w	L303
 926  002e 00eb          	dc.w	L503
 927  0030 00eb          	dc.w	L503
 928  0032 00eb          	dc.w	L503
 929  0034 00eb          	dc.w	L503
 930  0036 00fd          	dc.w	L703
 931  0038 00fd          	dc.w	L703
 932                     ; 169 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 932                     ; 170 {
 933                     	switch	.text
 934  0047               _ITC_SetSoftwarePriority:
 936  0047 89            	pushw	x
 937  0048 89            	pushw	x
 938       00000002      OFST:	set	2
 941                     ; 171   uint8_t Mask = 0;
 943                     ; 172   uint8_t NewPriority = 0;
 945                     ; 175   assert_param(IS_ITC_IRQ(IRQn));
 947                     ; 176   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 949                     ; 179   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 951                     ; 183   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 953  0049 7b03          	ld	a,(OFST+1,sp)
 954  004b a403          	and	a,#3
 955  004d 48            	sll	a
 956  004e 5f            	clrw	x
 957  004f 97            	ld	xl,a
 958  0050 a603          	ld	a,#3
 959  0052 5d            	tnzw	x
 960  0053 2704          	jreq	L61
 961  0055               L02:
 962  0055 48            	sll	a
 963  0056 5a            	decw	x
 964  0057 26fc          	jrne	L02
 965  0059               L61:
 966  0059 43            	cpl	a
 967  005a 6b01          	ld	(OFST-1,sp),a
 968                     ; 185   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 970  005c 7b03          	ld	a,(OFST+1,sp)
 971  005e a403          	and	a,#3
 972  0060 48            	sll	a
 973  0061 5f            	clrw	x
 974  0062 97            	ld	xl,a
 975  0063 7b04          	ld	a,(OFST+2,sp)
 976  0065 5d            	tnzw	x
 977  0066 2704          	jreq	L22
 978  0068               L42:
 979  0068 48            	sll	a
 980  0069 5a            	decw	x
 981  006a 26fc          	jrne	L42
 982  006c               L22:
 983  006c 6b02          	ld	(OFST+0,sp),a
 984                     ; 187   switch (IRQn)
 986  006e 7b03          	ld	a,(OFST+1,sp)
 988                     ; 291     default:
 988                     ; 292       break;
 989  0070 4a            	dec	a
 990  0071 a11d          	cp	a,#29
 991  0073 2503cc010d    	jruge	L554
 992  0078 5f            	clrw	x
 993  0079 97            	ld	xl,a
 994  007a 58            	sllw	x
 995  007b de0000        	ldw	x,(L03,x)
 996  007e fc            	jp	(x)
 997  007f               L172:
 998                     ; 189     case FLASH_IRQn:
 998                     ; 190     case DMA1_CHANNEL0_1_IRQn:
 998                     ; 191     case DMA1_CHANNEL2_3_IRQn:
 998                     ; 192       ITC->ISPR1 &= Mask;
1000  007f c67f70        	ld	a,32624
1001  0082 1401          	and	a,(OFST-1,sp)
1002  0084 c77f70        	ld	32624,a
1003                     ; 193       ITC->ISPR1 |= NewPriority;
1005  0087 c67f70        	ld	a,32624
1006  008a 1a02          	or	a,(OFST+0,sp)
1007  008c c77f70        	ld	32624,a
1008                     ; 194       break;
1010  008f 207c          	jra	L554
1011  0091               L372:
1012                     ; 196     case EXTIE_F_PVD_IRQn:
1012                     ; 197 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
1012                     ; 198     case RTC_IRQn:
1012                     ; 199     case EXTIB_IRQn:
1012                     ; 200     case EXTID_IRQn:
1012                     ; 201 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
1012                     ; 202     case RTC_CSSLSE_IRQn:
1012                     ; 203     case EXTIB_IRQn:
1012                     ; 204     case EXTID_IRQn:
1012                     ; 205 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
1012                     ; 206     case RTC_CSSLSE_IRQn:
1012                     ; 207     case EXTIB_G_IRQn:
1012                     ; 208     case EXTID_H_IRQn:
1012                     ; 209 #endif  /* STM8L15X_MD */
1012                     ; 210       ITC->ISPR2 &= Mask;
1014  0091 c67f71        	ld	a,32625
1015  0094 1401          	and	a,(OFST-1,sp)
1016  0096 c77f71        	ld	32625,a
1017                     ; 211       ITC->ISPR2 |= NewPriority;
1019  0099 c67f71        	ld	a,32625
1020  009c 1a02          	or	a,(OFST+0,sp)
1021  009e c77f71        	ld	32625,a
1022                     ; 212       break;
1024  00a1 206a          	jra	L554
1025  00a3               L572:
1026                     ; 214     case EXTI0_IRQn:
1026                     ; 215     case EXTI1_IRQn:
1026                     ; 216     case EXTI2_IRQn:
1026                     ; 217     case EXTI3_IRQn:
1026                     ; 218       ITC->ISPR3 &= Mask;
1028  00a3 c67f72        	ld	a,32626
1029  00a6 1401          	and	a,(OFST-1,sp)
1030  00a8 c77f72        	ld	32626,a
1031                     ; 219       ITC->ISPR3 |= NewPriority;
1033  00ab c67f72        	ld	a,32626
1034  00ae 1a02          	or	a,(OFST+0,sp)
1035  00b0 c77f72        	ld	32626,a
1036                     ; 220       break;
1038  00b3 2058          	jra	L554
1039  00b5               L772:
1040                     ; 222     case EXTI4_IRQn:
1040                     ; 223     case EXTI5_IRQn:
1040                     ; 224     case EXTI6_IRQn:
1040                     ; 225     case EXTI7_IRQn:
1040                     ; 226       ITC->ISPR4 &= Mask;
1042  00b5 c67f73        	ld	a,32627
1043  00b8 1401          	and	a,(OFST-1,sp)
1044  00ba c77f73        	ld	32627,a
1045                     ; 227       ITC->ISPR4 |= NewPriority;
1047  00bd c67f73        	ld	a,32627
1048  00c0 1a02          	or	a,(OFST+0,sp)
1049  00c2 c77f73        	ld	32627,a
1050                     ; 228       break;
1052  00c5 2046          	jra	L554
1053  00c7               L103:
1054                     ; 230     case SWITCH_CSS_BREAK_DAC_IRQn:
1054                     ; 231 #else
1054                     ; 232     case SWITCH_CSS_IRQn:
1054                     ; 233 #endif /*	STM8L15X_LD	*/
1054                     ; 234     case ADC1_COMP_IRQn:
1054                     ; 235 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
1054                     ; 236     case LCD_IRQn:
1054                     ; 237     case TIM2_UPD_OVF_TRG_BRK_IRQn:
1054                     ; 238 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
1054                     ; 239     case TIM2_UPD_OVF_TRG_BRK_IRQn:
1054                     ; 240 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
1054                     ; 241     case LCD_AES_IRQn:
1054                     ; 242     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
1054                     ; 243 #endif  /* STM8L15X_MD */
1054                     ; 244       ITC->ISPR5 &= Mask;
1056  00c7 c67f74        	ld	a,32628
1057  00ca 1401          	and	a,(OFST-1,sp)
1058  00cc c77f74        	ld	32628,a
1059                     ; 245       ITC->ISPR5 |= NewPriority;
1061  00cf c67f74        	ld	a,32628
1062  00d2 1a02          	or	a,(OFST+0,sp)
1063  00d4 c77f74        	ld	32628,a
1064                     ; 246       break;
1066  00d7 2034          	jra	L554
1067  00d9               L303:
1068                     ; 248     case TIM1_UPD_OVF_TRG_IRQn:
1068                     ; 249 #endif  /* STM8L15X_LD */
1068                     ; 250 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
1068                     ; 251  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
1068                     ; 252     case TIM2_CC_IRQn:
1068                     ; 253     case TIM3_UPD_OVF_TRG_BRK_IRQn :
1068                     ; 254     case TIM3_CC_IRQn:
1068                     ; 255 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
1068                     ; 256     case TIM2_CC_USART2_RX_IRQn:
1068                     ; 257     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
1068                     ; 258     case TIM3_CC_USART3_RX_IRQn:
1068                     ; 259 #endif  /* STM8L15X_MD */
1068                     ; 260       ITC->ISPR6 &= Mask;
1070  00d9 c67f75        	ld	a,32629
1071  00dc 1401          	and	a,(OFST-1,sp)
1072  00de c77f75        	ld	32629,a
1073                     ; 261       ITC->ISPR6 |= NewPriority;
1075  00e1 c67f75        	ld	a,32629
1076  00e4 1a02          	or	a,(OFST+0,sp)
1077  00e6 c77f75        	ld	32629,a
1078                     ; 262       break;
1080  00e9 2022          	jra	L554
1081  00eb               L503:
1082                     ; 265     case TIM1_CC_IRQn:
1082                     ; 266 #endif  /* STM8L15X_LD */
1082                     ; 267     case TIM4_UPD_OVF_TRG_IRQn:
1082                     ; 268     case SPI1_IRQn:
1082                     ; 269 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
1082                     ; 270  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
1082                     ; 271     case USART1_TX_IRQn:
1082                     ; 272 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
1082                     ; 273     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
1082                     ; 274 #endif  /* STM8L15X_MD */
1082                     ; 275       ITC->ISPR7 &= Mask;
1084  00eb c67f76        	ld	a,32630
1085  00ee 1401          	and	a,(OFST-1,sp)
1086  00f0 c77f76        	ld	32630,a
1087                     ; 276       ITC->ISPR7 |= NewPriority;
1089  00f3 c67f76        	ld	a,32630
1090  00f6 1a02          	or	a,(OFST+0,sp)
1091  00f8 c77f76        	ld	32630,a
1092                     ; 277       break;
1094  00fb 2010          	jra	L554
1095  00fd               L703:
1096                     ; 281     case USART1_RX_IRQn:
1096                     ; 282     case I2C1_IRQn:
1096                     ; 283 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
1096                     ; 284     case USART1_RX_TIM5_CC_IRQn:
1096                     ; 285     case I2C1_SPI2_IRQn:
1096                     ; 286 #endif  /* STM8L15X_MD */
1096                     ; 287       ITC->ISPR8 &= Mask;
1098  00fd c67f77        	ld	a,32631
1099  0100 1401          	and	a,(OFST-1,sp)
1100  0102 c77f77        	ld	32631,a
1101                     ; 288       ITC->ISPR8 |= NewPriority;
1103  0105 c67f77        	ld	a,32631
1104  0108 1a02          	or	a,(OFST+0,sp)
1105  010a c77f77        	ld	32631,a
1106                     ; 289       break;
1108                     ; 291     default:
1108                     ; 292       break;
1110  010d               L554:
1111                     ; 294 }
1114  010d 5b04          	addw	sp,#4
1115  010f 81            	ret	
1139                     ; 305 void FeedSoftWareIwdg(void)
1139                     ; 306 {
1140                     	switch	.text
1141  0110               _FeedSoftWareIwdg:
1145                     ; 307 	g_wIwdgTick = 0;
1147  0110 5f            	clrw	x
1148  0111 cf0004        	ldw	_g_wIwdgTick,x
1149                     ; 308 }
1152  0114 81            	ret	
1186                     ; 319 void ADC_Config(void)
1186                     ; 320 {
1187                     	switch	.text
1188  0115               _ADC_Config:
1190  0115 88            	push	a
1191       00000001      OFST:	set	1
1194                     ; 321 	uint8_t regindex = 0;
1196  0116 0f01          	clr	(OFST+0,sp)
1197                     ; 325 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
1199  0118 ae0001        	ldw	x,#1
1200  011b a610          	ld	a,#16
1201  011d 95            	ld	xh,a
1202  011e cd0000        	call	_CLK_PeripheralClockConfig
1204                     ; 328 	ADC1->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);	
1206  0121 c65340        	ld	a,21312
1207  0124 a49b          	and	a,#155
1208  0126 c75340        	ld	21312,a
1209                     ; 329 	ADC1->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode_Single | (uint8_t)ADC_Resolution_12Bit);	
1211  0129 c65340        	ld	a,21312
1212                     ; 331 	ADC1->CR2 &= (uint8_t)~(ADC_CR2_PRESC);	
1214  012c 721f5341      	bres	21313,#7
1215                     ; 332 	ADC1->CR2 |= (uint8_t) ADC_Prescaler_1;
1217  0130 c65341        	ld	a,21313
1218                     ; 335     ADC1->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1220  0133 c65341        	ld	a,21313
1221  0136 a4f8          	and	a,#248
1222  0138 c75341        	ld	21313,a
1223                     ; 336     ADC1->CR2 |= (uint8_t)ADC_SamplingTime_192Cycles;
1225  013b c65341        	ld	a,21313
1226  013e aa06          	or	a,#6
1227  0140 c75341        	ld	21313,a
1228                     ; 338     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1230  0143 7218534e      	bset	21326,#4
1231                     ; 341     ADC1->CR1 |= ADC_CR1_ADON;
1233  0147 72105340      	bset	21312,#0
1234                     ; 346 	ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
1236  014b 4b01          	push	#1
1237  014d ae0010        	ldw	x,#16
1238  0150 89            	pushw	x
1239  0151 ae5340        	ldw	x,#21312
1240  0154 cd0000        	call	_ADC_ChannelCmd
1242  0157 5b03          	addw	sp,#3
1243                     ; 349 	ADC1->CR1 |= ADC_CR1_START;
1245  0159 72125340      	bset	21312,#1
1246                     ; 351 }
1249  015d 84            	pop	a
1250  015e 81            	ret	
1273                     ; 358 static void TIM1_Config(void)
1273                     ; 359 {
1274                     	switch	.text
1275  015f               L305_TIM1_Config:
1279                     ; 366 	TIM1->ARRH = (uint8_t)(TIM1_PERIOD >> 8);
1281  015f 350d52c3      	mov	21187,#13
1282                     ; 367 	TIM1->ARRL = (uint8_t)(TIM1_PERIOD);
1284  0163 350552c4      	mov	21188,#5
1285                     ; 370 	TIM1->PSCRH = (uint8_t)(TIM1_PRESCALER >> 8);
1287  0167 725f52c1      	clr	21185
1288                     ; 371 	TIM1->PSCRL = (uint8_t)(TIM1_PRESCALER);
1290  016b 350152c2      	mov	21186,#1
1291                     ; 374 	TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
1291                     ; 375 						  | (uint8_t)(TIM1_CounterMode_Up));
1293  016f c652b0        	ld	a,21168
1294  0172 a48f          	and	a,#143
1295  0174 c752b0        	ld	21168,a
1296                     ; 378 	TIM1->RCR = TIM1_REPTETION_COUNTER;	
1298  0177 725f52c5      	clr	21189
1299                     ; 382 	TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG_Update));
1301  017b 35fe52b6      	mov	21174,#254
1302                     ; 383 	TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG_Update >> 8))) & (uint8_t)0x1E);
1304  017f 351e52b7      	mov	21175,#30
1305                     ; 386 	TIM1->IER |= (uint8_t)TIM1_IT_Update;
1307  0183 721052b5      	bset	21173,#0
1308                     ; 387 }
1311  0187 81            	ret	
1334                     ; 394 static void TIM4_Config(void)
1334                     ; 395 {
1335                     	switch	.text
1336  0188               L515_TIM4_Config:
1340                     ; 406   TIM4->ARR = (uint8_t)(TIM4_PERIOD);
1342  0188 357c52e9      	mov	21225,#124
1343                     ; 407   TIM4->PSCR = (uint8_t)(TIM4_Prescaler_128);
1345  018c 350752e8      	mov	21224,#7
1346                     ; 408   TIM4->EGR = TIM4_EventSource_Update;
1348  0190 350152e6      	mov	21222,#1
1349                     ; 411   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG_Update));
1351  0194 35fe52e5      	mov	21221,#254
1352                     ; 414   TIM4->IER |= (uint8_t)TIM4_IT_Update;
1354  0198 721052e4      	bset	21220,#0
1355                     ; 417   TIM4->CR1 |= TIM4_CR1_CEN ;
1357  019c 721052e0      	bset	21216,#0
1358                     ; 418 }
1361  01a0 81            	ret	
1387                     ; 425 void CLK_Config(void)
1387                     ; 426 {
1388                     	switch	.text
1389  01a1               _CLK_Config:
1393                     ; 428   CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
1395  01a1 4f            	clr	a
1396  01a2 cd0000        	call	_CLK_SYSCLKDivConfig
1398                     ; 431   CLK_LSICmd(ENABLE);
1400  01a5 a601          	ld	a,#1
1401  01a7 cd0000        	call	_CLK_LSICmd
1404  01aa               L145:
1405                     ; 434   while (CLK_GetFlagStatus(CLK_FLAG_LSIRDY) == RESET)
1407  01aa a613          	ld	a,#19
1408  01ac cd0000        	call	_CLK_GetFlagStatus
1410  01af 4d            	tnz	a
1411  01b0 27f8          	jreq	L145
1413  01b2               L745:
1414                     ; 438   while (CLK_GetFlagStatus(CLK_FLAG_BEEPSWBSY) == SET)
1416  01b2 a660          	ld	a,#96
1417  01b4 cd0000        	call	_CLK_GetFlagStatus
1419  01b7 4a            	dec	a
1420  01b8 27f8          	jreq	L745
1421                     ; 440 }
1424  01ba 81            	ret	
1449                     ; 452 void IoInit(void)
1449                     ; 453 {
1450                     	switch	.text
1451  01bb               _IoInit:
1455                     ; 455 	GPIO_Init(GPIOC, GPIO_Pin_2, GPIO_Mode_In_FL_No_IT);
1457  01bb 4b00          	push	#0
1458  01bd 4b04          	push	#4
1459  01bf ae500a        	ldw	x,#20490
1460  01c2 cd0000        	call	_GPIO_Init
1462  01c5 85            	popw	x
1463                     ; 456 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_Out_PP_High_Fast);
1465  01c6 4bf0          	push	#240
1466  01c8 4b08          	push	#8
1467  01ca ae500a        	ldw	x,#20490
1468  01cd cd0000        	call	_GPIO_Init
1470  01d0 85            	popw	x
1471                     ; 459 	GPIO_Init(GPIOC, GPIO_Pin_4, GPIO_Mode_Out_PP_High_Fast);
1473  01d1 4bf0          	push	#240
1474  01d3 4b10          	push	#16
1475  01d5 ae500a        	ldw	x,#20490
1476  01d8 cd0000        	call	_GPIO_Init
1478  01db 85            	popw	x
1479                     ; 462 	GPIO_Init(UART2_RX_PORT, UART2_RX_PIN, GPIO_Mode_In_PU_IT);
1481  01dc 4b60          	push	#96
1482  01de 4b10          	push	#16
1483  01e0 ae500f        	ldw	x,#20495
1484  01e3 cd0000        	call	_GPIO_Init
1486  01e6 85            	popw	x
1487                     ; 463 	GPIO_Init(UART2_TX_PORT, UART2_TX_PIN, GPIO_Mode_Out_PP_High_Fast);
1489  01e7 4bf0          	push	#240
1490  01e9 4b80          	push	#128
1491  01eb ae5005        	ldw	x,#20485
1492  01ee cd0000        	call	_GPIO_Init
1494  01f1 85            	popw	x
1495                     ; 466 	GPIO_Init(GM_VCC_PORT, GM_VCC_PIN, GPIO_Mode_Out_PP_Low_Slow);
1497  01f2 4bc0          	push	#192
1498  01f4 4b08          	push	#8
1499  01f6 ae5000        	ldw	x,#20480
1500  01f9 cd0000        	call	_GPIO_Init
1502  01fc 85            	popw	x
1503                     ; 467 	GPIO_Init(GPRS_VCC_PORT, GPRS_VCC_PIN, GPIO_Mode_Out_PP_Low_Slow);
1505  01fd 4bc0          	push	#192
1506  01ff 4b10          	push	#16
1507  0201 ae500a        	ldw	x,#20490
1508  0204 cd0000        	call	_GPIO_Init
1510  0207 85            	popw	x
1511                     ; 468 	GPIO_Init(SWITCHON_PORT, SWITCHON_PIN, GPIO_Mode_Out_PP_High_Slow);
1513  0208 4bd0          	push	#208
1514  020a 4b20          	push	#32
1515  020c ae5005        	ldw	x,#20485
1516  020f cd0000        	call	_GPIO_Init
1518  0212 85            	popw	x
1519                     ; 469 	GPIO_Init(GPRS_RESET_PORT, GPRS_RESET_PIN, GPIO_Mode_Out_PP_High_Slow);
1521  0213 4bd0          	push	#208
1522  0215 4b40          	push	#64
1523  0217 ae5005        	ldw	x,#20485
1524  021a cd0000        	call	_GPIO_Init
1526  021d 85            	popw	x
1527                     ; 472 	GPIO_Init(DEBUG_PORT, DEBUG_PIN, GPIO_Mode_In_PU_No_IT);
1529  021e 4b40          	push	#64
1530  0220 4b20          	push	#32
1531  0222 ae5000        	ldw	x,#20480
1532  0225 cd0000        	call	_GPIO_Init
1534  0228 85            	popw	x
1535                     ; 475 	GPIO_Init(GPRS_RX_PORT, GPRS_RX_PIN, GPIO_Mode_Out_PP_High_Slow);
1537  0229 4bd0          	push	#208
1538  022b 4b04          	push	#4
1539  022d ae5000        	ldw	x,#20480
1540  0230 cd0000        	call	_GPIO_Init
1542  0233 85            	popw	x
1543                     ; 476 	GPIO_Init(RS485_DE_PORT, RS485_DE_PIN, GPIO_Mode_In_FL_No_IT);
1545  0234 4b00          	push	#0
1546  0236 4b10          	push	#16
1547  0238 ae5000        	ldw	x,#20480
1548  023b cd0000        	call	_GPIO_Init
1550  023e 85            	popw	x
1551                     ; 481 	SetPortSoftSwitchOff();
1553  023f 4b00          	push	#0
1554  0241 4b20          	push	#32
1555  0243 ae5005        	ldw	x,#20485
1556  0246 cd0000        	call	_GPIO_WriteBit
1558  0249 85            	popw	x
1559                     ; 482 	SetPortGsmPowerOff();
1561  024a 4b00          	push	#0
1562  024c 4b10          	push	#16
1563  024e ae500a        	ldw	x,#20490
1564  0251 cd0000        	call	_GPIO_WriteBit
1566  0254 85            	popw	x
1567                     ; 483 	SetPortGsmResetEnable();
1569  0255 4b01          	push	#1
1570  0257 4b40          	push	#64
1571  0259 ae5005        	ldw	x,#20485
1572  025c cd0000        	call	_GPIO_WriteBit
1574  025f 85            	popw	x
1575                     ; 487 	GPIO_Init(BAT_GAT_PORT, BAT_GAT_PIN, GPIO_Mode_Out_PP_Low_Slow); 
1577  0260 4bc0          	push	#192
1578  0262 4b10          	push	#16
1579  0264 ae5005        	ldw	x,#20485
1580  0267 cd0000        	call	_GPIO_Init
1582  026a 85            	popw	x
1583                     ; 488 	GPIO_Init(GPIOB, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT); 
1585  026b 4b00          	push	#0
1586  026d 4b08          	push	#8
1587  026f ae5005        	ldw	x,#20485
1588  0272 cd0000        	call	_GPIO_Init
1590  0275 85            	popw	x
1591                     ; 493 	GPIO_Init(IO_LED_PORT, IO_LED_PIN, GPIO_Mode_Out_PP_Low_Slow);
1593  0276 4bc0          	push	#192
1594  0278 4b04          	push	#4
1595  027a ae5005        	ldw	x,#20485
1596  027d cd0000        	call	_GPIO_Init
1598  0280 85            	popw	x
1599                     ; 516 }
1602  0281 81            	ret	
1643                     ; 527 void InitializeBase(void)
1643                     ; 528 {
1644                     	switch	.text
1645  0282               _InitializeBase:
1649                     ; 530 	disableInterrupts();
1652  0282 9b            	sim	
1654                     ; 533 	CLK_Config();
1657  0283 cd01a1        	call	_CLK_Config
1659                     ; 536 	IWDG_Config();
1661  0286 cd002e        	call	_IWDG_Config
1663                     ; 539 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE); //
1665  0289 ae0001        	ldw	x,#1
1666  028c a605          	ld	a,#5
1667  028e ad7a          	call	LC001
1668  0290 a602          	ld	a,#2
1669  0292 ad76          	call	LC001
1670  0294 a611          	ld	a,#17
1671  0296 ad72          	call	LC001
1672  0298 4f            	clr	a
1673  0299 95            	ld	xh,a
1674  029a cd0000        	call	_CLK_PeripheralClockConfig
1676                     ; 548 	if (((FlagStatus)(((uint8_t)(RST->SR & RST_FLAG_IWDGF) == (uint8_t)0x00) ? RESET : SET))!= RESET)
1678  029d 720250b103    	btjt	20657,#1,L441
1679  02a2 4f            	clr	a
1680  02a3 2002          	jra	L641
1681  02a5               L441:
1682  02a5 a601          	ld	a,#1
1683  02a7               L641:
1684  02a7 4d            	tnz	a
1685                     ; 555 	IoInit();
1687  02a8 cd01bb        	call	_IoInit
1689                     ; 557 	ITC_SetSoftwarePriority(USART1_RX_IRQn, ITC_PriorityLevel_1);
1691  02ab ae0001        	ldw	x,#1
1692  02ae a61c          	ld	a,#28
1693  02b0 95            	ld	xh,a
1694  02b1 cd0047        	call	_ITC_SetSoftwarePriority
1696                     ; 558 	ITC_SetSoftwarePriority(USART1_TX_IRQn, ITC_PriorityLevel_2);
1698  02b4 5f            	clrw	x
1699  02b5 a61b          	ld	a,#27
1700  02b7 95            	ld	xh,a
1701  02b8 cd0047        	call	_ITC_SetSoftwarePriority
1703                     ; 559 	ITC_SetSoftwarePriority(TIM4_UPD_OVF_TRG_IRQn, ITC_PriorityLevel_3);
1705  02bb ae0003        	ldw	x,#3
1706  02be a619          	ld	a,#25
1707  02c0 95            	ld	xh,a
1708  02c1 cd0047        	call	_ITC_SetSoftwarePriority
1710                     ; 560 	ITC_SetSoftwarePriority(EXTI4_IRQn, ITC_PriorityLevel_1);
1712  02c4 ae0001        	ldw	x,#1
1713  02c7 a60c          	ld	a,#12
1714  02c9 95            	ld	xh,a
1715  02ca cd0047        	call	_ITC_SetSoftwarePriority
1717                     ; 561 	ITC_SetSoftwarePriority(TIM1_UPD_OVF_TRG_IRQn, ITC_PriorityLevel_2);
1719  02cd 5f            	clrw	x
1720  02ce a617          	ld	a,#23
1721  02d0 95            	ld	xh,a
1722  02d1 cd0047        	call	_ITC_SetSoftwarePriority
1724                     ; 564 	EXTI_SelectPort(EXTI_Port_D);
1726  02d4 a602          	ld	a,#2
1727  02d6 cd0000        	call	_EXTI_SelectPort
1729                     ; 565 	EXTI_SetPinSensitivity(UART2_RX_PIN, EXTI_Trigger_Falling);
1731  02d9 ae0002        	ldw	x,#2
1732  02dc a610          	ld	a,#16
1733  02de 95            	ld	xh,a
1734  02df cd0000        	call	_EXTI_SetPinSensitivity
1736                     ; 566 	EXTI_ClearITPendingBit(EXTI_IT_Pin4);
1738  02e2 ae0010        	ldw	x,#16
1739  02e5 cd0000        	call	_EXTI_ClearITPendingBit
1741                     ; 569 	TIM4_Config();
1743  02e8 cd0188        	call	L515_TIM4_Config
1745                     ; 572 	TIM1_Config();
1747  02eb cd015f        	call	L305_TIM1_Config
1749                     ; 575 	Usart1Initialize();
1751  02ee cd0000        	call	_Usart1Initialize
1753                     ; 578 	STM8_RTC_Init();
1755  02f1 cd0000        	call	_STM8_RTC_Init
1757                     ; 581 	ADC_Config();
1759  02f4 cd0115        	call	_ADC_Config
1761                     ; 584 	enableInterrupts();	
1764  02f7 9a            	rim	
1766                     ; 586 	STM8_RTC_Get(&stTimeNow);
1769  02f8 ae0000        	ldw	x,#_stTimeNow
1770  02fb cd0000        	call	_STM8_RTC_Get
1772                     ; 587 	LP_DelayMs(20); // 相当于1s
1774  02fe ae0014        	ldw	x,#20
1775  0301 89            	pushw	x
1776  0302 5f            	clrw	x
1777  0303 89            	pushw	x
1778  0304 cd0000        	call	_LP_DelayMs
1780  0307 5b04          	addw	sp,#4
1781                     ; 588 }
1784  0309 81            	ret	
1786  030a               LC001:
1787  030a 95            	ld	xh,a
1788  030b cd0000        	call	_CLK_PeripheralClockConfig
1790                     ; 542 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE); //
1792  030e ae0001        	ldw	x,#1
1793  0311 81            	ret	
1795                     	switch	.data
1796  0012               L575_nHighCnt:
1797  0012 00            	dc.b	0
1798  0013               L775_nLowCnt:
1799  0013 00            	dc.b	0
1800  0014               L106_nStat:
1801  0014 01            	dc.b	1
1802  0015               L306_dwStartTime:
1803  0015 00000000      	dc.l	0
1871                     	switch	.const
1872  003a               L612:
1873  003a 00007530      	dc.l	30000
1874                     ; 600 u8 CheckDebugInsertStat(void)
1874                     ; 601 {
1875                     	switch	.text
1876  0312               _CheckDebugInsertStat:
1878  0312 88            	push	a
1879       00000001      OFST:	set	1
1882                     ; 603 	u8 nNowStat = FALSE;
1884  0313 0f01          	clr	(OFST+0,sp)
1885                     ; 606 	nNowStat = GetDebugMode();
1887  0315 cd03b2        	call	LC002
1888  0318 6b01          	ld	(OFST+0,sp),a
1889                     ; 607 	if((nNowStat == nStat)&&(30000 > GetSysTemTick() - dwStartTime))
1891  031a c10014        	cp	a,L106_nStat
1892  031d 2617          	jrne	L136
1894  031f cd0000        	call	_GetSysTemTick
1896  0322 ae0015        	ldw	x,#L306_dwStartTime
1897  0325 cd0000        	call	c_lsub
1899  0328 ae003a        	ldw	x,#L612
1900  032b cd0000        	call	c_lcmp
1902  032e 2406          	jruge	L136
1903                     ; 609 		return nDebugFlg;
1905  0330 c60008        	ld	a,L3_nDebugFlg
1908  0333 5b01          	addw	sp,#1
1909  0335 81            	ret	
1910  0336               L136:
1911                     ; 612 	if(FALSE == GetDebugMode())
1913  0336 ad7a          	call	LC002
1914  0338 4d            	tnz	a
1915  0339 2635          	jrne	L336
1916                     ; 614 		nLowCnt = 0;
1918  033b c70013        	ld	L775_nLowCnt,a
1919                     ; 615 		if(3 <= nHighCnt++)
1921  033e c60012        	ld	a,L575_nHighCnt
1922  0341 725c0012      	inc	L575_nHighCnt
1923  0345 a103          	cp	a,#3
1924  0347 2563          	jrult	L736
1925                     ; 617 			nHighCnt  = 3;
1927  0349 35030012      	mov	L575_nHighCnt,#3
1928                     ; 618 			nDebugFlg = TRUE;			
1930  034d 35010008      	mov	L3_nDebugFlg,#1
1931                     ; 619 			dwStartTime = GetSysTemTick();
1933  0351 ad6a          	call	LC003
1935                     ; 623 			SetPortMeterPowerOn();
1937  0353 4b01          	push	#1
1938  0355 4b08          	push	#8
1939  0357 ae5000        	ldw	x,#20480
1940  035a cd0000        	call	_GPIO_WriteBit
1942  035d 85            	popw	x
1943                     ; 624 			SetPortGsmPowerOff();
1945  035e 4b00          	push	#0
1946  0360 4b10          	push	#16
1947  0362 ae500a        	ldw	x,#20490
1948  0365 cd0000        	call	_GPIO_WriteBit
1950  0368 85            	popw	x
1951                     ; 625 			nStat = nNowStat;
1953  0369 7b01          	ld	a,(OFST+0,sp)
1954  036b c70014        	ld	L106_nStat,a
1955  036e 203c          	jra	L736
1956  0370               L336:
1957                     ; 630 		nHighCnt = 0;
1959  0370 725f0012      	clr	L575_nHighCnt
1960                     ; 631 		if(3 <= nLowCnt++)
1962  0374 c60013        	ld	a,L775_nLowCnt
1963  0377 725c0013      	inc	L775_nLowCnt
1964  037b a103          	cp	a,#3
1965  037d 252d          	jrult	L736
1966                     ; 633 			nLowCnt = 3;
1968  037f 35030013      	mov	L775_nLowCnt,#3
1969                     ; 634 			nStat = nNowStat;
1971  0383 7b01          	ld	a,(OFST+0,sp)
1972  0385 c70014        	ld	L106_nStat,a
1973                     ; 635 			dwStartTime = GetSysTemTick();
1975  0388 ad33          	call	LC003
1977                     ; 638 			if(nDebugFlg)
1979  038a c60008        	ld	a,L3_nDebugFlg
1980  038d 2719          	jreq	L346
1981                     ; 641 				SetReportIndex(0);  // 注释掉用于测试失败补报3
1983  038f 4f            	clr	a
1984  0390 cd0000        	call	_SetReportIndex
1986                     ; 643 				ReWriteRepFlg();
1988  0393 cd0000        	call	_ReWriteRepFlg
1990                     ; 645 				SaveReportFlag(FALSE);
1992  0396 4f            	clr	a
1993  0397 cd0000        	call	_SaveReportFlag
1995                     ; 646 				UC_SleepFunc(100);				
1997  039a ae0064        	ldw	x,#100
1998  039d 89            	pushw	x
1999  039e 5f            	clrw	x
2000  039f 89            	pushw	x
2001  03a0 cd0000        	call	_UC_SleepFunc
2003  03a3 5b04          	addw	sp,#4
2004                     ; 647 				LP_TermReset();
2006  03a5 cd0000        	call	_LP_TermReset
2008  03a8               L346:
2009                     ; 649 			nDebugFlg = FALSE;
2011  03a8 725f0008      	clr	L3_nDebugFlg
2012  03ac               L736:
2013                     ; 652 	return nDebugFlg;
2015  03ac c60008        	ld	a,L3_nDebugFlg
2018  03af 5b01          	addw	sp,#1
2019  03b1 81            	ret	
2021  03b2               LC002:
2022  03b2 4b20          	push	#32
2023  03b4 ae5000        	ldw	x,#20480
2024  03b7 cd0000        	call	_GPIO_ReadInputDataBit
2026  03ba 5b01          	addw	sp,#1
2027  03bc 81            	ret	
2028  03bd               LC003:
2029  03bd cd0000        	call	_GetSysTemTick
2031  03c0 ae0015        	ldw	x,#L306_dwStartTime
2032  03c3 cc0000        	jp	c_rtol
2055                     ; 665 u8 GetTmDebugModeStat(void)
2055                     ; 666 {
2056                     	switch	.text
2057  03c6               _GetTmDebugModeStat:
2061                     ; 667 	return nDebugFlg;
2063  03c6 c60008        	ld	a,L3_nDebugFlg
2066  03c9 81            	ret	
2099                     ; 679 u8 SetTmDebugModeStat(u8 nMode)
2099                     ; 680 {
2100                     	switch	.text
2101  03ca               _SetTmDebugModeStat:
2105                     ; 681 	m_nWorkMode = nMode;
2107  03ca c70009        	ld	_m_nWorkMode,a
2108                     ; 682 }
2111  03cd 81            	ret	
2134                     ; 689 void InitializEnd(void)
2134                     ; 690 {
2135                     	switch	.text
2136  03ce               _InitializEnd:
2140                     ; 692 }
2143  03ce 81            	ret	
2168                     ; 699 void TurnOnExit(void)
2168                     ; 700 {
2169                     	switch	.text
2170  03cf               _TurnOnExit:
2174                     ; 701 	GPIO_Init(UART2_RX_PORT, UART2_RX_PIN, GPIO_Mode_In_PU_IT); // GPIO_Mode_In_FL_IT 开始首帧数据丢失问题
2176  03cf 4b60          	push	#96
2177  03d1 4b10          	push	#16
2178  03d3 ae500f        	ldw	x,#20495
2179  03d6 cd0000        	call	_GPIO_Init
2181  03d9 85            	popw	x
2182                     ; 702 	EXTI_ClearITPendingBit(EXTI_IT_Pin4);	
2184  03da ae0010        	ldw	x,#16
2186                     ; 703 }
2189  03dd cc0000        	jp	_EXTI_ClearITPendingBit
2213                     ; 710 void TurnOffExit(void)
2213                     ; 711 {
2214                     	switch	.text
2215  03e0               _TurnOffExit:
2219                     ; 712 	GPIO_Init(UART2_RX_PORT, UART2_RX_PIN, GPIO_Mode_In_PU_No_IT);// GPIO_Mode_In_FL_No_IT
2221  03e0 4b40          	push	#64
2222  03e2 4b10          	push	#16
2223  03e4 ae500f        	ldw	x,#20495
2224  03e7 cd0000        	call	_GPIO_Init
2226  03ea 85            	popw	x
2227                     ; 713 }
2230  03eb 81            	ret	
2263                     ; 761 void DecIoModeChange(u8 nMode)
2263                     ; 762 {
2264                     	switch	.text
2265  03ec               _DecIoModeChange:
2269                     ; 763 	if(PULLUPOUTPUT == nMode)
2271  03ec 4a            	dec	a
2272  03ed 260f          	jrne	L537
2273                     ; 765 		GPIO_Init(RS485_DE_PORT, RS485_DE_PIN, GPIO_Mode_Out_PP_High_Slow);
2275  03ef 4bd0          	push	#208
2276  03f1 4b10          	push	#16
2277  03f3 ae5000        	ldw	x,#20480
2278  03f6 cd0000        	call	_GPIO_Init
2280  03f9 85            	popw	x
2281                     ; 766 		GPIO_Init(DEBUG_PORT, DEBUG_PIN, GPIO_Mode_In_FL_No_IT);
2283  03fa 4b00          	push	#0
2286  03fc 200d          	jra	L737
2287  03fe               L537:
2288                     ; 770 		GPIO_Init(RS485_DE_PORT, RS485_DE_PIN, GPIO_Mode_In_FL_No_IT);
2290  03fe 4b00          	push	#0
2291  0400 4b10          	push	#16
2292  0402 ae5000        	ldw	x,#20480
2293  0405 cd0000        	call	_GPIO_Init
2295  0408 85            	popw	x
2296                     ; 771 		GPIO_Init(DEBUG_PORT, DEBUG_PIN, GPIO_Mode_In_PU_No_IT);
2298  0409 4b40          	push	#64
2300  040b               L737:
2301  040b 4b20          	push	#32
2302  040d ae5000        	ldw	x,#20480
2303  0410 cd0000        	call	_GPIO_Init
2304  0413 85            	popw	x
2305                     ; 773 }
2308  0414 81            	ret	
2337                     	switch	.const
2338  003e               L203:
2339  003e 000003e9      	dc.l	1001
2340  0042               L613:
2341  0042 000000c9      	dc.l	201
2342                     ; 811 void fixTaskLed(void)
2342                     ; 812 {	
2343                     	switch	.text
2344  0415               _fixTaskLed:
2348                     ; 813 	if((1000 < GetSysTemTick()-m_dwSecTick)	&&(GetLedFlg()&&(GSM_SHAKEHAND > GetGprsConntStat())))
2350  0415 cd0000        	call	_GetSysTemTick
2352  0418 ae000a        	ldw	x,#_m_dwSecTick
2353  041b cd0000        	call	c_lsub
2355  041e ae003e        	ldw	x,#L203
2356  0421 cd0000        	call	c_lcmp
2358  0424 2518          	jrult	L157
2360  0426 cd0000        	call	_GetLedFlg
2362  0429 4d            	tnz	a
2363  042a 2712          	jreq	L157
2365  042c cd0000        	call	_GetGprsConntStat
2367  042f a102          	cp	a,#2
2368  0431 240b          	jruge	L157
2369                     ; 815 		Toggle_LED();
2371  0433 ad3a          	call	LC004
2372                     ; 816 		m_dwSecTick = GetSysTemTick();
2374  0435 cd0000        	call	_GetSysTemTick
2376  0438 ae000a        	ldw	x,#_m_dwSecTick
2380  043b cc0000        	jp	c_rtol
2381  043e               L157:
2382                     ; 818 	else if((200 < GetSysTemTick()-m_dw500MsTick)&&(GetLedFlg()
2382                     ; 819 		&&(GSM_SEND > GetGprsConntStat())&&(GSM_SHAKEHAND <= GetGprsConntStat())))
2384  043e cd0000        	call	_GetSysTemTick
2386  0441 ae000e        	ldw	x,#_m_dw500MsTick
2387  0444 cd0000        	call	c_lsub
2389  0447 ae0042        	ldw	x,#L613
2390  044a cd0000        	call	c_lcmp
2392  044d 251f          	jrult	L357
2394  044f cd0000        	call	_GetLedFlg
2396  0452 4d            	tnz	a
2397  0453 2719          	jreq	L357
2399  0455 cd0000        	call	_GetGprsConntStat
2401  0458 a104          	cp	a,#4
2402  045a 2412          	jruge	L357
2404  045c cd0000        	call	_GetGprsConntStat
2406  045f a102          	cp	a,#2
2407  0461 250b          	jrult	L357
2408                     ; 821 		m_dw500MsTick = GetSysTemTick();
2410  0463 cd0000        	call	_GetSysTemTick
2412  0466 ae000e        	ldw	x,#_m_dw500MsTick
2413  0469 cd0000        	call	c_rtol
2415                     ; 822 		Toggle_LED();
2417  046c ad01          	call	LC004
2418  046e               L357:
2419                     ; 824 	return ;
2422  046e 81            	ret	
2424  046f               LC004:
2425  046f 4b04          	push	#4
2426  0471 ae5005        	ldw	x,#20485
2427  0474 cd0000        	call	_GPIO_ToggleBits
2429  0477 84            	pop	a
2430  0478 81            	ret	
2493                     	xdef	_InitializEnd
2494                     	xdef	_IoInit
2495                     	xdef	_ADC_Config
2496                     	xdef	_IWDG_Config
2497                     	xdef	_m_dw500MsTick
2498                     	xdef	_m_dwSecTick
2499                     	xdef	_m_nWorkMode
2500                     	xdef	_g_wIwdgTickExt
2501                     	xref	_SaveReportFlag
2502                     	xref	_LP_DelayMs
2503                     	xref	_LP_TermReset
2504                     	xref	_GetGprsConntStat
2505                     	xref	_GetLedFlg
2506                     	xref	_SetReportIndex
2507                     	xref	_ReWriteRepFlg
2508                     	xref	_UC_SleepFunc
2509                     	xref	_stTimeNow
2510                     	xref	_STM8_RTC_Get
2511                     	xref	_STM8_RTC_Init
2512                     	xref	_Usart1Initialize
2513                     	xdef	_SetTmDebugModeStat
2514                     	xdef	_DecIoModeChange
2515                     	xdef	_fixTaskLed
2516                     	xdef	_FeedSoftWareIwdg
2517                     	xdef	_CLK_Config
2518                     	xdef	_GetTmDebugModeStat
2519                     	xdef	_CheckDebugInsertStat
2520                     	xdef	_TurnOffExit
2521                     	xdef	_TurnOnExit
2522                     	xdef	_InitializeBase
2523                     	xdef	_g_wIwdgTick
2524                     	xdef	_g_dwSysTick
2525                     	xref	_GetSysTemTick
2526                     	xdef	_ITC_SetSoftwarePriority
2527                     	xref	_GPIO_ReadInputDataBit
2528                     	xref	_GPIO_ToggleBits
2529                     	xref	_GPIO_WriteBit
2530                     	xref	_GPIO_Init
2531                     	xref	_EXTI_ClearITPendingBit
2532                     	xref	_EXTI_SelectPort
2533                     	xref	_EXTI_SetPinSensitivity
2534                     	xref	_CLK_GetFlagStatus
2535                     	xref	_CLK_PeripheralClockConfig
2536                     	xref	_CLK_SYSCLKDivConfig
2537                     	xref	_CLK_LSICmd
2538                     	xdef	_ADC_ChannelCmd
2557                     	xref	c_rtol
2558                     	xref	c_lcmp
2559                     	xref	c_lsub
2560                     	end
