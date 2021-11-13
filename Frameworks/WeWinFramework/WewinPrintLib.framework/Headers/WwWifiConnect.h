//
//  WwWifiConnect.h
//  WewinPrintLib
//
//  Created by 欧海川 on 2017/12/25.
//  Copyright © 2017年 WeWin. All rights reserved.
//

#import "BaseConnect.h"

extern NSString * const IP;
extern NSString * const P70SIP;
extern NSString * const ESPIP;
extern int const PORT;
extern NSTimeInterval const kTimeOut;

@interface WwWifiConnect : BaseConnect

+ (instancetype)shareWwWifiConnect;

/**
 搜索连接WIFI名字

 @param block 搜索成功，data包含一个字符串data（名字）
 */
- (void)searchWIFI:(BaseCallBack)block;

@end
