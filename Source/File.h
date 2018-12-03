/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : DiverUart.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 数据的读写,分EEPROM/FLASH 2个部分,包括了平衡算法(FLASH部分)
单条记录长度	TypeTime+Value	时间+表读数 6+4 60*10
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/


#include "global.h"
#include "string.h"
#include "FileGlobal.h"

#ifdef ENABLE_FLASH
//以下为宏定义

//以下为常量
#define RECORD_HEAD_0	0xaa		//记录头0
#define RECORD_HEAD_1	0xbb		//记录头1
#define SIZE_STORE		256		//存储的FLASH大小,可以随便定义,不能超过FLASH空闲地方
#define SIZE_BLOCK		64		//FLASH 块大小,MSP430固定的

//以下是结构体

//以下为数据表

//以下为字符串

//以下为变量
u16 ucAddressRecord;		//当前记录地址
u16 ucSizeRecord;			//记录大小
u8 aucRecordBuffer[SIZE_RECORD];		//记录缓冲
#else				//EEPROM

//以下为数据表

//以下为字符串

//以下为变量
u8 g_nRecAlmIndex;			        //告警记录指针
TypeReportErr stRepFail;            //上报失败错误码记录

u8 ucRecordIndex;			//当前记录指针
TypeRecord tyRecord;		//
TypeParameter tyParameter;

u8 g_nDayRecIndex;			//日冻结记录指针
u8 g_nMonRecIndex;			//月冻结记录指针
#endif

/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
