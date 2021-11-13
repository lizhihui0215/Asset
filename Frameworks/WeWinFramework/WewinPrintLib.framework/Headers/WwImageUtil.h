//
//  WwImageUtil.h
//  WewinPrintLib
//
//  Created by 欧海川 on 2017/12/22.
//  Copyright © 2017年 WeWin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WwImageUtil : NSObject


/**
 改变图片大小

 @param image 原始图片
 @param width 改变后的宽度
 @param height 高度
 @return 变化后的图
 */
+ (UIImage *)transformWidth:(UIImage*)image width:(CGFloat)width height:(CGFloat)height;//改变图形大小

/**
 图片剪切

 @param image 原始图片
 @param rect rect
 @return 剪切后得到的图
 */
+ (UIImage *)cutImageWithImage:(UIImage *)image rect:(CGRect)rect;

/**
 图片分块

 @param image 原始图片
 @param cropHeight 分块的高度
 @return 分块后的数组
 */
+ (NSArray *)cropPingImage:(UIImage *)image cropHeight:(int)cropHeight;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)getPartOfImage:(UIImage *)img rect:(CGRect)partRect;
+ (UIImage *)makeTransparentWhiteColorInImage:(UIImage *)image;
+ (void)saveImageToLocal:(UIImage *)image name:(NSString *)name;

@end
