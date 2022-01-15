//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct LocationListRequest: RequestRepresentable {}

struct LocationListParameter: Encodable, Searchable {
    let pageNumber: String
    let pageSize: String
    let regionIdCompany: String
    var appSearchText: String
}

struct LocationListResponse: PageableResponse {
    var total: Int = 0
    var records: Int = 0
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var page: Int = 0
    var data: [Location] = []
}