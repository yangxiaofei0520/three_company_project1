/******************** (C) COPYRIGHT 2016 jason ,LTD ***********************
* File Name         : XinJiangProtocol.h
* Author            : maronglang
* Date First Issued : 2016/05/26
* Description       : 新疆物联网表通讯协议
*******************************************************************************
*
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/


#ifndef  __XINJIANGPROTOCOL_H__
#define   __XINJIANGPROTOCOL_H__

#include "global.h"

#ifdef   XINJIANG_PTR                  //新疆物联网表协议

#define XJ_ONLINE_TO                 60


#define XJ_MSG_HEAD_START				0xA5
#define XJ_MSG_END_START				0x5A
#define XJ_MSG_END					0xAA

#define UP_UPLOAD_A            4               //A模式上线
#define UP_UPLOAD_B            3               //B模式上线
#define UP_FREE_XJ             5               //空闲
#define UP_LOGOUT_XJ           2               //下线

#define XJ_IPADDR_LEN          6
#define XJ_VISON_LEN           3
#define XJ_GPRSTYPE_LEN        7
#define XJ_GPRSTIME_LEN        5
#define XJ_METERTIME_LEN       7
#define XJ_METERFLOW_LEN       5
#define XJ_M_FREEZEDAY_LEN     1
#define XJ_FLOW_INTERVAL_LEN   1
#define XJ_IMSI_LEN             8
#define XJ_METEST_LEN           4
#define XJ_STAGEFLOW_LEN        5
#define XJ_BALANCE_LEN          5
#define XJ_FRAMETYPE_LEN        1
#define XJ_APN_LEN               1
#define XJ_ALM_CLR_LEN          4
#define XJ_WATERGAGE_LEN        2

#define XJ_FRAME_FIX_LEN        10

#define XJ_FRAME_OTHER_LEN      6


/* 上线间隔 */
#define XJ_INTERVAL_MON             0
#define XJ_INTERVAL_DAY             1
#define XJ_INTERVAL_HOUR            2
#define XJ_INTERVAL_MIN             3

/* 上线类型 */
#define XJ_ONLINE_A             0
#define XJ_ONLINE_B             1

/* APN */
#define XJ_CMNET_APN             0
#define XJ_UNINET_APN             1

/* 日月冻结 */
#define XJ_DAYFREEZE_NUM        31
#define XJ_MONFREEZE_NUM        18

/* 日月数据命令 */
#define XJ_DAYFREEZE_CMD        0x02
#define XJ_MONFREEZE_CMD        0x01
#define XJ_DETAILDAT_CMD        0x03


/* 是否有任务帧 */
#define XJ_STAYONLINE             0
#define XJ_OFFLINE                 1

/* 开关阀门 */
#define XJ_OPEN_VALVE            0x55
#define XJ_CLOSE_VALVE           0xAA

typedef struct
{
	u8 Head0;		    //包头0
	u8 Length0[2];		//长度
	u8 Head1;		    //包头1
} TypeProtolHead_XJ;		//新疆协议数据结构体,包头

typedef union
{
	struct
	{
		u8 CtrlB;		        //控制字
		u8 ACtrlB;
		u8 MeterType;			//表类型
		u8 Address[5];		    //表序号
		u8 FactoryCode[2];	    //厂商ID
		u8 Buf[180 - 10];		//真正数据
	} Packet;
	u8 Buffer[180];		//真正数据
} TypeProtol_XJ;		//新疆协议数据结构体

/*协议调度接口 */
extern void XJ_ProtolProc(void);
extern void XJ_TimeOutReUpLoad(void);
extern u8 XJ_DecodeParameter(u8* pnRxBuf, u8 nRxLen);
extern s8 XJ_ProtolSend(u8 Size, u8 nComChannel);
extern void XJ_InitializeGsm(void);

#endif /* XINJIANG_PTR */
#endif /* __XINJIANGPROTOCOL_H__ */
