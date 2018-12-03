   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  68                     ; 174 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  68                     ; 175 {
  70                     	switch	.text
  71  0000               _FLASH_SetProgrammingTime:
  75                     ; 177   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  77                     ; 179   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  79  0000 72115050      	bres	20560,#0
  80                     ; 180   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  82  0004 ca5050        	or	a,20560
  83  0007 c75050        	ld	20560,a
  84                     ; 181 }
  87  000a 81            	ret	
 112                     ; 188 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 112                     ; 189 {
 113                     	switch	.text
 114  000b               _FLASH_GetProgrammingTime:
 118                     ; 190   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 120  000b c65050        	ld	a,20560
 121  000e a401          	and	a,#1
 124  0010 81            	ret	
 180                     ; 203 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 180                     ; 204 {
 181                     	switch	.text
 182  0011               _FLASH_PowerWaitModeConfig:
 186                     ; 206   assert_param(IS_FLASH_POWER(FLASH_Power));
 188                     ; 209   if(FLASH_Power != FLASH_Power_On)
 190  0011 4a            	dec	a
 191  0012 2705          	jreq	L57
 192                     ; 211     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 194  0014 72145050      	bset	20560,#2
 197  0018 81            	ret	
 198  0019               L57:
 199                     ; 216     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 201  0019 72155050      	bres	20560,#2
 202                     ; 218 }
 205  001d 81            	ret	
 228                     ; 259 void FLASH_DeInit(void)
 228                     ; 260 {
 229                     	switch	.text
 230  001e               _FLASH_DeInit:
 234                     ; 261   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 236  001e 725f5050      	clr	20560
 237                     ; 262   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 239  0022 725f5051      	clr	20561
 240                     ; 263   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 242  0026 35405054      	mov	20564,#64
 243                     ; 264   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 245  002a c65054        	ld	a,20564
 246                     ; 265 }
 249  002d 81            	ret	
 305                     ; 275 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 305                     ; 276 {
 306                     	switch	.text
 307  002e               _FLASH_Unlock:
 309  002e 88            	push	a
 310       00000000      OFST:	set	0
 313                     ; 278   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 315                     ; 281   if(FLASH_MemType == FLASH_MemType_Program)
 317  002f a1fd          	cp	a,#253
 318  0031 2608          	jrne	L731
 319                     ; 283     FLASH->PUKR = FLASH_RASS_KEY1;
 321  0033 35565052      	mov	20562,#86
 322                     ; 284     FLASH->PUKR = FLASH_RASS_KEY2;
 324  0037 35ae5052      	mov	20562,#174
 325  003b               L731:
 326                     ; 288   if(FLASH_MemType == FLASH_MemType_Data)
 328  003b 7b01          	ld	a,(OFST+1,sp)
 329  003d a1f7          	cp	a,#247
 330  003f 2608          	jrne	L141
 331                     ; 290     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 333  0041 35ae5053      	mov	20563,#174
 334                     ; 291     FLASH->DUKR = FLASH_RASS_KEY1;
 336  0045 35565053      	mov	20563,#86
 337  0049               L141:
 338                     ; 293 }
 341  0049 84            	pop	a
 342  004a 81            	ret	
 377                     ; 303 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 377                     ; 304 {
 378                     	switch	.text
 379  004b               _FLASH_Lock:
 383                     ; 306   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 385                     ; 309   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 387  004b c45054        	and	a,20564
 388  004e c75054        	ld	20564,a
 389                     ; 310 }
 392  0051 81            	ret	
 431                     ; 318 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 431                     ; 319 {
 432                     	switch	.text
 433  0052               _FLASH_ProgramByte:
 435       00000000      OFST:	set	0
 438                     ; 321   assert_param(IS_FLASH_ADDRESS(Address));
 440                     ; 323   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 442  0052 7b07          	ld	a,(OFST+7,sp)
 443  0054 1e05          	ldw	x,(OFST+5,sp)
 444  0056 f7            	ld	(x),a
 445                     ; 324 }
 448  0057 81            	ret	
 480                     ; 331 void FLASH_EraseByte(uint32_t Address)
 480                     ; 332 {
 481                     	switch	.text
 482  0058               _FLASH_EraseByte:
 484       00000000      OFST:	set	0
 487                     ; 334   assert_param(IS_FLASH_ADDRESS(Address));
 489                     ; 336   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 491  0058 1e05          	ldw	x,(OFST+5,sp)
 492  005a 7f            	clr	(x)
 493                     ; 337 }
 496  005b 81            	ret	
 535                     ; 345 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 535                     ; 346 {
 536                     	switch	.text
 537  005c               _FLASH_ProgramWord:
 539       00000000      OFST:	set	0
 542                     ; 348   assert_param(IS_FLASH_ADDRESS(Address));
 544                     ; 350   FLASH->CR2 |= FLASH_CR2_WPRG;
 546  005c 721c5051      	bset	20561,#6
 547                     ; 353   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 549  0060 7b07          	ld	a,(OFST+7,sp)
 550  0062 1e05          	ldw	x,(OFST+5,sp)
 551  0064 f7            	ld	(x),a
 552                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 554  0065 7b08          	ld	a,(OFST+8,sp)
 555  0067 e701          	ld	(1,x),a
 556                     ; 357   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 558  0069 7b09          	ld	a,(OFST+9,sp)
 559  006b e702          	ld	(2,x),a
 560                     ; 359   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 562  006d 7b0a          	ld	a,(OFST+10,sp)
 563  006f e703          	ld	(3,x),a
 564                     ; 360 }
 567  0071 81            	ret	
 599                     ; 367 uint8_t FLASH_ReadByte(uint32_t Address)
 599                     ; 368 {
 600                     	switch	.text
 601  0072               _FLASH_ReadByte:
 603       00000000      OFST:	set	0
 606                     ; 370   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 608  0072 1e05          	ldw	x,(OFST+5,sp)
 609  0074 f6            	ld	a,(x)
 612  0075 81            	ret	
 653                     ; 417 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 653                     ; 418 {
 654                     	switch	.text
 655  0076               _FLASH_ProgramOptionByte:
 657  0076 89            	pushw	x
 658       00000000      OFST:	set	0
 661                     ; 420   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 663                     ; 423   FLASH->CR2 |= FLASH_CR2_OPT;
 665  0077 721e5051      	bset	20561,#7
 666                     ; 426   *((PointerAttr uint8_t*)Address) = Data;
 668  007b 7b05          	ld	a,(OFST+5,sp)
 669  007d 1e01          	ldw	x,(OFST+1,sp)
 670  007f f7            	ld	(x),a
 671                     ; 428   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 673  0080 a6fd          	ld	a,#253
 674  0082 cd0194        	call	_FLASH_WaitForLastOperation
 676                     ; 431   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 678  0085 721f5051      	bres	20561,#7
 679                     ; 432 }
 682  0089 85            	popw	x
 683  008a 81            	ret	
 717                     ; 439 void FLASH_EraseOptionByte(uint16_t Address)
 717                     ; 440 {
 718                     	switch	.text
 719  008b               _FLASH_EraseOptionByte:
 723                     ; 442   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 725                     ; 445   FLASH->CR2 |= FLASH_CR2_OPT;
 727  008b 721e5051      	bset	20561,#7
 728                     ; 448   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 730  008f 7f            	clr	(x)
 731                     ; 450   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 733  0090 a6fd          	ld	a,#253
 734  0092 cd0194        	call	_FLASH_WaitForLastOperation
 736                     ; 453   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 738  0095 721f5051      	bres	20561,#7
 739                     ; 454 }
 742  0099 81            	ret	
 799                     ; 462 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 799                     ; 463 {
 800                     	switch	.text
 801  009a               _FLASH_GetReadOutProtectionStatus:
 803  009a 88            	push	a
 804       00000001      OFST:	set	1
 807                     ; 464   FunctionalState state = DISABLE;
 809  009b 0f01          	clr	(OFST+0,sp)
 810                     ; 466   if(OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 812  009d c64800        	ld	a,18432
 813  00a0 a1aa          	cp	a,#170
 814  00a2 2604          	jrne	L523
 815                     ; 469     state =  ENABLE;
 817  00a4 a601          	ld	a,#1
 819  00a6 2001          	jra	L723
 820  00a8               L523:
 821                     ; 474     state =  DISABLE;
 823  00a8 4f            	clr	a
 824  00a9               L723:
 825                     ; 477   return state;
 829  00a9 5b01          	addw	sp,#1
 830  00ab 81            	ret	
 862                     ; 485 uint16_t FLASH_GetBootSize(void)
 862                     ; 486 {
 863                     	switch	.text
 864  00ac               _FLASH_GetBootSize:
 866  00ac 89            	pushw	x
 867       00000002      OFST:	set	2
 870                     ; 487   uint16_t temp = 0;
 872                     ; 490   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 874  00ad c64802        	ld	a,18434
 875  00b0 97            	ld	xl,a
 876  00b1 4f            	clr	a
 877  00b2 02            	rlwa	x,a
 878  00b3 44            	srl	a
 879  00b4 56            	rrcw	x
 880                     ; 493   if(OPT->UBC > 0x7F)
 882  00b5 c64802        	ld	a,18434
 883  00b8 a180          	cp	a,#128
 884  00ba 2503          	jrult	L543
 885                     ; 495     temp = 8192;
 887  00bc ae2000        	ldw	x,#8192
 888  00bf               L543:
 889                     ; 499   return(temp);
 893  00bf 5b02          	addw	sp,#2
 894  00c1 81            	ret	
 926                     ; 508 uint16_t FLASH_GetCodeSize(void)
 926                     ; 509 {
 927                     	switch	.text
 928  00c2               _FLASH_GetCodeSize:
 930  00c2 89            	pushw	x
 931       00000002      OFST:	set	2
 934                     ; 510   uint16_t temp = 0;
 936                     ; 513   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 938  00c3 c64807        	ld	a,18439
 939  00c6 97            	ld	xl,a
 940  00c7 4f            	clr	a
 941  00c8 02            	rlwa	x,a
 942  00c9 44            	srl	a
 943  00ca 56            	rrcw	x
 944                     ; 516   if(OPT->PCODESIZE > 0x7F)
 946  00cb c64807        	ld	a,18439
 947  00ce a180          	cp	a,#128
 948  00d0 2503          	jrult	L363
 949                     ; 518     temp = 8192;
 951  00d2 ae2000        	ldw	x,#8192
 952  00d5               L363:
 953                     ; 522   return(temp);
 957  00d5 5b02          	addw	sp,#2
 958  00d7 81            	ret	
 993                     ; 547 void FLASH_ITConfig(FunctionalState NewState)
 993                     ; 548 {
 994                     	switch	.text
 995  00d8               _FLASH_ITConfig:
 999                     ; 550   assert_param(IS_FUNCTIONAL_STATE(NewState));
1001                     ; 552   if(NewState != DISABLE)
1003  00d8 4d            	tnz	a
1004  00d9 2705          	jreq	L304
1005                     ; 555     FLASH->CR1 |= FLASH_CR1_IE;
1007  00db 72125050      	bset	20560,#1
1010  00df 81            	ret	
1011  00e0               L304:
1012                     ; 560     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1014  00e0 72135050      	bres	20560,#1
1015                     ; 562 }
1018  00e4 81            	ret	
1127                     ; 576 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1127                     ; 577 {
1128                     	switch	.text
1129  00e5               _FLASH_GetFlagStatus:
1131  00e5 88            	push	a
1132       00000001      OFST:	set	1
1135                     ; 578   FlagStatus status = RESET;
1137  00e6 0f01          	clr	(OFST+0,sp)
1138                     ; 579   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1140                     ; 582   if((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1142  00e8 c45054        	and	a,20564
1143  00eb 2702          	jreq	L754
1144                     ; 584     status = SET; /* Flash_FLAG is set*/
1146  00ed a601          	ld	a,#1
1148  00ef               L754:
1149                     ; 588     status = RESET; /* Flash_FLAG is reset*/
1151                     ; 592   return status;
1155  00ef 5b01          	addw	sp,#1
1156  00f1 81            	ret	
1192                     ; 719 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1192                     ; 720 {
1193                     	switch	.text
1194  00f2               _FLASH_PowerRunModeConfig:
1198                     ; 722   assert_param(IS_FLASH_POWER(FLASH_Power));
1200                     ; 724   if(FLASH_Power != FLASH_Power_On)
1202  00f2 4a            	dec	a
1203  00f3 2705          	jreq	L105
1204                     ; 726     FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1206  00f5 72165050      	bset	20560,#3
1209  00f9 81            	ret	
1210  00fa               L105:
1211                     ; 730     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1213  00fa 72175050      	bres	20560,#3
1214                     ; 732 }
1217  00fe 81            	ret	
1281                     ; 745 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1281                     ; 746 {
1282                     	switch	.text
1283  00ff               _FLASH_GetPowerStatus:
1287                     ; 747   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1289  00ff c65050        	ld	a,20560
1290  0102 a40c          	and	a,#12
1293  0104 81            	ret	
1391                     ; 765 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1391                     ; 766                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1391                     ; 767 {
1392                     	switch	.text
1393  0105               _FLASH_ProgramBlock:
1395  0105 89            	pushw	x
1396  0106 5206          	subw	sp,#6
1397       00000006      OFST:	set	6
1400                     ; 768   uint16_t Count = 0;
1402                     ; 769   uint32_t startaddress = 0;
1404  0108 96            	ldw	x,sp
1405  0109 5c            	incw	x
1406  010a cd0000        	call	c_ltor
1408                     ; 772   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1410                     ; 773   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1412                     ; 774   if(FLASH_MemType == FLASH_MemType_Program)
1414  010d 7b0b          	ld	a,(OFST+5,sp)
1415  010f a1fd          	cp	a,#253
1416  0111 2605          	jrne	L575
1417                     ; 776     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1419                     ; 777     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1421  0113 ae8000        	ldw	x,#32768
1423  0116 2003          	jra	L775
1424  0118               L575:
1425                     ; 781     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1427                     ; 782     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1429  0118 ae1000        	ldw	x,#4096
1430  011b               L775:
1431  011b 1f03          	ldw	(OFST-3,sp),x
1432  011d 5f            	clrw	x
1433  011e 1f01          	ldw	(OFST-5,sp),x
1434                     ; 786   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1436  0120 1e07          	ldw	x,(OFST+1,sp)
1437  0122 a680          	ld	a,#128
1438  0124 cd0000        	call	c_cmulx
1440  0127 96            	ldw	x,sp
1441  0128 5c            	incw	x
1442  0129 cd0000        	call	c_lgadd
1444                     ; 789   if(FLASH_ProgMode == FLASH_ProgramMode_Standard)
1446  012c 7b0c          	ld	a,(OFST+6,sp)
1447  012e 2606          	jrne	L106
1448                     ; 792     FLASH->CR2 |= FLASH_CR2_PRG;
1450  0130 72105051      	bset	20561,#0
1452  0134 2004          	jra	L306
1453  0136               L106:
1454                     ; 797     FLASH->CR2 |= FLASH_CR2_FPRG;
1456  0136 72185051      	bset	20561,#4
1457  013a               L306:
1458                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1460  013a 5f            	clrw	x
1461  013b 1f05          	ldw	(OFST-1,sp),x
1462  013d               L506:
1463                     ; 803     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1465  013d 1e0d          	ldw	x,(OFST+7,sp)
1466  013f 72fb05        	addw	x,(OFST-1,sp)
1467  0142 f6            	ld	a,(x)
1468  0143 1e03          	ldw	x,(OFST-3,sp)
1469  0145 72fb05        	addw	x,(OFST-1,sp)
1470  0148 f7            	ld	(x),a
1471                     ; 801   for(Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1473  0149 1e05          	ldw	x,(OFST-1,sp)
1474  014b 5c            	incw	x
1475  014c 1f05          	ldw	(OFST-1,sp),x
1478  014e a30080        	cpw	x,#128
1479  0151 25ea          	jrult	L506
1480                     ; 805 }
1483  0153 5b08          	addw	sp,#8
1484  0155 81            	ret	
1543                     ; 817 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1543                     ; 818 {
1544                     	switch	.text
1545  0156               _FLASH_EraseBlock:
1547  0156 89            	pushw	x
1548  0157 5206          	subw	sp,#6
1549       00000006      OFST:	set	6
1552                     ; 819   uint32_t startaddress = 0;
1554  0159 96            	ldw	x,sp
1555  015a 1c0003        	addw	x,#OFST-3
1556  015d cd0000        	call	c_ltor
1558                     ; 829   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1560                     ; 830   if(FLASH_MemType == FLASH_MemType_Program)
1562  0160 7b0b          	ld	a,(OFST+5,sp)
1563  0162 a1fd          	cp	a,#253
1564  0164 2605          	jrne	L146
1565                     ; 832     assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1567                     ; 833     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1569  0166 ae8000        	ldw	x,#32768
1571  0169 2003          	jra	L346
1572  016b               L146:
1573                     ; 837     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1575                     ; 838     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1577  016b ae1000        	ldw	x,#4096
1578  016e               L346:
1579  016e 1f05          	ldw	(OFST-1,sp),x
1580  0170 5f            	clrw	x
1581  0171 1f03          	ldw	(OFST-3,sp),x
1582                     ; 844     pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1584  0173 1e07          	ldw	x,(OFST+1,sp)
1585  0175 a680          	ld	a,#128
1586  0177 cd0000        	call	c_cmulx
1588  017a 96            	ldw	x,sp
1589  017b 1c0003        	addw	x,#OFST-3
1590  017e cd0000        	call	c_ladd
1592  0181 be02          	ldw	x,c_lreg+2
1593  0183 1f01          	ldw	(OFST-5,sp),x
1594                     ; 851   FLASH->CR2 |= FLASH_CR2_ERASE;
1596  0185 721a5051      	bset	20561,#5
1597                     ; 855     *pwFlash = (uint32_t)0;  
1599  0189 4f            	clr	a
1600  018a e703          	ld	(3,x),a
1601  018c e702          	ld	(2,x),a
1602  018e e701          	ld	(1,x),a
1603  0190 f7            	ld	(x),a
1604                     ; 863 }
1607  0191 5b08          	addw	sp,#8
1608  0193 81            	ret	
1689                     ; 875 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1689                     ; 876 {
1690                     	switch	.text
1691  0194               _FLASH_WaitForLastOperation:
1693  0194 5203          	subw	sp,#3
1694       00000003      OFST:	set	3
1697                     ; 877   uint16_t timeout = OPERATION_TIMEOUT;
1699  0196 aeffff        	ldw	x,#65535
1700  0199 1f01          	ldw	(OFST-2,sp),x
1701                     ; 878   uint8_t flagstatus = 0x00;
1703  019b 0f03          	clr	(OFST+0,sp)
1704                     ; 881   if(FLASH_MemType == FLASH_MemType_Program)
1706  019d a1fd          	cp	a,#253
1707  019f 2620          	jrne	L717
1709  01a1 200a          	jra	L507
1710  01a3               L307:
1711                     ; 885       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1711                     ; 886                                                       FLASH_IAPSR_WR_PG_DIS));
1713  01a3 c65054        	ld	a,20564
1714  01a6 a405          	and	a,#5
1715  01a8 6b03          	ld	(OFST+0,sp),a
1716                     ; 887       timeout--;
1718  01aa 5a            	decw	x
1719  01ab 1f01          	ldw	(OFST-2,sp),x
1720  01ad               L507:
1721                     ; 883     while((flagstatus == 0x00) && (timeout != 0x00))
1723  01ad 7b03          	ld	a,(OFST+0,sp)
1724  01af 2618          	jrne	L317
1726  01b1 1e01          	ldw	x,(OFST-2,sp)
1727  01b3 26ee          	jrne	L307
1728  01b5 2012          	jra	L317
1729  01b7               L517:
1730                     ; 894       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1730                     ; 895                                                       FLASH_IAPSR_WR_PG_DIS));
1732  01b7 c65054        	ld	a,20564
1733  01ba a441          	and	a,#65
1734  01bc 6b03          	ld	(OFST+0,sp),a
1735                     ; 896       timeout--;
1737  01be 5a            	decw	x
1738  01bf 1f01          	ldw	(OFST-2,sp),x
1739  01c1               L717:
1740                     ; 892     while((flagstatus == 0x00) && (timeout != 0x00))
1742  01c1 7b03          	ld	a,(OFST+0,sp)
1743  01c3 2604          	jrne	L317
1745  01c5 1e01          	ldw	x,(OFST-2,sp)
1746  01c7 26ee          	jrne	L517
1747  01c9               L317:
1748                     ; 900   if(timeout == 0x00)
1750  01c9 1e01          	ldw	x,(OFST-2,sp)
1751  01cb 2602          	jrne	L527
1752                     ; 902     flagstatus = FLASH_Status_TimeOut;
1754  01cd a602          	ld	a,#2
1755  01cf               L527:
1756                     ; 905   return((FLASH_Status_TypeDef)flagstatus);
1760  01cf 5b03          	addw	sp,#3
1761  01d1 81            	ret	
1774                     	xdef	_FLASH_WaitForLastOperation
1775                     	xdef	_FLASH_EraseBlock
1776                     	xdef	_FLASH_ProgramBlock
1777                     	xdef	_FLASH_GetPowerStatus
1778                     	xdef	_FLASH_PowerRunModeConfig
1779                     	xdef	_FLASH_GetFlagStatus
1780                     	xdef	_FLASH_ITConfig
1781                     	xdef	_FLASH_EraseOptionByte
1782                     	xdef	_FLASH_ProgramOptionByte
1783                     	xdef	_FLASH_GetReadOutProtectionStatus
1784                     	xdef	_FLASH_GetCodeSize
1785                     	xdef	_FLASH_GetBootSize
1786                     	xdef	_FLASH_ReadByte
1787                     	xdef	_FLASH_ProgramWord
1788                     	xdef	_FLASH_EraseByte
1789                     	xdef	_FLASH_ProgramByte
1790                     	xdef	_FLASH_Lock
1791                     	xdef	_FLASH_Unlock
1792                     	xdef	_FLASH_DeInit
1793                     	xdef	_FLASH_PowerWaitModeConfig
1794                     	xdef	_FLASH_SetProgrammingTime
1795                     	xdef	_FLASH_GetProgrammingTime
1796                     	xref.b	c_lreg
1815                     	xref	c_ladd
1816                     	xref	c_lgadd
1817                     	xref	c_cmulx
1818                     	xref	c_ltor
1819                     	end
