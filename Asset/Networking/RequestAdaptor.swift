//
//  RequestAdaptor.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

class RequestAdaptor: RequestAdapter {
    func adapt(_ urlRequest: URLRequest,
               for _: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.headers.add(.appInfo(App.$info.value))
        completion(.success(urlRequest))
    }
}
