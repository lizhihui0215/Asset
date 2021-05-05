//
// Created by lizhihui on 2021/5/4.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import Foundation
import IQKeyboardManagerSwift

class AppStartupService: NSObject, AppService {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
            NetworkActivityLogger.shared.startLogging()
        #endif
        DropDown.startListeningToKeyboard()
        IQKeyboardManager.shared.enable = true
        BDLocationService.shared.launchService()
        Appearance.shared.launch()
        #if MOCK
            APIMockService.shared.registerMockers()
        #endif
        return true
    }
}
