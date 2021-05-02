//
// Created by lizhihui on 2021/5/2.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetDetail {
    var status: InventoryType
    var code: String
    var name: String
}

extension AssetDetail: AutoEquatable {}
extension AssetDetail: AutoCodable {
    static var defaultStatus: InventoryType = .nonInventory
    static var defaultCode = ""
    static var defaultName = ""
}
