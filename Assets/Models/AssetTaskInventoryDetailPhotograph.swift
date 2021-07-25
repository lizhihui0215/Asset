//
// Created by lizhihui on 2021/7/11.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskInventoryDetailPhotograph {
    let isCheck: Bool
    let checkBillCode: String
    let assetId: String
    let tagNumber: String
    let assetName: String
    let checkStatus: String
    let checkStatusName: String
    let locationCode: String
    let locationName: String
    let checkPerson: String
    let manufactureName: String
    let modelNumber: String
    let quantity: Int
    let dutyPerson: String
    let dutyPersonName: String
    let usePerson: String
    let usePersonName: String
    let assetCheckItemName: String
    let deptId: String
    let deptName: String
    let manageDeptId: String
    let manageDeptName: String
}

extension AssetTaskInventoryDetailPhotograph: AutoEquatable {}

extension AssetTaskInventoryDetailPhotograph: AutoCodable {
    static var defaultIsCheck = false
    static var defaultCheckBillCode = ""
    static var defaultAssetId = ""
    static var defaultTagNumber = ""
    static var defaultAssetName = ""
    static var defaultCheckStatus = ""
    static var defaultCheckStatusName = ""
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
    static var defaultAssetCheckItemName = ""
    static var defaultDeptId = ""
    static var defaultDeptName = ""
    static var defaultManageDeptId = ""
    static var defaultManageDeptName = ""
}
