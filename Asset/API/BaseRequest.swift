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
    static func appInfo(_ value: [String: String]) -> HTTPHeader {
        HTTPHeader(name: "appInfo", value: value.aem.jsonString)
    }

    static func userToken(_ value: String) -> HTTPHeader {
        HTTPHeader(name: "userToken", value: value)
    }
}

protocol BaseRequest {
    var apiClient: NetworkManager { get }

    func sendRequest<T: BaseResponse>(of type: T.Type,
                                      router: APIRouter,
                                      completionHandler: @escaping (APIResult<T.Model?>) -> Void)
}

extension BaseRequest {
    var apiClient: NetworkManager {
        NetworkManager.default
    }

    public func sendRequest<T: BaseResponse>(of type: T.Type = T.self,
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
}
