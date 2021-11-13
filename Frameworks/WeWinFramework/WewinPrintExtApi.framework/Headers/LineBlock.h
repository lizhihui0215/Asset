//
//  LineBlock.h
//  PrintExtApi
//
//  Created by wewin on 2019/3/9.
//  Copyright © 2019 wewin. All rights reserved.
//

#import "Block.h"

@interface LineBlock : Block

/**
 * 宽度
 */
@property(nonatomic, assign) float width;

/**
 * 高度
 */
@property(nonatomic, assign) float height;

/**
 * 根据dot转换后的宽度
 */
@property (nonatomic,readonly,assign) float transformWidth;

/**
 * 根据dot转换后的高度
 */
@property (nonatomic,readonly,assign) float transformHeight;

@end
