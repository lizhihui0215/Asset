//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct LocationDetailRequest: RequestRepresentable {}

struct LocationDetailParameter: Encodable {
    let locationId: String
}

struct LocationDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: LocationDetail?
}

struct LocationDetail: Codable {
    //
    var effectiveDate: String
    //	维度
    var enabledFlag: String
    //	精度
    var strLatitude: String
    //	房号
    var strLongitude: String
    //	楼层
    var room: String
    //	单元
    var floor: String
    //	楼栋
    var unit: String
    //	小区单位楼宇村内位置
    var building: String
    //	路巷街村
    var village: String
    //	乡镇街道
    var road: String
    //	区县
    var town: String
    //	市
    var county: String
    //	省
    var city: String
    //	权属
    var province: String
    //
    var locationOwnerName: String
    //	地点分类类型
    var locationOwner: String
    //
    var locationTypeName: String
    //	行政区划
    var locationType: String
    //
    var locationClassName: String
    //
    var locationClass: String
    //
    var locationName: String
    //
    var locationCode: String
    //
    var regionIdManage: String
    //
    var deptName: String
    //	公司名称
    var regionIdDept: String
    //	地点所在公司id
    var companyName: String
    //	地点id
    var regionIdCompany: String
    //
    var locationId: String
    var isCheck: String
}

extension LocationDetail: Item {}
