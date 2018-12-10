/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : Pwrctr.h
* Author            : maronglang
* Date First Issued : 2015/12/23
* Description       : �͹��Ĵ���ӿں���
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef __PWRCTR_H__
#define __PWRCTR_H__

/* �͹��Ļ��ѳ�ʱ */
#define LP_WAKEUP_TO    691200 //3600*24*8 8�� ��ʹʱ���쳣 8���ָ�
#ifdef TEST_VISON
#define LP_WU_TIMEBASE  1     //ʱ�����1���� ������ 1440Ϊ�����汾 
#else
#define LP_WU_TIMEBASE  1440  //ʱ�����1���� ������ 1440Ϊ�����汾 
#endif

#define WU_MODE_KEY     1    //��������
#define WU_MODE_AUTO    2    //�Զ�����

#define WU_UPLOAD_NG    0    //0δ�ϴ���1���ϴ�
#define WU_UPLOAD_OK    1

#define LP_GM_FLG_OK      0
#define LP_GPRS_FLG_OK    1
#define LP_START_FLG_OK   3

#define LP_KEYWU_TO       3   //�������ѳ�ʱ
#define LP_KEYWU_PRO_TO   5   //�������ѹ��̳�ʱ

/* ���жϻ���IO�� */
#ifdef   IOT_DAT_DETECTOR
#define WAKE_UP_PORT_EXTI             EXTI_Port_D
#define WAKE_UP_PORT_PIN              EXTI_Pin_0  //GPIO_Pin_0
#define WAKE_UP_EXTIT_PIN             EXTI_IT_Pin0
#else
#define WAKE_UP_PORT_EXTI             EXTI_Port_B
#define WAKE_UP_PORT_PIN              EXTI_Pin_2  //GPIO_Pin_2
#define WAKE_UP_EXTIT_PIN             EXTI_IT_Pin2  
#endif


extern ST_Time g_stNextRepTime;        //�´��ϱ�ʱ��
extern ST_Time g_stNextGmTime;        //�´γ���ʱ��



void LP_LowPowerManage(void);
void  LP_BSP_DeInit(void);
void LP_SetKeyWuFlg(uint8_t nFlg);
void LP_SYSCLKConfig_STOP(void);
void LP_SetLowPwrStartFlg(u8 nFlg);
void LP_ClrLowPwrStartFlg(u8 nFlg);
uint8_t LP_GetKeyWuFlg(void);
void LP_TermReset(void);
void LP_DelayMs(uint32_t dwTime);
void LP_XJ_CalReportTime(TM_Time* pStNextTime);
u8  LP_XJ_GetDebugReportFlg(void);

#endif /* __PWRCTR_H__ */
