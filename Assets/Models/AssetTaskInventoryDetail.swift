//
// Created by Bernard on 2021/6/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskInventoryDetail {
    let isCheck: Bool
    let checkBillCode: String
    let assetId: String
    let tagNumber: String
    var assetName: String
    let checkTime: String
    let checkStatus: String
    let checkStatusName: String
    let realLocationCode: String
    let realLocationName: String
    let locationCode: String
    let locationName: String
    let checkPerson: String
    var manufactureName: String
    var modelNumber: String
    var quantity: Int
    var dutyPerson: String
    var dutyPersonName: String
    var usePerson: String
    var usePersonName: String
    var longitude: String
    var latitude: String
    let mapLocationDesc: String
    let assetCheckItem: String
    let assetCheckItemName: String
    var resourceNumber: String
    let cityId: String
    let cityName: String
    let deptId: String
    let deptName: String
    let manageDeptId: String
    let manageDeptName: String
}

extension AssetTaskInventoryDetail: Item {}

extension AssetTaskInventoryDetail: AutoEquatable {}

extension AssetTaskInventoryDetail: AutoCodable {
    static var defaultIsCheck = false
    static var defaultCheckBillCode = ""
    static var defaultAssetId = ""
    static var defaultTagNumber = ""
    static var defaultAssetName = ""
    static var defaultCheckTime = ""
    static var defaultCheckStatus = ""
    static var defaultCheckStatusName = ""
    static var defaultRealLocationCode = ""
    static var defaultRealLocationName = ""
    static var defaultLocationCode = ""
    static var defaultLocationName = ""
    static var defaultCheckPerson = ""
    static var defaultManufactureName = ""
    static var defaultModelNumber = ""
    static var defaultQuantity = 0
    static var defaultDutyPerson = ""
    static var defaultDutyPersonName = ""
    static var defaultUsePerson = ""
    static var defaultUsePersonName = ""
    static var defaultLongitude = ""
    static var defaultLatitude = ""
    static var defaultMapLocationDesc = ""
    static var defaultAssetCheckItem = ""
    static var defaultAssetCheckItemName = ""
    static var defaultResourceNumber = ""
    static var defaultCityId = ""
    static var defaultCityName = ""
    static var defaultDeptId = ""
    static var defaultDeptName = ""
    static var defaultManageDeptId = ""
    static var defaultManageDeptName = ""
}
