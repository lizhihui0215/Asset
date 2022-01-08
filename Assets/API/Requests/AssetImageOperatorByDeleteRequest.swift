//
//  AssetImageOperatorByDeleteRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct AssetImageOperatorByDeleteRequest: RequestRepresentable {}

struct AssetImageOperatorByDeleteParameter: Encodable {
    let imageId: String
    let tagNumber: String
}

struct AssetImageOperatorByDeleteResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: String?
}
