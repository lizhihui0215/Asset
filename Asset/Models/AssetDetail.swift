//
// Created by lizhihui on 2021/4/30.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetDetail: Codable {
    var status: Int
    var code: String
    var name: String
}

extension AssetDetail: Item {}
extension AssetDetail: AutoEquatable {}
extension AssetDetail: AutoCodable {
    static var defaultStatus = 0
    static var defaultCode = ""
    static var defaultName = ""
}
