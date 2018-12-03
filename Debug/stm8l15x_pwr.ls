   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 82 void PWR_DeInit(void)
  32                     ; 83 {
  34                     	switch	.text
  35  0000               _PWR_DeInit:
  39                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  41  0000 352050b2      	mov	20658,#32
  42                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  44  0004 725f50b3      	clr	20659
  45                     ; 86 }
  48  0008 81            	ret
 145                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 145                     ; 103 {
 146                     	switch	.text
 147  0009               _PWR_PVDLevelConfig:
 149  0009 88            	push	a
 150       00000000      OFST:	set	0
 153                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 155                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 157  000a c650b2        	ld	a,20658
 158  000d a4f1          	and	a,#241
 159  000f c750b2        	ld	20658,a
 160                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 162  0012 c650b2        	ld	a,20658
 163  0015 1a01          	or	a,(OFST+1,sp)
 164  0017 c750b2        	ld	20658,a
 165                     ; 113 }
 168  001a 84            	pop	a
 169  001b 81            	ret
 224                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 224                     ; 122 {
 225                     	switch	.text
 226  001c               _PWR_PVDCmd:
 230                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 232                     ; 126   if (NewState != DISABLE)
 234  001c 4d            	tnz	a
 235  001d 2706          	jreq	L111
 236                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 238  001f 721050b2      	bset	20658,#0
 240  0023 2004          	jra	L311
 241  0025               L111:
 242                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 244  0025 721150b2      	bres	20658,#0
 245  0029               L311:
 246                     ; 136 }
 249  0029 81            	ret
 284                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 284                     ; 172 {
 285                     	switch	.text
 286  002a               _PWR_FastWakeUpCmd:
 290                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 292                     ; 176   if (NewState != DISABLE)
 294  002a 4d            	tnz	a
 295  002b 2706          	jreq	L331
 296                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 298  002d 721450b3      	bset	20659,#2
 300  0031 2004          	jra	L531
 301  0033               L331:
 302                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 304  0033 721550b3      	bres	20659,#2
 305  0037               L531:
 306                     ; 186 }
 309  0037 81            	ret
 345                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 345                     ; 195 {
 346                     	switch	.text
 347  0038               _PWR_UltraLowPowerCmd:
 351                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 353                     ; 199   if (NewState != DISABLE)
 355  0038 4d            	tnz	a
 356  0039 2706          	jreq	L551
 357                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 359  003b 721250b3      	bset	20659,#1
 361  003f 2004          	jra	L751
 362  0041               L551:
 363                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 365  0041 721350b3      	bres	20659,#1
 366  0045               L751:
 367                     ; 209 }
 370  0045 81            	ret
 405                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 405                     ; 233 {
 406                     	switch	.text
 407  0046               _PWR_PVDITConfig:
 411                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 413                     ; 237   if (NewState != DISABLE)
 415  0046 4d            	tnz	a
 416  0047 2706          	jreq	L771
 417                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 419  0049 721850b2      	bset	20658,#4
 421  004d 2004          	jra	L102
 422  004f               L771:
 423                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 425  004f 721950b2      	bres	20658,#4
 426  0053               L102:
 427                     ; 247 }
 430  0053 81            	ret
 523                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 523                     ; 262 {
 524                     	switch	.text
 525  0054               _PWR_GetFlagStatus:
 527  0054 88            	push	a
 528  0055 88            	push	a
 529       00000001      OFST:	set	1
 532                     ; 263   FlagStatus bitstatus = RESET;
 534  0056 0f01          	clr	(OFST+0,sp)
 535                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 537                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 539  0058 a501          	bcp	a,#1
 540  005a 2711          	jreq	L742
 541                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 543  005c c650b3        	ld	a,20659
 544  005f a501          	bcp	a,#1
 545  0061 2706          	jreq	L152
 546                     ; 272       bitstatus = SET;
 548  0063 a601          	ld	a,#1
 549  0065 6b01          	ld	(OFST+0,sp),a
 551  0067 2013          	jra	L552
 552  0069               L152:
 553                     ; 276       bitstatus = RESET;
 555  0069 0f01          	clr	(OFST+0,sp)
 556  006b 200f          	jra	L552
 557  006d               L742:
 558                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 560  006d c650b2        	ld	a,20658
 561  0070 1502          	bcp	a,(OFST+1,sp)
 562  0072 2706          	jreq	L752
 563                     ; 283       bitstatus = SET;
 565  0074 a601          	ld	a,#1
 566  0076 6b01          	ld	(OFST+0,sp),a
 568  0078 2002          	jra	L552
 569  007a               L752:
 570                     ; 287       bitstatus = RESET;
 572  007a 0f01          	clr	(OFST+0,sp)
 573  007c               L552:
 574                     ; 292   return((FlagStatus)bitstatus);
 576  007c 7b01          	ld	a,(OFST+0,sp)
 579  007e 85            	popw	x
 580  007f 81            	ret
 603                     ; 300 void PWR_PVDClearFlag(void)
 603                     ; 301 {
 604                     	switch	.text
 605  0080               _PWR_PVDClearFlag:
 609                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 611  0080 721a50b2      	bset	20658,#5
 612                     ; 304 }
 615  0084 81            	ret
 665                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 665                     ; 312 {
 666                     	switch	.text
 667  0085               _PWR_PVDGetITStatus:
 669  0085 89            	pushw	x
 670       00000002      OFST:	set	2
 673                     ; 313   ITStatus bitstatus = RESET;
 675  0086 7b02          	ld	a,(OFST+0,sp)
 676  0088 97            	ld	xl,a
 677                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 679  0089 7b01          	ld	a,(OFST-1,sp)
 680  008b 97            	ld	xl,a
 683  008c 7b02          	ld	a,(OFST+0,sp)
 684  008e 97            	ld	xl,a
 685                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 687  008f c650b2        	ld	a,20658
 688  0092 a420          	and	a,#32
 689  0094 6b01          	ld	(OFST-1,sp),a
 690                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 692  0096 c650b2        	ld	a,20658
 693  0099 a410          	and	a,#16
 694  009b 6b02          	ld	(OFST+0,sp),a
 695                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 697  009d 0d01          	tnz	(OFST-1,sp)
 698  009f 270a          	jreq	L513
 700  00a1 0d02          	tnz	(OFST+0,sp)
 701  00a3 2706          	jreq	L513
 702                     ; 322     bitstatus = (ITStatus)SET;
 704  00a5 a601          	ld	a,#1
 705  00a7 6b02          	ld	(OFST+0,sp),a
 707  00a9 2002          	jra	L713
 708  00ab               L513:
 709                     ; 326     bitstatus = (ITStatus)RESET;
 711  00ab 0f02          	clr	(OFST+0,sp)
 712  00ad               L713:
 713                     ; 328   return ((ITStatus)bitstatus);
 715  00ad 7b02          	ld	a,(OFST+0,sp)
 718  00af 85            	popw	x
 719  00b0 81            	ret
 743                     ; 336 void PWR_PVDClearITPendingBit(void)
 743                     ; 337 {
 744                     	switch	.text
 745  00b1               _PWR_PVDClearITPendingBit:
 749                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 751  00b1 721a50b2      	bset	20658,#5
 752                     ; 340 }
 755  00b5 81            	ret
 768                     	xdef	_PWR_PVDClearITPendingBit
 769                     	xdef	_PWR_PVDClearFlag
 770                     	xdef	_PWR_GetFlagStatus
 771                     	xdef	_PWR_PVDGetITStatus
 772                     	xdef	_PWR_PVDITConfig
 773                     	xdef	_PWR_UltraLowPowerCmd
 774                     	xdef	_PWR_FastWakeUpCmd
 775                     	xdef	_PWR_PVDCmd
 776                     	xdef	_PWR_PVDLevelConfig
 777                     	xdef	_PWR_DeInit
 796                     	end
