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

    private var location: CLLocation? {
        didSet {
            latitude = String(location?.coordinate.latitude ?? 0)
            longitude = String(location?.coordinate.longitude ?? 0)
        }
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

    var serial: String {
        get { assetTaskInventoryDetail.serial }
        set { assetTaskInventoryDetail.serial = newValue }
    }

    var tagNumber: String { assetTaskInventoryDetail.tagNumber }
    var assetName: String { assetTaskInventoryDetail.assetName }
    var manufactureName: String { assetTaskInventoryDetail.manufactureName }
    var modelName: String { assetTaskInventoryDetail.modelNumber }
    var systemLocationCode: String { assetTaskInventoryDetail.locationCode }
    var locationCode: String { assetTaskInventoryDetail.realLocationCode }
    var systemLocationName: String { assetTaskInventoryDetail.locationName }
    var locationName: String { assetTaskInventoryDetail.realLocationName }
    var quantity: String { String(assetTaskInventoryDetail.quantity) }

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
        fatalError("")
//        api(of: AssetTaskDetailResponse.self,
//            router: .assetTaskDetailSubmit(AssetTaskDetailSubmitParameter(mapLocationDesc: rgcData?.eam.JSONString ?? "",
//                                                                          checkPerson: checkPerson,
//                                                                          checkBillCode: checkBillCode,
//                                                                          latitude: latitude,
//                                                                          taskNumber: taskNumber,
//                                                                          longitude: longitude))).onSuccess { [weak self] result in
//            guard let self = self else { return }
//            `self`.taskDetail?.latitude = result?.latitude ?? ""
//            `self`.taskDetail?.longitude = result?.longitude ?? ""
//        }
    }

    func handleAssetDetailResult(assetTaskInventoryDetail: AssetTaskInventoryDetail) {
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
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }
    // swiftlint:enable force_cast
}
