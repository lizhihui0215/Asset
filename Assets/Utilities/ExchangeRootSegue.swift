//
//  ExchangeRootSegue.swift
//  Assets
//
//  Created by lizhihui on 2021/4/22.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class ExchangeRootSegue: UIStoryboardSegue, WindowAble {
    override func perform() {
        guard let window = window else { return }
        window.rootViewController = destination
        window.makeKeyAndVisible()
    }
}
