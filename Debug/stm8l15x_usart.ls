   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 152                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 152                     ; 149 {
 154                     	switch	.text
 155  0000               _USART_DeInit:
 157  0000 89            	pushw	x
 158       00000000      OFST:	set	0
 161                     ; 153   (void) USARTx->SR;
 163  0001 f6            	ld	a,(x)
 164  0002 97            	ld	xl,a
 165                     ; 154   (void) USARTx->DR;
 167  0003 1e01          	ldw	x,(OFST+1,sp)
 168  0005 e601          	ld	a,(1,x)
 169  0007 97            	ld	xl,a
 170                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 172  0008 1e01          	ldw	x,(OFST+1,sp)
 173  000a 6f03          	clr	(3,x)
 174                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 176  000c 1e01          	ldw	x,(OFST+1,sp)
 177  000e 6f02          	clr	(2,x)
 178                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 180  0010 1e01          	ldw	x,(OFST+1,sp)
 181  0012 6f04          	clr	(4,x)
 182                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 184  0014 1e01          	ldw	x,(OFST+1,sp)
 185  0016 6f05          	clr	(5,x)
 186                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 188  0018 1e01          	ldw	x,(OFST+1,sp)
 189  001a 6f06          	clr	(6,x)
 190                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 192  001c 1e01          	ldw	x,(OFST+1,sp)
 193  001e 6f07          	clr	(7,x)
 194                     ; 163 }
 197  0020 85            	popw	x
 198  0021 81            	ret
 386                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 386                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 386                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 386                     ; 195 {
 387                     	switch	.text
 388  0022               _USART_Init:
 390  0022 89            	pushw	x
 391  0023 5204          	subw	sp,#4
 392       00000004      OFST:	set	4
 395                     ; 196   uint32_t BaudRate_Mantissa = 0;
 397  0025 ae0000        	ldw	x,#0
 398  0028 1f03          	ldw	(OFST-1,sp),x
 399  002a ae0000        	ldw	x,#0
 400  002d 1f01          	ldw	(OFST-3,sp),x
 401                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 403                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 405                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 407                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 409                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 411                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 413  002f 1e05          	ldw	x,(OFST+1,sp)
 414  0031 e604          	ld	a,(4,x)
 415  0033 a4e9          	and	a,#233
 416  0035 e704          	ld	(4,x),a
 417                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 419  0037 1e05          	ldw	x,(OFST+1,sp)
 420  0039 7b0d          	ld	a,(OFST+9,sp)
 421  003b 1a0f          	or	a,(OFST+11,sp)
 422  003d ea04          	or	a,(4,x)
 423  003f e704          	ld	(4,x),a
 424                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 426  0041 1e05          	ldw	x,(OFST+1,sp)
 427  0043 e606          	ld	a,(6,x)
 428  0045 a4cf          	and	a,#207
 429  0047 e706          	ld	(6,x),a
 430                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 432  0049 1e05          	ldw	x,(OFST+1,sp)
 433  004b e606          	ld	a,(6,x)
 434  004d 1a0e          	or	a,(OFST+10,sp)
 435  004f e706          	ld	(6,x),a
 436                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 438  0051 1e05          	ldw	x,(OFST+1,sp)
 439  0053 6f02          	clr	(2,x)
 440                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 442  0055 1e05          	ldw	x,(OFST+1,sp)
 443  0057 e603          	ld	a,(3,x)
 444  0059 a40f          	and	a,#15
 445  005b e703          	ld	(3,x),a
 446                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 448  005d 1e05          	ldw	x,(OFST+1,sp)
 449  005f e603          	ld	a,(3,x)
 450  0061 a4f0          	and	a,#240
 451  0063 e703          	ld	(3,x),a
 452                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 454  0065 cd0000        	call	_CLK_GetClockFreq
 456  0068 96            	ldw	x,sp
 457  0069 1c0009        	addw	x,#OFST+5
 458  006c cd0000        	call	c_ludv
 460  006f 96            	ldw	x,sp
 461  0070 1c0001        	addw	x,#OFST-3
 462  0073 cd0000        	call	c_rtol
 464                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 466  0076 7b03          	ld	a,(OFST-1,sp)
 467  0078 a4f0          	and	a,#240
 468  007a 1e05          	ldw	x,(OFST+1,sp)
 469  007c e703          	ld	(3,x),a
 470                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 472  007e 1e05          	ldw	x,(OFST+1,sp)
 473  0080 7b04          	ld	a,(OFST+0,sp)
 474  0082 a40f          	and	a,#15
 475  0084 ea03          	or	a,(3,x)
 476  0086 e703          	ld	(3,x),a
 477                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 479  0088 96            	ldw	x,sp
 480  0089 1c0001        	addw	x,#OFST-3
 481  008c cd0000        	call	c_ltor
 483  008f a604          	ld	a,#4
 484  0091 cd0000        	call	c_lursh
 486  0094 b603          	ld	a,c_lreg+3
 487  0096 1e05          	ldw	x,(OFST+1,sp)
 488  0098 e702          	ld	(2,x),a
 489                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 491  009a 1e05          	ldw	x,(OFST+1,sp)
 492  009c e605          	ld	a,(5,x)
 493  009e a4f3          	and	a,#243
 494  00a0 e705          	ld	(5,x),a
 495                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 497  00a2 1e05          	ldw	x,(OFST+1,sp)
 498  00a4 e605          	ld	a,(5,x)
 499  00a6 1a10          	or	a,(OFST+12,sp)
 500  00a8 e705          	ld	(5,x),a
 501                     ; 239 }
 504  00aa 5b06          	addw	sp,#6
 505  00ac 81            	ret
 665                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 665                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 665                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 665                     ; 267 {
 666                     	switch	.text
 667  00ad               _USART_ClockInit:
 669  00ad 89            	pushw	x
 670       00000000      OFST:	set	0
 673                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 675                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 677                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 679                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 681                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 683  00ae e606          	ld	a,(6,x)
 684  00b0 a4f8          	and	a,#248
 685  00b2 e706          	ld	(6,x),a
 686                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 688  00b4 7b06          	ld	a,(OFST+6,sp)
 689  00b6 1a07          	or	a,(OFST+7,sp)
 690  00b8 1a08          	or	a,(OFST+8,sp)
 691  00ba ea06          	or	a,(6,x)
 692  00bc e706          	ld	(6,x),a
 693                     ; 279   if (USART_Clock != USART_Clock_Disable)
 695  00be 0d05          	tnz	(OFST+5,sp)
 696  00c0 2708          	jreq	L123
 697                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 699  00c2 e606          	ld	a,(6,x)
 700  00c4 aa08          	or	a,#8
 701  00c6 e706          	ld	(6,x),a
 703  00c8 2008          	jra	L323
 704  00ca               L123:
 705                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 707  00ca 1e01          	ldw	x,(OFST+1,sp)
 708  00cc e606          	ld	a,(6,x)
 709  00ce a4f7          	and	a,#247
 710  00d0 e706          	ld	(6,x),a
 711  00d2               L323:
 712                     ; 287 }
 715  00d2 85            	popw	x
 716  00d3 81            	ret
 783                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 783                     ; 297 {
 784                     	switch	.text
 785  00d4               _USART_Cmd:
 787  00d4 89            	pushw	x
 788       00000000      OFST:	set	0
 791                     ; 298   if (NewState != DISABLE)
 793  00d5 0d05          	tnz	(OFST+5,sp)
 794  00d7 2708          	jreq	L163
 795                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 797  00d9 e604          	ld	a,(4,x)
 798  00db a4df          	and	a,#223
 799  00dd e704          	ld	(4,x),a
 801  00df 2008          	jra	L363
 802  00e1               L163:
 803                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 805  00e1 1e01          	ldw	x,(OFST+1,sp)
 806  00e3 e604          	ld	a,(4,x)
 807  00e5 aa20          	or	a,#32
 808  00e7 e704          	ld	(4,x),a
 809  00e9               L363:
 810                     ; 306 }
 813  00e9 85            	popw	x
 814  00ea 81            	ret
 858                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 858                     ; 330 {
 859                     	switch	.text
 860  00eb               _USART_SetPrescaler:
 862  00eb 89            	pushw	x
 863       00000000      OFST:	set	0
 866                     ; 332   USARTx->PSCR = USART_Prescaler;
 868  00ec 7b05          	ld	a,(OFST+5,sp)
 869  00ee 1e01          	ldw	x,(OFST+1,sp)
 870  00f0 e70a          	ld	(10,x),a
 871                     ; 333 }
 874  00f2 85            	popw	x
 875  00f3 81            	ret
 912                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 912                     ; 341 {
 913                     	switch	.text
 914  00f4               _USART_SendBreak:
 918                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 920  00f4 e605          	ld	a,(5,x)
 921  00f6 aa01          	or	a,#1
 922  00f8 e705          	ld	(5,x),a
 923                     ; 343 }
 926  00fa 81            	ret
 963                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 963                     ; 383 {
 964                     	switch	.text
 965  00fb               _USART_ReceiveData8:
 969                     ; 384   return USARTx->DR;
 971  00fb e601          	ld	a,(1,x)
 974  00fd 81            	ret
1018                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1018                     ; 393 {
1019                     	switch	.text
1020  00fe               _USART_ReceiveData9:
1022  00fe 89            	pushw	x
1023  00ff 89            	pushw	x
1024       00000002      OFST:	set	2
1027                     ; 394   uint16_t temp = 0;
1029  0100 5f            	clrw	x
1030  0101 1f01          	ldw	(OFST-1,sp),x
1031                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1033  0103 1e03          	ldw	x,(OFST+1,sp)
1034  0105 e604          	ld	a,(4,x)
1035  0107 5f            	clrw	x
1036  0108 a480          	and	a,#128
1037  010a 5f            	clrw	x
1038  010b 02            	rlwa	x,a
1039  010c 58            	sllw	x
1040  010d 1f01          	ldw	(OFST-1,sp),x
1041                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1043  010f 1e03          	ldw	x,(OFST+1,sp)
1044  0111 e601          	ld	a,(1,x)
1045  0113 5f            	clrw	x
1046  0114 97            	ld	xl,a
1047  0115 01            	rrwa	x,a
1048  0116 1a02          	or	a,(OFST+0,sp)
1049  0118 01            	rrwa	x,a
1050  0119 1a01          	or	a,(OFST-1,sp)
1051  011b 01            	rrwa	x,a
1052  011c 01            	rrwa	x,a
1053  011d a4ff          	and	a,#255
1054  011f 01            	rrwa	x,a
1055  0120 a401          	and	a,#1
1056  0122 01            	rrwa	x,a
1059  0123 5b04          	addw	sp,#4
1060  0125 81            	ret
1104                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1104                     ; 406 {
1105                     	switch	.text
1106  0126               _USART_SendData8:
1108  0126 89            	pushw	x
1109       00000000      OFST:	set	0
1112                     ; 408   USARTx->DR = Data;
1114  0127 7b05          	ld	a,(OFST+5,sp)
1115  0129 1e01          	ldw	x,(OFST+1,sp)
1116  012b e701          	ld	(1,x),a
1117                     ; 409 }
1120  012d 85            	popw	x
1121  012e 81            	ret
1165                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1165                     ; 419 {
1166                     	switch	.text
1167  012f               _USART_SendData9:
1169  012f 89            	pushw	x
1170       00000000      OFST:	set	0
1173                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1175                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1177  0130 e604          	ld	a,(4,x)
1178  0132 a4bf          	and	a,#191
1179  0134 e704          	ld	(4,x),a
1180                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1182  0136 1605          	ldw	y,(OFST+5,sp)
1183  0138 9054          	srlw	y
1184  013a 9054          	srlw	y
1185  013c 909f          	ld	a,yl
1186  013e a440          	and	a,#64
1187  0140 ea04          	or	a,(4,x)
1188  0142 e704          	ld	(4,x),a
1189                     ; 429   USARTx->DR   = (uint8_t)(Data);
1191  0144 7b06          	ld	a,(OFST+6,sp)
1192  0146 1e01          	ldw	x,(OFST+1,sp)
1193  0148 e701          	ld	(1,x),a
1194                     ; 430 }
1197  014a 85            	popw	x
1198  014b 81            	ret
1246                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1246                     ; 474 {
1247                     	switch	.text
1248  014c               _USART_ReceiverWakeUpCmd:
1250  014c 89            	pushw	x
1251       00000000      OFST:	set	0
1254                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1256                     ; 477   if (NewState != DISABLE)
1258  014d 0d05          	tnz	(OFST+5,sp)
1259  014f 2708          	jreq	L165
1260                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1262  0151 e605          	ld	a,(5,x)
1263  0153 aa02          	or	a,#2
1264  0155 e705          	ld	(5,x),a
1266  0157 2008          	jra	L365
1267  0159               L165:
1268                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1270  0159 1e01          	ldw	x,(OFST+1,sp)
1271  015b e605          	ld	a,(5,x)
1272  015d a4fd          	and	a,#253
1273  015f e705          	ld	(5,x),a
1274  0161               L365:
1275                     ; 487 }
1278  0161 85            	popw	x
1279  0162 81            	ret
1323                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1323                     ; 497 {
1324                     	switch	.text
1325  0163               _USART_SetAddress:
1327  0163 89            	pushw	x
1328       00000000      OFST:	set	0
1331                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1333                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1335  0164 e607          	ld	a,(7,x)
1336  0166 a4f0          	and	a,#240
1337  0168 e707          	ld	(7,x),a
1338                     ; 504   USARTx->CR4 |= USART_Address;
1340  016a e607          	ld	a,(7,x)
1341  016c 1a05          	or	a,(OFST+5,sp)
1342  016e e707          	ld	(7,x),a
1343                     ; 505 }
1346  0170 85            	popw	x
1347  0171 81            	ret
1416                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1416                     ; 516 {
1417                     	switch	.text
1418  0172               _USART_WakeUpConfig:
1420  0172 89            	pushw	x
1421       00000000      OFST:	set	0
1424                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1426                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1428  0173 e604          	ld	a,(4,x)
1429  0175 a4f7          	and	a,#247
1430  0177 e704          	ld	(4,x),a
1431                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1433  0179 e604          	ld	a,(4,x)
1434  017b 1a05          	or	a,(OFST+5,sp)
1435  017d e704          	ld	(4,x),a
1436                     ; 521 }
1439  017f 85            	popw	x
1440  0180 81            	ret
1488                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1488                     ; 567 {
1489                     	switch	.text
1490  0181               _USART_HalfDuplexCmd:
1492  0181 89            	pushw	x
1493       00000000      OFST:	set	0
1496                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1498                     ; 570   if (NewState != DISABLE)
1500  0182 0d05          	tnz	(OFST+5,sp)
1501  0184 2708          	jreq	L766
1502                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1504  0186 e608          	ld	a,(8,x)
1505  0188 aa08          	or	a,#8
1506  018a e708          	ld	(8,x),a
1508  018c 2008          	jra	L176
1509  018e               L766:
1510                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1512  018e 1e01          	ldw	x,(OFST+1,sp)
1513  0190 e608          	ld	a,(8,x)
1514  0192 a4f7          	and	a,#247
1515  0194 e708          	ld	(8,x),a
1516  0196               L176:
1517                     ; 578 }
1520  0196 85            	popw	x
1521  0197 81            	ret
1568                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1568                     ; 645 {
1569                     	switch	.text
1570  0198               _USART_SmartCardCmd:
1572  0198 89            	pushw	x
1573       00000000      OFST:	set	0
1576                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1578                     ; 648   if (NewState != DISABLE)
1580  0199 0d05          	tnz	(OFST+5,sp)
1581  019b 2708          	jreq	L717
1582                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1584  019d e608          	ld	a,(8,x)
1585  019f aa20          	or	a,#32
1586  01a1 e708          	ld	(8,x),a
1588  01a3 2008          	jra	L127
1589  01a5               L717:
1590                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1592  01a5 1e01          	ldw	x,(OFST+1,sp)
1593  01a7 e608          	ld	a,(8,x)
1594  01a9 a4df          	and	a,#223
1595  01ab e708          	ld	(8,x),a
1596  01ad               L127:
1597                     ; 658 }
1600  01ad 85            	popw	x
1601  01ae 81            	ret
1649                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1649                     ; 668 {
1650                     	switch	.text
1651  01af               _USART_SmartCardNACKCmd:
1653  01af 89            	pushw	x
1654       00000000      OFST:	set	0
1657                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1659                     ; 671   if (NewState != DISABLE)
1661  01b0 0d05          	tnz	(OFST+5,sp)
1662  01b2 2708          	jreq	L747
1663                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1665  01b4 e608          	ld	a,(8,x)
1666  01b6 aa10          	or	a,#16
1667  01b8 e708          	ld	(8,x),a
1669  01ba 2008          	jra	L157
1670  01bc               L747:
1671                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1673  01bc 1e01          	ldw	x,(OFST+1,sp)
1674  01be e608          	ld	a,(8,x)
1675  01c0 a4ef          	and	a,#239
1676  01c2 e708          	ld	(8,x),a
1677  01c4               L157:
1678                     ; 681 }
1681  01c4 85            	popw	x
1682  01c5 81            	ret
1726                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1726                     ; 691 {
1727                     	switch	.text
1728  01c6               _USART_SetGuardTime:
1730  01c6 89            	pushw	x
1731       00000000      OFST:	set	0
1734                     ; 693   USARTx->GTR = USART_GuardTime;
1736  01c7 7b05          	ld	a,(OFST+5,sp)
1737  01c9 1e01          	ldw	x,(OFST+1,sp)
1738  01cb e709          	ld	(9,x),a
1739                     ; 694 }
1742  01cd 85            	popw	x
1743  01ce 81            	ret
1812                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1812                     ; 752 {
1813                     	switch	.text
1814  01cf               _USART_IrDAConfig:
1816  01cf 89            	pushw	x
1817       00000000      OFST:	set	0
1820                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1822                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1824  01d0 0d05          	tnz	(OFST+5,sp)
1825  01d2 2708          	jreq	L1301
1826                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1828  01d4 e608          	ld	a,(8,x)
1829  01d6 aa04          	or	a,#4
1830  01d8 e708          	ld	(8,x),a
1832  01da 2008          	jra	L3301
1833  01dc               L1301:
1834                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1836  01dc 1e01          	ldw	x,(OFST+1,sp)
1837  01de e608          	ld	a,(8,x)
1838  01e0 a4fb          	and	a,#251
1839  01e2 e708          	ld	(8,x),a
1840  01e4               L3301:
1841                     ; 763 }
1844  01e4 85            	popw	x
1845  01e5 81            	ret
1892                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1892                     ; 773 {
1893                     	switch	.text
1894  01e6               _USART_IrDACmd:
1896  01e6 89            	pushw	x
1897       00000000      OFST:	set	0
1900                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1902                     ; 778   if (NewState != DISABLE)
1904  01e7 0d05          	tnz	(OFST+5,sp)
1905  01e9 2708          	jreq	L1601
1906                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1908  01eb e608          	ld	a,(8,x)
1909  01ed aa02          	or	a,#2
1910  01ef e708          	ld	(8,x),a
1912  01f1 2008          	jra	L3601
1913  01f3               L1601:
1914                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1916  01f3 1e01          	ldw	x,(OFST+1,sp)
1917  01f5 e608          	ld	a,(8,x)
1918  01f7 a4fd          	and	a,#253
1919  01f9 e708          	ld	(8,x),a
1920  01fb               L3601:
1921                     ; 788 }
1924  01fb 85            	popw	x
1925  01fc 81            	ret
2002                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2002                     ; 819                   FunctionalState NewState)
2002                     ; 820 {
2003                     	switch	.text
2004  01fd               _USART_DMACmd:
2006  01fd 89            	pushw	x
2007       00000000      OFST:	set	0
2010                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2012                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2014                     ; 825   if (NewState != DISABLE)
2016  01fe 0d06          	tnz	(OFST+6,sp)
2017  0200 2708          	jreq	L5211
2018                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2020  0202 e608          	ld	a,(8,x)
2021  0204 1a05          	or	a,(OFST+5,sp)
2022  0206 e708          	ld	(8,x),a
2024  0208 2009          	jra	L7211
2025  020a               L5211:
2026                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2028  020a 1e01          	ldw	x,(OFST+1,sp)
2029  020c 7b05          	ld	a,(OFST+5,sp)
2030  020e 43            	cpl	a
2031  020f e408          	and	a,(8,x)
2032  0211 e708          	ld	(8,x),a
2033  0213               L7211:
2034                     ; 837 }
2037  0213 85            	popw	x
2038  0214 81            	ret
2178                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2178                     ; 940 {
2179                     	switch	.text
2180  0215               _USART_ITConfig:
2182  0215 89            	pushw	x
2183  0216 89            	pushw	x
2184       00000002      OFST:	set	2
2187                     ; 941   uint8_t usartreg, itpos = 0x00;
2189  0217 7b02          	ld	a,(OFST+0,sp)
2190  0219 97            	ld	xl,a
2191                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2193                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2195                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2197  021a 7b07          	ld	a,(OFST+5,sp)
2198  021c 6b01          	ld	(OFST-1,sp),a
2199                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2201  021e 7b08          	ld	a,(OFST+6,sp)
2202  0220 a40f          	and	a,#15
2203  0222 5f            	clrw	x
2204  0223 97            	ld	xl,a
2205  0224 a601          	ld	a,#1
2206  0226 5d            	tnzw	x
2207  0227 2704          	jreq	L65
2208  0229               L06:
2209  0229 48            	sll	a
2210  022a 5a            	decw	x
2211  022b 26fc          	jrne	L06
2212  022d               L65:
2213  022d 6b02          	ld	(OFST+0,sp),a
2214                     ; 950   if (NewState != DISABLE)
2216  022f 0d09          	tnz	(OFST+7,sp)
2217  0231 272a          	jreq	L3121
2218                     ; 953     if (usartreg == 0x01)
2220  0233 7b01          	ld	a,(OFST-1,sp)
2221  0235 a101          	cp	a,#1
2222  0237 260a          	jrne	L5121
2223                     ; 955       USARTx->CR1 |= itpos;
2225  0239 1e03          	ldw	x,(OFST+1,sp)
2226  023b e604          	ld	a,(4,x)
2227  023d 1a02          	or	a,(OFST+0,sp)
2228  023f e704          	ld	(4,x),a
2230  0241 2045          	jra	L5221
2231  0243               L5121:
2232                     ; 957     else if (usartreg == 0x05)
2234  0243 7b01          	ld	a,(OFST-1,sp)
2235  0245 a105          	cp	a,#5
2236  0247 260a          	jrne	L1221
2237                     ; 959       USARTx->CR5 |= itpos;
2239  0249 1e03          	ldw	x,(OFST+1,sp)
2240  024b e608          	ld	a,(8,x)
2241  024d 1a02          	or	a,(OFST+0,sp)
2242  024f e708          	ld	(8,x),a
2244  0251 2035          	jra	L5221
2245  0253               L1221:
2246                     ; 964       USARTx->CR2 |= itpos;
2248  0253 1e03          	ldw	x,(OFST+1,sp)
2249  0255 e605          	ld	a,(5,x)
2250  0257 1a02          	or	a,(OFST+0,sp)
2251  0259 e705          	ld	(5,x),a
2252  025b 202b          	jra	L5221
2253  025d               L3121:
2254                     ; 970     if (usartreg == 0x01)
2256  025d 7b01          	ld	a,(OFST-1,sp)
2257  025f a101          	cp	a,#1
2258  0261 260b          	jrne	L7221
2259                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2261  0263 1e03          	ldw	x,(OFST+1,sp)
2262  0265 7b02          	ld	a,(OFST+0,sp)
2263  0267 43            	cpl	a
2264  0268 e404          	and	a,(4,x)
2265  026a e704          	ld	(4,x),a
2267  026c 201a          	jra	L5221
2268  026e               L7221:
2269                     ; 974     else if (usartreg == 0x05)
2271  026e 7b01          	ld	a,(OFST-1,sp)
2272  0270 a105          	cp	a,#5
2273  0272 260b          	jrne	L3321
2274                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2276  0274 1e03          	ldw	x,(OFST+1,sp)
2277  0276 7b02          	ld	a,(OFST+0,sp)
2278  0278 43            	cpl	a
2279  0279 e408          	and	a,(8,x)
2280  027b e708          	ld	(8,x),a
2282  027d 2009          	jra	L5221
2283  027f               L3321:
2284                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2286  027f 1e03          	ldw	x,(OFST+1,sp)
2287  0281 7b02          	ld	a,(OFST+0,sp)
2288  0283 43            	cpl	a
2289  0284 e405          	and	a,(5,x)
2290  0286 e705          	ld	(5,x),a
2291  0288               L5221:
2292                     ; 984 }
2295  0288 5b04          	addw	sp,#4
2296  028a 81            	ret
2444                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2444                     ; 1003 {
2445                     	switch	.text
2446  028b               _USART_GetFlagStatus:
2448  028b 89            	pushw	x
2449  028c 88            	push	a
2450       00000001      OFST:	set	1
2453                     ; 1004   FlagStatus status = RESET;
2455  028d 0f01          	clr	(OFST+0,sp)
2456                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2458                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2460  028f 1e06          	ldw	x,(OFST+5,sp)
2461  0291 a30101        	cpw	x,#257
2462  0294 2612          	jrne	L5231
2463                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2465  0296 1e02          	ldw	x,(OFST+1,sp)
2466  0298 e605          	ld	a,(5,x)
2467  029a 1507          	bcp	a,(OFST+6,sp)
2468  029c 2706          	jreq	L7231
2469                     ; 1014       status = SET;
2471  029e a601          	ld	a,#1
2472  02a0 6b01          	ld	(OFST+0,sp),a
2474  02a2 2013          	jra	L3331
2475  02a4               L7231:
2476                     ; 1019       status = RESET;
2478  02a4 0f01          	clr	(OFST+0,sp)
2479  02a6 200f          	jra	L3331
2480  02a8               L5231:
2481                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2483  02a8 1e02          	ldw	x,(OFST+1,sp)
2484  02aa f6            	ld	a,(x)
2485  02ab 1507          	bcp	a,(OFST+6,sp)
2486  02ad 2706          	jreq	L5331
2487                     ; 1027       status = SET;
2489  02af a601          	ld	a,#1
2490  02b1 6b01          	ld	(OFST+0,sp),a
2492  02b3 2002          	jra	L3331
2493  02b5               L5331:
2494                     ; 1032       status = RESET;
2496  02b5 0f01          	clr	(OFST+0,sp)
2497  02b7               L3331:
2498                     ; 1036   return status;
2500  02b7 7b01          	ld	a,(OFST+0,sp)
2503  02b9 5b03          	addw	sp,#3
2504  02bb 81            	ret
2551                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2551                     ; 1061 {
2552                     	switch	.text
2553  02bc               _USART_ClearFlag:
2555  02bc 89            	pushw	x
2556       00000000      OFST:	set	0
2559                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2561                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2563  02bd 7b06          	ld	a,(OFST+6,sp)
2564  02bf 43            	cpl	a
2565  02c0 1e01          	ldw	x,(OFST+1,sp)
2566  02c2 f7            	ld	(x),a
2567                     ; 1066 }
2570  02c3 85            	popw	x
2571  02c4 81            	ret
2664                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2664                     ; 1084 {
2665                     	switch	.text
2666  02c5               _USART_GetITStatus:
2668  02c5 89            	pushw	x
2669  02c6 5203          	subw	sp,#3
2670       00000003      OFST:	set	3
2673                     ; 1085   ITStatus pendingbitstatus = RESET;
2675  02c8 7b03          	ld	a,(OFST+0,sp)
2676  02ca 97            	ld	xl,a
2677                     ; 1086   uint8_t temp = 0;
2679  02cb 7b01          	ld	a,(OFST-2,sp)
2680  02cd 97            	ld	xl,a
2681                     ; 1087   uint8_t itpos = 0;
2683  02ce 7b02          	ld	a,(OFST-1,sp)
2684  02d0 97            	ld	xl,a
2685                     ; 1088   uint8_t itmask1 = 0;
2687  02d1 7b03          	ld	a,(OFST+0,sp)
2688  02d3 97            	ld	xl,a
2689                     ; 1089   uint8_t itmask2 = 0;
2691  02d4 7b03          	ld	a,(OFST+0,sp)
2692  02d6 97            	ld	xl,a
2693                     ; 1090   uint8_t enablestatus = 0;
2695  02d7 7b03          	ld	a,(OFST+0,sp)
2696  02d9 97            	ld	xl,a
2697                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2699                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2701  02da 7b09          	ld	a,(OFST+6,sp)
2702  02dc a40f          	and	a,#15
2703  02de 5f            	clrw	x
2704  02df 97            	ld	xl,a
2705  02e0 a601          	ld	a,#1
2706  02e2 5d            	tnzw	x
2707  02e3 2704          	jreq	L07
2708  02e5               L27:
2709  02e5 48            	sll	a
2710  02e6 5a            	decw	x
2711  02e7 26fc          	jrne	L27
2712  02e9               L07:
2713  02e9 6b02          	ld	(OFST-1,sp),a
2714                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2716  02eb 7b09          	ld	a,(OFST+6,sp)
2717  02ed 4e            	swap	a
2718  02ee a40f          	and	a,#15
2719  02f0 6b03          	ld	(OFST+0,sp),a
2720                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2722  02f2 7b03          	ld	a,(OFST+0,sp)
2723  02f4 5f            	clrw	x
2724  02f5 97            	ld	xl,a
2725  02f6 a601          	ld	a,#1
2726  02f8 5d            	tnzw	x
2727  02f9 2704          	jreq	L47
2728  02fb               L67:
2729  02fb 48            	sll	a
2730  02fc 5a            	decw	x
2731  02fd 26fc          	jrne	L67
2732  02ff               L47:
2733  02ff 6b03          	ld	(OFST+0,sp),a
2734                     ; 1103   if (USART_IT == USART_IT_PE)
2736  0301 1e08          	ldw	x,(OFST+5,sp)
2737  0303 a30100        	cpw	x,#256
2738  0306 261d          	jrne	L7241
2739                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2741  0308 1e04          	ldw	x,(OFST+1,sp)
2742  030a e604          	ld	a,(4,x)
2743  030c 1403          	and	a,(OFST+0,sp)
2744  030e 6b03          	ld	(OFST+0,sp),a
2745                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2747  0310 1e04          	ldw	x,(OFST+1,sp)
2748  0312 f6            	ld	a,(x)
2749  0313 1502          	bcp	a,(OFST-1,sp)
2750  0315 270a          	jreq	L1341
2752  0317 0d03          	tnz	(OFST+0,sp)
2753  0319 2706          	jreq	L1341
2754                     ; 1112       pendingbitstatus = SET;
2756  031b a601          	ld	a,#1
2757  031d 6b03          	ld	(OFST+0,sp),a
2759  031f 204f          	jra	L5341
2760  0321               L1341:
2761                     ; 1117       pendingbitstatus = RESET;
2763  0321 0f03          	clr	(OFST+0,sp)
2764  0323 204b          	jra	L5341
2765  0325               L7241:
2766                     ; 1121   else if (USART_IT == USART_IT_OR)
2768  0325 1e08          	ldw	x,(OFST+5,sp)
2769  0327 a30235        	cpw	x,#565
2770  032a 2629          	jrne	L7341
2771                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2773  032c 1e04          	ldw	x,(OFST+1,sp)
2774  032e e605          	ld	a,(5,x)
2775  0330 1403          	and	a,(OFST+0,sp)
2776  0332 6b03          	ld	(OFST+0,sp),a
2777                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2779  0334 1e04          	ldw	x,(OFST+1,sp)
2780  0336 e608          	ld	a,(8,x)
2781  0338 a401          	and	a,#1
2782  033a 6b01          	ld	(OFST-2,sp),a
2783                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2785  033c 1e04          	ldw	x,(OFST+1,sp)
2786  033e f6            	ld	a,(x)
2787  033f 1502          	bcp	a,(OFST-1,sp)
2788  0341 270e          	jreq	L1441
2790  0343 0d03          	tnz	(OFST+0,sp)
2791  0345 2604          	jrne	L3441
2793  0347 0d01          	tnz	(OFST-2,sp)
2794  0349 2706          	jreq	L1441
2795  034b               L3441:
2796                     ; 1132       pendingbitstatus = SET;
2798  034b a601          	ld	a,#1
2799  034d 6b03          	ld	(OFST+0,sp),a
2801  034f 201f          	jra	L5341
2802  0351               L1441:
2803                     ; 1137       pendingbitstatus = RESET;
2805  0351 0f03          	clr	(OFST+0,sp)
2806  0353 201b          	jra	L5341
2807  0355               L7341:
2808                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2810  0355 1e04          	ldw	x,(OFST+1,sp)
2811  0357 e605          	ld	a,(5,x)
2812  0359 1403          	and	a,(OFST+0,sp)
2813  035b 6b03          	ld	(OFST+0,sp),a
2814                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2816  035d 1e04          	ldw	x,(OFST+1,sp)
2817  035f f6            	ld	a,(x)
2818  0360 1502          	bcp	a,(OFST-1,sp)
2819  0362 270a          	jreq	L1541
2821  0364 0d03          	tnz	(OFST+0,sp)
2822  0366 2706          	jreq	L1541
2823                     ; 1149       pendingbitstatus = SET;
2825  0368 a601          	ld	a,#1
2826  036a 6b03          	ld	(OFST+0,sp),a
2828  036c 2002          	jra	L5341
2829  036e               L1541:
2830                     ; 1154       pendingbitstatus = RESET;
2832  036e 0f03          	clr	(OFST+0,sp)
2833  0370               L5341:
2834                     ; 1159   return  pendingbitstatus;
2836  0370 7b03          	ld	a,(OFST+0,sp)
2839  0372 5b05          	addw	sp,#5
2840  0374 81            	ret
2878                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2878                     ; 1184 {
2879                     	switch	.text
2880  0375               _USART_ClearITPendingBit:
2884                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2886                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2888  0375 f6            	ld	a,(x)
2889  0376 a4bf          	and	a,#191
2890  0378 f7            	ld	(x),a
2891                     ; 1189 }
2894  0379 81            	ret
2907                     	xdef	_USART_ClearITPendingBit
2908                     	xdef	_USART_GetITStatus
2909                     	xdef	_USART_ClearFlag
2910                     	xdef	_USART_GetFlagStatus
2911                     	xdef	_USART_ITConfig
2912                     	xdef	_USART_DMACmd
2913                     	xdef	_USART_IrDACmd
2914                     	xdef	_USART_IrDAConfig
2915                     	xdef	_USART_SetGuardTime
2916                     	xdef	_USART_SmartCardNACKCmd
2917                     	xdef	_USART_SmartCardCmd
2918                     	xdef	_USART_HalfDuplexCmd
2919                     	xdef	_USART_SetAddress
2920                     	xdef	_USART_ReceiverWakeUpCmd
2921                     	xdef	_USART_WakeUpConfig
2922                     	xdef	_USART_ReceiveData9
2923                     	xdef	_USART_ReceiveData8
2924                     	xdef	_USART_SendData9
2925                     	xdef	_USART_SendData8
2926                     	xdef	_USART_SendBreak
2927                     	xdef	_USART_SetPrescaler
2928                     	xdef	_USART_Cmd
2929                     	xdef	_USART_ClockInit
2930                     	xdef	_USART_Init
2931                     	xdef	_USART_DeInit
2932                     	xref	_CLK_GetClockFreq
2933                     	xref.b	c_lreg
2952                     	xref	c_lursh
2953                     	xref	c_ltor
2954                     	xref	c_rtol
2955                     	xref	c_ludv
2956                     	end
