//
//  AssetTaskInventoryDetailViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/6/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskInventoryDetailViewModel: BaseViewModel<AssetTaskInventoryDetailViewController>, StaffSelectable {
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

    var formattedLongitude: String { String(format: "%.6f", Double(longitude) ?? 0) }

    var formattedLatitude: String { String(format: "%.6f", Double(latitude) ?? 0) }

    var checkStatusName: String { assetTaskInventoryDetail.checkStatusName }

    var assertUseName: String { assetTaskInventoryDetail.assetCheckItemName }

    var checkPerson: String { app.credential?.userAccount ?? "" }

    var resourceNumber: String {
        get { assetTaskInventoryDetail.resourceNumber }
        set { assetTaskInventoryDetail.resourceNumber = newValue }
    }

    var tagNumber: String { assetTaskInventoryDetail.tagNumber }
    var assetName: String {
        get { assetTaskInventoryDetail.assetName }
        set { assetTaskInventoryDetail.assetName = newValue }
    }

    var manufactureName: String {
        get { assetTaskInventoryDetail.manufactureName }
        set { assetTaskInventoryDetail.manufactureName = newValue }
    }

    var modelName: String {
        get { assetTaskInventoryDetail.modelNumber }
        set { assetTaskInventoryDetail.modelNumber = newValue }
    }

    var systemLocationCode: String { assetTaskInventoryDetail.locationCode }
    var locationCode: String { assetTaskInventoryDetail.realLocationCode }
    var systemLocationName: String { assetTaskInventoryDetail.locationName }
    var locationName: String { assetTaskInventoryDetail.realLocationName }
    var quantity: String {
        get { String(assetTaskInventoryDetail.quantity) }
        set { assetTaskInventoryDetail.quantity = Int(newValue) ?? 0 }
    }

    public var principalName: String {
        get { principal?.userName ?? "" }
        set {
            assetTaskInventoryDetail.dutyPersonName = principal?.userName ?? ""
            assetTaskInventoryDetail.dutyPerson = principal?.userCode ?? ""
        }
    }

    public var userName: String {
        get { user?.userName ?? "" }
        set {
            assetTaskInventoryDetail.usePerson = user?.userName ?? ""
            assetTaskInventoryDetail.usePersonName = user?.userCode ?? ""
        }
    }

    var systemLongitude: String {
        get { String(format: "%.6f", Double(assetTaskInventoryDetail.longitude) ?? 0) }
        set { assetTaskInventoryDetail.longitude = newValue }
    }

    public var selectedAssetCheckItem: String = ""
    var systemLatitude: String {
        get { String(format: "%.6f", Double(assetTaskInventoryDetail.latitude) ?? 0) }
        set { assetTaskInventoryDetail.latitude = newValue }
    }

    private var assetTaskInventoryDetail: AssetTaskInventoryDetail

    init(request: RequestRepresentable, action: AssetTaskInventoryDetailViewController,
         assetTaskInventoryDetail: AssetTaskInventoryDetail)
    {
        self.assetTaskInventoryDetail = assetTaskInventoryDetail
        super.init(request: request, action: action)
        handleAssetDetailResult(assetTaskInventoryDetail: assetTaskInventoryDetail)
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

    func submit() -> ViewModelFuture<AssetTaskInventoryDetail?> {
        api(of: AssetTaskInventoryDetailSubmitResponse.self,
            router: .assetTaskInventoryDetailSubmit(
                AssetTaskInventoryDetailSubmitParameter(
                    realLocationCode: assetTaskInventoryDetail.realLocationCode,
                    quantity: quantity,
                    checkPerson: checkPerson,
                    latitude: latitude,
                    dutyPersonName: principal?.userName ?? "",
                    assetCheckItem: selectedAssetStatus?.status ?? "",
                    resourceNumber: resourceNumber,
                    usePersonName: userName,
                    tagNumber: tagNumber,
                    mapLocationDesc: rgcData?.JSONString ?? "",
                    dutyPerson: principal?.account ?? "",
                    assetId: assetTaskInventoryDetail.assetId,
                    checkBillCode: assetTaskInventoryDetail.checkBillCode,
                    manufactureName: manufactureName,
                    usePerson: principalName,
                    assetName: assetName,
                    realLocationName: assetTaskInventoryDetail.realLocationName,
                    modelNumber: modelName,
                    longitude: longitude
                )))
//                .onSuccess { [weak self] result in
//            guard let self = self else { return }
//            `self`.assetTaskInventoryDetail.latitude = result?.latitude ?? ""
//            `self`.assetTaskInventoryDetail.longitude = result?.longitude ?? ""
//        }
    }

    func handleAssetDetailResult(assetTaskInventoryDetail: AssetTaskInventoryDetail) {
        let checkStatusName = assetTaskInventoryDetail.assetCheckItemName
        let checkStatus = assetStatus?.key(from: checkStatusName) ?? "0"
        selectedAssetStatus = (status: checkStatus, name: checkStatusName)
        let dutyPerson = assetTaskInventoryDetail.dutyPerson
        let dutyPersonName = assetTaskInventoryDetail.dutyPersonName
        let usePerson = assetTaskInventoryDetail.usePerson
        let usePersonName = assetTaskInventoryDetail.usePersonName

        principal = Staff(isCheck: false,
                          account: dutyPerson,
                          userName: dutyPersonName,
                          userCode: "",
                          userOrgName: "")

        user = Staff(isCheck: false,
                     account: usePerson,
                     userName: usePersonName,
                     userCode: "",
                     userOrgName: "")
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as ScanViewController:
            return AssetTaskInventoryDetailScanViewModel(request: AssetTaskInventoryDetailScanRequest(),
                                                         action: action) as! T
        case let action as StaffListViewController:
            return StaffListViewModel(request: StaffListRequest(),
                                      action: action,
                                      category: sender as! Staff.Category, segue: .unwindFromStaffSelectedToAssetTaskInventoryDetail) as! T
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
