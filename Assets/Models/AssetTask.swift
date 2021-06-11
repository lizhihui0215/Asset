//
// Created by Bernard on 2021/6/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTask {
    let isCheck: Bool
    let checkBillCode: String
    let taskNumber: String
    let taskStatus: String
    let taskStatusName: String
    let taskName: String
}

extension AssetTask: Item {}

extension AssetTask: AutoEquatable {}

extension AssetTask: AutoCodable {
    static var defaultIsCheck = false
    static var defaultCheckBillCode = ""
    static var defaultTaskNumber = ""
    static var defaultTaskStatusName = ""
    static var defaultTaskName = ""
    static var defaultTaskStatus = ""
}
