//
//  LoginRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetListDetailRequest: RequestRepresentable {}

struct AssetListDetailParameter: Encodable, AssetDetailParameterRepresentable {
    let assetId: String
    let checkPerson: String
}

struct AssetListDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: AssetListDetail?
}
