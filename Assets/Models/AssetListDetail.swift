//
//  AssetListDetail.swift
//  Assets
//
//  Created by lizhihui on 2021/5/9.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

struct AssetListDetail {
    var isCheck: Bool
    var assetId: String
    var assetKindId: String
    var bookTypeCode: String
    var assetNumber: String
    var tagNumber: String
    var assetName: String
    var manufactureName: String
    var modelNumber: String
    var keyId: String
    var quantity: Int
    var uom: String
    var regionIdCompany: String
    var regionIdDept: String
    var regionIdManage: String
    var assetLocationId: String
    var assetLocationCode: String
    var assetLocationName: String
    var dutyPersonId: String
    var dutyPersonCode: String
    var dutyPersonName: String
    var usedPersonId: String
    var usedPersonAccount: String
    var usedPersonName: String
    var assetUsedStatus: String
    var assetStatus: String
    var erpCreationDate: String
    var enableDate: String
    var assetKindName: String
    var typeDescriptionCode: String
    var typeDescriptionName: String
    var assetStatusName: String
    var keyCode: String
    var keyName: String
    var companyName: String
    var deptName: String
    var manageDeptName: String
    var erpType: String
    var erpTypeName: String
    var isWlKind: String
    var queryStatus: String
}

extension AssetListDetail: AutoEquatable {}

extension AssetListDetail: AutoCodable {
    static var defaultIsCheck = false
    static var defaultAssetId = ""
    static var defaultAssetKindId = ""
    static var defaultBookTypeCode = ""
    static var defaultAssetNumber = ""
    static var defaultTagNumber = ""
    static var defaultAssetName = ""
    static var defaultManufactureName = ""
    static var defaultModelNumber = ""
    static var defaultKeyId = ""
    static var defaultQuantity = 0
    static var defaultUom = ""
    static var defaultRegionIdCompany = ""
    static var defaultRegionIdDept = ""
    static var defaultRegionIdManage = ""
    static var defaultAssetLocationId = ""
    static var defaultAssetLocationCode = ""
    static var defaultAssetLocationName = ""
    static var defaultDutyPersonId = ""
    static var defaultDutyPersonCode = ""
    static var defaultDutyPersonName = ""
    static var defaultUsedPersonId = ""
    static var defaultUsedPersonAccount = ""
    static var defaultUsedPersonName = ""
    static var defaultAssetUsedStatus = ""
    static var defaultAssetStatus = ""
    static var defaultErpCreationDate = ""
    static var defaultEnableDate = ""
    static var defaultAssetKindName = ""
    static var defaultTypeDescriptionCode = ""
    static var defaultTypeDescriptionName = ""
    static var defaultAssetStatusName = ""
    static var defaultKeyCode = ""
    static var defaultKeyName = ""
    static var defaultCompanyName = ""
    static var defaultDeptName = ""
    static var defaultManageDeptName = ""
    static var defaultErpType = ""
    static var defaultErpTypeName = ""
    static var defaultIsWlKind = ""
    static var defaultQueryStatus = ""
}
