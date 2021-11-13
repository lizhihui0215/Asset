//
//  P20PrintLib.h
//  WewinPrintLib
//
//  Created by 刘良平 on 2019/4/3.
//  Copyright © 2019 WeWin. All rights reserved.
//

#import "BasePrintLib.h"

NS_ASSUME_NONNULL_BEGIN

@interface P20PrintLib : BasePrintLib
/**
 单例
 
 @return 当前类
 */
+ (instancetype)sharePrintLib;

@end

NS_ASSUME_NONNULL_END
