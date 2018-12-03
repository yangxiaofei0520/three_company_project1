   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  99                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
  99                     ; 97 {
 101                     	switch	.text
 102  0000               _GPIO_DeInit:
 106                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 108  0000 6f04          	clr	(4,x)
 109                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 111  0002 7f            	clr	(x)
 112                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 114  0003 6f02          	clr	(2,x)
 115                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 117  0005 6f03          	clr	(3,x)
 118                     ; 102 }
 121  0007 81            	ret	
 275                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 275                     ; 134 {
 276                     	switch	.text
 277  0008               _GPIO_Init:
 279  0008 89            	pushw	x
 280       00000000      OFST:	set	0
 283                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 285                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 287                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 289  0009 7b05          	ld	a,(OFST+5,sp)
 290  000b 43            	cpl	a
 291  000c e404          	and	a,(4,x)
 292  000e e704          	ld	(4,x),a
 293                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 295  0010 7b06          	ld	a,(OFST+6,sp)
 296  0012 2a18          	jrpl	L341
 297                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 299  0014 a510          	bcp	a,#16
 300  0016 2705          	jreq	L541
 301                     ; 153       GPIOx->ODR |= GPIO_Pin;
 303  0018 f6            	ld	a,(x)
 304  0019 1a05          	or	a,(OFST+5,sp)
 306  001b 2006          	jra	L741
 307  001d               L541:
 308                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 310  001d 1e01          	ldw	x,(OFST+1,sp)
 311  001f 7b05          	ld	a,(OFST+5,sp)
 312  0021 43            	cpl	a
 313  0022 f4            	and	a,(x)
 314  0023               L741:
 315  0023 f7            	ld	(x),a
 316                     ; 159     GPIOx->DDR |= GPIO_Pin;
 318  0024 1e01          	ldw	x,(OFST+1,sp)
 319  0026 e602          	ld	a,(2,x)
 320  0028 1a05          	or	a,(OFST+5,sp)
 322  002a 2007          	jra	L151
 323  002c               L341:
 324                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 326  002c 1e01          	ldw	x,(OFST+1,sp)
 327  002e 7b05          	ld	a,(OFST+5,sp)
 328  0030 43            	cpl	a
 329  0031 e402          	and	a,(2,x)
 330  0033               L151:
 331  0033 e702          	ld	(2,x),a
 332                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 334  0035 7b06          	ld	a,(OFST+6,sp)
 335  0037 a540          	bcp	a,#64
 336  0039 2706          	jreq	L351
 337                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 339  003b e603          	ld	a,(3,x)
 340  003d 1a05          	or	a,(OFST+5,sp)
 342  003f 2005          	jra	L551
 343  0041               L351:
 344                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 346  0041 7b05          	ld	a,(OFST+5,sp)
 347  0043 43            	cpl	a
 348  0044 e403          	and	a,(3,x)
 349  0046               L551:
 350  0046 e703          	ld	(3,x),a
 351                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 353  0048 7b06          	ld	a,(OFST+6,sp)
 354  004a a520          	bcp	a,#32
 355  004c 2706          	jreq	L751
 356                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 358  004e e604          	ld	a,(4,x)
 359  0050 1a05          	or	a,(OFST+5,sp)
 361  0052 2005          	jra	L161
 362  0054               L751:
 363                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 365  0054 7b05          	ld	a,(OFST+5,sp)
 366  0056 43            	cpl	a
 367  0057 e404          	and	a,(4,x)
 368  0059               L161:
 369  0059 e704          	ld	(4,x),a
 370                     ; 190 }
 373  005b 85            	popw	x
 374  005c 81            	ret	
 449                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 449                     ; 210 {
 450                     	switch	.text
 451  005d               _GPIO_ExternalPullUpConfig:
 453  005d 89            	pushw	x
 454       00000000      OFST:	set	0
 457                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 459                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 461                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 463  005e 7b06          	ld	a,(OFST+6,sp)
 464  0060 2706          	jreq	L122
 465                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 467  0062 e603          	ld	a,(3,x)
 468  0064 1a05          	or	a,(OFST+5,sp)
 470  0066 2007          	jra	L322
 471  0068               L122:
 472                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 474  0068 1e01          	ldw	x,(OFST+1,sp)
 475  006a 7b05          	ld	a,(OFST+5,sp)
 476  006c 43            	cpl	a
 477  006d e403          	and	a,(3,x)
 478  006f               L322:
 479  006f e703          	ld	(3,x),a
 480                     ; 222 }
 483  0071 85            	popw	x
 484  0072 81            	ret	
 528                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 528                     ; 249 {
 529                     	switch	.text
 530  0073               _GPIO_Write:
 532  0073 89            	pushw	x
 533       00000000      OFST:	set	0
 536                     ; 250   GPIOx->ODR = GPIO_PortVal;
 538  0074 7b05          	ld	a,(OFST+5,sp)
 539  0076 1e01          	ldw	x,(OFST+1,sp)
 540  0078 f7            	ld	(x),a
 541                     ; 251 }
 544  0079 85            	popw	x
 545  007a 81            	ret	
 705                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 705                     ; 271 {
 706                     	switch	.text
 707  007b               _GPIO_WriteBit:
 709  007b 89            	pushw	x
 710       00000000      OFST:	set	0
 713                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 715                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 717                     ; 276   if (GPIO_BitVal != RESET)
 719  007c 7b06          	ld	a,(OFST+6,sp)
 720  007e 2705          	jreq	L143
 721                     ; 278     GPIOx->ODR |= GPIO_Pin;
 723  0080 f6            	ld	a,(x)
 724  0081 1a05          	or	a,(OFST+5,sp)
 726  0083 2006          	jra	L343
 727  0085               L143:
 728                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 730  0085 1e01          	ldw	x,(OFST+1,sp)
 731  0087 7b05          	ld	a,(OFST+5,sp)
 732  0089 43            	cpl	a
 733  008a f4            	and	a,(x)
 734  008b               L343:
 735  008b f7            	ld	(x),a
 736                     ; 285 }
 739  008c 85            	popw	x
 740  008d 81            	ret	
 784                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 784                     ; 304 {
 785                     	switch	.text
 786  008e               _GPIO_SetBits:
 788  008e 89            	pushw	x
 789       00000000      OFST:	set	0
 792                     ; 305   GPIOx->ODR |= GPIO_Pin;
 794  008f f6            	ld	a,(x)
 795  0090 1a05          	or	a,(OFST+5,sp)
 796  0092 f7            	ld	(x),a
 797                     ; 306 }
 800  0093 85            	popw	x
 801  0094 81            	ret	
 845                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 845                     ; 325 {
 846                     	switch	.text
 847  0095               _GPIO_ResetBits:
 849  0095 89            	pushw	x
 850       00000000      OFST:	set	0
 853                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 855  0096 7b05          	ld	a,(OFST+5,sp)
 856  0098 43            	cpl	a
 857  0099 f4            	and	a,(x)
 858  009a f7            	ld	(x),a
 859                     ; 327 }
 862  009b 85            	popw	x
 863  009c 81            	ret	
 907                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 907                     ; 337 {
 908                     	switch	.text
 909  009d               _GPIO_ToggleBits:
 911  009d 89            	pushw	x
 912       00000000      OFST:	set	0
 915                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 917  009e f6            	ld	a,(x)
 918  009f 1805          	xor	a,(OFST+5,sp)
 919  00a1 f7            	ld	(x),a
 920                     ; 339 }
 923  00a2 85            	popw	x
 924  00a3 81            	ret	
 961                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 961                     ; 348 {
 962                     	switch	.text
 963  00a4               _GPIO_ReadInputData:
 967                     ; 349   return ((uint8_t)GPIOx->IDR);
 969  00a4 e601          	ld	a,(1,x)
 972  00a6 81            	ret	
1010                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1010                     ; 359 {
1011                     	switch	.text
1012  00a7               _GPIO_ReadOutputData:
1016                     ; 360   return ((uint8_t)GPIOx->ODR);
1018  00a7 f6            	ld	a,(x)
1021  00a8 81            	ret	
1070                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1070                     ; 379 {
1071                     	switch	.text
1072  00a9               _GPIO_ReadInputDataBit:
1074  00a9 89            	pushw	x
1075       00000000      OFST:	set	0
1078                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1080  00aa e601          	ld	a,(1,x)
1081  00ac 1405          	and	a,(OFST+5,sp)
1084  00ae 85            	popw	x
1085  00af 81            	ret	
1134                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1134                     ; 390 {
1135                     	switch	.text
1136  00b0               _GPIO_ReadOutputDataBit:
1138  00b0 89            	pushw	x
1139       00000000      OFST:	set	0
1142                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1144  00b1 f6            	ld	a,(x)
1145  00b2 1405          	and	a,(OFST+5,sp)
1148  00b4 85            	popw	x
1149  00b5 81            	ret	
1162                     	xdef	_GPIO_ReadOutputDataBit
1163                     	xdef	_GPIO_ReadInputDataBit
1164                     	xdef	_GPIO_ReadOutputData
1165                     	xdef	_GPIO_ReadInputData
1166                     	xdef	_GPIO_ToggleBits
1167                     	xdef	_GPIO_ResetBits
1168                     	xdef	_GPIO_SetBits
1169                     	xdef	_GPIO_WriteBit
1170                     	xdef	_GPIO_Write
1171                     	xdef	_GPIO_ExternalPullUpConfig
1172                     	xdef	_GPIO_Init
1173                     	xdef	_GPIO_DeInit
1192                     	end
