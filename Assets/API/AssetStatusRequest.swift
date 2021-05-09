//
// Created by lizhihui on 2021/5/3.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

typealias AssetStatus = [String: String]

struct AssetStatusRequest: RequestRepresentable {}

struct AssetStatusResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetStatus?
}
