//
//  PrintLibHeader.h
//  WewinPrintLib
//
//  Created by 刘良平 on 2019/4/9.
//  Copyright © 2019 WeWin. All rights reserved.
//

#ifndef PrintLibHeader_h
#define PrintLibHeader_h

#import "WewinMacro.h"

@class DeviceInfoModel;

/**
 所有跟打印相关的回调

 @param state state
 @param result 获取PrinterStatusKey
 */
typedef void(^PrintCallBack)(PrintState state, NSDictionary * _Nonnull result);

typedef void(^UpdateDeviceInfoCallBack)(DeviceInfoModel * _Nullable deviceInfo);

#endif /* PrintLibHeader_h */
