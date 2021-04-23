//
//  APIRouter.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

enum APIRouter: URLRequestConvertible {
    case login(LoginParameter)
    case locationList(LocationListParameter)

    var baseURL: URL {
        URL(string: API.baseURL)!
    }

    var method: HTTPMethod {
        switch self {
        case .login, .locationList: return .post
        }
    }

    var path: String {
        switch self {
        case .login: return "\(API.serviceDictionary)/\(Keys.loginPathComponents)"
        case .locationList: return "\(API.serviceDictionary)/\(Keys.locationListPathComponents)"
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method

        switch self {
        case .login(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .locationList(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }

        return request
    }
}

extension APIRouter {
    enum Keys: String {
        case loginPathComponents = "appSys/login"
        case locationListPathComponents = "app/location/findByPage"
    }
}
