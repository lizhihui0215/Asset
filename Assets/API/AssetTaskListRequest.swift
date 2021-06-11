//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskListRequest: RequestRepresentable {}

struct AssetTaskListParameter: Encodable, Searchable {
    let pageNumber: String
    let pageSize: String
    var appSearchText: String
    let checkPerson: String
    let taskStatus: String
    let total: String
}

struct AssetTaskListResponse: PageableResponse {
    var total: Int = 0
    var records: Int = 0
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var page: Int = 0
    var data: [AssetTask] = []
}
