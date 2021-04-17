//
//  BaseViewModel.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

typealias ViewModelResult<Success> = Result<Success, Error>
typealias ViewModelCompletionHandler<Success> = (ViewModelResult<Success>) -> Void

class BaseViewModel<T: UIViewController, R: BaseRequest>: Validation {
    typealias Validator = StringValidator

    let request: R
    let action: T
    var validator = Validator.defaultValue

    let cache = Cache(option: .userDefault)

    init(request: R, action: T) {
        self.request = request
        self.action = action
    }

    func handApiError(router _: Router, error: Error) {
        action.alert(message: error.recoverySuggestion)
    }

    func apiStart(router _: Router) {
        action.startLoadingIndicator()
    }

    func apiFinished(router _: Router) {
        action.stopLoadingIndicator()
    }

    func valid(router _: Router) throws {}
}

extension BaseViewModel {
    func api<T: BaseResponse>(of type: T.Type = T.self,
                              router: Router,
                              completionHandler: @escaping ViewModelCompletionHandler<T.Model?>) {
        do {
            try valid(router: router)
        } catch {
            handApiError(router: router, error: error); return
        }

        apiStart(router: router)
        request.sendRequest(of: type, router: router) { [weak self] result in
            guard let self = self else { return }
            do {
                let result = try result.get()
                completionHandler(.success(result))
            } catch {
                `self`.handApiError(router: router, error: error)
            }
            `self`.apiFinished(router: router)
        }
    }
}
