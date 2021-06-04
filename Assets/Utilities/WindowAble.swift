//
// Created by Bernard on 2021/5/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol WindowAble {
    var window: UIWindow? { get }
}

extension WindowAble {
    var window: UIWindow? {
        UIApplication.shared.appDelegate.windowService?.window
    }
}
