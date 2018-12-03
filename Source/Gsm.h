/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : main.c
* Author            : maronglang
* Date First Issued : 2015/12/11
* Description       : ������������
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/


/*
 !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~

1  ��ָͨ��
1.1  ��ȡ��Ʒ���к�:+CGSN
1.2  ��ȡ�����ƶ��û�ʶ����:+CIMI
1.3  ��ȡ SIM ����ʶ:+CCID
1.4  ��ȡ��Ʒ�汾��:+GETVERS
1.5  �ظ�ִ����һ��ָ��:A/
1.6  ��ѯģ���ͺ�:+CGMM
1.7  ��ѯģ����Ϣ:I
1.8  ��������:E
1.9  ��ʾ��ǰ����:&V
1.10  �洢��ǰ����:&W
2  �ƶ��豸���ƺ�״̬����
2.1  ģ��״̬��ѯ:+CPAS
2.2  ����ע��״̬��ѯ:+CREG
2.3  �ػ�ָ��:+CPWROFF
2.4  ����ģ�鹦��:+CFUN
2.5  �͹�������:+ENPWRSAVE
2.6  ʱ��:+CCLK
2.7  ����ģ�鲨����:+IPR
2.8  ���� PIN ��:+CPIN
2.9  PIN ʹ�����ѯ����ָ��:+CLCK
2.10  PIN �޸�����ָ��:+CPWD
2.11  ��żУ��:+ICF
2.12  ����ģʽ:+CMUX
2.13  ��չ���󱨸�:+CEER
2.14  ���ô�����ʾ��Ϣ:+CMEE
3  �������ָ��
3.1  �ź�ǿ��:+CSQ
3.2  ����ѡ��:+COPS
3.3  ����Ƶ��:+XBANDSEL
4  ����Ϣ����ָ��
4.1  ѡ����ŷ���:+CSMS
4.2  ��ѡ���Ŵ洢��:+CPMS
4.3  ���ö���Ϣģʽ:+CMGF
4.4  ���� TE �ַ���:+CSCS
4.5  ���ö���ָʾ��ʽ:+CNMI
4.6  ������Ϣ:+CMGR
4.7  �����б�:+CMGL
4.8  ���Ͷ���Ϣ:+CMGS
4.9  д����Ϣ:+CMGW
4.10  �����ѱ���Ķ���Ϣ:+CMSS
4.11  ɾ������Ϣ:+CMGD
4.12  �������ĺ���:+CSCA
4.13  �����ı�ģʽ����:+CSMP
4.14  ��ʾ�ı�ģʽ����:+CSDH
4.15  ѡ�� CELL �㲥��Ϣ����:+CSCB
5  �绰��ָ��
5.1  ѡ��绰���洢��:  +CPBS
5.2  ���绰��:+CPBR
5.3  ���ҵ绰��:+CPBF
5.4  д�绰��:+CPBW
5.5  ��ȡ��������:+CNUM
6  GPRS ָ��
6.1  ���� PDP ��ʽ:+CGDCONT
6.2  ���� GPRS ���źͷ���:+CGATT
6.3  GPRS ����:ATD*99#
6.4  ���� USSD ����:+CUSD
6.5  ����/����ģʽ�л�����:&D2
6.6  ����ģʽ�л�������ģʽ:+++
6.7  ����ģʽ�л�������ģʽ:O
6.8  �û���֤:+XGAUTH
7  TCP/IP AT ָ��
7.1  ѡ����/�ⲿЭ��ջ:+XISP
7.2  ���� PPP ����:+XIIC
7.3  ���� TCP ����:AT+TCPSETUP=0,121.150.209.245,30020	AT+TCPSETUP=0,121.15.209.245,33003
7.4  ���� TCP ����:AT+TCPSEND=0,12
7.5  ���յ� TCP ����:+TCPRECV
7.6  �ر� TCP ����:AT+TCPCLOSE=1
7.7  ���� UDP ����:+UDPSETUP
7.8  ���� UDP ����:+UDPSEND
7.9  ���յ� UDP ����:+UDPRECV
7.10  �ر� UDP ����:+UDPCLOSE
7.11  ��ѯ TCP/UDP ��·״̬:+IPSTATUS
7.12  TCP/IP  AT ָ��ע������
8  DNS������������ָ��
8.1  ��ѯ IP ��ַ
8.2  ��ѯ/���� DNS ������
9  FTP AT ָ��
9.1  ��¼ FTP ������:+FTPLOGIN
9.2  �� FTP ������ע��:+FTPLOGOUT
9.3  �� FTP ��������������:+FTPGET
9.4  �� FTP �������ϴ�����:+FTPPUT
9.5  FTP ״̬��ѯ:+FTPSTATUS
10  TCP ������ AT ָ��
10.1  ���÷����� TCP ����:+TCPLISTEN
10.2  �ر���������:+CLOSELISTEN
10.3  �ر���վ����:+CLOSECLIENT
10.4  ���յ���վ������:+TCPRECV(S)
10.5  ���͸���վ������:+TCPSENDS
10.6  ��ѯ��վ��·��״̬:+CLIENTSTATUS
10.7  ����ģ���źŵƵ�״̬:+SIGNAL
10.8  �����ⲿЭ��ջ�źŵƵ�״̬:+GPRSSTATUS
11  ��չ AT ָ��
11.1  ��ѯ��ǰ LAC �� CELL_ID:$MYLACID
11.2  ��ѯ��ǰ�ŵ������շ��书��:$MYCGED
11.3  ����ͬ��ʱ��:$MYTIMEUPDATE
12  ��¼
12.1  �ڲ�Э��ջ TCP ���ӵ� AT ָ������ͼ
12.2  �ⲿЭ��ջ TCP ���ӵ� AT ָ������ͼ
12.3  ����������ʾ���� AT ָ�����úͲ�ѯ����ͼ
12.4  ���ų��õ� AT ָ��
12.4.1  �����ı�ģʽ���ŵ�����
12.4.2  ���� PDU ģʽ���ŵ�����
12.5  �͹���ģʽ������
12.6  ���ڲ�������
*/

#include "global.h"
#include "string.h"

#define MODE_GETSIGNAL_CNT      6
#define GETSIGNAL_TO             4000

#define SIM_REG_SUCCESS          1
#define SIM_REG_FAILURE          2


#define XIAMEN_QIJUN_GPRS
//#define YOUFANG_GPRS

#define MAX_METER		1			//��0����û���õ�
#define MSG_START				0x68
#define MSG_END					0x16
#define MSG_AFN_SHUTMETER		0x85
#define MSG_AFN_READALLMETER	0x8C

#define VALVE_OPEN_188			0x55
#define VALVE_CLOSE_188			0x99

//����Ϊ�궨��
//#define UART_TEST		//���ڵ���
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

#define RE_LOGIN_TO         15000 //Լ15��  1-32ms
#define RE_HEART_TO         60000 //Լ15��  1-32ms

//����Ϊ����
#define TIME_4_STEP	2		//0.328�붨ʱ��@164mS,328/32.8=10
#define TIME_4_CLOSE	3		//0.5�붨ʱ��@164mS,500/164=3
#define TIME_4_DEALY	6		//1�붨ʱ��@164mS,1000/164=6.1
#define TIME_4_HEARTBEAT	304	//50�붨ʱ��@164mS,50000/164=304.88

#define NUMBER_ERROR	6		//�������

#define STEP_GPRS	20		//��¼������
#define STEP_SEND	(STEP_GPRS + 2)		//GPRSʵ�ʿ�ʼ�������ݲ���
#define STEP_WAIT	50		//�������ݵȴ�
#define STEP_EXIT	150		//����,Ȼ��ػ�

//GSM״̬
#define NUMBER_AT	52		//AT��������� 72

//������
#define NUMBER_AT_R	13			//AT�ظ���������,aucAtRCmd,��������

typedef struct
{
	u8 Head0;		//��ͷ0
	u8 Length0[2];		//����0
	u8 Length1[2];		//����0
	u8 Head1;		//��ͷ1
} TypeProtol130Head;		//130���ݽṹ��,��ͷ

typedef struct
{
	u8 Link;		//��·���,ֻ��Ϊ 0,1,2,3
	u8 IPort[21];	//IP��ַ+�˿ں�,ASCII��,123.234.123.123,30020
} TypeGprs;		//Gprsͨ�Žṹ��

typedef union
{
	struct
	{
		u8 Control;		//������
		u8 Address[4];		//��ַ��
		u8 Broadcast;			//�㲥��־
		u8 Afn;			//Ӧ�ò㹦����
		u8 Seq;			//֡������
		u8 Data[4];		//���ݵ�Ԫ��ʶ
		u8 Buf[128 - 12];		//��������
	} Packet;
	u8 Buffer[128];		//��������
} TypeProtol130;		//130���ݽṹ��

//AT����
uc8 aucAtPAscii_Question[] = {"?"};
uc8 aucAtPAscii_1[] = {"1"};
uc8 aucAtPAscii_0[] = {"0"};
uc8 aucAtPAscii_Equal1[] = {"=1"};
uc8 aucAtPAscii_Equal0[] = {"=0"};
uc8 aucAtPBaudrate[] = {"57600"};	//ʱ�������1
uc8 aucAtPTimeServer1[] = {"=\"time.nist.gov\""};	//ʱ�������1
uc8 aucAtPTimeServer2[] = {"=\"time.windows.com\""};	//ʱ�������2
uc8 aucAtPPort2[] = {"\"33003\""};			//Jason�������˿ں�2,������ 33003


//AT����
uc8 aucAtrInit[] = {"+PBREADY"};		//��ʼ������
uc8 aucAtrPppFail[] = {"SOCKETS: IPR STOPPED"};		//ģ��� IP ��ַ���ͷ�
uc8 aucAtrCclk[] = {"+CCLK: \""};			//��ѯģ���ʵʱʱ��,+CCLK: "04/01/01,00:01:56"
uc8 aucAtrCpinReady[] = {"+CPIN: READY"};		//SIM��״̬
uc8 aucAtrCreg[] = {"+CREG:"};			//��ѯģ��ĵ�ǰ����ע��״̬
uc8 aucAtrNeoway[] = {"NEOWAY"};		//ATI�ظ�
uc8 aucAtrOk[] = {"OK"};				//ok
uc8 aucAtrXiic[] = {"+XIIC:"};			//���� PPP ����,+XIIC:    1, 10.28.176.133
uc8 aucAtrTcpsetup[] = {"+TCPSETUP:"};		//tcpsetup,ok
uc8 aucAtrTcpsend[] = {">"};				//���Է�������
uc8 aucAtrTcprecv[] = {"+TCPRECV:"};		//���յ� TCP ����


uc8 aucAtrTcpclose[] = {"+TCPCLOSE:"};		//�ر� TCP ����
uc8 aucAtrIpr[] = {"+IPR=38400"};		//����ģ�鲨����,38400
uc8 aucAtrError[] = {"ERROR"};

//ATָ��
#define AT_HEAD_0	'A'			//ATָ���ͷ0
#define AT_HEAD_1	'T'			//ATָ���ͷ1
#define AT_TAIL_0	0x0d		//ATָ���β0
#define AT_TAIL_1	0x0a		//ATָ���β1

uc8 aucAtInit[] = {"+PBREADY"};			//�ϵ��ģ�鷵�ر�ʾ��ʼ��OK
uc8 aucAtNull[] = {""};		//��ָ��
uc8 aucATS_A[] = {"A/"};		//�ظ�ִ����һ��ָ��
uc8 aucATS_E[] = {"E"};		//��������
uc8 aucATS_V[] = {"&V"};		//��ʾ��ǰ����
uc8 aucATS_W[] = {"&W"};		//�洢��ǰ����
uc8 aucAtS_D2[] = {"&D2"};			//����/����ģʽ�л�����
uc8 aucAtS_Plus[] = {"+++"};			//����ģʽ�л�������ģʽ
uc8 aucAtS_O[] = {"O"};			//����ģʽ�л�������ģʽ
uc8 aucAtS_D[] = {"D*99#"};			//GPRS ����
uc8 aucAtI[] = {"I"};				//��׼ָ�Ҳ��ͨ��ָ���ȡ������Ϣ��ģ�������Ϣ
uc8 aucAtCcid[] = {"+CCID"};			//��ȡ SIM ���� ICCID
uc8 aucAtCgmi[] = {"+CGMI"};			//��������
uc8 aucAtCgmm[] = {"+CGMM"};		//�豸����
uc8 aucAtCgsn[] = {"+CGSN"};			//��ȡģ��Ĳ�Ʒ���к�,IMEI
uc8 aucAtCimi[] = {"+CIMI"};			//��ȡ�����ƶ��û�ʶ����,IMSI(International Mobile Subscriber Identification)
uc8 aucAtGetvers[] = {"+GETVERS"};			//��ȡ��Ʒ��ǰ������汾��
uc8 aucAtCclk[] = {"+CCLK?"};			//����,��ѯģ���ʵʱʱ��
uc8 aucAtCeer[] = {"+CEER"};			//��չ���󱨸�
uc8 aucAtCfun[] = {"+CFUN"};			//����ģ�鹦��
uc8 aucAtCipstatus[] = {"+CIPSTATUS"};		//GPRS״̬
uc8 aucAtClck[] = {"+CLCK"};			//���������Լ���ѯ MT �������豸
uc8 aucAtCmee[] = {"+CMEE"};			//���ô�����ʾ��Ϣ
uc8 aucAtCmux[] = {"+CMUX"};			//������ʹ�� GSM07.10 ����ĸ���Э�����ͨ��
uc8 aucAtCpas[] = {"+CPAS"};			//��ѯģ��ĵ�ǰ����״̬
uc8 aucAtCpin[] = {"+CPIN?"};			//��ѯ PIN ״̬,���� PIN ��
uc8 aucAtCpwd[] = {"+CPWD"};			//�޸�ģ�������ܵ�����

#ifdef XIAMEN_QIJUN_GPRS
uc8 aucAtCpwroff[] = {"+CPOF"};			//�ػ�ָ��
#else
uc8 aucAtCpwroff[] = {"+CPWROFF"};			//�ػ�ָ��
#endif
uc8 aucAtCreg[] = {"+CREG?"};			//��ѯģ��ĵ�ǰ����ע��״̬
uc8 aucAtEnpwrsavE[] = {"+ENPWRSAVE"};		//�����Ƿ�����ģ�����͹���ģʽ
uc8 aucAtIcf[] = {"+ICF"};			//����ģ�����żУ��
uc8 aucAtIpr[] = {"+IPR=19200"};			//����ģ�鲨����,19200
uc8 aucAtCops[] = {"+COPS?"};		//�ж���Ӫ��,��ͨ,�ƶ�
uc8 aucAtCsq[] = {"+CSQ"};			//�ź�ǿ��
uc8 aucAtXbandsel[] = {"+XBANDSEL"};			//����Ƶ��
uc8 aucAtCmgd[] = {"+CMGD"};			//ɾ������Ϣ
uc8 aucAtCmgf[] = {"+CMGF"};			//���ö���Ϣģʽ
uc8 aucAtCmgl[] = {"+CMGL"};			//�����б�
uc8 aucAtCmgr[] = {"+CMGR"};			//������Ϣ
uc8 aucAtCmgs[] = {"+CMGS"};			//���Ͷ���Ϣ
uc8 aucAtCmgw[] = {"+CMGW"};			//д����Ϣ
uc8 aucAtCmss[] = {"+CMSS"};			//�����ѱ���Ķ���Ϣ
uc8 aucAtCnmi[] = {"+CNMI"};			//���ö���ָʾ��ʽ
uc8 aucAtCpms[] = {"+CPMS"};			//��ѡ���Ŵ洢��
uc8 aucAtCsca[] = {"+CSCA"};			//�������ĺ���
uc8 aucAtCscb[] = {"+CSCB"};			//ѡ�� CELL �㲥��Ϣ����
uc8 aucAtCscs[] = {"+CSCS"};			//���� TE �ַ���
uc8 aucAtCsdh[] = {"+CSDH"};			//��ʾ�ı�ģʽ����
uc8 aucAtCsmp[] = {"+CSMP"};			//�����ı�ģʽ����
uc8 aucAtCsms[] = {"+CSMS"};			//ѡ����ŷ���
uc8 aucAtCnum[] = {"+CNUM"};			//��ȡ��������
uc8 aucAtCpbf[] = {"+CPBF"};			//���ҵ绰��
uc8 aucAtCpbr[] = {"+CPBR"};			//���绰��
uc8 aucAtCpbs[] = {"+CPBS"};			//ѡ��绰���洢��
uc8 aucAtCpbw[] = {"+CPBW"};			//д�绰��
//GPRS ָ��
uc8 aucAtPdpCm[] = {"+CGDCONT=1,\"IP\",\"CMNET\""};			//���� PDP ��ʽ,�ƶ�
uc8 aucAtPdpUn[] = {"+CGDCONT=1,\"IP\",\"UNINET\""};			//���� PDP ��ʽ.��ͨ
uc8 aucAtCgatt[] = {"+CGATT="};			//���� GPRS ���źͷ���
uc8 aucAtCusd[] = {"+CUSD"};			//���� USSD ����
//TCP/IP AT ָ��
uc8 aucAtIpstatus[] = {"+IPSTATUS"};			//��ѯ TCP/UDP ��·״̬

#ifdef XIAMEN_QIJUN_GPRS
uc8 aucAtTcprecv[] = {"+TCPRECV"};			//���յ� TCP ����
uc8 aucAtTcpsend[] = {"+CIPSEND="};			//���� TCP ����
uc8 aucAtTcpsetup[] = {"+cipstart=\"TCP\","};			//���� TCP ����
uc8 aucAtXgauth[] = {"+CSTT="};			//�û���֤ apn usr pwd
uc8 aucAtTcpclose[] = {"+CIPCLOSE"};			//�ر� TCP ����
#else
uc8 aucAtTcpclose[] = {"+TCPCLOSE="};			//�ر� TCP ����
uc8 aucAtXgauth[] = {"+XGAUTH=1,1,\"GSM\",\"1234\""};			//�û���֤
uc8 aucAtTcprecv[] = {"+TCPRECV"};			//���յ� TCP ����
uc8 aucAtTcpsend[] = {"+TCPSEND="};			//���� TCP ����
uc8 aucAtTcpsetup[] = {"+TCPSETUP="};			//���� TCP ����
#endif

uc8 aucAtUdpclose[] = {"+UDPCLOSE"};			//�ر� UDP ����
uc8 aucAtUdprecv[] = {"+UDPRECV"};			//���յ� UDP ����
uc8 aucAtUdpsend[] = {"+UDPSEND"};			//���� UDP ����
uc8 aucAtUdpsetup[] = {"+UDPSETUP"};			//���� UDP ����
#ifdef XIAMEN_QIJUN_GPRS
uc8 aucAtXiic[] = {"+CIFSR"};			//��ȡ����IP
uc8 aucAtXisp[] = {"+CIICR"};			//�����ƶ����������� GPRS �� CSD ��������
#else
uc8 aucAtXiic[] = {"+XIIC"};			//���� PPP ����
uc8 aucAtXisp[] = {"+XISP="};			//ѡ����/�ⲿЭ��ջ
#endif
//DNS������������ָ��
uc8 aucAtDns[] = {"+DNS"};			//��ѯ IP ��ַ
uc8 aucAtDnsserver[] = {"+DNSSERVER"};			// ��ѯ/���� DNS ������
//FTPָ��
uc8 aucAtFtpget[] = {"+FTPGET"};			//�� FTP ��������������
uc8 aucAtFtplogin[] = {"+FTPLOGIN"};			//��¼ FTP ������
uc8 aucAtFtplogout[] = {"+FTPLOGOUT"};			//�� FTP ������ע��
uc8 aucAtFtpput[] = {"+FTPPUT"};			//�� FTP �������ϴ�����
uc8 aucAtFtpstatus[] = {"+FTPSTATUS"};			//FTP ״̬��ѯ
//TCP ������ָ��
uc8 aucAtClientstatus[] = {"+CLIENTSTATUS"};			//��ѯ��վ��·��״̬
uc8 aucAtCloseclient[] = {"+CLOSECLIENT"};			//�ر���վ����
uc8 aucAtCloselisten[] = {"+CLOSELISTEN"};			//�ر���������
uc8 aucAtGprsstatus[] = {"+GPRSSTATUS"};			//�����ⲿЭ��ջ�źŵƵ�״̬
uc8 aucAtSignal[] = {"+SIGNAL"};			//����ģ���źŵƵ�״̬
uc8 aucAtTcplisten[] = {"+TCPLISTEN"};			//���÷����� TCP ����
uc8 aucAtTcprecv_S[] = {"+TCPRECV(S)"};			//���յ���վ������
uc8 aucAtTcpsends[] = {"+TCPSENDS"};			//���͸���վ������
//��չ AT ָ��
uc8 aucAtMycged[] = {"$MYCGED"};			//��ѯ��ǰ�ŵ������շ��书��
uc8 aucAtMylacid[] = {"$MYLACID"};			//��ѯ��ǰ LAC �� CELL_ID
uc8 aucAtMytimeupdate[] = {"$MYTIMEUPDATE"};			//����ͬ��ʱ��
uc8 aucAtShutDown[] = {"CIPSHUT"};			//����ͬ��ʱ��

//����Ϊ���ݱ�
uc8 *const aucAtCmd[] = {	//AT����,˫CONST����,�������FLASH��
	aucAtNull,		//aucATS_A,		//�ظ�ִ����һ��ָ��
	aucATS_E,		//aucATS_E,		//��������
	aucAtNull,		//aucATS_V,		//��ʾ��ǰ����
	aucAtNull,		//aucATS_W,		//�洢��ǰ����
	aucAtNull,		//aucAtS_D2,			//&D2
	aucAtNull,		//aucAtS_Plus,			//����ģʽ�л�������ģʽ
	aucAtNull,		//aucAtS_O,			//����ģʽ�л�������ģʽ
	aucAtS_D,			//GPRS ����
	aucAtI,				//��׼ָ�Ҳ��ͨ��ָ���ȡ������Ϣ��ģ�������Ϣ
	aucAtCcid,			//��ȡ SIM ���� ICCID
	aucAtCgmi,			//��������
	aucAtCgmm,		//�豸����
	aucAtCgsn,			//��ȡģ��Ĳ�Ʒ���к�,IMEI
	aucAtCimi,			//��ȡ�����ƶ��û�ʶ����,IMSI(International Mobile Subscriber Identification)
	aucAtGetvers,			//��ȡ��Ʒ��ǰ������汾��
	aucAtCclk,			//����,��ѯģ���ʵʱʱ��
	aucAtNull,		//aucAtCeer,			//��չ���󱨸�
	aucAtNull,		//aucAtCfun,			//����ģ�鹦��
	aucAtNull,		//aucAtCipstatus,		//GPRS״̬
	aucAtNull,		//aucAtClck,			//���������Լ���ѯ MT �������豸
	aucAtNull,		//aucAtCmee,			//���ô�����ʾ��Ϣ
	aucAtNull,		//aucAtCmux,			//������ʹ�� GSM07.10 ����ĸ���Э�����ͨ��
	aucAtNull,		//aucAtCpas,			//��ѯģ��ĵ�ǰ����״̬
	aucAtCpin,			//��ѯ PIN ״̬,���� PIN ��
	aucAtCpwd,			//�޸�ģ�������ܵ�����
	aucAtCpwroff,			//�ػ�ָ��
	aucAtCreg,			//��ѯģ��ĵ�ǰ����ע��״̬
	aucAtNull,		//aucAtEnpwrsavE,		//�����Ƿ�����ģ�����͹���ģʽ
	aucAtNull,		//aucAtIcf,			//����ģ�����żУ��
	aucAtIpr,			//����ģ�鲨����
	aucAtCops,		//����״̬
	aucAtCsq,			//�ź�ǿ��
	aucAtNull,		//aucAtXbandsel,			//����Ƶ��
	aucAtCmgd,			//ɾ������Ϣ
	aucAtNull,		//aucAtCmgf,			//���ö���Ϣģʽ
	aucAtNull,		//aucAtCmgl,			//�����б�
	aucAtNull,		//aucAtCmgr,			//������Ϣ
	aucAtNull,		//aucAtCmgs,			//���Ͷ���Ϣ
	aucAtNull,		//aucAtCmgw,			//д����Ϣ
	aucAtNull,		//aucAtCmss,			//�����ѱ���Ķ���Ϣ
	aucAtNull,		//aucAtCnmi,			//���ö���ָʾ��ʽ
	aucAtNull,		//aucAtCpms,			//��ѡ���Ŵ洢��
	aucAtCsca,			//�������ĺ���
	aucAtCscb,			//ѡ�� CELL �㲥��Ϣ����
	aucAtNull,		//aucAtCscs,			//���� TE �ַ���
	aucAtNull,		//aucAtCsdh,			//��ʾ�ı�ģʽ����
	aucAtNull,		//aucAtCsmp,			//�����ı�ģʽ����
	aucAtNull,		//aucAtCsms,			//ѡ����ŷ���
	aucAtNull,		//aucAtCnum,			//��ȡ��������
	aucAtNull,		//aucAtCpbf,			//���ҵ绰��
	aucAtNull,		//aucAtCpbr,			//���绰��
	aucAtNull,		//aucAtCpbs,			//ѡ��绰���洢��
	aucAtNull,		//aucAtCpbw,			//д�绰��
	aucAtPdpCm,			//���� PDP ��ʽ,�ƶ�
	aucAtPdpUn,			//���� PDP ��ʽ.��ͨ
	aucAtCgatt,			//���� GPRS ���źͷ���
	aucAtCusd,			//���� USSD ����
	aucAtXgauth,			//�û���֤
	aucAtIpstatus,			//��ѯ TCP/UDP ��·״̬
	aucAtTcpclose,			//�ر� TCP ����
	aucAtNull,		//aucAtTcprecv,			//���յ� TCP ����
	aucAtTcpsend,			//���� TCP ����
	aucAtTcpsetup,			//���� TCP ����
	aucAtNull,		//aucAtUdpclose,			//�ر� UDP ����
	aucAtNull,		//aucAtUdprecv,			//���յ� UDP ����
	aucAtNull,		//aucAtUdpsend,			//���� UDP ����
	aucAtNull,		//aucAtUdpsetup,			//���� UDP ����
	aucAtXiic,			//���� PPP ����
	aucAtXisp,			//ѡ����/�ⲿЭ��ջ
	aucAtDns,			//��ѯ IP ��ַ
	aucAtNull,		//aucAtDnsserver,			// ��ѯ/���� DNS ������
	aucAtNull,		//aucAtFtpget,			//�� FTP ��������������
	aucAtNull,		//aucAtFtplogin,			//��¼ FTP ������
	aucAtNull,		//aucAtFtplogout,			//�� FTP ������ע��
	aucAtNull,		//aucAtFtpput,			//�� FTP �������ϴ�����
	aucAtNull,		//aucAtFtpstatus,			//FTP ״̬��ѯ
	aucAtClientstatus,			//��ѯ��վ��·��״̬
	aucAtCloseclient,			//�ر���վ����
	aucAtCloselisten,			//�ر���������
	aucAtGprsstatus,			//�����ⲿЭ��ջ�źŵƵ�״̬
	aucAtSignal,			//����ģ���źŵƵ�״̬
	aucAtNull,		//aucAtTcplisten,			//���÷����� TCP ����
	aucAtNull,		//aucAtTcprecv_S,			//���յ���վ������
	aucAtNull,		//aucAtTcpsends,			//���͸���վ������
	aucAtNull,		//aucAtMycged,			//��ѯ��ǰ�ŵ������շ��书��
	aucAtNull,		//aucAtMylacid,			//��ѯ��ǰ LAC �� CELL_ID
	aucAtMytimeupdate,			//����ͬ��ʱ��
	aucAtShutDown,			    //�رռ����PDP����
};

uc8 *const aucAtRCmd[] = {	//AT��������,˫CONST����,�������FLASH��
	aucAtrInit,				//0,��3������ز�������ֵ
	aucAtrPppFail,			//1,����λ����
	aucAtrOk,				//2,��3������ز�������ֵ
	aucAtrCpinReady,		//3
	aucAtrCreg,				//4,����ע��״̬��ѯ
	aucAtrXiic,				//5,���� PPP ����
	aucAtrCclk,				//6,��ѯģ���ʵʱʱ��
	aucAtrNeoway,			//7,ATI�ظ�
	aucAtrTcpsetup,			//8,���� TCP ����
	aucAtrTcpsend,			//9,���Է�������
	aucAtrTcprecv,			//10,���յ� TCP ����
	aucAtrTcpclose,			//11,�ر� TCP ����
	aucAtrIpr,				//12,����ģ�鲨����,38400
	aucAtrError,			//13,����
};

#define AT_CMD_S_A		0	//�ظ�ִ����һ��ָ��
#define AT_CMD_S_E		1	//��������
#define AT_CMD_S_V		2	//��ʾ��ǰ����
#define AT_CMD_S_W		3	//�洢��ǰ����
#define AT_CMD_S_D2		4		//&D2
#define AT_CMD_S_PLUS		5		//����ģʽ�л�������ģʽ
#define AT_CMD_S_O		6		//����ģʽ�л�������ģʽ
#define AT_CMD_S_D		7		//GPRS ����
#define AT_CMD_I		8			//��׼ָ�Ҳ��ͨ��ָ���ȡ������Ϣ��ģ�������Ϣ
#define AT_CMD_CCID		9		//��ȡ SIM ���� ICCID
#define AT_CMD_CGMI		10		//��������
#define AT_CMD_CGMM		11	//�豸����
#define AT_CMD_CGSN		12		//��ȡģ��Ĳ�Ʒ���к�,IMEI
#define AT_CMD_CIMI		13		//��ȡ�����ƶ��û�ʶ����,IMSI(International Mobile Subscriber Identification)
#define AT_CMD_GETVERS		14		//��ȡ��Ʒ��ǰ������汾��
#define AT_CMD_CCLK		15		//����,��ѯģ���ʵʱʱ��
#define AT_CMD_CEER		16		//��չ���󱨸�
#define AT_CMD_CFUN		17		//����ģ�鹦��
#define AT_CMD_CIPSTATUS		18	//GPRS״̬
#define AT_CMD_CLCK		19		//���������Լ���ѯ MT �������豸
#define AT_CMD_CMEE		20		//���ô�����ʾ��Ϣ
#define AT_CMD_CMUX		21		//������ʹ�� GSM07.10 ����ĸ���Э�����ͨ��
#define AT_CMD_CPAS		22		//��ѯģ��ĵ�ǰ����״̬
#define AT_CMD_CPIN		23		//��ѯ PIN ״̬,���� PIN ��
#define AT_CMD_CPWD		24		//�޸�ģ�������ܵ�����
#define AT_CMD_CPWROFF		25		//�ػ�ָ��
#define AT_CMD_CREG		26		//��ѯģ��ĵ�ǰ����ע��״̬
#define AT_CMD_ENPWRSAVE		27	//�����Ƿ�����ģ�����͹���ģʽ
#define AT_CMD_ICF		28		//����ģ�����żУ��
#define AT_CMD_IPR		29		//����ģ�鲨����
#define AT_CMD_COPS		30	//����״̬
#define AT_CMD_CSQ		31		//�ź�ǿ��
#define AT_CMD_XBANDSEL		32		//����Ƶ��
#define AT_CMD_CMGD		33		//ɾ������Ϣ
#define AT_CMD_CMGF		34		//���ö���Ϣģʽ
#define AT_CMD_CMGL		35		//�����б�
#define AT_CMD_CMGR		36		//������Ϣ
#define AT_CMD_CMGS		37		//���Ͷ���Ϣ
#define AT_CMD_CMGW		38		//д����Ϣ
#define AT_CMD_CMSS		39		//�����ѱ���Ķ���Ϣ
#define AT_CMD_CNMI		40		//���ö���ָʾ��ʽ
#define AT_CMD_CPMS		41		//��ѡ���Ŵ洢��
#define AT_CMD_CSCA		42		//�������ĺ���
#define AT_CMD_CSCB		43		//ѡ�� CELL �㲥��Ϣ����
#define AT_CMD_CSCS		44		//���� TE �ַ���
#define AT_CMD_CSDH		45		//��ʾ�ı�ģʽ����
#define AT_CMD_CSMP		46		//�����ı�ģʽ����
#define AT_CMD_CSMS		47		//ѡ����ŷ���
#define AT_CMD_CNUM		48		//��ȡ��������
#define AT_CMD_CPBF		49		//���ҵ绰��
#define AT_CMD_CPBR		50		//���绰��
#define AT_CMD_CPBS		51		//ѡ��绰���洢��
#define AT_CMD_CPBW		52		//д�绰��
#define AT_CMD_PDPCM		53		//���� PDP ��ʽ,�ƶ�
#define AT_CMD_PDPUN		54		//���� PDP ��ʽ.��ͨ
#define AT_CMD_CGATT		55		//���� GPRS ���źͷ���
#define AT_CMD_CUSD		56		//���� USSD ����
#define AT_CMD_XGAUTH		57		//�û���֤
#define AT_CMD_IPSTATUS		58		//��ѯ TCP/UDP ��·״̬
#define AT_CMD_TCPCLOSE		59		//�ر� TCP ����
#define AT_CMD_TCPRECV		60		//���յ� TCP ����
#define AT_CMD_TCPSEND		61		//���� TCP ����
#define AT_CMD_TCPSETUP		62		//���� TCP ����
#define AT_CMD_UDPCLOSE		63		//�ر� UDP ����
#define AT_CMD_UDPRECV		64		//���յ� UDP ����
#define AT_CMD_UDPSEND		65		//���� UDP ����
#define AT_CMD_UDPSETUP		66		//���� UDP ����
#define AT_CMD_XIIC		67		//���� PPP ����
#define AT_CMD_XISP		68		//ѡ����/�ⲿЭ��ջ
#define AT_CMD_DNS		69		//��ѯ IP ��ַ
#define AT_CMD_DNSSERVER		70		// ��ѯ/���� DNS ������
#define AT_CMD_FTPGET		71		//�� FTP ��������������
#define AT_CMD_FTPLOGIN		72		//��¼ FTP ������
#define AT_CMD_FTPLOGOUT		73		//�� FTP ������ע��
#define AT_CMD_FTPPUT		74		//�� FTP �������ϴ�����
#define AT_CMD_FTPSTATUS		75		//FTP ״̬��ѯ
#define AT_CMD_CLIENTSTATUS		76		//��ѯ��վ��·��״̬
#define AT_CMD_CLOSECLIENT		77		//�ر���վ����
#define AT_CMD_CLOSELISTEN		78		//�ر���������
#define AT_CMD_GPRSSTATUS		79		//�����ⲿЭ��ջ�źŵƵ�״̬
#define AT_CMD_SIGNAL		80		//����ģ���źŵƵ�״̬
#define AT_CMD_TCPLISTEN		81		//���÷����� TCP ����
#define AT_CMD_TCPRECV_S		82		//���յ���վ������
#define AT_CMD_TCPSENDS		83		//���͸���վ������
#define AT_CMD_MYCGED		84		//��ѯ��ǰ�ŵ������շ��书��
#define AT_CMD_MYLACID		85		//��ѯ��ǰ LAC �� CELL_ID
#define AT_CMD_MYTIMEUPDATE		86		//����ͬ��ʱ��
#define AT_SHUT_DOWN     (AT_CMD_MYTIMEUPDATE+1)			    //�ر�PDP���� add by maronglang20151228

#define AT_CMD_R_CPIN_READY	(AT_SHUT_DOWN + 1)			//AT����
#define AT_CMD_R_CREG	(AT_CMD_R_CPIN_READY + 1)			//����ע��״̬��ѯ
#define AT_CMD_R_XIIC	(AT_CMD_R_CREG + 1)			//���� PPP ����,������Ŷ
#define AT_CMD_R_CCLK	(AT_CMD_R_XIIC + 1)			//��ѯģ���ʵʱʱ��
#define AT_CMD_R_NEOWAY	(AT_CMD_R_CCLK + 1)			//ATI�ظ�
#define AT_CMD_R_TCPSETUP	(AT_CMD_R_NEOWAY + 1)			//���� TCP ����
#define AT_CMD_R_TCPSEND	(AT_CMD_R_TCPSETUP + 1)			//���� TCP ����
#define AT_CMD_R_TCPRECV	(AT_CMD_R_TCPSEND + 1)			//���յ� TCP ����
#define AT_CMD_R_IPR	(AT_CMD_R_TCPRECV + 1)			//���� TCP ����
#define AT_CMD_NULL	0xff			//AT����,��

//����Ϊ����
vu8 ucNumberMessage;		//���ĵ�����
vu8 ucLogonMode;		//��¼״̬
u8  nLogonModeBk;       //�ϱ�״̬����
vu8 ucStatusGsm;		//״̬
vu8 ucStepGsm;		//����
vu8 ucStepReveive;		//���ղ���
TypeReport tyReport;			//�ϱ�����
volatile Type32Bits tyTimerReport;		//����ʱ��
volatile Type8Bits ucErrorGsm;		//����
volatile TypeGprs tyGprs;			//GPRS�ṹ��
#ifdef JASON130_PTR
volatile TypeProtol130 tyProtol130;	//Э��ṹ��
#endif
volatile TypeReportParameter tyReportParameter;		//ʱ��ṹ��



//u8 aucAtBuffer[NUMBER_AT];		//AT������
//extern u8 aucRecordBuffer[];		//��¼����
extern TypeJason tyJasonMaster;		//�ڲ�Э������
extern TypeJason tyJasonSlave;		//�ڲ�Э��ӻ�
extern TypeParameter tyParameter;			//���

extern u8 aucUartRxBuffer[];
extern u8 aucUartTxBuffer[];


//����Ϊλ����
u8 tyGSMFlag;
#define bNeedReport	tyGSMFlag		 //��Ҫ�ϱ�

uint8_t  SIMGL868_UpdateSignal(void);
uint8_t  SIMGK7M_GetCIMI(u8 *pnOutBuf, u8 nLen);

/* (C) Copyright 2008~2015
��ɽ����ɽ԰·1001�� TCL����E��E4��2D
�����н�������Ƽ����޹�˾
End Of File*/
