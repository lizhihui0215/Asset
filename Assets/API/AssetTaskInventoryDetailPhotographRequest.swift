//
//  AssetTaskInventoryDetailPhotographRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskInventoryDetailPhotographRequest: RequestRepresentable {}

struct AssetTaskInventoryDetailPhotographParameter: Encodable {
    let checkStatus: String
    let assetId: String
    let checkPerson: String
    let checkBillCode: String
}

struct AssetTaskInventoryDetailPhotographResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetTaskInventoryDetailPhotograph?
}
