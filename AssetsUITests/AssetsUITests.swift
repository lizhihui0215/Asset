//
//  AssetsUITests.swift
//  AssetsUITests
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import Cucumberish
public class CucumberishInitializer: NSObject {
    @objc public class func CucumberishSwiftInit()
    {

        //Create a bundle for the folder that contains your "Features" folder. In this example, the CucumberishInitializer.swift file is in the same directory as the "Features" folder.
        let bundle = Bundle(for: CucumberishInitializer.self)

        //All step definitions should be done before calling the following method
        Cucumberish.executeFeatures(inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }
}
