//
// Created by lizhihui on 2021/4/30.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetInventoryListRequest: RequestRepresentable {}

struct AssetInventoryListParameter: Encodable, Searchable {
    let pageNumber: String
    let pageSize: String
    let locationId: String
    let userOrgId: String
    var appSearchText: String
}

struct AssetInventoryListResponse: PageableResponse {
    var total: Int = 0
    var records: Int = 0
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var page: Int = 0
    var data: [Asset] = []
}