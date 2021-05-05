//
// Created by lizhihui on 2021/5/5.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct StaffListRequest: RequestRepresentable {}

struct StaffListParameter: Encodable, Searchable {
    let pageNumber: String
    let pageSize: String
    let regionIdCompany: String
    var appSearchText: String
}

struct StaffListResponse: PageableResponse {
    var total: Int = 0
    var records: Int = 0
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var page: Int = 0
    var data: [Staff] = []
}
