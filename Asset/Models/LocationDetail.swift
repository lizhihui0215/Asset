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
