   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 480                     ; 30 void ReadGroup(u8 Length, u16 Address, u8 *Data)		//从EEPROM指定地址读取N个字节
 480                     ; 31 {
 482                     	switch	.text
 483  0000               _ReadGroup:
 485  0000 88            	push	a
 486  0001 5209          	subw	sp,#9
 487       00000009      OFST:	set	9
 490                     ; 32 	uint32_t add, startadd, stopadd = 0;
 492  0003 96            	ldw	x,sp
 493  0004 1c0002        	addw	x,#OFST-7
 494  0007 cd0000        	call	c_ltor
 496                     ; 33 	uint8_t i = 0;
 498  000a 0f01          	clr	(OFST-8,sp)
 499                     ; 35 	startadd = Address + ((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 501  000c 1e0d          	ldw	x,(OFST+4,sp)
 502  000e cd0000        	call	c_uitolx
 504  0011 96            	ldw	x,sp
 505  0012 1c0006        	addw	x,#OFST-3
 506  0015 cd0000        	call	c_rtol
 508                     ; 36 	stopadd = startadd + Length;
 510  0018 96            	ldw	x,sp
 511  0019 1c0006        	addw	x,#OFST-3
 512  001c cd0000        	call	c_ltor
 514  001f 7b0a          	ld	a,(OFST+1,sp)
 515  0021 cd0000        	call	c_ladc
 517  0024 96            	ldw	x,sp
 518  0025 1c0002        	addw	x,#OFST-7
 519  0028 cd0000        	call	c_rtol
 521                     ; 37 	for (add = startadd; add < stopadd; add++)
 524  002b 2017          	jra	L162
 525  002d               L552:
 526                     ; 39 		Data[i++] = (*(PointerAttr uint8_t *) (MemoryAddressCast)add); //FLASH_ReadByte(add);
 528  002d 7b01          	ld	a,(OFST-8,sp)
 529  002f 0c01          	inc	(OFST-8,sp)
 530  0031 5f            	clrw	x
 531  0032 97            	ld	xl,a
 532  0033 72fb0f        	addw	x,(OFST+6,sp)
 533  0036 1608          	ldw	y,(OFST-1,sp)
 534  0038 90f6          	ld	a,(y)
 535  003a f7            	ld	(x),a
 536                     ; 37 	for (add = startadd; add < stopadd; add++)
 538  003b 96            	ldw	x,sp
 539  003c 1c0006        	addw	x,#OFST-3
 540  003f a601          	ld	a,#1
 541  0041 cd0000        	call	c_lgadc
 543  0044               L162:
 546  0044 96            	ldw	x,sp
 547  0045 1c0006        	addw	x,#OFST-3
 548  0048 cd0000        	call	c_ltor
 550  004b 96            	ldw	x,sp
 551  004c 1c0002        	addw	x,#OFST-7
 552  004f cd0000        	call	c_lcmp
 554  0052 25d9          	jrult	L552
 555                     ; 41 }
 558  0054 5b0a          	addw	sp,#10
 559  0056 81            	ret	
 599                     ; 51 void SaveByte(u16 Address, u8 Data)
 599                     ; 52 {
 600                     	switch	.text
 601  0057               _SaveByte:
 603  0057 89            	pushw	x
 604       00000000      OFST:	set	0
 607                     ; 59     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 609  0058 35ae5053      	mov	20563,#174
 610                     ; 60     FLASH->DUKR = FLASH_RASS_KEY1;
 612  005c 35565053      	mov	20563,#86
 614  0060               L703:
 615                     ; 63 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET)  //FLASH_GetFlagStatus(FLASH_FLAG_DUL)
 617  0060 72075054fb    	btjf	20564,#3,L703
 618                     ; 67 	*(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 620  0065 7b05          	ld	a,(OFST+5,sp)
 621  0067 1e01          	ldw	x,(OFST+1,sp)
 622  0069 f7            	ld	(x),a
 623                     ; 68 	delay_us(150);
 625  006a ae0096        	ldw	x,#150
 626  006d cd0000        	call	_delay_us
 629  0070               L513:
 630                     ; 71 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_HVOFF) == RESET)  //FLASH_GetFlagStatus(FLASH_FLAG_HVOFF)
 632  0070 720d5054fb    	btjf	20564,#6,L513
 633                     ; 73 }
 636  0075 85            	popw	x
 637  0076 81            	ret	
 694                     ; 84 void SaveGroup(u8 Length, u16 Address, u8 *Data)		//写n个字节到指定EEPROM的指定地址
 694                     ; 85 {
 695                     	switch	.text
 696  0077               _SaveGroup:
 698  0077 88            	push	a
 699  0078 89            	pushw	x
 700       00000002      OFST:	set	2
 703                     ; 86 	u16 wLoop = 0;
 705  0079 5f            	clrw	x
 706  007a 1f01          	ldw	(OFST-1,sp),x
 707                     ; 98     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 709  007c 35ae5053      	mov	20563,#174
 710                     ; 99     FLASH->DUKR = FLASH_RASS_KEY1;
 712  0080 35565053      	mov	20563,#86
 714  0084               L153:
 715                     ; 102 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET)
 717  0084 72075054fb    	btjf	20564,#3,L153
 718                     ; 105 	for(wLoop = 0; wLoop < Length; wLoop++)
 720  0089 5f            	clrw	x
 722  008a 2015          	jra	L163
 723  008c               L553:
 724                     ; 108 		*(PointerAttr uint8_t*) (MemoryAddressCast)(wLoop+Address) = Data[wLoop];
 726  008c 1e08          	ldw	x,(OFST+6,sp)
 727  008e 72fb01        	addw	x,(OFST-1,sp)
 728  0091 f6            	ld	a,(x)
 729  0092 1e01          	ldw	x,(OFST-1,sp)
 730  0094 72fb06        	addw	x,(OFST+4,sp)
 731  0097 f7            	ld	(x),a
 732                     ; 109 		delay_us(150);
 734  0098 ae0096        	ldw	x,#150
 735  009b cd0000        	call	_delay_us
 737                     ; 105 	for(wLoop = 0; wLoop < Length; wLoop++)
 739  009e 1e01          	ldw	x,(OFST-1,sp)
 740  00a0 5c            	incw	x
 741  00a1               L163:
 742  00a1 1f01          	ldw	(OFST-1,sp),x
 745  00a3 7b03          	ld	a,(OFST+1,sp)
 746  00a5 5f            	clrw	x
 747  00a6 97            	ld	xl,a
 748  00a7 bf00          	ldw	c_x,x
 749  00a9 1e01          	ldw	x,(OFST-1,sp)
 750  00ab b300          	cpw	x,c_x
 751  00ad 25dd          	jrult	L553
 753  00af               L763:
 754                     ; 113 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_HVOFF) == RESET)  
 756  00af 720d5054fb    	btjf	20564,#6,L763
 757                     ; 115 }
 760  00b4 5b03          	addw	sp,#3
 761  00b6 81            	ret	
1520                     ; 358 void SaveReportFlag(u8 nReportFlg)
1520                     ; 359 {
1521                     	switch	.text
1522  00b7               _SaveReportFlag:
1524  00b7 88            	push	a
1525  00b8 5208          	subw	sp,#8
1526       00000008      OFST:	set	8
1529                     ; 360 	u16 nX = 0, address = 0;
1531  00ba 5f            	clrw	x
1532  00bb 1f01          	ldw	(OFST-7,sp),x
1535                     ; 364 	address = ADDRESS_REPORTFLG;
1537  00bd ae1001        	ldw	x,#4097
1538  00c0 1f03          	ldw	(OFST-5,sp),x
1539                     ; 366 	ReadGroup(sizeof(index), address, (u8 *)&index);		//读指针,下面做平衡算法
1541  00c2 96            	ldw	x,sp
1542  00c3 1c0005        	addw	x,#OFST-3
1543  00c6 89            	pushw	x
1544  00c7 ae1001        	ldw	x,#4097
1545  00ca 89            	pushw	x
1546  00cb a604          	ld	a,#4
1547  00cd cd0000        	call	_ReadGroup
1549  00d0 5b04          	addw	sp,#4
1550                     ; 367 	if (index.Bytes.B0 == 0xff)		//第一次?
1552  00d2 7b05          	ld	a,(OFST-3,sp)
1553  00d4 4c            	inc	a
1554  00d5 2608          	jrne	L1501
1555                     ; 369 		SaveByte(ADDRESS_REPORTFLG, nReportFlg);		//保存指针
1557  00d7 7b09          	ld	a,(OFST+1,sp)
1558  00d9 88            	push	a
1559  00da ae1001        	ldw	x,#4097
1562  00dd 2045          	jra	L3501
1563  00df               L1501:
1564                     ; 371 	else if (index.Bytes.B1 == 0xff)
1566  00df 7b06          	ld	a,(OFST-2,sp)
1567  00e1 4c            	inc	a
1568  00e2 2608          	jrne	L5501
1569                     ; 373 		SaveByte(ADDRESS_REPORTFLG + 1, nReportFlg);	//保存指针
1571  00e4 7b09          	ld	a,(OFST+1,sp)
1572  00e6 88            	push	a
1573  00e7 ae1002        	ldw	x,#4098
1576  00ea 2038          	jra	L3501
1577  00ec               L5501:
1578                     ; 375 	else if (index.Bytes.B2 == 0xff)
1580  00ec 7b07          	ld	a,(OFST-1,sp)
1581  00ee 4c            	inc	a
1582  00ef 2608          	jrne	L1601
1583                     ; 377 		SaveByte(ADDRESS_REPORTFLG + 2, nReportFlg);	//保存指针
1585  00f1 7b09          	ld	a,(OFST+1,sp)
1586  00f3 88            	push	a
1587  00f4 ae1003        	ldw	x,#4099
1590  00f7 202b          	jra	L3501
1591  00f9               L1601:
1592                     ; 379 	else if (index.Bytes.B3 == 0xff)
1594  00f9 7b08          	ld	a,(OFST+0,sp)
1595  00fb 4c            	inc	a
1596  00fc 2605          	jrne	L5601
1597                     ; 381 		SaveByte(ADDRESS_REPORTFLG + 3, nReportFlg);	//保存指针
1599  00fe 7b09          	ld	a,(OFST+1,sp)
1600  0100 88            	push	a
1603  0101 201e          	jp	LC001
1604  0103               L5601:
1605                     ; 385 		SaveByte(ADDRESS_REPORTFLG, nReportFlg);		//保存指针
1607  0103 7b09          	ld	a,(OFST+1,sp)
1608  0105 88            	push	a
1609  0106 ae1001        	ldw	x,#4097
1610  0109 cd0057        	call	_SaveByte
1612  010c 84            	pop	a
1613                     ; 386 		SaveByte(ADDRESS_REPORTFLG + 1, 0xff);		//清除
1615  010d 4bff          	push	#255
1616  010f ae1002        	ldw	x,#4098
1617  0112 cd0057        	call	_SaveByte
1619  0115 84            	pop	a
1620                     ; 387 		SaveByte(ADDRESS_REPORTFLG + 2, 0xff);		//清除
1622  0116 4bff          	push	#255
1623  0118 ae1003        	ldw	x,#4099
1624  011b cd0057        	call	_SaveByte
1626  011e 84            	pop	a
1627                     ; 388 		SaveByte(ADDRESS_REPORTFLG + 3, 0xff);		//清除
1629  011f 4bff          	push	#255
1630  0121               LC001:
1631  0121 ae1004        	ldw	x,#4100
1633  0124               L3501:
1634  0124 cd0057        	call	_SaveByte
1635  0127 84            	pop	a
1636                     ; 390 }
1639  0128 5b09          	addw	sp,#9
1640  012a 81            	ret	
1676                     ; 399 u8 ReadReportFlag(void)
1676                     ; 400 {
1677                     	switch	.text
1678  012b               _ReadReportFlag:
1680  012b 5204          	subw	sp,#4
1681       00000004      OFST:	set	4
1684                     ; 403 	ReadGroup(sizeof(index), ADDRESS_REPORTFLG, (u8 *)&index);		//读指针,根据平衡算法,找到指针的真正位置
1686  012d 96            	ldw	x,sp
1687  012e 5c            	incw	x
1688  012f 89            	pushw	x
1689  0130 ae1001        	ldw	x,#4097
1690  0133 89            	pushw	x
1691  0134 a604          	ld	a,#4
1692  0136 cd0000        	call	_ReadGroup
1694  0139 5b04          	addw	sp,#4
1695                     ; 404 	if (index.Bytes.B3 < 0xff)		//有数据?
1697  013b 7b04          	ld	a,(OFST+0,sp)
1698  013d a1ff          	cp	a,#255
1699                     ; 406 		return index.Bytes.B3;
1702  013f 2506          	jrult	L64
1703                     ; 408 	else if (index.Bytes.B2 < 0xff)
1705  0141 7b03          	ld	a,(OFST-1,sp)
1706  0143 a1ff          	cp	a,#255
1707  0145 2403          	jruge	L3111
1708                     ; 410 		return index.Bytes.B2;
1711  0147               L64:
1713  0147 5b04          	addw	sp,#4
1714  0149 81            	ret	
1715  014a               L3111:
1716                     ; 412 	else if (index.Bytes.B1 < 0xff)
1718  014a 7b02          	ld	a,(OFST-2,sp)
1719  014c a1ff          	cp	a,#255
1720                     ; 414 		return index.Bytes.B1;
1723  014e 25f7          	jrult	L64
1724                     ; 416 	else if (index.Bytes.B0 < 0xff)
1726  0150 7b01          	ld	a,(OFST-3,sp)
1727  0152 a1ff          	cp	a,#255
1728                     ; 418 		return index.Bytes.B0;
1731  0154 25f1          	jrult	L64
1732                     ; 422 		return 0;
1734  0156 4f            	clr	a
1736  0157 20ee          	jra	L64
1786                     ; 433 u8 ReadIndex(u16 wAddr)
1786                     ; 434 {
1787                     	switch	.text
1788  0159               _ReadIndex:
1790  0159 89            	pushw	x
1791  015a 5205          	subw	sp,#5
1792       00000005      OFST:	set	5
1795                     ; 435 	u8 nIndexDat = 0;
1797  015c 0f01          	clr	(OFST-4,sp)
1798                     ; 438 	ReadGroup(sizeof(index), wAddr, (u8 *)&index);		//读指针,根据平衡算法,找到指针的真正位置
1800  015e 96            	ldw	x,sp
1801  015f 1c0002        	addw	x,#OFST-3
1802  0162 89            	pushw	x
1803  0163 1e08          	ldw	x,(OFST+3,sp)
1804  0165 89            	pushw	x
1805  0166 a604          	ld	a,#4
1806  0168 cd0000        	call	_ReadGroup
1808  016b 5b04          	addw	sp,#4
1809                     ; 439 	if (index.Bytes.B3 < 0xff)		//有数据?
1811  016d 7b05          	ld	a,(OFST+0,sp)
1812  016f a1ff          	cp	a,#255
1813                     ; 441 		nIndexDat = index.Bytes.B3;
1815  0171 2513          	jrult	L3511
1816                     ; 443 	else if (index.Bytes.B2 < 0xff)
1818  0173 7b04          	ld	a,(OFST-1,sp)
1819  0175 a1ff          	cp	a,#255
1820                     ; 445 		nIndexDat = index.Bytes.B2;
1822  0177 250d          	jrult	L3511
1823                     ; 447 	else if (index.Bytes.B1 < 0xff)
1825  0179 7b03          	ld	a,(OFST-2,sp)
1826  017b a1ff          	cp	a,#255
1827                     ; 449 		nIndexDat = index.Bytes.B1;
1829  017d 2507          	jrult	L3511
1830                     ; 451 	else if (index.Bytes.B0 < 0xff)
1832  017f 7b02          	ld	a,(OFST-3,sp)
1833  0181 a1ff          	cp	a,#255
1834                     ; 453 		nIndexDat = index.Bytes.B0;
1840  0183 2501          	jrult	L3511
1841                     ; 457 		nIndexDat = 0;
1843  0185 4f            	clr	a
1844  0186               L3511:
1845                     ; 459 	return nIndexDat;
1849  0186 5b07          	addw	sp,#7
1850  0188 81            	ret	
1876                     ; 469 void InitializeFile(void)
1876                     ; 470 {	
1877                     	switch	.text
1878  0189               _InitializeFile:
1882                     ; 472 	FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1884  0189 72115050      	bres	20560,#0
1885                     ; 473 	FLASH->CR1 |= (uint8_t)FLASH_ProgramTime_Standard;
1887  018d c65050        	ld	a,20560
1888                     ; 475     FLASH->DUKR = FLASH_RASS_KEY2; /* edit by maronglang Warning: keys are reversed on data memory !!! */
1890  0190 35ae5053      	mov	20563,#174
1891                     ; 476     FLASH->DUKR = FLASH_RASS_KEY1;
1893  0194 35565053      	mov	20563,#86
1895  0198               L5021:
1896                     ; 479 	while ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG_DUL) == RESET) // edit by maronglang20160217
1898  0198 72075054fb    	btjf	20564,#3,L5021
1899                     ; 483 	ucRecordIndex = ReadIndex(ADDRESS_INDEX);
1901  019d ae10ef        	ldw	x,#4335
1902  01a0 adb7          	call	_ReadIndex
1904  01a2 c70002        	ld	_ucRecordIndex,a
1905                     ; 486 	g_nRecAlmIndex = ReadIndex(ADDRESS_INDEX_ALM);
1907  01a5 ae10cd        	ldw	x,#4301
1908  01a8 adaf          	call	_ReadIndex
1910  01aa c70003        	ld	_g_nRecAlmIndex,a
1911                     ; 494 }
1914  01ad 81            	ret	
1917                     .const:	section	.text
1918  0000               L1121_nBuf:
1919  0000 00            	dc.b	0
1920  0001 000000000000  	ds.b	26
1983                     ; 501 void SaveParameterForType(u8* pnDat, u8 nLen, u8 nTpye)
1983                     ; 502 {
1984                     	switch	.text
1985  01ae               _SaveParameterForType:
1987  01ae 89            	pushw	x
1988  01af 521b          	subw	sp,#27
1989       0000001b      OFST:	set	27
1992                     ; 503   u8 nBuf[MAX_LEN+1] = {0};
1994  01b1 96            	ldw	x,sp
1995  01b2 5c            	incw	x
1996  01b3 90ae0000      	ldw	y,#L1121_nBuf
1997  01b7 a61b          	ld	a,#27
1998  01b9 cd0000        	call	c_xymvx
2000                     ; 505   nBuf[nLen] = JX_AddSum8Bit(pnDat, nLen);
2002  01bc 96            	ldw	x,sp
2003  01bd 5c            	incw	x
2004  01be 9f            	ld	a,xl
2005  01bf 5e            	swapw	x
2006  01c0 1b20          	add	a,(OFST+5,sp)
2007  01c2 2401          	jrnc	L46
2008  01c4 5c            	incw	x
2009  01c5               L46:
2010  01c5 02            	rlwa	x,a
2011  01c6 89            	pushw	x
2012  01c7 7b22          	ld	a,(OFST+7,sp)
2013  01c9 5f            	clrw	x
2014  01ca 97            	ld	xl,a
2015  01cb 89            	pushw	x
2016  01cc 1e20          	ldw	x,(OFST+5,sp)
2017  01ce cd0000        	call	_JX_AddSum8Bit
2019  01d1 85            	popw	x
2020  01d2 85            	popw	x
2021  01d3 f7            	ld	(x),a
2022                     ; 506 	MemcpyFunc(nBuf, pnDat, nLen);
2024  01d4 7b20          	ld	a,(OFST+5,sp)
2025  01d6 88            	push	a
2026  01d7 1e1d          	ldw	x,(OFST+2,sp)
2027  01d9 89            	pushw	x
2028  01da 96            	ldw	x,sp
2029  01db 1c0004        	addw	x,#OFST-23
2030  01de cd0000        	call	_MemcpyFunc
2032  01e1 5b03          	addw	sp,#3
2033                     ; 507 	nLen = nLen + 1;
2035  01e3 0c20          	inc	(OFST+5,sp)
2036                     ; 509 	if(IPANDPORT_PARA == nTpye)
2038  01e5 7b21          	ld	a,(OFST+6,sp)
2039  01e7 a101          	cp	a,#1
2040  01e9 2637          	jrne	L1421
2041                     ; 511 		SaveGroup(nLen, ADDRESS_IPPARA, nBuf);
2043  01eb 96            	ldw	x,sp
2044  01ec 5c            	incw	x
2045  01ed 89            	pushw	x
2046  01ee ae1025        	ldw	x,#4133
2047  01f1 89            	pushw	x
2048  01f2 7b24          	ld	a,(OFST+9,sp)
2049  01f4 cd0077        	call	_SaveGroup
2051  01f7 5b04          	addw	sp,#4
2052                     ; 512 		SaveGroup(nLen, ADDRESS_IPPARA_BK, nBuf);
2054  01f9 96            	ldw	x,sp
2055  01fa 5c            	incw	x
2056  01fb 89            	pushw	x
2057  01fc ae1089        	ldw	x,#4233
2058  01ff 89            	pushw	x
2059  0200 7b24          	ld	a,(OFST+9,sp)
2060  0202 cd0077        	call	_SaveGroup
2062  0205 5b04          	addw	sp,#4
2063                     ; 514 		MemsetFunc(nBuf, 0, sizeof(nBuf));
2065  0207 4b1b          	push	#27
2066  0209 4b00          	push	#0
2067  020b 96            	ldw	x,sp
2068  020c 1c0003        	addw	x,#OFST-24
2069  020f cd0000        	call	_MemsetFunc
2071  0212 85            	popw	x
2072                     ; 515 		ReadGroup(nLen, ADDRESS_IPPARA, nBuf);
2074  0213 96            	ldw	x,sp
2075  0214 5c            	incw	x
2076  0215 89            	pushw	x
2077  0216 ae1025        	ldw	x,#4133
2078  0219 89            	pushw	x
2079  021a 7b24          	ld	a,(OFST+9,sp)
2080  021c cd0000        	call	_ReadGroup
2083  021f cc02c3        	jp	LC003
2084  0222               L1421:
2085                     ; 517 	else if(APN_PARA == nTpye)
2087  0222 a102          	cp	a,#2
2088  0224 2617          	jrne	L5421
2089                     ; 519 		SaveGroup(nLen, ADDRESS_APN, nBuf);
2091  0226 96            	ldw	x,sp
2092  0227 5c            	incw	x
2093  0228 89            	pushw	x
2094  0229 ae1036        	ldw	x,#4150
2095  022c 89            	pushw	x
2096  022d 7b24          	ld	a,(OFST+9,sp)
2097  022f cd0077        	call	_SaveGroup
2099  0232 5b04          	addw	sp,#4
2100                     ; 520 		SaveGroup(nLen, ADDRESS_APN_BK, nBuf);
2102  0234 96            	ldw	x,sp
2103  0235 5c            	incw	x
2104  0236 89            	pushw	x
2105  0237 ae109a        	ldw	x,#4250
2108  023a cc02bd        	jp	LC004
2109  023d               L5421:
2110                     ; 522 	else if(REPORT_PARA == nTpye)
2112  023d a103          	cp	a,#3
2113  023f 2616          	jrne	L1521
2114                     ; 524 		SaveGroup(nLen, ADDRESS_REPOERCYCLE, nBuf);
2116  0241 96            	ldw	x,sp
2117  0242 5c            	incw	x
2118  0243 89            	pushw	x
2119  0244 ae1047        	ldw	x,#4167
2120  0247 89            	pushw	x
2121  0248 7b24          	ld	a,(OFST+9,sp)
2122  024a cd0077        	call	_SaveGroup
2124  024d 5b04          	addw	sp,#4
2125                     ; 525 		SaveGroup(nLen, ADDRESS_REPOERCYCLE_BK, nBuf);		
2127  024f 96            	ldw	x,sp
2128  0250 5c            	incw	x
2129  0251 89            	pushw	x
2130  0252 ae10ab        	ldw	x,#4267
2133  0255 2066          	jp	LC004
2134  0257               L1521:
2135                     ; 527 	else if(METER_PARA == nTpye)
2137  0257 a104          	cp	a,#4
2138  0259 2616          	jrne	L5521
2139                     ; 529 		SaveGroup(nLen, ADDRESS_PARAMETER, nBuf);
2141  025b 96            	ldw	x,sp
2142  025c 5c            	incw	x
2143  025d 89            	pushw	x
2144  025e ae100a        	ldw	x,#4106
2145  0261 89            	pushw	x
2146  0262 7b24          	ld	a,(OFST+9,sp)
2147  0264 cd0077        	call	_SaveGroup
2149  0267 5b04          	addw	sp,#4
2150                     ; 530 		SaveGroup(nLen, ADDRESS_PARAMETER_BK, nBuf);		
2152  0269 96            	ldw	x,sp
2153  026a 5c            	incw	x
2154  026b 89            	pushw	x
2155  026c ae106e        	ldw	x,#4206
2158  026f 204c          	jp	LC004
2159  0271               L5521:
2160                     ; 532 	else if(LT_REP_TIME == nTpye)
2162  0271 a105          	cp	a,#5
2163  0273 2616          	jrne	L1621
2164                     ; 534 		SaveGroup(nLen, ADDRESS_REPORTTIME, nBuf);
2166  0275 96            	ldw	x,sp
2167  0276 5c            	incw	x
2168  0277 89            	pushw	x
2169  0278 ae1053        	ldw	x,#4179
2170  027b 89            	pushw	x
2171  027c 7b24          	ld	a,(OFST+9,sp)
2172  027e cd0077        	call	_SaveGroup
2174  0281 5b04          	addw	sp,#4
2175                     ; 535 		SaveGroup(nLen, ADDRESS_REPORTTIME_BK, nBuf);		
2177  0283 96            	ldw	x,sp
2178  0284 5c            	incw	x
2179  0285 89            	pushw	x
2180  0286 ae10b7        	ldw	x,#4279
2183  0289 2032          	jp	LC004
2184  028b               L1621:
2185                     ; 537 	else if(OPT_VALVE_PRAA == nTpye)
2187  028b a106          	cp	a,#6
2188  028d 2616          	jrne	L5621
2189                     ; 539 		SaveGroup(nLen, ADDRESS_OPTVALVE, nBuf);
2191  028f 96            	ldw	x,sp
2192  0290 5c            	incw	x
2193  0291 89            	pushw	x
2194  0292 ae105e        	ldw	x,#4190
2195  0295 89            	pushw	x
2196  0296 7b24          	ld	a,(OFST+9,sp)
2197  0298 cd0077        	call	_SaveGroup
2199  029b 5b04          	addw	sp,#4
2200                     ; 540 		SaveGroup(nLen, ADDRESS_OPTVALVE_BK, nBuf);		
2202  029d 96            	ldw	x,sp
2203  029e 5c            	incw	x
2204  029f 89            	pushw	x
2205  02a0 ae10c2        	ldw	x,#4290
2208  02a3 2018          	jp	LC004
2209  02a5               L5621:
2210                     ; 542 	else if(TM_ADDRESS_PRAA == nTpye)
2212  02a5 a107          	cp	a,#7
2213  02a7 261c          	jrne	L3421
2214                     ; 544 		SaveGroup(nLen, ADDRESS_TMADDRESS, nBuf);
2216  02a9 96            	ldw	x,sp
2217  02aa 5c            	incw	x
2218  02ab 89            	pushw	x
2219  02ac ae1005        	ldw	x,#4101
2220  02af 89            	pushw	x
2221  02b0 7b24          	ld	a,(OFST+9,sp)
2222  02b2 cd0077        	call	_SaveGroup
2224  02b5 5b04          	addw	sp,#4
2225                     ; 545 		SaveGroup(nLen, ADDRESS_TMADDRESS_BK, nBuf);		
2227  02b7 96            	ldw	x,sp
2228  02b8 5c            	incw	x
2229  02b9 89            	pushw	x
2230  02ba ae1069        	ldw	x,#4201
2231  02bd               LC004:
2232  02bd 89            	pushw	x
2233  02be 7b24          	ld	a,(OFST+9,sp)
2234  02c0 cd0077        	call	_SaveGroup
2236  02c3               LC003:
2237  02c3 5b04          	addw	sp,#4
2238  02c5               L3421:
2239                     ; 547 }
2242  02c5 5b1d          	addw	sp,#29
2243  02c7 81            	ret	
2246                     	switch	.const
2247  001b               L3721_nBuf:
2248  001b 00            	dc.b	0
2249  001c 000000000000  	ds.b	26
2325                     ; 554 u8 ReadParameterForType(u8* pnDat, u8 nLen, u8 nTpye)
2325                     ; 555 {
2326                     	switch	.text
2327  02c8               _ReadParameterForType:
2329  02c8 89            	pushw	x
2330  02c9 5220          	subw	sp,#32
2331       00000020      OFST:	set	32
2334                     ; 556 	u16 Address = 0, AddressBk = 0;
2336  02cb 5f            	clrw	x
2337  02cc 1f02          	ldw	(OFST-30,sp),x
2340  02ce 1f04          	ldw	(OFST-28,sp),x
2341                     ; 557 	u8 nBuf[MAX_LEN+1] = {0};
2343  02d0 96            	ldw	x,sp
2344  02d1 1c0006        	addw	x,#OFST-26
2345  02d4 90ae001b      	ldw	y,#L3721_nBuf
2346  02d8 a61b          	ld	a,#27
2347  02da cd0000        	call	c_xymvx
2349                     ; 559 	if(IPANDPORT_PARA == nTpye)
2351  02dd 7b26          	ld	a,(OFST+6,sp)
2352  02df a101          	cp	a,#1
2353  02e1 260a          	jrne	L7231
2354                     ; 561 		Address   = ADDRESS_IPPARA;
2356  02e3 ae1025        	ldw	x,#4133
2357  02e6 1f02          	ldw	(OFST-30,sp),x
2358                     ; 562 		AddressBk = ADDRESS_IPPARA_BK;
2360  02e8 ae1089        	ldw	x,#4233
2362  02eb 2052          	jp	LC005
2363  02ed               L7231:
2364                     ; 564 	else if(APN_PARA == nTpye)
2366  02ed a102          	cp	a,#2
2367  02ef 260a          	jrne	L3331
2368                     ; 566 		Address   = ADDRESS_APN;
2370  02f1 ae1036        	ldw	x,#4150
2371  02f4 1f02          	ldw	(OFST-30,sp),x
2372                     ; 567 		AddressBk = ADDRESS_APN_BK;
2374  02f6 ae109a        	ldw	x,#4250
2376  02f9 2044          	jp	LC005
2377  02fb               L3331:
2378                     ; 569 	else if(REPORT_PARA == nTpye)
2380  02fb a103          	cp	a,#3
2381  02fd 260a          	jrne	L7331
2382                     ; 571 		Address   = ADDRESS_REPOERCYCLE;
2384  02ff ae1047        	ldw	x,#4167
2385  0302 1f02          	ldw	(OFST-30,sp),x
2386                     ; 572 		AddressBk = ADDRESS_REPOERCYCLE_BK;
2388  0304 ae10ab        	ldw	x,#4267
2390  0307 2036          	jp	LC005
2391  0309               L7331:
2392                     ; 574 	else if(METER_PARA == nTpye)
2394  0309 a104          	cp	a,#4
2395  030b 260a          	jrne	L3431
2396                     ; 576 		Address   = ADDRESS_PARAMETER;
2398  030d ae100a        	ldw	x,#4106
2399  0310 1f02          	ldw	(OFST-30,sp),x
2400                     ; 577 		AddressBk = ADDRESS_PARAMETER_BK;
2402  0312 ae106e        	ldw	x,#4206
2404  0315 2028          	jp	LC005
2405  0317               L3431:
2406                     ; 579 	else if(LT_REP_TIME == nTpye)
2408  0317 a105          	cp	a,#5
2409  0319 260a          	jrne	L7431
2410                     ; 581 		Address   = ADDRESS_REPORTTIME;
2412  031b ae1053        	ldw	x,#4179
2413  031e 1f02          	ldw	(OFST-30,sp),x
2414                     ; 582 		AddressBk = ADDRESS_REPORTTIME_BK;
2416  0320 ae10b7        	ldw	x,#4279
2418  0323 201a          	jp	LC005
2419  0325               L7431:
2420                     ; 584 	else if(OPT_VALVE_PRAA == nTpye)
2422  0325 a106          	cp	a,#6
2423  0327 260a          	jrne	L3531
2424                     ; 586 		Address   = ADDRESS_OPTVALVE;
2426  0329 ae105e        	ldw	x,#4190
2427  032c 1f02          	ldw	(OFST-30,sp),x
2428                     ; 587 		AddressBk = ADDRESS_OPTVALVE_BK;
2430  032e ae10c2        	ldw	x,#4290
2432  0331 200c          	jp	LC005
2433  0333               L3531:
2434                     ; 589 	else if(TM_ADDRESS_PRAA == nTpye)
2436  0333 a107          	cp	a,#7
2437  0335 260a          	jrne	L1331
2438                     ; 591 		Address   = ADDRESS_TMADDRESS;
2440  0337 ae1005        	ldw	x,#4101
2441  033a 1f02          	ldw	(OFST-30,sp),x
2442                     ; 592 		AddressBk = ADDRESS_TMADDRESS_BK;	
2444  033c ae1069        	ldw	x,#4201
2445  033f               LC005:
2446  033f 1f04          	ldw	(OFST-28,sp),x
2447  0341               L1331:
2448                     ; 595 	ReadGroup(nLen+1, Address, nBuf);	
2450  0341 96            	ldw	x,sp
2451  0342 1c0006        	addw	x,#OFST-26
2452  0345 89            	pushw	x
2453  0346 1e04          	ldw	x,(OFST-28,sp)
2454  0348 89            	pushw	x
2455  0349 7b29          	ld	a,(OFST+9,sp)
2456  034b 4c            	inc	a
2457  034c cd0000        	call	_ReadGroup
2459  034f 5b04          	addw	sp,#4
2460                     ; 596 	if(nBuf[nLen] == JX_AddSum8Bit(nBuf, nLen))
2462  0351 7b25          	ld	a,(OFST+5,sp)
2463  0353 5f            	clrw	x
2464  0354 97            	ld	xl,a
2465  0355 89            	pushw	x
2466  0356 96            	ldw	x,sp
2467  0357 1c0008        	addw	x,#OFST-24
2468  035a cd0000        	call	_JX_AddSum8Bit
2470  035d 85            	popw	x
2471  035e 6b01          	ld	(OFST-31,sp),a
2472  0360 96            	ldw	x,sp
2473  0361 1c0006        	addw	x,#OFST-26
2474  0364 9f            	ld	a,xl
2475  0365 5e            	swapw	x
2476  0366 1b25          	add	a,(OFST+5,sp)
2477  0368 2401          	jrnc	L041
2478  036a 5c            	incw	x
2479  036b               L041:
2480  036b 02            	rlwa	x,a
2481  036c f6            	ld	a,(x)
2482  036d 1101          	cp	a,(OFST-31,sp)
2483  036f 2618          	jrne	L1631
2484                     ; 598 		if(!JX_IsAllFillDat(nBuf, 0, nLen))
2486  0371 7b25          	ld	a,(OFST+5,sp)
2487  0373 b703          	ld	c_lreg+3,a
2488  0375 3f02          	clr	c_lreg+2
2489  0377 3f01          	clr	c_lreg+1
2490  0379 3f00          	clr	c_lreg
2491  037b be02          	ldw	x,c_lreg+2
2492  037d 89            	pushw	x
2493  037e be00          	ldw	x,c_lreg
2494  0380 89            	pushw	x
2495  0381 4b00          	push	#0
2496  0383 96            	ldw	x,sp
2497  0384 1c000b        	addw	x,#OFST-21
2499                     ; 600 			MemcpyFunc(pnDat, nBuf, nLen);
2501                     ; 601 			return TRUE;
2503  0387 2044          	jp	LC006
2504  0389               L1631:
2505                     ; 606 		ReadGroup(nLen+1, AddressBk, nBuf);	
2507  0389 96            	ldw	x,sp
2508  038a 1c0006        	addw	x,#OFST-26
2509  038d 89            	pushw	x
2510  038e 1e06          	ldw	x,(OFST-26,sp)
2511  0390 89            	pushw	x
2512  0391 7b29          	ld	a,(OFST+9,sp)
2513  0393 4c            	inc	a
2514  0394 cd0000        	call	_ReadGroup
2516  0397 5b04          	addw	sp,#4
2517                     ; 607 		if(nBuf[nLen] == JX_AddSum8Bit(nBuf, nLen))
2519  0399 7b25          	ld	a,(OFST+5,sp)
2520  039b 5f            	clrw	x
2521  039c 97            	ld	xl,a
2522  039d 89            	pushw	x
2523  039e 96            	ldw	x,sp
2524  039f 1c0008        	addw	x,#OFST-24
2525  03a2 cd0000        	call	_JX_AddSum8Bit
2527  03a5 85            	popw	x
2528  03a6 6b01          	ld	(OFST-31,sp),a
2529  03a8 96            	ldw	x,sp
2530  03a9 1c0006        	addw	x,#OFST-26
2531  03ac 9f            	ld	a,xl
2532  03ad 5e            	swapw	x
2533  03ae 1b25          	add	a,(OFST+5,sp)
2534  03b0 2401          	jrnc	L251
2535  03b2 5c            	incw	x
2536  03b3               L251:
2537  03b3 02            	rlwa	x,a
2538  03b4 f6            	ld	a,(x)
2539  03b5 1101          	cp	a,(OFST-31,sp)
2540  03b7 2630          	jrne	L5631
2541                     ; 609 			if(!JX_IsAllFillDat(pnDat, 0, nLen))
2543  03b9 7b25          	ld	a,(OFST+5,sp)
2544  03bb b703          	ld	c_lreg+3,a
2545  03bd 3f02          	clr	c_lreg+2
2546  03bf 3f01          	clr	c_lreg+1
2547  03c1 3f00          	clr	c_lreg
2548  03c3 be02          	ldw	x,c_lreg+2
2549  03c5 89            	pushw	x
2550  03c6 be00          	ldw	x,c_lreg
2551  03c8 89            	pushw	x
2552  03c9 4b00          	push	#0
2553  03cb 1e26          	ldw	x,(OFST+6,sp)
2555                     ; 611 				MemcpyFunc(pnDat, nBuf, nLen);
2558                     ; 612 				return TRUE;
2560  03cd               LC006:
2561  03cd cd0000        	call	_JX_IsAllFillDat
2562  03d0 5b05          	addw	sp,#5
2563  03d2 4d            	tnz	a
2564  03d3 2614          	jrne	L5631
2566  03d5 7b25          	ld	a,(OFST+5,sp)
2567  03d7 88            	push	a
2568  03d8 96            	ldw	x,sp
2569  03d9 1c0007        	addw	x,#OFST-25
2570  03dc 89            	pushw	x
2571  03dd 1e24          	ldw	x,(OFST+4,sp)
2572  03df cd0000        	call	_MemcpyFunc
2573  03e2 5b03          	addw	sp,#3
2575  03e4 a601          	ld	a,#1
2577  03e6               L061:
2579  03e6 5b22          	addw	sp,#34
2580  03e8 81            	ret	
2581  03e9               L5631:
2582                     ; 617 	return FALSE;
2584  03e9 4f            	clr	a
2586  03ea 20fa          	jra	L061
2589                     	switch	.const
2590  0036               L3731_nBuf:
2591  0036 00            	dc.b	0
2592  0037 000000000000  	ds.b	16
2593  0047               L5731_nTmpBuf:
2594  0047 ff            	dc.b	255
2595  0048 ff            	dc.b	255
2596  0049 ff            	dc.b	255
2597  004a ff            	dc.b	255
2598  004b ff            	dc.b	255
2599  004c ff            	dc.b	255
2600  004d 000000000000  	ds.b	11
2748                     ; 632 void AddRecordFun(u8 *Record, u8 nLen, u8 *pnRecIndex, u8 nMaxNum, 
2748                     ; 633 	u32 dwIndexAdd, u32 dwRecordAdd, u8 nRecordLen)
2748                     ; 634 {
2749                     	switch	.text
2750  03ec               _AddRecordFun:
2752  03ec 89            	pushw	x
2753  03ed 522e          	subw	sp,#46
2754       0000002e      OFST:	set	46
2757                     ; 635 	u16 nX = 0, address = 0, nInDexAdd = 0, nLoop = 0 ,wCurrIndex = 0;
2767                     ; 637 	u8 nBuf[RECORD_LEN+1]    = {0};
2769  03ef 96            	ldw	x,sp
2770  03f0 5c            	incw	x
2771  03f1 90ae0036      	ldw	y,#L3731_nBuf
2772  03f5 a611          	ld	a,#17
2773  03f7 cd0000        	call	c_xymvx
2775                     ; 638 	u8 nTmpBuf[RECORD_LEN+1] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
2777  03fa 96            	ldw	x,sp
2778  03fb 1c0012        	addw	x,#OFST-28
2779  03fe 90ae0047      	ldw	y,#L5731_nTmpBuf
2780  0402 a611          	ld	a,#17
2781  0404 cd0000        	call	c_xymvx
2783                     ; 640 	nBuf[nLen] = JX_AddSum8Bit(Record, nLen);
2785  0407 96            	ldw	x,sp
2786  0408 5c            	incw	x
2787  0409 9f            	ld	a,xl
2788  040a 5e            	swapw	x
2789  040b 1b33          	add	a,(OFST+5,sp)
2790  040d 2401          	jrnc	L461
2791  040f 5c            	incw	x
2792  0410               L461:
2793  0410 02            	rlwa	x,a
2794  0411 89            	pushw	x
2795  0412 7b35          	ld	a,(OFST+7,sp)
2796  0414 5f            	clrw	x
2797  0415 97            	ld	xl,a
2798  0416 89            	pushw	x
2799  0417 1e33          	ldw	x,(OFST+5,sp)
2800  0419 cd0000        	call	_JX_AddSum8Bit
2802  041c 85            	popw	x
2803  041d 85            	popw	x
2804  041e f7            	ld	(x),a
2805                     ; 641 	MemcpyFunc(nBuf, Record, nLen);	
2807  041f 7b33          	ld	a,(OFST+5,sp)
2808  0421 88            	push	a
2809  0422 1e30          	ldw	x,(OFST+2,sp)
2810  0424 89            	pushw	x
2811  0425 96            	ldw	x,sp
2812  0426 1c0004        	addw	x,#OFST-42
2813  0429 cd0000        	call	_MemcpyFunc
2815  042c 5b03          	addw	sp,#3
2816                     ; 642 	nX = nLen+1; //加1字节校验
2818  042e 4f            	clr	a
2819  042f 97            	ld	xl,a
2820  0430 4c            	inc	a
2821  0431 1b33          	add	a,(OFST+5,sp)
2822  0433 2401          	jrnc	L271
2823  0435 5c            	incw	x
2824  0436               L271:
2825  0436 02            	rlwa	x,a
2826  0437 1f29          	ldw	(OFST-5,sp),x
2827                     ; 644 	(*pnRecIndex) = (*pnRecIndex)+1;
2829  0439 1e34          	ldw	x,(OFST+6,sp)
2830  043b 7c            	inc	(x)
2831                     ; 645 	if ((*pnRecIndex) >= nMaxNum)
2833  043c f6            	ld	a,(x)
2834  043d 1136          	cp	a,(OFST+8,sp)
2835  043f 2502          	jrult	L1641
2836                     ; 647 		(*pnRecIndex) = 0;
2838  0441 4f            	clr	a
2839  0442 f7            	ld	(x),a
2840  0443               L1641:
2841                     ; 649 	wCurrIndex = (*pnRecIndex);
2843  0443 5f            	clrw	x
2844  0444 97            	ld	xl,a
2845  0445 1f27          	ldw	(OFST-7,sp),x
2846                     ; 652 	nInDexAdd = dwIndexAdd;
2848  0447 1e39          	ldw	x,(OFST+11,sp)
2849  0449 1f2d          	ldw	(OFST-1,sp),x
2850                     ; 654 	ReadGroup(sizeof(index), nInDexAdd, (u8 *)&index);		//读指针,下面做平衡算法
2852  044b 96            	ldw	x,sp
2853  044c 1c0023        	addw	x,#OFST-11
2854  044f 89            	pushw	x
2855  0450 1e2f          	ldw	x,(OFST+1,sp)
2856  0452 89            	pushw	x
2857  0453 a604          	ld	a,#4
2858  0455 cd0000        	call	_ReadGroup
2860  0458 5b04          	addw	sp,#4
2861                     ; 655 	if (index.Bytes.B0 == 0xff)		//第一次?
2863  045a 7b23          	ld	a,(OFST-11,sp)
2864  045c 4c            	inc	a
2865  045d 263c          	jrne	L3641
2866                     ; 657 		SaveByte(nInDexAdd, wCurrIndex);		//保存指针
2868  045f 7b28          	ld	a,(OFST-6,sp)
2869  0461 88            	push	a
2870  0462 1e2e          	ldw	x,(OFST+0,sp)
2871  0464 cd0057        	call	_SaveByte
2873  0467 84            	pop	a
2874                     ; 658 		address = dwRecordAdd;
2876  0468 1e3d          	ldw	x,(OFST+15,sp)
2877  046a 1f2b          	ldw	(OFST-3,sp),x
2878                     ; 659 		for(nLoop = 0; nLoop < nMaxNum; nLoop++)
2880  046c 5f            	clrw	x
2882  046d 201c          	jra	L1741
2883  046f               L5641:
2884                     ; 661 			address +=(nLoop*nX);
2886  046f 1629          	ldw	y,(OFST-5,sp)
2887  0471 cd0000        	call	c_imul
2889  0474 72fb2b        	addw	x,(OFST-3,sp)
2890  0477 1f2b          	ldw	(OFST-3,sp),x
2891                     ; 662 			SaveGroup(nX, address, nTmpBuf);
2893  0479 96            	ldw	x,sp
2894  047a 1c0012        	addw	x,#OFST-28
2895  047d 89            	pushw	x
2896  047e 1e2d          	ldw	x,(OFST-1,sp)
2897  0480 89            	pushw	x
2898  0481 7b2e          	ld	a,(OFST+0,sp)
2899  0483 cd0077        	call	_SaveGroup
2901  0486 5b04          	addw	sp,#4
2902                     ; 659 		for(nLoop = 0; nLoop < nMaxNum; nLoop++)
2904  0488 1e2d          	ldw	x,(OFST-1,sp)
2905  048a 5c            	incw	x
2906  048b               L1741:
2907  048b 1f2d          	ldw	(OFST-1,sp),x
2910  048d 7b36          	ld	a,(OFST+8,sp)
2911  048f 5f            	clrw	x
2912  0490 97            	ld	xl,a
2913  0491 bf00          	ldw	c_x,x
2914  0493 1e2d          	ldw	x,(OFST-1,sp)
2915  0495 b300          	cpw	x,c_x
2916  0497 25d6          	jrult	L5641
2918  0499 204e          	jra	L5741
2919  049b               L3641:
2920                     ; 665 	else if (index.Bytes.B1 == 0xff)
2922  049b 7b24          	ld	a,(OFST-10,sp)
2923  049d 4c            	inc	a
2924  049e 2608          	jrne	L7741
2925                     ; 667 		SaveByte(nInDexAdd + 1, wCurrIndex);	//保存指针
2927  04a0 7b28          	ld	a,(OFST-6,sp)
2928  04a2 88            	push	a
2929  04a3 1e2e          	ldw	x,(OFST+0,sp)
2930  04a5 5c            	incw	x
2933  04a6 203d          	jp	LC007
2934  04a8               L7741:
2935                     ; 669 	else if (index.Bytes.B2 == 0xff)
2937  04a8 7b25          	ld	a,(OFST-9,sp)
2938  04aa 4c            	inc	a
2939  04ab 260a          	jrne	L3051
2940                     ; 671 		SaveByte(nInDexAdd + 2, wCurrIndex);	//保存指针
2942  04ad 7b28          	ld	a,(OFST-6,sp)
2943  04af 88            	push	a
2944  04b0 1e2e          	ldw	x,(OFST+0,sp)
2945  04b2 1c0002        	addw	x,#2
2948  04b5 202e          	jp	LC007
2949  04b7               L3051:
2950                     ; 673 	else if (index.Bytes.B3 == 0xff)
2952  04b7 7b26          	ld	a,(OFST-8,sp)
2953  04b9 4c            	inc	a
2954  04ba 2605          	jrne	L7051
2955                     ; 675 		SaveByte(nInDexAdd + 3, wCurrIndex);	//保存指针
2957  04bc 7b28          	ld	a,(OFST-6,sp)
2958  04be 88            	push	a
2961  04bf 201f          	jp	LC008
2962  04c1               L7051:
2963                     ; 679 		SaveByte(nInDexAdd, wCurrIndex);		//保存指针
2965  04c1 7b28          	ld	a,(OFST-6,sp)
2966  04c3 88            	push	a
2967  04c4 1e2e          	ldw	x,(OFST+0,sp)
2968  04c6 cd0057        	call	_SaveByte
2970  04c9 84            	pop	a
2971                     ; 680 		SaveByte(nInDexAdd + 1, 0xff);		//清除
2973  04ca 4bff          	push	#255
2974  04cc 1e2e          	ldw	x,(OFST+0,sp)
2975  04ce 5c            	incw	x
2976  04cf cd0057        	call	_SaveByte
2978  04d2 84            	pop	a
2979                     ; 681 		SaveByte(nInDexAdd + 2, 0xff);		//清除
2981  04d3 4bff          	push	#255
2982  04d5 1e2e          	ldw	x,(OFST+0,sp)
2983  04d7 1c0002        	addw	x,#2
2984  04da cd0057        	call	_SaveByte
2986  04dd 84            	pop	a
2987                     ; 682 		SaveByte(nInDexAdd + 3, 0xff);		//清除
2989  04de 4bff          	push	#255
2990  04e0               LC008:
2991  04e0 1e2e          	ldw	x,(OFST+0,sp)
2992  04e2 1c0003        	addw	x,#3
2994  04e5               LC007:
2995  04e5 cd0057        	call	_SaveByte
2996  04e8 84            	pop	a
2997  04e9               L5741:
2998                     ; 685 	address = dwRecordAdd;		            //EEPROM开始地址
3000  04e9 1e3d          	ldw	x,(OFST+15,sp)
3001  04eb 1f2b          	ldw	(OFST-3,sp),x
3002                     ; 686 	address += wCurrIndex * (nRecordLen+1);		//+记录偏移 	
3004  04ed 7b3f          	ld	a,(OFST+17,sp)
3005  04ef 5f            	clrw	x
3006  04f0 97            	ld	xl,a
3007  04f1 5c            	incw	x
3008  04f2 1627          	ldw	y,(OFST-7,sp)
3009  04f4 cd0000        	call	c_imul
3011  04f7 72fb2b        	addw	x,(OFST-3,sp)
3012  04fa 1f2b          	ldw	(OFST-3,sp),x
3013                     ; 687 	SaveGroup(nX, address, nBuf);
3015  04fc 96            	ldw	x,sp
3016  04fd 5c            	incw	x
3017  04fe 89            	pushw	x
3018  04ff 1e2d          	ldw	x,(OFST-1,sp)
3019  0501 89            	pushw	x
3020  0502 7b2e          	ld	a,(OFST+0,sp)
3021  0504 cd0077        	call	_SaveGroup
3023  0507 5b34          	addw	sp,#52
3024                     ; 688 }
3027  0509 81            	ret	
3030                     	switch	.const
3031  0058               L3151_nBuf:
3032  0058 00            	dc.b	0
3033  0059 000000000000  	ds.b	16
3136                     ; 697 u8 ReadRecordFun(u8 nIndex, u8 *Record, u8 nOutLen, u8 nRecIndex, u8 nMaxNum, u32 dwRecordAdd)
3136                     ; 698 {
3137                     	switch	.text
3138  050a               _ReadRecordFun:
3140  050a 88            	push	a
3141  050b 5218          	subw	sp,#24
3142       00000018      OFST:	set	24
3145                     ; 699 	u16 nX = 0, address = 0;
3149                     ; 700 	u16 nReadIndex = 0;
3151                     ; 701 	u8 nBuf[RECORD_LEN+1] = {0};
3153  050d 96            	ldw	x,sp
3154  050e 1c0006        	addw	x,#OFST-18
3155  0511 90ae0058      	ldw	y,#L3151_nBuf
3156  0515 a611          	ld	a,#17
3157  0517 cd0000        	call	c_xymvx
3159                     ; 703 	if(NULL == Record || nOutLen > sizeof(TypeRecord) || (nMaxNum <= nIndex))
3161  051a 1e1c          	ldw	x,(OFST+4,sp)
3162  051c 2603cc05c4    	jreq	L1751
3164  0521 7b1e          	ld	a,(OFST+6,sp)
3165  0523 a111          	cp	a,#17
3166  0525 24f7          	jruge	L1751
3168  0527 7b20          	ld	a,(OFST+8,sp)
3169  0529 1119          	cp	a,(OFST+1,sp)
3170                     ; 705 		return FALSE;
3172  052b 23f1          	jrule	L1751
3173                     ; 708 	nX = nOutLen+1;
3175  052d 4f            	clr	a
3176  052e 97            	ld	xl,a
3177  052f 4c            	inc	a
3178  0530 1b1e          	add	a,(OFST+6,sp)
3179  0532 2401          	jrnc	L422
3180  0534 5c            	incw	x
3181  0535               L422:
3182  0535 02            	rlwa	x,a
3183  0536 1f17          	ldw	(OFST-1,sp),x
3184                     ; 711 	if(nRecIndex < nIndex)
3186  0538 7b1f          	ld	a,(OFST+7,sp)
3187  053a 1119          	cp	a,(OFST+1,sp)
3188  053c 2414          	jruge	L5651
3189                     ; 713 		nReadIndex = (u8)nMaxNum - (nIndex - nRecIndex);
3191  053e 7b19          	ld	a,(OFST+1,sp)
3192  0540 5f            	clrw	x
3193  0541 101f          	sub	a,(OFST+7,sp)
3194  0543 2401          	jrnc	L622
3195  0545 5a            	decw	x
3196  0546               L622:
3197  0546 02            	rlwa	x,a
3198  0547 1f02          	ldw	(OFST-22,sp),x
3199  0549 7b20          	ld	a,(OFST+8,sp)
3200  054b 5f            	clrw	x
3201  054c 97            	ld	xl,a
3202  054d 72f002        	subw	x,(OFST-22,sp)
3204  0550 200c          	jra	L7651
3205  0552               L5651:
3206                     ; 717 		nReadIndex = nRecIndex - nIndex;
3208  0552 5f            	clrw	x
3209  0553 1019          	sub	a,(OFST+1,sp)
3210  0555 2401          	jrnc	L032
3211  0557 5a            	decw	x
3212  0558               L032:
3213  0558 02            	rlwa	x,a
3214  0559 1f04          	ldw	(OFST-20,sp),x
3215  055b 01            	rrwa	x,a
3216  055c 1e04          	ldw	x,(OFST-20,sp)
3217  055e               L7651:
3218                     ; 720 	address = nReadIndex*nX + dwRecordAdd;	
3220  055e 1617          	ldw	y,(OFST-1,sp)
3221  0560 cd0000        	call	c_imul
3223  0563 72fb23        	addw	x,(OFST+11,sp)
3224  0566 1f04          	ldw	(OFST-20,sp),x
3225                     ; 721 	ReadGroup(nX, address, nBuf);	
3227  0568 96            	ldw	x,sp
3228  0569 1c0006        	addw	x,#OFST-18
3229  056c 89            	pushw	x
3230  056d 1e06          	ldw	x,(OFST-18,sp)
3231  056f 89            	pushw	x
3232  0570 7b1c          	ld	a,(OFST+4,sp)
3233  0572 cd0000        	call	_ReadGroup
3235  0575 5b04          	addw	sp,#4
3236                     ; 722 	if(nBuf[nX-1] == JX_AddSum8Bit(nBuf, nX-1))
3238  0577 1e17          	ldw	x,(OFST-1,sp)
3239  0579 5a            	decw	x
3240  057a 89            	pushw	x
3241  057b 96            	ldw	x,sp
3242  057c 1c0008        	addw	x,#OFST-16
3243  057f cd0000        	call	_JX_AddSum8Bit
3245  0582 85            	popw	x
3246  0583 6b03          	ld	(OFST-21,sp),a
3247  0585 96            	ldw	x,sp
3248  0586 1c0006        	addw	x,#OFST-18
3249  0589 1f01          	ldw	(OFST-23,sp),x
3250  058b 1e17          	ldw	x,(OFST-1,sp)
3251  058d 5a            	decw	x
3252  058e 72fb01        	addw	x,(OFST-23,sp)
3253  0591 f6            	ld	a,(x)
3254  0592 1103          	cp	a,(OFST-21,sp)
3255  0594 262e          	jrne	L1751
3256                     ; 724 		if(!JX_IsAllFillDat(nBuf, 0, nX-1))
3258  0596 1e17          	ldw	x,(OFST-1,sp)
3259  0598 5a            	decw	x
3260  0599 cd0000        	call	c_uitolx
3262  059c be02          	ldw	x,c_lreg+2
3263  059e 89            	pushw	x
3264  059f be00          	ldw	x,c_lreg
3265  05a1 89            	pushw	x
3266  05a2 4b00          	push	#0
3267  05a4 96            	ldw	x,sp
3268  05a5 1c000b        	addw	x,#OFST-13
3269  05a8 cd0000        	call	_JX_IsAllFillDat
3271  05ab 5b05          	addw	sp,#5
3272  05ad 4d            	tnz	a
3273  05ae 2614          	jrne	L1751
3274                     ; 726 			MemcpyFunc(Record, nBuf, nOutLen); 
3276  05b0 7b1e          	ld	a,(OFST+6,sp)
3277  05b2 88            	push	a
3278  05b3 96            	ldw	x,sp
3279  05b4 1c0007        	addw	x,#OFST-17
3280  05b7 89            	pushw	x
3281  05b8 1e1f          	ldw	x,(OFST+7,sp)
3282  05ba cd0000        	call	_MemcpyFunc
3284  05bd 5b03          	addw	sp,#3
3285                     ; 727 			return TRUE;
3287  05bf a601          	ld	a,#1
3289  05c1               L242:
3291  05c1 5b19          	addw	sp,#25
3292  05c3 81            	ret	
3293  05c4               L1751:
3294                     ; 731 	return FALSE;
3297  05c4 4f            	clr	a
3299  05c5 20fa          	jra	L242
3302                     	switch	.const
3303  0069               L5751_nBuf:
3304  0069 00            	dc.b	0
3305  006a 000000000000  	ds.b	15
3390                     ; 741 u8 EditRecord(u8 nIndex, u8 *Record, u8 nInLen)
3390                     ; 742 {
3391                     	switch	.text
3392  05c7               _EditRecord:
3394  05c7 88            	push	a
3395  05c8 5217          	subw	sp,#23
3396       00000017      OFST:	set	23
3399                     ; 743 	u16 nX = 0, address = 0;
3403                     ; 744 	u16 nReadIndex = 0;
3405                     ; 745 	u8 nBuf[16] = {0};
3407  05ca 96            	ldw	x,sp
3408  05cb 1c0008        	addw	x,#OFST-15
3409  05ce 90ae0069      	ldw	y,#L5751_nBuf
3410  05d2 a610          	ld	a,#16
3411  05d4 cd0000        	call	c_xymvx
3413                     ; 747 	if(NULL == Record || nInLen < sizeof(TypeRecord) || (NUMBER_RECORD < nIndex))
3415  05d7 1e1b          	ldw	x,(OFST+4,sp)
3416  05d9 2603cc06ae    	jreq	L5461
3418  05de 7b1d          	ld	a,(OFST+6,sp)
3419  05e0 a110          	cp	a,#16
3420  05e2 25f7          	jrult	L5461
3422  05e4 7b18          	ld	a,(OFST+1,sp)
3423  05e6 a11d          	cp	a,#29
3424                     ; 749 		return FALSE;
3426  05e8 24f1          	jruge	L5461
3427                     ; 752 	nX = sizeof(TypeRecord)+1;
3429  05ea ae0011        	ldw	x,#17
3430  05ed 1f06          	ldw	(OFST-17,sp),x
3431                     ; 755 	if(ucRecordIndex < nIndex)
3433  05ef c60002        	ld	a,_ucRecordIndex
3434  05f2 1118          	cp	a,(OFST+1,sp)
3435  05f4 2414          	jruge	L1461
3436                     ; 757 		nReadIndex = (u8)NUMBER_RECORD - (nIndex - ucRecordIndex);
3438  05f6 7b18          	ld	a,(OFST+1,sp)
3439  05f8 5f            	clrw	x
3440  05f9 c00002        	sub	a,_ucRecordIndex
3441  05fc 2401          	jrnc	L642
3442  05fe 5a            	decw	x
3443  05ff               L642:
3444  05ff 02            	rlwa	x,a
3445  0600 1f02          	ldw	(OFST-21,sp),x
3446  0602 ae001c        	ldw	x,#28
3447  0605 72f002        	subw	x,(OFST-21,sp)
3449  0608 2007          	jra	L3461
3450  060a               L1461:
3451                     ; 761 		nReadIndex = ucRecordIndex - nIndex;
3453  060a 5f            	clrw	x
3454  060b 1018          	sub	a,(OFST+1,sp)
3455  060d 2401          	jrnc	L052
3456  060f 5a            	decw	x
3457  0610               L052:
3458  0610 02            	rlwa	x,a
3459  0611               L3461:
3460  0611 1f04          	ldw	(OFST-19,sp),x
3461                     ; 764 	MemcpyFunc(nBuf, Record, nInLen);
3463  0613 7b1d          	ld	a,(OFST+6,sp)
3464  0615 88            	push	a
3465  0616 1e1c          	ldw	x,(OFST+5,sp)
3466  0618 89            	pushw	x
3467  0619 96            	ldw	x,sp
3468  061a 1c000b        	addw	x,#OFST-12
3469  061d cd0000        	call	_MemcpyFunc
3471  0620 5b03          	addw	sp,#3
3472                     ; 765 	address = nReadIndex*nX + ADDRESS_RECORD;	
3474  0622 1e04          	ldw	x,(OFST-19,sp)
3475  0624 1606          	ldw	y,(OFST-17,sp)
3476  0626 cd0000        	call	c_imul
3478  0629 1c10f3        	addw	x,#4339
3479  062c 1f04          	ldw	(OFST-19,sp),x
3480                     ; 766 	nBuf[nX-1] = JX_AddSum8Bit(nBuf, nX-1);
3482  062e 1e06          	ldw	x,(OFST-17,sp)
3483  0630 5a            	decw	x
3484  0631 89            	pushw	x
3485  0632 96            	ldw	x,sp
3486  0633 1c000a        	addw	x,#OFST-13
3487  0636 cd0000        	call	_JX_AddSum8Bit
3489  0639 85            	popw	x
3490  063a 96            	ldw	x,sp
3491  063b 1c0008        	addw	x,#OFST-15
3492  063e 1f02          	ldw	(OFST-21,sp),x
3493  0640 1e06          	ldw	x,(OFST-17,sp)
3494  0642 5a            	decw	x
3495  0643 72fb02        	addw	x,(OFST-21,sp)
3496  0646 f7            	ld	(x),a
3497                     ; 767 	SaveGroup(nX, address, nBuf);
3499  0647 96            	ldw	x,sp
3500  0648 1c0008        	addw	x,#OFST-15
3501  064b 89            	pushw	x
3502  064c 1e06          	ldw	x,(OFST-17,sp)
3503  064e 89            	pushw	x
3504  064f 7b0b          	ld	a,(OFST-12,sp)
3505  0651 cd0077        	call	_SaveGroup
3507  0654 5b04          	addw	sp,#4
3508                     ; 769 	MemsetFunc(nBuf, 0, sizeof(nBuf));
3510  0656 4b10          	push	#16
3511  0658 4b00          	push	#0
3512  065a 96            	ldw	x,sp
3513  065b 1c000a        	addw	x,#OFST-13
3514  065e cd0000        	call	_MemsetFunc
3516  0661 85            	popw	x
3517                     ; 770 	ReadGroup(nX, address, nBuf);
3519  0662 96            	ldw	x,sp
3520  0663 1c0008        	addw	x,#OFST-15
3521  0666 89            	pushw	x
3522  0667 1e06          	ldw	x,(OFST-17,sp)
3523  0669 89            	pushw	x
3524  066a 7b0b          	ld	a,(OFST-12,sp)
3525  066c cd0000        	call	_ReadGroup
3527  066f 5b04          	addw	sp,#4
3528                     ; 771 	if(nBuf[nX-1] == JX_AddSum8Bit(nBuf, nX-1))
3530  0671 1e06          	ldw	x,(OFST-17,sp)
3531  0673 5a            	decw	x
3532  0674 89            	pushw	x
3533  0675 96            	ldw	x,sp
3534  0676 1c000a        	addw	x,#OFST-13
3535  0679 cd0000        	call	_JX_AddSum8Bit
3537  067c 85            	popw	x
3538  067d 6b03          	ld	(OFST-20,sp),a
3539  067f 96            	ldw	x,sp
3540  0680 1c0008        	addw	x,#OFST-15
3541  0683 1f01          	ldw	(OFST-22,sp),x
3542  0685 1e06          	ldw	x,(OFST-17,sp)
3543  0687 5a            	decw	x
3544  0688 72fb01        	addw	x,(OFST-22,sp)
3545  068b f6            	ld	a,(x)
3546  068c 1103          	cp	a,(OFST-20,sp)
3547  068e 261e          	jrne	L5461
3548                     ; 773 		if(!JX_IsAllFillDat(nBuf, 0, nX-1))
3550  0690 1e06          	ldw	x,(OFST-17,sp)
3551  0692 5a            	decw	x
3552  0693 cd0000        	call	c_uitolx
3554  0696 be02          	ldw	x,c_lreg+2
3555  0698 89            	pushw	x
3556  0699 be00          	ldw	x,c_lreg
3557  069b 89            	pushw	x
3558  069c 4b00          	push	#0
3559  069e 96            	ldw	x,sp
3560  069f 1c000d        	addw	x,#OFST-10
3561  06a2 cd0000        	call	_JX_IsAllFillDat
3563  06a5 5b05          	addw	sp,#5
3564  06a7 4d            	tnz	a
3565  06a8 2604          	jrne	L5461
3566                     ; 775 			return TRUE;
3568  06aa 4c            	inc	a
3570  06ab               L072:
3572  06ab 5b18          	addw	sp,#24
3573  06ad 81            	ret	
3574  06ae               L5461:
3575                     ; 779 	return FALSE;
3578  06ae 4f            	clr	a
3580  06af 20fa          	jra	L072
3624                     ; 790 void AddAlmRecord(u8 *Record, u8 nLen)
3624                     ; 791 {
3625                     	switch	.text
3626  06b1               _AddAlmRecord:
3628  06b1 89            	pushw	x
3629       00000000      OFST:	set	0
3632                     ; 792 	AddRecordFun(Record, nLen, &g_nRecAlmIndex, NUMBER_RECORD_ALM, 
3632                     ; 793 		ADDRESS_INDEX_ALM, ADDRESS_RECORD_ALM, RECORD_LEN_ALM);
3634  06b2 4b09          	push	#9
3635  06b4 ae10d1        	ldw	x,#4305
3636  06b7 89            	pushw	x
3637  06b8 5f            	clrw	x
3638  06b9 89            	pushw	x
3639  06ba ae10cd        	ldw	x,#4301
3640  06bd 89            	pushw	x
3641  06be 5f            	clrw	x
3642  06bf 89            	pushw	x
3643  06c0 4b03          	push	#3
3644  06c2 ae0003        	ldw	x,#_g_nRecAlmIndex
3645  06c5 89            	pushw	x
3646  06c6 7b11          	ld	a,(OFST+17,sp)
3647  06c8 88            	push	a
3648  06c9 1e0e          	ldw	x,(OFST+14,sp)
3649  06cb cd03ec        	call	_AddRecordFun
3651  06ce 5b0d          	addw	sp,#13
3652                     ; 794 }
3655  06d0 85            	popw	x
3656  06d1 81            	ret	
3707                     ; 804 u8 ReadAlmRecord(u8 nIndex, u8 *Record, u8 nOutLen)
3707                     ; 805 {
3708                     	switch	.text
3709  06d2               _ReadAlmRecord:
3711  06d2 88            	push	a
3712       00000000      OFST:	set	0
3715                     ; 806 	return (ReadRecordFun(nIndex, Record, nOutLen, g_nRecAlmIndex, NUMBER_RECORD_ALM, ADDRESS_RECORD_ALM));
3717  06d3 ae10d1        	ldw	x,#4305
3718  06d6 89            	pushw	x
3719  06d7 5f            	clrw	x
3720  06d8 89            	pushw	x
3721  06d9 4b03          	push	#3
3722  06db 3b0003        	push	_g_nRecAlmIndex
3723  06de 7b0c          	ld	a,(OFST+12,sp)
3724  06e0 88            	push	a
3725  06e1 1e0b          	ldw	x,(OFST+11,sp)
3726  06e3 89            	pushw	x
3727  06e4 7b0a          	ld	a,(OFST+10,sp)
3728  06e6 cd050a        	call	_ReadRecordFun
3730  06e9 5b0a          	addw	sp,#10
3733  06eb 81            	ret	
3777                     ; 817 void AddRecord(u8 *Record, u8 nLen)
3777                     ; 818 {
3778                     	switch	.text
3779  06ec               _AddRecord:
3781  06ec 89            	pushw	x
3782       00000000      OFST:	set	0
3785                     ; 819 	AddRecordFun(Record, nLen, &ucRecordIndex, NUMBER_RECORD, 
3785                     ; 820 		ADDRESS_INDEX, ADDRESS_RECORD, RECORD_LEN);
3787  06ed 4b10          	push	#16
3788  06ef ae10f3        	ldw	x,#4339
3789  06f2 89            	pushw	x
3790  06f3 5f            	clrw	x
3791  06f4 89            	pushw	x
3792  06f5 ae10ef        	ldw	x,#4335
3793  06f8 89            	pushw	x
3794  06f9 5f            	clrw	x
3795  06fa 89            	pushw	x
3796  06fb 4b1c          	push	#28
3797  06fd ae0002        	ldw	x,#_ucRecordIndex
3798  0700 89            	pushw	x
3799  0701 7b11          	ld	a,(OFST+17,sp)
3800  0703 88            	push	a
3801  0704 1e0e          	ldw	x,(OFST+14,sp)
3802  0706 cd03ec        	call	_AddRecordFun
3804  0709 5b0d          	addw	sp,#13
3805                     ; 821 }
3808  070b 85            	popw	x
3809  070c 81            	ret	
3860                     ; 830 u8 ReadRecord(u8 nIndex, u8 *Record, u8 nOutLen)
3860                     ; 831 {
3861                     	switch	.text
3862  070d               _ReadRecord:
3864  070d 88            	push	a
3865       00000000      OFST:	set	0
3868                     ; 832 	return (ReadRecordFun(nIndex, Record, nOutLen, ucRecordIndex, NUMBER_RECORD, ADDRESS_RECORD));
3870  070e ae10f3        	ldw	x,#4339
3871  0711 89            	pushw	x
3872  0712 5f            	clrw	x
3873  0713 89            	pushw	x
3874  0714 4b1c          	push	#28
3875  0716 3b0002        	push	_ucRecordIndex
3876  0719 7b0c          	ld	a,(OFST+12,sp)
3877  071b 88            	push	a
3878  071c 1e0b          	ldw	x,(OFST+11,sp)
3879  071e 89            	pushw	x
3880  071f 7b0a          	ld	a,(OFST+10,sp)
3881  0721 cd050a        	call	_ReadRecordFun
3883  0724 5b0a          	addw	sp,#10
3886  0726 81            	ret	
3899                     	xdef	_ReadRecordFun
3900                     	xdef	_AddRecordFun
3901                     	xdef	_ReadIndex
3902                     	xdef	_SaveGroup
3903                     	switch	.bss
3904  0000               _g_nMonRecIndex:
3905  0000 00            	ds.b	1
3906                     	xdef	_g_nMonRecIndex
3907  0001               _g_nDayRecIndex:
3908  0001 00            	ds.b	1
3909                     	xdef	_g_nDayRecIndex
3910  0002               _ucRecordIndex:
3911  0002 00            	ds.b	1
3912                     	xdef	_ucRecordIndex
3913  0003               _g_nRecAlmIndex:
3914  0003 00            	ds.b	1
3915                     	xdef	_g_nRecAlmIndex
3916  0004               _stRepFail:
3917  0004 000000000000  	ds.b	9
3918                     	xdef	_stRepFail
3919  000d               _tyParameter:
3920  000d 000000000000  	ds.b	26
3921                     	xdef	_tyParameter
3922  0027               _tyRecord:
3923  0027 000000000000  	ds.b	16
3924                     	xdef	_tyRecord
3925                     	xdef	_ReadAlmRecord
3926                     	xdef	_AddAlmRecord
3927                     	xdef	_EditRecord
3928                     	xdef	_SaveByte
3929                     	xdef	_ReadGroup
3930                     	xdef	_ReadReportFlag
3931                     	xdef	_SaveReportFlag
3932                     	xdef	_SaveParameterForType
3933                     	xdef	_ReadParameterForType
3934                     	xdef	_ReadRecord
3935                     	xdef	_InitializeFile
3936                     	xdef	_AddRecord
3937                     	xref	_JX_IsAllFillDat
3938                     	xref	_JX_AddSum8Bit
3939                     	xref	_MemcpyFunc
3940                     	xref	_MemsetFunc
3941                     	xref	_delay_us
3942                     	xref.b	c_lreg
3943                     	xref.b	c_x
3963                     	xref	c_imul
3964                     	xref	c_xymvx
3965                     	xref	c_lcmp
3966                     	xref	c_lgadc
3967                     	xref	c_ladc
3968                     	xref	c_rtol
3969                     	xref	c_uitolx
3970                     	xref	c_ltor
3971                     	end
