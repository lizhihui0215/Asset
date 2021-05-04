//
//  APIRouter.swift
//  Assets
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
        static var locationDetailById = "app/location/getLocation"
        static var updateLocationCoordinate = "app/location/updateLocationInfo"
        static var assetInventoryList = "/app/check/daily/findByLocationAndCheckPerson"
        static var assetDetail = "app/check/daily/getCheckResultByScan"
        static var inventoryStatus = "app/dict/getMapByDictName"
        static var inventoryStatusDictionary = "check_status_daily"
    }

    case login(LoginParameter)
    case locationList(LocationListParameter)
    case locationDetailById(LocationDetailParameter)
    case updateLocation(UpdateLocationParameter)
    case assetInventoryList(AssetInventoryListParameter)
    case assetDetail(AssetDetailParameter)
    case inventoryStatus

    var baseURL: URL {
        URL(string: "\(API.schema)://\(API.domain)/")!
    }

    var method: HTTPMethod {
        switch self {
        case .login,
             .locationDetailById,
             .locationList,
             .updateLocation,
             .assetInventoryList,
             .assetDetail,
             .inventoryStatus:
            return .post
        }
    }

    var path: String {
        switch self {
        case .login: return pathComponents(with: Constants.login)
        case .locationList: return pathComponents(with: Constants.locationList)
        case .locationDetailById: return pathComponents(with: Constants.locationDetailById)
        case .updateLocation: return pathComponents(with: Constants.updateLocationCoordinate)
        case .assetInventoryList: return pathComponents(with: Constants.assetInventoryList)
        case .assetDetail: return pathComponents(with: Constants.assetDetail)
        case .inventoryStatus: return pathComponents(with: Constants.inventoryStatus)
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
        case .locationDetailById(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .updateLocation(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .assetInventoryList(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .assetDetail(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .inventoryStatus:
            let parameters = [API.Keys.DictionaryName.rawValue: Constants.inventoryStatusDictionary]
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }

        return request
    }
}
