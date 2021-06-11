//
// Created by Bernard on 2021/6/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskDetail {
    let isCheck: Bool
    let checkBillCode: String
    let taskNumber: String
    let taskName: String
    let locationCode: String
    let checkPerson: String
    let checkCount: Int
    let unCheckCount: Int
    let alreadyCheckCount: Int
    let lessCount: Int
    let moreCount: Int
    var longitude: String
    var latitude: String
    let mapLocationDesc: String
    let taskStatus: String
    let taskStatusName: String
    let checkTaskStatus: String
    let checkTaskStatusName: String
    let checkTaskTime: String
}

extension AssetTaskDetail: AutoEquatable {}

extension AssetTaskDetail: AutoCodable {
    static var defaultIsCheck = false
    static var defaultCheckBillCode = ""
    static var defaultTaskNumber = ""
    static var defaultTaskName = ""
    static var defaultLocationCode = ""
    static var defaultCheckPerson = ""
    static var defaultCheckCount = 0
    static var defaultUnCheckCount = 0
    static var defaultAlreadyCheckCount = 0
    static var defaultLessCount = 0
    static var defaultMoreCount = 0
    static var defaultLongitude = ""
    static var defaultLatitude = ""
    static var defaultMapLocationDesc = ""
    static var defaultTaskStatus = ""
    static var defaultTaskStatusName = ""
    static var defaultCheckTaskStatus = ""
    static var defaultCheckTaskStatusName = ""
    static var defaultCheckTaskTime = ""
}
