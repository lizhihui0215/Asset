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
    BOOL recordMode = NO;
    [Cucumberish instance].testTargetSrcRoot = SRC_ROOT;
    AssetsSnapshootTests_BDD_Tests *initilizerSteps = [AssetsSnapshootTests_BDD_Tests new];
    [initilizerSteps setUp];
    initilizerSteps.recordMode = recordMode;
    [initilizerSteps setUpSteps];
}
