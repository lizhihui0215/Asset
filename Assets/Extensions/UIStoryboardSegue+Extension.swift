//
// Created by lizhihui on 2021/4/30.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboardSegue {
    func destination<T: UIViewController>() -> T? {
        destination as? T
    }
}
