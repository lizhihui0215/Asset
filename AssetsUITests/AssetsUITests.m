//
//  AssetsUITests.m
//  AssetsUITests
//
//  Created by lizhihui on 2021/5/11.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

#import <AssetsUITests-Swift.h>
#import <Cucumberish/Cucumberish.h>

__attribute__((constructor))
void CucumberishInit(void) {
   [Cucumberish instance].testTargetSrcRoot = SRC_ROOT;
   [CucumberishInitializer CucumberishSwiftInit];
}
