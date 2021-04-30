//
// Created by lizhihui on 2021/4/30.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

final class APIMocker {
    public static let shared = APIMocker()
    private static let locationList = MockerDataSource.LocationListResponse.document

    private static let locationDetailByCode = MockerDataSource.LocationDetailResponse.document

    private static let updateLocationCoordinate = MockerDataSource.UpdateLocationCoordinateResponse.document

    public static let login: Data = MockerDataSource.LoginResponse.document

    enum MockerRouter: String {
        enum Constants {
            static let login = "appSys/login"
            static let locationList = "app/location/findByPage"
            static var locationDetailByCode = "app/location/getLocationByCode"
            static var updateLocationCoordinate = "app/location/updateLocationInfo"
        }

        var baseURL: URL {
            URL(string: "\(API.schema)://\(API.domain)/")!
        }

        var url: URL {
            baseURL.appendingPathComponent(path)
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

        case login
        case locationList
        case locationDetailByCode
        case updateLocationCoordinate
    }

    var mockers = [
        Mock(router: .login, dataType: .json, statusCode: 200, data: [
            .post: APIMocker.login,
        ]),
        Mock(router: .locationList, dataType: .json, statusCode: 200, data: [
            .post: APIMocker.locationList,
        ]),
        Mock(router: .locationDetailByCode, dataType: .json, statusCode: 200, data: [
            .post: APIMocker.locationDetailByCode,
        ]),
        Mock(router: .updateLocationCoordinate, dataType: .json, statusCode: 200, data: [
            .post: APIMocker.updateLocationCoordinate,
        ]),
    ]

    func registerMockers() {
        mockers.forEach { $0.register() }
    }
}

extension Mock {
    init(router: APIMocker.MockerRouter,
         ignoreQuery: Bool = false,
         cacheStoragePolicy: URLCache.StoragePolicy = .notAllowed,
         dataType: Mock.DataType,
         statusCode: Int,
         data: [Mock.HTTPMethod: Data],
         additionalHeaders: [String: String] = [:],
         requestError: Error? = nil)
    {
        self.init(url: router.url,
                  ignoreQuery: ignoreQuery,
                  cacheStoragePolicy: cacheStoragePolicy,
                  dataType: dataType,
                  statusCode: statusCode,
                  data: data,
                  additionalHeaders: additionalHeaders,
                  requestError: requestError)
    }
}
