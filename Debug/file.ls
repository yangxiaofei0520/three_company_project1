   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 474                     ; 30 void ReadGroup(u8 Length, u16 Address, u8 *Data)		//从EEPROM指定地址读取N个字节
 474                     ; 31 {
 476                     	switch	.text
 477  0000               _ReadGroup:
 479  0000 88            	push	a
 480  0001 5209          	subw	sp,#9
 481       00000009      OFST:	set	9
 484                     ; 32 	uint32_t add, startadd, stopadd = 0;
 486  0003 96            	ldw	x,sp
 487  0004 1c0002        	addw	x,#OFST-7
 488  0007 cd0000        	call	c_ltor
 490                     ; 33 	uint8_t i = 0;
 492  000a 0f01          	clr	(OFST-8,sp)
 493                     ; 35 	startadd = Address + ((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 495  000c 1e0d          	ldw	x,(OFST+4,sp)
 496  000e cd0000        	call	c_uitolx
 498  0011 96            	ldw	x,sp
 499  0012 1c0006        	addw	x,#OFST-3
 500  0015 cd0000        	call	c_rtol
 502                     ; 36 	stopadd = startadd + Length;
 504  0018 96            	ldw	x,sp
 505  0019 1c0006        	addw	x,#OFST-3
 506  001c cd0000        	call	c_ltor
 508  001f 7b0a          	ld	a,(OFST+1,sp)
 509  0021 cd0000        	call	c_ladc
 511  0024 96            	ldw	x,sp
 512  0025 1c0002        	addw	x,#OFST-7
 513  0028 cd0000        	call	c_rtol
 515                     ; 37 	for (add = startadd; add < stopadd; add++)
 518  002b 2017          	jra	L162
 519  002d               L552:
 520                     ; 39 		Data[i++] = (*(PointerAttr uint8_t *) (MemoryAddressCast)add); //FLASH_ReadByte(add);
 522  002d 7b01          	ld	a,(OFST-8,sp)
 523  002f 0c01          	inc	(OFST-8,sp)
 524  0031 5f            	clrw	x
 525  0032 97            	ld	xl,a
 526  0033 72fb0f        	addw	x,(OFST+6,sp)
 527  0036 1608          	ldw	y,(OFST-1,sp)
 528  0038 90f6          	ld	a,(y)
 529  003a f7            	ld	(x),a
 530                     ; 37 	for (add = startadd; add < stopadd; add++)
 532  003b 96            	ldw	x,sp
 533  003c 1c0006        	addw	x,#OFST-3
 534  003f a601          	ld	a,#1
 535  0041 cd0000        	call	c_lgadc
 537  0044               L162:
 540  0044 96            	ldw	x,sp
 541  0045 1c0006        	addw	x,#OFST-3
 542  0048 cd0000        	call	c_ltor
 544  004b 96            	ldw	x,sp
 545  004c 1c0002        	addw	x,#OFST-7
 546  004f cd0000        	call	c_lcmp
 548  0052 25d9          	jrult	L552
 549                     ; 41 }
 552  0054 5b0a          	addw	sp,#10
 553  0056 81            	ret	
 593                     ; 51 void SaveByte(u16 Address, u8 Data)
 593                     ; 52 {
 594                     	switch	.text
 595  0057               _SaveByte:
 597  0057 89            	pushw	x
 598       00000000      OFST:	set	0
 601                     ; 59     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 603  0058 35ae5053      	mov	20563,#174
 604                     ; 60     FLASH->DUKR = FLASH_RASS_KEY1;
 606  005c 35565053      	mov	20563,#86
 608  0060               L703:
 609                     ; 63 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET)  //FLASH_GetFlagStatus(FLASH_FLAG_DUL)
 611  0060 72075054fb    	btjf	20564,#3,L703
 612                     ; 67 	*(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 614  0065 7b05          	ld	a,(OFST+5,sp)
 615  0067 1e01          	ldw	x,(OFST+1,sp)
 616  0069 f7            	ld	(x),a
 617                     ; 68 	delay_us(150);
 619  006a ae0096        	ldw	x,#150
 620  006d cd0000        	call	_delay_us
 623  0070               L513:
 624                     ; 71 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_HVOFF) == RESET)  //FLASH_GetFlagStatus(FLASH_FLAG_HVOFF)
 626  0070 720d5054fb    	btjf	20564,#6,L513
 627                     ; 73 }
 630  0075 85            	popw	x
 631  0076 81            	ret	
 688                     ; 84 void SaveGroup(u8 Length, u16 Address, u8 *Data)		//写n个字节到指定EEPROM的指定地址
 688                     ; 85 {
 689                     	switch	.text
 690  0077               _SaveGroup:
 692  0077 88            	push	a
 693  0078 89            	pushw	x
 694       00000002      OFST:	set	2
 697                     ; 86 	u16 wLoop = 0;
 699  0079 5f            	clrw	x
 700  007a 1f01          	ldw	(OFST-1,sp),x
 701                     ; 98     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 703  007c 35ae5053      	mov	20563,#174
 704                     ; 99     FLASH->DUKR = FLASH_RASS_KEY1;
 706  0080 35565053      	mov	20563,#86
 708  0084               L153:
 709                     ; 102 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET)
 711  0084 72075054fb    	btjf	20564,#3,L153
 712                     ; 105 	for(wLoop = 0; wLoop < Length; wLoop++)
 714  0089 5f            	clrw	x
 716  008a 2015          	jra	L163
 717  008c               L553:
 718                     ; 108 		*(PointerAttr uint8_t*) (MemoryAddressCast)(wLoop+Address) = Data[wLoop];
 720  008c 1e08          	ldw	x,(OFST+6,sp)
 721  008e 72fb01        	addw	x,(OFST-1,sp)
 722  0091 f6            	ld	a,(x)
 723  0092 1e01          	ldw	x,(OFST-1,sp)
 724  0094 72fb06        	addw	x,(OFST+4,sp)
 725  0097 f7            	ld	(x),a
 726                     ; 109 		delay_us(150);
 728  0098 ae0096        	ldw	x,#150
 729  009b cd0000        	call	_delay_us
 731                     ; 105 	for(wLoop = 0; wLoop < Length; wLoop++)
 733  009e 1e01          	ldw	x,(OFST-1,sp)
 734  00a0 5c            	incw	x
 735  00a1               L163:
 736  00a1 1f01          	ldw	(OFST-1,sp),x
 739  00a3 7b03          	ld	a,(OFST+1,sp)
 740  00a5 5f            	clrw	x
 741  00a6 97            	ld	xl,a
 742  00a7 bf00          	ldw	c_x,x
 743  00a9 1e01          	ldw	x,(OFST-1,sp)
 744  00ab b300          	cpw	x,c_x
 745  00ad 25dd          	jrult	L553
 747  00af               L763:
 748                     ; 113 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_HVOFF) == RESET)  
 750  00af 720d5054fb    	btjf	20564,#6,L763
 751                     ; 115 }
 754  00b4 5b03          	addw	sp,#3
 755  00b6 81            	ret	
1514                     ; 358 void SaveReportFlag(u8 nReportFlg)
1514                     ; 359 {
1515                     	switch	.text
1516  00b7               _SaveReportFlag:
1518  00b7 88            	push	a
1519  00b8 5208          	subw	sp,#8
1520       00000008      OFST:	set	8
1523                     ; 360 	u16 nX = 0, address = 0;
1525  00ba 5f            	clrw	x
1526  00bb 1f01          	ldw	(OFST-7,sp),x
1529                     ; 364 	address = ADDRESS_REPORTFLG;
1531  00bd ae1001        	ldw	x,#4097
1532  00c0 1f03          	ldw	(OFST-5,sp),x
1533                     ; 366 	ReadGroup(sizeof(index), address, (u8 *)&index);		//读指针,下面做平衡算法
1535  00c2 96            	ldw	x,sp
1536  00c3 1c0005        	addw	x,#OFST-3
1537  00c6 89            	pushw	x
1538  00c7 ae1001        	ldw	x,#4097
1539  00ca 89            	pushw	x
1540  00cb a604          	ld	a,#4
1541  00cd cd0000        	call	_ReadGroup
1543  00d0 5b04          	addw	sp,#4
1544                     ; 367 	if (index.Bytes.B0 == 0xff)		//第一次?
1546  00d2 7b05          	ld	a,(OFST-3,sp)
1547  00d4 4c            	inc	a
1548  00d5 2608          	jrne	L1501
1549                     ; 369 		SaveByte(ADDRESS_REPORTFLG, nReportFlg);		//保存指针
1551  00d7 7b09          	ld	a,(OFST+1,sp)
1552  00d9 88            	push	a
1553  00da ae1001        	ldw	x,#4097
1556  00dd 2045          	jra	L3501
1557  00df               L1501:
1558                     ; 371 	else if (index.Bytes.B1 == 0xff)
1560  00df 7b06          	ld	a,(OFST-2,sp)
1561  00e1 4c            	inc	a
1562  00e2 2608          	jrne	L5501
1563                     ; 373 		SaveByte(ADDRESS_REPORTFLG + 1, nReportFlg);	//保存指针
1565  00e4 7b09          	ld	a,(OFST+1,sp)
1566  00e6 88            	push	a
1567  00e7 ae1002        	ldw	x,#4098
1570  00ea 2038          	jra	L3501
1571  00ec               L5501:
1572                     ; 375 	else if (index.Bytes.B2 == 0xff)
1574  00ec 7b07          	ld	a,(OFST-1,sp)
1575  00ee 4c            	inc	a
1576  00ef 2608          	jrne	L1601
1577                     ; 377 		SaveByte(ADDRESS_REPORTFLG + 2, nReportFlg);	//保存指针
1579  00f1 7b09          	ld	a,(OFST+1,sp)
1580  00f3 88            	push	a
1581  00f4 ae1003        	ldw	x,#4099
1584  00f7 202b          	jra	L3501
1585  00f9               L1601:
1586                     ; 379 	else if (index.Bytes.B3 == 0xff)
1588  00f9 7b08          	ld	a,(OFST+0,sp)
1589  00fb 4c            	inc	a
1590  00fc 2605          	jrne	L5601
1591                     ; 381 		SaveByte(ADDRESS_REPORTFLG + 3, nReportFlg);	//保存指针
1593  00fe 7b09          	ld	a,(OFST+1,sp)
1594  0100 88            	push	a
1597  0101 201e          	jp	LC001
1598  0103               L5601:
1599                     ; 385 		SaveByte(ADDRESS_REPORTFLG, nReportFlg);		//保存指针
1601  0103 7b09          	ld	a,(OFST+1,sp)
1602  0105 88            	push	a
1603  0106 ae1001        	ldw	x,#4097
1604  0109 cd0057        	call	_SaveByte
1606  010c 84            	pop	a
1607                     ; 386 		SaveByte(ADDRESS_REPORTFLG + 1, 0xff);		//清除
1609  010d 4bff          	push	#255
1610  010f ae1002        	ldw	x,#4098
1611  0112 cd0057        	call	_SaveByte
1613  0115 84            	pop	a
1614                     ; 387 		SaveByte(ADDRESS_REPORTFLG + 2, 0xff);		//清除
1616  0116 4bff          	push	#255
1617  0118 ae1003        	ldw	x,#4099
1618  011b cd0057        	call	_SaveByte
1620  011e 84            	pop	a
1621                     ; 388 		SaveByte(ADDRESS_REPORTFLG + 3, 0xff);		//清除
1623  011f 4bff          	push	#255
1624  0121               LC001:
1625  0121 ae1004        	ldw	x,#4100
1627  0124               L3501:
1628  0124 cd0057        	call	_SaveByte
1629  0127 84            	pop	a
1630                     ; 390 }
1633  0128 5b09          	addw	sp,#9
1634  012a 81            	ret	
1670                     ; 399 u8 ReadReportFlag(void)
1670                     ; 400 {
1671                     	switch	.text
1672  012b               _ReadReportFlag:
1674  012b 5204          	subw	sp,#4
1675       00000004      OFST:	set	4
1678                     ; 403 	ReadGroup(sizeof(index), ADDRESS_REPORTFLG, (u8 *)&index);		//读指针,根据平衡算法,找到指针的真正位置
1680  012d 96            	ldw	x,sp
1681  012e 5c            	incw	x
1682  012f 89            	pushw	x
1683  0130 ae1001        	ldw	x,#4097
1684  0133 89            	pushw	x
1685  0134 a604          	ld	a,#4
1686  0136 cd0000        	call	_ReadGroup
1688  0139 5b04          	addw	sp,#4
1689                     ; 404 	if (index.Bytes.B3 < 0xff)		//有数据?
1691  013b 7b04          	ld	a,(OFST+0,sp)
1692  013d a1ff          	cp	a,#255
1693                     ; 406 		return index.Bytes.B3;
1696  013f 2506          	jrult	L64
1697                     ; 408 	else if (index.Bytes.B2 < 0xff)
1699  0141 7b03          	ld	a,(OFST-1,sp)
1700  0143 a1ff          	cp	a,#255
1701  0145 2403          	jruge	L3111
1702                     ; 410 		return index.Bytes.B2;
1705  0147               L64:
1707  0147 5b04          	addw	sp,#4
1708  0149 81            	ret	
1709  014a               L3111:
1710                     ; 412 	else if (index.Bytes.B1 < 0xff)
1712  014a 7b02          	ld	a,(OFST-2,sp)
1713  014c a1ff          	cp	a,#255
1714                     ; 414 		return index.Bytes.B1;
1717  014e 25f7          	jrult	L64
1718                     ; 416 	else if (index.Bytes.B0 < 0xff)
1720  0150 7b01          	ld	a,(OFST-3,sp)
1721  0152 a1ff          	cp	a,#255
1722                     ; 418 		return index.Bytes.B0;
1725  0154 25f1          	jrult	L64
1726                     ; 422 		return 0;
1728  0156 4f            	clr	a
1730  0157 20ee          	jra	L64
1780                     ; 433 u8 ReadIndex(u16 wAddr)
1780                     ; 434 {
1781                     	switch	.text
1782  0159               _ReadIndex:
1784  0159 89            	pushw	x
1785  015a 5205          	subw	sp,#5
1786       00000005      OFST:	set	5
1789                     ; 435 	u8 nIndexDat = 0;
1791  015c 0f01          	clr	(OFST-4,sp)
1792                     ; 438 	ReadGroup(sizeof(index), wAddr, (u8 *)&index);		//读指针,根据平衡算法,找到指针的真正位置
1794  015e 96            	ldw	x,sp
1795  015f 1c0002        	addw	x,#OFST-3
1796  0162 89            	pushw	x
1797  0163 1e08          	ldw	x,(OFST+3,sp)
1798  0165 89            	pushw	x
1799  0166 a604          	ld	a,#4
1800  0168 cd0000        	call	_ReadGroup
1802  016b 5b04          	addw	sp,#4
1803                     ; 439 	if (index.Bytes.B3 < 0xff)		//有数据?
1805  016d 7b05          	ld	a,(OFST+0,sp)
1806  016f a1ff          	cp	a,#255
1807                     ; 441 		nIndexDat = index.Bytes.B3;
1809  0171 2513          	jrult	L3511
1810                     ; 443 	else if (index.Bytes.B2 < 0xff)
1812  0173 7b04          	ld	a,(OFST-1,sp)
1813  0175 a1ff          	cp	a,#255
1814                     ; 445 		nIndexDat = index.Bytes.B2;
1816  0177 250d          	jrult	L3511
1817                     ; 447 	else if (index.Bytes.B1 < 0xff)
1819  0179 7b03          	ld	a,(OFST-2,sp)
1820  017b a1ff          	cp	a,#255
1821                     ; 449 		nIndexDat = index.Bytes.B1;
1823  017d 2507          	jrult	L3511
1824                     ; 451 	else if (index.Bytes.B0 < 0xff)
1826  017f 7b02          	ld	a,(OFST-3,sp)
1827  0181 a1ff          	cp	a,#255
1828                     ; 453 		nIndexDat = index.Bytes.B0;
1834  0183 2501          	jrult	L3511
1835                     ; 457 		nIndexDat = 0;
1837  0185 4f            	clr	a
1838  0186               L3511:
1839                     ; 459 	return nIndexDat;
1843  0186 5b07          	addw	sp,#7
1844  0188 81            	ret	
1872                     ; 469 void InitializeFile(void)
1872                     ; 470 {	
1873                     	switch	.text
1874  0189               _InitializeFile:
1878                     ; 472 	FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1880  0189 72115050      	bres	20560,#0
1881                     ; 473 	FLASH->CR1 |= (uint8_t)FLASH_ProgramTime_Standard;
1883  018d c65050        	ld	a,20560
1884                     ; 475     FLASH->DUKR = FLASH_RASS_KEY2; /* edit by maronglang Warning: keys are reversed on data memory !!! */
1886  0190 35ae5053      	mov	20563,#174
1887                     ; 476     FLASH->DUKR = FLASH_RASS_KEY1;
1889  0194 35565053      	mov	20563,#86
1891  0198               L5021:
1892                     ; 479 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET) // edit by maronglang20160217
1894  0198 72075054fb    	btjf	20564,#3,L5021
1895                     ; 483 	ucRecordIndex = ReadIndex(ADDRESS_INDEX);
1897  019d ae11d3        	ldw	x,#4563
1898  01a0 adb7          	call	_ReadIndex
1900  01a2 c70002        	ld	_ucRecordIndex,a
1901                     ; 486 	g_nRecAlmIndex = ReadIndex(ADDRESS_INDEX_ALM);
1903  01a5 ae1105        	ldw	x,#4357
1904  01a8 adaf          	call	_ReadIndex
1906  01aa c70003        	ld	_g_nRecAlmIndex,a
1907                     ; 489 	g_nDayRecIndex = ReadIndex(ADDRESS_INDEX_DAY);
1909  01ad ae1343        	ldw	x,#4931
1910  01b0 ada7          	call	_ReadIndex
1912  01b2 c70001        	ld	_g_nDayRecIndex,a
1913                     ; 492 	g_nMonRecIndex = ReadIndex(ADDRESS_INDEX_MON);
1915  01b5 ae1127        	ldw	x,#4391
1916  01b8 ad9f          	call	_ReadIndex
1918  01ba c70000        	ld	_g_nMonRecIndex,a
1919                     ; 494 }
1922  01bd 81            	ret	
1925                     .const:	section	.text
1926  0000               L1121_nBuf:
1927  0000 00            	dc.b	0
1928  0001 000000000000  	ds.b	32
1991                     ; 501 void SaveParameterForType(u8* pnDat, u8 nLen, u8 nTpye)
1991                     ; 502 {
1992                     	switch	.text
1993  01be               _SaveParameterForType:
1995  01be 89            	pushw	x
1996  01bf 5221          	subw	sp,#33
1997       00000021      OFST:	set	33
2000                     ; 503   u8 nBuf[MAX_LEN+1] = {0};
2002  01c1 96            	ldw	x,sp
2003  01c2 5c            	incw	x
2004  01c3 90ae0000      	ldw	y,#L1121_nBuf
2005  01c7 a621          	ld	a,#33
2006  01c9 cd0000        	call	c_xymvx
2008                     ; 505   nBuf[nLen] = JX_AddSum8Bit(pnDat, nLen);
2010  01cc 96            	ldw	x,sp
2011  01cd 5c            	incw	x
2012  01ce 9f            	ld	a,xl
2013  01cf 5e            	swapw	x
2014  01d0 1b26          	add	a,(OFST+5,sp)
2015  01d2 2401          	jrnc	L07
2016  01d4 5c            	incw	x
2017  01d5               L07:
2018  01d5 02            	rlwa	x,a
2019  01d6 89            	pushw	x
2020  01d7 7b28          	ld	a,(OFST+7,sp)
2021  01d9 5f            	clrw	x
2022  01da 97            	ld	xl,a
2023  01db 89            	pushw	x
2024  01dc 1e26          	ldw	x,(OFST+5,sp)
2025  01de cd0000        	call	_JX_AddSum8Bit
2027  01e1 85            	popw	x
2028  01e2 85            	popw	x
2029  01e3 f7            	ld	(x),a
2030                     ; 506 	MemcpyFunc(nBuf, pnDat, nLen);
2032  01e4 7b26          	ld	a,(OFST+5,sp)
2033  01e6 88            	push	a
2034  01e7 1e23          	ldw	x,(OFST+2,sp)
2035  01e9 89            	pushw	x
2036  01ea 96            	ldw	x,sp
2037  01eb 1c0004        	addw	x,#OFST-29
2038  01ee cd0000        	call	_MemcpyFunc
2040  01f1 5b03          	addw	sp,#3
2041                     ; 507 	nLen = nLen + 1;
2043  01f3 0c26          	inc	(OFST+5,sp)
2044                     ; 509 	if(IPANDPORT_PARA == nTpye)
2046  01f5 7b27          	ld	a,(OFST+6,sp)
2047  01f7 a101          	cp	a,#1
2048  01f9 2637          	jrne	L1421
2049                     ; 511 		SaveGroup(nLen, ADDRESS_IPPARA, nBuf);
2051  01fb 96            	ldw	x,sp
2052  01fc 5c            	incw	x
2053  01fd 89            	pushw	x
2054  01fe ae1027        	ldw	x,#4135
2055  0201 89            	pushw	x
2056  0202 7b2a          	ld	a,(OFST+9,sp)
2057  0204 cd0077        	call	_SaveGroup
2059  0207 5b04          	addw	sp,#4
2060                     ; 512 		SaveGroup(nLen, ADDRESS_IPPARA_BK, nBuf);
2062  0209 96            	ldw	x,sp
2063  020a 5c            	incw	x
2064  020b 89            	pushw	x
2065  020c ae10a7        	ldw	x,#4263
2066  020f 89            	pushw	x
2067  0210 7b2a          	ld	a,(OFST+9,sp)
2068  0212 cd0077        	call	_SaveGroup
2070  0215 5b04          	addw	sp,#4
2071                     ; 514 		MemsetFunc(nBuf, 0, sizeof(nBuf));
2073  0217 4b21          	push	#33
2074  0219 4b00          	push	#0
2075  021b 96            	ldw	x,sp
2076  021c 1c0003        	addw	x,#OFST-30
2077  021f cd0000        	call	_MemsetFunc
2079  0222 85            	popw	x
2080                     ; 515 		ReadGroup(nLen, ADDRESS_IPPARA, nBuf);
2082  0223 96            	ldw	x,sp
2083  0224 5c            	incw	x
2084  0225 89            	pushw	x
2085  0226 ae1027        	ldw	x,#4135
2086  0229 89            	pushw	x
2087  022a 7b2a          	ld	a,(OFST+9,sp)
2088  022c cd0000        	call	_ReadGroup
2091  022f cc02d3        	jp	LC003
2092  0232               L1421:
2093                     ; 517 	else if(APN_PARA == nTpye)
2095  0232 a102          	cp	a,#2
2096  0234 2617          	jrne	L5421
2097                     ; 519 		SaveGroup(nLen, ADDRESS_APN, nBuf);
2099  0236 96            	ldw	x,sp
2100  0237 5c            	incw	x
2101  0238 89            	pushw	x
2102  0239 ae104f        	ldw	x,#4175
2103  023c 89            	pushw	x
2104  023d 7b2a          	ld	a,(OFST+9,sp)
2105  023f cd0077        	call	_SaveGroup
2107  0242 5b04          	addw	sp,#4
2108                     ; 520 		SaveGroup(nLen, ADDRESS_APN_BK, nBuf);
2110  0244 96            	ldw	x,sp
2111  0245 5c            	incw	x
2112  0246 89            	pushw	x
2113  0247 ae10cf        	ldw	x,#4303
2116  024a cc02cd        	jp	LC004
2117  024d               L5421:
2118                     ; 522 	else if(REPORT_PARA == nTpye)
2120  024d a103          	cp	a,#3
2121  024f 2616          	jrne	L1521
2122                     ; 524 		SaveGroup(nLen, ADDRESS_REPOERCYCLE, nBuf);
2124  0251 96            	ldw	x,sp
2125  0252 5c            	incw	x
2126  0253 89            	pushw	x
2127  0254 ae1064        	ldw	x,#4196
2128  0257 89            	pushw	x
2129  0258 7b2a          	ld	a,(OFST+9,sp)
2130  025a cd0077        	call	_SaveGroup
2132  025d 5b04          	addw	sp,#4
2133                     ; 525 		SaveGroup(nLen, ADDRESS_REPOERCYCLE_BK, nBuf);		
2135  025f 96            	ldw	x,sp
2136  0260 5c            	incw	x
2137  0261 89            	pushw	x
2138  0262 ae10e4        	ldw	x,#4324
2141  0265 2066          	jp	LC004
2142  0267               L1521:
2143                     ; 527 	else if(METER_PARA == nTpye)
2145  0267 a104          	cp	a,#4
2146  0269 2616          	jrne	L5521
2147                     ; 529 		SaveGroup(nLen, ADDRESS_PARAMETER, nBuf);
2149  026b 96            	ldw	x,sp
2150  026c 5c            	incw	x
2151  026d 89            	pushw	x
2152  026e ae1006        	ldw	x,#4102
2153  0271 89            	pushw	x
2154  0272 7b2a          	ld	a,(OFST+9,sp)
2155  0274 cd0077        	call	_SaveGroup
2157  0277 5b04          	addw	sp,#4
2158                     ; 530 		SaveGroup(nLen, ADDRESS_PARAMETER_BK, nBuf);		
2160  0279 96            	ldw	x,sp
2161  027a 5c            	incw	x
2162  027b 89            	pushw	x
2163  027c ae1086        	ldw	x,#4230
2166  027f 204c          	jp	LC004
2167  0281               L5521:
2168                     ; 532 	else if(LT_REP_TIME == nTpye)
2170  0281 a105          	cp	a,#5
2171  0283 2616          	jrne	L1621
2172                     ; 534 		SaveGroup(nLen, ADDRESS_REPORTTIME, nBuf);
2174  0285 96            	ldw	x,sp
2175  0286 5c            	incw	x
2176  0287 89            	pushw	x
2177  0288 ae106f        	ldw	x,#4207
2178  028b 89            	pushw	x
2179  028c 7b2a          	ld	a,(OFST+9,sp)
2180  028e cd0077        	call	_SaveGroup
2182  0291 5b04          	addw	sp,#4
2183                     ; 535 		SaveGroup(nLen, ADDRESS_REPORTTIME_BK, nBuf);		
2185  0293 96            	ldw	x,sp
2186  0294 5c            	incw	x
2187  0295 89            	pushw	x
2188  0296 ae10ef        	ldw	x,#4335
2191  0299 2032          	jp	LC004
2192  029b               L1621:
2193                     ; 537 	else if(OPT_VALVE_PRAA == nTpye)
2195  029b a106          	cp	a,#6
2196  029d 2616          	jrne	L5621
2197                     ; 539 		SaveGroup(nLen, ADDRESS_OPTVALVE, nBuf);
2199  029f 96            	ldw	x,sp
2200  02a0 5c            	incw	x
2201  02a1 89            	pushw	x
2202  02a2 ae107a        	ldw	x,#4218
2203  02a5 89            	pushw	x
2204  02a6 7b2a          	ld	a,(OFST+9,sp)
2205  02a8 cd0077        	call	_SaveGroup
2207  02ab 5b04          	addw	sp,#4
2208                     ; 540 		SaveGroup(nLen, ADDRESS_OPTVALVE_BK, nBuf);		
2210  02ad 96            	ldw	x,sp
2211  02ae 5c            	incw	x
2212  02af 89            	pushw	x
2213  02b0 ae10fa        	ldw	x,#4346
2216  02b3 2018          	jp	LC004
2217  02b5               L5621:
2218                     ; 542 	else if(TM_ADDRESS_PRAA == nTpye)
2220  02b5 a107          	cp	a,#7
2221  02b7 261c          	jrne	L3421
2222                     ; 544 		SaveGroup(nLen, ADDRESS_TMADDRESS, nBuf);
2224  02b9 96            	ldw	x,sp
2225  02ba 5c            	incw	x
2226  02bb 89            	pushw	x
2227  02bc ae1005        	ldw	x,#4101
2228  02bf 89            	pushw	x
2229  02c0 7b2a          	ld	a,(OFST+9,sp)
2230  02c2 cd0077        	call	_SaveGroup
2232  02c5 5b04          	addw	sp,#4
2233                     ; 545 		SaveGroup(nLen, ADDRESS_TMADDRESS_BK, nBuf);		
2235  02c7 96            	ldw	x,sp
2236  02c8 5c            	incw	x
2237  02c9 89            	pushw	x
2238  02ca ae1085        	ldw	x,#4229
2239  02cd               LC004:
2240  02cd 89            	pushw	x
2241  02ce 7b2a          	ld	a,(OFST+9,sp)
2242  02d0 cd0077        	call	_SaveGroup
2244  02d3               LC003:
2245  02d3 5b04          	addw	sp,#4
2246  02d5               L3421:
2247                     ; 547 }
2250  02d5 5b23          	addw	sp,#35
2251  02d7 81            	ret	
2254                     	switch	.const
2255  0021               L3721_nBuf:
2256  0021 00            	dc.b	0
2257  0022 000000000000  	ds.b	32
2333                     ; 554 u8 ReadParameterForType(u8* pnDat, u8 nLen, u8 nTpye)
2333                     ; 555 {
2334                     	switch	.text
2335  02d8               _ReadParameterForType:
2337  02d8 89            	pushw	x
2338  02d9 5226          	subw	sp,#38
2339       00000026      OFST:	set	38
2342                     ; 556 	u16 Address = 0, AddressBk = 0;
2344  02db 5f            	clrw	x
2345  02dc 1f02          	ldw	(OFST-36,sp),x
2348  02de 1f04          	ldw	(OFST-34,sp),x
2349                     ; 557 	u8 nBuf[MAX_LEN+1] = {0};
2351  02e0 96            	ldw	x,sp
2352  02e1 1c0006        	addw	x,#OFST-32
2353  02e4 90ae0021      	ldw	y,#L3721_nBuf
2354  02e8 a621          	ld	a,#33
2355  02ea cd0000        	call	c_xymvx
2357                     ; 559 	if(IPANDPORT_PARA == nTpye)
2359  02ed 7b2c          	ld	a,(OFST+6,sp)
2360  02ef a101          	cp	a,#1
2361  02f1 260a          	jrne	L7231
2362                     ; 561 		Address   = ADDRESS_IPPARA;
2364  02f3 ae1027        	ldw	x,#4135
2365  02f6 1f02          	ldw	(OFST-36,sp),x
2366                     ; 562 		AddressBk = ADDRESS_IPPARA_BK;
2368  02f8 ae10a7        	ldw	x,#4263
2370  02fb 2052          	jp	LC005
2371  02fd               L7231:
2372                     ; 564 	else if(APN_PARA == nTpye)
2374  02fd a102          	cp	a,#2
2375  02ff 260a          	jrne	L3331
2376                     ; 566 		Address   = ADDRESS_APN;
2378  0301 ae104f        	ldw	x,#4175
2379  0304 1f02          	ldw	(OFST-36,sp),x
2380                     ; 567 		AddressBk = ADDRESS_APN_BK;
2382  0306 ae10cf        	ldw	x,#4303
2384  0309 2044          	jp	LC005
2385  030b               L3331:
2386                     ; 569 	else if(REPORT_PARA == nTpye)
2388  030b a103          	cp	a,#3
2389  030d 260a          	jrne	L7331
2390                     ; 571 		Address   = ADDRESS_REPOERCYCLE;
2392  030f ae1064        	ldw	x,#4196
2393  0312 1f02          	ldw	(OFST-36,sp),x
2394                     ; 572 		AddressBk = ADDRESS_REPOERCYCLE_BK;
2396  0314 ae10e4        	ldw	x,#4324
2398  0317 2036          	jp	LC005
2399  0319               L7331:
2400                     ; 574 	else if(METER_PARA == nTpye)
2402  0319 a104          	cp	a,#4
2403  031b 260a          	jrne	L3431
2404                     ; 576 		Address   = ADDRESS_PARAMETER;
2406  031d ae1006        	ldw	x,#4102
2407  0320 1f02          	ldw	(OFST-36,sp),x
2408                     ; 577 		AddressBk = ADDRESS_PARAMETER_BK;
2410  0322 ae1086        	ldw	x,#4230
2412  0325 2028          	jp	LC005
2413  0327               L3431:
2414                     ; 579 	else if(LT_REP_TIME == nTpye)
2416  0327 a105          	cp	a,#5
2417  0329 260a          	jrne	L7431
2418                     ; 581 		Address   = ADDRESS_REPORTTIME;
2420  032b ae106f        	ldw	x,#4207
2421  032e 1f02          	ldw	(OFST-36,sp),x
2422                     ; 582 		AddressBk = ADDRESS_REPORTTIME_BK;
2424  0330 ae10ef        	ldw	x,#4335
2426  0333 201a          	jp	LC005
2427  0335               L7431:
2428                     ; 584 	else if(OPT_VALVE_PRAA == nTpye)
2430  0335 a106          	cp	a,#6
2431  0337 260a          	jrne	L3531
2432                     ; 586 		Address   = ADDRESS_OPTVALVE;
2434  0339 ae107a        	ldw	x,#4218
2435  033c 1f02          	ldw	(OFST-36,sp),x
2436                     ; 587 		AddressBk = ADDRESS_OPTVALVE_BK;
2438  033e ae10fa        	ldw	x,#4346
2440  0341 200c          	jp	LC005
2441  0343               L3531:
2442                     ; 589 	else if(TM_ADDRESS_PRAA == nTpye)
2444  0343 a107          	cp	a,#7
2445  0345 260a          	jrne	L1331
2446                     ; 591 		Address   = ADDRESS_TMADDRESS;
2448  0347 ae1005        	ldw	x,#4101
2449  034a 1f02          	ldw	(OFST-36,sp),x
2450                     ; 592 		AddressBk = ADDRESS_TMADDRESS_BK;	
2452  034c ae1085        	ldw	x,#4229
2453  034f               LC005:
2454  034f 1f04          	ldw	(OFST-34,sp),x
2455  0351               L1331:
2456                     ; 595 	ReadGroup(nLen+1, Address, nBuf);	
2458  0351 96            	ldw	x,sp
2459  0352 1c0006        	addw	x,#OFST-32
2460  0355 89            	pushw	x
2461  0356 1e04          	ldw	x,(OFST-34,sp)
2462  0358 89            	pushw	x
2463  0359 7b2f          	ld	a,(OFST+9,sp)
2464  035b 4c            	inc	a
2465  035c cd0000        	call	_ReadGroup
2467  035f 5b04          	addw	sp,#4
2468                     ; 596 	if(nBuf[nLen] == JX_AddSum8Bit(nBuf, nLen))
2470  0361 7b2b          	ld	a,(OFST+5,sp)
2471  0363 5f            	clrw	x
2472  0364 97            	ld	xl,a
2473  0365 89            	pushw	x
2474  0366 96            	ldw	x,sp
2475  0367 1c0008        	addw	x,#OFST-30
2476  036a cd0000        	call	_JX_AddSum8Bit
2478  036d 85            	popw	x
2479  036e 6b01          	ld	(OFST-37,sp),a
2480  0370 96            	ldw	x,sp
2481  0371 1c0006        	addw	x,#OFST-32
2482  0374 9f            	ld	a,xl
2483  0375 5e            	swapw	x
2484  0376 1b2b          	add	a,(OFST+5,sp)
2485  0378 2401          	jrnc	L441
2486  037a 5c            	incw	x
2487  037b               L441:
2488  037b 02            	rlwa	x,a
2489  037c f6            	ld	a,(x)
2490  037d 1101          	cp	a,(OFST-37,sp)
2491  037f 2618          	jrne	L1631
2492                     ; 598 		if(!JX_IsAllFillDat(nBuf, 0, nLen))
2494  0381 7b2b          	ld	a,(OFST+5,sp)
2495  0383 b703          	ld	c_lreg+3,a
2496  0385 3f02          	clr	c_lreg+2
2497  0387 3f01          	clr	c_lreg+1
2498  0389 3f00          	clr	c_lreg
2499  038b be02          	ldw	x,c_lreg+2
2500  038d 89            	pushw	x
2501  038e be00          	ldw	x,c_lreg
2502  0390 89            	pushw	x
2503  0391 4b00          	push	#0
2504  0393 96            	ldw	x,sp
2505  0394 1c000b        	addw	x,#OFST-27
2507                     ; 600 			MemcpyFunc(pnDat, nBuf, nLen);
2509                     ; 601 			return TRUE;
2511  0397 2044          	jp	LC006
2512  0399               L1631:
2513                     ; 606 		ReadGroup(nLen+1, AddressBk, nBuf);	
2515  0399 96            	ldw	x,sp
2516  039a 1c0006        	addw	x,#OFST-32
2517  039d 89            	pushw	x
2518  039e 1e06          	ldw	x,(OFST-32,sp)
2519  03a0 89            	pushw	x
2520  03a1 7b2f          	ld	a,(OFST+9,sp)
2521  03a3 4c            	inc	a
2522  03a4 cd0000        	call	_ReadGroup
2524  03a7 5b04          	addw	sp,#4
2525                     ; 607 		if(nBuf[nLen] == JX_AddSum8Bit(nBuf, nLen))
2527  03a9 7b2b          	ld	a,(OFST+5,sp)
2528  03ab 5f            	clrw	x
2529  03ac 97            	ld	xl,a
2530  03ad 89            	pushw	x
2531  03ae 96            	ldw	x,sp
2532  03af 1c0008        	addw	x,#OFST-30
2533  03b2 cd0000        	call	_JX_AddSum8Bit
2535  03b5 85            	popw	x
2536  03b6 6b01          	ld	(OFST-37,sp),a
2537  03b8 96            	ldw	x,sp
2538  03b9 1c0006        	addw	x,#OFST-32
2539  03bc 9f            	ld	a,xl
2540  03bd 5e            	swapw	x
2541  03be 1b2b          	add	a,(OFST+5,sp)
2542  03c0 2401          	jrnc	L651
2543  03c2 5c            	incw	x
2544  03c3               L651:
2545  03c3 02            	rlwa	x,a
2546  03c4 f6            	ld	a,(x)
2547  03c5 1101          	cp	a,(OFST-37,sp)
2548  03c7 2630          	jrne	L5631
2549                     ; 609 			if(!JX_IsAllFillDat(pnDat, 0, nLen))
2551  03c9 7b2b          	ld	a,(OFST+5,sp)
2552  03cb b703          	ld	c_lreg+3,a
2553  03cd 3f02          	clr	c_lreg+2
2554  03cf 3f01          	clr	c_lreg+1
2555  03d1 3f00          	clr	c_lreg
2556  03d3 be02          	ldw	x,c_lreg+2
2557  03d5 89            	pushw	x
2558  03d6 be00          	ldw	x,c_lreg
2559  03d8 89            	pushw	x
2560  03d9 4b00          	push	#0
2561  03db 1e2c          	ldw	x,(OFST+6,sp)
2563                     ; 611 				MemcpyFunc(pnDat, nBuf, nLen);
2566                     ; 612 				return TRUE;
2568  03dd               LC006:
2569  03dd cd0000        	call	_JX_IsAllFillDat
2570  03e0 5b05          	addw	sp,#5
2571  03e2 4d            	tnz	a
2572  03e3 2614          	jrne	L5631
2574  03e5 7b2b          	ld	a,(OFST+5,sp)
2575  03e7 88            	push	a
2576  03e8 96            	ldw	x,sp
2577  03e9 1c0007        	addw	x,#OFST-31
2578  03ec 89            	pushw	x
2579  03ed 1e2a          	ldw	x,(OFST+4,sp)
2580  03ef cd0000        	call	_MemcpyFunc
2581  03f2 5b03          	addw	sp,#3
2583  03f4 a601          	ld	a,#1
2585  03f6               L461:
2587  03f6 5b28          	addw	sp,#40
2588  03f8 81            	ret	
2589  03f9               L5631:
2590                     ; 617 	return FALSE;
2592  03f9 4f            	clr	a
2594  03fa 20fa          	jra	L461
2597                     	switch	.const
2598  0042               L3731_nBuf:
2599  0042 00            	dc.b	0
2600  0043 000000000000  	ds.b	12
2601  004f               L5731_nTmpBuf:
2602  004f ff            	dc.b	255
2603  0050 ff            	dc.b	255
2604  0051 ff            	dc.b	255
2605  0052 ff            	dc.b	255
2606  0053 ff            	dc.b	255
2607  0054 ff            	dc.b	255
2608  0055 000000000000  	ds.b	7
2756                     ; 632 void AddRecordFun(u8 *Record, u8 nLen, u8 *pnRecIndex, u8 nMaxNum, 
2756                     ; 633 	u32 dwIndexAdd, u32 dwRecordAdd, u8 nRecordLen)
2756                     ; 634 {
2757                     	switch	.text
2758  03fc               _AddRecordFun:
2760  03fc 89            	pushw	x
2761  03fd 5226          	subw	sp,#38
2762       00000026      OFST:	set	38
2765                     ; 635 	u16 nX = 0, address = 0, nInDexAdd = 0, nLoop = 0 ,wCurrIndex = 0;
2775                     ; 637 	u8 nBuf[RECORD_LEN+1]    = {0};
2777  03ff 96            	ldw	x,sp
2778  0400 5c            	incw	x
2779  0401 90ae0042      	ldw	y,#L3731_nBuf
2780  0405 a60d          	ld	a,#13
2781  0407 cd0000        	call	c_xymvx
2783                     ; 638 	u8 nTmpBuf[RECORD_LEN+1] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
2785  040a 96            	ldw	x,sp
2786  040b 1c000e        	addw	x,#OFST-24
2787  040e 90ae004f      	ldw	y,#L5731_nTmpBuf
2788  0412 a60d          	ld	a,#13
2789  0414 cd0000        	call	c_xymvx
2791                     ; 640 	nBuf[nLen] = JX_AddSum8Bit(Record, nLen);
2793  0417 96            	ldw	x,sp
2794  0418 5c            	incw	x
2795  0419 9f            	ld	a,xl
2796  041a 5e            	swapw	x
2797  041b 1b2b          	add	a,(OFST+5,sp)
2798  041d 2401          	jrnc	L071
2799  041f 5c            	incw	x
2800  0420               L071:
2801  0420 02            	rlwa	x,a
2802  0421 89            	pushw	x
2803  0422 7b2d          	ld	a,(OFST+7,sp)
2804  0424 5f            	clrw	x
2805  0425 97            	ld	xl,a
2806  0426 89            	pushw	x
2807  0427 1e2b          	ldw	x,(OFST+5,sp)
2808  0429 cd0000        	call	_JX_AddSum8Bit
2810  042c 85            	popw	x
2811  042d 85            	popw	x
2812  042e f7            	ld	(x),a
2813                     ; 641 	MemcpyFunc(nBuf, Record, nLen);	
2815  042f 7b2b          	ld	a,(OFST+5,sp)
2816  0431 88            	push	a
2817  0432 1e28          	ldw	x,(OFST+2,sp)
2818  0434 89            	pushw	x
2819  0435 96            	ldw	x,sp
2820  0436 1c0004        	addw	x,#OFST-34
2821  0439 cd0000        	call	_MemcpyFunc
2823  043c 5b03          	addw	sp,#3
2824                     ; 642 	nX = nLen+1; //加1字节校验
2826  043e 4f            	clr	a
2827  043f 97            	ld	xl,a
2828  0440 4c            	inc	a
2829  0441 1b2b          	add	a,(OFST+5,sp)
2830  0443 2401          	jrnc	L671
2831  0445 5c            	incw	x
2832  0446               L671:
2833  0446 02            	rlwa	x,a
2834  0447 1f21          	ldw	(OFST-5,sp),x
2835                     ; 644 	(*pnRecIndex) = (*pnRecIndex)+1;
2837  0449 1e2c          	ldw	x,(OFST+6,sp)
2838  044b 7c            	inc	(x)
2839                     ; 645 	if ((*pnRecIndex) >= nMaxNum)
2841  044c f6            	ld	a,(x)
2842  044d 112e          	cp	a,(OFST+8,sp)
2843  044f 2502          	jrult	L1641
2844                     ; 647 		(*pnRecIndex) = 0;
2846  0451 4f            	clr	a
2847  0452 f7            	ld	(x),a
2848  0453               L1641:
2849                     ; 649 	wCurrIndex = (*pnRecIndex);
2851  0453 5f            	clrw	x
2852  0454 97            	ld	xl,a
2853  0455 1f1f          	ldw	(OFST-7,sp),x
2854                     ; 652 	nInDexAdd = dwIndexAdd;
2856  0457 1e31          	ldw	x,(OFST+11,sp)
2857  0459 1f25          	ldw	(OFST-1,sp),x
2858                     ; 654 	ReadGroup(sizeof(index), nInDexAdd, (u8 *)&index);		//读指针,下面做平衡算法
2860  045b 96            	ldw	x,sp
2861  045c 1c001b        	addw	x,#OFST-11
2862  045f 89            	pushw	x
2863  0460 1e27          	ldw	x,(OFST+1,sp)
2864  0462 89            	pushw	x
2865  0463 a604          	ld	a,#4
2866  0465 cd0000        	call	_ReadGroup
2868  0468 5b04          	addw	sp,#4
2869                     ; 655 	if (index.Bytes.B0 == 0xff)		//第一次?
2871  046a 7b1b          	ld	a,(OFST-11,sp)
2872  046c 4c            	inc	a
2873  046d 263c          	jrne	L3641
2874                     ; 657 		SaveByte(nInDexAdd, wCurrIndex);		//保存指针
2876  046f 7b20          	ld	a,(OFST-6,sp)
2877  0471 88            	push	a
2878  0472 1e26          	ldw	x,(OFST+0,sp)
2879  0474 cd0057        	call	_SaveByte
2881  0477 84            	pop	a
2882                     ; 658 		address = dwRecordAdd;
2884  0478 1e35          	ldw	x,(OFST+15,sp)
2885  047a 1f23          	ldw	(OFST-3,sp),x
2886                     ; 659 		for(nLoop = 0; nLoop < nMaxNum; nLoop++)
2888  047c 5f            	clrw	x
2890  047d 201c          	jra	L1741
2891  047f               L5641:
2892                     ; 661 			address +=(nLoop*nX);
2894  047f 1621          	ldw	y,(OFST-5,sp)
2895  0481 cd0000        	call	c_imul
2897  0484 72fb23        	addw	x,(OFST-3,sp)
2898  0487 1f23          	ldw	(OFST-3,sp),x
2899                     ; 662 			SaveGroup(nX, address, nTmpBuf);
2901  0489 96            	ldw	x,sp
2902  048a 1c000e        	addw	x,#OFST-24
2903  048d 89            	pushw	x
2904  048e 1e25          	ldw	x,(OFST-1,sp)
2905  0490 89            	pushw	x
2906  0491 7b26          	ld	a,(OFST+0,sp)
2907  0493 cd0077        	call	_SaveGroup
2909  0496 5b04          	addw	sp,#4
2910                     ; 659 		for(nLoop = 0; nLoop < nMaxNum; nLoop++)
2912  0498 1e25          	ldw	x,(OFST-1,sp)
2913  049a 5c            	incw	x
2914  049b               L1741:
2915  049b 1f25          	ldw	(OFST-1,sp),x
2918  049d 7b2e          	ld	a,(OFST+8,sp)
2919  049f 5f            	clrw	x
2920  04a0 97            	ld	xl,a
2921  04a1 bf00          	ldw	c_x,x
2922  04a3 1e25          	ldw	x,(OFST-1,sp)
2923  04a5 b300          	cpw	x,c_x
2924  04a7 25d6          	jrult	L5641
2926  04a9 204e          	jra	L5741
2927  04ab               L3641:
2928                     ; 665 	else if (index.Bytes.B1 == 0xff)
2930  04ab 7b1c          	ld	a,(OFST-10,sp)
2931  04ad 4c            	inc	a
2932  04ae 2608          	jrne	L7741
2933                     ; 667 		SaveByte(nInDexAdd + 1, wCurrIndex);	//保存指针
2935  04b0 7b20          	ld	a,(OFST-6,sp)
2936  04b2 88            	push	a
2937  04b3 1e26          	ldw	x,(OFST+0,sp)
2938  04b5 5c            	incw	x
2941  04b6 203d          	jp	LC007
2942  04b8               L7741:
2943                     ; 669 	else if (index.Bytes.B2 == 0xff)
2945  04b8 7b1d          	ld	a,(OFST-9,sp)
2946  04ba 4c            	inc	a
2947  04bb 260a          	jrne	L3051
2948                     ; 671 		SaveByte(nInDexAdd + 2, wCurrIndex);	//保存指针
2950  04bd 7b20          	ld	a,(OFST-6,sp)
2951  04bf 88            	push	a
2952  04c0 1e26          	ldw	x,(OFST+0,sp)
2953  04c2 1c0002        	addw	x,#2
2956  04c5 202e          	jp	LC007
2957  04c7               L3051:
2958                     ; 673 	else if (index.Bytes.B3 == 0xff)
2960  04c7 7b1e          	ld	a,(OFST-8,sp)
2961  04c9 4c            	inc	a
2962  04ca 2605          	jrne	L7051
2963                     ; 675 		SaveByte(nInDexAdd + 3, wCurrIndex);	//保存指针
2965  04cc 7b20          	ld	a,(OFST-6,sp)
2966  04ce 88            	push	a
2969  04cf 201f          	jp	LC008
2970  04d1               L7051:
2971                     ; 679 		SaveByte(nInDexAdd, wCurrIndex);		//保存指针
2973  04d1 7b20          	ld	a,(OFST-6,sp)
2974  04d3 88            	push	a
2975  04d4 1e26          	ldw	x,(OFST+0,sp)
2976  04d6 cd0057        	call	_SaveByte
2978  04d9 84            	pop	a
2979                     ; 680 		SaveByte(nInDexAdd + 1, 0xff);		//清除
2981  04da 4bff          	push	#255
2982  04dc 1e26          	ldw	x,(OFST+0,sp)
2983  04de 5c            	incw	x
2984  04df cd0057        	call	_SaveByte
2986  04e2 84            	pop	a
2987                     ; 681 		SaveByte(nInDexAdd + 2, 0xff);		//清除
2989  04e3 4bff          	push	#255
2990  04e5 1e26          	ldw	x,(OFST+0,sp)
2991  04e7 1c0002        	addw	x,#2
2992  04ea cd0057        	call	_SaveByte
2994  04ed 84            	pop	a
2995                     ; 682 		SaveByte(nInDexAdd + 3, 0xff);		//清除
2997  04ee 4bff          	push	#255
2998  04f0               LC008:
2999  04f0 1e26          	ldw	x,(OFST+0,sp)
3000  04f2 1c0003        	addw	x,#3
3002  04f5               LC007:
3003  04f5 cd0057        	call	_SaveByte
3004  04f8 84            	pop	a
3005  04f9               L5741:
3006                     ; 685 	address = dwRecordAdd;		            //EEPROM开始地址
3008  04f9 1e35          	ldw	x,(OFST+15,sp)
3009  04fb 1f23          	ldw	(OFST-3,sp),x
3010                     ; 686 	address += wCurrIndex * (nRecordLen+1);		//+记录偏移 	
3012  04fd 7b37          	ld	a,(OFST+17,sp)
3013  04ff 5f            	clrw	x
3014  0500 97            	ld	xl,a
3015  0501 5c            	incw	x
3016  0502 161f          	ldw	y,(OFST-7,sp)
3017  0504 cd0000        	call	c_imul
3019  0507 72fb23        	addw	x,(OFST-3,sp)
3020  050a 1f23          	ldw	(OFST-3,sp),x
3021                     ; 687 	SaveGroup(nX, address, nBuf);
3023  050c 96            	ldw	x,sp
3024  050d 5c            	incw	x
3025  050e 89            	pushw	x
3026  050f 1e25          	ldw	x,(OFST-1,sp)
3027  0511 89            	pushw	x
3028  0512 7b26          	ld	a,(OFST+0,sp)
3029  0514 cd0077        	call	_SaveGroup
3031  0517 5b2c          	addw	sp,#44
3032                     ; 688 }
3035  0519 81            	ret	
3038                     	switch	.const
3039  005c               L3151_nBuf:
3040  005c 00            	dc.b	0
3041  005d 000000000000  	ds.b	12
3144                     ; 697 u8 ReadRecordFun(u8 nIndex, u8 *Record, u8 nOutLen, u8 nRecIndex, u8 nMaxNum, u32 dwRecordAdd)
3144                     ; 698 {
3145                     	switch	.text
3146  051a               _ReadRecordFun:
3148  051a 88            	push	a
3149  051b 5214          	subw	sp,#20
3150       00000014      OFST:	set	20
3153                     ; 699 	u16 nX = 0, address = 0;
3157                     ; 700 	u16 nReadIndex = 0;
3159                     ; 701 	u8 nBuf[RECORD_LEN+1] = {0};
3161  051d 96            	ldw	x,sp
3162  051e 1c0006        	addw	x,#OFST-14
3163  0521 90ae005c      	ldw	y,#L3151_nBuf
3164  0525 a60d          	ld	a,#13
3165  0527 cd0000        	call	c_xymvx
3167                     ; 703 	if(NULL == Record || nOutLen > sizeof(TypeRecord) || (nMaxNum <= nIndex))
3169  052a 1e18          	ldw	x,(OFST+4,sp)
3170  052c 2603cc05d4    	jreq	L1751
3172  0531 7b1a          	ld	a,(OFST+6,sp)
3173  0533 a10d          	cp	a,#13
3174  0535 24f7          	jruge	L1751
3176  0537 7b1c          	ld	a,(OFST+8,sp)
3177  0539 1115          	cp	a,(OFST+1,sp)
3178                     ; 705 		return FALSE;
3180  053b 23f1          	jrule	L1751
3181                     ; 708 	nX = nOutLen+1;
3183  053d 4f            	clr	a
3184  053e 97            	ld	xl,a
3185  053f 4c            	inc	a
3186  0540 1b1a          	add	a,(OFST+6,sp)
3187  0542 2401          	jrnc	L032
3188  0544 5c            	incw	x
3189  0545               L032:
3190  0545 02            	rlwa	x,a
3191  0546 1f13          	ldw	(OFST-1,sp),x
3192                     ; 711 	if(nRecIndex < nIndex)
3194  0548 7b1b          	ld	a,(OFST+7,sp)
3195  054a 1115          	cp	a,(OFST+1,sp)
3196  054c 2414          	jruge	L5651
3197                     ; 713 		nReadIndex = (u8)nMaxNum - (nIndex - nRecIndex);
3199  054e 7b15          	ld	a,(OFST+1,sp)
3200  0550 5f            	clrw	x
3201  0551 101b          	sub	a,(OFST+7,sp)
3202  0553 2401          	jrnc	L232
3203  0555 5a            	decw	x
3204  0556               L232:
3205  0556 02            	rlwa	x,a
3206  0557 1f02          	ldw	(OFST-18,sp),x
3207  0559 7b1c          	ld	a,(OFST+8,sp)
3208  055b 5f            	clrw	x
3209  055c 97            	ld	xl,a
3210  055d 72f002        	subw	x,(OFST-18,sp)
3212  0560 200c          	jra	L7651
3213  0562               L5651:
3214                     ; 717 		nReadIndex = nRecIndex - nIndex;
3216  0562 5f            	clrw	x
3217  0563 1015          	sub	a,(OFST+1,sp)
3218  0565 2401          	jrnc	L432
3219  0567 5a            	decw	x
3220  0568               L432:
3221  0568 02            	rlwa	x,a
3222  0569 1f04          	ldw	(OFST-16,sp),x
3223  056b 01            	rrwa	x,a
3224  056c 1e04          	ldw	x,(OFST-16,sp)
3225  056e               L7651:
3226                     ; 720 	address = nReadIndex*nX + dwRecordAdd;	
3228  056e 1613          	ldw	y,(OFST-1,sp)
3229  0570 cd0000        	call	c_imul
3231  0573 72fb1f        	addw	x,(OFST+11,sp)
3232  0576 1f04          	ldw	(OFST-16,sp),x
3233                     ; 721 	ReadGroup(nX, address, nBuf);	
3235  0578 96            	ldw	x,sp
3236  0579 1c0006        	addw	x,#OFST-14
3237  057c 89            	pushw	x
3238  057d 1e06          	ldw	x,(OFST-14,sp)
3239  057f 89            	pushw	x
3240  0580 7b18          	ld	a,(OFST+4,sp)
3241  0582 cd0000        	call	_ReadGroup
3243  0585 5b04          	addw	sp,#4
3244                     ; 722 	if(nBuf[nX-1] == JX_AddSum8Bit(nBuf, nX-1))
3246  0587 1e13          	ldw	x,(OFST-1,sp)
3247  0589 5a            	decw	x
3248  058a 89            	pushw	x
3249  058b 96            	ldw	x,sp
3250  058c 1c0008        	addw	x,#OFST-12
3251  058f cd0000        	call	_JX_AddSum8Bit
3253  0592 85            	popw	x
3254  0593 6b03          	ld	(OFST-17,sp),a
3255  0595 96            	ldw	x,sp
3256  0596 1c0006        	addw	x,#OFST-14
3257  0599 1f01          	ldw	(OFST-19,sp),x
3258  059b 1e13          	ldw	x,(OFST-1,sp)
3259  059d 5a            	decw	x
3260  059e 72fb01        	addw	x,(OFST-19,sp)
3261  05a1 f6            	ld	a,(x)
3262  05a2 1103          	cp	a,(OFST-17,sp)
3263  05a4 262e          	jrne	L1751
3264                     ; 724 		if(!JX_IsAllFillDat(nBuf, 0, nX-1))
3266  05a6 1e13          	ldw	x,(OFST-1,sp)
3267  05a8 5a            	decw	x
3268  05a9 cd0000        	call	c_uitolx
3270  05ac be02          	ldw	x,c_lreg+2
3271  05ae 89            	pushw	x
3272  05af be00          	ldw	x,c_lreg
3273  05b1 89            	pushw	x
3274  05b2 4b00          	push	#0
3275  05b4 96            	ldw	x,sp
3276  05b5 1c000b        	addw	x,#OFST-9
3277  05b8 cd0000        	call	_JX_IsAllFillDat
3279  05bb 5b05          	addw	sp,#5
3280  05bd 4d            	tnz	a
3281  05be 2614          	jrne	L1751
3282                     ; 726 			MemcpyFunc(Record, nBuf, nOutLen); 
3284  05c0 7b1a          	ld	a,(OFST+6,sp)
3285  05c2 88            	push	a
3286  05c3 96            	ldw	x,sp
3287  05c4 1c0007        	addw	x,#OFST-13
3288  05c7 89            	pushw	x
3289  05c8 1e1b          	ldw	x,(OFST+7,sp)
3290  05ca cd0000        	call	_MemcpyFunc
3292  05cd 5b03          	addw	sp,#3
3293                     ; 727 			return TRUE;
3295  05cf a601          	ld	a,#1
3297  05d1               L642:
3299  05d1 5b15          	addw	sp,#21
3300  05d3 81            	ret	
3301  05d4               L1751:
3302                     ; 731 	return FALSE;
3305  05d4 4f            	clr	a
3307  05d5 20fa          	jra	L642
3310                     	switch	.const
3311  0069               L5751_nBuf:
3312  0069 00            	dc.b	0
3313  006a 000000000000  	ds.b	15
3398                     ; 741 u8 EditRecord(u8 nIndex, u8 *Record, u8 nInLen)
3398                     ; 742 {
3399                     	switch	.text
3400  05d7               _EditRecord:
3402  05d7 88            	push	a
3403  05d8 5217          	subw	sp,#23
3404       00000017      OFST:	set	23
3407                     ; 743 	u16 nX = 0, address = 0;
3411                     ; 744 	u16 nReadIndex = 0;
3413                     ; 745 	u8 nBuf[16] = {0};
3415  05da 96            	ldw	x,sp
3416  05db 1c0008        	addw	x,#OFST-15
3417  05de 90ae0069      	ldw	y,#L5751_nBuf
3418  05e2 a610          	ld	a,#16
3419  05e4 cd0000        	call	c_xymvx
3421                     ; 747 	if(NULL == Record || nInLen < sizeof(TypeRecord) || (NUMBER_RECORD < nIndex))
3423  05e7 1e1b          	ldw	x,(OFST+4,sp)
3424  05e9 2603cc06be    	jreq	L5461
3426  05ee 7b1d          	ld	a,(OFST+6,sp)
3427  05f0 a10c          	cp	a,#12
3428  05f2 25f7          	jrult	L5461
3430  05f4 7b18          	ld	a,(OFST+1,sp)
3431  05f6 a11d          	cp	a,#29
3432                     ; 749 		return FALSE;
3434  05f8 24f1          	jruge	L5461
3435                     ; 752 	nX = sizeof(TypeRecord)+1;
3437  05fa ae000d        	ldw	x,#13
3438  05fd 1f06          	ldw	(OFST-17,sp),x
3439                     ; 755 	if(ucRecordIndex < nIndex)
3441  05ff c60002        	ld	a,_ucRecordIndex
3442  0602 1118          	cp	a,(OFST+1,sp)
3443  0604 2414          	jruge	L1461
3444                     ; 757 		nReadIndex = (u8)NUMBER_RECORD - (nIndex - ucRecordIndex);
3446  0606 7b18          	ld	a,(OFST+1,sp)
3447  0608 5f            	clrw	x
3448  0609 c00002        	sub	a,_ucRecordIndex
3449  060c 2401          	jrnc	L252
3450  060e 5a            	decw	x
3451  060f               L252:
3452  060f 02            	rlwa	x,a
3453  0610 1f02          	ldw	(OFST-21,sp),x
3454  0612 ae001c        	ldw	x,#28
3455  0615 72f002        	subw	x,(OFST-21,sp)
3457  0618 2007          	jra	L3461
3458  061a               L1461:
3459                     ; 761 		nReadIndex = ucRecordIndex - nIndex;
3461  061a 5f            	clrw	x
3462  061b 1018          	sub	a,(OFST+1,sp)
3463  061d 2401          	jrnc	L452
3464  061f 5a            	decw	x
3465  0620               L452:
3466  0620 02            	rlwa	x,a
3467  0621               L3461:
3468  0621 1f04          	ldw	(OFST-19,sp),x
3469                     ; 764 	MemcpyFunc(nBuf, Record, nInLen);
3471  0623 7b1d          	ld	a,(OFST+6,sp)
3472  0625 88            	push	a
3473  0626 1e1c          	ldw	x,(OFST+5,sp)
3474  0628 89            	pushw	x
3475  0629 96            	ldw	x,sp
3476  062a 1c000b        	addw	x,#OFST-12
3477  062d cd0000        	call	_MemcpyFunc
3479  0630 5b03          	addw	sp,#3
3480                     ; 765 	address = nReadIndex*nX + ADDRESS_RECORD;	
3482  0632 1e04          	ldw	x,(OFST-19,sp)
3483  0634 1606          	ldw	y,(OFST-17,sp)
3484  0636 cd0000        	call	c_imul
3486  0639 1c11d7        	addw	x,#4567
3487  063c 1f04          	ldw	(OFST-19,sp),x
3488                     ; 766 	nBuf[nX-1] = JX_AddSum8Bit(nBuf, nX-1);
3490  063e 1e06          	ldw	x,(OFST-17,sp)
3491  0640 5a            	decw	x
3492  0641 89            	pushw	x
3493  0642 96            	ldw	x,sp
3494  0643 1c000a        	addw	x,#OFST-13
3495  0646 cd0000        	call	_JX_AddSum8Bit
3497  0649 85            	popw	x
3498  064a 96            	ldw	x,sp
3499  064b 1c0008        	addw	x,#OFST-15
3500  064e 1f02          	ldw	(OFST-21,sp),x
3501  0650 1e06          	ldw	x,(OFST-17,sp)
3502  0652 5a            	decw	x
3503  0653 72fb02        	addw	x,(OFST-21,sp)
3504  0656 f7            	ld	(x),a
3505                     ; 767 	SaveGroup(nX, address, nBuf);
3507  0657 96            	ldw	x,sp
3508  0658 1c0008        	addw	x,#OFST-15
3509  065b 89            	pushw	x
3510  065c 1e06          	ldw	x,(OFST-17,sp)
3511  065e 89            	pushw	x
3512  065f 7b0b          	ld	a,(OFST-12,sp)
3513  0661 cd0077        	call	_SaveGroup
3515  0664 5b04          	addw	sp,#4
3516                     ; 769 	MemsetFunc(nBuf, 0, sizeof(nBuf));
3518  0666 4b10          	push	#16
3519  0668 4b00          	push	#0
3520  066a 96            	ldw	x,sp
3521  066b 1c000a        	addw	x,#OFST-13
3522  066e cd0000        	call	_MemsetFunc
3524  0671 85            	popw	x
3525                     ; 770 	ReadGroup(nX, address, nBuf);
3527  0672 96            	ldw	x,sp
3528  0673 1c0008        	addw	x,#OFST-15
3529  0676 89            	pushw	x
3530  0677 1e06          	ldw	x,(OFST-17,sp)
3531  0679 89            	pushw	x
3532  067a 7b0b          	ld	a,(OFST-12,sp)
3533  067c cd0000        	call	_ReadGroup
3535  067f 5b04          	addw	sp,#4
3536                     ; 771 	if(nBuf[nX-1] == JX_AddSum8Bit(nBuf, nX-1))
3538  0681 1e06          	ldw	x,(OFST-17,sp)
3539  0683 5a            	decw	x
3540  0684 89            	pushw	x
3541  0685 96            	ldw	x,sp
3542  0686 1c000a        	addw	x,#OFST-13
3543  0689 cd0000        	call	_JX_AddSum8Bit
3545  068c 85            	popw	x
3546  068d 6b03          	ld	(OFST-20,sp),a
3547  068f 96            	ldw	x,sp
3548  0690 1c0008        	addw	x,#OFST-15
3549  0693 1f01          	ldw	(OFST-22,sp),x
3550  0695 1e06          	ldw	x,(OFST-17,sp)
3551  0697 5a            	decw	x
3552  0698 72fb01        	addw	x,(OFST-22,sp)
3553  069b f6            	ld	a,(x)
3554  069c 1103          	cp	a,(OFST-20,sp)
3555  069e 261e          	jrne	L5461
3556                     ; 773 		if(!JX_IsAllFillDat(nBuf, 0, nX-1))
3558  06a0 1e06          	ldw	x,(OFST-17,sp)
3559  06a2 5a            	decw	x
3560  06a3 cd0000        	call	c_uitolx
3562  06a6 be02          	ldw	x,c_lreg+2
3563  06a8 89            	pushw	x
3564  06a9 be00          	ldw	x,c_lreg
3565  06ab 89            	pushw	x
3566  06ac 4b00          	push	#0
3567  06ae 96            	ldw	x,sp
3568  06af 1c000d        	addw	x,#OFST-10
3569  06b2 cd0000        	call	_JX_IsAllFillDat
3571  06b5 5b05          	addw	sp,#5
3572  06b7 4d            	tnz	a
3573  06b8 2604          	jrne	L5461
3574                     ; 775 			return TRUE;
3576  06ba 4c            	inc	a
3578  06bb               L472:
3580  06bb 5b18          	addw	sp,#24
3581  06bd 81            	ret	
3582  06be               L5461:
3583                     ; 779 	return FALSE;
3586  06be 4f            	clr	a
3588  06bf 20fa          	jra	L472
3632                     ; 790 void AddAlmRecord(u8 *Record, u8 nLen)
3632                     ; 791 {
3633                     	switch	.text
3634  06c1               _AddAlmRecord:
3636  06c1 89            	pushw	x
3637       00000000      OFST:	set	0
3640                     ; 792 	AddRecordFun(Record, nLen, &g_nRecAlmIndex, NUMBER_RECORD_ALM, 
3640                     ; 793 		ADDRESS_INDEX_ALM, ADDRESS_RECORD_ALM, RECORD_LEN_ALM);
3642  06c2 4b09          	push	#9
3643  06c4 ae1109        	ldw	x,#4361
3644  06c7 89            	pushw	x
3645  06c8 5f            	clrw	x
3646  06c9 89            	pushw	x
3647  06ca ae1105        	ldw	x,#4357
3648  06cd 89            	pushw	x
3649  06ce 5f            	clrw	x
3650  06cf 89            	pushw	x
3651  06d0 4b03          	push	#3
3652  06d2 ae0003        	ldw	x,#_g_nRecAlmIndex
3653  06d5 89            	pushw	x
3654  06d6 7b11          	ld	a,(OFST+17,sp)
3655  06d8 88            	push	a
3656  06d9 1e0e          	ldw	x,(OFST+14,sp)
3657  06db cd03fc        	call	_AddRecordFun
3659  06de 5b0d          	addw	sp,#13
3660                     ; 794 }
3663  06e0 85            	popw	x
3664  06e1 81            	ret	
3715                     ; 804 u8 ReadAlmRecord(u8 nIndex, u8 *Record, u8 nOutLen)
3715                     ; 805 {
3716                     	switch	.text
3717  06e2               _ReadAlmRecord:
3719  06e2 88            	push	a
3720       00000000      OFST:	set	0
3723                     ; 806 	return (ReadRecordFun(nIndex, Record, nOutLen, g_nRecAlmIndex, NUMBER_RECORD_ALM, ADDRESS_RECORD_ALM));
3725  06e3 ae1109        	ldw	x,#4361
3726  06e6 89            	pushw	x
3727  06e7 5f            	clrw	x
3728  06e8 89            	pushw	x
3729  06e9 4b03          	push	#3
3730  06eb 3b0003        	push	_g_nRecAlmIndex
3731  06ee 7b0c          	ld	a,(OFST+12,sp)
3732  06f0 88            	push	a
3733  06f1 1e0b          	ldw	x,(OFST+11,sp)
3734  06f3 89            	pushw	x
3735  06f4 7b0a          	ld	a,(OFST+10,sp)
3736  06f6 cd051a        	call	_ReadRecordFun
3738  06f9 5b0a          	addw	sp,#10
3741  06fb 81            	ret	
3785                     ; 817 void AddRecord(u8 *Record, u8 nLen)
3785                     ; 818 {
3786                     	switch	.text
3787  06fc               _AddRecord:
3789  06fc 89            	pushw	x
3790       00000000      OFST:	set	0
3793                     ; 819 	AddRecordFun(Record, nLen, &ucRecordIndex, NUMBER_RECORD, 
3793                     ; 820 		ADDRESS_INDEX, ADDRESS_RECORD, RECORD_LEN);
3795  06fd 4b0c          	push	#12
3796  06ff ae11d7        	ldw	x,#4567
3797  0702 89            	pushw	x
3798  0703 5f            	clrw	x
3799  0704 89            	pushw	x
3800  0705 ae11d3        	ldw	x,#4563
3801  0708 89            	pushw	x
3802  0709 5f            	clrw	x
3803  070a 89            	pushw	x
3804  070b 4b1c          	push	#28
3805  070d ae0002        	ldw	x,#_ucRecordIndex
3806  0710 89            	pushw	x
3807  0711 7b11          	ld	a,(OFST+17,sp)
3808  0713 88            	push	a
3809  0714 1e0e          	ldw	x,(OFST+14,sp)
3810  0716 cd03fc        	call	_AddRecordFun
3812  0719 5b0d          	addw	sp,#13
3813                     ; 821 }
3816  071b 85            	popw	x
3817  071c 81            	ret	
3868                     ; 830 u8 ReadRecord(u8 nIndex, u8 *Record, u8 nOutLen)
3868                     ; 831 {
3869                     	switch	.text
3870  071d               _ReadRecord:
3872  071d 88            	push	a
3873       00000000      OFST:	set	0
3876                     ; 832 	return (ReadRecordFun(nIndex, Record, nOutLen, ucRecordIndex, NUMBER_RECORD, ADDRESS_RECORD));
3878  071e ae11d7        	ldw	x,#4567
3879  0721 89            	pushw	x
3880  0722 5f            	clrw	x
3881  0723 89            	pushw	x
3882  0724 4b1c          	push	#28
3883  0726 3b0002        	push	_ucRecordIndex
3884  0729 7b0c          	ld	a,(OFST+12,sp)
3885  072b 88            	push	a
3886  072c 1e0b          	ldw	x,(OFST+11,sp)
3887  072e 89            	pushw	x
3888  072f 7b0a          	ld	a,(OFST+10,sp)
3889  0731 cd051a        	call	_ReadRecordFun
3891  0734 5b0a          	addw	sp,#10
3894  0736 81            	ret	
3938                     ; 844 void AddDayFreezeRecord(u8 *Record, u8 nLen)
3938                     ; 845 {
3939                     	switch	.text
3940  0737               _AddDayFreezeRecord:
3942  0737 89            	pushw	x
3943       00000000      OFST:	set	0
3946                     ; 846 	AddRecordFun(Record, nLen, &g_nDayRecIndex, NUMBER_RECORD_DAY, 
3946                     ; 847 		ADDRESS_INDEX_DAY, ADDRESS_RECORD_DAY, RECORD_LEN_DAY);
3948  0738 4b07          	push	#7
3949  073a ae1347        	ldw	x,#4935
3950  073d 89            	pushw	x
3951  073e 5f            	clrw	x
3952  073f 89            	pushw	x
3953  0740 ae1343        	ldw	x,#4931
3954  0743 89            	pushw	x
3955  0744 5f            	clrw	x
3956  0745 89            	pushw	x
3957  0746 4b1f          	push	#31
3958  0748 ae0001        	ldw	x,#_g_nDayRecIndex
3959  074b 89            	pushw	x
3960  074c 7b11          	ld	a,(OFST+17,sp)
3961  074e 88            	push	a
3962  074f 1e0e          	ldw	x,(OFST+14,sp)
3963  0751 cd03fc        	call	_AddRecordFun
3965  0754 5b0d          	addw	sp,#13
3966                     ; 848 }
3969  0756 85            	popw	x
3970  0757 81            	ret	
4022                     ; 857 u8 ReadDayFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen)
4022                     ; 858 {
4023                     	switch	.text
4024  0758               _ReadDayFreezeRecord:
4026  0758 88            	push	a
4027       00000000      OFST:	set	0
4030                     ; 859 	return (ReadRecordFun(nIndex, Record, nOutLen, g_nDayRecIndex, NUMBER_RECORD_DAY, ADDRESS_RECORD_DAY));
4032  0759 ae1347        	ldw	x,#4935
4033  075c 89            	pushw	x
4034  075d 5f            	clrw	x
4035  075e 89            	pushw	x
4036  075f 4b1f          	push	#31
4037  0761 3b0001        	push	_g_nDayRecIndex
4038  0764 7b0c          	ld	a,(OFST+12,sp)
4039  0766 88            	push	a
4040  0767 1e0b          	ldw	x,(OFST+11,sp)
4041  0769 89            	pushw	x
4042  076a 7b0a          	ld	a,(OFST+10,sp)
4043  076c cd051a        	call	_ReadRecordFun
4045  076f 5b0a          	addw	sp,#10
4048  0771 81            	ret	
4092                     ; 869 void AddMonFreezeRecord(u8 *Record, u8 nLen)
4092                     ; 870 {
4093                     	switch	.text
4094  0772               _AddMonFreezeRecord:
4096  0772 89            	pushw	x
4097       00000000      OFST:	set	0
4100                     ; 871 	AddRecordFun(Record, nLen, &g_nMonRecIndex, NUMBER_RECORD_MON, 
4100                     ; 872 		ADDRESS_INDEX_MON, ADDRESS_RECORD_MON, RECORD_LEN_MON);
4102  0773 4b06          	push	#6
4103  0775 ae112b        	ldw	x,#4395
4104  0778 89            	pushw	x
4105  0779 5f            	clrw	x
4106  077a 89            	pushw	x
4107  077b ae1127        	ldw	x,#4391
4108  077e 89            	pushw	x
4109  077f 5f            	clrw	x
4110  0780 89            	pushw	x
4111  0781 4b18          	push	#24
4112  0783 ae0000        	ldw	x,#_g_nMonRecIndex
4113  0786 89            	pushw	x
4114  0787 7b11          	ld	a,(OFST+17,sp)
4115  0789 88            	push	a
4116  078a 1e0e          	ldw	x,(OFST+14,sp)
4117  078c cd03fc        	call	_AddRecordFun
4119  078f 5b0d          	addw	sp,#13
4120                     ; 873 }
4123  0791 85            	popw	x
4124  0792 81            	ret	
4176                     ; 882 u8 ReadMonFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen)
4176                     ; 883 {
4177                     	switch	.text
4178  0793               _ReadMonFreezeRecord:
4180  0793 88            	push	a
4181       00000000      OFST:	set	0
4184                     ; 884 	return (ReadRecordFun(nIndex, Record, nOutLen, g_nMonRecIndex, NUMBER_RECORD_MON, ADDRESS_RECORD_MON));
4186  0794 ae112b        	ldw	x,#4395
4187  0797 89            	pushw	x
4188  0798 5f            	clrw	x
4189  0799 89            	pushw	x
4190  079a 4b18          	push	#24
4191  079c 3b0000        	push	_g_nMonRecIndex
4192  079f 7b0c          	ld	a,(OFST+12,sp)
4193  07a1 88            	push	a
4194  07a2 1e0b          	ldw	x,(OFST+11,sp)
4195  07a4 89            	pushw	x
4196  07a5 7b0a          	ld	a,(OFST+10,sp)
4197  07a7 cd051a        	call	_ReadRecordFun
4199  07aa 5b0a          	addw	sp,#10
4202  07ac 81            	ret	
4215                     	xdef	_ReadRecordFun
4216                     	xdef	_AddRecordFun
4217                     	xdef	_ReadIndex
4218                     	xdef	_SaveGroup
4219                     	switch	.bss
4220  0000               _g_nMonRecIndex:
4221  0000 00            	ds.b	1
4222                     	xdef	_g_nMonRecIndex
4223  0001               _g_nDayRecIndex:
4224  0001 00            	ds.b	1
4225                     	xdef	_g_nDayRecIndex
4226  0002               _ucRecordIndex:
4227  0002 00            	ds.b	1
4228                     	xdef	_ucRecordIndex
4229  0003               _g_nRecAlmIndex:
4230  0003 00            	ds.b	1
4231                     	xdef	_g_nRecAlmIndex
4232  0004               _stRepFail:
4233  0004 000000000000  	ds.b	9
4234                     	xdef	_stRepFail
4235  000d               _tyParameter:
4236  000d 000000000000  	ds.b	33
4237                     	xdef	_tyParameter
4238  002e               _tyRecord:
4239  002e 000000000000  	ds.b	12
4240                     	xdef	_tyRecord
4241                     	xdef	_ReadMonFreezeRecord
4242                     	xdef	_AddMonFreezeRecord
4243                     	xdef	_ReadDayFreezeRecord
4244                     	xdef	_AddDayFreezeRecord
4245                     	xdef	_ReadAlmRecord
4246                     	xdef	_AddAlmRecord
4247                     	xdef	_EditRecord
4248                     	xdef	_SaveByte
4249                     	xdef	_ReadGroup
4250                     	xdef	_ReadReportFlag
4251                     	xdef	_SaveReportFlag
4252                     	xdef	_SaveParameterForType
4253                     	xdef	_ReadParameterForType
4254                     	xdef	_ReadRecord
4255                     	xdef	_InitializeFile
4256                     	xdef	_AddRecord
4257                     	xref	_JX_IsAllFillDat
4258                     	xref	_JX_AddSum8Bit
4259                     	xref	_MemcpyFunc
4260                     	xref	_MemsetFunc
4261                     	xref	_delay_us
4262                     	xref.b	c_lreg
4263                     	xref.b	c_x
4283                     	xref	c_imul
4284                     	xref	c_xymvx
4285                     	xref	c_lcmp
4286                     	xref	c_lgadc
4287                     	xref	c_ladc
4288                     	xref	c_rtol
4289                     	xref	c_uitolx
4290                     	xref	c_ltor
4291                     	end
