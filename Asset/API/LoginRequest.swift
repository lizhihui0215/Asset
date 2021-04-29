//
//  LoginRequest.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct LoginRequest: RequestRepresentable {}

struct LoginParameter: Encodable {
    let userAccount: String?
    let userPwd: String?
    let appType: App.`Type` = .ios
}

struct LoginResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: Credential?
}
