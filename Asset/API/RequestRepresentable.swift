//
//  BaseRequest.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

typealias APIResult<Success> = Result<Success, Error>

typealias APICompletionHandler<Success> = (APIResult<Success>) -> Void

public extension HTTPHeader {
    enum Keys: String {
        case AppInfo = "appInfo"
        case UserToken = "userToken"
    }

    static func appInfo(_ value: [String: String]) -> HTTPHeader {
        HTTPHeader(key: .AppInfo, value: value.eam.JSONString)
    }

    static func userToken(_ value: String) -> HTTPHeader {
        HTTPHeader(key: .UserToken, value: value)
    }

    init(key: Keys, value: String) {
        self.init(name: key.rawValue, value: value)
    }
}

protocol RequestRepresentable {
    var apiClient: NetworkManager { get }

    func dataRequest<T: DataResponse>(of type: T.Type,
                                      router: APIRouter,
                                      completionHandler: @escaping (APIResult<T.Model?>) -> Void)

    func listRequest<T: PageableResponse>(of type: T.Type,
                                          router: APIRouter,
                                          completionHandler: @escaping (APIResult<T>) -> Void)
}

extension RequestRepresentable {
    var apiClient: NetworkManager {
        NetworkManager.default
    }

    public func dataRequest<T: DataResponse>(of type: T.Type = T.self,
                                             router: APIRouter,
                                             completionHandler: @escaping (APIResult<T.Model?>) -> Void)
    {
        apiClient.sendRequest(of: type, router: router) { response in
            do {
                let data = try response.result.get()
                completionHandler(.success(data.data))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }

    func listRequest<T: PageableResponse>(of type: T.Type,
                                          router: APIRouter,
                                          completionHandler: @escaping (APIResult<T>) -> Void)
    {
        apiClient.sendRequest(of: type, router: router) { response in
            do {
                let data = try response.result.get()
                completionHandler(.success(data))
            } catch {
                completionHandler(.failure(error))
            }
        }
    }
}
