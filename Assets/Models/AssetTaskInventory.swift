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
}

extension AssetTaskInventory: Item {}

extension AssetTaskInventory: AutoEquatable {}

extension AssetTaskInventory: AutoCodable {
    static var isCheck: Bool = false
    static var assetId: String = ""
    static var checkBillCode: String = ""
    static var checkStatus: String = ""
    static var checkStatusName: String = ""
    static var tagNumber: String = ""
    static var assetName: String = ""
    static var imageCount: Int = 0
}
