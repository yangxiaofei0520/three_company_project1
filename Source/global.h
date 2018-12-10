/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : global.h
* Author            : maronglang
* Date First Issued : 2015/12/25
* Description       : 全局结构与类型定义文件
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/
#include "Libraries/inc/stm8l15x_conf.h"
#include "JX_Math.h"
#include "ProtocolGlobal.h"


#ifndef GLOBAL_H
#define GLOBAL_H

#define SUCCESS_GLOBAL        0
#define FAILURE_GLOBAL        1
#define ERROR         -1

//#define TEST_VISON         // just for test 测试版本
//#define   SAVE_TEST        // just for test 存储测试版本
//#define     XJ_JASON_VISON  // 特殊出货内部协议版本

/* 气表水表选择宏定义 */
//#define IOT_GASMETER       // 物联网气表光电直读
//#define IOT_WATERMETER      // 物联网水表光电直读旧模具
//#define IOT_WATERMETER_NEW      // 新模具光电直读
#define IOT_DAT_DETECTOR        //大表数据采集器 


/* 上行协议类型 */
//#define XINJIANG_PTR            //新疆协议
#define HEDA_PTR				//和达协议
//#define JASON130_PTR            //捷先130协议

/* 预付费模式 */
//#define PURCHASE_MODE     

#define VAVLE_METER             //是否带阀控

#ifdef VAVLE_METER
//#define VAVLE_INNER             // 表端内置阀门 针对DN25表内置阀门
#endif

//#define PIEZOMETER              // 压力计 piezometer

#define PHOTOELECTRIC_METER    //光电表  只接压力计则不需要此项

/* 预付费专用水表位数 */
#ifdef  PURCHASE_MODE
#define METER_6BIT
//#define METER_5BIT
//#define METER_4BIT
#endif

#ifndef NULL
#define NULL ((void *)0)
#endif

#if 1
//以下是共同体(联合体)
typedef union {
	unsigned char Byte;
	struct {
		unsigned int N0:4;
		unsigned int N1:4;
	} Nibbles;
	struct {
		unsigned int D0:2;
		unsigned int D1:2;
		unsigned int D2:2;
		unsigned int D3:2;
	} Doublets;
	struct {
		unsigned int b0:1;
		unsigned int b1:1;
		unsigned int b2:1;
		unsigned int b3:1;
		unsigned int b4:1;
		unsigned int b5:1;
		unsigned int b6:1;
		unsigned int b7:1;
	} Bits;
} Type8Bits;

typedef union {
	unsigned short Short;
	struct {
		unsigned char B0;
		unsigned char B1;
	} Bytes;
	struct {
		unsigned int N0:4;
		unsigned int N1:4;
		unsigned int N2:4;
		unsigned int N3:4;
	} Nibbles;
	struct {
		unsigned int D0:2;
		unsigned int D1:2;
		unsigned int D2:2;
		unsigned int D3:2;
		unsigned int D4:2;
		unsigned int D5:2;
		unsigned int D6:2;
		unsigned int D7:2;
	} Doublets;
	struct {
		unsigned int b0:1;
		unsigned int b1:1;
		unsigned int b2:1;
		unsigned int b3:1;
		unsigned int b4:1;
		unsigned int b5:1;
		unsigned int b6:1;
		unsigned int b7:1;
		unsigned int b8:1;
		unsigned int b9:1;
		unsigned int b10:1;
		unsigned int b11:1;
		unsigned int b12:1;
		unsigned int b13:1;
		unsigned int b14:1;
		unsigned int b15:1;
	} Bits;
} Type16Bits;

typedef union {
	unsigned long Long;
	struct {
		unsigned short S0;
		unsigned short S1;
	} Shorts;
	struct {
		unsigned char B0;
		unsigned char B1;
		unsigned char B2;
		unsigned char B3;
	} Bytes;
	struct {
		unsigned int N0:4;
		unsigned int N1:4;
		unsigned int N2:4;
		unsigned int N3:4;
		unsigned int N4:4;
		unsigned int N5:4;
		unsigned int N6:4;
		unsigned int N7:4;
	} Nibbles;
	struct {
		unsigned int D0:2;
		unsigned int D1:2;
		unsigned int D2:2;
		unsigned int D3:2;
		unsigned int D4:2;
		unsigned int D5:2;
		unsigned int D6:2;
		unsigned int D7:2;
		unsigned int D8:2;
		unsigned int D9:2;
		unsigned int D10:2;
		unsigned int D11:2;
		unsigned int D12:2;
		unsigned int D13:2;
		unsigned int D14:2;
		unsigned int D15:2;
	} Doublets;
	struct {
		unsigned int b0:1;
		unsigned int b1:1;
		unsigned int b2:1;
		unsigned int b3:1;
		unsigned int b4:1;
		unsigned int b5:1;
		unsigned int b6:1;
		unsigned int b7:1;
		unsigned int b8:1;
		unsigned int b9:1;
		unsigned int b10:1;
		unsigned int b11:1;
		unsigned int b12:1;
		unsigned int b13:1;
		unsigned int b14:1;
		unsigned int b15:1;
		unsigned int b16:1;
		unsigned int b17:1;
		unsigned int b18:1;
		unsigned int b19:1;
		unsigned int b20:1;
		unsigned int b21:1;
		unsigned int b22:1;
		unsigned int b23:1;
		unsigned int b24:1;
		unsigned int b25:1;
		unsigned int b26:1;
		unsigned int b27:1;
		unsigned int b28:1;
		unsigned int b29:1;
		unsigned int b30:1;
		unsigned int b31:1;
	} Bits;
} Type32Bits;
#endif

typedef union		//时间结构体
{
	struct
	{
		u8 Second;		//低位在前
		u8 Minute;
		u8 Hour;
		u8 Day;
		u8 Month;
//		u8 WeekMonth;
		u8 Year;
	} Byte;
	struct
	{
		u16 MS;
		u16 DH;
		u16 YM;
	} Int;
} TypeTime;	//6byte

/* 以下为130协议结构体 */
#ifdef JASON130_PTR
	typedef struct
	{
		u8 Type;			//表类型
		u8 Status;			//表状态
		//u32 Address;		//表地址  // edit by maronglang 2018030601
		u32 Value;		    //表读数
		u32 Password;		//密码
		u32 dwPurchaseVal;//预购后水表读数
		s8  nEmergencyVal;//应急用量
		u8  nOverBuyFlg;  //超出用水标志 设置D1位为1后 可允许再用2吨 D2位为1表示上报成功， D3位为1表示上报失败
		#ifdef PIEZOMETER
		    u32 wBasePress;
		    u8  nAlmCtl[4];
		    u8  nUpLmtRate;
		    u8  nDownLmtRate;
		#endif
	} TypeParameter;		//表参数

	typedef struct
	{
		u16 wGatherCycle;   //抄表间隔
		u8 enable;			//定时上报允许
		u8 cycle;			//上报周期：时，天，月
		TypeTime Time;		//时间
		u8 nMonFreezeDay; /* 月冻结日 */	
	} TypeReport;

	typedef struct
	{
		u32 Main_IP;		//主机IP地址
		u32 Sub_IP;		    //备用IP地址
		u16 Main_Port;		//主机端口
		u16 Sub_Port;		//备用端口
	} TypeReportParameter;		//上报参数

	typedef struct
	{
		TypeTime Time;  //时间
		u32 Value;		//表读数
		#ifdef PIEZOMETER
		    u32 wPressure;
		#endif
		u8  nStatus;    //表状态
		u8  nRepFlg;    //上报标志
	} TypeRecord;		//表记录


/* 以下为新疆协议结构体 */
#elif defined(XINJIANG_PTR)
	typedef	 struct   	//时间结构体
	{
		u8   nYear;        // 年(99)
		u8   nMonth;       // 月(01-12)
		u8   nDay;         // 日(01-31)
		u8   nHour;        // 时(00-23)
		u8   nMinute;      // 分(00-59)
		u8   nSecond;      // 秒(00-59)
	}TIME_BIN;	//6byte

	typedef struct
	{
		u8 Type;			//表类型
		u8 Address[5];		//表序号
		u8 FactoryCode[2];	//厂商ID
		u32 Value;		    //表读数
		u8 Status[4];		//表状态	
		u8 RestoreStat[4];  //表状态恢复情况	
	} TypeParameter;		//表参数

	typedef struct
	{
		u8 nGatherCycle;   //抄表间隔
		u8 nStartDay;	    //起始日期
		u8 nStartHour;	    //起始小时
		u8 nStartMinute;	/* 起始分钟 */
		u8 nIntervalType; 	/* 间隔类型 */
		u8 cycle;			//上报周期：时，天，月
		u8 nTailCtl; 	    /* 尾数上线控制 */
		u8 nTaiInterval;  /* 尾数上线间隔数 */	
		u8 nMonFreezeDay; /* 月冻结日 */	
		u8 nReportType;   /* 上线帧类型 */	
		TIME_BIN Time;		//时间
	} TypeReport;

	typedef struct
	{
		u32 Main_IP;		//主机IP地址
		u16 Main_Port;		//主机端口
	} TypeReportParameter;		//上报参数

	typedef struct
	{
		u32 Value;		//表读数
		TypeTime Time;  //时间
	} TypeRecord;		//表记录

#elif defined(HEDA_PTR)	//和达协议

	typedef	 struct   	//时间结构体
	{
		u8   nYear;        // 年(99)
		u8   nMonth;       // 月(01-12)
		u8   nDay;         // 日(01-31)
		u8   nHour;        // 时(00-23)
		u8   nMinute;      // 分(00-59)
		u8   nSecond;      // 秒(00-59)
	}TIME_BIN;	//6byte

	typedef struct
	{
		u8 Type;					//表类型
		u8 Address[5];				//表序号
		u8 FactoryCode[2];			//厂商ID
		u32 Value;		    		//表读数
		u8 Status;				//表状态	
		u8 RestoreStat[4];  		//表状态恢复情况	
		float Pressure1_LimitUp;	//压力1上限
		float Pressure1_LimitDown;	//压力1下限
		float Pressure2_LimitUp;	//压力2上限
		float Pressure2_LimitDown;	//压力2下限
	} TypeParameter;		//表参数

	typedef struct
	{
		u8 wGatherCycle;   	//抄表间隔
		u8 nIntervalType; 	/* 间隔类型 */
		u8 cycle;			//上报周期：时，天，月
		u8 nMonFreezeDay; /* 月冻结日 */
		TypeTime Time;		//时间	
	} TypeReport;

	typedef struct
	{
		u32 Main_IP;		//主机IP地址
		u16 Main_Port;		//主机端口
		u8  Main_domain_name[32];//域名
		u8  flag_Login_Mode;//登陆方式，默认IP地址
	} TypeReportParameter;		//上报参数

	typedef struct
	{
		u32 Value;		//表读数
		TypeTime Time;  //时间

		
		u8  nStatus;    //表状态
		u8  nRepFlg;    //上报标志
	} TypeRecord;		//表记录

#endif

typedef struct
{
	u32 Value;		//表读数
	u8 nYear;       //年
	u8 nMon;        //月
	u8 nDay;       //日

} TypeRecordDay;		//表记录

typedef struct
{
	u32 Value;		//表读数
	u8 nYear;       //年
	u8 nMon;        //月
} TypeRecordMon;		//表记录


typedef struct
{
	u8 nEnableFlg;     //启用0xaa  禁止 = 0x55
	u8 nOptFlg;		    //上报控制与执行控制标志 00 无定时阀控任务，启用0xaa  禁止 = 0x55 
	u8 nYear;		    //年
	u8 nMonth;		    //月
	u8 nDay;		    //日
	u8 nStartHour;		//起始
	u8 nEndHour;		//结束
	u8 nVavleStat;     //阀动后结果
	u8 nRepFailCnt;     //上报失败次数
	u8 nVavleCycle;     //定时动阀周期 00 默认每月1号15号 2点-4点开关阀 1-255是天
} TypeValveOpt;




typedef struct		//内部协议通讯协议,需要设置的接收的结构
{
	union
	{
		u8 Buffer[18];
		struct
		{
			u32 Address;		//地址
			u8 Cmd;
			u32 Code;		//要设置的参数
			u16 Crc;
			u8 End;
		} Tx;		//发送  edit by maronglang 20150822
		struct
		{
			u32 Address;		//地址
			u8 Cmd;
			u8 Type;		//命令
			u8 Status;
			u32 Value;
			u32 Password;
			u16 Crc;
			u8  End;
		}Rx; 	//接收协议代码  edit by maronglang 20150822
	};
	u8 Count;
	u8 Length: 7;
	u8 Head: 1;
} TypeJason;	//18byte

//以下是宏定义
#define MAX_1_BYTE 255		//((2^8) -1)		//单字节最大值
#define MAX_2_BYTE 65535		//((2^16) -1)		//双字节最大值
#define MAX_3_BYTE 16777215	//((2^24) -1)		//3字节最大值
#define MAX_4_BYTE ((u32)4294967295uL)	//((2^32) -1)		//4字节最大值

#define CLB0	0xfe		//bit0 clear mask
#define CLB1	0xfd		//bit1 clear mask
#define CLB2	0xfb		//bit2 clear mask
#define CLB3	0xf7		//bit3 clear mask
#define CLB4	0xef		//bit4 clear mask
#define CLB5	0xdf		//bit5 clear mask
#define CLB6	0xbf		//bit6 clear mask
#define CLB7	0x7f		//bit7 clear mask

//串口发送校验设置宏定义
#define NONE		0		//无校验命令
#define ODD			1		//奇校验命令
#define EVEN		2		//偶校验命令

#define CLOCK_MCU	1000000		//晶振频率1MHz,内部RC振荡
//	#define ENABLE_FLASH		//FLASH模拟EEPROM
#define ENABLE_BUS_UART
#define ENABLE_BUS_I2C		//eeprom
#define INTERNAL_RC		//内部RC振荡

#define  ST_SPECIA     @near

	
#endif

/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
