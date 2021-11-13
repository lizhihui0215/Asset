//
//  WwCommon.h
//  PrintExtApi
//
//  Created by wewin on 2019/2/18.
//  Copyright © 2019 wewin. All rights reserved.
//

#ifndef WwCommon_h
#define WwCommon_h

/// 打印机设置结果类型
typedef NS_ENUM(NSUInteger, WwSetResult) {
    /// 黑度设置成功
    wwDarknessSetSuccess = 0,
    /// 黑度设置失败
    wwDarknessSetfailed = 1,
    /// 切刀设置成功
    wwCutOptionSetSuccess = 2,
    /// 切刀设置失败
    wwCutOptionSetfailed = 3
};

/**
 * 枚举打印机结果类型
 */
typedef NS_ENUM(NSUInteger, WwPrintResult) {
    /**
     * 未知异常
     */
    wwUnknowError = -1,
    /**
     * >连接操作异常
     */
    wwConnectError= -3,
    /**
     * 连接设备异常
     */
    wwConnectDeviceError = -4,
    /**
     * 创建标签异常
     */
    wwCreateLabelError = -5,
    /**
     * 打印异常
     */
    wwPrintError = -6,
    /**
     * 打印机被占用（或正在打印）
     */
    wwPrintingError = -7,
    /**
     * 预览异常
     */
    wwPreviewError = -8,
    /**
     * 标签类型错误
     */
    wwLabelTypeError = -9,
    /**
     * 打印成功
     */
    wwPrintSuccess = 0

};

/**
 * 标签类型
 */
typedef NS_ENUM(NSUInteger, WwLabelType) {
    /**
     * 保持默认
     */
    wwDefaultLabel,
    /**
     * 间隙标签
     */
    wwSpaceLabel,
    /**
     * 无间隙标签
     */
    wwDdfLabel,
    /**
     * 黑标标签
     */
    wwBlackMarkLabel
};

/**
 * 打印对象块类型
 */
typedef NS_ENUM(NSUInteger, WwBlockType) {
    
    /**
     * 文本
     */
    wwText = 0,
    /**
     * 条码
     */
    wwBarcode = 1,
    /**
     * 二维码
     */
    wwQrcode = 2,
    /**
     * 图片
     */
    wwGraphic = 3,
    /**
     * 线条
     */
    wwLine = 4,
    /**
     * 矩形
     */
    wwRect = 5
};

/**
 * 打印对象块旋转
 */
typedef NS_ENUM(NSUInteger, WwOritention) {
    
    /**
     * 0度
     */
    wwOritention0 = 0,
    /**
     * 90度
     */
    wwOritention90 = 90,
    /**
     * 180度
     */
    wwOritention180 = 180,
    /**
     * 270度
     */
    wwOritention270 = 270
};

/**
 * dot枚举
 */
typedef NS_ENUM(NSUInteger, WwDPIDots) {
    
    /**
     * 7个点 1mm
     */
    wwDots7 = 7,
    /**
     * 8个点 1mm
     */
    wwDots8 = 8,
    /**
     * 11个点 1mm
     */
    wwDots11 = 11,
    /**
     * 12个点 1mm
     */
    wwDots12 = 12,
    /**
     * 24个点 1mm
     */
    wwDots24 = 24
};

/**
 * HorizontalAlignment
 */
typedef NS_ENUM(NSUInteger, WwHorizontalAlignment) {
    
    /**
     * 居左
     */
    wwHorizontalLeft,
    /**
     * 居右
     */
    wwHorizontalRight,
    /**
     * 居中
     */
    wwHorizontalCenter
};

/**
 * VerticalAlignment
 */
typedef NS_ENUM(NSUInteger, WwVerticalAlignment) {
    
    /**
     * 居上
     */
    wwVerticalTop,
    /**
     * 居中
     */
    wwVerticalCenter,
    /**
     * 居下
     */
    wwVerticalBottom
};
//二维码容错等级
typedef NS_ENUM(NSUInteger, WwQrCodeCorrectionLevel) {
    
    /**
     * 最低级
     */
    wwQrCodeCorrectionLevelL,
    /**
     * 普通级
     */
    wwQrCodeCorrectionLevelM,
    /**
     * 较高级
     */
    wwQrCodeCorrectionLevelQ,
    /**
     * 最高级
     */
    wwQrCodeCorrectionLevelH
};



#endif
