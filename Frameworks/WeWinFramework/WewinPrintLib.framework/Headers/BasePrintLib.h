//
//  BasePrintLib.h
//  WewinPrintLib
//
//  Created by 刘良平 on 2018/11/29.
//  Copyright © 2018 WeWin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WewinMacro.h"
#import "BaseConnect.h"
#import "DeviceInfoModel.h"
#import "PrintLibUtil.h"
#import "PrintLibHeader.h"
#import "PrintSettingModel.h"

@class BasePrintLib;
NS_ASSUME_NONNULL_BEGIN

@interface BasePrintLib : NSObject
///是否输出日志
@property (nonatomic, assign) BOOL log;

@property (nonatomic, strong, nullable) BaseConnect *baseConnect;

@property (nonatomic, strong, nullable) PrintSettingModel *printSetting;

@property (nonatomic, strong, nullable) DeviceInfoModel *deviceInfo;

///按照什么DPI生成的图片(默认为PrinterDPI_203)
@property (nonatomic, assign) PrinterDPI imageDPI;

///设备信息更新回调
@property (nonatomic, copy) UpdateDeviceInfoCallBack updateDeviceInfoCallBack;

#pragma mark - Method

/**
 主线程打印标签
 */
- (void)printLabelsWithLabelArray:(NSArray *)labelArray callBack:(PrintCallBack _Nullable)block;

/**
 替换当前打印数据数组中的某一个标签

 @param label 标签数组
 @param index index
 */
- (void)replaceLabel:(NSArray *)label atIndex:(NSInteger)index;

/**
 更改打印状态

 @param taskStatus 状态
 */
- (void)changePrintTaskStatus:(PrintTaskStatus)taskStatus;

//###############--Private Property--################--Private Property--###############
#pragma mark ---------------------------------------------------------------------------------------------------------------------------------------------
#pragma mark -- Private Property -- Private Property -- Private Property
///打印机是否正在打印
@property (nonatomic, assign) BOOL isPrinting;
///是否保存最爱
@property (nonatomic, assign) BOOL isFavourite;

///打印标签计数
@property (nonatomic, assign) NSInteger printingArrayIndex;
///发送块计数
@property (nonatomic, assign) NSInteger printingPieceIndex;
///多份打印的计数
@property (nonatomic, assign) NSInteger printingIndex;

///标签数组，外层数组装标签，内层数组装单个标签的各个元素（PrintModel）
@property (nonatomic, strong, nullable) NSMutableArray <NSArray *> *labelArray;
///存放一张标签生成的图片块的数组
@property (nonatomic, strong, nullable) NSArray *pieceImageArray;
///存放RFID字符串
@property (nonatomic, strong, nullable) NSMutableArray<NSString *> *rfidArray;
/// 超时计时器
@property (nonatomic, strong, nullable) dispatch_source_t timeOutTimer;

///打印机状态
@property (nonatomic, assign) PrintTaskStatus taskStatus;
///横向DPI
@property (nonatomic, assign) PrinterDPI hDeviceDpi;
///纵向DPI
@property (nonatomic, assign) PrinterDPI vDeviceDpi;
///PrintLibUtil
@property (nonatomic, strong) PrintLibUtil *util;
///基础数据回调
@property (nonatomic, copy, nullable) PrintCallBack printingCallBack;
///更新时间回调
@property (nonatomic, copy, nullable) PrintCallBack syncTimeCallBack;
///画布
@property (nonatomic, strong, nullable) UIImage *composeImage;

//########--Private Method--################--Private Method--###############
#pragma mark ---------------------------------------------------------------------------------------------------------------------------------------------

#pragma mark - Private Method

/**
 打印超时
 */
- (void)overPrinting;

- (void)sendHandShake:(PrintTaskStatus)taskStatus;
/**
 处理打印机回传数据

 @param recvBlockData 收到的data
 @param handle BaseHandle
 @param state BaseState
 @param heartLength 当前打印机的心跳长度
 @param defaultVDeviceDpi 当前打印机默认的纵向DPI
 @param creatBitmapBlock creatBitmapBlock
 @param send1bBlock send1bBlock
 */
- (void)dealWithBackData:(NSData *)recvBlockData
                  handle:(BaseHandle)handle
                   state:(BaseState)state
       defaultVDeviceDpi:(PrinterDPI)defaultVDeviceDpi
             heartLength:(int)heartLength
        creatBitmapBlock:(void(^)(void))creatBitmapBlock
             send1bBlock:(void(^)(void))send1bBlock;



@end

NS_ASSUME_NONNULL_END
