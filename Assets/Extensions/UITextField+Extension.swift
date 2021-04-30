//
//  UITextField+Extension.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/16.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

extension UITextField: EAMExtended {}

public extension EAMExtension where ExtendedType: UITextField {
    var text: String {
        type.text ?? App.Constants.Default.text
    }
}
