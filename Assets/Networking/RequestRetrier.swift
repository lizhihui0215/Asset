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
        print("is token required \(isTokenRequiredError(error: error))")
        completion(.doNotRetry)
    }

    func isTokenRequiredError(error: Error) -> Bool {
        guard let error = error.asAFError else { return false }
        guard case .responseSerializationFailed(let reason) = error else { return false }
        guard case .customSerializationFailed(let error) = reason else { return false }
        guard let eamServerError = error.asEAMServerError else { return false }
        guard case .tokenRequiredError = eamServerError else { return false }

        return true
    }
}
