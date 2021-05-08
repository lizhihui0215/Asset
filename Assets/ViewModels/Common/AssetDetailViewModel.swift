//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

class AssetDetailViewModel: BaseViewModel<AssetDetailViewController> {
    private var parameters: AssetDetailParameter!

    typealias SelectedAssetStatus = (status: AssetStatus.Key, name: AssetStatus.Value)

    typealias AssetStatus = [String: String]

    typealias ViewState = AssetDetailViewController.ViewState

    enum Keys {
        enum AssetStatus: String {
            case inUsing = "0"
        }
    }

    enum Constants {
        static let assetStatusInUsing = "在用"
    }

    private var location: CLLocation?

    private var assetDetail: AssetDetail!
    public var principal: Staff?
    public var user: Staff?
    var locationService: BDLocationService = .shared
    var assetStatus: AssetStatus = [Keys.AssetStatus.inUsing.rawValue: Constants.assetStatusInUsing]
    var selectedAssetStatus: SelectedAssetStatus?
    public var deviceSerial: String {
        assetDetail.resourceNumber
    }

    public var tagNumber: String {
        assetDetail.tagNumber
    }

    public var name: String {
        assetDetail.assetName
    }

    public var category: String {
        assetDetail.typeDescriptionCode
    }

    public var description: String {
        assetDetail.typeDescriptionName
    }

    public var manufacture: String {
        assetDetail.manufactureName
    }

    public var model: String {
        assetDetail.modelNumber
    }

    public var systemLocationCode: String {
        assetDetail.locationCode
    }

    public var systemLocationName: String {
        assetDetail.locationName
    }

    public var locationCode: String {
        assetDetail.realLocationCode
    }

    public var locationName: String {
        assetDetail.realLocationName
    }

    public var amount: String {
        String(assetDetail.quantity)
    }

    public var principalName: String {
        principal?.userName ?? ""
    }

    public var userName: String {
        user?.userName ?? ""
    }

    public var systemLongitude: String {
        assetDetail.longitude
    }

    private var state: ViewState

    func viewState() -> ViewModelFuture<ViewState> {
        guard assetDetail == nil else { return ViewModelFuture(value: state) }

        return fetchAssetDetail().flatMap { [weak self] assetDetail -> ViewModelFuture<ViewState> in
            guard let self = self else { return ViewModelFuture(error: EAMError.weakSelfUnWrapError as Error) }
            `self`.assetDetail = assetDetail
            return ViewModelFuture(value: `self`.state)
        }
    }

    func fetchAssetDetail() -> ViewModelFuture<AssetDetail?> {
        api(of: AssetDetailResponse.self, router: .assetDetail(parameters))
    }

    public var systemLatitude: String {
        assetDetail.latitude
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
        assetDetail.assetCheckItemName
    }

    public var status: String {
        selectedAssetStatus?.name ?? ""
    }

    init(request: RequestRepresentable,
         action: AssetDetailViewController,
         viewState: ViewState,
         assetDetail: AssetDetail? = nil,
         parameters: AssetDetailParameter? = nil)
    {
        state = viewState
        self.parameters = parameters
        self.assetDetail = assetDetail
        super.init(request: request, action: action)
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as StaffListViewController:
            return StaffListViewModel(request: AssetDetailRequest(),
                                      action: action,
                                      category: sender as! Staff.Category) as! T
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }

    // swiftlint:enable force_cast

    func getGPSLocation() -> ViewModelFuture<CLLocation?> {
        locationService.getGPSLocation().flatMap { [weak self] result -> ViewModelFuture<CLLocation?> in
            guard let result = result, let self = self else {
                return ViewModelFuture(error: EAMError.unwrapOptionalValueError("location"))
            }
            `self`.location = result.location
            return ViewModelFuture(value: result.location)
        }
    }
}
