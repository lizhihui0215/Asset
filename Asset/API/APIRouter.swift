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

    var baseURL: URL {
        URL(string: "https://152.136.255.61/eam-ms")!
    }

    var method: HTTPMethod {
        switch self {
        case .login: return .post
        }
    }

    var path: Keys.Path {
        switch self {
        case .login: return .login
        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path.rawValue)
        var request = URLRequest(url: url)
        request.method = method

        switch self {
        case .login(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }

        return request
    }
}

extension APIRouter {
    enum Keys: String {
        case login

        enum Path: String {
            case login = "/appSys/login"
        }
    }
}
