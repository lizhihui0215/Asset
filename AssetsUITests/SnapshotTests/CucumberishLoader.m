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
    AssetsSnapshotTests_BDD_Tests *initilizerSteps = [AssetsSnapshotTests_BDD_Tests new];
    [initilizerSteps setUp];
    initilizerSteps.recordMode = recordMode;
    initilizerSteps.continueAfterFailure = recordMode;
    [initilizerSteps setUpSteps];
}
