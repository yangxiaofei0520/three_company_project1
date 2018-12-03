/******************** (C) COPYRIGHT 2015 jason ,LTD ***********************
* File Name         : ProtocolJason.h
* Author            : maronglang
* Date First Issued : 2015/08/10
* Description       : 支持捷先内部通讯抄表协议
*******************************************************************************
*
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef  __CJ188_H__
#define  __CJ188_H__
#include "global.h"

#define PTR_CJ_T188     1      // CJ_T188
#define PTR_FB_T188     2      // 非标188
#define PTR_645_97      3      // 645-97

#define GM_SUCC        2      // 抄表成功
#define GM_FAIL        0      // 抄表失败
#define GM_WR_ADDR     3      // 写地址
#define GM_ON_VALVE    4      // 关阀门
#define GM_OFF_VALVE   5      // 开阀门



#define GM_EXIT        -1     // 退出抄表

#define VALVE_OPEN      0x00
#define VALVE_CLOSE     0x01
#define VALVE_ERROR     0x03


#define COMM_HEAD				0x68
#define COMM_END				0x16
//命令码宏定义
#define CJ188_READ_ADDR 		0x03//0xAAAAAAAA 广播码 读地址命令 
#define CJ188_READ_VALUE		0x01//读表数命令  
#define CJ188_READ_PWORDV		0x09//读密码版本号命令
#define CJ188_WRITE_ADDR		0x15//写地址
#define CJ188_WRITE_VALUE		0x16//读密码版本号命令
#define CJ188_WRITE_COMMON		0x04//公用写命令
#define CJ188_WRITE_JSVALVE		0x2A//捷先188阀控命令

#define CJ188_WRITE_GUONENG		0x17//国能188阀控命令


#define CJ188_READ_VALUE_RE		0x81//读表数应答命令
#define CJ188_READ_ADDR_RE		0x83//读地址应答命令 
#define CJ188_WRITE_ADDR_RE		0x95//写地址应答命令 
#define CJ188_WRITE_JSVALVE_RE  0xAA//捷先188阀控应答命令



//标识宏定义
#define CJ188_READ_ADDR_ID		0x0A81//0xAAAAAAAA 广播码 读地址标识
#define CJ188_READ_ADDR_ID1		0x810A//0xAAAAAAAA 广播码 读地址标识
#define CJ188_READ_VALUE_ID		0x1F90//读表数标识
#define CJ188_READ_VALUE_ID1	0x901F//读表数标识
#define CJ188_READ_PWORDV_ID	0x0681//读密码版本号标识
#define CJ188_WRITE_ADDR_ID		0x18A0//写地址标识
#define CJ188_WRITE_ADDR_ID1	0xA018//写地址标识
#define CJ188_WRITE_PWORD_ID	0x14A0//写密码标识
#define CJ188_WRITE_TIME_ID		0x15A0//写时间标识
#define CJ188_WRITE_VALVE_ID	0x17A0//写阀门标识
#define CJ188_WRITE_VALVE_ID1	0xA017//写阀门标识
#define CJ188_WRITE_SPWORD_ID	0x20A0//写超级密码标识

//其他
#define LOND_COND				0xfe // 引导码
#define COM_188CODE				0xaa // 广播码 
#define PUBLIC_LENTH			10//公共长度

//捷先阀控
#define JX_VALVE_OPEN  			0x55   //开阀
#define JX_VALVE_CLOSE  		0x99   //关阀

/* 读数故障位 */
#define JX_FAULT_BIT  			0x04   //读数故障位


#define CommUF         comm.uFrame
#define CommF          CommUF.stFrame
#define MeterID        CommF.uMeterID
#define CommTx         CommF.uDataPart.cj188_tx
#define CommRx         CommF.uDataPart.cj188_rx 
#define CommRxDat      CommRx.stReadDatExt



typedef enum
{
	CJ188_HEAD = 0,
	CJ188_TYPE = 1,
	CJ188_ADDR = 2,
	CJ188_CMD  = 3,
	CJ188_LENTH= 4,
	CJ188_ID   = 5,
	CJ188_SER  = 6,
	CJ188_DATA = 7,
	CJ188_CS   = 8,
	CJ188_END  = 9
}Comm_CJ188_Enum;

typedef struct/*CJ188 结构体*/ //兼容扩展
{
	union
	{
		u8 buff[36]; //32 四字节对齐问题扩大4字节
		struct
		{
			u8 	meter_type;
			u8 	meter_addr[7]; //表地址
			u8 	meter_cmd;
			u8  meter_lenth;
			union
			{
				u16 meter_ID; 
				u8  meter_id[2];
			}uMeterID;
			u8  meter_ser; // 13byte是共用的 16
			union
			{
				union
				{
					u8 buff[10];
					u8 addr[7];
					u8 time[7];
					u8 valve_ctrl;//阀控
					struct	
					{// 长沙异常扩展数据结构
						u8  operate;
						u32 encrypt[3];//加密字节
					}stEncrypt;
					struct	
					{
						u8 password_ver;
						u8 password[8];
					}stPassword;
				}cj188_tx;
	
				union
				{
					u8 buff[20];
					struct	
					{
						u32 value;
						u8  status1;// 非扩展时是状态位1
						u8  status2;// 非扩展时是状态位2
					}stReadMeter;
					struct	
					{// 读数扩展数据结构
						u32 value;
						u8  unit0;
						u32 total_value;
						u8  unit1;
						u8  time[7];
						u16 status;
					}stReadDatExt;
					struct
					{// 长沙异常扩展数据结构
						u8  disturb_time;// 磁干扰次数
						u8  electricity; // 电量
						u16 valve_st;
					}stDisturb;
					u8 password_ver;//发送密码版本
					u16 valve_status;
				}cj188_rx;
			}uDataPart;
		}stFrame;
	}uFrame;

	u8 checksum;
	u8 cnt;
	u8 status;
	u8 flagok;
	u8 flag_error;
}Pro_Com_Str;

extern Pro_Com_Str comm;

/* CJ188抄表接口 */
extern s8 CJ188GatherMeter(u8 nPtrType, u8 *pnAddr, u8 nCmd, u8 *pnInBuf, 
					u8 nLen, u8 *pnOutBuf, u8 nOutLen, u8 *pnOutAdd, u32 dwTimeMs);

#endif /* __CJ188_H__ */
