//
//  BarcodeBlock.h
//  PrintExtApi
//
//  Created by wewin on 2019/3/9.
//  Copyright © 2019 wewin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Block.h"

@interface BarcodeBlock : Block

/**
 * 条码宽度
 */
@property(nonatomic, assign) float width;

/**
 * 条码高度
 */
@property(nonatomic, assign) float height;

/**
 * 是否需要强制固定大小
 */
@property(nonatomic, assign) BOOL needResize;

/**
 * 条码内容(一个长度为 1-100 的字符串)
 */
@property(nonatomic, strong) NSString *content;

/**
 * 根据dot转换后的宽度
 */
@property (nonatomic,readonly,assign) float transformWidth;

/**
 * 根据dot转换后的高度
 */
@property (nonatomic,readonly,assign) float transformHeight;

/**
 是否反色 (默认NO)
 */
@property(nonatomic, assign) BOOL needReverseColor;

@end
