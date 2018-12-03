   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  48                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  48                     ; 120 {
  50                     	switch	.text
  51  0000               _WWDG_Init:
  53  0000 89            	pushw	x
  54       00000000      OFST:	set	0
  57                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  59                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  61  0001 357f50d4      	mov	20692,#127
  62                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  64  0005 9e            	ld	a,xh
  65  0006 aa80          	or	a,#128
  66  0008 c750d3        	ld	20691,a
  67                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  69  000b 7b02          	ld	a,(OFST+2,sp)
  70  000d a47f          	and	a,#127
  71  000f c750d4        	ld	20692,a
  72                     ; 127 }
  75  0012 85            	popw	x
  76  0013 81            	ret
 118                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 118                     ; 136 {
 119                     	switch	.text
 120  0014               _WWDG_SetWindowValue:
 122  0014 88            	push	a
 123       00000001      OFST:	set	1
 126                     ; 137   __IO uint8_t tmpreg = 0;
 128  0015 0f01          	clr	(OFST+0,sp)
 129                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 131                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 133  0017 a47f          	and	a,#127
 134  0019 1a01          	or	a,(OFST+0,sp)
 135  001b 6b01          	ld	(OFST+0,sp),a
 136                     ; 146   WWDG->WR = tmpreg;
 138  001d 7b01          	ld	a,(OFST+0,sp)
 139  001f c750d4        	ld	20692,a
 140                     ; 147 }
 143  0022 84            	pop	a
 144  0023 81            	ret
 176                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 176                     ; 157 {
 177                     	switch	.text
 178  0024               _WWDG_SetCounter:
 182                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 184                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 186  0024 a47f          	and	a,#127
 187  0026 c750d3        	ld	20691,a
 188                     ; 164 }
 191  0029 81            	ret
 223                     ; 187 void WWDG_Enable(uint8_t Counter)
 223                     ; 188 {
 224                     	switch	.text
 225  002a               _WWDG_Enable:
 229                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 231                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 233  002a aa80          	or	a,#128
 234  002c c750d3        	ld	20691,a
 235                     ; 192 }
 238  002f 81            	ret
 261                     ; 216 uint8_t WWDG_GetCounter(void)
 261                     ; 217 {
 262                     	switch	.text
 263  0030               _WWDG_GetCounter:
 267                     ; 218   return(WWDG->CR);
 269  0030 c650d3        	ld	a,20691
 272  0033 81            	ret
 295                     ; 226 void WWDG_SWReset(void)
 295                     ; 227 {
 296                     	switch	.text
 297  0034               _WWDG_SWReset:
 301                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 303  0034 358050d3      	mov	20691,#128
 304                     ; 229 }
 307  0038 81            	ret
 320                     	xdef	_WWDG_SWReset
 321                     	xdef	_WWDG_GetCounter
 322                     	xdef	_WWDG_Enable
 323                     	xdef	_WWDG_SetCounter
 324                     	xdef	_WWDG_SetWindowValue
 325                     	xdef	_WWDG_Init
 344                     	end
