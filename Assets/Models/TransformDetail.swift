//
// Created by lizhihui on 2021/7/26.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformDetail {
    let appTaskId: String
    let appTaskCode: String
    let appTaskSource: String
    let appTaskStatus: String
    let billCode: String
    let operatorId: String
    let operatorCode: String
    let operatorName: String
    let locationId: String
    let locationCode: String
    let locationName: String
    let taskType: String
    let createdBy: String
    let lastUpdateDate: String
    let deliveryDate: String
    let urgeTimes: Int
    let assetSum: Int
    let assetFinished: Int
    let assetUnfinished: Int
    let treatmentStatus: String
    var longitude: String
    var latitude: String
    let mapLocationDesc: String
    let photoRequired: String
    let locationRequired: String
    let appTaskStatusName: String
}

extension TransformDetail: AutoEquatable {}

extension TransformDetail: AutoCodable {
    static var defaultAppTaskId = ""
    static var defaultAppTaskCode = ""
    static var defaultAppTaskSource = ""
    static var defaultAppTaskStatus = ""
    static var defaultBillCode = ""
    static var defaultOperatorId = ""
    static var defaultOperatorCode = ""
    static var defaultOperatorName = ""
    static var defaultLocationId = ""
    static var defaultLocationCode = ""
    static var defaultLocationName = ""
    static var defaultTaskType = ""
    static var defaultCreatedBy = ""
    static var defaultLastUpdateDate = ""
    static var defaultDeliveryDate = ""
    static var defaultUrgeTimes = 0
    static var defaultAssetSum = 0
    static var defaultAssetFinished = 0
    static var defaultAssetUnfinished = 0
    static var defaultTreatmentStatus = ""
    static var defaultLongitude = ""
    static var defaultLatitude = ""
    static var defaultMapLocationDesc = ""
    static var defaultPhotoRequired = ""
    static var defaultLocationRequired = ""
    static var defaultAppTaskStatusName = ""
}
