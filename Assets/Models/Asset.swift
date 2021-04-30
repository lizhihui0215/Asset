//
// Created by lizhihui on 2021/4/30.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct Asset: Codable {
    var status: InventoryType
    var code: String
    var name: String
}

extension Asset: Item {}
extension Asset: AutoEquatable {}
extension Asset: AutoCodable {
    static var defaultStatus: InventoryType = .nonInventory
    static var defaultCode = ""
    static var defaultName = ""
}

extension InventoryType: AutoCodable {}
