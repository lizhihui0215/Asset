//
// Created by Bernard on 2021/6/8.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetTaskDetailRequest: RequestRepresentable {}

struct AssetTaskDetailParameter: Encodable {
    let checkBillCode: String
    let taskNumber: String
}

struct AssetTaskDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetTaskDetail?
}

struct AssetTaskDetailSubmitParameter: Encodable {
    let mapLocationDesc: String
    let checkPerson: String
    let checkBillCode: String
    let latitude: String
    let taskNumber: String
    let longitude: String
}
