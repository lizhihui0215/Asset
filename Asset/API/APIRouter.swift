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
        static let login = "appSys/login"
        static let locationList = "app/location/findByPage"
        static var locationDetailByCode = "app/location/getLocationByCode"
        static var updateLocationCoordinate = "app/location/updateLocationInfo"
    }

    case login(LoginParameter)
    case locationList(LocationListParameter)
    case locationDetailByCode(LocationDetailParameter)
    case updateLocationCoordinate(UpdateLocationCoordinateParameter)

    var baseURL: URL {
        URL(string: "\(API.schema)://\(API.domain)/")!
    }

    var method: HTTPMethod {
        switch self {
        case .login,
             .locationDetailByCode,
             .locationList,
             .updateLocationCoordinate:
            return .post
        }
    }

    var path: String {
        switch self {
        case .login: return pathComponents(with: Constants.login)
        case .locationList: return pathComponents(with: Constants.locationList)
        case .locationDetailByCode: return pathComponents(with: Constants.locationDetailByCode)
        case .updateLocationCoordinate: return pathComponents(with: Constants.updateLocationCoordinate)
        }
    }

    private func pathComponents(with pathComponents: String) -> String {
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
        case .updateLocationCoordinate(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }

        return request
    }
}
