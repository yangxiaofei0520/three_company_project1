/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : GsmGlobal.h
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 通信模块接口函数
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef __GSMGLOBAL_H__
#define __GSMGLOBAL_H__
#include "global.h"

//以下为宏定义
#define GSM_INIT			1		//初始化
#define GSM_SHAKEHAND	    2		//GPRS握手
#define GSM_DAIL    	    3		//拨号连接
#define GSM_SEND			4		//发送数据
#define GSM_CLOSE			5		//关机

#define IPANDPORT_PARA       1
#define APN_PARA             2
#define REPORT_PARA          3
#define METER_PARA           4
#define LT_REP_TIME          5
#define OPT_VALVE_PRAA       6
#define TM_ADDRESS_PRAA      7


/* 最大上报次数 */
#define MAX_REP_TIMES         3

/* 主站类型 */
#define MASTER_OLD                0
#define MASTER_NEW                1

/* 旧主站阀门状态 */
#define OLD_VAVLE_CLOSE          0x08
#define OLD_VAVLE_ERROR          0xFF


#define TIME_DAT_REP              1 //定时上报数据
#define OTHER_REP                 0 //非定时上报数据包括定时阀控，欠费 补报 告警

/* 此处为左移位数 0x0000 为上报超时*/
#define REP_NO_GPRS_MODE     0    //无模块         0x0001
#define REP_REG_FAIL         1    //注网失败       0x0002
#define REP_CONNECT_FAIL     2    //TCP连接失败    0x0004
#define REP_LOGIN_FAIL       3    //登录失败       0x0008
#define REP_RESPOND_FAIL     4    //上报无应答     0x0010
#define GM_GATHERMETER_FAIL  5    //抄表失败       0x0020
#define BT_POWERLOW          6    //电池电压低     0x0040
#define RTC_TIMEERROR        7    //RTC时钟异常    0x0080
#define DATSEND_ERROR        8    //数据收发失败   0x0100
#define ATCMD_ERROR          9    //AT命令响应失败 0x0200
#define GSM_TIMEOUT          10    //GRPS网络超时  0x0400
#define GM_PIEZOMETER_FAIL  11    //GRPS网络超时  0x0800


/* 上报失败标志位 */
#define KEY_WUAKEUP_FLG         0x01
#define FIRST_REP_FAIL          0x02
#define SECOND_REP_FAIL         0x04
#define THIRD_REP_FAIL          0x08


#define REPORT_NORMAL           0x00  //正常上报
#define REPORT_FAIL_FLG         0x0E  //上报失败补报掩码
#define REPORT_FLG               0x0F  //上报标志位掩码

#define REPORT_RANDOM_MIN       50       /* 上报分钟为0- 50分之间 */

#define CONFIRM_MARK         0x00000100  /* 确认帧数据标识 */
#define DENY_MARK            0x00000200  /* 否认帧数据标识 */

#ifdef XINJIANG_PTR
	#define APN_LEN              1          /* APN长度 */
#else ifdef JASON130_PTR
	#define APN_LEN              16          /* APN长度 */
#endif


#define REPROT_TIMEOUT       120000      /* 超时 180s */
#define REPROT_DELAY         0        /* 超时 5s 5000 */
#define REPROT_DELAYTO       70000       /* 超时 90s */

#define REPDAT_TIMEOUT       15000       /* 上报超时15S */
#define REPORT_CNT_TO        3           /* 上报上限次数 */

#define MAX_REPORT_NUM       28          /* 缓存受限最大上报 28条记录 143字节 */
#define MAX_ALM_NUM          3           /* 3条告警日志 */

//以下为常量

//以下为主函数
#define FixTaskModule3	fixTaskGsm
#define FixTimerModule3	fixTimerGsm
#define InitializeModule3	InitializeGsm

extern TypeReport tyReport;			//上报设置
extern u8 g_nApnBuf[20];
extern ST_Time stTimeNow;
extern TM_Time stLastReportT;
extern TypeValveOpt stOptValve;

extern u32 g_dwRepTick;           //上报超时
extern u8  m_nRepEnableFlg;        //上报超时使能标识
extern u8 g_nDatRepCnt;           // 数据上报次数累加
extern vu8 ucLogonMode;		//登录状态
extern u8 tyGSMFlag;
extern u8  nLogonModeBk;
extern u8  m_nRepFailFlg;
extern u8 g_nApnType;
extern volatile TypeReportParameter tyReportParameter;		//时间结构体
extern uc8 m_nVerBuf[16];
extern u8 m_nImsiBuf[24];
extern u8 m_nImsiBufXJ[8];
extern vu8 ucStatusGsm;		//状态
extern ST_Time stTimeNow;
extern u32 g_dwCommDelay;
extern u8 aucAtPServer1[20];
extern u8 aucAtPPort1[8];
extern u16 g_wTmReportCnt;
extern u8 g_nSignal;
extern u8 g_OptValveRepFlg;
extern u32 g_dwTmAddress;


u8 GetReportFlag(void);
void fixTaskGsm(void);
void fixTimerGsm(void);
void InitializeGsm(void);

//以下为接口函数
void StartSendGprs(void);		//开始上报数据
u8 GetGprStatus(void);		//获得GPRS当前状态
u8 DecodeParameter(u8* pnRxBuf, u8 nRxLen);
u8 Protol130Handle(void);
s8 Protol130Send(u8 Size, u8 nComChannel);
u8 UC_SleepFunc(uint32_t dwWaitmS);
u16 GetTermReportTime(void);
void ReWriteRepFlg(void);
u8 GetReportFailFlag(void);
void SetReportIndex(u8 nDat);
s32 ClaReportTimeToSec(u8 nCycle);
u8 WatitDataSendOk(void);
void SetLogonMode(u8 nMode);
s8 M590_TcpSendDatLen(u8 nLen);
u8 M590_CloseConnect(void);
void FrameSendFunc(u8 Size, u8 nComChannel, u8* pnPoint);
u8 GetLedFlg(void);
u8 GetOnLineStatus(void);
u8 GetGprsConntStat(void);
void GetIsmiCcidDat(void);
u8 RepPizeometerMakeFrame(u8* pnOutBuf, u8* pnLen);

//以下为位变量

#endif
/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
