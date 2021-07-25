//
// Created by lizhihui on 2021/5/3.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct DictionaryStatusRequest: RequestRepresentable {}

struct DictionaryStatusResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: [String: String]?
}
