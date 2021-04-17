//
//  NetworkMananger.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

typealias CompletionHandler<T: BaseResponse> = (AFDataResponse<T>) -> Void

typealias AEMDataResponse<Success> = DataResponse<Success, Error>

class NetworkManager {
    public static let `default` = NetworkManager()

    private var session: Session

    private static var evaluators: [String: ServerTrustEvaluating] {
        return ["152.136.255.61": DisabledTrustEvaluator()]
    }

    private static var serverTrustManager: ServerTrustManager {
        return ServerTrustManager(evaluators: evaluators)
    }

    private static var adapter: RequestAdaptor {
        return RequestAdaptor()
    }

    private static var retrier: RequestRetrier {
        return RequestRetrier()
    }

    init() {
        let adapterAndRetrier = Interceptor(adapter: NetworkManager.adapter, retrier: NetworkManager.retrier)
        let composite = Interceptor(interceptors: [adapterAndRetrier])
        session = Session(interceptor: composite, serverTrustManager: NetworkManager.serverTrustManager)
    }

    func sendRequest<T: BaseResponse>(of _: T.Type = T.self,
                                      router: Router,
                                      completionHandler: @escaping (AEMDataResponse<T>) -> Void) {
        session.request(router).responseDecodable(of: T.self) { response in
            let response: AEMDataResponse<T> = response.tryMap { response in
                if response.status != 0 {
                    throw AEMError.ServerError.responseFailed(reason: response.msg)
                }
                return response
            }
            completionHandler(response)
        }
    }
}
