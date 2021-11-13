//
//  QrcodeBlock.h
//  PrintExtApi
//
//  Created by wewin on 2019/3/9.
//  Copyright © 2019 wewin. All rights reserved.
//

#import "Block.h"

@interface QrcodeBlock : Block

/**
 * 二维码宽度
 */
@property(nonatomic, assign) float width;

/**
 * 是否需要强制固定大小，默认为NO  二维码具有最小大小，如果size设置得比最小大小小，请使用此属性
 */
@property(nonatomic, assign) BOOL needResize;

/**
 * 容错等级 默认为L
 */
@property(nonatomic, assign) WwQrCodeCorrectionLevel qrCodeCorrectionLeve;

/**
 * 二维码内容
 */
@property(nonatomic, strong) NSString *content;

/**
 * 根据dot转换后的宽度
 */
@property (nonatomic,readonly,assign) float transformWidth;

/**
 是否反色 (默认NO)
 */
@property(nonatomic, assign) BOOL needReverseColor;

/**
是否启用预览静态二维码 (默认NO)
*/
@property(nonatomic, assign) BOOL ifPreViewStatic;


/**
 是否在二维码上添加Logo  Logo可以为UIImage 或 图片名字
 可不设置size， logo的大小为二维码实际大小的0.07
 */
@property(nonatomic) id logo;

/**
二维码Logo手动设置大小，一般默认为0,0，可不设置，由SDK计算
 */
@property(nonatomic,assign) CGSize logoSize;

/**
 * 根据dot转换后的logoSize
 */
@property (nonatomic,readonly,assign) CGSize transformlogoSize;


@end
