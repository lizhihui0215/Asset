//
//  EAMParameterEncoderswift.swift
//  Assets
//
//  Created by lizhihui on 2022/1/8.
//  Copyright © 2022 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation
class EAMParameterEncoder: ParameterEncoder {
    enum Encryptor {
        case des
        case none
        func encrpty<Parameters: Encodable>(parameters: Parameters) throws -> Data {
            guard let data = try parameters.JSONString.des(.encrypt, key: API.DESKey.request.rawValue).data(using: .utf8) else {
                throw EAMError.CryptoError.encryptoError
            }

            return data
        }
    }

    private var encryptor: Encryptor

    init(encryptor: Encryptor = .des) {
        self.encryptor = encryptor
    }

    func encode<Parameters>(_ parameters: Parameters?, into request: URLRequest) throws -> URLRequest where Parameters: Encodable {
        guard let parameters = parameters else { return request }

        var request = request

        guard request.url != nil else {
            throw AFError.parameterEncoderFailed(reason: .missingRequiredComponent(.url))
        }

        switch encryptor {
        case .des:
            let data = try encryptor.encrpty(parameters: parameters)
            request.httpBody = data
            if request.headers["Content-Type"] == nil {
                request.headers.update(.contentType("application/json"))
            }
        default:
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }

        return request
    }
}
