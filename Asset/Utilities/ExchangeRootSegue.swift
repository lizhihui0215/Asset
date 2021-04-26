//
//  ExchangeRootSegue.swift
//  Asset
//
//  Created by lizhihui on 2021/4/22.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class ExchangeRootSegue: UIStoryboardSegue {
    override func perform() {
        guard let window = UIApplication.shared.windows.first else {
            return
        }

        window.rootViewController = destination
        window.makeKeyAndVisible()
    }
}
