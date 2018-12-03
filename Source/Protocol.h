/*
项目:		IP表
编写:		孙继东		SunJiD@china-e-eye.com
模块描述:	和其他的MCU,PC通讯
MCU:	msp430g2403
文件名:	protocol.c
开始时间:	2015-6-24 17:32:45
*/
#ifndef __PROTOCOL_H__
#define __PROTOCOL_H__

#include "global.h"
#include <string.h>

//以下为常量
#define TIMER_4_METER	3000		//发送命令时间@3ms*3000 9S处理超时
#define MAX_JASON		18			//12 最大协议长度 edit by maronglang 20150822
#define INIT_STATUS	0
#define INIT_ADDRESS	1
#define INIT_PASSWORD	0x66668888
#define ANSWER_PASSWORD	0x33333333

#define COLD_WATER_METER		0x10		//冷水表
#define HOT_WATER_METER		0x11		//热水表
#define GAS_METER				0x30		//燃气表
#define JASON_METER_WATER		0x73		//气表
#define JASON_METER_WATER_01	0x72		//0.1倍气表

//其他
#define JASON_HEAD_OFFSET		8	//真正数据开始
#define JASON_HEAD_0		'B'		//0x42	头
#define JASON_HEAD_1		'S'		//0x53	头
#define JASON_TAIL			'E'		//0x45	尾
#define JASON_PREAMBLE	0xfe		//引导码
#define JASON_BROADCAST		0xffffffff	//广播码
#define JASON_ADDR_LEN           4

#define JASON_RATE_0001       0
#define JASON_RATE_001        1
#define JASON_RATE_01         2
#define JASON_RATE_1          3
#define JASON_RATE_10         4
#define JASON_RATE_100        5
#define JASON_RATE_1000       6


/* CJ-T188协议 */
#define CJT188_ADDR_LEN           7
#define CJT188_ADDR_LEN           7



/*读表
FE FE FE 42 42 42 42 53 70 12 82 40 52 4C 81 45
FE FE FE 53 53 53 53 42 70 12 82 40 52 43 00 23 01 00 00 34 44 44 44 2B BC 45
*/

//以下为数据表
//CRC 校验表
const u8 he00[] = {0x00, 0x12, 0x24, 0x36, 0x48, 0x5a, 0x6c, 0x7e, 0x91, 0x83, 0xb5, 0xa7, 0xd9, 0xcb, 0xfd, 0xef};
const u8 le00[] = {0x00, 0x31, 0x62, 0x53, 0xc4, 0xf5, 0xa6, 0x97, 0x88, 0xb9, 0xea, 0xdb, 0x4c, 0x7d, 0x2e, 0x1f};
const u8 hf00[] = {0x00, 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70, 0x81, 0x91, 0xa1, 0xb1, 0xc1, 0xd1, 0xe1, 0xf1};
const u8 lf00[] = {0x00, 0x21, 0x42, 0x63, 0x84, 0xa5, 0xc6, 0xe7, 0x08, 0x29, 0x4a, 0x6b, 0x8c, 0xad, 0xce, 0xef};


//以下为显示的字符串

//以下为变量
u8 ucNumberUart2;		//接收数据数量
u8 ucNumberUart3;		//接收数据数量
u8 ucNumberUart;		//接收数据数量
u8 ucStatusProtocol2;		//状态
u8 ucStatusProtocol3;		//状态
u8 ucStatusProtocol;		//状态
u8 ucStepProtocol2;		//检测电压次数,步骤
u8 ucStepProtocol3;		//检测电压次数,步骤
u8 ucStepProtocol;		//检测电压次数,步骤
u8 ucStepUart2;			//接收步骤
u8 ucStepUart3;			//接收步骤
u8 ucStepUart;			//接收步骤
u8 ucTimerProtocol2;		//设置定时器,8.16ms
u8 ucTimerProtocol3;		//设置定时器,8.16ms
u8 ucTimerProtocol;		//设置定时器,8.16ms
u8 ucMasterCmd;		//需要发送主机命令
u8 ucSlaveCmd;		//需要发送从机命令
TypeJason tyJasonMaster;		//内部协议主机
TypeJason tyJasonSlave;		//内部协议从机
extern TypeParameter tyParameter;			//表参数
extern u8 aucUartTxBuffer[];
extern u8 aucRecordBuffer[];		//记录缓冲

//以下为位变量

#endif /* __PROTOCOL_H__ */

/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/

