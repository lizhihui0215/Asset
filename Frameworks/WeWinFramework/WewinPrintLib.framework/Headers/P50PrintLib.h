//
//  P50PrintLib.h
//  WewinPrintLib
//
//  Created by 欧海川 on 2017/12/20.
//  Copyright © 2017年 WeWin. All rights reserved.
//

#import "BaseOldPrintLib.h"

typedef void(^P50CutterCallBack)(BOOL cutter);

@interface P50PrintLib : BaseOldPrintLib


+ (instancetype _Nonnull )shareP50PrintLib;

/**
 查询是否含有切刀
 */
- (void)checkIfThereIsACutter:(P50CutterCallBack _Nonnull )block;

@end
