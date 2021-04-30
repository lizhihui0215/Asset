//
// Created by lizhihui on 2021/4/30.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension APIRouter {
    var url: URL {
        baseURL.appendingPathComponent(path)
    }
}

final class APIMocker {
    typealias API = MockerDataSource
    public static let shared = APIMocker()

    let login = APIRouter.login(LoginParameter(userAccount: "wangwenwensh", userPwd: "1"))
    let locationList = APIRouter.locationList(
        LocationListParameter(pageNumber: "1",
                              pageSize: "15",
                              regionIdCompany: "asdsadsa",
                              appSearchText: "")
    )

    let locationDetailByCode = APIRouter.locationDetailByCode(LocationDetailParameter(locationCode: "asdsa1321"))

    let updateLocationCoordinate = APIRouter.updateLocationCoordinate(
        UpdateLocationCoordinateParameter(locationCode: "csakjd",
                                          longitude: "180.12321321",
                                          latitude: "32.29421942")
    )

    let assetInventoryList = APIRouter.assetInventoryList(
        AssetInventoryListParameter(pageNumber: "1",
                                    pageSize: "15",
                                    locationId: "dsa12312",
                                    userOrgId: "wangwenwensh",
                                    appSearchText: "")
    )

    lazy var mockers: [Mock] = {
        [
            Mock(router: login, dataType: .json, statusCode: 200, data: [
                .post: API.LoginResponse.data,
            ]),
            Mock(router: locationList, dataType: .json, statusCode: 200, data: [
                .post: API.LocationListResponse.data,
            ]),
            Mock(router: locationDetailByCode, dataType: .json, statusCode: 200, data: [
                .post: API.LocationDetailResponse.data,
            ]),
            Mock(router: updateLocationCoordinate, dataType: .json, statusCode: 200, data: [
                .post: API.UpdateLocationCoordinateResponse.data,
            ]),
            Mock(router: assetInventoryList, dataType: .json, statusCode: 200, data: [
                .post: API.AssetInventoryListResponse.data,
            ]),
        ]
    }()

    func registerMockers() {
        mockers.forEach { $0.register() }
    }
}

extension Mock {
    init(router: APIRouter,
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
