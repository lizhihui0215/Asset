//
//  WwPrintUtils.h
//  PrintExtApi
//
//  Created by wewin on 2019/2/18.
//  Copyright © 2019 wewin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WewinPrintLib/WewinPrintLib.h>
#import "WwCommon.h"
@class Label;

/**
 打印设置回调
 
 @param result 打印设置结果
 */
typedef void(^IPrintSetCallback)(WwSetResult result);
/**
 打印结果回调
 
 @param result 打印结果
 */
typedef void(^IPrintLabelCallback)(WwPrintResult result);


/**
 单张打印成功时回调 （批量打印中，每打印成功一张 都会返回一次）

 @param result  result 单张打印结果 及其第几张  NSDictionary *dic = @{@"index":indexStr};
 */
typedef void(^IPrintPieceLabelCallback)(id result);
/**
 蓝牙操作回调

 @param state 蓝牙操作状态
 @param result 蓝牙返回结果---(返回类型详见具体使用方法)
 */
typedef void(^IPrintBleCallBack)(BaseState state,id result);


@interface WwPrintUtils : NSObject

/**
 连接模式  目前设置无作用  改为自动连接模式
 */
@property(nonatomic, assign) ConnectModel connectModel;

/**
 是否启用自动重连断开（默认NO）
 */
@property(nonatomic, assign) BOOL ifAutoReConnect;

/**
 是否使用报错提示UI （默认YES ，设置NO后将关闭SDK内部的报错提示框）
 */
@property(nonatomic, assign) BOOL ifAutoHint;

/**
 是否使用HUD （默认YES，设置NO后将关闭SDK内部的HUD）
 */
@property(nonatomic, assign) BOOL ifAutoHUD;

/**
 预览图是否采用出纸方向 (默认YES，设置NO后将无视Label旋转方向)
 */
@property(nonatomic, assign) BOOL previewFollowPaperDirection;

/**
 单张打印成功时回调  设置后将会收到单张打印后的结果回调
 */
@property(nonatomic,assign) IPrintPieceLabelCallback iPrintPieceLabelCallback;

/**
 是否开启调试模式 (默认为NO, 调试模式 会在预览图给 给各个模块加上背景色,以区分区域,打印无影响)
 */
@property(nonatomic,assign) BOOL ifDebug;

/*
 是否开启预览中的份数模式 默认NO
 */
@property(nonatomic,assign) BOOL ifShowPrintCountEdit;

/**
* xml报文
*/
@property(nonatomic,strong) NSString* popMessage;


/**
 * 初始化
 */
+ (instancetype)getInstance;

/**
 * 打印机单独黑度设置(P50、P30、P1200、H50)
 *
 * @param darkness          黑度值
 * @param iPrintSetCallback 设置结果回调
 */
- (void)singleSetDarkness:(int)darkness IPrintSetCallback:(IPrintSetCallback)iPrintSetCallback;

/**
 * P50 单独设置切刀
 *
 * @param cutOption         切刀枚举
 * @param iPrintSetCallback 设置结果回调
 */
-(void)singleSetCutOption:(CutOption)cutOption IPrintSetCallback:(IPrintSetCallback)iPrintSetCallback;

/**
 * 断开连接
 */
-(void)closeConnection;

/**
 * 异步打印操作
 *
 * @param array              标签数组(Label对象的NSArray)
 * @param iPrintLabelCallback 打印结果回调
 */
-(void)asyncPrint:(NSArray *)array IPrintLabelCallback:(IPrintLabelCallback)iPrintLabelCallback;

/**
 * 预览打印(异步)
 *
 * @param array              标签数组(Label对象NSArray)
 * @param iPrintLabelCallback 回调接口对象
 */
-(void)previewPrint:(NSArray *)array IPrintLabelCallback:(IPrintLabelCallback)iPrintLabelCallback;



/**
 返回蓝牙列表
 
 @param bleCallBack 返回参数1 state 搜索状态  返回参数2 result  NSArray 蓝牙列表
 */
- (void)searchDevice:(IPrintBleCallBack)bleCallBack;

/**
 连接蓝牙
 
 @param deviceName 蓝牙设备名称
 @param bleCallBack  返回参数1 state 连接状态  返回参数2 result 都是nil
 */
- (void)connectDevice:(NSString *)deviceName CallBack:(IPrintBleCallBack)bleCallBack;


/**
 * 获取API版本号
 */
-(NSString *)getVersion;




@end
