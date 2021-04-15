//
//  NetworkMananger.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import Alamofire

typealias CompletionHandler<T: BaseResponse> = (AFDataResponse<T>) -> Void

class NetworkManager {
    public static let `default` = NetworkManager()
    
    private var session: Session
    
    private static var evaluators: [String : ServerTrustEvaluating] {
        return ["152.136.255.61" : DisabledTrustEvaluator()]
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
        self.session = Session(interceptor: composite, serverTrustManager: NetworkManager.serverTrustManager)
    }
    
    func sendRequest<T: BaseResponse>(of type: T.Type = T.self,
                                      router: Router,
                                      completionHandler: @escaping (AFDataResponse<T>) -> Void) {
        let transformErrorPreprocessor = TransformErrorPreprocessor<T>()
        session.request(router).responseDecodable(of: T.self,
                                                  dataPreprocessor: transformErrorPreprocessor,
                                                  completionHandler: completionHandler)
    }
    
}
