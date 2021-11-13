//
//  PrintLibUtil.h
//  WewinPrintLib
//
//  Created by 刘良平 on 2018/12/5.
//  Copyright © 2018 WeWin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceInfoModel.h"
@class UIImage;

NS_ASSUME_NONNULL_BEGIN

@interface PrintLibUtil : NSObject

/**
 封装打印进度数据

 @param pieceNum 当前打印的index
 @param totalNum 总共张数
 @return NSDictionary
 */
- (NSDictionary *)analyticPiecePrintDataWithPieceNum:(NSInteger)pieceNum totalNum:(NSInteger)totalNum;

/**
 解析心跳数据
 解析后的数据，注意：纵向DPI有的机型会返回VDeviceDPI_000，在这种情况下请在相关机型重新配置VDeviceDPI

 @param data 心跳data
 @param block 有转为NSDictionary的数据和DeviceInfoModel
 */
- (void)analyticHeartbeatData:(NSData *)data callBack:(void (^)(NSDictionary *analyticDic, DeviceInfoModel *device))block;


/**
 生成打印数据

 @param image iamge
 @param exchange 是否需要交换
 @return data
 */
- (NSData *)createPrintDataWithImage:(UIImage *)image needExchange:(BOOL)exchange;

/**
 异常情况的data回复

 @param state 异常情况
 @return data
 */
- (NSData *)createAbnormalStateDataWithString:(NSString *)state;

/**
 过滤蓝牙名称，只留字母和数字

 @param str str description
 @return return value description
 */
- (NSString *)filterString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
