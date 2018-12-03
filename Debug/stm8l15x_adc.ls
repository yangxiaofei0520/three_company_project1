   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 163                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 163                     ; 136 {
 165                     	switch	.text
 166  0000               _ADC_DeInit:
 170                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 172  0000 7f            	clr	(x)
 173                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 175  0001 6f01          	clr	(1,x)
 176                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 178  0003 a61f          	ld	a,#31
 179  0005 e702          	ld	(2,x),a
 180                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 182  0007 a6ff          	ld	a,#255
 183  0009 e703          	ld	(3,x),a
 184                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 186  000b a60f          	ld	a,#15
 187  000d e706          	ld	(6,x),a
 188                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 190  000f a6ff          	ld	a,#255
 191  0011 e707          	ld	(7,x),a
 192                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 194  0013 6f08          	clr	(8,x)
 195                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 197  0015 6f09          	clr	(9,x)
 198                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 200  0017 6f0a          	clr	(10,x)
 201                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 203  0019 6f0b          	clr	(11,x)
 204                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 206  001b 6f0c          	clr	(12,x)
 207                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 209  001d 6f0d          	clr	(13,x)
 210                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 212  001f 6f0e          	clr	(14,x)
 213                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 215  0021 6f0f          	clr	(15,x)
 216                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 218  0023 6f10          	clr	(16,x)
 219                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 221  0025 6f11          	clr	(17,x)
 222                     ; 164 }
 225  0027 81            	ret
 372                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 372                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 372                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 372                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 372                     ; 190 {
 373                     	switch	.text
 374  0028               _ADC_Init:
 376  0028 89            	pushw	x
 377       00000000      OFST:	set	0
 380                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 382                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 384                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 386                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 388  0029 f6            	ld	a,(x)
 389  002a a49b          	and	a,#155
 390  002c f7            	ld	(x),a
 391                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 393  002d 7b05          	ld	a,(OFST+5,sp)
 394  002f 1a06          	or	a,(OFST+6,sp)
 395  0031 fa            	or	a,(x)
 396  0032 f7            	ld	(x),a
 397                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 399  0033 e601          	ld	a,(1,x)
 400  0035 a47f          	and	a,#127
 401  0037 e701          	ld	(1,x),a
 402                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 404  0039 e601          	ld	a,(1,x)
 405  003b 1a07          	or	a,(OFST+7,sp)
 406  003d e701          	ld	(1,x),a
 407                     ; 207 }
 410  003f 85            	popw	x
 411  0040 81            	ret
 478                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 478                     ; 217              FunctionalState NewState)
 478                     ; 218 {
 479                     	switch	.text
 480  0041               _ADC_Cmd:
 482  0041 89            	pushw	x
 483       00000000      OFST:	set	0
 486                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 488                     ; 222   if (NewState != DISABLE)
 490  0042 0d05          	tnz	(OFST+5,sp)
 491  0044 2706          	jreq	L142
 492                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 494  0046 f6            	ld	a,(x)
 495  0047 aa01          	or	a,#1
 496  0049 f7            	ld	(x),a
 498  004a 2006          	jra	L342
 499  004c               L142:
 500                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 502  004c 1e01          	ldw	x,(OFST+1,sp)
 503  004e f6            	ld	a,(x)
 504  004f a4fe          	and	a,#254
 505  0051 f7            	ld	(x),a
 506  0052               L342:
 507                     ; 232 }
 510  0052 85            	popw	x
 511  0053 81            	ret
 549                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 549                     ; 240 {
 550                     	switch	.text
 551  0054               _ADC_SoftwareStartConv:
 555                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 557  0054 f6            	ld	a,(x)
 558  0055 aa02          	or	a,#2
 559  0057 f7            	ld	(x),a
 560                     ; 243 }
 563  0058 81            	ret
 691                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 691                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 691                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 691                     ; 264 {
 692                     	switch	.text
 693  0059               _ADC_ExternalTrigConfig:
 695  0059 89            	pushw	x
 696       00000000      OFST:	set	0
 699                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 701                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 703                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 705  005a e601          	ld	a,(1,x)
 706  005c a487          	and	a,#135
 707  005e e701          	ld	(1,x),a
 708                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 708                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 710  0060 7b06          	ld	a,(OFST+6,sp)
 711  0062 1a05          	or	a,(OFST+5,sp)
 712  0064 ea01          	or	a,(1,x)
 713  0066 e701          	ld	(1,x),a
 714                     ; 276 }
 717  0068 85            	popw	x
 718  0069 81            	ret
1032                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1032                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1032                     ; 341 {
1033                     	switch	.text
1034  006a               _ADC_AnalogWatchdogChannelSelect:
1036  006a 89            	pushw	x
1037       00000000      OFST:	set	0
1040                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1042                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1044  006b e602          	ld	a,(2,x)
1045  006d a4e0          	and	a,#224
1046  006f e702          	ld	(2,x),a
1047                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1049  0071 e602          	ld	a,(2,x)
1050  0073 1a05          	or	a,(OFST+5,sp)
1051  0075 e702          	ld	(2,x),a
1052                     ; 350 }
1055  0077 85            	popw	x
1056  0078 81            	ret
1108                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1108                     ; 362 {
1109                     	switch	.text
1110  0079               _ADC_AnalogWatchdogThresholdsConfig:
1112  0079 89            	pushw	x
1113       00000000      OFST:	set	0
1116                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1118                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1120                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1122  007a 7b05          	ld	a,(OFST+5,sp)
1123  007c 1e01          	ldw	x,(OFST+1,sp)
1124  007e e706          	ld	(6,x),a
1125                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1127  0080 7b06          	ld	a,(OFST+6,sp)
1128  0082 1e01          	ldw	x,(OFST+1,sp)
1129  0084 e707          	ld	(7,x),a
1130                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1132  0086 7b07          	ld	a,(OFST+7,sp)
1133  0088 1e01          	ldw	x,(OFST+1,sp)
1134  008a e708          	ld	(8,x),a
1135                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1137  008c 7b08          	ld	a,(OFST+8,sp)
1138  008e 1e01          	ldw	x,(OFST+1,sp)
1139  0090 e709          	ld	(9,x),a
1140                     ; 374 }
1143  0092 85            	popw	x
1144  0093 81            	ret
1207                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1207                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1207                     ; 414                               uint16_t HighThreshold,
1207                     ; 415                               uint16_t LowThreshold)
1207                     ; 416 {
1208                     	switch	.text
1209  0094               _ADC_AnalogWatchdogConfig:
1211  0094 89            	pushw	x
1212       00000000      OFST:	set	0
1215                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1217                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1219                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1221                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1223  0095 e602          	ld	a,(2,x)
1224  0097 a4e0          	and	a,#224
1225  0099 e702          	ld	(2,x),a
1226                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1228  009b e602          	ld	a,(2,x)
1229  009d 1a05          	or	a,(OFST+5,sp)
1230  009f e702          	ld	(2,x),a
1231                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1233  00a1 7b06          	ld	a,(OFST+6,sp)
1234  00a3 1e01          	ldw	x,(OFST+1,sp)
1235  00a5 e706          	ld	(6,x),a
1236                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1238  00a7 7b07          	ld	a,(OFST+7,sp)
1239  00a9 1e01          	ldw	x,(OFST+1,sp)
1240  00ab e707          	ld	(7,x),a
1241                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1243  00ad 7b08          	ld	a,(OFST+8,sp)
1244  00af 1e01          	ldw	x,(OFST+1,sp)
1245  00b1 e708          	ld	(8,x),a
1246                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1248  00b3 7b09          	ld	a,(OFST+9,sp)
1249  00b5 1e01          	ldw	x,(OFST+1,sp)
1250  00b7 e709          	ld	(9,x),a
1251                     ; 435 }
1254  00b9 85            	popw	x
1255  00ba 81            	ret
1290                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1290                     ; 475 {
1291                     	switch	.text
1292  00bb               _ADC_TempSensorCmd:
1296                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1298                     ; 479   if (NewState != DISABLE)
1300  00bb 4d            	tnz	a
1301  00bc 2706          	jreq	L165
1302                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1304  00be 721a534e      	bset	21326,#5
1306  00c2 2004          	jra	L365
1307  00c4               L165:
1308                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1310  00c4 721b534e      	bres	21326,#5
1311  00c8               L365:
1312                     ; 489 }
1315  00c8 81            	ret
1350                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1350                     ; 498 {
1351                     	switch	.text
1352  00c9               _ADC_VrefintCmd:
1356                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1358                     ; 502   if (NewState != DISABLE)
1360  00c9 4d            	tnz	a
1361  00ca 2706          	jreq	L306
1362                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1364  00cc 7218534e      	bset	21326,#4
1366  00d0 2004          	jra	L506
1367  00d2               L306:
1368                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1370  00d2 7219534e      	bres	21326,#4
1371  00d6               L506:
1372                     ; 512 }
1375  00d6 81            	ret
1685                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1685                     ; 584 {
1686                     	switch	.text
1687  00d7               _ADC_ChannelCmd:
1689  00d7 89            	pushw	x
1690  00d8 88            	push	a
1691       00000001      OFST:	set	1
1694                     ; 585   uint8_t regindex = 0;
1696  00d9 0f01          	clr	(OFST+0,sp)
1697                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1699                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1701  00db 7b06          	ld	a,(OFST+5,sp)
1702  00dd 6b01          	ld	(OFST+0,sp),a
1703                     ; 591   if (NewState != DISABLE)
1705  00df 0d08          	tnz	(OFST+7,sp)
1706  00e1 270f          	jreq	L157
1707                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1709  00e3 01            	rrwa	x,a
1710  00e4 1b01          	add	a,(OFST+0,sp)
1711  00e6 2401          	jrnc	L23
1712  00e8 5c            	incw	x
1713  00e9               L23:
1714  00e9 02            	rlwa	x,a
1715  00ea e60a          	ld	a,(10,x)
1716  00ec 1a07          	or	a,(OFST+6,sp)
1717  00ee e70a          	ld	(10,x),a
1719  00f0 2012          	jra	L357
1720  00f2               L157:
1721                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1723  00f2 7b02          	ld	a,(OFST+1,sp)
1724  00f4 97            	ld	xl,a
1725  00f5 7b03          	ld	a,(OFST+2,sp)
1726  00f7 1b01          	add	a,(OFST+0,sp)
1727  00f9 2401          	jrnc	L43
1728  00fb 5c            	incw	x
1729  00fc               L43:
1730  00fc 02            	rlwa	x,a
1731  00fd 7b07          	ld	a,(OFST+6,sp)
1732  00ff 43            	cpl	a
1733  0100 e40a          	and	a,(10,x)
1734  0102 e70a          	ld	(10,x),a
1735  0104               L357:
1736                     ; 601 }
1739  0104 5b03          	addw	sp,#3
1740  0106 81            	ret
1890                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1890                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1890                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1890                     ; 628 {
1891                     	switch	.text
1892  0107               _ADC_SamplingTimeConfig:
1894  0107 89            	pushw	x
1895       00000000      OFST:	set	0
1898                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1900                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1902                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1904  0108 0d05          	tnz	(OFST+5,sp)
1905  010a 2712          	jreq	L1401
1906                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1908  010c e602          	ld	a,(2,x)
1909  010e a41f          	and	a,#31
1910  0110 e702          	ld	(2,x),a
1911                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1913  0112 7b06          	ld	a,(OFST+6,sp)
1914  0114 4e            	swap	a
1915  0115 48            	sll	a
1916  0116 a4e0          	and	a,#224
1917  0118 ea02          	or	a,(2,x)
1918  011a e702          	ld	(2,x),a
1920  011c 2010          	jra	L3401
1921  011e               L1401:
1922                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1924  011e 1e01          	ldw	x,(OFST+1,sp)
1925  0120 e601          	ld	a,(1,x)
1926  0122 a4f8          	and	a,#248
1927  0124 e701          	ld	(1,x),a
1928                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1930  0126 1e01          	ldw	x,(OFST+1,sp)
1931  0128 e601          	ld	a,(1,x)
1932  012a 1a06          	or	a,(OFST+6,sp)
1933  012c e701          	ld	(1,x),a
1934  012e               L3401:
1935                     ; 645 }
1938  012e 85            	popw	x
1939  012f 81            	ret
2004                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2004                     ; 692                               FunctionalState NewState)
2004                     ; 693 {
2005                     	switch	.text
2006  0130               _ADC_SchmittTriggerConfig:
2008  0130 89            	pushw	x
2009  0131 88            	push	a
2010       00000001      OFST:	set	1
2013                     ; 694   uint8_t regindex = 0;
2015  0132 0f01          	clr	(OFST+0,sp)
2016                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2018                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2020  0134 7b06          	ld	a,(OFST+5,sp)
2021  0136 6b01          	ld	(OFST+0,sp),a
2022                     ; 700   if (NewState != DISABLE)
2024  0138 0d08          	tnz	(OFST+7,sp)
2025  013a 2710          	jreq	L7701
2026                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2028  013c 01            	rrwa	x,a
2029  013d 1b01          	add	a,(OFST+0,sp)
2030  013f 2401          	jrnc	L24
2031  0141 5c            	incw	x
2032  0142               L24:
2033  0142 02            	rlwa	x,a
2034  0143 7b07          	ld	a,(OFST+6,sp)
2035  0145 43            	cpl	a
2036  0146 e40e          	and	a,(14,x)
2037  0148 e70e          	ld	(14,x),a
2039  014a 2011          	jra	L1011
2040  014c               L7701:
2041                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2043  014c 7b02          	ld	a,(OFST+1,sp)
2044  014e 97            	ld	xl,a
2045  014f 7b03          	ld	a,(OFST+2,sp)
2046  0151 1b01          	add	a,(OFST+0,sp)
2047  0153 2401          	jrnc	L44
2048  0155 5c            	incw	x
2049  0156               L44:
2050  0156 02            	rlwa	x,a
2051  0157 e60e          	ld	a,(14,x)
2052  0159 1a07          	or	a,(OFST+6,sp)
2053  015b e70e          	ld	(14,x),a
2054  015d               L1011:
2055                     ; 710 }
2058  015d 5b03          	addw	sp,#3
2059  015f 81            	ret
2104                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2104                     ; 718 {
2105                     	switch	.text
2106  0160               _ADC_GetConversionValue:
2108  0160 89            	pushw	x
2109  0161 89            	pushw	x
2110       00000002      OFST:	set	2
2113                     ; 719   uint16_t tmpreg = 0;
2115  0162 5f            	clrw	x
2116  0163 1f01          	ldw	(OFST-1,sp),x
2117                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2119  0165 1e03          	ldw	x,(OFST+1,sp)
2120  0167 e604          	ld	a,(4,x)
2121  0169 5f            	clrw	x
2122  016a 97            	ld	xl,a
2123  016b 1f01          	ldw	(OFST-1,sp),x
2124                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2126  016d 1e01          	ldw	x,(OFST-1,sp)
2127  016f 4f            	clr	a
2128  0170 02            	rlwa	x,a
2129  0171 01            	rrwa	x,a
2130  0172 1603          	ldw	y,(OFST+1,sp)
2131  0174 90ea05        	or	a,(5,y)
2132  0177 02            	rlwa	x,a
2133  0178 1f01          	ldw	(OFST-1,sp),x
2134  017a 01            	rrwa	x,a
2135                     ; 726   return (uint16_t)(tmpreg) ;
2137  017b 1e01          	ldw	x,(OFST-1,sp)
2140  017d 5b04          	addw	sp,#4
2141  017f 81            	ret
2188                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2188                     ; 761 {
2189                     	switch	.text
2190  0180               _ADC_DMACmd:
2192  0180 89            	pushw	x
2193       00000000      OFST:	set	0
2196                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2198                     ; 765   if (NewState != DISABLE)
2200  0181 0d05          	tnz	(OFST+5,sp)
2201  0183 2708          	jreq	L1511
2202                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2204  0185 e60a          	ld	a,(10,x)
2205  0187 a47f          	and	a,#127
2206  0189 e70a          	ld	(10,x),a
2208  018b 2008          	jra	L3511
2209  018d               L1511:
2210                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2212  018d 1e01          	ldw	x,(OFST+1,sp)
2213  018f e60a          	ld	a,(10,x)
2214  0191 aa80          	or	a,#128
2215  0193 e70a          	ld	(10,x),a
2216  0195               L3511:
2217                     ; 775 }
2220  0195 85            	popw	x
2221  0196 81            	ret
2305                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2305                     ; 832 {
2306                     	switch	.text
2307  0197               _ADC_ITConfig:
2309  0197 89            	pushw	x
2310       00000000      OFST:	set	0
2313                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2315                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2317                     ; 837   if (NewState != DISABLE)
2319  0198 0d06          	tnz	(OFST+6,sp)
2320  019a 2706          	jreq	L7121
2321                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2323  019c f6            	ld	a,(x)
2324  019d 1a05          	or	a,(OFST+5,sp)
2325  019f f7            	ld	(x),a
2327  01a0 2007          	jra	L1221
2328  01a2               L7121:
2329                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2331  01a2 1e01          	ldw	x,(OFST+1,sp)
2332  01a4 7b05          	ld	a,(OFST+5,sp)
2333  01a6 43            	cpl	a
2334  01a7 f4            	and	a,(x)
2335  01a8 f7            	ld	(x),a
2336  01a9               L1221:
2337                     ; 847 }
2340  01a9 85            	popw	x
2341  01aa 81            	ret
2446                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2446                     ; 860 {
2447                     	switch	.text
2448  01ab               _ADC_GetFlagStatus:
2450  01ab 89            	pushw	x
2451  01ac 88            	push	a
2452       00000001      OFST:	set	1
2455                     ; 861   FlagStatus flagstatus = RESET;
2457  01ad 0f01          	clr	(OFST+0,sp)
2458                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2460                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2462  01af e603          	ld	a,(3,x)
2463  01b1 1506          	bcp	a,(OFST+5,sp)
2464  01b3 2706          	jreq	L5721
2465                     ; 870     flagstatus = SET;
2467  01b5 a601          	ld	a,#1
2468  01b7 6b01          	ld	(OFST+0,sp),a
2470  01b9 2002          	jra	L7721
2471  01bb               L5721:
2472                     ; 875     flagstatus = RESET;
2474  01bb 0f01          	clr	(OFST+0,sp)
2475  01bd               L7721:
2476                     ; 879   return  flagstatus;
2478  01bd 7b01          	ld	a,(OFST+0,sp)
2481  01bf 5b03          	addw	sp,#3
2482  01c1 81            	ret
2529                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2529                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2529                     ; 894 {
2530                     	switch	.text
2531  01c2               _ADC_ClearFlag:
2533  01c2 89            	pushw	x
2534       00000000      OFST:	set	0
2537                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2539                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2541  01c3 7b05          	ld	a,(OFST+5,sp)
2542  01c5 43            	cpl	a
2543  01c6 1e01          	ldw	x,(OFST+1,sp)
2544  01c8 e703          	ld	(3,x),a
2545                     ; 900 }
2548  01ca 85            	popw	x
2549  01cb 81            	ret
2621                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2621                     ; 913                          ADC_IT_TypeDef ADC_IT)
2621                     ; 914 {
2622                     	switch	.text
2623  01cc               _ADC_GetITStatus:
2625  01cc 89            	pushw	x
2626  01cd 5203          	subw	sp,#3
2627       00000003      OFST:	set	3
2630                     ; 915   ITStatus itstatus = RESET;
2632  01cf 7b03          	ld	a,(OFST+0,sp)
2633  01d1 97            	ld	xl,a
2634                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2636  01d2 7b03          	ld	a,(OFST+0,sp)
2637  01d4 97            	ld	xl,a
2640  01d5 7b02          	ld	a,(OFST-1,sp)
2641  01d7 97            	ld	xl,a
2642                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2644                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2646  01d8 7b08          	ld	a,(OFST+5,sp)
2647  01da 44            	srl	a
2648  01db 44            	srl	a
2649  01dc 44            	srl	a
2650  01dd 6b03          	ld	(OFST+0,sp),a
2651                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2651                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2653  01df 7b03          	ld	a,(OFST+0,sp)
2654  01e1 a403          	and	a,#3
2655  01e3 6b01          	ld	(OFST-2,sp),a
2656  01e5 7b03          	ld	a,(OFST+0,sp)
2657  01e7 a410          	and	a,#16
2658  01e9 44            	srl	a
2659  01ea 44            	srl	a
2660  01eb 1a01          	or	a,(OFST-2,sp)
2661  01ed 6b03          	ld	(OFST+0,sp),a
2662                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2664  01ef 1e04          	ldw	x,(OFST+1,sp)
2665  01f1 f6            	ld	a,(x)
2666  01f2 1408          	and	a,(OFST+5,sp)
2667  01f4 6b02          	ld	(OFST-1,sp),a
2668                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2670  01f6 1e04          	ldw	x,(OFST+1,sp)
2671  01f8 e603          	ld	a,(3,x)
2672  01fa 1503          	bcp	a,(OFST+0,sp)
2673  01fc 270a          	jreq	L1631
2675  01fe 0d02          	tnz	(OFST-1,sp)
2676  0200 2706          	jreq	L1631
2677                     ; 933     itstatus = SET;
2679  0202 a601          	ld	a,#1
2680  0204 6b03          	ld	(OFST+0,sp),a
2682  0206 2002          	jra	L3631
2683  0208               L1631:
2684                     ; 938     itstatus = RESET;
2686  0208 0f03          	clr	(OFST+0,sp)
2687  020a               L3631:
2688                     ; 942   return  itstatus;
2690  020a 7b03          	ld	a,(OFST+0,sp)
2693  020c 5b05          	addw	sp,#5
2694  020e 81            	ret
2749                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2749                     ; 956                            ADC_IT_TypeDef ADC_IT)
2749                     ; 957 {
2750                     	switch	.text
2751  020f               _ADC_ClearITPendingBit:
2753  020f 89            	pushw	x
2754  0210 89            	pushw	x
2755       00000002      OFST:	set	2
2758                     ; 958   uint8_t itmask = 0;
2760  0211 0f02          	clr	(OFST+0,sp)
2761                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2763                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2765  0213 7b07          	ld	a,(OFST+5,sp)
2766  0215 44            	srl	a
2767  0216 44            	srl	a
2768  0217 44            	srl	a
2769  0218 6b02          	ld	(OFST+0,sp),a
2770                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2770                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2772  021a 7b02          	ld	a,(OFST+0,sp)
2773  021c a403          	and	a,#3
2774  021e 6b01          	ld	(OFST-1,sp),a
2775  0220 7b02          	ld	a,(OFST+0,sp)
2776  0222 a410          	and	a,#16
2777  0224 44            	srl	a
2778  0225 44            	srl	a
2779  0226 1a01          	or	a,(OFST-1,sp)
2780  0228 6b02          	ld	(OFST+0,sp),a
2781                     ; 969   ADCx->SR = (uint8_t)~itmask;
2783  022a 7b02          	ld	a,(OFST+0,sp)
2784  022c 43            	cpl	a
2785  022d 1e03          	ldw	x,(OFST+1,sp)
2786  022f e703          	ld	(3,x),a
2787                     ; 970 }
2790  0231 5b04          	addw	sp,#4
2791  0233 81            	ret
2804                     	xdef	_ADC_ClearITPendingBit
2805                     	xdef	_ADC_GetITStatus
2806                     	xdef	_ADC_ClearFlag
2807                     	xdef	_ADC_GetFlagStatus
2808                     	xdef	_ADC_ITConfig
2809                     	xdef	_ADC_DMACmd
2810                     	xdef	_ADC_GetConversionValue
2811                     	xdef	_ADC_SchmittTriggerConfig
2812                     	xdef	_ADC_SamplingTimeConfig
2813                     	xdef	_ADC_ChannelCmd
2814                     	xdef	_ADC_VrefintCmd
2815                     	xdef	_ADC_TempSensorCmd
2816                     	xdef	_ADC_AnalogWatchdogConfig
2817                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2818                     	xdef	_ADC_AnalogWatchdogChannelSelect
2819                     	xdef	_ADC_ExternalTrigConfig
2820                     	xdef	_ADC_SoftwareStartConv
2821                     	xdef	_ADC_Cmd
2822                     	xdef	_ADC_Init
2823                     	xdef	_ADC_DeInit
2842                     	end
