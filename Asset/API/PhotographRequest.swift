//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct PhotographRequest: RequestRepresentable {}

struct PhotographParameter: Encodable {}

struct PhotographResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: Photograph?
}

struct Photograph: Codable {}
