//
//  PhotographUploadRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct LocationImagesRequest: RequestRepresentable {}

struct LocationImagesParameter: Encodable {
    let locationCode: String
}

struct LocationImagesResponse: ListResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: [Photo] = []
}
