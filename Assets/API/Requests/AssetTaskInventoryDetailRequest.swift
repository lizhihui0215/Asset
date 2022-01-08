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

struct AssetTaskInventoryDetailSubmitParameter: Encodable {
    let realLocationCode: String
    let quantity: String
    let checkPerson: String
    let latitude: String
    let dutyPersonName: String
    let assetCheckItem: String
    let resourceNumber: String
    let usePersonName: String
    let tagNumber: String
    let mapLocationDesc: String
    let dutyPerson: String
    let assetId: String
    let checkBillCode: String
    let manufactureName: String
    let usePerson: String
    let assetName: String
    let realLocationName: String
    let modelNumber: String
    let longitude: String
}

struct AssetTaskInventoryDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetInventoryListDetail?
}

struct AssetTaskInventoryDetailSubmitResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetTaskInventoryDetail?
}
