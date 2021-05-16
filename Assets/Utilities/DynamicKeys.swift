//
// Created by lizhihui on 2021/5/14.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct DynamicKey: CodingKey {
    var intValue: Int?

    var stringValue: String

    init?(stringValue: String) {
        self.stringValue = stringValue
    }

    init?(intValue: Int) {
        self.intValue = intValue
        stringValue = String(intValue)
    }
}
