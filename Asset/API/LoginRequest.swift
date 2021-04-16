//
//  LoginRequest.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct LoginRequest: BaseRequest {
    func login(username: String, password: String, completionHandler: @escaping APICompletionHandler<Credential?>) {
        let parameter = LoginParameter(userAccount: username, userPwd: password, appType: .ios)
        sendRequest(of: LoginResponse.self,
                    router: .login(parameter),
                    completionHandler: completionHandler)
    }
}

struct LoginParameter: Encodable  {
    let userAccount: String?
    let userPwd: String?
    let appType: App.`Type`
}

struct LoginResponse: BaseResponse {
    var status: Int = 0
    var msg: String = ""
    var data: Credential?
}

struct Credential: Codable {
    let userToken: String
    let pageSize: String
    let userOrgName: String
    let userCityName: String
    let userOrgId: String
    let userCityId: String
}

