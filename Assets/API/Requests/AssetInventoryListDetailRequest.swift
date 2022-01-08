//
// Created by lizhihui on 2021/5/9.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetInventoryListDetailRequest {}

struct AssetInventoryListDetailParameter: Encodable, AssetDetailParameterRepresentable {
    let assetId: String
    let checkPerson: String
}

struct AssetInventoryListDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetInventoryListDetail?
}
