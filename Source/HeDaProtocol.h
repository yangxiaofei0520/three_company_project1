#ifndef _HeDaProtocol_H_
#define _HeDaProtocol_H_

#ifdef HEDA_PTR

typedef struct
{
	u8 Head[2];		    //包头2
	u8 Addr[3];			//地址码
	u8 Version;		    //协议版本
} TypeProtolHead_HD;	//和达协议数据结构体,包头


extern u8 g_Device_Info[15]; 	//设备信息

typedef union
{
	struct
	{
		u8 Ctrl[3];		    	//控制码
		u16 Data_Len;			//数据长度
		u8 Cmd;					//命令码
		u8 Buf[170-6];			//数据域
	} Packet;
	u8 Buffer[170];		//真正数据
} TypeProtol_HD;		//和达协议数据结构体

typedef struct
{
	u8 flag_change;			//修改内容
	u32 ip_addr;			//ip地址
	u16 port;				//端口号
	char domain_name[32];	//域名   不满32字节时，结束符\0
	char apn_point[20];		//apn接入点  	不满32字节时，结束符\0
	u8 ignore;				//预留字段
}HD_CmdSetNetParam;

#define Packet_Head_0		0xA7	//包头0
#define Packet_Head_1		0xA7	//包头1
#define Packet_End_0		0x0D	//包尾0
#define Packet_End_1		0x0A	//包尾1

#define Maker_Addr			0x01	//厂商地址 0x01和达科技（出厂设定）	0x02宁水	0x03兴源   				0x04山科 0x05拓安信        0x06康明

#define Protocol_Version	0x14	//BCD码   0x14代表1.4版本

#define HD_FRAME_OTHER_LEN	9


typedef enum
{
	HeDa_Cmd_Normal_Upload				=0x01,//大用户远传大表常规数据上传（上行）
	HeDa_Cmd_Burst_Upload				=0x02,//突发事件数据上传（上行）
	HeDa_Cmd_HeartBeat_Upload			=0x03,//心跳包数据上传（上行）——预留
	HeDa_Cmd_Reply_Upload				=0x0F,/*大用户远传大表常规数据平台应答（下行）
												突发事件数据平台应答（下行）
												心跳包数据平台应答（下行）*/

	
	HeDa_Cmd_Set_Sampling_Interval		=0x81,//设置采样间隔（上行、下行）
	HeDa_Cmd_Set_Net_Param				=0x82,//设置网络参数（上行、下行）
	HeDa_Cmd_Set_Report_Cycle			=0x84,//设置上报周期（上行、下行）
	HeDa_Cmd_Set_Pressure_Threshold		=0x85,//设置压力上下限阈值（上行、下行）
	HeDa_Cmd_Set_Secret_Key				=0x86,//设置秘钥（上行、下行）——预留
	HeDa_Cmd_Set_Addr					=0x89,//-------设置表地址    	和达原协议没有，自己添加
	
	HeDa_Cmd_Get_Sampling_Interval		=0x91,//查询采样间隔（上行、下行）
	HeDa_Cmd_Get_Net_Param				=0x92,//查询网络参数（上行、下行）
	HeDa_Cmd_Get_Report_Cycle			=0x94,//查询上报周期（上行、下行）
	HeDa_Cmd_Get_Pressure_Threshold		=0x95,//查询压力上下限阈值（上行、下行）
	HeDa_Cmd_Get_Secret_Key				=0x96,//查询秘钥（上行、下行）——预留
	HeDa_Cmd_Get_Addr					=0x89,//-------查询表地址    	和达原协议没有，自己添加

	HeDa_Cmd_Get_All_Param				=0xA0,//获取所有参数（上行、下行）
	HeDa_Cmd_Get_Appoint_Data			=0xA1,//获取指定数据（上行、下行）
	
}HeDa_Cmd;//和达科技协议命令号

typedef enum
{
	HeDa_Burst_Event_None					=0,//无
	HeDa_Burst_Event_Bat_Low				=0x1,//电池低电量报警
	HeDa_Burst_Event_Pressure1_Limit_Up		=0x2,//压力1，上限报警
	HeDa_Burst_Event_Pressure2_Limit_Up		=0x4,//压力2，上限报警
	HeDa_Burst_Event_Pressure1_Limit_Down	=0x8,//压力1，下限报警
	HeDa_Burst_Event_Pressure2_Limit_Down	=0x10,//压力2，下限报警
	
}HeDa_Burst_Event;//突发事件类型

typedef enum
{
	HeDa_Report_Cycle_Min					=0x37,
	HeDa_Report_Cycle_Minute_1				=0x37,
	HeDa_Report_Cycle_Minute_5				=0x38,
	HeDa_Report_Cycle_Minute_10				=0x39,
	HeDa_Report_Cycle_Minute_15				=0x40,
	HeDa_Report_Cycle_Minute_30				=0x41,
	HeDa_Report_Cycle_Hour_1				=0x42,
	HeDa_Report_Cycle_Hour_2				=0x43,
	HeDa_Report_Cycle_Hour_4				=0x44,
	HeDa_Report_Cycle_Hour_6				=0x45,
	HeDa_Report_Cycle_Hour_12				=0x46,
	HeDa_Report_Cycle_Hour_24				=0x47,
	HeDa_Report_Cycle_Max					=0x47,
}HeDa_Report_Cycle;//和达上报周期类型



#define HeDa_Default_Heart_Beat_Interval 		(1*60) //心跳间隔 1min
#define HeDa_Heart_Beat_Interval_Max			(9*60) //最大心跳间隔


#define HeDa_Packet_Max_Len						(512)	//数据分包最大长度


#define  Flag_Data_Is_Secret		(1<<7)			//数据是否被加密
#define  Flag_Data_Is_Finish		(1<<6)			//数据是否传输完成

//当前连接状态
#define UP_Upload_HD		   4			   //上报
#define UP_Free_HD             5               //空闲

/* 上线类型 */
#define HD_ONLINE              1

/*上报间隔类型*/
#define HD_INTERVAL_DAY             0
#define HD_INTERVAL_HOUR            1
#define HD_INTERVAL_MIN             2


/*登陆模式*/
#define HD_Login_IP					1//ip地址
#define HD_Login_Domain_Name		2//域名



void HD_InitializeGsm(void);

s32 HD_ClaReportTimeToSec(void);
void LP_HD_CalReportConut(TM_Time* pStNextTime);

void HD_TimeOutReUpLoad(void);
void HD_ProtolProc(void);

void HD_OnlineCtl(void);
u8 HD_Online(u8 nLogonMode);
s8 HD_ProtolSend(u8 Size, u8 nComChannel,u8 device_info_flag);
u8 HD_DecodeParameter(u8* pnRxBuf, u8 nRxLen);
u8 HD_AddressComparePro(u8 *pnAddr, u8 nLen);
u8 HD_ProtolHandle(void);




/*
	协议解析
*/
void HeDa_Cmd_Reply_Upload_Handle(u8 *pData,u8 ctrl);

u8 HeDa_Cmd_Set_Sampling_Interval_Handle(u8 *pData);
u8 HeDa_Cmd_Get_Sampling_Interval_Handle(u8 *pData);

u8 HeDa_Cmd_Set_Net_Param_Handle(HD_CmdSetNetParam *pData);
u8 HeDa_Cmd_Get_Net_Param_Handle(u8 *pData);

u8 HeDa_TypeAddCycle_To_ReportCycleType(u8 Report_Time_Type,u8 cycle_num);
void HeDa_ReportCycleType_To_TypeAddCycle(u8 Report_Cycle_Type,u8 *Report_Time_Type,u8 *cycle_num);
u8 HeDa_Cmd_Set_Report_Cycle_Handle(u8 *pData);
u8 HeDa_Cmd_Get_Report_Cycle_Handle(u8 *pData);

u8 HeDa_Cmd_Set_Pressure_Threshold_Handle(u8 *pData);
u8 HeDa_Cmd_Get_Pressure_Threshold_Handle(u8 *pData);

u8 HeDa_Cmd_Set_Addr_Handle(u8 *pData);
u8 HeDa_Cmd_Get_Addr_Handle(u8 *pData);

/*该函数未实现*/
u8 HeDa_Cmd_Set_Secret_Key_Handle(u8 *pData);
u8 HeDa_Cmd_Get_Secret_Key_Handle(u8 *pData);
u8 HeDa_Cmd_Get_All_Param_Handle(u8 *pData);
u8 HeDa_Cmd_Get_Appoint_Data_Handle(u8 *pData);

#endif


#endif

