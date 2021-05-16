//
//  RequestRetrier.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

class RequestRetrier: Alamofire.RequestRetrier {
    func retry(_: Request,
               for _: Session,
               dueTo error: Error,
               completion: @escaping (RetryResult) -> Void)
    {
        print(isTokenRequiredError(error: error))
        completion(.doNotRetry)
    }

    func isTokenRequiredError(error: Error) -> Bool {
        guard let error = error.asAFError,
              case .responseSerializationFailed(let reason) = error,
                case .customSerializationFailed(let error) = reason,
                let eamServerError = error.asEAMServerError,
                case .tokenRequiredError = eamServerError else { return true }

        return false
    }
}
