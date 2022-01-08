//
// Created by lizhihui on 2021/5/9.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetInventoryListDetailSubmitRequest {}

struct AssetInventoryListDetailSubmitParameter: Encodable {
    var realLocationCode: String
    var quantity: String
    var checkPerson: String
    var latitude: String
    var dutyPersonName: String
    var assetCheckItem: String
    var resourceNumber: String
    var usePersonName: String
    var tagNumber: String
    var mapLocationDesc: String
    var dutyPerson: String
    var assetId: String
    var manufactureName: String
    var usePerson: String
    var assetName: String
    var realLocationName: String
    var modelNumber: String
    var longitude: String
}

struct AssetInventoryListDetailSubmitResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetInventoryListDetail?
}
