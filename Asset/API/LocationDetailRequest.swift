//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import CoreLocation
import Foundation

struct LocationDetailRequest: RequestRepresentable {}

struct LocationDetailParameter: Encodable {
    let locationCode: String
}

struct LocationDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: LocationDetail?
}

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

extension LocationDetail: Item {}
