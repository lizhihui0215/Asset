//
//  BaseConnect.h
//  WewinPrintLib
//
//  Created by 欧海川 on 2017/12/26.
//  Copyright © 2017年 WeWin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WewinMacro.h"

#define PieceReturnAdvName "advName"
#define PieceReturnIdentifier "identifier"
///心跳时间
extern NSTimeInterval const kHeartbeatTime;
extern int const kHeartTag;

typedef NS_ENUM(NSUInteger, ConnectModel) {
    ConnectModelWiFi = 1,
    ConnectModelBle  = 2
};

typedef NS_ENUM(NSUInteger, BaseHandle) {
    BaseHandleDevice,
    BaseHandleSearch,
    BaseHandleConnect,
    BaseHandleWriteData,
    BaseHandleRecvData,
    BaseHandleDispose
};

typedef NS_ENUM(NSUInteger, BaseState) {
    BaseDeviceStatePoweredOff,  //手机蓝牙关闭
    BaseDeviceStatePoweredOn,   //手机蓝牙打开
    BaseDeviceStateUnauthorized,//未获取权限
    BaseDeviceStateUnsupported,
    BaseDeviceStateUnknown,
    BaseDeviceStateResetting,
    
    BaseSearchStateSuccess,
    BaseSearchStatePiece,
    BaseSearchStateFailed,
    BaseSearchStateLocationRestricted, //未开启定位

    
    BaseConnectStateSuccess,
    BaseConnectStateConnectting,
    BaseConnectStateFailed,
    BaseConnectStateOccupy, //设备被占用
    BaseConnectStateNetRestricted, //连接WIFI网络受限
    
    BaseWriteDataStateSuccess, //发送数据成功
    BaseWriteDataStateFailed, //发送数据失败
    
    BaseRecvDataStateSuccess,
    BaseRecvDataStateFailed,
    
    BaseDisposeStateSuccess,
    BaseDisposeStateFailed
};

@class BaseConnect;

typedef void (^BaseCallBack)(BaseConnect *baseConnect, BaseHandle handle, BaseState state, NSData *recvData);
typedef void (^RevCallBack) (BaseConnect *baseConnect, BaseHandle handle, BaseState state, NSData *recvData);

@interface BaseConnect : NSObject
/// 是否打印日志,默认不打印
@property (nonatomic, assign) BOOL log;
///连接类型
@property (nonatomic, assign) ConnectModel connectModel;
///已连接设备名称
@property (nonatomic, copy) NSString *connectedName;
@property (nonatomic, copy) BaseCallBack baseCallBack;
@property (nonatomic, copy) RevCallBack revCallBack;


/**
 连接设备

 @param deviceName 设备名称
 */
- (void)connect:(NSString *)deviceName;

/**
 写入数据

 @param data data
 */
- (void)writeData:(NSData *)data;

/**
 WIFI读取数据，BLE无效
 */
- (void)readData;

/**
 断开连接
 */
- (void)dispose;

/**
 开启发送心跳
 */
- (void)startSendHeartbeat;

/**
 停止发送心跳
 */
- (void)stopSendHeartbeat;

@end
