//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetInventoryListViewModel: PageableViewModel<AssetInventoryListViewController, DefaultSection<Asset>>, Searchable {
    typealias InventoryStatus = [String: String]
    typealias SelectedInventoryStatus = (status: InventoryStatus.Key, name: InventoryStatus.Value)

    var principal: Staff?

    var user: Staff?

    var appSearchText: String = ""
    let regionIdCompany = app.credential?.userCityId ?? ""
    let checkPerson = app.credential?.userAccount ?? ""
    let locationDetail: LocationDetail
    public var inventoryStatus: InventoryStatus = defaultOption

    public var selectedInventoryStatus: SelectedInventoryStatus?

    public var dropDownOptions: [String] {
        inventoryStatus.values.map { $0 }
    }

    private var assetLocationId: String {
        locationDetail.locationId
    }

    private var locationId: String {
        locationDetail.locationId
    }

    private var locationCode: String {
        locationDetail.locationCode
    }

    private var locationName: String {
        locationDetail.locationName
    }

    init(request: RequestRepresentable, action: AssetInventoryListViewController, locationDetail: LocationDetail) {
        self.locationDetail = locationDetail
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchDictionary(for status: APIRouter.DictionaryStatus) -> ViewModelFuture<InventoryStatus?> {
        super.fetchDictionary(for: status).onSuccess { result in
            guard let result = result else { return }
            self.inventoryStatus.merge(result) { $1 }
        }
    }

    override func fetchList(isPaging: Bool = false) -> ViewModelFuture<[Asset]> {
        self.isPaging = isPaging
        let parameter = AssetInventoryListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            locationId: locationId,
            checkPerson: checkPerson,
            appSearchText: appSearchText,
            assetLocationId: assetLocationId,
            total: "1", // FIXME: where total from
            regionIdCompany: regionIdCompany,
            locationCode: locationCode,
            appCheckStatus: selectedInventoryStatus?.status ?? "",
            dutyPerson: principal?.account ?? "",
            usePerson: user?.account ?? ""
        )

        return pageableApi(of: AssetInventoryListResponse.self, router: .assetInventoryList(parameter))
            .onSuccess { [weak self] assets in
                guard let first = self?.first else { return }
                guard isPaging else { first.items = assets; return }
                first.items.append(contentsOf: assets)
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIViewController, with sender: Any? = nil) -> T {
        switch action {
        case let action as ScanViewController:
            return LocationInventoryScanViewModel(request: LocationScanRequest(), action: action, locationDetail: locationDetail) as! T
        case let action as AssetDetailViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let assetId = itemAtIndexPath(indexPath: indexPath).assetId
            let parameters = AssetInventoryListDetailParameter(assetId: assetId,
                                                               checkPerson: checkPerson)

            let configuration = AssetDetailViewController.Configuration(isHiddenCoordinate: false,
                                                                        isHiddenInventoryStatus: false,
                                                                        isHiddenStatus: false,
                                                                        isHiddenDeviceSerial: false,
                                                                        isHiddenCategoryCode: true,
                                                                        isHiddenCategoryName: true,
                                                                        isHiddenLocationCode: false,
                                                                        isHiddenLocationName: false,
                                                                        isHiddenPrincipalCode: true,
                                                                        isHiddenUserAccount: true,
                                                                        isHiddenPrincipal: false,
                                                                        isHiddenUser: false,
                                                                        locationCodeTitle: "实际地点编码:",
                                                                        locationNameTitle: "实际地点名称:",
                                                                        rightBarButtonItemTitle: "拍照",
                                                                        rightBarButtonItemAction: .photograph)
            return AssetInventoryListDetailViewModel(request: AssetListDetailRequest(),
                                                     action: action,
                                                     viewState: .viewing(configuration: configuration),
                                                     parameters: parameters) as! T
        case let action as AssetInventoryListSearchViewController:
            return AssetInventoryListSearchViewModel(request: AssetInventoryListSearchRequest(), action: action) as! T
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as AssetInventoryListViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let asset = itemAtIndexPath(indexPath: indexPath)
            return AssetInventoryTableViewCell.ViewData(statusName: asset.checkStatusName, name: asset.assetName, code: asset.tagNumber) as! T
        default: break
        }
        return super.viewData(for: action, with: sender)
    }

    // swiftlint:enable force_cast
}
