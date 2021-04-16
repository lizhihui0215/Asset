//
//  LoginViewModel.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class LoginViewModel: BaseViewModel<LoginViewController, LoginRequest> {

    func login(username: String, password: String,completionHandler: @escaping ViewModelCompletionHandler<Credential?>)  {
        let loginParameter = LoginParameter(userAccount: username, userPwd: password, appType: .ios)

        api(of: LoginResponse.self,
            router: .login(loginParameter)) { [weak self] result in
            guard let `self` = self, let credential = try? result.get() else { return }
            `self`.cache.put(key: "credential", value: credential)
            completionHandler(result)
        }
    }
}
