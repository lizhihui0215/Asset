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
    enum Constants {
        static let loginPathComponents = "appSys/login"
        static let locationListPathComponents = "app/location/findByPage"
    }

    case login(LoginParameter)
    case locationList(LocationListParameter)

    var baseURL: URL {
        URL(string: "\(API.schema)://\(API.domain)/")!
    }

    var method: HTTPMethod {
        switch self {
        case .login, .locationList: return .post
        }
    }

    var path: String {
        switch self {
        case .login: return "\(API.serviceDictionary)/\(Constants.loginPathComponents)"
        case .locationList: return "\(API.serviceDictionary)/\(Constants.locationListPathComponents)"
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
