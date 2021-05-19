//
//  FastlaneScreenshot.swift
//  AssetsUITests
//
//  Created by lizhihui on 2021/5/17.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import XCTest

class FastlaneScreenshot: UITestCase {
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }
    
//    func testExample() {
//                snapshot("0Launch")
//    }
}
