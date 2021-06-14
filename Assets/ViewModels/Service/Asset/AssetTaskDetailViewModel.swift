//
// Created by Bernard on 2021/6/8.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskDetailViewModel: BaseViewModel<AssetTaskDetailViewController> {
    var locationService: BDLocationService = .shared

    private var location: CLLocation? {
        didSet {
            latitude = String(location?.coordinate.latitude ?? 0)
            longitude = String(location?.coordinate.longitude ?? 0)
        }
    }

    var rgcData: LocationReGeocode?

    let checkBillCode: String
    let taskNumber: String
    var taskDetail: AssetTaskDetail?

    var longitude: String = ""

    var latitude: String = ""

    var formattedLongitude: String { String(format: "%.6f", Double(longitude) ?? 0) }

    var formattedLatitude: String { String(format: "%.6f", Double(latitude) ?? 0) }

    var systemLongitude: String {
        get { String(format: "%.6f", Double(taskDetail?.longitude ?? "0") ?? 0) }
        set { taskDetail?.longitude = newValue }
    }

    var systemLatitude: String {
        get { String(format: "%.6f", Double(taskDetail?.latitude ?? "0") ?? 0) }
        set { taskDetail?.latitude = newValue }
    }

    var taskName: String { taskDetail?.taskName ?? "" }
    var locationCode: String { taskDetail?.locationCode ?? "" }
    var checkPerson: String { taskDetail?.checkPerson ?? "" }
    var taskStatusName: String { taskDetail?.taskStatusName ?? "" }
    var checkTaskStatusName: String { taskDetail?.checkTaskStatusName ?? "" }
    var lastCheckPerson: String { "" }
    var checkTaskTime: String { taskDetail?.checkTaskTime ?? "" }
    var checkCount: String { String(taskDetail?.checkCount ?? 0) }
    var unCheckCount: String { String(taskDetail?.unCheckCount ?? 0) }
    var alreadyCheckCount: String { String(taskDetail?.alreadyCheckCount ?? 0) }
    var lessCount: String { String(taskDetail?.lessCount ?? 0) }
    var moreCount: String { String(taskDetail?.moreCount ?? 0) }

    init(request: RequestRepresentable, action: AssetTaskDetailViewController, checkBillCode: String, taskNumber: String) {
        self.checkBillCode = checkBillCode
        self.taskNumber = taskNumber
        super.init(request: request, action: action)
    }

    func fetchAssetTaskDetail() -> ViewModelFuture<AssetTaskDetail?> {
        let parameter = AssetTaskDetailParameter(checkBillCode: checkBillCode, taskNumber: taskNumber)
        return api(of: AssetTaskDetailResponse.self, router: .assetTaskDetail(parameter)).onSuccess { [weak self] result in
            guard let self = self else { return }
            `self`.taskDetail = result
        }
    }

    func getGPSLocation() -> ViewModelFuture<CLLocation?> {
        locationService.getGPSLocation().flatMap { [weak self] result -> ViewModelFuture<CLLocation?> in
            guard let result = result, let self = self else {
                return ViewModelFuture(error: .unwrapOptionalValue("location"))
            }
            `self`.location = result.location
            `self`.rgcData = result.rgcData?.convert()
            return ViewModelFuture(value: result.location)
        }
    }

    func submit() -> ViewModelFuture<AssetTaskDetail?> {
        api(of: AssetTaskDetailResponse.self,
            router: .assetTaskDetailSubmit(AssetTaskDetailSubmitParameter(mapLocationDesc: rgcData?.eam.JSONString ?? "",
                                                                          checkPerson: checkPerson,
                                                                          checkBillCode: checkBillCode,
                                                                          latitude: latitude,
                                                                          taskNumber: taskNumber,
                                                                          longitude: longitude))).onSuccess { [weak self] result in
            guard let self = self else { return }
            `self`.taskDetail?.latitude = result?.latitude ?? ""
            `self`.taskDetail?.longitude = result?.longitude ?? ""
        }
    }
}
