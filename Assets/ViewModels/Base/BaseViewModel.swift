//
//  BaseViewModel.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

typealias ViewModelResult<Success> = Result<Success, Error>
typealias ViewModelCompletionHandler<Success> = (ViewModelResult<Success>) -> Void

class BaseViewModel<T: UIViewController>: Validation {
    typealias Validator = StringValidator
    let eventQueue = OperationQueue()

    let request: RequestRepresentable
    let action: T
    var validator = Validator.defaultValue

    init(request: RequestRepresentable, action: T) {
        self.request = request
        self.action = action
    }

    func handApiError(router _: APIRouter, error: Error) {
        action.alert(message: error.recoverySuggestion)
    }

    func apiStart(router _: APIRouter) {
        action.startLoadingIndicator()
    }

    func apiFinished(router _: APIRouter) {
        action.stopLoadingIndicator()
    }

    func valid(router _: APIRouter) throws {}

    final func beforeApi(router: APIRouter) {
        do {
            try valid(router: router)
        } catch {
            handApiError(router: router, error: error); return
        }

        apiStart(router: router)
    }

    final func afterApi<T>(router: APIRouter,
                           result: Result<T, Error>,
                           completionHandler: @escaping (T) -> Void)
    {
        do {
            let result = try result.get()
            completionHandler(result)
        } catch {
            `self`.handApiError(router: router, error: error)
        }
        `self`.apiFinished(router: router)
    }
}

extension BaseViewModel {
    final func api<T: DataResponse>(of type: T.Type = T.self,
                                    router: APIRouter,
                                    completionHandler: @escaping ViewModelCompletionHandler<T.Model?>)
    {
        beforeApi(router: router)
        request.dataRequest(of: type, router: router) { [weak self] result in
            guard let self = self else { return }
            `self`.afterApi(router: router, result: result) { result in
                completionHandler(.success(result))
            }
        }
    }
}

class DataResponseEventOperation<T: DataResponse>: AsyncOperation {
    typealias Completion = (APIResult<T.Model?>) -> Void
    private let request: RequestRepresentable
    private let router: APIRouter
    private let completionHandler: Completion
    public var result: APIResult<T.Model?>?

    init(request: RequestRepresentable, router: APIRouter, completionHandler: @escaping (APIResult<T.Model?>) -> Void) {
        self.request = request
        self.router = router
        self.completionHandler = completionHandler
        super.init()
    }

    override func execute() {
        request.dataRequest(of: T.self, router: router) { [weak self] result in
            guard let self = self else { return }
            `self`.completionHandler(result)
            `self`.result = result
            `self`.finished()
        }
    }
}
