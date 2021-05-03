//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetInventoryListViewModel: PageableViewModel<AssetInventoryListViewController, DefaultSection<Asset>>, Searchable {
    var appSearchText: String = ""
    let regionIdCompany = app.credential?.userCityId ?? ""
    let locationDetail: LocationDetail

    public var dropDownOptions: [String] {
        let options: [InventoryType] = [.all,
                                        .surplus,
                                        .deficit,
                                        .inventoried,
                                        .nonInventory]
        return options.map(\.title)
    }

    private var assetLocationId: String {
        locationDetail.assetLocationId
    }

    private var locationId: String {
        locationDetail.locationId
    }

    private var locationCode: String {
        locationDetail.locationCode
    }

    private var checkStatus = "-1"

    init(request: RequestRepresentable, action: AssetInventoryListViewController, locationDetail: LocationDetail) {
        self.locationDetail = locationDetail
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    func fetchList(isPaging: Bool = false) -> ViewModelFuture<[Asset]> {
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
            appCheckStatus: checkStatus
        )

        return api(of: AssetInventoryListResponse.self, router: .assetInventoryList(parameter))
            .onSuccess { [weak self] locations in
                guard var first = self?.first else { return }
                first.append(contentsOf: locations)
            }
    }

    func scanViewModel(action: ScanViewController) -> ScanViewModel {
        ScanViewModel(request: AssetDetailRequest(), action: action, locationDetail: locationDetail)
    }

    func assetInventoryCellViewModel(at indexPath: IndexPath) -> AssetInventoryTableViewCell.ViewModel {
        let asset = itemAtIndexPath(indexPath: indexPath)
        return .init(status: asset.checkStatus, name: asset.assetName, code: asset.tagNumber)
    }
}
