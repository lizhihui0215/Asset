//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetInventoryListViewModel: PageableViewModel<AssetInventoryListViewController, DefaultSection<Asset>>, Searchable {
    var appSearchText: String = ""
    let userOrgId = app.credential?.userOrgId ?? ""
    let locationId: String = ""

    public var dropDownOptions: [String] {
        let options: [InventoryType] = [.all,
                                        .surplus,
                                        .deficit,
                                        .inventoried,
                                        .nonInventory]
        return options.map(\.title)
    }

    init(request: RequestRepresentable, action: AssetInventoryListViewController, locationId: String) {
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    func fetchList(isPaging: Bool = false, completionHandler: @escaping ViewModelCompletionHandler<[Asset]>)
    {
        self.isPaging = isPaging
        let parameter = AssetInventoryListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            locationId: locationId,
            userOrgId: userOrgId,
            appSearchText: appSearchText
        )

        api(of: AssetInventoryListResponse.self,
            router: .assetInventoryList(parameter)) { [weak self] (result: ViewModelResult<[Asset]>) in
            guard var first = self?.first, let locations = try? result.get() else { return }
            first.append(contentsOf: locations)
            completionHandler(.success(locations))
        }
    }

    func assetInventoryCellViewModel(at indexPath: IndexPath) -> AssetInventoryTableViewCell.ViewModel {
        let asset = itemAtIndexPath(indexPath: indexPath)

        return .init(status: asset.status, name: asset.name, code: asset.code)
    }
}
