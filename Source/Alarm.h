/******************** (C) COPYRIGHT 2015 JASON.TEC.LTD ***********************
* File Name         : ALarm.h
* Author            : maronglang
* Date First Issued : 2015/12/25
* Description       : �澯����봦��
********************************************************************************
* History:
*   1. mm/dd/yyyy, ver. x.y.z, by xxx, 
*******************************************************************************/

#ifndef __ALARM_H__
#define __ALARM_H__

#define ADC_RATIO              ((uint16_t) 879) /*ADC_RATIO = ( 3.6 * 1000 * 1000)/4095 */

#ifdef IOT_DAT_DETECTOR
#define BATVOL_HIGHLIMT                    7500
#define BATVOL_LOWLIMT                     6200 // 3300
#define BATVOL_SLEEP_LIMT                  5500 // 3300
#define BAT_NO_BAT_VOL                     1000
#else
#define BATVOL_HIGHLIMT                    3800
#define BATVOL_LOWLIMT                     3400 // 3300
#define BATVOL_SLEEP_LIMT                  3200 // 3300
#define BAT_NO_BAT_VOL                     500
#endif

#define PRESS_DOWNLIMIT        0x40  //Խ���޸澯         D6
#define PRESS_UPLIMIT          0x20  //Խ���޸澯          D5
#define PIEZOMETER_ERROR       0x10  //ѹ�����쳣         D4
#define RTC_ERROR       8    //ʱ���쳣         D3
#define METER_ERROR     4    //�����쳣         D2
#define GUARD_KEY_UP    2    //���𰴼���̧��   D1
#define BATVOL_LOW      1    //��ص�ѹ��       D0
#define NO_ALARM        0    //����

#define BATVOL_NORMAL   0    //�������

#ifdef PIEZOMETER
#define ALARM_MASK      0xFF //�澯����
#else
#define ALARM_MASK      0x0F //�澯����
#endif

#define WITHOUT_BAT     0xFF //��ر�����

/* ���𰴼�ʹ�ܱ�־λ �� ���������ϱ���־ */
#define GUARD_KEY_EN_FLG         1 //ʹ��λ       D0
#define ALARM_REP_FLG            2 //�ϱ��ɹ���¼λ   D1


extern uint16_t g_dwBatVol;
extern uint16_t g_dwInnerVol;
extern uint16_t g_dwBatNoLoadVol;
extern uint8_t g_nGuardEnFlg;
extern uint8_t g_nAlmRepFailCnt;

void ALM_TaskFunc(void);
u8 ALM_GetBatStatus(void);
u16 BAT_GetBatVol(void);
u8 ADC_GetAdcGmFlg(void);
u8 ALM_SetAlmStatus(u8 nNewAlmStat);
u8 ALM_ClrAlmStatus(u8 nNewAlmStat);
u16 ADC_GetVavleCtlVol(void);


#endif /* __ALARM_H__ */
