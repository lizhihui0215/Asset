//
//  APIRouter.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import CryptoSwift
import Foundation
import Security
import SwiftyRSA

enum APIRouter: URLRequestConvertible {
    enum DictionaryStatus: String {
        case asset = "asset_check_item"
        case inventory = "check_status_daily"
        case checkStatus = "check_status"
        case taskStatus = "check_task_status"
        case confirmStatus = "app_hasystem_confirm_status"
    }

    // TODO: enhancement to module, e.g: asset, transform
    enum Constants {
        static let login = "appSys/login"
        static let locationList = "app/location/findByPage"
        static var locationDetailById = "app/location/getLocation"
        static var updateLocationCoordinate = "app/location/updateLocationInfo"
        static var assetInventoryList = "/app/check/daily/findResultByPage"
        static var assetDetail = "/app/check/daily/getResultByPk"
        static var inventoryStatus = "app/dict/getMapByDictName"
        static var userStaffList = "app/user/findAppUserByPage"
        static var principalStaffList = "app/user/findAppDutyUserByPage"
        static var assetDetailByScan = "app/check/daily/getResultByScan"
        static var assetStatus = inventoryStatus
        static var assetList = "app/asset/findByCityPage"
        static var assetDetailByList = "app/asset/getAssetInfo"
        static var assetDetailInventoryListDetailSubmit = "app/check/daily/saveScanResult"
        static var uploadPhotoByLocation = "app/image/upload/location"
        static var uploadPhotoByAsset = "app/image/upload/asset"
        static var imagesByLocation = "app/image/list/location"
        static var locationImageOperatorByDelete = "app/image/delete/location"
        static var imagesByAsset = "app/image/list/asset"
        static var assetImageOperatorByDelete = "app/image/delete/asset"
        static var isLogin = "appSys/isLogin"
        static var versionCheck = "appSys/getVersion"
        static var version = "appSys/getVersionIos"
        static var transformList = "app/receive/findTaskByPage"
        static var assetTaskList = "app/check/findTaskByPage"
        static var assetTaskDetail = "app/check/getTaskByPk"
        static var assetTaskDetailSubmit = "app/check/saveTaskInfo"
        static var assetTaskInventoryList = "app/check/findResultByPage"
        static var assetTaskInventoryDetailByScan = "app/check/getResultByScan"

        static var assetTaskInventoryDetailSubmit = "app/check/saveScanResult"

        static var assetTaskInventoryDetailPhotograph = "app/check/getResultByPk"
        static var assetTaskInventoryDetailPhotographMore = "app/check/getResultMore"

        static var transformInventoryDetailPhotograph = "app/receive/getResultByPk"

        static var transformAssetDetailSubmit = "app/receive/saveScanResult"

        static var transformAssetList = "app/receive/findResultByPage"

        static var transformAssetDetailByScan = "app/receive/getResultByScan"

        static var transformDetail = "app/receive/getTaskByPk"

        static var transformDetailUpdateLocationCoordination = "app/receive/saveTaskInfo"
        static var transformChangeCheckPerson = "app/receive/changeCheckPersonByTask"
        static var assetTaskChangeInventoryPerson = "app/check/changeCheckPerson"

        static func staffList(_ category: Staff.Category) -> String {
            switch category {
            case .user: return userStaffList
            case .principal: return principalStaffList
            }
        }

        static func uploadPhoto(_ category: PhotographUploadParameter.Category) -> String {
            switch category {
            case .asset: return uploadPhotoByAsset
            case .location: return uploadPhotoByLocation
            }
        }
    }

    case login(LoginParameter)
    case locationList(LocationListParameter)
    case locationDetailById(LocationDetailParameter)
    case updateLocation(UpdateLocationParameter)
    case assetInventoryList(AssetInventoryListParameter)
    case assetDetailByInventoryList(AssetDetailParameterRepresentable)
    case staffList(StaffListParameter)
    case assetDetailByScan(LocationScanParameter)
    case dictionaryStatus(DictionaryStatus)
    case personalAssetList(AssetListParameter)
    case assetDetailByAssetList(AssetDetailParameterRepresentable)
    case assetDetailInventoryListDetailSubmit(AssetInventoryListDetailSubmitParameter)
    case uploadPhoto(PhotographUploadParameter)
    case imagesByLocation(LocationImagesParameter)
    case locationImageOperatorByDelete(LocationImageOperatorByDeleteParameter)
    case imagesByAsset(AssetImagesParameter)
    case assetImageOperatorByDelete(AssetImageOperatorByDeleteParameter)
    case isLogin

    @available(*, deprecated, message: "Parse use version instead")
    case versionCheck
    case version
    case transformList(TransformListParameter)
    case assetTaskList(AssetTaskListParameter)
    case assetTaskDetail(AssetTaskDetailParameter)
    case assetTaskDetailSubmit(AssetTaskDetailSubmitParameter)
    case assetTaskInventoryList(AssetTaskInventoryListParameter)
    case assetTaskInventoryDetailByScan(AssetTaskInventoryListScanParameter)
    case assetTaskInventoryDetailSubmit(AssetTaskInventoryDetailSubmitParameter)
    case assetTaskInventoryDetailPhotograph(AssetTaskInventoryDetailPhotographParameter)
    case transformAssetDetailPhotograph(TransformAssetDetailPhotographParameter)
    case transformAssetDetailSubmit(TransformAssetDetailSubmitParameter)
    case transformAssetList(TransformAssetListParameter)
    case transformAssetDetailByScan(TransformAssetListScanParameter)
    case transformDetail(TransformDetailParameter)
    case transformDetailUpdateLocationCoordination(TransformDetailUpdateLocationCoordinationParameter)
    case transformChangeCheckPerson(TransformChangeCheckPersonParameter)
    case assetTaskChangeInventoryPerson(AssetTaskInventoryDetailChangeInventoryPersonParameter)

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
        case .staffList(let parameters): return pathComponents(with: Constants.staffList(parameters.category))
        case .dictionaryStatus: return pathComponents(with: Constants.assetStatus)
        case .personalAssetList: return pathComponents(with: Constants.assetList)
        case .assetDetailByAssetList: return pathComponents(with: Constants.assetDetailByList)
        case .assetDetailInventoryListDetailSubmit: return pathComponents(with: Constants.assetDetailInventoryListDetailSubmit)
        case .uploadPhoto(let parameters): return pathComponents(with: Constants.uploadPhoto(parameters.category))
        case .imagesByLocation: return pathComponents(with: Constants.imagesByLocation)
        case .locationImageOperatorByDelete: return pathComponents(with: Constants.locationImageOperatorByDelete)
        case .imagesByAsset: return pathComponents(with: Constants.imagesByAsset)
        case .assetImageOperatorByDelete: return pathComponents(with: Constants.assetImageOperatorByDelete)
        case .isLogin: return pathComponents(with: Constants.isLogin)
        case .versionCheck: return pathComponents(with: Constants.versionCheck)
        case .version: return pathComponents(with: Constants.version)
        case .transformList: return pathComponents(with: Constants.transformList)
        case .assetTaskList: return pathComponents(with: Constants.assetTaskList)
        case .assetTaskDetail: return pathComponents(with: Constants.assetTaskDetail)
        case .assetTaskDetailSubmit: return pathComponents(with: Constants.assetTaskDetailSubmit)
        case .assetTaskInventoryList: return pathComponents(with: Constants.assetTaskInventoryList)
        case .assetTaskInventoryDetailByScan: return pathComponents(with: Constants.assetTaskInventoryDetailByScan)
        case .assetTaskInventoryDetailSubmit: return pathComponents(with: Constants.assetTaskInventoryDetailSubmit)
        case .assetTaskInventoryDetailPhotograph(let parameters):
            let path = parameters.checkStatus != "3" ? Constants.assetTaskInventoryDetailPhotograph : Constants.assetTaskInventoryDetailPhotographMore
            return pathComponents(with: path)
        case .transformAssetDetailPhotograph: return pathComponents(with: Constants.transformInventoryDetailPhotograph)
        case .transformAssetDetailSubmit: return pathComponents(with: Constants.transformAssetDetailSubmit)
        case .transformAssetList: return pathComponents(with: Constants.transformAssetList)
        case .transformAssetDetailByScan: return pathComponents(with: Constants.transformAssetDetailByScan)
        case .transformDetail: return pathComponents(with: Constants.transformDetail)
        case .transformDetailUpdateLocationCoordination: return pathComponents(with: Constants.transformDetailUpdateLocationCoordination)
        case .transformChangeCheckPerson: return pathComponents(with: Constants.transformChangeCheckPerson)
        case .assetTaskChangeInventoryPerson: return pathComponents(with: Constants.assetTaskChangeInventoryPerson)
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
            request = try encode(parameters, into: request)
        case .locationList(let parameters):
            request = try encode(parameters, into: request)
        case .locationDetailById(let parameters):
            request = try encode(parameters, into: request)
        case .updateLocation(let parameters):
            request = try encode(parameters, into: request)
        case .assetInventoryList(let parameters):
            request = try encode(parameters, into: request)
        case .assetDetailByInventoryList(let parameters):
            // swiftlint:disable:next force_cast
            let parameters = parameters as! AssetInventoryListDetailParameter
            request = try encode(parameters, into: request)
        case .assetDetailByScan(let parameters):
            request = try encode(parameters, into: request)
        case .dictionaryStatus(let status):
            let parameters = [API.Keys.DictionaryName.rawValue: status.rawValue]
            request = try encode(parameters, into: request)
        case .staffList(let parameters):
            request = try encode(parameters, into: request)
        case .personalAssetList(let parameters):
            request = try encode(parameters, into: request)
        case .assetDetailByAssetList(let parameters):
            // swiftlint:disable:next force_cast
            let parameters = parameters as! AssetListDetailParameter
            request = try encode(parameters, into: request)
        case .assetDetailInventoryListDetailSubmit(let parameters):
            request = try encode(parameters, into: request)
        case .uploadPhoto(let parameters):
            request = try encode(parameters, into: request)
        case .imagesByLocation(let parameters):
            request = try encode(parameters, into: request)
        case .imagesByAsset(let parameters):
            request = try encode(parameters, into: request)
        case .assetImageOperatorByDelete(let parameters):
            request = try encode(parameters, into: request)
        case .locationImageOperatorByDelete(let parameters):
            request = try encode(parameters, into: request)
        case .isLogin:
            let parameters = IsLoginParameter(userToken: app.credential?.userToken ?? "")
            request = try encode(parameters, into: request)
        case .versionCheck:
            let parameters = VersionCheckParameter(appType: .ios, currentVersion: app.version)
            request = try encode(parameters, into: request)
        case .version:
            let parameters = VersionParameter(version: app.version)
            request = try encode(parameters, into: request)
        case .transformList(let parameters):
            request = try encode(parameters, into: request)
        case .assetTaskList(let parameters):
            request = try encode(parameters, into: request)
        case .assetTaskDetail(let parameters):
            request = try encode(parameters, into: request)
        case .assetTaskDetailSubmit(let parameters):
            request = try encode(parameters, into: request)
        case .assetTaskInventoryList(let parameters):
            request = try encode(parameters, into: request)
        case .assetTaskInventoryDetailByScan(let parameters):
            request = try encode(parameters, into: request)
        case .assetTaskInventoryDetailSubmit(let parameters):
            request = try encode(parameters, into: request)
        case .assetTaskInventoryDetailPhotograph(let parameters):
            request = try encode(parameters, into: request)
        case .transformAssetDetailPhotograph(let parameters):
            request = try encode(parameters, into: request)
        case .transformAssetDetailSubmit(let parameters):
            request = try encode(parameters, into: request)
        case .transformAssetList(let parameters):
            request = try encode(parameters, into: request)
        case .transformAssetDetailByScan(let parameters):
            request = try encode(parameters, into: request)
        case .transformDetail(let parameters):
            request = try encode(parameters, into: request)
        case .transformDetailUpdateLocationCoordination(let parameters):
            request = try encode(parameters, into: request)
        case .transformChangeCheckPerson(let parameters):
            request = try encode(parameters, into: request)
        case .assetTaskChangeInventoryPerson(let parameters):
            request = try encode(parameters, into: request)
        }

        return request
    }

    func encode<Parameters>(_ parameters: Parameters?, into request: URLRequest) throws -> URLRequest where Parameters: Encodable {
//        guard let parameters = parameters else {
//            throw EAMError.APIError.parametersIsNil
//        }
//
//        var request = request
//        let sign = try sign(parameters: parameters)
//
//        let paramJSONString = try parameters.asDictionary()
//            .merging(["sign": sign]) { $1 }
//            .JSONString()
//
//        let aesKey = API.randomAESKey()
//        guard let info = paramJSONString?.bytes.toHexString() else { fatalError("to hex string error") }
//        let clear = try ClearMessage(string: aesKey, using: .utf8)
//        let encryptedKey = try clear.encrypted(with: API.publicKey, padding: .PKCS1)
//
//        let bodyData = try AES(key: aesKey.bytes, blockMode: CBC(iv: aesKey.bytes), padding: .pkcs5).encrypt(info.bytes).toBase64()
//
//        let param = ["bodyData": bodyData]
//
//        request.addValue(encryptedKey.base64String, forHTTPHeaderField: "encryptKey")

        try JSONParameterEncoder().encode(parameters, into: request)
    }

    func sign(parameters: Encodable) throws -> String {
        let mirror = Mirror(reflecting: parameters)
        var valuesString = ""

        for field in mirror.children {
            if let value = field.value as? String {
                valuesString += value
            } else if let value = field.value as? Int {
                valuesString += String(value)
            } else if let value = field.value as? Double {
                valuesString += String(value)
            }
        }

        let clear = try ClearMessage(string: valuesString, using: .utf8)
        let signature = try clear.signed(with: API.privateKey, digestType: .sha256)

        print(signature.base64String)
        print(signature.data)
        return signature.base64String
    }

    var multipartFormData: MultipartFormData {
        switch self {
        case .uploadPhoto(let parameters):
            let multipartFormData = MultipartFormData()
            multipartFormData.append(parameters.data, withName: "file", fileName: parameters.file)
            multipartFormData.append(parameters.latitude.data(using: .utf8)!, withName: "latitude")
            multipartFormData.append(parameters.longitude.data(using: .utf8)!, withName: "longitude")
            switch parameters.category {
            case .asset(tagNumber: let tagNumber):
                multipartFormData.append(tagNumber.data(using: .utf8)!, withName: "tagNumber")
            case .location(locationCode: let locationCode):
                multipartFormData.append(locationCode.data(using: .utf8)!, withName: "locationCode")
            }

            return multipartFormData
        default: fatalError("upload task must provide multipartFormData")
        }
    }
}
