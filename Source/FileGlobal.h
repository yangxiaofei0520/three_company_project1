/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : DiverUart.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 数据的读写,分EEPROM/FLASH 2个部分,包括了平衡算法(FLASH部分)
单条记录长度	TypeTime+Value	时间+表读数 6+4  总空间:4+10*3+4+28*(11+1)+4+31*8+4+24*7+(17*2+21+12*2+9)*2+4= 978字节
新疆协议 总空间:4+10*1+4+42*(10+1)+4+31*8+4+18*7+(21+17+11+7+2+9)*2+4+8= 1008字节
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef __FILEGLOBAL_H__
#define __FILEGLOBAL_H__
#include "GsmGlobal.h"


//以下是结构体
typedef struct
{
	SP_Time stTime;     //上报失败时间
	u16 wError;		    //错误码
	u8  nSigal;			//信号强度
}TypeReportErr;

//以下为宏定义
#define InitializeModule4	InitializeFile

//以下为宏定义
#ifdef XINJIANG_PTR
#define ADDRESS_PARAMETER_LEN  20           //终端参数 sizeof(TypeParameter) 16
#define ADDRESS_IPPARA_LEN     6          //IP参数 sizeof(TypeReportParameter)
#define ADDRESS_APN_LEN         1           //APN
#define REPOERCYCLE_LEN        16           //16 上报周期 sizeof(TypeReport)
#define LASTREPORTTIME_LEN     10           //上次上报时间 sizeof(TM_Time) + u16累计上报次数
#define OPTVALVE_LEN            10           //定时阀控任务 sizeof(TypeValve
#else ifdef JASON130_PTR
#define TMADDRESS_LEN           4           //TM地址长度
#ifdef PIEZOMETER
#define ADDRESS_PARAMETER_LEN  26           //终端参数 sizeof(TypeParameter)
#else
#define ADDRESS_PARAMETER_LEN  16           //终端参数 sizeof(TypeParameter)
#endif
#define ADDRESS_IPPARA_LEN     16           //IP参数 sizeof(TypeReportParameter)
#define ADDRESS_APN_LEN        16           //APN
#define REPOERCYCLE_LEN        11           //16 上报周期 sizeof(TypeReport)
#define LASTREPORTTIME_LEN     10           //上次上报时间 sizeof(TM_Time) + u16累计上报次数
#define OPTVALVE_LEN            10           //定时阀控任务 sizeof(TypeValveOpt)
#endif
#define MAX_LEN                 ADDRESS_PARAMETER_LEN




#define SIZE_EEPROM	1024		                                                   //EEPROM容量

#define ADDRESS_GUARD_EN          FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS+0     //防拆按键使能标志
#define ADDRESS_REPORTFLG          ADDRESS_GUARD_EN+1                            //开始地址 保存是否上报标志 上报数据标志 4

#define ADDRESS_TMADDRESS		   ADDRESS_REPORTFLG+4                            //终端地址
#define ADDRESS_PARAMETER		   ADDRESS_TMADDRESS+TMADDRESS_LEN+1              //开始地址,终端参数
#define ADDRESS_IPPARA  		   ADDRESS_PARAMETER+ADDRESS_PARAMETER_LEN + 1    //IP参数起始地址
#define ADDRESS_APN                ADDRESS_IPPARA + ADDRESS_IPPARA_LEN + 1	      //APN +1字节为CS校验
#define ADDRESS_REPOERCYCLE        ADDRESS_APN+ADDRESS_APN_LEN + 1		          //上报周期及时间
#define ADDRESS_REPORTTIME         ADDRESS_REPOERCYCLE+REPOERCYCLE_LEN + 1		  //上次上报时间
#define ADDRESS_OPTVALVE           ADDRESS_REPORTTIME+LASTREPORTTIME_LEN + 1	  //定时阀控

#define ADDRESS_TMADDRESS_BK	   ADDRESS_OPTVALVE+OPTVALVE_LEN + 1              //终端地址
#define ADDRESS_PARAMETER_BK	   ADDRESS_TMADDRESS_BK+TMADDRESS_LEN + 1              //表地址参数
#define ADDRESS_IPPARA_BK  		   ADDRESS_PARAMETER_BK+ADDRESS_PARAMETER_LEN + 1 //IP参数起始地址
#define ADDRESS_APN_BK             ADDRESS_IPPARA_BK + ADDRESS_IPPARA_LEN + 1	  //APN
#define ADDRESS_REPOERCYCLE_BK     ADDRESS_APN_BK+ADDRESS_APN_LEN + 1		      //上报周期及时间
#define ADDRESS_REPORTTIME_BK      ADDRESS_REPOERCYCLE_BK+REPOERCYCLE_LEN + 1	  //上次上报时间
#define ADDRESS_OPTVALVE_BK        ADDRESS_REPORTTIME_BK+LASTREPORTTIME_LEN + 1	  //定时阀控

#define ADDRESS_INDEX_ALM		   ADDRESS_OPTVALVE_BK + OPTVALVE_LEN + 1         //告警INDEX地址
#define ADDRESS_RECORD_ALM		   ADDRESS_INDEX_ALM+4		                          //告警记录地址
#ifdef XINJIANG_PTR
#define NUMBER_RECORD_ALM		     1		                                      //告警录数量3
#else
#define NUMBER_RECORD_ALM		     3		                                      //告警录数量3
#endif
#define RECORD_LEN_ALM             9                                             //告警单条记录长度

#ifdef XINJIANG_PTR
/* 保存月数据18条 */
#define ADDRESS_INDEX_MON			   ADDRESS_RECORD_ALM +(NUMBER_RECORD_ALM*(RECORD_LEN_ALM+1))//当前记录指针地址,共4位,轮流写
#define ADDRESS_RECORD_MON		   ADDRESS_INDEX_MON+4		                          //记录地址
#define NUMBER_RECORD_MON		       18		                                      //记录数量 18
#define RECORD_LEN_MON               6   

/* 明细数据40条 */
#define ADDRESS_INDEX			   ADDRESS_RECORD_MON +(NUMBER_RECORD_MON*(RECORD_LEN_MON+1))//当前记录指针地址,共4位,轮流写
#define ADDRESS_RECORD		       ADDRESS_INDEX+4		                          //记录地址
#define NUMBER_RECORD		       42		                                      //记录数量 40
#define RECORD_LEN                10                                             //单条记录长度

/* 保存日数据31条 */
#define ADDRESS_INDEX_DAY			   ADDRESS_RECORD +(NUMBER_RECORD*(RECORD_LEN+1))//当前记录指针地址,共4位,轮流写
#define ADDRESS_RECORD_DAY		   ADDRESS_INDEX_DAY+4		                      //记录地址
#define NUMBER_RECORD_DAY		       31		                                      //记录数量 31
#define RECORD_LEN_DAY               7                                             //单条记录长度

#else
/* 明细数据28条 */
#ifdef PIEZOMETER
#define ADDRESS_INDEX			   ADDRESS_RECORD_ALM +(NUMBER_RECORD_ALM*(RECORD_LEN_ALM+1))//当前记录指针地址,共4位,轮流写
#define ADDRESS_RECORD		       ADDRESS_INDEX+4		                          //记录地址
#define NUMBER_RECORD		       28		                                      //记录数量 28
#define RECORD_LEN                16                                             //单条记录长度   
#else
/* 保存月数据24条 */
#define ADDRESS_INDEX_MON			   ADDRESS_RECORD_ALM +(NUMBER_RECORD_ALM*(RECORD_LEN_ALM+1))//当前记录指针地址,共4位,轮流写
#define ADDRESS_RECORD_MON		   ADDRESS_INDEX_MON+4		                          //记录地址
#define NUMBER_RECORD_MON		       24		                                      //记录数量 24
#define RECORD_LEN_MON               6   

#define ADDRESS_INDEX			   ADDRESS_RECORD_MON +(NUMBER_RECORD_MON*(RECORD_LEN_MON+1))//当前记录指针地址,共4位,轮流写
#define ADDRESS_RECORD		       ADDRESS_INDEX+4		                          //记录地址
#define NUMBER_RECORD		       28		                                      //记录数量 28
#define RECORD_LEN                12                                             //单条记录长度   

/* 保存日数据31条 */
#define ADDRESS_INDEX_DAY			   ADDRESS_RECORD +(NUMBER_RECORD*(RECORD_LEN+1))//当前记录指针地址,共4位,轮流写
#define ADDRESS_RECORD_DAY		   ADDRESS_INDEX_DAY+4		                      //记录地址
#define NUMBER_RECORD_DAY		       31		                                      //记录数量 31
#define RECORD_LEN_DAY               7 
#endif
#endif

//以下为常量

//以下为主函数

//以下为接口函数
void AddRecord(u8 *Record, u8 nLen);		//增加1条记录,如果满了,自动删除最老的记录
void DelRecord(u8 Index);		//删除某1条记录,剩下记录向前移动
void InitializeFile(void);		//初始化调用一次
u8 ReadRecord(u8 nIndex, u8 *Record, u8 nOutLen);
u8 ReadParameterForType(u8* pnDat, u8 nLen, u8 nTpye);		//读参数
void SaveParameterForType(u8* pnDat, u8 nLen, u8 nTpye);        //保存参数
void SaveReportFlag(u8 nReportFlg);
u8 ReadReportFlag(void);
void ReadGroup(u8 Length, u16 Address, u8 *Data);		//从EEPROM指定地址读取N个字节
void SaveByte(u16 Address, u8 Data);
u8 EditRecord(u8 nIndex, u8 *Record, u8 nInLen);

void AddAlmRecord(u8 *Record, u8 nLen);
u8 ReadAlmRecord(u8 nIndex, u8 *Record, u8 nOutLen);

void AddDayFreezeRecord(u8 *Record, u8 nLen);
u8 ReadDayFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen);
void AddMonFreezeRecord(u8 *Record, u8 nLen);
u8 ReadMonFreezeRecord(u8 nIndex, u8 *Record, u8 nOutLen);
u8 ReadDataMemory(u8 nIndex, u8 *Record, u8 nOutLen);


extern TypeRecord tyRecord;
extern TypeParameter tyParameter;
extern TypeReportErr stRepFail;


#endif
/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
