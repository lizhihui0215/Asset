//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class LocationListRequest: RequestRepresentable {}

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

struct Location: Codable {
    var isCheck: Bool = false
    var locationCode = App.Constants.Default.string
    var locationName = App.Constants.Default.string
}

extension Location: Item {}
