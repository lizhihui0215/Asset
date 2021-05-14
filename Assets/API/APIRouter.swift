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
        static var assetInventoryList = "/app/check/daily/findResultByPage"
        static var assetDetail = "/app/check/daily/getResultByPk"
        static var inventoryStatus = "app/dict/getMapByDictName"
        static var inventoryStatusDictionary = "check_status_daily"
        static var userStaffList = "app/user/staffList"
        static var principalStaffList = "app/principal/staffList"
        static var assetDetailByScan = "app/check/daily/getResultByScan"
        static var assetStatus = inventoryStatus
        static var assetStatusDictionary = "asset_check_item"
        static var assetList = "app/asset/findByCityPage"
        static var assetDetailByList = "app/asset/getAssetInfo"
        static var assetDetailInventoryListDetailSubmit = "app/check/daily/saveScanResult"
        static var uploadPhoto = "app/image/upload/location"
        static var imagesByLocation = "app/image/list/location"
        static var locationImageOperatorByDelete = "app/image/delete/location"

        static func staffList(_ category: Staff.Category) -> String {
            switch category {
            case .user: return userStaffList
            case .principal: return principalStaffList
            }
        }
    }

    case login(LoginParameter)
    case locationList(LocationListParameter)
    case locationDetailById(LocationDetailParameter)
    case updateLocation(UpdateLocationParameter)
    case assetInventoryList(AssetInventoryListParameter)
    case assetDetailByInventoryList(AssetDetailParameterRepresentable)
    case inventoryStatus
    case staffList(StaffListParameter)
    case assetDetailByScan(LocationScanParameter)
    case assetStatus
    case assetList(AssetListParameter)
    case assetDetailByAssetList(AssetDetailParameterRepresentable)
    case assetDetailInventoryListDetailSubmit(AssetInventoryListDetailSubmitParameter)
    case uploadPhoto(PhotographUploadParameter)
    case imagesByLocation(LocationImagesParameter)
    case locationImageOperatorByDelete(LocationImageOperatorByDeleteParameter)

    var baseURL: URL {
        URL(string: "\(API.schema)://\(API.domain)/")!
    }

    var method: HTTPMethod {
        switch self {
        default: return .post
        }
    }

    var path: String {
        switch self {
        case .login: return pathComponents(with: Constants.login)
        case .locationList: return pathComponents(with: Constants.locationList)
        case .locationDetailById: return pathComponents(with: Constants.locationDetailById)
        case .updateLocation: return pathComponents(with: Constants.updateLocationCoordinate)
        case .assetInventoryList: return pathComponents(with: Constants.assetInventoryList)
        case .assetDetailByInventoryList: return pathComponents(with: Constants.assetDetail)
        case .assetDetailByScan: return pathComponents(with: Constants.assetDetailByScan)
        case .inventoryStatus: return pathComponents(with: Constants.inventoryStatus)
        case .staffList(let parameters): return pathComponents(with: Constants.staffList(parameters.category))
        case .assetStatus: return pathComponents(with: Constants.assetStatus)
        case .assetList: return pathComponents(with: Constants.assetList)
        case .assetDetailByAssetList: return pathComponents(with: Constants.assetDetailByList)
        case .assetDetailInventoryListDetailSubmit: return pathComponents(with: Constants.assetDetailInventoryListDetailSubmit)
        case .uploadPhoto: return pathComponents(with: Constants.uploadPhoto)
        case .imagesByLocation: return pathComponents(with: Constants.imagesByLocation)
        case .locationImageOperatorByDelete: return pathComponents(with: Constants.locationImageOperatorByDelete)
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
        case .assetDetailByInventoryList(let parameters):
            // swiftlint:disable:next force_cast
            let parameters = parameters as! AssetInventoryListDetailParameter
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .assetDetailByScan(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .assetStatus:
            let parameters = [API.Keys.DictionaryName.rawValue: Constants.assetStatusDictionary]
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .inventoryStatus:
            let parameters = [API.Keys.DictionaryName.rawValue: Constants.inventoryStatusDictionary]
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .staffList(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .assetList(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .assetDetailByAssetList(let parameters):
            // swiftlint:disable:next force_cast
            let parameters = parameters as! AssetListDetailParameter
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .assetDetailInventoryListDetailSubmit(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .uploadPhoto: break
        case .imagesByLocation(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        case .locationImageOperatorByDelete(let parameters):
            request = try JSONParameterEncoder().encode(parameters, into: request)
        }

        return request
    }

    var multipartFormData: MultipartFormData {
        switch self {
        case .uploadPhoto(let parameters):
            let multipartFormData = MultipartFormData()
            multipartFormData.append(parameters.data, withName: "", fileName: "")
            return multipartFormData
        default: fatalError("upload task must provide multipartFormData")
        }
    }
}
