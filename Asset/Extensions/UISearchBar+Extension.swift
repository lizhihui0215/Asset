//
// Created by lizhihui on 2021/4/24.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar: EAMExtended {}

public extension EAMExtension where ExtendedType: UISearchBar {
    var text: String {
        type.text ?? ""
    }
}
