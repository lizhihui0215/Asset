//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

struct LocationDetail: Codable {
    var strLongitude: String
    var locationClass: String
    var regionIdDept: String
    var locationOwner: String
    var isCheck: Bool
    var regionIdCompany: String
    var province: String
    var road: String
    var regionIdManage: String
    var enabledFlag: String
    var locationOwnerName: String
    var latitude: CLLocationDegrees
    var city: String
    var village: String
    var locationId: String
    var town: String
    var locationCode: String
    var strLatitude: String
    var locationType: String
    var longitude: CLLocationDegrees
    var deptName: String
    var companyName: String
    var locationClassName: String
    var county: String
    var locationTypeName: String
    var effectiveDate: String
    var locationName: String
}

extension LocationDetail: AutoEquatable {}

extension LocationDetail: AutoCodable {
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
