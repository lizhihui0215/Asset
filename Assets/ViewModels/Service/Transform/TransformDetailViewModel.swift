//
// Created by Bernard on 2021/6/8.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformDetailParameter: Encodable {
    let appTaskId: String
}

struct TransformDetailResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: TransformDetail?
}

struct TransformDetailUpdateLocationCoordinationParameter: Encodable {
    let mapLocationDesc: String
    let latitude: String
    let appTaskId: String
    let longitude: String
}

struct TransformChangeCheckPersonParameter: Encodable {
    var checkPerson: String
    var operatorCode: String
    var appTaskId: String
}

struct TransformChangeCheckPersonResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: String?
}

class TransformDetailViewModel: BaseViewModel<TransformDetailViewController>, StaffSelectable {
    var principal: Staff?

    var user: Staff?

    var locationService: BDLocationService = .shared

    private var location: CLLocation? {
        didSet {
            latitude = String(location?.coordinate.latitude ?? 0)
            longitude = String(location?.coordinate.longitude ?? 0)
        }
    }

    var rgcData: LocationReGeocode?

    var transformDetail: TransformDetail?

    var longitude: String = ""

    var latitude: String = ""

    var principalText: String {
        guard let principal = principal else {
            return ""
        }

        return "\(principal.account)/\(principal.userName)"
    }

    var formattedLongitude: String { String(format: "%.6f", Double(longitude) ?? 0) }

    var formattedLatitude: String { String(format: "%.6f", Double(latitude) ?? 0) }

    var isHiddenTransformListButton: Bool { transformDetail?.longitude.isEmpty ?? true }

    var systemLongitude: String { String(format: "%.6f", Double(transformDetail?.longitude ?? "0") ?? 0) }

    var systemLatitude: String { String(format: "%.6f", Double(transformDetail?.latitude ?? "0") ?? 0) }

    var locationName: String { transformDetail?.locationName ?? "" }
    var taskStatusName: String { transformDetail?.appTaskStatusName ?? "" }
    var assetSum: String { String(transformDetail?.assetSum ?? 0) }
    var assetUnFinished: String { String(transformDetail?.assetUnfinished ?? 0) }
    var assetFinished: String { String(transformDetail?.assetFinished ?? 0) }
    var operatorName: String { "\(transformDetail?.operatorCode ?? "")/\(transformDetail?.operatorName ?? "")" }
    var locationCode: String { transformDetail?.locationCode ?? "" }
    var transform: Transform
    var appTaskId: String { transform.appTaskId }
    var billCode: String { transformDetail?.billCode ?? "" }
    var checkPerson: String { transformDetail?.operatorCode ?? app.credential?.userAccount ?? "" }
    var selectedPrincipal: Staff?

    init(request: RequestRepresentable,
         action: TransformDetailViewController,
         transform: Transform)
    {
        self.transform = transform
        super.init(request: request, action: action)
    }

    func fetchTransformDetail() -> ViewModelFuture<TransformDetail?> {
        let parameter = TransformDetailParameter(appTaskId: appTaskId)
        return api(of: TransformDetailResponse.self, router: .transformDetail(parameter)).onSuccess { [weak self] result in
            guard let self = self else { return }
            `self`.transformDetail = result
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

    func changeCheckPerson() -> ViewModelFuture<String> {
        api(router: .transformChangeCheckPerson(
            TransformChangeCheckPersonParameter(
                checkPerson: checkPerson,
                operatorCode: principal?.account ?? "",
                appTaskId: appTaskId
            )))
    }

    override func valid(router: APIRouter) throws {
        if case .transformChangeCheckPerson = router {
            guard self.validator.not(type: .empty(string: principal?.account)) else {
                throw EAMError.UIError.transformChangePersonNotSelected
            }
        }

        return try super.valid(router: router)
    }

    func updateLocationCoordination() -> ViewModelFuture<TransformDetail?> {
        api(of: TransformDetailResponse.self,
            router: .transformDetailUpdateLocationCoordination(
                TransformDetailUpdateLocationCoordinationParameter(
                    mapLocationDesc: rgcData?.eam.JSONString ?? "",
                    latitude: latitude,
                    appTaskId: appTaskId,
                    longitude: longitude
                )
            )).onSuccess { [weak self] result in
            guard let self = self else { return }
            `self`.transformDetail?.latitude = result?.latitude ?? ""
            `self`.transformDetail?.longitude = result?.longitude ?? ""
        }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as TransformAssetListViewController:
            guard let taskDetail = transformDetail else { break }
            return TransformAssetListViewModel(assetTaskDetail: taskDetail,
                                               request: AssetInventoryListRequest(),
                                               action: action) as! T
        case let action as PhotographViewController:

            let parameters = PhotographUploadParameter(category: .location(locationCode: locationCode),
                                                       longitude: longitude,
                                                       latitude: latitude)
            return LocationPhotographViewModel(title: "地点照片采集",
                                               key: "地点编码",
                                               viewStates: (first: .viewing, second: .viewing),
                                               parameter: parameters,
                                               request: PhotographUploadRequest(),
                                               action: action) as! T
        case let action as StaffListViewController:
            return StaffListViewModel(request: StaffListRequest(),
                                      action: action,
                                      category: .principal,
                                      segue: .unwindFromStaffListToTransformDetailViewController) as! T
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }
    // swiftlint:enable force_cast
}
