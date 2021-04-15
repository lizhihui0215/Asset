//
//  ResponseSerializer.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import Alamofire

struct TransformErrorPreprocessor<T: BaseResponse>: DataPreprocessor {
    let decoder: DataDecoder
    
    public init(decoder: DataDecoder = JSONDecoder()) {
        self.decoder = decoder
    }

    public func preprocess(_ data: Data) throws -> Data {
        do {
            let response = try decoder.decode(T.self, from: data)
            if response.status != 0 {
                throw ASTError.ServerError.responseFailed(reason: response.msg)
            }
        } catch {
            throw AFError.responseSerializationFailed(reason: .decodingFailed(error: error))
        }
        
        return data
    }
}

