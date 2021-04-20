//
//  ResponseSerializer.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

struct TransformErrorPreprocessor<T: BaseResponse>: DataPreprocessor {
    let decoder: DataDecoder

    public init(decoder: DataDecoder = JSONDecoder()) {
        self.decoder = decoder
    }

    public func preprocess(_ data: Data) throws -> Data {
        guard let response = try? decoder.decode(T.self, from: data) else {
            return data
        }

        guard let status = response.status, status == 0 else {
            throw AEMError.ServerError.responseFailed(reason: response.msg ?? "")
        }

        return data
    }
}
