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
        static var locationDetailByCodePathComponents = "app/location/getLocationByCode"
    }

    case login(LoginParameter)
    case locationList(LocationListParameter)
    case locationDetailByCode(LocationDetailParameter)

    var baseURL: URL {
        URL(string: "\(API.schema)://\(API.domain)/")!
    }

    var method: HTTPMethod {
        switch self {
        case .login,
             .locationDetailByCode,
             .locationList:
            return .post
        }
    }

    var path: String {
        switch self {
        case .login: return path(with: Constants.loginPathComponents)
        case .locationList: return path(with: Constants.locationListPathComponents)
        case .locationDetailByCode: return path(with: Constants.locationDetailByCodePathComponents)
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
        case .locationDetailByCode(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }

        return request
    }
}
