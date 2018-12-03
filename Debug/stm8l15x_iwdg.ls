   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  67                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  67                     ; 129 {
  69                     	switch	.text
  70  0000               _IWDG_WriteAccessCmd:
  74                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  76                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  78  0000 c750e0        	ld	20704,a
  79                     ; 133 }
  82  0003 81            	ret
 172                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 172                     ; 149 {
 173                     	switch	.text
 174  0004               _IWDG_SetPrescaler:
 178                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 180                     ; 152   IWDG->PR = IWDG_Prescaler;
 182  0004 c750e1        	ld	20705,a
 183                     ; 153 }
 186  0007 81            	ret
 218                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
 218                     ; 163 {
 219                     	switch	.text
 220  0008               _IWDG_SetReload:
 224                     ; 164   IWDG->RLR = IWDG_Reload;
 226  0008 c750e2        	ld	20706,a
 227                     ; 165 }
 230  000b 81            	ret
 253                     ; 173 void IWDG_ReloadCounter(void)
 253                     ; 174 {
 254                     	switch	.text
 255  000c               _IWDG_ReloadCounter:
 259                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
 261  000c 35aa50e0      	mov	20704,#170
 262                     ; 176 }
 265  0010 81            	ret
 288                     ; 199 void IWDG_Enable(void)
 288                     ; 200 {
 289                     	switch	.text
 290  0011               _IWDG_Enable:
 294                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
 296  0011 35cc50e0      	mov	20704,#204
 297                     ; 202 }
 300  0015 81            	ret
 313                     	xdef	_IWDG_Enable
 314                     	xdef	_IWDG_ReloadCounter
 315                     	xdef	_IWDG_SetReload
 316                     	xdef	_IWDG_SetPrescaler
 317                     	xdef	_IWDG_WriteAccessCmd
 336                     	end
