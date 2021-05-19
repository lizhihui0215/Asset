//
//  LoginScreenModel.swift
//  AssetsUITests
//
//  Created by lizhihui on 2021/5/17.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UITestHelper
import XCTest

class ServiceScreen: Screen {
    required init?(rawValue: Screen.RawValue) {
        super.init(rawValue: rawValue)
    }

    override var identifiableElement: XCUIElement {
        app.navigationBars.firstMatch
    }

    enum ScreenElements: String {
        case test
    }
}
