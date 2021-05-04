//
// Created by lizhihui on 2021/5/3.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

typealias InventoryStatus = [String: String]

struct InventoryStatusRequest: RequestRepresentable {}

struct InventoryStatusResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: InventoryStatus?
}
