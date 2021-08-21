//
//  TransformInventoryDetailViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/6/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformAssetDetailSubmitParameter: Encodable {
    let mapLocationDesc: String
    let checkPerson: String
    let latitude: String
    let assetCheckItem: String
    let resourceNumber: String
    let billLineId: String
    let matchedFlag: String
    let longitude: String
}

class TransformAssetDetailViewModel: BaseViewModel<TransformAssetDetailViewController>, StaffSelectable {
    var locationService: BDLocationService = .shared
    typealias AssetStatus = [String: String]
    typealias SelectedAssetStatus = (status: AssetStatus.Key, name: AssetStatus.Value)
    var assetStatus: AssetStatus?
    var selectedAssetStatus: SelectedAssetStatus?

    public var dropDownOptions: [String] {
        assetStatus?.values.map { $0 } ?? []
    }

    private var location: CLLocation? {
        didSet {
            latitude = String(location?.coordinate.latitude ?? 0)
            longitude = String(location?.coordinate.longitude ?? 0)
        }
    }

    func setAssetStatus(for item: String) {
        guard item != selectedAssetStatus?.name, let assetStatus = assetStatus else { return }
        guard let status = assetStatus.key(from: item) else { return }
        selectedAssetStatus = (status: status, name: item)
    }

    var rgcData: LocationReGeocode?

    var longitude: String = ""

    var latitude: String = ""

    public var principal: Staff?
    public var user: Staff?

    var checkStatusName: String { transformAssetDetail.confirmDesc }

    var assetCheckItemName: String { selectedAssetStatus?.name ?? "" }

    var assetCheckItem: String { String(selectedAssetStatus?.status ?? "") }

    var checkPerson: String { app.credential?.userAccount ?? "" }

    var resourceNumber: String {
        get { transformAssetDetail.resourceNumber }
        set { transformAssetDetail.resourceNumber = newValue }
    }

    var tagNumber: String { transformAssetDetail.tagNumber }
    var assetName: String { transformAssetDetail.assetName }

    var manufactureName: String { transformAssetDetail.manufactureName }

    var modelName: String { transformAssetDetail.modelNumber }

    var locationCode: String { transformAssetDetail.assetLocationCode }
    var systemLocationName: String { transformAssetDetail.assetLocationName }
    var quantity: String { String(transformAssetDetail.quantity) }

    public var principalName: String { "\(transformAssetDetail.dutyPersonCode)/\(transformAssetDetail.dutyPersonName)" }

    var formattedLongitude: String { String(format: "%.6f", Double(longitude) ?? 0) }

    var formattedLatitude: String { String(format: "%.6f", Double(latitude) ?? 0) }

    var systemLongitude: String {
        guard !transformAssetDetail.longitude.isEmpty else { return "" }
        return String(format: "%.6f", Double(transformAssetDetail.longitude) ?? 0)
    }

    var systemLatitude: String {
        guard !transformAssetDetail.longitude.isEmpty else { return "" }
        return String(format: "%.6f", Double(transformAssetDetail.latitude) ?? 0)
    }

    private var transformAssetDetail: TransformAssetDetail

    init(request: RequestRepresentable,
         action: TransformAssetDetailViewController,
         transformAssetDetail: TransformAssetDetail)
    {
        self.transformAssetDetail = transformAssetDetail
        super.init(request: request, action: action)
        handleAssetDetailResult(transformAssetDetail: transformAssetDetail)
    }

    override func fetchDictionary(for status: APIRouter.DictionaryStatus) -> ViewModelFuture<AssetStatus?> {
        super.fetchDictionary(for: status).onSuccess { [weak self] status in
            guard let self = self else { return }
            `self`.assetStatus = status
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

    func submit() -> ViewModelFuture<TransformAssetDetail?> {
        api(of: TransformAssetDetailSubmitResponse.self,
            router: .transformAssetDetailSubmit(
                TransformAssetDetailSubmitParameter(
                    mapLocationDesc: rgcData?.eam.JSONString ?? "",
                    checkPerson: checkPerson,
                    latitude: latitude,
                    assetCheckItem: assetCheckItem,
                    resourceNumber: resourceNumber,
                    billLineId: transformAssetDetail.billLineId,
                    matchedFlag: transformAssetDetail.matchedFlag,
                    longitude: longitude
                )
            )).onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.transformAssetDetail.latitude = self.latitude
            `self`.transformAssetDetail.longitude = self.longitude
            `self`.transformAssetDetail.assetCheckItem = self.assetCheckItem
            `self`.transformAssetDetail.assetCheckItemName = self.assetCheckItemName
        }
    }

    func handleAssetDetailResult(transformAssetDetail: TransformAssetDetail) {
        let checkStatusName = transformAssetDetail.assetCheckItemName
        let checkStatus = assetStatus?.key(from: checkStatusName) ?? "0"
        selectedAssetStatus = (status: checkStatus, name: checkStatusName)
        let dutyPerson = transformAssetDetail.dutyPersonCode
        let dutyPersonName = transformAssetDetail.dutyPersonName

        principal = Staff(isCheck: false,
                          account: dutyPerson,
                          userName: dutyPersonName,
                          userCode: "",
                          userOrgName: "")
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as ScanViewController:
            return TransformAssetDetailScanViewModel(request: TransformInventoryDetailScanRequest(),
                                                     action: action) as! T
        case let action as PhotographViewController:

            let parameters = PhotographUploadParameter(category: .asset(tagNumber: tagNumber),
                                                       longitude: longitude,
                                                       latitude: latitude)
            return AssetPhotographViewModel(title: "资产照片采集",
                                            key: "资产标签号",
                                            viewStates: (first: .prepare, second: .prepare),
                                            parameter: parameters,
                                            request: PhotographRequest(),
                                            action: action) as! T
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }
    // swiftlint:enable force_cast
}
