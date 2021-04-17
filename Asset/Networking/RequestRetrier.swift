//
//  RequestRetrier.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

class RequestRetrier: Alamofire.RequestRetrier {
    func retry(_: Request,
               for _: Session,
               dueTo _: Error,
               completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}
