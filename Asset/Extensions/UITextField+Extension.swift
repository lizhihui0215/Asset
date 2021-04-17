//
//  UITextField+Extension.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/16.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

extension UITextField: AEMExtended {}

extension AEMExtension where ExtendedType: UITextField {
    public var text: String {
        return type.text ?? ""
    }
}
