//
//  LoginViewModel.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class LoginViewModel: BaseViewModel<LoginViewController, LoginRequest> {
    func login(username: String, password: String,
               completionHandler: @escaping ViewModelCompletionHandler<Credential?>) {
        let loginParameter = LoginParameter(userAccount: username, userPwd: password, appType: .ios)
        api(of: LoginResponse.self,
            router: .login(loginParameter)) { result in
            guard let credential = try? result.get() else { return }
//            app.add(credential: credential)
            completionHandler(result)
        }
    }

    override func valid(router: Router) throws {
        if case .login(let parameter) = router {
            guard self.validator.not(type: .empty(string: parameter.userAccount)) else {
                throw AEMError.UIError.usernameEmpty
            }

            guard self.validator.not(type: .empty(string: parameter.userPwd)) else {
                throw AEMError.UIError.passwordEmpty
            }
        }

        return try super.valid(router: router)
    }
}
