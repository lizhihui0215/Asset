//
//  TextBlock.h
//  PrintExtApi
//
//  Created by wewin on 2019/3/9.
//  Copyright © 2019 wewin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Block.h"
//设置文字样式
typedef NS_ENUM(NSUInteger, WwTextStyle) {
    //默认，无粗体斜体设置
    wwTextStyleNormal = 0,
    /// 设置粗体
    wwTextStyleBold = 1,
    // 设置斜体
    wwTextStyleItalics = 2,
    //粗体和斜体
    wwTextStyleBoldAndItalics = 3
};

//设置文字样式
typedef NS_ENUM(NSUInteger, WwTextFormat) {
    //默认，无粗体斜体设置
    wwTextFormatNormal = 0,
    //首个：符号后，其他行缩近
    wwTextFormatShrink = 1
};

@interface TextBlock : Block

/**
 * 最大字号（默认3） 毫米单位
 */
@property(nonatomic, assign) float fontSize;

/**
 * 字体样式(默认none)
 */
@property(nonatomic, assign) WwTextStyle textStyle;

/**
 * 字体名称（默认黑体）
 */
@property(nonatomic, strong) NSString *fontName;

/**
 * 是否自动换行 (默认Yes,设置为NO后将会只有一行文字)
 */
@property(nonatomic, assign) BOOL ifAutoLine;

/**
 * 配合ifAuoline使用，只有当ifAutoLine为NO时生效，默认为1，值必须 >0
 */
@property(nonatomic, assign) NSInteger lineNum;

/**
 * 用户自定义字体（若用户自定义字体，则字体名称和字体样式会失效）
 */
//@property(nonatomic, strong) UIFont *myFont;

/**
 * 最大打印宽度
 */
@property(nonatomic, assign) float maxW;


/**
 * 最大打印高度
 */
@property(nonatomic, assign) float maxH;

/**
 * 行间距
 */
@property(nonatomic, assign) float lineOffset;

/**
 * 内容
 */
@property(nonatomic, strong) NSString *content;

/**
 * 横向对齐方式（默认居左）
 */
@property(nonatomic, assign) WwHorizontalAlignment horizontalAlignment;

/**
 * 纵向对齐方式（默认上）
 */
@property(nonatomic, assign) WwVerticalAlignment verticalAlignment;

/**
 * 是否需要自适应（默认YES）
 */
@property(nonatomic, assign) BOOL needResize;

/**
 * 根据dot转换后的字体大小
 */
@property (nonatomic,readonly,assign) float transformFontSize;

/**
 * 根据dot转换后的最大宽度
 */
@property (nonatomic,readonly,assign) float transformMaxW;

/**
 * 根据dot转换后的最大高度
 */
@property (nonatomic,readonly,assign) float transformMaxH;

/**
 * 根据dot转换后的行间距
 */
@property (nonatomic,readonly,assign) float transformLineOffset;


/**
 * 用于设置文本段落格式
*/
@property(nonatomic, assign) WwTextFormat textFormat;
 
/**
 *  根据什么内容进行分段缩进  默认为"："
*/

@property(nonatomic, strong) NSString *shrinkIdentify;

/**
 *  设置段落格式为wwTextFormatShrink 后 缩进的字符数， 默认为-1 可不设置，wwTextFormatShrink情况下讲自动寻找第一个中文"："
*/
@property (nonatomic,assign) NSInteger shrinkWordNum;

//是否缩短之前加粗。默认NO
@property (nonatomic,assign) bool ifShrinkBold;



@end
