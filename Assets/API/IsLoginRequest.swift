//
//  LoginRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct IsLoginRequest: RequestRepresentable {}

struct IsLoginParameter: Encodable {
    let userToken: String
}

struct IsLoginResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: IsLogin?
}
