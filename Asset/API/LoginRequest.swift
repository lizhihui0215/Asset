//
//  LoginRequest.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct LoginRequest: BaseRequest {
    func login(username: String, password: String, completionHandler: @escaping ModelCompletionHandler<Credential?>) {
        let parameter = LoginParameter(userAccount: username, userPwd: password, appType: Device.current.type.rawValue)
        sendRequest(of: LoginResponse.self,
                    router: .login(parameter),
                    completionHandler: completionHandler)
    }
}

struct LoginParameter: Encodable  {
    let userAccount: String?
    let userPwd: String?
    let appType: String?
}

struct LoginResponse: BaseResponse {
    let status: Int = 0
    let data: Credential?
    let msg: String = ""
}

struct Credential: Codable {
    let userToken: String
    let pageSize: String
    let userOrgName: String
    let userCityName: String
    let userOrgId: String
    let userCityId: String
}

