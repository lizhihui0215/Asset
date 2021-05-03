//
//  LoginRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetDetailRequest: RequestRepresentable {}

struct AssetDetailParameter: Encodable {
    let tagNumber: String
    let realLocationCode: String
    let checkPerson: String
    let realLocationName: String
}

struct AssetDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetDetail?
}