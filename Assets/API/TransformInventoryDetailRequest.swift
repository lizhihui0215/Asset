//
// Created by lizhihui on 2021/7/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformAssetDetailSubmitResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: TransformAssetDetail?
}
