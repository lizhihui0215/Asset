//
//  Block.h
//  PrintExtApi
//
//  Created by wewin on 2019/3/9.
//  Copyright © 2019 wewin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WwCommon.h"
/**
 * 基础Block
 */
@interface Block : NSObject

/**
 * 块类型
 */
@property(nonatomic, assign) WwBlockType type;

/**
 * x坐标，单位为毫米
 */
@property(nonatomic, assign) float x;

/**
 * y坐标，单位为毫米
 */
@property(nonatomic, assign) float y;

/**
 * 旋转方向（默认0度）
 */
@property(nonatomic, assign) WwOritention oritention;

/**
 * 根据dot转换后的x
 */
@property (nonatomic,readonly,assign) float transformX;

/**
 * 根据dot转换后的Y
 */
@property (nonatomic,readonly,assign) float transformY;




@end
