//
// Created by lizhihui on 2021/7/26.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformAsset {
    let billLineId: String
    let tagNumber: String
    let assetName: String
    let matchedFlag: String
    let matchedDesc: String
    let confirmFlag: String
    let confirmDesc: String
}

extension TransformAsset: Item {}

extension TransformAsset: AutoEquatable {}

extension TransformAsset: AutoCodable {
    static var defaultBillLineId = ""
    static var defaultTagNumber = ""
    static var defaultAssetName = ""
    static var defaultMatchedFlag = ""
    static var defaultMatchedDesc = ""
    static var defaultConfirmFlag = ""
    static var defaultConfirmDesc = ""
}
