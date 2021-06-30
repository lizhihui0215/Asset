//
// Created by Bernard on 2021/6/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskInventoryDetail {
    let checkStatusName: String
    let isCheck: Bool
    var usePerson: String
    let checkTime: String
    let tagNumber: String
    let realLocationName: String
    let mapLocationDesc: String
    var usePersonName: String
    let checkPerson: String
    var latitude: String
    var dutyPerson: String
    let assetCheckItemName: String
    let deptId: String
    let locationCode: String
    let modelNumber: String
    let realLocationCode: String
    let quantity: Int
    let cityId: String
    let assetCheckItem: String
    var longitude: String
    let deptName: String
    let assetName: String
    let manageDeptId: String
    let manufactureName: String
    var dutyPersonName: String
    let checkStatus: String
    let checkBillCode: String
    let locationName: String
    let cityName: String
    let manageDeptName: String
    let assetId: String
    var serial: String
}

extension AssetTaskInventoryDetail: Item {}

extension AssetTaskInventoryDetail: AutoEquatable {}

extension AssetTaskInventoryDetail: AutoCodable {
    static var defaultCheckStatusName = ""
    static var defaultIsCheck = false
    static var defaultUsePerson = ""
    static var defaultCheckTime = ""
    static var defaultTagNumber = ""
    static var defaultRealLocationName = ""
    static var defaultMapLocationDesc = ""
    static var defaultUsePersonName = ""
    static var defaultCheckPerson = ""
    static var defaultLatitude = ""
    static var defaultDutyPerson = ""
    static var defaultAssetCheckItemName = ""
    static var defaultDeptId = ""
    static var defaultLocationCode = ""
    static var defaultModelNumber = ""
    static var defaultRealLocationCode = ""
    static var defaultQuantity = 0
    static var defaultCityId = ""
    static var defaultAssetCheckItem = ""
    static var defaultLongitude = ""
    static var defaultDeptName = ""
    static var defaultAssetName = ""
    static var defaultManageDeptId = ""
    static var defaultManufactureName = ""
    static var defaultDutyPersonName = ""
    static var defaultCheckStatus = ""
    static var defaultCheckBillCode = ""
    static var defaultLocationName = ""
    static var defaultCityName = ""
    static var defaultManageDeptName = ""
    static var defaultAssetId = ""
    static var defaultSerial = ""
}
