//
//  WwBleConnect.h
//  WewinPrintLib
//
//  Created by 欧海川 on 17/12/18.
//  Copyright (c) 2017年 wewin. All rights reserved.
//

#import "BaseConnect.h"

@interface WwBleConnect : BaseConnect

+ (instancetype)shareWwBleConnect;

/**
 监听蓝牙状态

 @param block 回调
 */
- (void)observeCentralManagerState:(BaseCallBack)block;

/**
 搜索蓝牙
 */
- (void)search;

/**
 蓝牙根据identifier重连设备
 
 @param identifier identifier
 */
- (void)retrieveConnect:(NSString *)identifier;

@end
