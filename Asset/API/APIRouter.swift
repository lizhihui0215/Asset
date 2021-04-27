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
        static var locationDetailPathComponents = "app/location/getLocation"
    }

    case login(LoginParameter)
    case locationList(LocationListParameter)
    case locationDetail(LocationDetailParameter)

    var baseURL: URL {
        URL(string: "\(API.schema)://\(API.domain)/")!
    }

    var method: HTTPMethod {
        switch self {
        case .login,
             .locationDetail,
             .locationList:
            return .post
        }
    }

    var path: String {
        switch self {
        case .login: return path(with: Constants.loginPathComponents)
        case .locationList: return path(with: Constants.locationListPathComponents)
        case .locationDetail: return path(with: Constants.locationDetailPathComponents)
        }
    }

    private func path(with pathComponents: String) -> String {
        "\(API.serviceDictionary)/\(pathComponents)"
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
        case .locationDetail(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }

        return request
    }
}
