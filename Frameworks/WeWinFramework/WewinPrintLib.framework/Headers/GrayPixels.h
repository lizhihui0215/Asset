//
//  GrayPixels.h
//  WewinPrintLib
//
//  Created by 欧海川 on 2017/12/25.
//  Copyright © 2017年 WeWin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GrayPixels : NSObject

- (instancetype)initWithImage:(UIImage*)image;

/**
 根据像素点取二值

 @param x x
 @param y y
 @param cValue 阀值
 @return return value description
 */
- (int)grayAtX:(int)x y:(int)y cValue:(int)cValue;

@end
