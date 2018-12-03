   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
 113                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 113                     ; 100 {
 115                     	switch	.text
 116  0000               _RST_GetFlagStatus:
 120                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 122                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 124  0000 c450b1        	and	a,20657
 125  0003 2603          	jrne	L6
 126  0005 4f            	clr	a
 127  0006 2002          	jra	L01
 128  0008               L6:
 129  0008 a601          	ld	a,#1
 130  000a               L01:
 133  000a 81            	ret
 168                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 168                     ; 121 {
 169                     	switch	.text
 170  000b               _RST_ClearFlag:
 174                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 176                     ; 125   RST->SR = (uint8_t)RST_Flag;
 178  000b c750b1        	ld	20657,a
 179                     ; 126 }
 182  000e 81            	ret
 205                     ; 149 void RST_GPOutputEnable(void)
 205                     ; 150 {
 206                     	switch	.text
 207  000f               _RST_GPOutputEnable:
 211                     ; 152   RST->CR = RST_CR_MASK;
 213  000f 35d050b0      	mov	20656,#208
 214                     ; 153 }
 217  0013 81            	ret
 230                     	xdef	_RST_GPOutputEnable
 231                     	xdef	_RST_ClearFlag
 232                     	xdef	_RST_GetFlagStatus
 251                     	end
