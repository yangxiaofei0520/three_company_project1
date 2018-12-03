   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     .const:	section	.text
   6  0000               _SYSDivFactor:
   7  0000 01            	dc.b	1
   8  0001 02            	dc.b	2
   9  0002 04            	dc.b	4
  10  0003 08            	dc.b	8
  11  0004 10            	dc.b	16
  40                     ; 120 void CLK_DeInit(void)
  40                     ; 121 {
  42                     	switch	.text
  43  0000               _CLK_DeInit:
  47                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  49  0000 351150c2      	mov	20674,#17
  50                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  52  0004 725f50c6      	clr	20678
  53                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  55  0008 725f50c1      	clr	20673
  56                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  58  000c 725f50cb      	clr	20683
  59                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  61  0010 350150c8      	mov	20680,#1
  62                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  64  0014 725f50c9      	clr	20681
  65                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  67  0018 350350c0      	mov	20672,#3
  68                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  70  001c 725f50c3      	clr	20675
  71                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  73  0020 358050c4      	mov	20676,#128
  74                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  76  0024 725f50d0      	clr	20688
  77                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  79  0028 725f50ca      	clr	20682
  80                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  82  002c 725f50c5      	clr	20677
  83                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  85  0030 725f50cd      	clr	20685
  86                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  88  0034 725f50cc      	clr	20684
  89                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  91  0038 725f50ce      	clr	20686
  92                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
  94  003c 35b950cf      	mov	20687,#185
  95                     ; 138 }
  98  0040 81            	ret	
 153                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 153                     ; 161 {
 154                     	switch	.text
 155  0041               _CLK_HSICmd:
 159                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 161                     ; 165   if (NewState != DISABLE)
 163  0041 4d            	tnz	a
 164  0042 2705          	jreq	L74
 165                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 167  0044 721050c2      	bset	20674,#0
 170  0048 81            	ret	
 171  0049               L74:
 172                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 174  0049 721150c2      	bres	20674,#0
 175                     ; 175 }
 178  004d 81            	ret	
 212                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 212                     ; 189 {
 213                     	switch	.text
 214  004e               _CLK_AdjustHSICalibrationValue:
 218                     ; 191   CLK->HSIUNLCKR = 0xAC;
 220  004e 35ac50ce      	mov	20686,#172
 221                     ; 192   CLK->HSIUNLCKR = 0x35;
 223  0052 353550ce      	mov	20686,#53
 224                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 226  0056 c750cd        	ld	20685,a
 227                     ; 196 }
 230  0059 81            	ret	
 265                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 265                     ; 213 {
 266                     	switch	.text
 267  005a               _CLK_LSICmd:
 271                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 273                     ; 218   if (NewState != DISABLE)
 275  005a 4d            	tnz	a
 276  005b 2705          	jreq	L501
 277                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 279  005d 721450c2      	bset	20674,#2
 282  0061 81            	ret	
 283  0062               L501:
 284                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 286  0062 721550c2      	bres	20674,#2
 287                     ; 228 }
 290  0066 81            	ret	
 352                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 352                     ; 250 {
 353                     	switch	.text
 354  0067               _CLK_HSEConfig:
 358                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 360                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 362  0067 721150c6      	bres	20678,#0
 363                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 365  006b 721950c6      	bres	20678,#4
 366                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 368  006f ca50c6        	or	a,20678
 369  0072 c750c6        	ld	20678,a
 370                     ; 263 }
 373  0075 81            	ret	
 435                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 435                     ; 281 {
 436                     	switch	.text
 437  0076               _CLK_LSEConfig:
 441                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 443                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 445  0076 721b50c6      	bres	20678,#5
 446                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 448  007a 721550c6      	bres	20678,#2
 449                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 451  007e ca50c6        	or	a,20678
 452  0081 c750c6        	ld	20678,a
 453                     ; 295 }
 456  0084 81            	ret	
 480                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 480                     ; 307 {
 481                     	switch	.text
 482  0085               _CLK_ClockSecuritySystemEnable:
 486                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 488  0085 721050ca      	bset	20682,#0
 489                     ; 310 }
 492  0089 81            	ret	
 528                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 528                     ; 318 {
 529                     	switch	.text
 530  008a               _CLK_ClockSecuritySytemDeglitchCmd:
 534                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 536                     ; 322   if (NewState != DISABLE)
 538  008a 4d            	tnz	a
 539  008b 2705          	jreq	L712
 540                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 542  008d 721850ca      	bset	20682,#4
 545  0091 81            	ret	
 546  0092               L712:
 547                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 549  0092 721950ca      	bres	20682,#4
 550                     ; 332 }
 553  0096 81            	ret	
 694                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 694                     ; 357 {
 695                     	switch	.text
 696  0097               _CLK_CCOConfig:
 698  0097 89            	pushw	x
 699       00000000      OFST:	set	0
 702                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 704                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 706                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 708  0098 9f            	ld	a,xl
 709  0099 1a01          	or	a,(OFST+1,sp)
 710  009b c750c5        	ld	20677,a
 711                     ; 364 }
 714  009e 85            	popw	x
 715  009f 81            	ret	
 789                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 789                     ; 417 {
 790                     	switch	.text
 791  00a0               _CLK_SYSCLKSourceConfig:
 795                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 797                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 799  00a0 c750c8        	ld	20680,a
 800                     ; 423 }
 803  00a3 81            	ret	
 828                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 828                     ; 436 {
 829                     	switch	.text
 830  00a4               _CLK_GetSYSCLKSource:
 834                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 836  00a4 c650c7        	ld	a,20679
 839  00a7 81            	ret	
 903                     ; 478 uint32_t CLK_GetClockFreq(void)
 903                     ; 479 {
 904                     	switch	.text
 905  00a8               _CLK_GetClockFreq:
 907  00a8 5209          	subw	sp,#9
 908       00000009      OFST:	set	9
 911                     ; 480   uint32_t clockfrequency = 0;
 913  00aa 96            	ldw	x,sp
 914  00ab 1c0005        	addw	x,#OFST-4
 915  00ae cd0000        	call	c_ltor
 917                     ; 481   uint32_t sourcefrequency = 0;
 919  00b1 5f            	clrw	x
 920  00b2 1f07          	ldw	(OFST-2,sp),x
 921  00b4 1f05          	ldw	(OFST-4,sp),x
 922                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 924                     ; 483   uint8_t tmp = 0, presc = 0;
 928                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 930  00b6 c650c7        	ld	a,20679
 931  00b9 6b09          	ld	(OFST+0,sp),a
 932                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 934  00bb a101          	cp	a,#1
 935                     ; 490     sourcefrequency = HSI_VALUE;
 937  00bd 2710          	jreq	LC002
 938                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 940  00bf a102          	cp	a,#2
 941  00c1 2608          	jrne	L104
 942                     ; 494     sourcefrequency = LSI_VALUE;
 944  00c3 ae9470        	ldw	x,#38000
 945  00c6 1f07          	ldw	(OFST-2,sp),x
 946  00c8 5f            	clrw	x
 948  00c9 200c          	jp	LC001
 949  00cb               L104:
 950                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 952  00cb a104          	cp	a,#4
 953  00cd 260c          	jrne	L504
 954                     ; 498     sourcefrequency = HSE_VALUE;
 956  00cf               LC002:
 958  00cf ae2400        	ldw	x,#9216
 959  00d2 1f07          	ldw	(OFST-2,sp),x
 960  00d4 ae00f4        	ldw	x,#244
 961  00d7               LC001:
 962  00d7 1f05          	ldw	(OFST-4,sp),x
 964  00d9 2007          	jra	L773
 965  00db               L504:
 966                     ; 502     clockfrequency = LSE_VALUE;
 968  00db 96            	ldw	x,sp
 969  00dc 1c0005        	addw	x,#OFST-4
 970  00df cd0000        	call	c_ltor
 972  00e2               L773:
 973                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 975  00e2 c650c0        	ld	a,20672
 976  00e5 a407          	and	a,#7
 977                     ; 507   presc = SYSDivFactor[tmp];
 979  00e7 5f            	clrw	x
 980  00e8 97            	ld	xl,a
 981  00e9 d60000        	ld	a,(_SYSDivFactor,x)
 982  00ec 6b09          	ld	(OFST+0,sp),a
 983                     ; 510   clockfrequency = sourcefrequency / presc;
 985  00ee b703          	ld	c_lreg+3,a
 986  00f0 3f02          	clr	c_lreg+2
 987  00f2 3f01          	clr	c_lreg+1
 988  00f4 3f00          	clr	c_lreg
 989  00f6 96            	ldw	x,sp
 990  00f7 5c            	incw	x
 991  00f8 cd0000        	call	c_rtol
 993  00fb 96            	ldw	x,sp
 994  00fc 1c0005        	addw	x,#OFST-4
 995  00ff cd0000        	call	c_ltor
 997  0102 96            	ldw	x,sp
 998  0103 5c            	incw	x
 999  0104 cd0000        	call	c_ludv
1001  0107 96            	ldw	x,sp
1002  0108 1c0005        	addw	x,#OFST-4
1003  010b cd0000        	call	c_rtol
1005                     ; 512   return((uint32_t)clockfrequency);
1007  010e 96            	ldw	x,sp
1008  010f 1c0005        	addw	x,#OFST-4
1009  0112 cd0000        	call	c_ltor
1013  0115 5b09          	addw	sp,#9
1014  0117 81            	ret	
1112                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1112                     ; 529 {
1113                     	switch	.text
1114  0118               _CLK_SYSCLKDivConfig:
1118                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1120                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1122  0118 c750c0        	ld	20672,a
1123                     ; 534 }
1126  011b 81            	ret	
1162                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1162                     ; 542 {
1163                     	switch	.text
1164  011c               _CLK_SYSCLKSourceSwitchCmd:
1168                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1170                     ; 546   if (NewState != DISABLE)
1172  011c 4d            	tnz	a
1173  011d 2705          	jreq	L174
1174                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1176  011f 721250c9      	bset	20681,#1
1179  0123 81            	ret	
1180  0124               L174:
1181                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1183  0124 721350c9      	bres	20681,#1
1184                     ; 556 }
1187  0128 81            	ret	
1333                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1333                     ; 617 {
1334                     	switch	.text
1335  0129               _CLK_RTCClockConfig:
1337  0129 89            	pushw	x
1338       00000000      OFST:	set	0
1341                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1343                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1345                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1347  012a 9f            	ld	a,xl
1348  012b 1a01          	or	a,(OFST+1,sp)
1349  012d c750c1        	ld	20673,a
1350                     ; 624 }
1353  0130 85            	popw	x
1354  0131 81            	ret	
1420                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1420                     ; 636 {
1421                     	switch	.text
1422  0132               _CLK_BEEPClockConfig:
1426                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1428                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1430  0132 c750cb        	ld	20683,a
1431                     ; 643 }
1434  0135 81            	ret	
1657                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1657                     ; 678 {
1658                     	switch	.text
1659  0136               _CLK_PeripheralClockConfig:
1661  0136 89            	pushw	x
1662  0137 88            	push	a
1663       00000001      OFST:	set	1
1666                     ; 679   uint8_t reg = 0;
1668  0138 0f01          	clr	(OFST+0,sp)
1669                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1671                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1673                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1675  013a 9e            	ld	a,xh
1676  013b a4f0          	and	a,#240
1677  013d 6b01          	ld	(OFST+0,sp),a
1678                     ; 688   if ( reg == 0x00)
1680  013f 2629          	jrne	L117
1681                     ; 690     if (NewState != DISABLE)
1683  0141 7b03          	ld	a,(OFST+2,sp)
1684  0143 2712          	jreq	L317
1685                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1687  0145 7b02          	ld	a,(OFST+1,sp)
1688  0147 ad72          	call	LC005
1689  0149 2704          	jreq	L64
1690  014b               L05:
1691  014b 48            	sll	a
1692  014c 5a            	decw	x
1693  014d 26fc          	jrne	L05
1694  014f               L64:
1695  014f ca50c3        	or	a,20675
1696  0152 c750c3        	ld	20675,a
1698  0155 2061          	jra	L717
1699  0157               L317:
1700                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1702  0157 7b02          	ld	a,(OFST+1,sp)
1703  0159 ad60          	call	LC005
1704  015b 2704          	jreq	L25
1705  015d               L45:
1706  015d 48            	sll	a
1707  015e 5a            	decw	x
1708  015f 26fc          	jrne	L45
1709  0161               L25:
1710  0161 43            	cpl	a
1711  0162 c450c3        	and	a,20675
1712  0165 c750c3        	ld	20675,a
1713  0168 204e          	jra	L717
1714  016a               L117:
1715                     ; 701   else if (reg == 0x10)
1717  016a a110          	cp	a,#16
1718  016c 2626          	jrne	L127
1719                     ; 703     if (NewState != DISABLE)
1721  016e 7b03          	ld	a,(OFST+2,sp)
1722  0170 270f          	jreq	L327
1723                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1725  0172 7b02          	ld	a,(OFST+1,sp)
1726  0174 ad45          	call	LC005
1727  0176 2704          	jreq	L65
1728  0178               L06:
1729  0178 48            	sll	a
1730  0179 5a            	decw	x
1731  017a 26fc          	jrne	L06
1732  017c               L65:
1733  017c ca50c4        	or	a,20676
1735  017f 200e          	jp	LC004
1736  0181               L327:
1737                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1739  0181 7b02          	ld	a,(OFST+1,sp)
1740  0183 ad36          	call	LC005
1741  0185 2704          	jreq	L26
1742  0187               L46:
1743  0187 48            	sll	a
1744  0188 5a            	decw	x
1745  0189 26fc          	jrne	L46
1746  018b               L26:
1747  018b 43            	cpl	a
1748  018c c450c4        	and	a,20676
1749  018f               LC004:
1750  018f c750c4        	ld	20676,a
1751  0192 2024          	jra	L717
1752  0194               L127:
1753                     ; 716     if (NewState != DISABLE)
1755  0194 7b03          	ld	a,(OFST+2,sp)
1756  0196 270f          	jreq	L137
1757                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1759  0198 7b02          	ld	a,(OFST+1,sp)
1760  019a ad1f          	call	LC005
1761  019c 2704          	jreq	L66
1762  019e               L07:
1763  019e 48            	sll	a
1764  019f 5a            	decw	x
1765  01a0 26fc          	jrne	L07
1766  01a2               L66:
1767  01a2 ca50d0        	or	a,20688
1769  01a5 200e          	jp	LC003
1770  01a7               L137:
1771                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1773  01a7 7b02          	ld	a,(OFST+1,sp)
1774  01a9 ad10          	call	LC005
1775  01ab 2704          	jreq	L27
1776  01ad               L47:
1777  01ad 48            	sll	a
1778  01ae 5a            	decw	x
1779  01af 26fc          	jrne	L47
1780  01b1               L27:
1781  01b1 43            	cpl	a
1782  01b2 c450d0        	and	a,20688
1783  01b5               LC003:
1784  01b5 c750d0        	ld	20688,a
1785  01b8               L717:
1786                     ; 727 }
1789  01b8 5b03          	addw	sp,#3
1790  01ba 81            	ret	
1792  01bb               LC005:
1793  01bb a40f          	and	a,#15
1794  01bd 5f            	clrw	x
1795  01be 97            	ld	xl,a
1796  01bf a601          	ld	a,#1
1797  01c1 5d            	tnzw	x
1798  01c2 81            	ret	
1821                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1821                     ; 766 {
1822                     	switch	.text
1823  01c3               _CLK_LSEClockSecuritySystemEnable:
1827                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1829  01c3 72105190      	bset	20880,#0
1830                     ; 769 }
1833  01c7 81            	ret	
1857                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1857                     ; 778 {
1858                     	switch	.text
1859  01c8               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1863                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1865  01c8 72125190      	bset	20880,#1
1866                     ; 781 }
1869  01cc 81            	ret	
1944                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1944                     ; 808 {
1945                     	switch	.text
1946  01cd               _CLK_HaltConfig:
1948  01cd 89            	pushw	x
1949       00000000      OFST:	set	0
1952                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1954                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1956                     ; 813   if (NewState != DISABLE)
1958  01ce 9f            	ld	a,xl
1959  01cf 4d            	tnz	a
1960  01d0 2706          	jreq	L1101
1961                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1963  01d2 9e            	ld	a,xh
1964  01d3 ca50c2        	or	a,20674
1966  01d6 2006          	jra	L3101
1967  01d8               L1101:
1968                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1970  01d8 7b01          	ld	a,(OFST+1,sp)
1971  01da 43            	cpl	a
1972  01db c450c2        	and	a,20674
1973  01de               L3101:
1974  01de c750c2        	ld	20674,a
1975                     ; 821 }
1978  01e1 85            	popw	x
1979  01e2 81            	ret	
2015                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2015                     ; 832 {
2016                     	switch	.text
2017  01e3               _CLK_MainRegulatorCmd:
2021                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2023                     ; 836   if (NewState != DISABLE)
2025  01e3 4d            	tnz	a
2026  01e4 2705          	jreq	L3301
2027                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2029  01e6 721350cf      	bres	20687,#1
2032  01ea 81            	ret	
2033  01eb               L3301:
2034                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2036  01eb 721250cf      	bset	20687,#1
2037                     ; 846 }
2040  01ef 81            	ret	
2112                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2112                     ; 876 {
2113                     	switch	.text
2114  01f0               _CLK_ITConfig:
2116  01f0 89            	pushw	x
2117       00000000      OFST:	set	0
2120                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2122                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2124                     ; 882   if (NewState != DISABLE)
2126  01f1 9f            	ld	a,xl
2127  01f2 4d            	tnz	a
2128  01f3 271d          	jreq	L3701
2129                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2131  01f5 9e            	ld	a,xh
2132  01f6 a11c          	cp	a,#28
2133  01f8 2606          	jrne	L5701
2134                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2136  01fa 721450c9      	bset	20681,#2
2138  01fe 202c          	jra	L5011
2139  0200               L5701:
2140                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2142  0200 7b01          	ld	a,(OFST+1,sp)
2143  0202 a12c          	cp	a,#44
2144  0204 2606          	jrne	L1011
2145                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2147  0206 72145190      	bset	20880,#2
2149  020a 2020          	jra	L5011
2150  020c               L1011:
2151                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2153  020c 721450ca      	bset	20682,#2
2154  0210 201a          	jra	L5011
2155  0212               L3701:
2156                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2158  0212 7b01          	ld	a,(OFST+1,sp)
2159  0214 a11c          	cp	a,#28
2160  0216 2606          	jrne	L7011
2161                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2163  0218 721550c9      	bres	20681,#2
2165  021c 200e          	jra	L5011
2166  021e               L7011:
2167                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2169  021e a12c          	cp	a,#44
2170  0220 2606          	jrne	L3111
2171                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2173  0222 72155190      	bres	20880,#2
2175  0226 2004          	jra	L5011
2176  0228               L3111:
2177                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2179  0228 721550ca      	bres	20682,#2
2180  022c               L5011:
2181                     ; 918 }
2184  022c 85            	popw	x
2185  022d 81            	ret	
2404                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2404                     ; 946 {
2405                     	switch	.text
2406  022e               _CLK_GetFlagStatus:
2408  022e 88            	push	a
2409  022f 89            	pushw	x
2410       00000002      OFST:	set	2
2413                     ; 947   uint8_t reg = 0;
2415                     ; 948   uint8_t pos = 0;
2417                     ; 949   FlagStatus bitstatus = RESET;
2419                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2421                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2423  0230 7b03          	ld	a,(OFST+1,sp)
2424  0232 a4f0          	and	a,#240
2425  0234 6b02          	ld	(OFST+0,sp),a
2426                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2428  0236 7b03          	ld	a,(OFST+1,sp)
2429  0238 a40f          	and	a,#15
2430  023a 6b01          	ld	(OFST-1,sp),a
2431                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2433  023c 7b02          	ld	a,(OFST+0,sp)
2434  023e 2605          	jrne	L7221
2435                     ; 962     reg = CLK->CRTCR;
2437  0240 c650c1        	ld	a,20673
2439  0243 2042          	jra	L1321
2440  0245               L7221:
2441                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2443  0245 a110          	cp	a,#16
2444  0247 2605          	jrne	L3321
2445                     ; 966     reg = CLK->ICKCR;
2447  0249 c650c2        	ld	a,20674
2449  024c 2039          	jra	L1321
2450  024e               L3321:
2451                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2453  024e a120          	cp	a,#32
2454  0250 2605          	jrne	L7321
2455                     ; 970     reg = CLK->CCOR;
2457  0252 c650c5        	ld	a,20677
2459  0255 2030          	jra	L1321
2460  0257               L7321:
2461                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2463  0257 a130          	cp	a,#48
2464  0259 2605          	jrne	L3421
2465                     ; 974     reg = CLK->ECKCR;
2467  025b c650c6        	ld	a,20678
2469  025e 2027          	jra	L1321
2470  0260               L3421:
2471                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2473  0260 a140          	cp	a,#64
2474  0262 2605          	jrne	L7421
2475                     ; 978     reg = CLK->SWCR;
2477  0264 c650c9        	ld	a,20681
2479  0267 201e          	jra	L1321
2480  0269               L7421:
2481                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2483  0269 a150          	cp	a,#80
2484  026b 2605          	jrne	L3521
2485                     ; 982     reg = CLK->CSSR;
2487  026d c650ca        	ld	a,20682
2489  0270 2015          	jra	L1321
2490  0272               L3521:
2491                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2493  0272 a170          	cp	a,#112
2494  0274 2605          	jrne	L7521
2495                     ; 986     reg = CLK->REGCSR;
2497  0276 c650cf        	ld	a,20687
2499  0279 200c          	jra	L1321
2500  027b               L7521:
2501                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2503  027b a180          	cp	a,#128
2504  027d 2605          	jrne	L3621
2505                     ; 990     reg = CSSLSE->CSR;
2507  027f c65190        	ld	a,20880
2509  0282 2003          	jra	L1321
2510  0284               L3621:
2511                     ; 994     reg = CLK->CBEEPR;
2513  0284 c650cb        	ld	a,20683
2514  0287               L1321:
2515  0287 6b02          	ld	(OFST+0,sp),a
2516                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2518  0289 7b01          	ld	a,(OFST-1,sp)
2519  028b 5f            	clrw	x
2520  028c 97            	ld	xl,a
2521  028d a601          	ld	a,#1
2522  028f 5d            	tnzw	x
2523  0290 2704          	jreq	L211
2524  0292               L411:
2525  0292 48            	sll	a
2526  0293 5a            	decw	x
2527  0294 26fc          	jrne	L411
2528  0296               L211:
2529  0296 1402          	and	a,(OFST+0,sp)
2530  0298 2702          	jreq	L7621
2531                     ; 1000     bitstatus = SET;
2533  029a a601          	ld	a,#1
2535  029c               L7621:
2536                     ; 1004     bitstatus = RESET;
2538                     ; 1008   return((FlagStatus)bitstatus);
2542  029c 5b03          	addw	sp,#3
2543  029e 81            	ret	
2566                     ; 1016 void CLK_ClearFlag(void)
2566                     ; 1017 {
2567                     	switch	.text
2568  029f               _CLK_ClearFlag:
2572                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2574  029f 72175190      	bres	20880,#3
2575                     ; 1021 }
2578  02a3 81            	ret	
2624                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2624                     ; 1033 {
2625                     	switch	.text
2626  02a4               _CLK_GetITStatus:
2628  02a4 88            	push	a
2629  02a5 88            	push	a
2630       00000001      OFST:	set	1
2633                     ; 1035   ITStatus bitstatus = RESET;
2635  02a6 0f01          	clr	(OFST+0,sp)
2636                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2638                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2640  02a8 a11c          	cp	a,#28
2641  02aa 2605          	jrne	L5231
2642                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2644  02ac c450c9        	and	a,20681
2645                     ; 1045       bitstatus = SET;
2647  02af 200b          	jp	LC008
2648                     ; 1049       bitstatus = RESET;
2649  02b1               L5231:
2650                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2652  02b1 7b02          	ld	a,(OFST+1,sp)
2653  02b3 a12c          	cp	a,#44
2654  02b5 260d          	jrne	L5331
2655                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2657  02b7 c65190        	ld	a,20880
2658  02ba 1402          	and	a,(OFST+1,sp)
2659  02bc               LC008:
2660  02bc a10c          	cp	a,#12
2661  02be 260d          	jrne	L5431
2662                     ; 1057       bitstatus = SET;
2664  02c0               LC007:
2667  02c0 a601          	ld	a,#1
2669  02c2 200a          	jra	L3331
2670                     ; 1061       bitstatus = RESET;
2671  02c4               L5331:
2672                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2674  02c4 c650ca        	ld	a,20682
2675  02c7 1402          	and	a,(OFST+1,sp)
2676  02c9 a10c          	cp	a,#12
2677                     ; 1069       bitstatus = SET;
2679  02cb 27f3          	jreq	LC007
2680  02cd               L5431:
2681                     ; 1073       bitstatus = RESET;
2685  02cd 4f            	clr	a
2686  02ce               L3331:
2687                     ; 1078   return bitstatus;
2691  02ce 85            	popw	x
2692  02cf 81            	ret	
2728                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2728                     ; 1090 {
2729                     	switch	.text
2730  02d0               _CLK_ClearITPendingBit:
2734                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2736                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2738  02d0 a4f0          	and	a,#240
2739  02d2 a120          	cp	a,#32
2740  02d4 2605          	jrne	L7631
2741                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2743  02d6 72175190      	bres	20880,#3
2746  02da 81            	ret	
2747  02db               L7631:
2748                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2750  02db 721750c9      	bres	20681,#3
2751                     ; 1105 }
2754  02df 81            	ret	
2779                     	xdef	_SYSDivFactor
2780                     	xdef	_CLK_ClearITPendingBit
2781                     	xdef	_CLK_GetITStatus
2782                     	xdef	_CLK_ClearFlag
2783                     	xdef	_CLK_GetFlagStatus
2784                     	xdef	_CLK_ITConfig
2785                     	xdef	_CLK_MainRegulatorCmd
2786                     	xdef	_CLK_HaltConfig
2787                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2788                     	xdef	_CLK_LSEClockSecuritySystemEnable
2789                     	xdef	_CLK_PeripheralClockConfig
2790                     	xdef	_CLK_BEEPClockConfig
2791                     	xdef	_CLK_RTCClockConfig
2792                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2793                     	xdef	_CLK_SYSCLKDivConfig
2794                     	xdef	_CLK_GetClockFreq
2795                     	xdef	_CLK_GetSYSCLKSource
2796                     	xdef	_CLK_SYSCLKSourceConfig
2797                     	xdef	_CLK_CCOConfig
2798                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2799                     	xdef	_CLK_ClockSecuritySystemEnable
2800                     	xdef	_CLK_LSEConfig
2801                     	xdef	_CLK_HSEConfig
2802                     	xdef	_CLK_LSICmd
2803                     	xdef	_CLK_AdjustHSICalibrationValue
2804                     	xdef	_CLK_HSICmd
2805                     	xdef	_CLK_DeInit
2806                     	xref.b	c_lreg
2825                     	xref	c_ludv
2826                     	xref	c_rtol
2827                     	xref	c_ltor
2828                     	end
