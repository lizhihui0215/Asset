//
//  BaseRequest.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import Alamofire

typealias APIResult<Success> = Result<Success, Error>

typealias ModelCompletionHandler<Success> = (APIResult<Success>) -> Void

protocol BaseRequest {
    var apiClient: NetworkManager { get }
    
    func sendRequest<T: BaseResponse>(of type: T.Type,
                                      router: Router,
                                      completionHandler: @escaping (APIResult<T.Model?>) -> Void)
}

extension BaseRequest {
    var apiClient: NetworkManager {
        return NetworkManager.default
    }
    
    public func sendRequest<T: BaseResponse>(of type: T.Type = T.self,
                                             router: Router,
                                             completionHandler: @escaping (APIResult<T.Model?>) -> Void) {
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
