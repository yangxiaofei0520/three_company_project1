/*
项目:		IP表
编写:		孙继东		SunJiD@china-e-eye.com
模块描述:	和其他的MCU,PC通讯
MCU:	msp430g2403
文件名:	protocol.global.h
开始时间:	2015-6-24 17:32:45
*/
#ifndef __PROTOCOLGLOBAL_H__
#define __PROTOCOLGLOBAL_H__
#include "global.h"

//以下为宏定义
#ifdef XJ_JASON_VISON
#define PTROTO_JASON       // 新疆 
#else
#define PTROTO_CJ_188
#endif

//以下为常量
//内部协议命令宏定义
#define JASON_AUTO_TEST		'T'		//0x54	自动
#define JASON_CLOSE_VALVE		'G'		//0x47	关阀
#define JASON_FACTORY_SET		'X'		//0x58	出厂设置
#define JASON_OPEN_VALVE		'K'		//0x4B	开阀
#define JASON_READ_METER		'R'		//0x52	读表
#define JASON_SET_ADDR		'I'		//0x49	设置表地址
#define JASON_SET_PASSWORD	'S'		//0x53	设置表密码
#define JASON_SET_READER		'D'		//0x44	设置读数
#define JASON_VERSION			'Z'		//0x5A	版本
#define JASON_VERSION_CB		0xcb



#define READDATA   1
#define WRITEDATA  4
#define WRITEADDR  2  //add by maronglang 用于写地址
#define VALVEOPEN  3  //add by maronglang 用于阀门控制
#define VALVECLOSE 5  //add by maronglang 用于阀门控制
#define READADDR   6  //读取终端地址

#define JASON_READDAT_RE_LEN    18

/* MODBUS 压力计命令 */
#define SET_CMD       1
#define READ_CMD      0
#define SAVE_CMD      2

//以下为主函数
#define FixTaskModule2	fixTaskProtocolDebug
#define InitializeModule2	InitializeProtocol


extern u8 g_nValveStat;

void fixTaskProtocolDebug(void);
void InitializeProtocol(void);

//以下为接口函数
void NeedSendMasterCmd(u8 Cmd);		//发送主机命令
void NeedSendSlaveCmd(u8 Cmd);		//发送从机命令
u32 GetSysTemTick(void);

//内部协议抄表接口
u8 JasonProtocolGM(void);
u8 JasonProtocolOptValve(u8 nOptCmd);
u8 CJ_T188ProtocolOptValve(u8 nOptCmd);
u8 CJ_T188ProtocolGM(void);

//外部协议抄表接口
u8 GatherMeterFun(void);
u8 VavleOperateFun(u8 nOptCmd);
u8 CJ_T188ProtocolReadAdd(u8* pnOutAddr);
u8 GetVavleStat(void);
u32 MODBUS_GetPizeometer(u8 nCmd);
u8 SetMeterBoradAdd(u8 *pnBuf);
u32 DG_DebugPrintfFun(u8 *pnBuf, u8 nLen, u8 nIndex);
u8 GetBoardVavleStat(void);


//以下为位变量
#endif
/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
