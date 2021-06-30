//
//  AssetInventoryListScanRequest.swift
//  Assets
//
//  Created by lizhihui on 2021/6/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskInventoryListScanRequest: RequestRepresentable {}

struct AssetTaskInventoryListScanParameter: Encodable {
    let realLocationCode: String
    let checkBillCode: String
    let checkPerson: String
    let realLocationName: String
    let tagNumber: String
}

struct AssetTaskInventoryListScanResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetTaskInventoryDetail?
}
