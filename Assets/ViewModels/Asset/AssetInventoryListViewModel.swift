//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetInventoryListViewModel: PageableViewModel<AssetInventoryListViewController, DefaultSection<Asset>>, Searchable {
    typealias SelectedInventoryStatus = (status: InventoryStatus.Key, name: InventoryStatus.Value)

    enum Keys {
        enum Inventory: String {
            case All = "-1"
        }
    }

    enum Constants {
        static let inventoryStatusAll = "全部"
    }

    var appSearchText: String = ""
    let regionIdCompany = app.credential?.userCityId ?? ""
    let locationDetail: LocationDetail
    public var inventoryStatus: InventoryStatus = [Keys.Inventory.All.rawValue: Constants.inventoryStatusAll]

    private var selectedInventoryStatus: SelectedInventoryStatus = (Keys.Inventory.All.rawValue, Constants.inventoryStatusAll)

    public var dropDownOptions: [String] {
        inventoryStatus.values.map { $0 }
    }

    private var assetLocationId: String {
        locationDetail.locationId
    }

    func setSelectedInventoryStatus(for item: String) -> ViewModelFuture<[Asset]> {
        guard item != selectedInventoryStatus.name else { return ViewModelFuture(error: EAMError.unwrapOptionalValueError("SelectedInventoryStatus")) }
        guard let status = inventoryStatus.key(from: item) else { return ViewModelFuture(error: EAMError.unwrapOptionalValueError("InventoryStatus")) }
        selectedInventoryStatus = (status: status, name: item)
        return fetchList()
    }

    private var locationId: String {
        locationDetail.locationId
    }

    private var locationCode: String {
        locationDetail.locationCode
    }

    init(request: RequestRepresentable, action: AssetInventoryListViewController, locationDetail: LocationDetail) {
        self.locationDetail = locationDetail
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchInventoryStatus() -> ViewModelFuture<InventoryStatus?> {
        super.fetchInventoryStatus().onSuccess { result in
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
            checkPerson: regionIdCompany,
            appSearchText: appSearchText,
            assetLocationId: assetLocationId,
            total: "", // FIXME: where total from
            regionIdCompany: regionIdCompany,
            locationCode: locationCode,
            appCheckStatus: selectedInventoryStatus.status
        )

        return api(of: AssetInventoryListResponse.self, router: .assetInventoryList(parameter))
            .onSuccess { [weak self] locations in
                guard var first = self?.first else { return }
                guard isPaging else { first.items = locations; return }

                first.append(contentsOf: locations)
            }
    }

    func scanViewModel(action: ScanViewController) -> ScanViewModel {
        LocationScanViewModel(request: AssetDetailRequest(), action: action, locationDetail: locationDetail)
    }

    func assetInventoryCellViewModel(at indexPath: IndexPath) -> AssetInventoryTableViewCell.ViewModel {
        let asset = itemAtIndexPath(indexPath: indexPath)
        return .init(status: asset.checkStatus, name: asset.assetName, code: asset.tagNumber)
    }
}
