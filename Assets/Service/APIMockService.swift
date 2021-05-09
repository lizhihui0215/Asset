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

final class APIMockService {
    typealias API = MockerDataSource
    public static let shared = APIMockService()

    let login = APIRouter.login(LoginParameter(userAccount: "wangwenwensh", userPwd: "1"))
    let locationList = APIRouter.locationList(LocationListParameter(pageNumber: "1",
                                                                    pageSize: "15",
                                                                    regionIdCompany: "asdsadsa",
                                                                    appSearchText: ""))

    let locationDetailByCode = APIRouter.locationDetailById(LocationDetailParameter(locationId: "asdsa1321"))

    let updateLocationCoordinate = APIRouter.updateLocation(UpdateLocationParameter(locationId: "sadsada",
                                                                                    locationCode: "csakjd",
                                                                                    longitude: "180.12321321",
                                                                                    latitude: "32.29421942",
                                                                                    mapLocationDesc: "dsa"))

    let assetInventoryList = APIRouter.assetInventoryList(AssetInventoryListParameter(pageNumber: "1",
                                                                                      pageSize: "213",
                                                                                      locationId: "sadadas",
                                                                                      checkPerson: "dsadas",
                                                                                      appSearchText: "",
                                                                                      assetLocationId: "dsadsa",
                                                                                      total: "2",
                                                                                      regionIdCompany: "sdadsad",
                                                                                      locationCode: "dadsadsa",
                                                                                      appCheckStatus: "dsadsa"))

    let assetDetailByInventoryList = APIRouter.assetDetailByInventoryList(AssetInventoryListDetailParameter(assetId: "sdasd",
                                                                                                            checkPerson: "dsadsa"))

    let assetDetailByScan = APIRouter.assetDetailByScan(LocationScanParameter(tagNumber: "asdas",
                                                                              realLocationCode: "dsadsa",
                                                                              checkPerson: "dsadsa",
                                                                              realLocationName: "dsadsa"))

    let inventoryStatus = APIRouter.inventoryStatus
    let assetStatus = APIRouter.assetStatus

    let principalStaffList = APIRouter.staffList(StaffListParameter(pageNumber: "1",
                                                                    pageSize: "2",
                                                                    regionIdCompany: "2",
                                                                    appSearchText: "ff",
                                                                    category: .principal))

    let userStaffList = APIRouter.staffList(StaffListParameter(pageNumber: "1",
                                                               pageSize: "2",
                                                               regionIdCompany: "2",
                                                               appSearchText: "ff",
                                                               category: .user))

    let assetList = APIRouter.assetList(AssetListParameter(pageNumber: "1",
                                                           pageSize: "2",
                                                           regionIdCompany: "2",
                                                           appSearchText: "ff"))

    let assetDetailByAssetList = APIRouter.assetDetailByAssetList(AssetListDetailParameter(assetId: "sdasd",
                                                                                           checkPerson: "dsadsa"))

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
                .post: API.UpdateLocationResponse.data,
            ]),
            Mock(router: assetInventoryList, dataType: .json, statusCode: 200, data: [
                .post: API.AssetInventoryListResponse.data,
            ]),
            Mock(router: assetDetailByInventoryList, dataType: .json, statusCode: 200, data: [
                .post: API.AssetDetailByInventoryListResponse.data,
            ]),
            Mock(router: assetDetailByAssetList, dataType: .json, statusCode: 200, data: [
                .post: API.AssetListDetailResponse.data,
            ]),
            Mock(router: assetDetailByScan, dataType: .json, statusCode: 200, data: [
                .post: API.AssetDetailByLocationScanResponse.data,
            ]),
            Mock(router: inventoryStatus, dataType: .json, statusCode: 200, data: [
                .post: API.InventoryStatusResponse.data,
            ]),
            Mock(router: assetStatus, dataType: .json, statusCode: 200, data: [
                .post: API.InventoryStatusResponse.data,
            ]),
            Mock(router: principalStaffList, dataType: .json, statusCode: 200, data: [
                .post: API.PrincipalStaffListResponse.data,
            ]),
            Mock(router: userStaffList, dataType: .json, statusCode: 200, data: [
                .post: API.UserStaffListResponse.data,
            ]),
            Mock(router: assetList, dataType: .json, statusCode: 200, data: [
                .post: API.AssetListResponse.data,
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
