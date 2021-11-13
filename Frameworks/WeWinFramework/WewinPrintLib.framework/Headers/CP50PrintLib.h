//
//  CP50PrintLib.h
//  WewinPrintLib
//
//  Created by 刘良平 on 2018/12/5.
//  Copyright © 2018 WeWin. All rights reserved.
//

#import "BasePrintLib.h"

NS_ASSUME_NONNULL_BEGIN

/**
 证卡CP50
 */
@interface CP50PrintLib : BasePrintLib

/**
 单例
 
 @return 当前类
 */
+ (instancetype)sharePrintLib;

@end

NS_ASSUME_NONNULL_END
