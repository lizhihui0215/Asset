//
//  AssetTaskInventoryDetailRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskInventoryDetailRequest: RequestRepresentable {}

struct AssetTaskInventoryDetailParameter: Encodable {
    let tagNumber: String
    let realLocationCode: String
    let checkPerson: String
    let realLocationName: String
}

struct AssetTaskInventoryDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetInventoryListDetail?
}
