//
//  AssetSearchViewModel.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskSearchViewModel: BaseViewModel<AssetTaskSearchViewController> {
    typealias TaskStatus = [String: String]
    typealias SelectedTaskStatus = (status: TaskStatus.Key, name: TaskStatus.Value)

    var taskStatus: TaskStatus = defaultOption
    var selectedTaskStatus: SelectedTaskStatus?

    public var dropDownOptions: [String] {
        let options = taskStatus.values.map { $0 }
        let sortedOptions = try? options.sorted(by: defaultDataDictionarySort)
        return sortedOptions ?? options
    }

    override func fetchDictionary(for status: APIRouter.DictionaryStatus) -> ViewModelFuture<TaskStatus?> {
        super.fetchDictionary(for: status).onSuccess { [weak self] status in
            guard let self = self, let status = status else { return }
            `self`.taskStatus.merge(status) { $1 }
        }
    }

    func setAssetStatus(for item: String) {
        guard item != selectedTaskStatus?.name else { return }
        guard let status = taskStatus.key(from: item) else { return }
        selectedTaskStatus = (status: status, name: item)
    }
}
