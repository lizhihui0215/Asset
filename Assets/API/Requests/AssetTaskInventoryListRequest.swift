//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskInventoryListRequest: RequestRepresentable {}

struct AssetTaskInventoryListParameter: Encodable, Searchable {
    let pageNumber: String
    let pageSize: String
    var appSearchText: String
    let checkPerson: String
    let checkBillCode: String
    let locationCode: String
    let checkStatus: String
    let appCheckStatus: String
    let total: String
}

struct AssetTaskInventoryListResponse: PageableResponse {
    var total: Int = 0
    var records: Int = 0
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var page: Int = 0
    var data: [AssetTaskInventory] = []
}
