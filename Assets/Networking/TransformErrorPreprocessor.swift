//
//  ResponseSerializer.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

struct TransformErrorPreprocessor<T: ResponseRepresentable>: DataPreprocessor {
    let decoder: DataDecoder

    public init(decoder: DataDecoder = JSONDecoder()) {
        self.decoder = decoder
    }

    public func preprocess(_ data: Data) throws -> Data {
        let dataString = String(data: data, encoding: .utf8)

        do {
            guard let decrptyData = try dataString?.aes(.decrypt()).data(using: .utf8) else {
                return data
            }

            let jsonString = String(data: decrptyData, encoding: .utf8)

            print(jsonString!)

            let response = try decoder.decode(T.self, from: decrptyData)
            switch response.status {
            case 3: throw EAMError.ServerError.updateRequired
            case 4: throw EAMError.ServerError.tokenRequiredError
            default: return decrptyData
            }
        } catch {
            log.debug(error.localizedDescription)
        }
        return data
    }
}
