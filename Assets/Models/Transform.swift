//
// Created by Bernard on 2021/6/4.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct Transform {
    let appTaskId: String
    let appTaskCode: String
    let appTaskStatus: String
    let appTaskStatusName: String
    let locationCode: String
    let locationName: String
    let assetSum: Int
    let assetFinished: Int
    let assetUnfinished: Int
}

extension Transform: Item {}

extension Transform: AutoEquatable {}

extension Transform: AutoCodable {
    static let defaultAppTaskId = ""
    static let defaultAppTaskCode = ""
    static let defaultAppTaskStatus = ""
    static let defaultAppTaskStatusName = ""
    static let defaultLocationCode = ""
    static let defaultLocationName = ""
    static let defaultAssetSum = 0
    static let defaultAssetFinished = 0
    static let defaultAssetUnfinished = 0
}
