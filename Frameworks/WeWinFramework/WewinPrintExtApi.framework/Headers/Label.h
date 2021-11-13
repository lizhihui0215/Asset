//
//  Label.h
//  PrintExtApi
//
//  Created by wewin on 2019/3/9.
//  Copyright © 2019 wewin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WwCommon.h"
#import "Block.h"
#import <WewinPrintLib/WewinPrintLib.h>
#import "TextBlock.h"
#import "BarcodeBlock.h"
#import "QrcodeBlock.h"
#import "GraphicBlock.h"
#import "LineBlock.h"
#import "RectBlock.h"

/**
 * 附加信息的key   标签标题
 */
extern NSString *const extInfoLabelTitle;


@interface Label : NSObject

/**
 * 标签宽度，单位为毫米
 */
@property(nonatomic, assign) float labelWidth;

/**
 * 标签高度，单位为毫米
 */
@property(nonatomic, assign) float labelHeight;

/**
 * 模板图名称，可以做预览用，可放置于assets或者drawable根目录
 * 当背景图时打印，当预览图时不打印
 * 可以用来当背景图,但请传入方向和尺寸与标签对应的图片 我们只会按比例拉伸
 * 传入图片名字  或  UIimage 图片对象
 * 当背景图时 需要将 isBackground 设置为yes
 */
@property(nonatomic) id previewGraphicName;

/**
 * 是否将previewGraphicName 设置为背景图，可以打印
 */
@property(nonatomic,assign) BOOL isBackground;

/**
 * rfid内容
 */
@property(nonatomic, strong) NSString *rfid;
/**
 * rfid存储区(默认ESP)
 */
@property(nonatomic,assign) RFIDStorageType rfidStorageType;

/**
 * rfid存储方式(默认单字符)
 */
@property(nonatomic,assign) RfidCharStorageType rfidCharStorageType;

/**
 * >=0：DDF 标签间隙(配合labelType设置，若无特殊要求，请勿设置)
 */
@property(nonatomic, assign) float ddfLength;

/**
* >=0：DDF 标签间隙(配合labelType设置，若无特殊要求，请勿设置)
*/
@property(nonatomic,assign) float ddfGpc;

/**
 * 标签类型(默认保持打印机默认值)
 */
@property(nonatomic, assign) WwLabelType labelType;

/**
 * 切纸模式
 */
@property(nonatomic, assign) CutOption cutOption;

/**
 * 标签旋转方向（默认0度）
 */
@property(nonatomic, assign) WwOritention oritention;

/**
 * 内容块数组
 */
@property(nonatomic, copy) NSArray *blocks;

/**
 * 根据dot转换后的宽度
 */
@property (nonatomic,readonly,assign) float transformLabelWidth;

/**
 * 根据dot转换后的高度
 */
@property (nonatomic,readonly,assign) float transformLabelHeight;


/**
 标签附带信息(将会显示在预览界面)
 */
@property (nonatomic,strong) NSString *labelInfo;

/**
P30、P31 标签检测专用(传入标签类型，将会在打印时匹配标签)
*/
@property (nonatomic,strong) NSString *detectionTypeKey;

/**
 附加信息
 */
@property (nonatomic,strong) NSDictionary *extInfo;




@end
