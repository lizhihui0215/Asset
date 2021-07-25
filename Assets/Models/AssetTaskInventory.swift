//
// Created by Bernard on 2021/6/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskInventory {
    let isCheck: Bool
    let assetId: String
    let checkBillCode: String
    let checkStatus: String
    let checkStatusName: String
    let tagNumber: String
    let assetName: String
    let imageCount: Int
    var locationCode: String?
    var locationName: String?
}

extension AssetTaskInventory: Item {}

extension AssetTaskInventory: AutoEquatable {}

extension AssetTaskInventory: AutoCodable {
    static var defaultIsCheck: Bool = false
    static var defaultAssetId: String = ""
    static var defaultCheckBillCode: String = ""
    static var defaultCheckStatus: String = ""
    static var defaultCheckStatusName: String = ""
    static var defaultTagNumber: String = ""
    static var defaultAssetName: String = ""
    static var defaultImageCount: Int = 0
}
