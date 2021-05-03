//
// Created by lizhihui on 2021/4/30.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct Asset {
    var checkStatus: InventoryType
    var tagNumber: String
    var assetName: String
    var isCheck: String
    var assetId: String
    var checkStatusName: String
}

extension Asset: Item {}
extension Asset: AutoEquatable {}
extension Asset: AutoCodable {
    static var defaultCheckStatus = InventoryType.nonInventory
    static var defaultTagNumber = ""
    static var defaultAssetName = ""
    static var defaultIsCheck = ""
    static var defaultAssetId = ""
    static var defaultCheckStatusName = ""
}
