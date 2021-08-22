//
//  AssetSearchViewModel.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class TransformAssetListSearchViewModel: BaseViewModel<TransformAssetListSearchViewController> {
    var searchText: String = ""

    typealias ConfirmStatus = [String: String]

    typealias SelectedConfirmStatus = (status: ConfirmStatus.Key, name: ConfirmStatus.Value)

    var confirmStatus: ConfirmStatus = defaultOption
    var selectedConfirmStatus: SelectedConfirmStatus?

    public var dropDownOptions: [String] {
        let options = confirmStatus.values.map { $0 }
        let sortedOptions = try? options.sorted(by: defaultDataDictionarySort)
        return sortedOptions ?? options
    }

    func setConfirmStatus(for item: String) {
        guard item != selectedConfirmStatus?.name else { return }
        guard let status = confirmStatus.key(from: item) else { return }
        selectedConfirmStatus = (status: status, name: item)
    }

    override func fetchDictionary(for status: APIRouter.DictionaryStatus) -> ViewModelFuture<ConfirmStatus?> {
        super.fetchDictionary(for: status).onSuccess { result in
            guard let result = result else { return }
            self.confirmStatus.merge(result) { $1 }
        }
    }
}
