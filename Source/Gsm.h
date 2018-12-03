/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : main.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : 主函数主流程
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/


/*
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

1  普通指令
1.1  获取产品序列号:+CGSN
1.2  获取国际移动用户识别码:+CIMI
1.3  获取 SIM 卡标识:+CCID
1.4  获取产品版本号:+GETVERS
1.5  重复执行上一条指令:A/
1.6  查询模块型号:+CGMM
1.7  查询模块信息:I
1.8  回显设置:E
1.9  显示当前配置:&V
1.10  存储当前配置:&W
2  移动设备控制和状态报告
2.1  模块状态查询:+CPAS
2.2  网络注册状态查询:+CREG
2.3  关机指令:+CPWROFF
2.4  设置模块功能:+CFUN
2.5  低功耗设置:+ENPWRSAVE
2.6  时钟:+CCLK
2.7  设置模块波特率:+IPR
2.8  输入 PIN 码:+CPIN
2.9  PIN 使能与查询功能指令:+CLCK
2.10  PIN 修改密码指令:+CPWD
2.11  奇偶校验:+ICF
2.12  复用模式:+CMUX
2.13  扩展错误报告:+CEER
2.14  设置错误提示信息:+CMEE
3  网络服务指令
3.1  信号强度:+CSQ
3.2  网络选择:+COPS
3.3  设置频段:+XBANDSEL
4  短消息服务指令
4.1  选择短信服务:+CSMS
4.2  首选短信存储器:+CPMS
4.3  设置短消息模式:+CMGF
4.4  设置 TE 字符集:+CSCS
4.5  设置短信指示格式:+CNMI
4.6  读短消息:+CMGR
4.7  短信列表:+CMGL
4.8  发送短消息:+CMGS
4.9  写短消息:+CMGW
4.10  发送已保存的短消息:+CMSS
4.11  删除短消息:+CMGD
4.12  短信中心号码:+CSCA
4.13  设置文本模式参数:+CSMP
4.14  显示文本模式参数:+CSDH
4.15  选择 CELL 广播消息类型:+CSCB
5  电话本指令
5.1  选择电话本存储器:  +CPBS
5.2  读电话本:+CPBR
5.3  查找电话本:+CPBF
5.4  写电话本:+CPBW
5.5  获取本机号码:+CNUM
6  GPRS 指令
6.1  设置 PDP 格式:+CGDCONT
6.2  设置 GPRS 附着和分离:+CGATT
6.3  GPRS 拨号:ATD*99#
6.4  发送 USSD 数据:+CUSD
6.5  数据/命令模式切换设置:&D2
6.6  数据模式切换到命令模式:+++
6.7  命令模式切换到数据模式:O
6.8  用户认证:+XGAUTH
7  TCP/IP AT 指令
7.1  选择内/外部协议栈:+XISP
7.2  建立 PPP 连接:+XIIC
7.3  建立 TCP 连接:AT+TCPSETUP=0,121.150.209.245,30020	AT+TCPSETUP=0,121.15.209.245,33003
7.4  发送 TCP 数据:AT+TCPSEND=0,12
7.5  接收到 TCP 数据:+TCPRECV
7.6  关闭 TCP 连接:AT+TCPCLOSE=1
7.7  建立 UDP 连接:+UDPSETUP
7.8  发送 UDP 数据:+UDPSEND
7.9  接收到 UDP 数据:+UDPRECV
7.10  关闭 UDP 连接:+UDPCLOSE
7.11  查询 TCP/UDP 链路状态:+IPSTATUS
7.12  TCP/IP  AT 指令注意事项
8  DNS（域名解析）指令
8.1  查询 IP 地址
8.2  查询/设置 DNS 服务器
9  FTP AT 指令
9.1  登录 FTP 服务器:+FTPLOGIN
9.2  从 FTP 服务器注销:+FTPLOGOUT
9.3  从 FTP 服务器下载数据:+FTPGET
9.4  向 FTP 服务器上传数据:+FTPPUT
9.5  FTP 状态查询:+FTPSTATUS
10  TCP 服务器 AT 指令
10.1  设置服务器 TCP 侦听:+TCPLISTEN
10.2  关闭侦听链接:+CLOSELISTEN
10.3  关闭主站链接:+CLOSECLIENT
10.4  接收到主站的数据:+TCPRECV(S)
10.5  发送给主站的数据:+TCPSENDS
10.6  查询主站链路的状态:+CLIENTSTATUS
10.7  设置模块信号灯的状态:+SIGNAL
10.8  设置外部协议栈信号灯的状态:+GPRSSTATUS
11  扩展 AT 指令
11.1  查询当前 LAC 和 CELL_ID:$MYLACID
11.2  查询当前信道、接收发射功率:$MYCGED
11.3  网络同步时间:$MYTIMEUPDATE
12  附录
12.1  内部协议栈 TCP 连接的 AT 指令流程图
12.2  外部协议栈 TCP 连接的 AT 指令流程图
12.3  “短信满提示”的 AT 指令设置和查询流程图
12.4  短信常用的 AT 指令
12.4.1  发送文本模式短信的流程
12.4.2  发送 PDU 模式短信的流程
12.5  低功耗模式的设置
12.6  串口参数设置
*/

#include "global.h"
#include "string.h"

#define MODE_GETSIGNAL_CNT      6
#define GETSIGNAL_TO             4000

#define SIM_REG_SUCCESS          1
#define SIM_REG_FAILURE          2


#define XIAMEN_QIJUN_GPRS
//#define YOUFANG_GPRS

#define MAX_METER		1			//第0个表没有用到
#define MSG_START				0x68
#define MSG_END					0x16
#define MSG_AFN_SHUTMETER		0x85
#define MSG_AFN_READALLMETER	0x8C

#define VALVE_OPEN_188			0x55
#define VALVE_CLOSE_188			0x99

//以下为宏定义
//#define UART_TEST		//串口调试
#define UP_LOGIN            0
#define UP_HEARTBEAT        1
#define UP_LOGOUT           2
#define UP_UPLOAD           3
#define UP_UPLOAD_BAT_VAL   4
#ifdef PIEZOMETER
#define UP_UPLOAD_PRESSURE  5
#define UP_FREE             6
#else
#define UP_FREE             5
#endif

#define RE_LOGIN_TO         15000 //约15秒  1-32ms
#define RE_HEART_TO         60000 //约15秒  1-32ms

//以下为常量
#define TIME_4_STEP	2		//0.328秒定时器@164mS,328/32.8=10
#define TIME_4_CLOSE	3		//0.5秒定时器@164mS,500/164=3
#define TIME_4_DEALY	6		//1秒定时器@164mS,1000/164=6.1
#define TIME_4_HEARTBEAT	304	//50秒定时器@164mS,50000/164=304.88

#define NUMBER_ERROR	6		//错误次数

#define STEP_GPRS	20		//登录服务器
#define STEP_SEND	(STEP_GPRS + 2)		//GPRS实际开始发送数据步骤
#define STEP_WAIT	50		//发送数据等待
#define STEP_EXIT	150		//下线,然后关机

//GSM状态
#define NUMBER_AT	52		//AT接收命令缓冲 72

//服务器
#define NUMBER_AT_R	13			//AT回复命令数量,aucAtRCmd,数组数量

typedef struct
{
	u8 Head0;		//包头0
	u8 Length0[2];		//长度0
	u8 Length1[2];		//长度0
	u8 Head1;		//包头1
} TypeProtol130Head;		//130数据结构体,包头

typedef struct
{
	u8 Link;		//链路编号,只能为 0,1,2,3
	u8 IPort[21];	//IP地址+端口号,ASCII码,123.234.123.123,30020
} TypeGprs;		//Gprs通信结构体

typedef union
{
	struct
	{
		u8 Control;		//控制字
		u8 Address[4];		//地址域
		u8 Broadcast;			//广播标志
		u8 Afn;			//应用层功能码
		u8 Seq;			//帧序列域
		u8 Data[4];		//数据单元标识
		u8 Buf[128 - 12];		//真正数据
	} Packet;
	u8 Buffer[128];		//真正数据
} TypeProtol130;		//130数据结构体

//AT参数
uc8 aucAtPAscii_Question[] = {"?"};
uc8 aucAtPAscii_1[] = {"1"};
uc8 aucAtPAscii_0[] = {"0"};
uc8 aucAtPAscii_Equal1[] = {"=1"};
uc8 aucAtPAscii_Equal0[] = {"=0"};
uc8 aucAtPBaudrate[] = {"57600"};	//时间服务器1
uc8 aucAtPTimeServer1[] = {"=\"time.nist.gov\""};	//时间服务器1
uc8 aucAtPTimeServer2[] = {"=\"time.windows.com\""};	//时间服务器2
uc8 aucAtPPort2[] = {"\"33003\""};			//Jason服务器端口号2,测试用 33003


//AT回码
uc8 aucAtrInit[] = {"+PBREADY"};		//初始化反馈
uc8 aucAtrPppFail[] = {"SOCKETS: IPR STOPPED"};		//模块的 IP 地址被释放
uc8 aucAtrCclk[] = {"+CCLK: \""};			//查询模块的实时时钟,+CCLK: "04/01/01,00:01:56"
uc8 aucAtrCpinReady[] = {"+CPIN: READY"};		//SIM卡状态
uc8 aucAtrCreg[] = {"+CREG:"};			//查询模块的当前网络注册状态
uc8 aucAtrNeoway[] = {"NEOWAY"};		//ATI回复
uc8 aucAtrOk[] = {"OK"};				//ok
uc8 aucAtrXiic[] = {"+XIIC:"};			//建立 PPP 连接,+XIIC:    1, 10.28.176.133
uc8 aucAtrTcpsetup[] = {"+TCPSETUP:"};		//tcpsetup,ok
uc8 aucAtrTcpsend[] = {">"};				//可以发送数据
uc8 aucAtrTcprecv[] = {"+TCPRECV:"};		//接收到 TCP 数据


uc8 aucAtrTcpclose[] = {"+TCPCLOSE:"};		//关闭 TCP 连接
uc8 aucAtrIpr[] = {"+IPR=38400"};		//设置模块波特率,38400
uc8 aucAtrError[] = {"ERROR"};

//AT指令
#define AT_HEAD_0	'A'			//AT指令包头0
#define AT_HEAD_1	'T'			//AT指令包头1
#define AT_TAIL_0	0x0d		//AT指令包尾0
#define AT_TAIL_1	0x0a		//AT指令包尾1

uc8 aucAtInit[] = {"+PBREADY"};			//上电后模块返回表示初始化OK
uc8 aucAtNull[] = {""};		//空指针
uc8 aucATS_A[] = {"A/"};		//重复执行上一条指令
uc8 aucATS_E[] = {"E"};		//回显设置
uc8 aucATS_V[] = {"&V"};		//显示当前配置
uc8 aucATS_W[] = {"&W"};		//存储当前配置
uc8 aucAtS_D2[] = {"&D2"};			//数据/命令模式切换设置
uc8 aucAtS_Plus[] = {"+++"};			//数据模式切换到命令模式
uc8 aucAtS_O[] = {"O"};			//命令模式切换到数据模式
uc8 aucAtS_D[] = {"D*99#"};			//GPRS 拨号
uc8 aucAtI[] = {"I"};				//标准指令，也是通用指令！获取厂家信息、模块软件信息
uc8 aucAtCcid[] = {"+CCID"};			//获取 SIM 卡的 ICCID
uc8 aucAtCgmi[] = {"+CGMI"};			//生产厂家
uc8 aucAtCgmm[] = {"+CGMM"};		//设备类型
uc8 aucAtCgsn[] = {"+CGSN"};			//获取模块的产品序列号,IMEI
uc8 aucAtCimi[] = {"+CIMI"};			//获取国际移动用户识别码,IMSI(International Mobile Subscriber Identification)
uc8 aucAtGetvers[] = {"+GETVERS"};			//获取产品当前的软件版本号
uc8 aucAtCclk[] = {"+CCLK?"};			//设置,查询模块的实时时钟
uc8 aucAtCeer[] = {"+CEER"};			//扩展错误报告
uc8 aucAtCfun[] = {"+CFUN"};			//设置模块功能
uc8 aucAtCipstatus[] = {"+CIPSTATUS"};		//GPRS状态
uc8 aucAtClck[] = {"+CLCK"};			//锁、解锁以及查询 MT 和网络设备
uc8 aucAtCmee[] = {"+CMEE"};			//设置错误提示信息
uc8 aucAtCmux[] = {"+CMUX"};			//该命令使能 GSM07.10 定义的复用协议控制通道
uc8 aucAtCpas[] = {"+CPAS"};			//查询模块的当前工作状态
uc8 aucAtCpin[] = {"+CPIN?"};			//查询 PIN 状态,输入 PIN 码
uc8 aucAtCpwd[] = {"+CPWD"};			//修改模块锁功能的密码

#ifdef XIAMEN_QIJUN_GPRS
uc8 aucAtCpwroff[] = {"+CPOF"};			//关机指令
#else
uc8 aucAtCpwroff[] = {"+CPWROFF"};			//关机指令
#endif
uc8 aucAtCreg[] = {"+CREG?"};			//查询模块的当前网络注册状态
uc8 aucAtEnpwrsavE[] = {"+ENPWRSAVE"};		//设置是否允许模块进入低功耗模式
uc8 aucAtIcf[] = {"+ICF"};			//设置模块的奇偶校验
uc8 aucAtIpr[] = {"+IPR=19200"};			//设置模块波特率,19200
uc8 aucAtCops[] = {"+COPS?"};		//判断运营商,联通,移动
uc8 aucAtCsq[] = {"+CSQ"};			//信号强度
uc8 aucAtXbandsel[] = {"+XBANDSEL"};			//设置频段
uc8 aucAtCmgd[] = {"+CMGD"};			//删除短消息
uc8 aucAtCmgf[] = {"+CMGF"};			//设置短消息模式
uc8 aucAtCmgl[] = {"+CMGL"};			//短信列表
uc8 aucAtCmgr[] = {"+CMGR"};			//读短消息
uc8 aucAtCmgs[] = {"+CMGS"};			//发送短消息
uc8 aucAtCmgw[] = {"+CMGW"};			//写短消息
uc8 aucAtCmss[] = {"+CMSS"};			//发送已保存的短消息
uc8 aucAtCnmi[] = {"+CNMI"};			//设置短信指示格式
uc8 aucAtCpms[] = {"+CPMS"};			//首选短信存储器
uc8 aucAtCsca[] = {"+CSCA"};			//短信中心号码
uc8 aucAtCscb[] = {"+CSCB"};			//选择 CELL 广播消息类型
uc8 aucAtCscs[] = {"+CSCS"};			//设置 TE 字符集
uc8 aucAtCsdh[] = {"+CSDH"};			//显示文本模式参数
uc8 aucAtCsmp[] = {"+CSMP"};			//设置文本模式参数
uc8 aucAtCsms[] = {"+CSMS"};			//选择短信服务
uc8 aucAtCnum[] = {"+CNUM"};			//获取本机号码
uc8 aucAtCpbf[] = {"+CPBF"};			//查找电话本
uc8 aucAtCpbr[] = {"+CPBR"};			//读电话本
uc8 aucAtCpbs[] = {"+CPBS"};			//选择电话本存储器
uc8 aucAtCpbw[] = {"+CPBW"};			//写电话本
//GPRS 指令
uc8 aucAtPdpCm[] = {"+CGDCONT=1,\"IP\",\"CMNET\""};			//设置 PDP 格式,移动
uc8 aucAtPdpUn[] = {"+CGDCONT=1,\"IP\",\"UNINET\""};			//设置 PDP 格式.联通
uc8 aucAtCgatt[] = {"+CGATT="};			//设置 GPRS 附着和分离
uc8 aucAtCusd[] = {"+CUSD"};			//发送 USSD 数据
//TCP/IP AT 指令
uc8 aucAtIpstatus[] = {"+IPSTATUS"};			//查询 TCP/UDP 链路状态

#ifdef XIAMEN_QIJUN_GPRS
uc8 aucAtTcprecv[] = {"+TCPRECV"};			//接收到 TCP 数据
uc8 aucAtTcpsend[] = {"+CIPSEND="};			//发送 TCP 数据
uc8 aucAtTcpsetup[] = {"+cipstart=\"TCP\","};			//建立 TCP 连接
uc8 aucAtXgauth[] = {"+CSTT="};			//用户认证 apn usr pwd
uc8 aucAtTcpclose[] = {"+CIPCLOSE"};			//关闭 TCP 连接
#else
uc8 aucAtTcpclose[] = {"+TCPCLOSE="};			//关闭 TCP 连接
uc8 aucAtXgauth[] = {"+XGAUTH=1,1,\"GSM\",\"1234\""};			//用户认证
uc8 aucAtTcprecv[] = {"+TCPRECV"};			//接收到 TCP 数据
uc8 aucAtTcpsend[] = {"+TCPSEND="};			//发送 TCP 数据
uc8 aucAtTcpsetup[] = {"+TCPSETUP="};			//建立 TCP 连接
#endif

uc8 aucAtUdpclose[] = {"+UDPCLOSE"};			//关闭 UDP 连接
uc8 aucAtUdprecv[] = {"+UDPRECV"};			//接收到 UDP 数据
uc8 aucAtUdpsend[] = {"+UDPSEND"};			//发送 UDP 数据
uc8 aucAtUdpsetup[] = {"+UDPSETUP"};			//建立 UDP 连接
#ifdef XIAMEN_QIJUN_GPRS
uc8 aucAtXiic[] = {"+CIFSR"};			//获取本地IP
uc8 aucAtXisp[] = {"+CIICR"};			//激活移动场景，开启 GPRS 或 CSD 无线连接
#else
uc8 aucAtXiic[] = {"+XIIC"};			//建立 PPP 连接
uc8 aucAtXisp[] = {"+XISP="};			//选择内/外部协议栈
#endif
//DNS（域名解析）指令
uc8 aucAtDns[] = {"+DNS"};			//查询 IP 地址
uc8 aucAtDnsserver[] = {"+DNSSERVER"};			// 查询/设置 DNS 服务器
//FTP指令
uc8 aucAtFtpget[] = {"+FTPGET"};			//从 FTP 服务器下载数据
uc8 aucAtFtplogin[] = {"+FTPLOGIN"};			//登录 FTP 服务器
uc8 aucAtFtplogout[] = {"+FTPLOGOUT"};			//从 FTP 服务器注销
uc8 aucAtFtpput[] = {"+FTPPUT"};			//向 FTP 服务器上传数据
uc8 aucAtFtpstatus[] = {"+FTPSTATUS"};			//FTP 状态查询
//TCP 服务器指令
uc8 aucAtClientstatus[] = {"+CLIENTSTATUS"};			//查询主站链路的状态
uc8 aucAtCloseclient[] = {"+CLOSECLIENT"};			//关闭主站链接
uc8 aucAtCloselisten[] = {"+CLOSELISTEN"};			//关闭侦听链接
uc8 aucAtGprsstatus[] = {"+GPRSSTATUS"};			//设置外部协议栈信号灯的状态
uc8 aucAtSignal[] = {"+SIGNAL"};			//设置模块信号灯的状态
uc8 aucAtTcplisten[] = {"+TCPLISTEN"};			//设置服务器 TCP 侦听
uc8 aucAtTcprecv_S[] = {"+TCPRECV(S)"};			//接收到主站的数据
uc8 aucAtTcpsends[] = {"+TCPSENDS"};			//发送给主站的数据
//扩展 AT 指令
uc8 aucAtMycged[] = {"$MYCGED"};			//查询当前信道、接收发射功率
uc8 aucAtMylacid[] = {"$MYLACID"};			//查询当前 LAC 和 CELL_ID
uc8 aucAtMytimeupdate[] = {"$MYTIMEUPDATE"};			//网络同步时间
uc8 aucAtShutDown[] = {"CIPSHUT"};			//网络同步时间

//以下为数据表
uc8 *const aucAtCmd[] = {	//AT命令,双CONST修饰,数组放在FLASH中
	aucAtNull,		//aucATS_A,		//重复执行上一条指令
	aucATS_E,		//aucATS_E,		//回显设置
	aucAtNull,		//aucATS_V,		//显示当前配置
	aucAtNull,		//aucATS_W,		//存储当前配置
	aucAtNull,		//aucAtS_D2,			//&D2
	aucAtNull,		//aucAtS_Plus,			//数据模式切换到命令模式
	aucAtNull,		//aucAtS_O,			//命令模式切换到数据模式
	aucAtS_D,			//GPRS 拨号
	aucAtI,				//标准指令，也是通用指令！获取厂家信息、模块软件信息
	aucAtCcid,			//获取 SIM 卡的 ICCID
	aucAtCgmi,			//生产厂家
	aucAtCgmm,		//设备类型
	aucAtCgsn,			//获取模块的产品序列号,IMEI
	aucAtCimi,			//获取国际移动用户识别码,IMSI(International Mobile Subscriber Identification)
	aucAtGetvers,			//获取产品当前的软件版本号
	aucAtCclk,			//设置,查询模块的实时时钟
	aucAtNull,		//aucAtCeer,			//扩展错误报告
	aucAtNull,		//aucAtCfun,			//设置模块功能
	aucAtNull,		//aucAtCipstatus,		//GPRS状态
	aucAtNull,		//aucAtClck,			//锁、解锁以及查询 MT 和网络设备
	aucAtNull,		//aucAtCmee,			//设置错误提示信息
	aucAtNull,		//aucAtCmux,			//该命令使能 GSM07.10 定义的复用协议控制通道
	aucAtNull,		//aucAtCpas,			//查询模块的当前工作状态
	aucAtCpin,			//查询 PIN 状态,输入 PIN 码
	aucAtCpwd,			//修改模块锁功能的密码
	aucAtCpwroff,			//关机指令
	aucAtCreg,			//查询模块的当前网络注册状态
	aucAtNull,		//aucAtEnpwrsavE,		//设置是否允许模块进入低功耗模式
	aucAtNull,		//aucAtIcf,			//设置模块的奇偶校验
	aucAtIpr,			//设置模块波特率
	aucAtCops,		//网络状态
	aucAtCsq,			//信号强度
	aucAtNull,		//aucAtXbandsel,			//设置频段
	aucAtCmgd,			//删除短消息
	aucAtNull,		//aucAtCmgf,			//设置短消息模式
	aucAtNull,		//aucAtCmgl,			//短信列表
	aucAtNull,		//aucAtCmgr,			//读短消息
	aucAtNull,		//aucAtCmgs,			//发送短消息
	aucAtNull,		//aucAtCmgw,			//写短消息
	aucAtNull,		//aucAtCmss,			//发送已保存的短消息
	aucAtNull,		//aucAtCnmi,			//设置短信指示格式
	aucAtNull,		//aucAtCpms,			//首选短信存储器
	aucAtCsca,			//短信中心号码
	aucAtCscb,			//选择 CELL 广播消息类型
	aucAtNull,		//aucAtCscs,			//设置 TE 字符集
	aucAtNull,		//aucAtCsdh,			//显示文本模式参数
	aucAtNull,		//aucAtCsmp,			//设置文本模式参数
	aucAtNull,		//aucAtCsms,			//选择短信服务
	aucAtNull,		//aucAtCnum,			//获取本机号码
	aucAtNull,		//aucAtCpbf,			//查找电话本
	aucAtNull,		//aucAtCpbr,			//读电话本
	aucAtNull,		//aucAtCpbs,			//选择电话本存储器
	aucAtNull,		//aucAtCpbw,			//写电话本
	aucAtPdpCm,			//设置 PDP 格式,移动
	aucAtPdpUn,			//设置 PDP 格式.联通
	aucAtCgatt,			//设置 GPRS 附着和分离
	aucAtCusd,			//发送 USSD 数据
	aucAtXgauth,			//用户认证
	aucAtIpstatus,			//查询 TCP/UDP 链路状态
	aucAtTcpclose,			//关闭 TCP 连接
	aucAtNull,		//aucAtTcprecv,			//接收到 TCP 数据
	aucAtTcpsend,			//发送 TCP 数据
	aucAtTcpsetup,			//建立 TCP 连接
	aucAtNull,		//aucAtUdpclose,			//关闭 UDP 连接
	aucAtNull,		//aucAtUdprecv,			//接收到 UDP 数据
	aucAtNull,		//aucAtUdpsend,			//发送 UDP 数据
	aucAtNull,		//aucAtUdpsetup,			//建立 UDP 连接
	aucAtXiic,			//建立 PPP 连接
	aucAtXisp,			//选择内/外部协议栈
	aucAtDns,			//查询 IP 地址
	aucAtNull,		//aucAtDnsserver,			// 查询/设置 DNS 服务器
	aucAtNull,		//aucAtFtpget,			//从 FTP 服务器下载数据
	aucAtNull,		//aucAtFtplogin,			//登录 FTP 服务器
	aucAtNull,		//aucAtFtplogout,			//从 FTP 服务器注销
	aucAtNull,		//aucAtFtpput,			//向 FTP 服务器上传数据
	aucAtNull,		//aucAtFtpstatus,			//FTP 状态查询
	aucAtClientstatus,			//查询主站链路的状态
	aucAtCloseclient,			//关闭主站链接
	aucAtCloselisten,			//关闭侦听链接
	aucAtGprsstatus,			//设置外部协议栈信号灯的状态
	aucAtSignal,			//设置模块信号灯的状态
	aucAtNull,		//aucAtTcplisten,			//设置服务器 TCP 侦听
	aucAtNull,		//aucAtTcprecv_S,			//接收到主站的数据
	aucAtNull,		//aucAtTcpsends,			//发送给主站的数据
	aucAtNull,		//aucAtMycged,			//查询当前信道、接收发射功率
	aucAtNull,		//aucAtMylacid,			//查询当前 LAC 和 CELL_ID
	aucAtMytimeupdate,			//网络同步时间
	aucAtShutDown,			    //关闭激活的PDP场景
};

uc8 *const aucAtRCmd[] = {	//AT接收命令,双CONST修饰,数组放在FLASH中
	aucAtrInit,				//0,这3个命令返回不是命令值
	aucAtrPppFail,			//1,返回位变量
	aucAtrOk,				//2,这3个命令返回不是命令值
	aucAtrCpinReady,		//3
	aucAtrCreg,				//4,网络注册状态查询
	aucAtrXiic,				//5,建立 PPP 连接
	aucAtrCclk,				//6,查询模块的实时时钟
	aucAtrNeoway,			//7,ATI回复
	aucAtrTcpsetup,			//8,建立 TCP 连接
	aucAtrTcpsend,			//9,可以发送数据
	aucAtrTcprecv,			//10,接收到 TCP 数据
	aucAtrTcpclose,			//11,关闭 TCP 连接
	aucAtrIpr,				//12,设置模块波特率,38400
	aucAtrError,			//13,错误
};

#define AT_CMD_S_A		0	//重复执行上一条指令
#define AT_CMD_S_E		1	//回显设置
#define AT_CMD_S_V		2	//显示当前配置
#define AT_CMD_S_W		3	//存储当前配置
#define AT_CMD_S_D2		4		//&D2
#define AT_CMD_S_PLUS		5		//数据模式切换到命令模式
#define AT_CMD_S_O		6		//命令模式切换到数据模式
#define AT_CMD_S_D		7		//GPRS 拨号
#define AT_CMD_I		8			//标准指令，也是通用指令！获取厂家信息、模块软件信息
#define AT_CMD_CCID		9		//获取 SIM 卡的 ICCID
#define AT_CMD_CGMI		10		//生产厂家
#define AT_CMD_CGMM		11	//设备类型
#define AT_CMD_CGSN		12		//获取模块的产品序列号,IMEI
#define AT_CMD_CIMI		13		//获取国际移动用户识别码,IMSI(International Mobile Subscriber Identification)
#define AT_CMD_GETVERS		14		//获取产品当前的软件版本号
#define AT_CMD_CCLK		15		//设置,查询模块的实时时钟
#define AT_CMD_CEER		16		//扩展错误报告
#define AT_CMD_CFUN		17		//设置模块功能
#define AT_CMD_CIPSTATUS		18	//GPRS状态
#define AT_CMD_CLCK		19		//锁、解锁以及查询 MT 和网络设备
#define AT_CMD_CMEE		20		//设置错误提示信息
#define AT_CMD_CMUX		21		//该命令使能 GSM07.10 定义的复用协议控制通道
#define AT_CMD_CPAS		22		//查询模块的当前工作状态
#define AT_CMD_CPIN		23		//查询 PIN 状态,输入 PIN 码
#define AT_CMD_CPWD		24		//修改模块锁功能的密码
#define AT_CMD_CPWROFF		25		//关机指令
#define AT_CMD_CREG		26		//查询模块的当前网络注册状态
#define AT_CMD_ENPWRSAVE		27	//设置是否允许模块进入低功耗模式
#define AT_CMD_ICF		28		//设置模块的奇偶校验
#define AT_CMD_IPR		29		//设置模块波特率
#define AT_CMD_COPS		30	//网络状态
#define AT_CMD_CSQ		31		//信号强度
#define AT_CMD_XBANDSEL		32		//设置频段
#define AT_CMD_CMGD		33		//删除短消息
#define AT_CMD_CMGF		34		//设置短消息模式
#define AT_CMD_CMGL		35		//短信列表
#define AT_CMD_CMGR		36		//读短消息
#define AT_CMD_CMGS		37		//发送短消息
#define AT_CMD_CMGW		38		//写短消息
#define AT_CMD_CMSS		39		//发送已保存的短消息
#define AT_CMD_CNMI		40		//设置短信指示格式
#define AT_CMD_CPMS		41		//首选短信存储器
#define AT_CMD_CSCA		42		//短信中心号码
#define AT_CMD_CSCB		43		//选择 CELL 广播消息类型
#define AT_CMD_CSCS		44		//设置 TE 字符集
#define AT_CMD_CSDH		45		//显示文本模式参数
#define AT_CMD_CSMP		46		//设置文本模式参数
#define AT_CMD_CSMS		47		//选择短信服务
#define AT_CMD_CNUM		48		//获取本机号码
#define AT_CMD_CPBF		49		//查找电话本
#define AT_CMD_CPBR		50		//读电话本
#define AT_CMD_CPBS		51		//选择电话本存储器
#define AT_CMD_CPBW		52		//写电话本
#define AT_CMD_PDPCM		53		//设置 PDP 格式,移动
#define AT_CMD_PDPUN		54		//设置 PDP 格式.联通
#define AT_CMD_CGATT		55		//设置 GPRS 附着和分离
#define AT_CMD_CUSD		56		//发送 USSD 数据
#define AT_CMD_XGAUTH		57		//用户认证
#define AT_CMD_IPSTATUS		58		//查询 TCP/UDP 链路状态
#define AT_CMD_TCPCLOSE		59		//关闭 TCP 连接
#define AT_CMD_TCPRECV		60		//接收到 TCP 数据
#define AT_CMD_TCPSEND		61		//发送 TCP 数据
#define AT_CMD_TCPSETUP		62		//建立 TCP 连接
#define AT_CMD_UDPCLOSE		63		//关闭 UDP 连接
#define AT_CMD_UDPRECV		64		//接收到 UDP 数据
#define AT_CMD_UDPSEND		65		//发送 UDP 数据
#define AT_CMD_UDPSETUP		66		//建立 UDP 连接
#define AT_CMD_XIIC		67		//建立 PPP 连接
#define AT_CMD_XISP		68		//选择内/外部协议栈
#define AT_CMD_DNS		69		//查询 IP 地址
#define AT_CMD_DNSSERVER		70		// 查询/设置 DNS 服务器
#define AT_CMD_FTPGET		71		//从 FTP 服务器下载数据
#define AT_CMD_FTPLOGIN		72		//登录 FTP 服务器
#define AT_CMD_FTPLOGOUT		73		//从 FTP 服务器注销
#define AT_CMD_FTPPUT		74		//向 FTP 服务器上传数据
#define AT_CMD_FTPSTATUS		75		//FTP 状态查询
#define AT_CMD_CLIENTSTATUS		76		//查询主站链路的状态
#define AT_CMD_CLOSECLIENT		77		//关闭主站链接
#define AT_CMD_CLOSELISTEN		78		//关闭侦听链接
#define AT_CMD_GPRSSTATUS		79		//设置外部协议栈信号灯的状态
#define AT_CMD_SIGNAL		80		//设置模块信号灯的状态
#define AT_CMD_TCPLISTEN		81		//设置服务器 TCP 侦听
#define AT_CMD_TCPRECV_S		82		//接收到主站的数据
#define AT_CMD_TCPSENDS		83		//发送给主站的数据
#define AT_CMD_MYCGED		84		//查询当前信道、接收发射功率
#define AT_CMD_MYLACID		85		//查询当前 LAC 和 CELL_ID
#define AT_CMD_MYTIMEUPDATE		86		//网络同步时间
#define AT_SHUT_DOWN     (AT_CMD_MYTIMEUPDATE+1)			    //关闭PDP连接 add by maronglang20151228

#define AT_CMD_R_CPIN_READY	(AT_SHUT_DOWN + 1)			//AT命令
#define AT_CMD_R_CREG	(AT_CMD_R_CPIN_READY + 1)			//网络注册状态查询
#define AT_CMD_R_XIIC	(AT_CMD_R_CREG + 1)			//建立 PPP 连接,带参数哦
#define AT_CMD_R_CCLK	(AT_CMD_R_XIIC + 1)			//查询模块的实时时钟
#define AT_CMD_R_NEOWAY	(AT_CMD_R_CCLK + 1)			//ATI回复
#define AT_CMD_R_TCPSETUP	(AT_CMD_R_NEOWAY + 1)			//建立 TCP 连接
#define AT_CMD_R_TCPSEND	(AT_CMD_R_TCPSETUP + 1)			//发送 TCP 数据
#define AT_CMD_R_TCPRECV	(AT_CMD_R_TCPSEND + 1)			//接收到 TCP 数据
#define AT_CMD_R_IPR	(AT_CMD_R_TCPRECV + 1)			//发送 TCP 数据
#define AT_CMD_NULL	0xff			//AT命令,空

//以下为变量
vu8 ucNumberMessage;		//报文的数量
vu8 ucLogonMode;		//登录状态
u8  nLogonModeBk;       //上报状态备份
vu8 ucStatusGsm;		//状态
vu8 ucStepGsm;		//步骤
vu8 ucStepReveive;		//接收步骤
TypeReport tyReport;			//上报设置
volatile Type32Bits tyTimerReport;		//长定时器
volatile Type8Bits ucErrorGsm;		//错误
volatile TypeGprs tyGprs;			//GPRS结构体
#ifdef JASON130_PTR
volatile TypeProtol130 tyProtol130;	//协议结构体
#endif
volatile TypeReportParameter tyReportParameter;		//时间结构体



//u8 aucAtBuffer[NUMBER_AT];		//AT缓冲区
//extern u8 aucRecordBuffer[];		//记录缓冲
extern TypeJason tyJasonMaster;		//内部协议主机
extern TypeJason tyJasonSlave;		//内部协议从机
extern TypeParameter tyParameter;			//表参

extern u8 aucUartRxBuffer[];
extern u8 aucUartTxBuffer[];


//以下为位变量
u8 tyGSMFlag;
#define bNeedReport	tyGSMFlag		 //需要上报

uint8_t  SIMGL868_UpdateSignal(void);
uint8_t  SIMGK7M_GetCIMI(u8 *pnOutBuf, u8 nLen);

/* (C) Copyright 2008~2015
南山区中山园路1001号 TCL国际E城E4栋2D
深圳市捷先数码科技有限公司
End Of File*/
