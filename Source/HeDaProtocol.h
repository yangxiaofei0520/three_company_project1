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
		u8 CtrlB[3];		    //控制码
		u8 Data_Len;			//数据长度
		u8 Cmd;					//命令码
		u8 Buf[180-5];			//数据域
	} Packet;
	u8 Buffer[180];		//真正数据
} TypeProtol_HD;		//和达协议数据结构体



#define Packet_Head_0		0xA7	//包头0
#define Packet_Head_1		0xA7	//包头1
#define Packet_End_0		0x0D	//包尾0
#define Packet_End_1		0x0A	//包尾1

#define Maker_Addr			0x01	//厂商地址 0x01和达科技（出厂设定）	0x02宁水	0x03兴源   				0x04山科 0x05拓安信        0x06康明

#define Protocol_Version	0x14	//BCD码   0x14代表1.4版本


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

	HeDa_Cmd_Get_Sampling_Interval		=0x91,//查询采样间隔（上行、下行）
	HeDa_Cmd_Get_Net_Param				=0x92,//查询网络参数（上行、下行）
	HeDa_Cmd_Get_Report_Cycle			=0x94,//查询上报周期（上行、下行）
	HeDa_Cmd_Get_Pressure_Threshold		=0x95,//查询压力上下限阈值（上行、下行）
	HeDa_Cmd_Get_Secret_Key				=0x96,//查询秘钥（上行、下行）——预留

	HeDa_Cmd_Get_All_Param				=0xA0,//获取所有参数（上行、下行）
	HeDa_Cmd_Get_Appoint_Data			=0xA1,//获取指定数据（上行、下行）
	
}HeDa_Cmd;//和达科技协议命令号



#define HeDa_Default_Heart_Beat_Interval 		(1*60) //心跳间隔 1min
#define HeDa_Heart_Beat_Interval_Max			(9*60) //最大心跳间隔


#define HeDa_Packet_Max_Len						(512)	//数据分包最大长度


//当前连接状态
#define UP_Upload_HD		   4			   //上报
#define UP_Free_HD             5               //空闲

/* 上线类型 */
#define HD_ONLINE              1

#endif


#endif

