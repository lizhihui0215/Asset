//
//  UIView+Accessibility.swift
//  Assets
//
//  Created by lizhihui on 2021/5/17.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    // MARK: - accessibilityDesignable

    @IBInspectable open var accessibilityId: String? {
        get { accessibilityIdentifier }
        set {
            accessibilityIdentifier = newValue
        }
    }
}
