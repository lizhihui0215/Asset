//
// Created by lizhihui on 2021/7/26.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformAssetDetailPhotographResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: TransformAssetDetailPhotograph?
}

struct TransformAssetDetailPhotographParameter: Encodable {
    let billLineId: String
    let checkPerson: String
}
