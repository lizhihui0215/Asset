//
//  RequestEncryptAdaptor.swift
//  Assets
//
//  Created by lizhihui on 2022/1/8.
//  Copyright © 2022 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

// TODO: enhancement, will move the encrypt code from APIRouter into this file
class RequestEncryptAdaptor: RequestAdapter {
    func adapt(_ urlRequest: URLRequest,
               for _: Session,
               completion: @escaping (Result<URLRequest, Error>) -> Void)
    {
//        var urlRequest = urlRequest
//        request.httpBody = try Result<Data, Error> { try encoder.encode(parameters) }
//            .mapError { AFError.parameterEncoderFailed(reason: .encoderFailed(error: $0)) }.get()

        completion(.success(urlRequest))
    }
}
