//
//  AssetSearchViewModel.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskListSearchViewModel: BaseViewModel<AssetTaskListSearchViewController> {
    var searchText: String = ""

    typealias InventoryStatus = [String: String]

    typealias SelectedInventoryStatus = (status: InventoryStatus.Key, name: InventoryStatus.Value)

    var inventoryStatus: InventoryStatus = defaultOption
    var selectedInventoryStatus: SelectedInventoryStatus?

    public var dropDownOptions: [String] {
        let options = inventoryStatus.values.map { $0 }
        let sortedOptions = try? options.sorted(by: defaultDataDictionarySort)
        return sortedOptions ?? options
    }

    func setConfirmStatus(for item: String) {
        guard item != selectedInventoryStatus?.name else { return }
        guard let status = inventoryStatus.key(from: item) else { return }
        selectedInventoryStatus = (status: status, name: item)
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as StaffListViewController:
            return StaffListViewModel(request: StaffListRequest(),
                                      action: action,
                                      category: sender as! Staff.Category, segue: .unwindFromStaffSelectedToAssetInventoryListSearchViewController) as! T
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }

    // swiftlint:enable force_cast

    override func fetchDictionary(for status: APIRouter.DictionaryStatus) -> ViewModelFuture<InventoryStatus?> {
        super.fetchDictionary(for: status).onSuccess { result in
            guard let result = result else { return }
            self.inventoryStatus.merge(result) { $1 }
        }
    }
}
