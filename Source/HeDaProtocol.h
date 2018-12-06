#ifndef _HeDaProtocol_H_
#define _HeDaProtocol_H_

#ifdef HEDA_PTR

typedef struct
{
	u8 Head[2];		    //��ͷ2
	u8 Addr[3];			//��ַ��
	u8 Version;		    //Э��汾
} TypeProtolHead_HD;	//�ʹ�Э�����ݽṹ��,��ͷ


extern u8 g_Device_Info[15]; 	//�豸��Ϣ

typedef union
{
	struct
	{
		u8 Ctrl[3];		    	//������
		u16 Data_Len;			//���ݳ���
		u8 Cmd;					//������
		u8 Buf[170-6];			//������
	} Packet;
	u8 Buffer[170];		//��������
} TypeProtol_HD;		//�ʹ�Э�����ݽṹ��

typedef struct
{
	u8 flag_change;			//�޸�����
	u32 ip_addr;			//ip��ַ
	u16 port;				//�˿ں�
	char domain_name[32];	//����   ����32�ֽ�ʱ��������\0
	char apn_point[20];		//apn�����  	����32�ֽ�ʱ��������\0
	u8 ignore;				//Ԥ���ֶ�
}HD_CmdSetNetParam;

#define Packet_Head_0		0xA7	//��ͷ0
#define Packet_Head_1		0xA7	//��ͷ1
#define Packet_End_0		0x0D	//��β0
#define Packet_End_1		0x0A	//��β1

#define Maker_Addr			0x01	//���̵�ַ 0x01�ʹ�Ƽ��������趨��	0x02��ˮ	0x03��Դ   				0x04ɽ�� 0x05�ذ���        0x06����

#define Protocol_Version	0x14	//BCD��   0x14����1.4�汾

#define HD_FRAME_OTHER_LEN	9


typedef enum
{
	HeDa_Cmd_Normal_Upload				=0x01,//���û�Զ������������ϴ������У�
	HeDa_Cmd_Burst_Upload				=0x02,//ͻ���¼������ϴ������У�
	HeDa_Cmd_HeartBeat_Upload			=0x03,//�����������ϴ������У�����Ԥ��
	HeDa_Cmd_Reply_Upload				=0x0F,/*���û�Զ�����������ƽ̨Ӧ�����У�
												ͻ���¼�����ƽ̨Ӧ�����У�
												����������ƽ̨Ӧ�����У�*/

	
	HeDa_Cmd_Set_Sampling_Interval		=0x81,//���ò�����������С����У�
	HeDa_Cmd_Set_Net_Param				=0x82,//����������������С����У�
	HeDa_Cmd_Set_Report_Cycle			=0x84,//�����ϱ����ڣ����С����У�
	HeDa_Cmd_Set_Pressure_Threshold		=0x85,//����ѹ����������ֵ�����С����У�
	HeDa_Cmd_Set_Secret_Key				=0x86,//������Կ�����С����У�����Ԥ��
	HeDa_Cmd_Set_Addr					=0x89,//-------���ñ��ַ    	�ʹ�ԭЭ��û�У��Լ����
	
	HeDa_Cmd_Get_Sampling_Interval		=0x91,//��ѯ������������С����У�
	HeDa_Cmd_Get_Net_Param				=0x92,//��ѯ������������С����У�
	HeDa_Cmd_Get_Report_Cycle			=0x94,//��ѯ�ϱ����ڣ����С����У�
	HeDa_Cmd_Get_Pressure_Threshold		=0x95,//��ѯѹ����������ֵ�����С����У�
	HeDa_Cmd_Get_Secret_Key				=0x96,//��ѯ��Կ�����С����У�����Ԥ��
	HeDa_Cmd_Get_Addr					=0x89,//-------��ѯ���ַ    	�ʹ�ԭЭ��û�У��Լ����

	HeDa_Cmd_Get_All_Param				=0xA0,//��ȡ���в��������С����У�
	HeDa_Cmd_Get_Appoint_Data			=0xA1,//��ȡָ�����ݣ����С����У�
	
}HeDa_Cmd;//�ʹ�Ƽ�Э�������

typedef enum
{
	HeDa_Burst_Event_None					=0,//��
	HeDa_Burst_Event_Bat_Low				=0x1,//��ص͵�������
	HeDa_Burst_Event_Pressure1_Limit_Up		=0x2,//ѹ��1�����ޱ���
	HeDa_Burst_Event_Pressure2_Limit_Up		=0x4,//ѹ��2�����ޱ���
	HeDa_Burst_Event_Pressure1_Limit_Down	=0x8,//ѹ��1�����ޱ���
	HeDa_Burst_Event_Pressure2_Limit_Down	=0x10,//ѹ��2�����ޱ���
	
}HeDa_Burst_Event;//ͻ���¼�����

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
}HeDa_Report_Cycle;//�ʹ��ϱ���������



#define HeDa_Default_Heart_Beat_Interval 		(1*60) //������� 1min
#define HeDa_Heart_Beat_Interval_Max			(9*60) //����������


#define HeDa_Packet_Max_Len						(512)	//���ݷְ���󳤶�


#define  Flag_Data_Is_Secret		(1<<7)			//�����Ƿ񱻼���
#define  Flag_Data_Is_Finish		(1<<6)			//�����Ƿ������

//��ǰ����״̬
#define UP_Upload_HD		   4			   //�ϱ�
#define UP_Free_HD             5               //����

/* �������� */
#define HD_ONLINE              1

/*�ϱ��������*/
#define HD_INTERVAL_DAY             0
#define HD_INTERVAL_HOUR            1
#define HD_INTERVAL_MIN             2


/*��½ģʽ*/
#define HD_Login_IP					1//ip��ַ
#define HD_Login_Domain_Name		2//����



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
	Э�����
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

/*�ú���δʵ��*/
u8 HeDa_Cmd_Set_Secret_Key_Handle(u8 *pData);
u8 HeDa_Cmd_Get_Secret_Key_Handle(u8 *pData);
u8 HeDa_Cmd_Get_All_Param_Handle(u8 *pData);
u8 HeDa_Cmd_Get_Appoint_Data_Handle(u8 *pData);

#endif


#endif

