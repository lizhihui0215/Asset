//
//  NetworkManager.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import AlamofireImage
import BrightFutures
import Foundation

typealias EAMResponseFuture<Success> = Future<Success, Error>
typealias EAMDataResponse<Success> = Alamofire.DataResponse<Success, Error>

class NetworkManager {
    public static let `default` = NetworkManager()

    private var session: Session

    private var downloadSession: Session

    private static var evaluators: [String: ServerTrustEvaluating] {
        [API.domain: DisabledTrustEvaluator()]
    }

    private static var serverTrustManager: ServerTrustManager {
        ServerTrustManager(evaluators: evaluators)
    }

    private static var adapter: RequestAdaptor {
        RequestAdaptor()
    }

    private static var retrier: RequestRetrier {
        RequestRetrier()
    }

    init() {
        let adapterAndRetrier = Interceptor(adapter: NetworkManager.adapter, retrier: NetworkManager.retrier)
        let composite = Interceptor(interceptors: [adapterAndRetrier])
        let configuration = URLSessionConfiguration.af.default
        #if MOCK
            configuration.protocolClasses = [MockingURLProtocol.self] + (configuration.protocolClasses ?? [])
        #endif
        session = Session(configuration: configuration, interceptor: composite, serverTrustManager: Self.serverTrustManager)
        downloadSession = Session(configuration: configuration, startRequestsImmediately: false, interceptor: composite, serverTrustManager: Self.serverTrustManager)
        UIImageView.af.sharedImageDownloader = ImageDownloader(session: downloadSession)
    }

    func sendRequest<T: ResponseRepresentable>(of type: T.Type = T.self, router: APIRouter) -> EAMResponseFuture<EAMDataResponse<T>> {
        session.request(router).responseDecodable(of: type)
    }

    func upload<T: ResponseRepresentable>(of type: T.Type = T.self, router: APIRouter) -> EAMResponseFuture<EAMDataResponse<T>> {
        let response = session.upload(multipartFormData: router.multipartFormData, with: router)

        response.uploadProgress { progress in
            log.info("progress: \(progress.fractionCompleted)")
        }

        return response.responseDecodable(of: type)
    }
}

extension DataRequest {
    func responseDecodable<T>(of _: T.Type = T.self) -> EAMResponseFuture<EAMDataResponse<T>> where T: ResponseRepresentable {
        EAMResponseFuture<EAMDataResponse<T>> { complete in
            responseDecodable(of: T.self, dataPreprocessor: TransformErrorPreprocessor<T>()) { response in
                let response: EAMDataResponse<T> = response.tryMap { response in

                    guard response.status == 0 else {
                        throw EAMError.ServerError.responseFailed(reason: response.msg)
                    }
                    return response
                }
                complete(.success(response))
            }
        }
    }
}
