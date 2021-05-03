//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

struct LocationDetail {
    var assetLocationId: String
    var strLongitude: String
    let locationClass: String
    let regionIdDept: String
    let locationOwner: String
    let isCheck: Bool
    let regionIdCompany: String
    let province: String
    let road: String
    let regionIdManage: String
    let enabledFlag: String
    let locationOwnerName: String
    let latitude: CLLocationDegrees
    let city: String
    let village: String
    let locationId: String
    let town: String
    let locationCode: String
    var strLatitude: String
    let locationType: String
    let longitude: CLLocationDegrees
    let deptName: String
    let companyName: String
    let locationClassName: String
    let county: String
    let locationTypeName: String
    let effectiveDate: String
    let locationName: String
}

extension LocationDetail: AutoEquatable {}

extension LocationDetail: AutoCodable {
    static let defaultAssetLocationId = ""
    static let defaultStrLongitude = ""
    static let defaultLocationClass = ""
    static let defaultRegionIdDept = ""
    static let defaultLocationOwner = ""
    static let defaultIsCheck = false
    static let defaultRegionIdCompany = ""
    static let defaultProvince = ""
    static let defaultRoad = ""
    static let defaultRegionIdManage = ""
    static let defaultEnabledFlag = ""
    static let defaultLocationOwnerName = ""
    static let defaultLatitude = 0.0
    static let defaultCity = ""
    static let defaultVillage = ""
    static let defaultLocationId = ""
    static let defaultTown = ""
    static let defaultLocationCode = ""
    static let defaultStrLatitude = ""
    static let defaultLocationType = ""
    static let defaultLongitude = 0.0
    static let defaultDeptName = ""
    static let defaultCompanyName = ""
    static let defaultLocationClassName = ""
    static let defaultCounty = ""
    static let defaultLocationTypeName = ""
    static let defaultEffectiveDate = ""
    static let defaultLocationName = ""
}
