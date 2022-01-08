//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct UpdateLocationRequest: RequestRepresentable {}

struct UpdateLocationParameter: Encodable {
    var locationId: String
    var locationCode: String
    var longitude: String
    var latitude: String
    var mapLocationDesc: String
}

struct UpdateLocationResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: UpdateLocation?
}

struct UpdateLocation: Codable {}

extension UpdateLocation: Item {}
