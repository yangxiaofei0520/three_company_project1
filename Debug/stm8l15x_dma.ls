   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 140 void DMA_GlobalDeInit(void)
  32                     ; 141 {
  34                     	switch	.text
  35  0000               _DMA_GlobalDeInit:
  39                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  41  0000 72115070      	bres	20592,#0
  42                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  44  0004 35fc5070      	mov	20592,#252
  45                     ; 147 }
  48  0008 81            	ret
 164                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 164                     ; 156 {
 165                     	switch	.text
 166  0009               _DMA_DeInit:
 168  0009 89            	pushw	x
 169       00000000      OFST:	set	0
 172                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 174                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 176  000a f6            	ld	a,(x)
 177  000b a4fe          	and	a,#254
 178  000d f7            	ld	(x),a
 179                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 181  000e 7f            	clr	(x)
 182                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 184  000f 6f02          	clr	(2,x)
 185                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 187  0011 a35093        	cpw	x,#20627
 188  0014 2608          	jrne	L501
 189                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 191  0016 a640          	ld	a,#64
 192  0018 e703          	ld	(3,x),a
 193                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 195  001a 6f05          	clr	(5,x)
 197  001c 2006          	jra	L701
 198  001e               L501:
 199                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 201  001e 1e01          	ldw	x,(OFST+1,sp)
 202  0020 a652          	ld	a,#82
 203  0022 e703          	ld	(3,x),a
 204  0024               L701:
 205                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 207  0024 1e01          	ldw	x,(OFST+1,sp)
 208  0026 6f04          	clr	(4,x)
 209                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 211  0028 1e01          	ldw	x,(OFST+1,sp)
 212  002a 6f06          	clr	(6,x)
 213                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 215  002c 1e01          	ldw	x,(OFST+1,sp)
 216  002e 6f07          	clr	(7,x)
 217                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 219  0030 1e01          	ldw	x,(OFST+1,sp)
 220  0032 6f01          	clr	(1,x)
 221                     ; 187 }
 224  0034 85            	popw	x
 225  0035 81            	ret
 465                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 465                     ; 225               uint32_t DMA_Memory0BaseAddr,
 465                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 465                     ; 227               uint8_t DMA_BufferSize,
 465                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 465                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 465                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 465                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 465                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 465                     ; 233 {
 466                     	switch	.text
 467  0036               _DMA_Init:
 469  0036 89            	pushw	x
 470       00000000      OFST:	set	0
 473                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 475                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 477                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 479                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 481                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 483                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 485                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 487  0037 f6            	ld	a,(x)
 488  0038 a4fe          	and	a,#254
 489  003a f7            	ld	(x),a
 490                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 492  003b 7f            	clr	(x)
 493                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 493                     ; 251                                            (uint8_t)DMA_Mode) | \
 493                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 495  003c 7b0c          	ld	a,(OFST+12,sp)
 496  003e 1a0d          	or	a,(OFST+13,sp)
 497  0040 1a0e          	or	a,(OFST+14,sp)
 498  0042 fa            	or	a,(x)
 499  0043 f7            	ld	(x),a
 500                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 502  0044 e601          	ld	a,(1,x)
 503  0046 a4c7          	and	a,#199
 504  0048 e701          	ld	(1,x),a
 505                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 505                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 507  004a 7b0f          	ld	a,(OFST+15,sp)
 508  004c 1a10          	or	a,(OFST+16,sp)
 509  004e ea01          	or	a,(1,x)
 510  0050 e701          	ld	(1,x),a
 511                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 513  0052 7b0b          	ld	a,(OFST+11,sp)
 514  0054 1e01          	ldw	x,(OFST+1,sp)
 515  0056 e702          	ld	(2,x),a
 516                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 518  0058 7b09          	ld	a,(OFST+9,sp)
 519  005a 1e01          	ldw	x,(OFST+1,sp)
 520  005c e703          	ld	(3,x),a
 521                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 523  005e 7b0a          	ld	a,(OFST+10,sp)
 524  0060 1e01          	ldw	x,(OFST+1,sp)
 525  0062 e704          	ld	(4,x),a
 526                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 528  0064 1e01          	ldw	x,(OFST+1,sp)
 529  0066 a35093        	cpw	x,#20627
 530  0069 2606          	jrne	L142
 531                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 533  006b 7b06          	ld	a,(OFST+6,sp)
 534  006d 1e01          	ldw	x,(OFST+1,sp)
 535  006f e705          	ld	(5,x),a
 536  0071               L142:
 537                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 539  0071 7b07          	ld	a,(OFST+7,sp)
 540  0073 1e01          	ldw	x,(OFST+1,sp)
 541  0075 e706          	ld	(6,x),a
 542                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 544  0077 7b08          	ld	a,(OFST+8,sp)
 545  0079 1e01          	ldw	x,(OFST+1,sp)
 546  007b e707          	ld	(7,x),a
 547                     ; 280 }
 550  007d 85            	popw	x
 551  007e 81            	ret
 606                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 606                     ; 289 {
 607                     	switch	.text
 608  007f               _DMA_GlobalCmd:
 612                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 614                     ; 293   if (NewState != DISABLE)
 616  007f 4d            	tnz	a
 617  0080 2706          	jreq	L172
 618                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 620  0082 72105070      	bset	20592,#0
 622  0086 2004          	jra	L372
 623  0088               L172:
 624                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 626  0088 72115070      	bres	20592,#0
 627  008c               L372:
 628                     ; 303 }
 631  008c 81            	ret
 678                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 678                     ; 315 {
 679                     	switch	.text
 680  008d               _DMA_Cmd:
 682  008d 89            	pushw	x
 683       00000000      OFST:	set	0
 686                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 688                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 690                     ; 320   if (NewState != DISABLE)
 692  008e 0d05          	tnz	(OFST+5,sp)
 693  0090 2706          	jreq	L123
 694                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 696  0092 f6            	ld	a,(x)
 697  0093 aa01          	or	a,#1
 698  0095 f7            	ld	(x),a
 700  0096 2006          	jra	L323
 701  0098               L123:
 702                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 704  0098 1e01          	ldw	x,(OFST+1,sp)
 705  009a f6            	ld	a,(x)
 706  009b a4fe          	and	a,#254
 707  009d f7            	ld	(x),a
 708  009e               L323:
 709                     ; 330 }
 712  009e 85            	popw	x
 713  009f 81            	ret
 745                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 745                     ; 343 {
 746                     	switch	.text
 747  00a0               _DMA_SetTimeOut:
 751                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 753                     ; 348   DMA1->GCSR = 0;
 755  00a0 725f5070      	clr	20592
 756                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 758  00a4 48            	sll	a
 759  00a5 48            	sll	a
 760  00a6 c75070        	ld	20592,a
 761                     ; 351 }
 764  00a9 81            	ret
 809                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 809                     ; 402 {
 810                     	switch	.text
 811  00aa               _DMA_SetCurrDataCounter:
 813  00aa 89            	pushw	x
 814       00000000      OFST:	set	0
 817                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 819                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 821  00ab 7b05          	ld	a,(OFST+5,sp)
 822  00ad 1e01          	ldw	x,(OFST+1,sp)
 823  00af e702          	ld	(2,x),a
 824                     ; 408 }
 827  00b1 85            	popw	x
 828  00b2 81            	ret
 866                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 866                     ; 416 {
 867                     	switch	.text
 868  00b3               _DMA_GetCurrDataCounter:
 872                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 874                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 876  00b3 e602          	ld	a,(2,x)
 879  00b5 81            	ret
 956                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 956                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 956                     ; 484                   FunctionalState NewState)
 956                     ; 485 {
 957                     	switch	.text
 958  00b6               _DMA_ITConfig:
 960  00b6 89            	pushw	x
 961       00000000      OFST:	set	0
 964                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 966                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 968                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 970                     ; 491   if (NewState != DISABLE)
 972  00b7 0d06          	tnz	(OFST+6,sp)
 973  00b9 2706          	jreq	L344
 974                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 976  00bb f6            	ld	a,(x)
 977  00bc 1a05          	or	a,(OFST+5,sp)
 978  00be f7            	ld	(x),a
 980  00bf 2007          	jra	L544
 981  00c1               L344:
 982                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 984  00c1 1e01          	ldw	x,(OFST+1,sp)
 985  00c3 7b05          	ld	a,(OFST+5,sp)
 986  00c5 43            	cpl	a
 987  00c6 f4            	and	a,(x)
 988  00c7 f7            	ld	(x),a
 989  00c8               L544:
 990                     ; 501 }
 993  00c8 85            	popw	x
 994  00c9 81            	ret
1239                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1239                     ; 531 {
1240                     	switch	.text
1241  00ca               _DMA_GetFlagStatus:
1243  00ca 89            	pushw	x
1244  00cb 5204          	subw	sp,#4
1245       00000004      OFST:	set	4
1248                     ; 532   FlagStatus flagstatus = RESET;
1250  00cd 7b04          	ld	a,(OFST+0,sp)
1251  00cf 97            	ld	xl,a
1252                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1254  00d0 1e02          	ldw	x,(OFST-2,sp)
1255                     ; 534   uint8_t tmpgir1 = 0;
1257  00d2 7b01          	ld	a,(OFST-3,sp)
1258  00d4 97            	ld	xl,a
1259                     ; 535   uint8_t tmpgcsr = 0;
1261  00d5 7b04          	ld	a,(OFST+0,sp)
1262  00d7 97            	ld	xl,a
1263                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1265                     ; 541   tmpgcsr = DMA1->GCSR;
1267  00d8 c65070        	ld	a,20592
1268  00db 6b04          	ld	(OFST+0,sp),a
1269                     ; 542   tmpgir1 = DMA1->GIR1;
1271  00dd c65071        	ld	a,20593
1272  00e0 6b01          	ld	(OFST-3,sp),a
1273                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1275  00e2 7b05          	ld	a,(OFST+1,sp)
1276  00e4 a50f          	bcp	a,#15
1277  00e6 2736          	jreq	L175
1278                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1280  00e8 7b05          	ld	a,(OFST+1,sp)
1281  00ea a501          	bcp	a,#1
1282  00ec 2707          	jreq	L375
1283                     ; 549       DMA_Channelx = DMA1_Channel0;
1285  00ee ae5075        	ldw	x,#20597
1286  00f1 1f02          	ldw	(OFST-2,sp),x
1288  00f3 201f          	jra	L575
1289  00f5               L375:
1290                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1292  00f5 7b05          	ld	a,(OFST+1,sp)
1293  00f7 a502          	bcp	a,#2
1294  00f9 2707          	jreq	L775
1295                     ; 553       DMA_Channelx = DMA1_Channel1;
1297  00fb ae507f        	ldw	x,#20607
1298  00fe 1f02          	ldw	(OFST-2,sp),x
1300  0100 2012          	jra	L575
1301  0102               L775:
1302                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1304  0102 7b05          	ld	a,(OFST+1,sp)
1305  0104 a504          	bcp	a,#4
1306  0106 2707          	jreq	L306
1307                     ; 557       DMA_Channelx = DMA1_Channel2;
1309  0108 ae5089        	ldw	x,#20617
1310  010b 1f02          	ldw	(OFST-2,sp),x
1312  010d 2005          	jra	L575
1313  010f               L306:
1314                     ; 561       DMA_Channelx = DMA1_Channel3;
1316  010f ae5093        	ldw	x,#20627
1317  0112 1f02          	ldw	(OFST-2,sp),x
1318  0114               L575:
1319                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1321  0114 1e02          	ldw	x,(OFST-2,sp)
1322  0116 e601          	ld	a,(1,x)
1323  0118 1406          	and	a,(OFST+2,sp)
1324  011a 6b04          	ld	(OFST+0,sp),a
1326  011c 2014          	jra	L706
1327  011e               L175:
1328                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1330  011e 7b05          	ld	a,(OFST+1,sp)
1331  0120 a510          	bcp	a,#16
1332  0122 2708          	jreq	L116
1333                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1335  0124 7b06          	ld	a,(OFST+2,sp)
1336  0126 1401          	and	a,(OFST-3,sp)
1337  0128 6b04          	ld	(OFST+0,sp),a
1339  012a 2006          	jra	L706
1340  012c               L116:
1341                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1343  012c 7b04          	ld	a,(OFST+0,sp)
1344  012e a402          	and	a,#2
1345  0130 6b04          	ld	(OFST+0,sp),a
1346  0132               L706:
1347                     ; 579   return (flagstatus);
1349  0132 7b04          	ld	a,(OFST+0,sp)
1352  0134 5b06          	addw	sp,#6
1353  0136 81            	ret
1400                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1400                     ; 598 {
1401                     	switch	.text
1402  0137               _DMA_ClearFlag:
1404  0137 89            	pushw	x
1405  0138 89            	pushw	x
1406       00000002      OFST:	set	2
1409                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1411  0139 ae5075        	ldw	x,#20597
1412  013c 1f01          	ldw	(OFST-1,sp),x
1413                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1415                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1417  013e 7b03          	ld	a,(OFST+1,sp)
1418  0140 a501          	bcp	a,#1
1419  0142 2707          	jreq	L146
1420                     ; 607     DMA_Channelx = DMA1_Channel0;
1422  0144 ae5075        	ldw	x,#20597
1423  0147 1f01          	ldw	(OFST-1,sp),x
1425  0149 201f          	jra	L346
1426  014b               L146:
1427                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1429  014b 7b03          	ld	a,(OFST+1,sp)
1430  014d a502          	bcp	a,#2
1431  014f 2707          	jreq	L546
1432                     ; 613       DMA_Channelx = DMA1_Channel1;
1434  0151 ae507f        	ldw	x,#20607
1435  0154 1f01          	ldw	(OFST-1,sp),x
1437  0156 2012          	jra	L346
1438  0158               L546:
1439                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1441  0158 7b03          	ld	a,(OFST+1,sp)
1442  015a a504          	bcp	a,#4
1443  015c 2707          	jreq	L156
1444                     ; 619         DMA_Channelx = DMA1_Channel2;
1446  015e ae5089        	ldw	x,#20617
1447  0161 1f01          	ldw	(OFST-1,sp),x
1449  0163 2005          	jra	L346
1450  0165               L156:
1451                     ; 623         DMA_Channelx = DMA1_Channel3;
1453  0165 ae5093        	ldw	x,#20627
1454  0168 1f01          	ldw	(OFST-1,sp),x
1455  016a               L346:
1456                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1458  016a 1e01          	ldw	x,(OFST-1,sp)
1459  016c 7b04          	ld	a,(OFST+2,sp)
1460  016e a406          	and	a,#6
1461  0170 43            	cpl	a
1462  0171 e401          	and	a,(1,x)
1463  0173 e701          	ld	(1,x),a
1464                     ; 630 }
1467  0175 5b04          	addw	sp,#4
1468  0177 81            	ret
1602                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1602                     ; 647 {
1603                     	switch	.text
1604  0178               _DMA_GetITStatus:
1606  0178 88            	push	a
1607  0179 5204          	subw	sp,#4
1608       00000004      OFST:	set	4
1611                     ; 648   ITStatus itstatus = RESET;
1613  017b 7b02          	ld	a,(OFST-2,sp)
1614  017d 97            	ld	xl,a
1615                     ; 649   uint8_t tmpreg = 0;
1617  017e 7b01          	ld	a,(OFST-3,sp)
1618  0180 97            	ld	xl,a
1619                     ; 650   uint8_t tmp2 = 0;
1621  0181 7b02          	ld	a,(OFST-2,sp)
1622  0183 97            	ld	xl,a
1623                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1625  0184 1e03          	ldw	x,(OFST-1,sp)
1626                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1628                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1630  0186 7b05          	ld	a,(OFST+1,sp)
1631  0188 a510          	bcp	a,#16
1632  018a 2707          	jreq	L537
1633                     ; 659     DMA_Channelx = DMA1_Channel0;
1635  018c ae5075        	ldw	x,#20597
1636  018f 1f03          	ldw	(OFST-1,sp),x
1638  0191 201f          	jra	L737
1639  0193               L537:
1640                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1642  0193 7b05          	ld	a,(OFST+1,sp)
1643  0195 a520          	bcp	a,#32
1644  0197 2707          	jreq	L147
1645                     ; 665       DMA_Channelx = DMA1_Channel1;
1647  0199 ae507f        	ldw	x,#20607
1648  019c 1f03          	ldw	(OFST-1,sp),x
1650  019e 2012          	jra	L737
1651  01a0               L147:
1652                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1654  01a0 7b05          	ld	a,(OFST+1,sp)
1655  01a2 a540          	bcp	a,#64
1656  01a4 2707          	jreq	L547
1657                     ; 671         DMA_Channelx = DMA1_Channel2;
1659  01a6 ae5089        	ldw	x,#20617
1660  01a9 1f03          	ldw	(OFST-1,sp),x
1662  01ab 2005          	jra	L737
1663  01ad               L547:
1664                     ; 675         DMA_Channelx = DMA1_Channel3;
1666  01ad ae5093        	ldw	x,#20627
1667  01b0 1f03          	ldw	(OFST-1,sp),x
1668  01b2               L737:
1669                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1671  01b2 1e03          	ldw	x,(OFST-1,sp)
1672  01b4 e601          	ld	a,(1,x)
1673  01b6 6b01          	ld	(OFST-3,sp),a
1674                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1676  01b8 1e03          	ldw	x,(OFST-1,sp)
1677  01ba 7b01          	ld	a,(OFST-3,sp)
1678  01bc f4            	and	a,(x)
1679  01bd 6b01          	ld	(OFST-3,sp),a
1680                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1682  01bf 7b05          	ld	a,(OFST+1,sp)
1683  01c1 a406          	and	a,#6
1684  01c3 6b02          	ld	(OFST-2,sp),a
1685                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1687  01c5 7b01          	ld	a,(OFST-3,sp)
1688  01c7 1402          	and	a,(OFST-2,sp)
1689  01c9 6b02          	ld	(OFST-2,sp),a
1690                     ; 686   return (itstatus);
1692  01cb 7b02          	ld	a,(OFST-2,sp)
1695  01cd 5b05          	addw	sp,#5
1696  01cf 81            	ret
1744                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1744                     ; 705 {
1745                     	switch	.text
1746  01d0               _DMA_ClearITPendingBit:
1748  01d0 88            	push	a
1749  01d1 89            	pushw	x
1750       00000002      OFST:	set	2
1753                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1755  01d2 ae5075        	ldw	x,#20597
1756  01d5 1f01          	ldw	(OFST-1,sp),x
1757                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1759                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1761  01d7 a510          	bcp	a,#16
1762  01d9 2707          	jreq	L577
1763                     ; 713     DMA_Channelx = DMA1_Channel0;
1765  01db ae5075        	ldw	x,#20597
1766  01de 1f01          	ldw	(OFST-1,sp),x
1768  01e0 201f          	jra	L777
1769  01e2               L577:
1770                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1772  01e2 7b03          	ld	a,(OFST+1,sp)
1773  01e4 a520          	bcp	a,#32
1774  01e6 2707          	jreq	L1001
1775                     ; 719       DMA_Channelx = DMA1_Channel1;
1777  01e8 ae507f        	ldw	x,#20607
1778  01eb 1f01          	ldw	(OFST-1,sp),x
1780  01ed 2012          	jra	L777
1781  01ef               L1001:
1782                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1784  01ef 7b03          	ld	a,(OFST+1,sp)
1785  01f1 a540          	bcp	a,#64
1786  01f3 2707          	jreq	L5001
1787                     ; 725         DMA_Channelx = DMA1_Channel2;
1789  01f5 ae5089        	ldw	x,#20617
1790  01f8 1f01          	ldw	(OFST-1,sp),x
1792  01fa 2005          	jra	L777
1793  01fc               L5001:
1794                     ; 729         DMA_Channelx = DMA1_Channel3;
1796  01fc ae5093        	ldw	x,#20627
1797  01ff 1f01          	ldw	(OFST-1,sp),x
1798  0201               L777:
1799                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1801  0201 1e01          	ldw	x,(OFST-1,sp)
1802  0203 7b03          	ld	a,(OFST+1,sp)
1803  0205 a406          	and	a,#6
1804  0207 43            	cpl	a
1805  0208 e401          	and	a,(1,x)
1806  020a e701          	ld	(1,x),a
1807                     ; 735 }
1810  020c 5b03          	addw	sp,#3
1811  020e 81            	ret
1824                     	xdef	_DMA_ClearITPendingBit
1825                     	xdef	_DMA_GetITStatus
1826                     	xdef	_DMA_ClearFlag
1827                     	xdef	_DMA_GetFlagStatus
1828                     	xdef	_DMA_ITConfig
1829                     	xdef	_DMA_GetCurrDataCounter
1830                     	xdef	_DMA_SetCurrDataCounter
1831                     	xdef	_DMA_SetTimeOut
1832                     	xdef	_DMA_Cmd
1833                     	xdef	_DMA_GlobalCmd
1834                     	xdef	_DMA_Init
1835                     	xdef	_DMA_DeInit
1836                     	xdef	_DMA_GlobalDeInit
1855                     	end
