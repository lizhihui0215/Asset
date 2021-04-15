//
//  LoginViewModel.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class LoginViewModel: BaseViewModel {
    
    private let loginRequest = LoginRequest()
    
    func login(username: String, password: String)  {
        loginRequest.login(username: username, password: password) { [weak self] result in
            guard let `self` = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let credential):
                `self`.cache.put(key: "credential", value: credential)
            }
        }
    }
}
