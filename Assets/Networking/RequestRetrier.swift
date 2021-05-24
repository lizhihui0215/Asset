//
//  RequestRetrier.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Darwin
import Foundation

class RequestRetrier: Alamofire.RequestRetrier {
    var window: UIWindow? {
        UIApplication.shared.appDelegate.windowService?.window
    }

    func retry(_: Request,
               for _: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void)
    {
        guard !`is`(eamError: .tokenRequiredError, error: error) else { checkTokenStatus(completion: completion); return }
        guard !`is`(eamError: .updateRequired, error: error) else { checkVersion(completion: completion); return }

        completion(.doNotRetry)
    }

    private func checkTokenStatus(completion: @escaping (RetryResult) -> Void) {
        NetworkManager.default.sendRequest(of: IsLoginResponse.self, router: .isLogin).onSuccess { [weak self] result in
            guard let self = self else { return }

            guard let isLogin: IsLogin = result.value?.data else { return }

            guard isLogin.tokenStatus == "0" else {
                completion(.retryWithDelay(2))
                return
            }

            `self`.window?.rootViewController?.alert(message: "token 过期请重新登陆！",
                                                     defaultAction: UIViewController.defaultAlertAction { [weak self] in
                                                         guard let self = self else { return }
                                                         `self`.window?.rootViewController = StoryboardScene.Login.initialScene.instantiate()
                                                     })
            completion(.doNotRetry)
        }
    }

    private func checkVersion(completion: @escaping (RetryResult) -> Void) {
        Siren.shared.wail(performCheck: .immediately) { result in
            switch result {
            case .success(let result) where result.updateType == .unknown:
                completion(.retryWithDelay(2))
            case .failure:
                completion(.retryWithDelay(2))
            default:
                completion(.doNotRetry)
            }
        }
    }

    func `is`(eamError: EAMError.ServerError, error: Error) -> Bool {
        guard let error = error.asAFError else { return false }
        guard case .responseSerializationFailed(let reason) = error else { return false }
        guard case .customSerializationFailed(let error) = reason else { return false }
        guard let eamServerError = error.asEAMServerError else { return false }
        guard case eamError = eamServerError else { return false }

        return true
    }
}
