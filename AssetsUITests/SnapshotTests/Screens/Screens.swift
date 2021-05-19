//
// Created by lizhihui on 2021/5/18.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UITestHelper
import XCTest

enum Screens: String {
    case login
    case service

    func screen<T: Screen>(testable: UITestable) -> T {
        let a = (screen: rawValue, testable: testable)
        return T(rawValue: a)!
    }
}
