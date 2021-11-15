//
//  AppDelegate.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import IQKeyboardManagerSwift
import UIKit

@UIApplicationMain
class AppDelegate: AppServiceManager {
    override var services: [AppService] {
        [
            WindowService(window: window),
            AppStartupService(),
            SirenService(),
        ]
    }
}
