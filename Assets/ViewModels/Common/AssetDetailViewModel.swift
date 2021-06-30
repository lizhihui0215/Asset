//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import BrightFutures
import Foundation
import UIKit

protocol AssetDetailed {
    var assetId: String { get }
    var resourceNumber: String { get set }
    var tagNumber: String { get }
    var assetName: String { get set }
    var typeDescriptionCode: String { get }
    var typeDescriptionName: String { get }
    var manufactureName: String { get set }
    var modelNumber: String { get set }
    var locationCode: String { get }
    var locationName: String { get }
    var realLocationCode: String { get }
    var realLocationName: String { get }
    var quantity: Int { get set }
    var longitude: String { get }
    var latitude: String { get }
    var checkStatus: String { get }
    var checkStatusName: String { get }
    var dutyPerson: String { get set }
    var dutyPersonName: String { get set }
    var usePerson: String { get set }
    var usePersonName: String { get set }
    var assetCheckItemName: String { get }
    var principalCode: String { get }
    var userAccount: String { get }
}

class AssetDetailViewModel: BaseViewModel<AssetDetailViewController>, StaffSelectable {
    var parameters: AssetDetailParameterRepresentable!

    typealias SelectedAssetStatus = (status: AssetStatus.Key, name: AssetStatus.Value)

    typealias ViewState = AssetDetailViewController.ViewState

    enum Keys {}

    enum Constants {}

    var location: CLLocation?
    var rgcData: LocationReGeocode?

    public var principal: Staff?
    public var user: Staff?
    var locationService: BDLocationService = .shared
    var assetStatus: AssetStatus?
    var selectedAssetStatus: SelectedAssetStatus?
    private var state: ViewState
    var assetDetail: AssetDetailed?

    public var deviceSerial: String {
        get { assetDetail?.resourceNumber ?? "" }
        set { assetDetail?.resourceNumber = newValue }
    }

    public var tagNumber: String {
        assetDetail?.tagNumber ?? ""
    }

    public var name: String {
        get { assetDetail?.assetName ?? "" }
        set { assetDetail?.assetName = newValue }
    }

    public var category: String {
        assetDetail?.typeDescriptionCode ?? ""
    }

    public var description: String {
        assetDetail?.typeDescriptionName ?? ""
    }

    public var manufacture: String {
        get { assetDetail?.manufactureName ?? "" }
        set { assetDetail?.manufactureName = newValue }
    }

    public var model: String {
        get { assetDetail?.modelNumber ?? "" }
        set { assetDetail?.modelNumber = newValue }
    }

    public var systemLocationCode: String {
        assetDetail?.locationCode ?? ""
    }

    public var systemLocationName: String {
        assetDetail?.locationName ?? ""
    }

    public var locationCode: String {
        assetDetail?.realLocationCode ?? ""
    }

    public var locationName: String {
        assetDetail?.realLocationName ?? ""
    }

    public var amount: String {
        get { String(assetDetail?.quantity ?? 0) }
        set { assetDetail?.quantity = Int(newValue) ?? 0 }
    }

    public var principalName: String {
        get { principal?.userName ?? "" }
        set {
            assetDetail?.dutyPersonName = principal?.userName ?? ""
            assetDetail?.dutyPerson = principal?.userCode ?? ""
        }
    }

    public var userName: String {
        get { user?.userName ?? "" }
        set {
            assetDetail?.usePerson = user?.userName ?? ""
            assetDetail?.usePersonName = user?.userCode ?? ""
        }
    }

    public var systemLongitude: String {
        assetDetail?.longitude ?? ""
    }

    public var dropDownOptions: [String] {
        assetStatus?.values.map { $0 } ?? []
    }

    public var systemLatitude: String {
        assetDetail?.latitude ?? ""
    }

    public var userAccount: String {
        assetDetail?.userAccount ?? ""
    }

    public var principalCode: String {
        assetDetail?.principalCode ?? ""
    }

    public var longitude: String {
        guard let longitude = location?.coordinate.longitude else { return "" }
        return String(longitude)
    }

    public var latitude: String {
        guard let latitude = location?.coordinate.latitude else { return "" }
        return String(latitude)
    }

    public var inventoryStatus: String {
        assetDetail?.checkStatusName ?? ""
    }

    public var status: String {
        selectedAssetStatus?.name ?? ""
    }

    init(request: RequestRepresentable,
         action: AssetDetailViewController,
         viewState: ViewState,
         assetDetail: AssetDetailed? = nil,
         parameters: AssetDetailParameterRepresentable? = nil)
    {
        state = viewState
        self.parameters = parameters
        self.assetDetail = assetDetail
        super.init(request: request, action: action)
    }

    func setAssetStatus(for item: String) {
        guard item != selectedAssetStatus?.name, let assetStatus = assetStatus else { return }
        guard let status = assetStatus.key(from: item) else { return }
        selectedAssetStatus = (status: status, name: item)
    }

    func viewState(isFetch assetStatus: Bool) -> Future<ViewState, Never> {
        func viewState() -> Future<ViewState, Never> {
            Future(value: state)
        }

        let assetDetailFuture = assetDetailFuture().recover { error in
            log.debug("fetch asset detail error \(error)")
            return nil
        }

        guard assetStatus else {
            return assetDetailFuture.flatMap { _ in viewState() }
        }

        return assetDetailFuture.flatMap { [weak self] _ -> Future<AssetStatus?, Never> in
            guard let self = self else { return Future(value: nil) }
            return `self`.fetchAssetStatus().recover { error in
                log.debug("fetch asset status error \(error)")
                return nil
            }
        }.flatMap { _ in
            viewState()
        }
    }

    private func assetDetailFuture() -> ViewModelFuture<AssetDetailed?> {
        guard assetDetail == nil else {
            handleAssetDetailResult(assetDetail: assetDetail)
            return ViewModelFuture(value: assetDetail)
        }
        return fetchAssetDetail()
    }

    override func fetchAssetStatus() -> ViewModelFuture<AssetStatus?> {
        super.fetchAssetStatus().onSuccess { [weak self] status in
            guard let self = self else { return }
            `self`.assetStatus = status
        }
    }

    func fetchAssetDetail() -> ViewModelFuture<AssetDetailed?> {
        fatalError("sub class must implement this method")
    }

    func handleAssetDetailResult(assetDetail: AssetDetailed?) {
        self.assetDetail = assetDetail
        let checkStatusName = self.assetDetail?.assetCheckItemName ?? ""
        let checkStatus = assetStatus?.key(from: checkStatusName) ?? "0"
        let dutyPerson = self.assetDetail?.dutyPerson ?? ""
        let dutyPersonName = self.assetDetail?.dutyPersonName ?? ""
        let usePerson = self.assetDetail?.usePerson ?? ""
        let usePersonName = self.assetDetail?.usePersonName ?? ""
        selectedAssetStatus = (status: checkStatus, name: checkStatusName)
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
    override func viewModel<T: ViewModelRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as StaffListViewController:
            return StaffListViewModel(request: StaffListRequest(),
                                      action: action,
                                      category: sender as! Staff.Category, segue: .unwindFromStaffSelected) as! T
        case let action as PhotographViewController:
            guard let assetDetail = assetDetail else { break }

            let parameters = PhotographUploadParameter(category: .asset(tagNumber: tagNumber),
                                                       longitude: assetDetail.longitude,
                                                       latitude: assetDetail.latitude)
            return AssetPhotographViewModel(title: "资产照片采集",
                                            key: "资产标签号",
                                            parameter: parameters,
                                            request: PhotographRequest(),
                                            action: action) as! T
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }

    // swiftlint:enable force_cast

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

    func rightBarButtonTapped() -> ViewModelFuture<StoryboardSegue.Common> {
        fatalError("sub class must implement this method provider the navigation")
    }
}
