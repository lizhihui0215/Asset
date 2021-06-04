//
//  UITestCase.swift
//  AssetsUITests
//
//  Created by lizhihui on 2021/5/17.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import FBSnapshotTestCase
import UITestHelper
import XCTest
@testable import Assets

public class UITestCase: FBSnapshotTestCase, UITestable {
    public override func setUp() {
        super.setUp()
        Assets.app.environment.environment
    }

    public override func tearDown() {
        super.tearDown()
    }
}
