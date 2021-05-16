//
//  LoginViewModel.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import CryptoSwift
import Foundation

class LoginViewModel: BaseViewModel<LoginViewController> {
    func login(username: String, password: String) -> ViewModelFuture<Credential?> {
        let loginParameter = LoginParameter(userAccount: username, userPwd: password.md5())
        return api(of: LoginResponse.self, router: .login(loginParameter))
            .onSuccess { result in
                guard let credential = result else { return }
                app.add(credential: credential)
            }
    }

    override func valid(router: APIRouter) throws {
        if case .login(let parameter) = router {
            guard self.validator.not(type: .empty(string: parameter.userAccount)) else {
                throw EAMError.UIError.usernameEmpty
            }

            guard self.validator.not(type: .empty(string: parameter.userPwd)) else {
                throw EAMError.UIError.passwordEmpty
            }
        }

        return try super.valid(router: router)
    }
}
