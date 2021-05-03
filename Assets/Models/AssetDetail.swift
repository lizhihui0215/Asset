//
// Created by lizhihui on 2021/5/2.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetDetail {
    var isCheck: Bool
    var assetId: String
    var tagNumber: String
    var assetName: String
    var checkTime: String
    var checkStatus: String
    var checkStatusName: String
    var realLocationCode: String
    var realLocationName: String
    var locationCode: String
    var locationName: String
    var checkPerson: String
    var lastCheckPerson: String
    var manufactureName: String
    var modelNumber: String
    var quantity: String
    var dutyPerson: String
    var dutyPersonName: String
    var usePerson: String
    var usePersonName: String
    var typeDescriptionCode: String
    var typeDescriptionName: String
    var longitude: String
    var latitude: String
    var mapLocationDesc: String
    var assetCheckItem: String
    var assetCheckItemName: String
    var resourceNumber: String
}

extension AssetDetail: AutoEquatable {}

extension AssetDetail: AutoCodable {
    static var defaultIsCheck = false
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
    static var defaultLastCheckPerson = ""
    static var defaultManufactureName = ""
    static var defaultModelNumber = ""
    static var defaultQuantity = ""
    static var defaultDutyPerson = ""
    static var defaultDutyPersonName = ""
    static var defaultUsePerson = ""
    static var defaultUsePersonName = ""
    static var defaultTypeDescriptionCode = ""
    static var defaultTypeDescriptionName = ""
    static var defaultLongitude = ""
    static var defaultLatitude = ""
    static var defaultMapLocationDesc = ""
    static var defaultAssetCheckItem = ""
    static var defaultAssetCheckItemName = ""
    static var defaultResourceNumber = ""
}
