//
//  BaseViewModel.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import BrightFutures
import Foundation
import UIKit

typealias ViewModelResult<Success> = Result<Success, Error>
typealias ViewModelCompletionHandler<Success> = (ViewModelResult<Success>) -> Void
typealias ViewModelFuture<Success> = Future<Success, Error>

class BaseViewModel<T: UIViewController>: Validation {
    typealias Validator = StringValidator
    let eventQueue = OperationQueue()

    let request: RequestRepresentable
    weak var action: T!
    var validator = Validator.defaultValue

    public static func weakSelfUnWrapError<C>() -> ViewModelFuture<C?> {
        ViewModelFuture(error: EAMError.weakSelfUnWrapError)
    }

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
                           result: Result<T, Error>)
    {
        if let error = result.error {
            handApiError(router: router, error: error)
        }
    }

    func fetchInventoryStatus() -> ViewModelFuture<InventoryStatus?> {
        api(of: InventoryStatusResponse.self, router: .inventoryStatus)
    }
}

extension BaseViewModel {
    final func api<T: DataResponse>(of type: T.Type = T.self, router: APIRouter) -> ViewModelFuture<T.Model?> {
        beforeApi(router: router)
        return request.dataRequest(of: type, router: router)
            .onFailure { [weak self] in
                guard let self = self else { return }
                `self`.handApiError(router: router, error: $0)
            }
            .onComplete { [weak self] _ in
                guard let self = self else { return }
                `self`.apiFinished(router: router)
            }
    }
}

protocol DataDictionary {
    associatedtype Key: Hashable
    associatedtype Value
    var dataDictionary: [Key: Value] { get set }
}

class DataResponseEventOperation<T: DataResponse>: AsyncOperation {
    private let request: RequestRepresentable
    private let router: APIRouter
    private let future: ViewModelFuture<T>

    init(request: RequestRepresentable, router: APIRouter, future: ViewModelFuture<T>) {
        self.request = request
        self.router = router
        self.future = future
        super.init()
    }

    override func execute() {
        // FIXME: temporary disable this feature, will be implemented in future
//        request.dataRequest(of: T.self, router: router)
//                .flatMap { [weak self] _ in
//                    guard let `self` = self else { return }
//                    return `self`.future
//                }
//                .onComplete { [weak self] result in
//                    guard let `self` = self else { return }
//                    `self`.finished()
//                }
    }
}
