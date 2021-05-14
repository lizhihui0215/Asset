//
//  PhotographUploadRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct PhotographUploadRequest: RequestRepresentable {}

struct PhotographUploadParameter: Encodable {
    let locationCode: String
    let longitude: String
    let latitude: String
    let file: String
    let data: Data
}

struct PhotographUploadResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: Photo?
}
