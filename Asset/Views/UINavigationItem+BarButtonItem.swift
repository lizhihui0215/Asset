//
//  UINavigationItem+BarButtonItem.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/16.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

extension UINavigationItem {
    enum LeftBarButtonStyle {
        case back
    }
    
    func setLeftBarButton(using style: LeftBarButtonStyle) {
        switch style {
        case .back:
            hidesBackButton = false
            backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
}
