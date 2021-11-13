//
//  GraphicBlock.h
//  PrintExtApi
//
//  Created by wewin on 2019/3/9.
//  Copyright © 2019 wewin. All rights reserved.
//

#import "Block.h"

@interface GraphicBlock : Block

/**
 * 图片宽度，graphic为bitmap时，为了不再丢失分辨率，宽度参数无效
 */
@property(nonatomic, assign) float width;

/**
 * 图片高度，graphic为bitmap时，为了不再丢失分辨率，高度参数无效
 */
@property(nonatomic, assign) float height;


/**
 * 图名称，也可是UIImage对象
 */
@property(nonatomic, strong) NSObject *graphic;

/**
 * 根据dot转换后的宽度
 */
@property (nonatomic,readonly,assign) float transformWidth;

/**
 * 根据dot转换后的高度
 */
@property (nonatomic,readonly,assign) float transformHeight;

@end
