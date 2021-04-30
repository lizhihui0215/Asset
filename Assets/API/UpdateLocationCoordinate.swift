//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct UpdateLocationCoordinateRequest: RequestRepresentable {}

struct UpdateLocationCoordinateParameter: Encodable {
    var locationCode: String
    var longitude: String
    var latitude: String
}

struct UpdateLocationCoordinateResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: UpdateLocationCoordinate?
}

struct UpdateLocationCoordinate: Codable {}

extension UpdateLocationCoordinate: Item {}
