//
//  CS18PrintLib.h
//  WewinPrintLib
//
//  Created by 刘良平 on 2018/12/17.
//  Copyright © 2018 WeWin. All rights reserved.
//

#import "BasePrintLib.h"

NS_ASSUME_NONNULL_BEGIN

@interface CS18PrintLib : BasePrintLib

/**
 单例
 
 @return 当前类
 */
+ (instancetype)sharePrintLib;

/**
 同步打印机时间
 
 @param date data
 */
- (void)syncTime:(NSDate *)date choiceType:(CS18ChoiceType)type callBack:(PrintCallBack)block;


@end

NS_ASSUME_NONNULL_END
