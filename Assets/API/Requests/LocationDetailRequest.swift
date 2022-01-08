//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import CoreLocation
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
