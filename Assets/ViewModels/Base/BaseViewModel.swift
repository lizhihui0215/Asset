//
//  BaseViewModel.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import BrightFutures
import Foundation
import PKHUD
import UIKit

typealias ViewModelResult<Success> = Result<Success, Error>
typealias ViewModelCompletionHandler<Success> = (ViewModelResult<Success>) -> Void
typealias ViewModelFuture<Success> = Future<Success, Error>

let defaultOption: [String: String] = ["": "全部"]

protocol Action: AnyObject, WindowAble {
    func alert(title: String?,
               message: String,
               defaultAction: UIAlertAction,
               otherAction: UIAlertAction?)

    func startLoadingIndicator()

    func stopLoadingIndicator()

    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
}

extension Action {
    static var defaultActionAlertTitle: String {
        "OK"
    }

    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        present(viewControllerToPresent, animated: flag, completion: nil)
    }

    func startLoadingIndicator() {
        HUD.show(.systemActivity)
    }

    func stopLoadingIndicator() {
        HUD.hide(animated: true)
    }

    func alert(message: String,
               defaultAction: UIAlertAction = Self.defaultAlertAction(),
               otherAction: UIAlertAction? = nil)
    {
        alert(title: nil, message: message, defaultAction: defaultAction, otherAction: otherAction)
    }

    func alert(title: String?,
               message: String,
               defaultAction: UIAlertAction,
               otherAction: UIAlertAction?)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if let otherAction = otherAction {
            alertController.addAction(otherAction)
        }

        alertController.addAction(defaultAction)
        present(alertController, animated: true)
    }

    static func defaultAlertAction(title: String = Self.defaultActionAlertTitle, dismissHandler: (() -> Void)? = nil) -> UIAlertAction {
        UIAlertAction(title: title, style: .cancel) { _ in
            guard let handler = dismissHandler else { return }
            handler()
        }
    }

    func handler(error: Error) {}
}

class BaseViewModel<T: Action>: ViewModelRepresentable, Validation {
    typealias Validator = StringValidator
    let eventQueue = OperationQueue()

    let request: RequestRepresentable
    weak var action: T!
    var validator = Validator.defaultValue

    lazy var defaultDataDictionarySort: (String, String) throws -> Bool = {
        { $0 == defaultOption.values.first ? true : $0 < $1 }
    }()

    init(request: RequestRepresentable, action: T) {
        self.request = request
        self.action = action
    }

    func handApiError(router _: APIRouter, error: Error) {
        action.alert(message: error.recoverySuggestion ?? EAMError.unknown.recoverySuggestion!)
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

    func fetchDictionary(for status: APIRouter.DictionaryStatus) -> ViewModelFuture<[String: String]?> {
        api(of: DictionaryStatusResponse.self, router: .dictionaryStatus(status))
    }

    func viewModel<T: ViewModelRepresentable>(for action: UIViewController, with sender: Any? = nil) -> T {
        fatalError("sub class must implement for \(action)")
    }
}

extension BaseViewModel {
    final func api(router: APIRouter) -> ViewModelFuture<String> {
        beforeApi(router: router)
        return request.messageRequest(router: router)
            .onFailure { [weak self] in
                guard let self = self else { return }
                `self`.handApiError(router: router, error: $0)
            }
            .onComplete { [weak self] _ in
                guard let self = self else { return }
                `self`.apiFinished(router: router)
            }
    }

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

    final func listApi<T: ListResponse>(of type: T.Type = T.self, router: APIRouter) -> ViewModelFuture<[T.Model]> {
        beforeApi(router: router)
        return request.listRequest(of: type, router: router)
            .onFailure { [weak self] in
                guard let self = self else { return }
                `self`.handApiError(router: router, error: $0)
            }.onComplete { _ in
                `self`.apiFinished(router: router)
            }.flatMap {
                ViewModelFuture(value: $0.data)
            }
    }

    final func upload<T: DataResponse>(of type: T.Type = T.self, router: APIRouter) -> ViewModelFuture<T.Model?> {
        beforeApi(router: router)
        return request.upload(of: type, router: router)
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
