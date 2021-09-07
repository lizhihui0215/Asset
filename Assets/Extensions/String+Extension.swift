//
// Created by lizhihui on 2021/4/23.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: APIRouter.Constants) {}
}

extension String {
    var hex: String {
        let data = Data(utf8)
        return data.map { String(format: "%02x", $0) }.joined()
    }
}
