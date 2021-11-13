//
//  WewinMacro.h
//  WewinPrintLib
//
//  Created by 刘良平 on 2018/10/30.
//  Copyright © 2018 WeWin. All rights reserved.
//

#ifndef WewinMacro_h
#define WewinMacro_h

#import "WewinConstants.h"

//机型匹配
#define MATCH_DEVICE(deviceName, prefix) (([deviceName hasPrefix:prefix]) ? YES : NO)

//以下设备为旧协议begin
#define DEVICENAME_P1200(deviceName) MATCH_DEVICE(deviceName, @"P1200")
#define DEVICENAME_P30(deviceName)   MATCH_DEVICE(deviceName, @"P30")
#define DEVICENAME_P50(deviceName)   MATCH_DEVICE(deviceName, @"P50")
#define DEVICENAME_P70(deviceName)   MATCH_DEVICE(deviceName, @"P70") && !MATCH_DEVICE(deviceName, @"P70S")
#define DEVICENAME_P70S(deviceName)  MATCH_DEVICE(deviceName, @"P70S")
//end

//以下设备为新协议
#define DEVICENAME_P51(deviceName)   MATCH_DEVICE(deviceName, @"P51")
#define DEVICENAME_C18(deviceName)   MATCH_DEVICE(deviceName, @"C18")
#define DEVICENAME_CS18(deviceName)  MATCH_DEVICE(deviceName, @"CS18")
#define DEVICENAME_SYD(deviceName)   MATCH_DEVICE(deviceName, @"TP60") || MATCH_DEVICE(deviceName, @"DS60")
#define DEVICENAME_WD(deviceName)    MATCH_DEVICE(deviceName, @"HS50") || MATCH_DEVICE(deviceName, @"DS50") ||\
                                     MATCH_DEVICE(deviceName, @"WD")   || MATCH_DEVICE(deviceName, @"DS51")
#define DEVICENAME_CP50(deviceName)  MATCH_DEVICE(deviceName, @"CP50")
#define DEVICENAME_P31(deviceName)   MATCH_DEVICE(deviceName, @"P31")
#define DEVICENAME_P20(deviceName)   MATCH_DEVICE(deviceName, @"P20")

#define DEF_IS_WEWIN_PRINTER(name) DEVICENAME_P30(name)   || DEVICENAME_P1200(name) || DEVICENAME_P50(name)  ||\
                                   (DEVICENAME_P70(name)) || DEVICENAME_P70S(name)  || DEVICENAME_CS18(name) ||\
                                   DEVICENAME_C18(name)   || DEVICENAME_SYD(name)   || DEVICENAME_P51(name)  ||\
                                   DEVICENAME_WD(name)    || DEVICENAME_CP50(name)  || DEVICENAME_P31(name)  ||\
                                   DEVICENAME_P20(name)  

#define DEF_PRINTER_STATUS(status) @{PrinterStatusKey: status}

typedef NS_ENUM(NSInteger, DeviceDPI) {
    DeviceDPI178_300 = 0,//CS18         1毫米7个点
    DeviceDPI178_178 = 1,//C18          1毫米7个点
    DeviceDPI203_203 = 2,//常规          1毫米8个点
    DeviceDPI300_203 = 3,//P50          1毫米8个点
    DeviceDPI300_300 = 4,//P70、P51     1毫米12个点
    DeviceDPI203_300 = 5 //SYD          1毫米8个点
}; //打印机横纵向DPI

typedef NS_ENUM(NSUInteger, PrinterDPI) {
    PrinterDPI_000 = 0,   //根据该机型之前的设计给定纵向DPI
    PrinterDPI_180 = 180, //1mm7.1个点
    PrinterDPI_203 = 203, //1mm8个点
    PrinterDPI_288 = 288, //1mm11.34个点
    PrinterDPI_300 = 300, //1mm11.81个点
    PrinterDPI_600 = 600  //1mm23.62个点
};//打印DPI

typedef NS_ENUM(NSUInteger, PrintState) {
    PrintStateStart,   //打印开始
    PrintStatePrinting,//打印中
    PrintStateEnd,     //打印结束
    
    PrintStateSuccess,     //打印成功
    PrintStatePieceSuccess,//单张打印成功
    PrintStatePieceFinish, //单张打印count张全部打印完成
    
    PrintStatePause,    //打印暂停
    PrintStateResume,   //打印恢复
    PrintStateInterrupt,//打印中断
    PrintStateCancel,   //打印取消
    PrintStateFailed,   //打印失败、出错
    PrintStateTimeOut,  //打印超时

    PrintStateUnSupport,         //不支持
    PrintStateContentEvent,      //打印内容出错
    PrintStateCountEvent,        //打印数量有错
    PrintStateWidthOrHeightEvent,//打印宽高有错
    PrintStateDeviceEvent,       //设备问题
    PrintStateDeviceNotConnected,//设备未连接
    PrintStateDataEvent,         //数据问题

    SendHandShakeSuccess,//握手成功
    SendHandShakeFailed, //握手失败
    
    HeartbeatSuccess,//心跳成功
    HeartbeatFailed, //心跳失败
    
    SendDarkNessSuccess,//设置黑度成功
    SendDarkNessFailed, //设置黑度失败
    
    SendCutOptionSuccess,//设置切刀参数成功
    SendCutOptionFailed, //设置切刀参数失败
    
    CheckPrinterDPISuccess,//单独查询DPI成功
    CheckPrinterDPIFailed, //单独查询DPI失败
    
    SysncTimeSuccess,//同步时间成功
    SysncTimeFailed, //同步时间失败
    
    PrintStateStatusNormal,  //打印机状态正常
    PrintStateStatusAbnormal //打印机状态异常
};

typedef NS_ENUM(NSUInteger, CutOption) {    
    CutOptionTear                    = 0,//撕纸
    CutOptionCut                     = 1,//切纸
    CutOptionContinuousCutting       = 2,//C18，P70连续自动切纸
    CutOptionCutAfterTheEnd          = 3,//C18，P70结束后切纸
    CutOptionContinuousManualCutting = 4,//P70连续手动切纸
    CutOptionWithoutCut              = 5 //无切刀设置
}; //切刀设置模式

typedef NS_ENUM(NSUInteger, CardThickness) {
    CardThickness00 = 0, //0.5mm 未启用
    CardThickness01 = 1, //0.6mm
    CardThickness02 = 2, //0.8mm
    CardThickness03 = 3, //1.0mm
    CardThickness04 = 4  //1.2mm 未启用
}; //证卡卡片厚度

typedef NS_ENUM(NSUInteger, AdapterStatus) {
    AdapterStatusUncharged = 0,//未充电
    AdapterStatusCharging  = 1,//充电中
    AdapterStatusNobattery = 2,//没有电池
    AdapterStatusUnknown   = 3 //未知
};

typedef NS_ENUM(NSUInteger, PrintTaskStatus) {
    PrintTaskStatusCheck  = 0,//查询
    PrintTaskStatusPause  = 1,//暂停
    PrintTaskStatusResume = 2,//恢复
    PrintTaskStatusCancel = 3,//取消
    PrintTaskStatusPrinterPause = 4, //打印机暂停，不可用
    PrintTaskStatusPrinterCancel = 5 //打印机取消，不可用
};

typedef NS_ENUM(NSUInteger, LabelSharpness) {
    LabelSharpnessSD = 1, //低清晰度，但走纸速度较快
    LabelSharpnessHD = 2, //高清晰度，但走纸速度较慢
};//标签清晰度，目前仅支持P51

typedef NS_ENUM(NSUInteger, ProtocolType) {
    ProtocolTypeOld = 1, //数据先传后打印
    ProtocolTypeNew = 2, //数据边传边打印
};//打印协议类型

typedef NS_ENUM(NSUInteger, RFIDStorageType) {
    RFIDStorageTypeRES      = 0, //RES
    RFIDStorageTypeUIIOrESP = 1, //UII|ESP
    RFIDStorageTypeTID      = 2, //TID
    RFIDStorageTypeUSER     = 3  //USER
};//RFID存储区类型

typedef NS_ENUM(NSUInteger, BlackMarkType) {
    BlackMarkTypeDefault = 0, //默认打印机设置
    BlackMarkTypeBlack   = 1, //黑标
    BlackMarkTypeNo      = 2, //非黑标
};

typedef NS_ENUM(NSUInteger, RfidCharStorageType) {
    RfidCharStorageTypeSingle = 0, //ASCII
    RfidCharStorageTypeDouble = 1, //只能0~9 A~F，不符会报RFID异常
};//RFID字符存储类型

typedef NS_ENUM(NSUInteger, PrinterStatus) {
    PrinterStatusNormal                = 0x00, //正常
    PrinterStatusNoLabelBox            = 0x01, //请放入标签盒
    PrinterStatusEPROMError            = 0x02, //EPROM 错误
    PrinterStatusNoLabels              = 0x03, //标签用完
    PrinterStatusUnrecognizedLabel     = 0x04, //不能识别的标签
    PrinterStatusUnlockToPutInLabelBox = 0x05, //解锁放入标签盒
    PrinterStatusLockTheLid            = 0x06, //请合上锁紧杆
    PrinterStatusSecurityLineError     = 0x07, //防伪线路故障
    PrinterStatusHighTemperature       = 0x08, //打印头温度过高
    PrinterStatusCutterStuck           = 0x09, //切刀卡住
    PrinterStatusRibbonAbnormality     = 0x0a, //碳带异常
    PrinterStatusPrinterBusy           = 0x0b, //打印机忙
    PrinterStatusWrongAdapter          = 0x0c, //适配器错误
    PrinterStatusLabelStuck            = 0x0d, //卡纸
    PrinterStatusShutDown              = 0x0e, //已关机
    PrinterStatusLabelAbnormality      = 0x0f, //标签异常
    PrinterStatusRFIDAbnormality       = 0x10, //RFID异常
    PrinterStatusUnknow                = 0xff, //未知状态
};//ProtocolTypeNew打印机状态

typedef NS_ENUM(NSUInteger, CS18ChoiceType) {
    CS18ChoiceTypeNotSetting = 0xff, //只同步时间，不打印
    CS18ChoiceTypeAnswer     = 0x01, //同步时间+打印答案
    CS18ChoiceTypeCalendar   = 0x02, //同步时间+打印今日
};//CS18灵魂按键同步类型

//typedef NS_ENUM(NSUInteger, BluetoothState) {
//    BluetoothStatePoweredOff,  //手机蓝牙关闭
//    BluetoothStatePoweredOn,   //手机蓝牙打开
//    BluetoothStateUnauthorized,//未获取权限
//    BluetoothStateUnsupported,
//    BluetoothStateUnknown,
//    BluetoothStateResetting,
//};//蓝牙监听的状态
//
//typedef NS_ENUM(NSUInteger, SearchBluetoothState) {
//    SearchBluetoothStatePoweredOff   = BluetoothStatePoweredOff,  //手机蓝牙关闭
//    SearchBluetoothStatePoweredOn    = BluetoothStatePoweredOn,   //手机蓝牙打开
//    SearchBluetoothStateUnauthorized = BluetoothStateUnauthorized,//未获取权限
//    SearchBluetoothStateeUnsupported = BluetoothStateUnsupported, //设备不支持蓝牙
//    SearchBluetoothStateUnknown      = BluetoothStateUnknown,     //蓝牙未知错误
//    SearchBluetoothStateResetting    = BluetoothStateResetting,   //蓝牙重置
//
//    SearchBluetoothStateSuccess,
//    SearchBluetoothStatePiece,
//    SearchBluetoothStateFailed,
//};//搜索蓝牙的回调枚举
//
//typedef NS_ENUM(NSUInteger, SearchWIFIState) {
//    SearchWIFIStateFail,
//    SearchWIFIStateSuccess,
//    SearchWIFIStateLocationRestricted,//未开启定位
//};//搜索WIFI的回调枚举
//
//typedef NS_ENUM(NSUInteger, ConnectState) {
//    ConnectStatePoweredOff   = BluetoothStatePoweredOff,  //手机蓝牙关闭
//    ConnectStatePoweredOn    = BluetoothStatePoweredOn,   //手机蓝牙打开
//    ConnectStateUnauthorized = BluetoothStateUnauthorized,//未获取权限
//    ConnectStateUnsupported  = BluetoothStateUnsupported,
//    ConnectStateUnknown      = BluetoothStateUnknown,
//    ConnectStateResetting    = BluetoothStateResetting,
//
//    ConnectStateConnectting,
//    ConnectStateSuccess,
//    ConnectStateFail,
//};//连接设备的状态枚举
//
//typedef NS_ENUM(NSUInteger, DisposeState) {
//    DisposeStateFail,
//    DisposeStateSuccess,
//};//断开设备的状态枚举

#endif /* WewinMacro_h */
