//
//  APIRouter.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    case login(LoginParameter)
    
    var baseURL: URL {
        return URL(string: "https://152.136.255.61/eam-ms")!
    }
    
    var method: HTTPMethod {
        switch self {
        case .login: return .post
        }
    }
    
    var path: String {
        switch self {
        case .login: return "/appSys/login"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        switch self {
        case let .login(parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }
        
        return request
    }
}
