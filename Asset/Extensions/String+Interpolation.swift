//
// Created by lizhihui on 2021/4/23.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: APIRouter.Keys) {
        appendLiteral(value.rawValue)
    }
}
