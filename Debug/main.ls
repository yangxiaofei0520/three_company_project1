   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     	switch	.data
   6  0000               L3_dwGprsCnt:
   7  0000 00000000      	dc.l	0
  55                     .const:	section	.text
  56  0000               L02:
  57  0000 0000000b      	dc.l	11
  58                     ; 59 void SystemTask(void)
  58                     ; 60 {
  59                     	scross	off
  60                     	switch	.text
  61  0000               _SystemTask:
  65                     ; 64 	FeedSoftWareIwdg();
  67  0000 cd0000        	call	_FeedSoftWareIwdg
  69                     ; 67 	if(TRUE == CheckDebugInsertStat())
  71  0003 cd0000        	call	_CheckDebugInsertStat
  73  0006 4a            	dec	a
  74  0007 2603          	jrne	L72
  75                     ; 69 		fixTaskProtocolDebug();
  77  0009 cd0000        	call	_fixTaskProtocolDebug
  79  000c               L72:
  80                     ; 73 	if((FALSE == CheckDebugInsertStat())&&(CALL_10MS < GetSysTemTick() - dwGprsCnt))
  82  000c cd0000        	call	_CheckDebugInsertStat
  84  000f 4d            	tnz	a
  85  0010 261d          	jrne	L13
  87  0012 cd0000        	call	_GetSysTemTick
  89  0015 ae0000        	ldw	x,#L3_dwGprsCnt
  90  0018 cd0000        	call	c_lsub
  92  001b ae0000        	ldw	x,#L02
  93  001e cd0000        	call	c_lcmp
  95  0021 250c          	jrult	L13
  96                     ; 75 		dwGprsCnt = GetSysTemTick();
  98  0023 cd0000        	call	_GetSysTemTick
 100  0026 ae0000        	ldw	x,#L3_dwGprsCnt
 101  0029 cd0000        	call	c_rtol
 103                     ; 76 		fixTaskGsm();
 105  002c cd0000        	call	_fixTaskGsm
 107  002f               L13:
 108                     ; 80 	if(FALSE == CheckDebugInsertStat())
 110  002f cd0000        	call	_CheckDebugInsertStat
 112  0032 4d            	tnz	a
 113  0033 2603          	jrne	L33
 114                     ; 82 		fixTaskMeter();
 116  0035 cd0000        	call	_fixTaskMeter
 118  0038               L33:
 119                     ; 86 	if(FALSE == CheckDebugInsertStat())
 121  0038 cd0000        	call	_CheckDebugInsertStat
 123  003b 4d            	tnz	a
 124  003c 2603          	jrne	L53
 125                     ; 88 		fixTaskVavle();
 127  003e cd0000        	call	_fixTaskVavle
 129  0041               L53:
 130                     ; 92 	if(FALSE == CheckDebugInsertStat())
 132  0041 cd0000        	call	_CheckDebugInsertStat
 134  0044 4d            	tnz	a
 135  0045 2603          	jrne	L73
 136                     ; 94 		ALM_TaskFunc();
 138  0047 cd0000        	call	_ALM_TaskFunc
 140  004a               L73:
 141                     ; 98 	LP_LowPowerManage();
 143  004a cd0000        	call	_LP_LowPowerManage
 145                     ; 101 	fixTaskLed();
 148                     ; 102 }
 151  004d cc0000        	jp	_fixTaskLed
 179                     ; 114 void Initialize(void)
 179                     ; 115 {
 180                     	switch	.text
 181  0050               _Initialize:
 185                     ; 117 	InitializeBase();
 187  0050 cd0000        	call	_InitializeBase
 189                     ; 120 	InitializeMeter();
 191  0053 cd0000        	call	_InitializeMeter
 193                     ; 123 	InitializeGsm();
 195  0056 cd0000        	call	_InitializeGsm
 197                     ; 126 	InitializeProtocol();
 199  0059 cd0000        	call	_InitializeProtocol
 201                     ; 129 	InitializeFile();
 204                     ; 184 	return ;
 207  005c cc0000        	jp	_InitializeFile
 232                     ; 196 void main(void)
 232                     ; 197 {
 233                     	switch	.text
 234  005f               _main:
 238                     ; 198 	Initialize();			//初始化
 240  005f adef          	call	_Initialize
 242  0061               L16:
 243                     ; 201 		SystemTask();		//主循环
 245  0061 ad9d          	call	_SystemTask
 248  0063 20fc          	jra	L16
 261                     	xdef	_main
 262                     	xdef	_Initialize
 263                     	xdef	_SystemTask
 264                     	xref	_ALM_TaskFunc
 265                     	xref	_LP_LowPowerManage
 266                     	xref	_InitializeFile
 267                     	xref	_InitializeGsm
 268                     	xref	_fixTaskGsm
 269                     	xref	_fixTaskVavle
 270                     	xref	_InitializeMeter
 271                     	xref	_fixTaskMeter
 272                     	xref	_fixTaskLed
 273                     	xref	_FeedSoftWareIwdg
 274                     	xref	_CheckDebugInsertStat
 275                     	xref	_InitializeBase
 276                     	xref	_GetSysTemTick
 277                     	xref	_InitializeProtocol
 278                     	xref	_fixTaskProtocolDebug
 297                     	xref	c_rtol
 298                     	xref	c_lcmp
 299                     	xref	c_lsub
 300                     	end
