#ifndef	__HISTORY_H
#define	__HISTORY_H
//******************文件包含*********************
#include "stm32f2xx.h"

//*******************宏定义***********************
#define	HISTORY_BUFFER_LEN		100//历史轨迹缓冲长度
//#define	HISTORY_WRITE_MODE		1//写入历史轨迹

//FLASH存储区域状态变量
typedef struct
{
        s16 	CurrentStep;	//当前步数
        s16	SectorStep;	//单个扇区总步数
        s16	LoopCount;	//循环存储标志
        s16 	CurrentSector;	//当前时间扇区
        s16	OldestSector;	//最老时间扇区
        s16	StartSector;	//存储地址开始扇区
        s16	EndSector;	//存储地址结束扇区
}HISTORY_AREA_STATUS;
//**************函数声明********************
/*********************************************************************
//函数名称	:History_TrackTimeTask
//功能		:记录历史轨迹，10秒钟记录一条，10秒调用1次
//备注		:一条历史轨迹内容是：
//		:系统时间（4字节），基本位置信息（28字节），平均速度1字节，总里程4字节，预留（6字节，填充0x00），校验码（1字节）
*********************************************************************/
FunctionalState History_TimeTask(void);
/*********************************************************************
//函数名称	:History_CheckPram
//功能		:检查输入参数的合法性
//输入		:时间、区域、源地址、字节数 
//返回		:成功返回SUCCESS,失败返回ERROR
//备注		:
*********************************************************************/
ErrorStatus History_CheckPram(u32 Time, u8 Area, uc8 *pBuffer, u8 ByteNum);
/*********************************************************************
//函数名称	:History_CheckFlashMemory
//功能		:检查FLASH存储空间数据包存储是否正确，若不正确，记录出错的扇区号和步数
//		:设置错误标志，若正确则获得FlashAreaStatus变量的初始值
//输入		:无
//输出		:FlashAreaStatus变量 
//返回		:正确返回SUCCESS,有误返回ERROR
//备注		:
*********************************************************************/
ErrorStatus History_CheckFlashArea(void);
/*********************************************************************
//函数名称	:History_CheckTrackArea
//功能		:检查历史轨迹区域 
//返回		:正确返回SUCCESS,有误返回ERROR
//备注		:
*********************************************************************/
ErrorStatus  History_CheckTrackArea(void);
/*********************************************************************
//函数名称	:History_CheckCarArea
//功能		:检查车辆状态区域 
//返回		:正确返回SUCCESS,有误返回ERROR
//备注		:
*********************************************************************/
ErrorStatus  History_CheckCarArea(void);
/*********************************************************************
//函数名称	:History_EraseTrackArea()
//功能		:擦除历史轨迹区域
//返回		:正确返回SUCCESS,有误返回ERROR
//备注		:
*********************************************************************/
void History_EraseTrackArea(void);
/*********************************************************************
//函数名称	:History_EraseCarArea()
//功能		:擦除车辆状态区域
//返回		:正确返回SUCCESS,有误返回ERROR
//备注		:
*********************************************************************/
void History_EraseCarArea(void);
/*********************************************************************
//函数名称	:History_SearchTrackStep(s16 *Sector, s16 *Step, u32 Time)
//功能		:查找给定时间的那一步历史轨迹
//输入		:给定时间Time
//输出		:对应的那条历史轨迹所在的扇区和步数
//备注		:
*********************************************************************/
void History_SearchTrackStep(s16 *Sector, s16 *Step, u32 Time);
/*********************************************************************
//函数名称	:History_SearchCarStep(s16 *Sector, s16 *Step, u32 Time)
//功能		:查找给定时间的那一步历史轨迹
//输入		:给定时间Time
//输出		:对应的那条历史轨迹所在的扇区和步数
//备注		:
*********************************************************************/
void History_SearchCarStep(s16 *Sector, s16 *Step, u32 Time);
/*********************************************************************
//函数名称	:History_GetTrackTotalList(void)
//功能		:获取轨迹的总条数
//备注		:
*********************************************************************/
unsigned short History_GetTrackTotalList(void);
/*********************************************************************
//函数名称	:History_Get2DayTrackListNum
//功能		:获取两个日历天轨迹总条数
//输入		:
//输出		:StartSector,StartStep反馈回开始的扇区和步数 
//返回		:2个日历天历史轨迹总条数
//备注		:
*********************************************************************/
unsigned short History_Get2DayTrackListNum(s16 *StartSector, s16 *StartStep);
/*********************************************************************
//函数名称	:History_Get2DayTrackListNum_C
//功能		:获取两个日历天轨迹总条数,包含了中间没有记录的条数
//输入		:
//输出		:StartSector,StartStep反馈回开始的扇区和步数 
//返回		:2个日历天历史轨迹总条数
//备注		:
*********************************************************************/
unsigned short History_Get2DayTrackListNum_C(s16 *StartSector, s16 *StartStep);
/*********************************************************************
//函数名称	:History_GetTrackListNum
//功能		:获取两个指定时间内历史轨迹的条数
//输入		:起始时间，结束时间
//备注		:
*********************************************************************/
unsigned short History_GetTrackListNum(u32 StartTime, u32 EndTime);
/*********************************************************************
//函数名称	:History_ReadMinuteSpeed
//功能		:读取每分钟平均速度
//输入		:起始扇区，起始步数，条数，条数最大为600
//备注		:系统时间4字节，报警位4字节，状态位4字节，瞬时速度1字节，预留6字节，校验1字节
//		:系统时间4字节，经度4字节，经度4字节，海拔2字节，平均速度1字节，总里程4字节，预留5字节，校验1字节
*********************************************************************/
u16 History_ReadMinuteSpeed(u8 *pBuffer, s16 StartSector, s16 StartStep, u16 StepNum);
/*********************************************************************
//函数名称	:History_ReadMinuteSpeed_C
//功能		:读取每分钟平均速度,时间上连续
//输入		:给定时间，条数，条数最大为600
//备注		:系统时间4字节，报警位4字节，状态位4字节，瞬时速度1字节，预留6字节，校验1字节
//		:系统时间4字节，经度4字节，经度4字节，海拔2字节，平均速度1字节，总里程4字节，预留5字节，校验1字节
*********************************************************************/
u16 History_ReadMinuteSpeed_C(u8 *pBuffer, u32 Time, s16 StepNum);
/*********************************************************************
//函数名称	:History_ReadMinutMile
//功能		:获取给定时间的里程值，单位为0.1公里
//输入		:给定时间
//备注		:
*********************************************************************/
u32 History_ReadMile(u32 Time);
/*************************************************************
** 函数名称: History_TimerTaskHandler
** 功能描述: 内部定时器处理函数
** 入口参数: 
** 出口参数: 
** 返回参数: 
** 全局变量: 无
** 调用模块: 无
*************************************************************/
void History_TimerTaskHandler(void);
/*************************************************************
** 函数名称: History_DisposeHistoryIndex
** 功能描述: 历史轨迹检索
** 入口参数: 
** 出口参数: 
** 返回参数: 
** 全局变量: 无
** 调用模块: 无
*************************************************************/
void History_DisposeRadioHistoryIndex(u8 *pBuffer, u16 BufferLen);
/*************************************************************
** 函数名称: History_DisposeRadioReadRecordByTime
** 功能描述:历史轨迹读取
** 入口参数: pBuffer,BufferLen
** 出口参数: 
** 返回参数: 
** 全局变量: 无
** 调用模块: 无
*************************************************************/
void History_DisposeRadioReadRecordByTime(u8 *pBuffer, u16 BufferLen);
#endif
/*******************************************************************************
 *                             end of module                                   *
 *******************************************************************************/