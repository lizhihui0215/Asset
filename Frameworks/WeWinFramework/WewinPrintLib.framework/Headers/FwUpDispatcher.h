//
//  FwUpDispatcher.h
//  WewinPrintLib
//
//  Created by 欧海川 on 2018/6/21.
//  Copyright © 2018年 WeWin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define HardwareVerKey @"hardwareVer"//打印机的硬件版本号KEY
#define SoftVerKey @"softVer"//打印机的软件版本号KEY
#define SerialNumKey @"serialNum"//打印机的序列号KEY
#define BootloaderVerKey @"bootloaderVer"//Bootloader版本KEY
#define CurrentNumKey @"currentNum"//当前块号
#define TotalNumKey @"totalNum"//总块号

typedef NS_ENUM(NSUInteger, FwUpState) {
    FwUpStateDataEvent = 0,//升级数据问题
    FwUpStateOutTime   = 1,//超时
    FwUpStateUpdating  = 2,//升级中
    
    FwUpStateCheckFssVerSuccess = 3,//查询打印机硬件版本号,软件版本号,序列号成功
    FwUpStateCheckFssVerFailed  = 4,//查询打印机硬件版本号,软件版本号,序列号失败
    
    FwUpStateChange2IAPModelSuccess = 5,//让打印机由用户模式进入到IAP模式成功
    FwUpStateChange2IAPModelFailed  = 6,//让打印机由用户模式进入到IAP模式失败
    
    FwUpStateCheckBloaderVerSuccess = 7,//查询BootLoader版本号，握手指令成功
    FwUpStateCheckBloaderVerFailed  = 8,//查询BootLoader版本号，握手指令失败
    
    FwUpStateRequestSuccess = 9,//升级请求成功
    FwUpStateRequestFailed  = 10,//升级请求失败
    
    FwUpStateSendUpCurrentDataing = 11,//发送一块数据
    FwUpStateSendUpDataSuccess    = 12,//发送升级包数据成功
    FwUpStateSendUpDataFailed     = 13,//发送升级包数据失败
    
    FwUpStateWrite2FlashSuccess = 14,//写入flash成功
    FwUpStateWrite2FlashFailed  = 15,//写入flash失败
    
    FwUpStateChange2UserModelSuccess = 16,//进入用户程序成功
    FwUpStateChange2UserModelFailed  = 17,//进入用户程序失败
    
    FwUpStateCancel = 18,//升级取消
    FwUpStateInterrupt = 19, //升级被打断
    FwUpStateDisconnect = 20 //断开连接
};

@class BaseConnect;

typedef void(^UpdatePrinterCallBack)(FwUpState state, NSDictionary *result);

@interface FwUpDispatcher : NSObject

@property (nonatomic, strong) BaseConnect *baseConnect;

+ (instancetype)shareFwUpDispatcher;

/**
 查询打印机硬件版本号,软件版本号,序列号
 */
- (void)checkFssVerWithCallBack:(UpdatePrinterCallBack)block;

/**
 下发更新固件数据(更新入口函数)

 @param data data
 */
- (void)fwUpdateWithBinData:(NSData *)data callBack:(UpdatePrinterCallBack)block;

/**
 取消升级
 */
- (void)cancelUpdateWithCallBack:(UpdatePrinterCallBack)block;

@end
