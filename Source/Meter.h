/*
项目:		IP表
编写:		孙继东		SunJiD@china-e-eye.com
模块描述:	通信读表数据
MCU:	msp430g2403
文件名:	meter.h
开始时间:	2015-6-17 14:53:41
*/
#ifndef __METER_H__
#define __METER_H__

#include "global.h"

//以下为宏定义
#define CTL_VAVLE_ENABLE   0xAA  //启动
#define CTL_VALVE_DISABLE  0x55  //禁止
#define CTL_VALVE_OVER     0xEE  //阀控执行结束


#ifdef XINJIANG_PTR
#define INVALID_DATA       0xFFFFFFFF
#else
#define INVALID_DATA       0xEEEEEEEE
#endif

/* 单次抄表超时 */
#define GM_TIMEOUT          600   //500
#define OPTVALVE_TIMEOUT    20000 //20秒

#define GM_DELAY            1000    //1s
#define GM_PWROFFDELAY      100    //200ms
#define VAVLE_DELAY          16     //5s
#define VAVLE_TIMEOUT        40     //20S
#define VAVLE_OPT_DELAY      500

/* 欠费标志 及欠费允许超出使用2吨标志及欠费上报标志 */
#define OWED_STAT_FLG       0x01   /* D0位 欠费状态标志*/
#define OWED_USED_FLG       0x02   /* D1位 欠费允许使用超2吨标志*/
#define OWED_REP_SUCC       0x04   /* D2上报成功 */
#define OWED_REP_FAIL       0x08   /* D3失败 */
#define OWED_ALL_FLAG       0x0F   /* 欠费标志 */

#ifdef  METER_6BIT
/* 6位光电表 */
#define FULL_RANGE_METER  1000000
#define UP_LIMIT_DATA      990000
#define LIMIT_PURCHASE     10000
#else
#ifdef METER_5BIT
/* 5位光电表 */
#define FULL_RANGE_METER   100000
#define UP_LIMIT_DATA       99000
#define LIMIT_PURCHASE      1000
#else
/* 4位光电表 */
#define FULL_RANGE_METER   10000
#define UP_LIMIT_DATA       9900
#define LIMIT_PURCHASE      100
#endif 
#endif

#define HALF_FULL_RANGE      FULL_RANGE_METER/2


//以下为常量

//以下为数据表

//以下为显示的字符串

//以下为变量
extern volatile TypeTime tyTime;		//时间结构体

/* 阀控执行任务 */
extern u8 g_nOptValveTask;
extern u32 g_dwNowMeterVal;

void fixTaskMeter(void);
u8 GetGatherMeterFlg(void);
void InitializeMeter(void);
u8 GM_GetGatherMeterFlg(void);
void fixTaskVavle(void);
u8 JASON_GetArrearageFlg(void);
void JASON_ClrArrearageFlg(void);
int32_t ClaGatherMeterTime(TypeTime stTime);
void JASON_130PurchasePro(void);


//以下为位变量
#endif /* __METER_H__ */
/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
