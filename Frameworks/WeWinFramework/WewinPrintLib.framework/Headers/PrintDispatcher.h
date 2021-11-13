//
//  PrintDispatcher.h
//  WewinPrintLib
//
//  Created by 欧海川 on 2017/12/20.
//  Copyright © 2017年 WeWin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrintSettingModel.h"
#import "DeviceInfoModel.h"
#import "PrintLibHeader.h"
#import "BaseConnect.h"

@interface PrintDispatcher : NSObject

///是否输出打印日志
@property (nonatomic, assign) BOOL log;

///是否连接打印机
@property (nonatomic, assign) BOOL isConnected;

///支持ProtocolTypeNew的机型实时读取打印机信息
@property (nonatomic, strong, readonly, nullable) DeviceInfoModel *deviceInfo;

///基础连接
@property (nonatomic, strong, nullable) BaseConnect * baseConnect;

///通信协议类型 默认为：ProtocolTypeOld
@property (nonatomic, assign, readonly) ProtocolType protocolType;

/**
 *按照什么DPI生成的图片，各机型有所不同，具体点数请参考PrinterDPI
 *eg. 如标签实际宽度50mm，打印机纵向DPI为PrinterDPI_300，则 300/25.4≈11.81个点(1英寸=25.4mm)，
 *生成图片高度度= 11.81*50，最终宽度四舍五入取整591，则生成打印图片的画布宽度为591
 */
@property (nonatomic, assign, readonly) PrinterDPI imageDPI;

///默认打印参数设置
@property (nonatomic, strong, nonnull) PrintSettingModel *defaultPrintSetting;

/**
 单例

 @return 当前类
 */
+ (instancetype _Nonnull )sharePrintDispatcher;

/**
 打印标签
 */
- (void)printLabelsWithArray:(NSArray * _Nonnull)labelArray callBack:(PrintCallBack _Nonnull)block;

/**
 *ProtocolTypeNew替换当前打印数据数组中的某一个标签
 *用于多标签打印时，解决内存溢出问题
 *e.g. 打印10条， labelArray = @[@[label], @[label], @[label], @[], @[], @[], @[], @[], @[], @[],]
 *     然后在PrintStatePieceFinish回调中，添加 index = 3，4，5.....后续数据
 
 @param label 标签数组
 @param index index
 */
- (void)replaceLabel:(NSArray *_Nonnull)label atIndex:(NSInteger)index;

/**
 *握手
 *ProtocolTypeNew的机型读取打印机数据，请读取deviceInfo
 */
- (void)sendHandShakeWithCallBack:(PrintCallBack _Nonnull)block;

/**
 黑度设置，仅支持P1200，P30，P50。其他机型使用该方法无效，请使用darkNess参数设置

 @param darkNess 黑度 0~20
 */
- (void)sendDarkNess:(int)darkNess callBack:(PrintCallBack _Nonnull)block;

/**
 切刀设置，仅支持P50。其他机型使用该方法无效，请使用cutOption参数设置

 @param cutOption 切刀设置类型
 */
- (void)sendCutOption:(CutOption)cutOption callBack:(PrintCallBack _Nonnull)block;

/**
 暂停，继续、取消打印任务

 @param taskStatus 打印状态
 */
- (void)changePrintTaskStatus:(PrintTaskStatus)taskStatus;

/**
 单独查询打印机DPI,支持P1200、P30、P50、P70、P70S，ProtocolTypeNew机型请查询deviceInfo
 */
- (void)checkPrinterDPIWithCallBack:(PrintCallBack _Nonnull)block;

/**
 打印机状态查询，不支持P1200

 @param block callBack
 */
- (void)checkPrinterStatus:(PrintCallBack _Nonnull)block;

/**
 同步时间到CS18打印机，仅支持CS18，其他机型使用该方法无效

 @param date 时间
 @param type 签类型
 @param block 回调
 */
- (void)syncCS18Time:(NSDate *_Nonnull)date choiceType:(CS18ChoiceType)type callBack:(PrintCallBack _Nonnull)block;

@end
