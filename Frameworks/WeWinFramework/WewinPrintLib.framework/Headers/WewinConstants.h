//
//  WewinConstants.h
//  WewinPrintLib
//
//  Created by 刘良平 on 2018/10/30.
//  Copyright © 2018 WeWin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSString * const PrintingPieceNumKey; //打印中单张计数
extern NSString * const PrintingTotalNumKey; //打印中总共张计数
extern NSString * const kPrintingFinishNumKey; //某张标签打印count张后的index计数

extern NSString * const DeviceDPIKey;        //打印机DPI
extern NSString * const HDeviceDPIKey;
extern NSString * const VDeviceDPIKey;       //打印机纵向DPI
extern NSString * const PrinterStatusKey;    //打印机状态KEY
extern NSString * const kCS18ChoiceTypeKey;  //CS18签KEY
extern NSString * const AdapterStatusKey;    //适配器状态KEY
extern NSString * const ElectricQuantityKey; //电量KEY
extern NSString * const DarkNessKey;         //黑度KEY
extern NSString * const CutOptionKey;        //切刀KEY
extern NSString * const kCardThickness;      //证卡卡片厚度KEY
extern NSString * const LabelHeightKey;      //标签高度KEY
extern NSString * const PrinterTypeKey;      //打印机类型KEY

extern NSString * const LabelRemainLengthKey; //碳带/标签剩余长度KEY
extern NSString * const LabelTotalLengthKey;  //碳带/标签总长度
extern NSString * const LabelTypeKey;         //标签型号
extern NSString * const RibbonCodeKey;        //碳带编码
extern NSString * const PrintSpeedKey;        //打印速度
extern NSString * const PrintTaskStateKey;    //打印任务状态

extern NSString * const PrinterStatusStr00; //全部正常
extern NSString * const PrinterStatusStr01; //请放入标签盒
extern NSString * const PrinterStatusStr02; //EPROM错误
extern NSString * const PrinterStatusStr03; //标签用完
extern NSString * const PrinterStatusStr04; //不能识别的标签
extern NSString * const PrinterStatusStr05; //解锁放入标签盒
extern NSString * const PrinterStatusStr06; //请合上锁紧杆
extern NSString * const PrinterStatusStr07; //防伪线路故障
extern NSString * const PrinterStatusStr08; //高温预警
extern NSString * const PrinterStatusStr09; //切刀异常
extern NSString * const PrinterStatusStr0a; //碳带异常
extern NSString * const PrinterStatusStr0b; //设备忙
extern NSString * const PrinterStatusStr0c; //适配器错误
extern NSString * const PrinterStatusStr0d; //卡纸
extern NSString * const PrinterStatusStr0e; //已关机
extern NSString * const PrinterStatusStr0f; //标签异常
extern NSString * const PrinterStatusStrff; //未知状态
extern NSString * const PrinterStatusStr10; //RFID异常（如：数据长度超过RFID存储空间）

extern NSArray * const WewinPrinterArray;



//计时器
extern void dispatchTimer(double timeInterval,void (^handler)(dispatch_source_t timer));

@interface WewinConstants : NSObject

@end

NS_ASSUME_NONNULL_END
