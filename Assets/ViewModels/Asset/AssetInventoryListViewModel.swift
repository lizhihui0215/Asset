//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetInventoryListViewModel: PageableViewModel<AssetInventoryListViewController, DefaultSection<AssetDetail>>, Searchable {
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

    enum InventoryType: Int {
        case all
        case surplus
        case deficit
        case nonInventory
        case inventoried

        var title: String {
            switch self {
            case .all: return L10n.assetInventoryList.dropDown.options.all.title
            case .surplus: return L10n.assetInventoryList.dropDown.options.surplus.title
            case .deficit: return L10n.assetInventoryList.dropDown.options.deficit.title
            case .nonInventory: return L10n.assetInventoryList.dropDown.options.nonInventory.title
            case .inventoried: return L10n.assetInventoryList.dropDown.options.inventoried.title
            }
        }
    }

    init(request: RequestRepresentable, action: AssetInventoryListViewController, locationId: String) {
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    func fetchList(isPaging: Bool = false, completionHandler: @escaping ViewModelCompletionHandler<[Location]>)
    {
//        self.isPaging = isPaging
//        let parameter = LocationListParameter(
//                pageNumber: String(page),
//                pageSize: String(size),
//                regionIdCompany: regionIdCompany,
//                appSearchText: appSearchText
//        )
//
//        api(of: LocationListResponse.self,
//                router: .locationList(parameter)) { [weak self] (result: ViewModelResult<[Location]>) in
//            guard var first = self?.first, let locations = try? result.get() else { return }
//            first.append(contentsOf: locations)
//            completionHandler(.success(locations))
//        }
    }
}
