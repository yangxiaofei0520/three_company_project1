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
		u8 CtrlB[3];		    //������
		u8 Data_Len;			//���ݳ���
		u8 Cmd;					//������
		u8 Buf[180-5];			//������
	} Packet;
	u8 Buffer[180];		//��������
} TypeProtol_HD;		//�ʹ�Э�����ݽṹ��



#define Packet_Head_0		0xA7	//��ͷ0
#define Packet_Head_1		0xA7	//��ͷ1
#define Packet_End_0		0x0D	//��β0
#define Packet_End_1		0x0A	//��β1

#define Maker_Addr			0x01	//���̵�ַ 0x01�ʹ�Ƽ��������趨��	0x02��ˮ	0x03��Դ   				0x04ɽ�� 0x05�ذ���        0x06����

#define Protocol_Version	0x14	//BCD��   0x14����1.4�汾


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

	HeDa_Cmd_Get_Sampling_Interval		=0x91,//��ѯ������������С����У�
	HeDa_Cmd_Get_Net_Param				=0x92,//��ѯ������������С����У�
	HeDa_Cmd_Get_Report_Cycle			=0x94,//��ѯ�ϱ����ڣ����С����У�
	HeDa_Cmd_Get_Pressure_Threshold		=0x95,//��ѯѹ����������ֵ�����С����У�
	HeDa_Cmd_Get_Secret_Key				=0x96,//��ѯ��Կ�����С����У�����Ԥ��

	HeDa_Cmd_Get_All_Param				=0xA0,//��ȡ���в��������С����У�
	HeDa_Cmd_Get_Appoint_Data			=0xA1,//��ȡָ�����ݣ����С����У�
	
}HeDa_Cmd;//�ʹ�Ƽ�Э�������



#define HeDa_Default_Heart_Beat_Interval 		(1*60) //������� 1min
#define HeDa_Heart_Beat_Interval_Max			(9*60) //����������


#define HeDa_Packet_Max_Len						(512)	//���ݷְ���󳤶�


//��ǰ����״̬
#define UP_Upload_HD		   4			   //�ϱ�
#define UP_Free_HD             5               //����

/* �������� */
#define HD_ONLINE              1

#endif


#endif

