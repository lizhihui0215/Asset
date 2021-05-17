//
//  AssetsSnapshootTests_BDD_Tests.swift
//  AssetsSnapshootTests_BDD_Tests
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Cucumberish
import Foundation

@objc(AssetsSnapshootTests_BDD_Tests)
public class AssetsSnapshootTests_BDD_Tests: UITestCase {
    @objc public func setUpSteps() {
        let bundle = Bundle(for: AssetsSnapshootTests_BDD_Tests.self)

        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }
}
