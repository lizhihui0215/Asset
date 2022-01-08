//
//  LoginRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct PrintTemplateRequest: RequestRepresentable {}

struct PrintTemplateParameter: Encodable {
    var tagNumber: String
}

struct PrintTemplateResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: String?
}
