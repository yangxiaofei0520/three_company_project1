// JX_LibType.h: 自定函数库与外部连接接口
#ifndef  __JX_LIB_TYPE_H__
#define  __JX_LIB_TYPE_H__

#if 0
/* 数据类型定义 */
#ifndef int8_t	//	在ARM_LINUX_GCC中不支持
	typedef signed char		int8_t;
#endif
#ifndef int16_t
	typedef signed short	int16_t;
#endif
#ifndef int32_t
	typedef signed int		int32_t;
#endif
#ifndef int64_t
	typedef signed  __int64	int64_t;
#endif
#ifndef float32_t
	typedef float			float32_t;
#endif
#ifndef float64_t
	typedef double			float64_t;
#endif

#ifndef uint8_t
	typedef unsigned char	uint8_t;
#endif
#ifndef uint16_t
	typedef unsigned short	uint16_t;
#endif
#ifndef uint32_t
	typedef unsigned int	uint32_t;
#endif
#ifndef uint64_t
	typedef unsigned __int64 uint64_t;
#endif
#ifndef  BOOL
    typedef  uint8_t    BOOL;
#endif

#ifndef  u32
	typedef uint32_t  u32;
#endif
#ifndef  u16
	typedef uint16_t u16;
#endif
#ifndef  u8
	typedef uint8_t  u8;
#endif
#endif


/* 真假判别定义 */
#ifndef  TRUE
    #define  TRUE       1
#endif
#ifndef  FALSE
    #define  FALSE      0
#endif

/* 返回值类型定义 */
#ifndef RTN_OK
	#define  RTN_OK			0
#endif
#ifndef RTN_FAIL
	#define  RTN_FAIL		-1
#endif
#ifndef RTN_CANCEL				// 在涉及用户界面时，需要知道用户取消操作，增加该返回声明
	#define RTN_CANCEL 		-2
#endif
#ifndef RTN_TIMEOUT				// 在涉及用户界面时，需要知道键盘操作超时状态
	#define RTN_TIMEOUT 	-3
#endif


#endif  /* __JX_LIB_TYPE_H__ */

/******************** (C) COPYRIGHT 2012 QIHUI Elec.,LTD *********END OF FILE***/
