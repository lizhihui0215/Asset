//
// Created by Bernard on 2021/6/4.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformListRequest: RequestRepresentable {}

struct TransformListParameter: Encodable {
    let pageNumber: String
    let pageSize: String
    let operatorCode: String
    let appTaskStatus: String
    let appSearchLocation: String
    let appSearchTask: String
}

struct TransformResponse: PageableResponse {
    var total: Int = 0
    var records: Int = 0
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var page: Int = 0
    var data: [Transform] = []
}
