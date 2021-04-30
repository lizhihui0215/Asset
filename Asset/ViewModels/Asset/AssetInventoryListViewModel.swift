//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetInventoryListViewModel {
    public var dropDownOptions: [String] {
        let options: [InventoryType] = [.surplus,
                                        .deficit,
                                        .inventoried,
                                        .nonInventory]
        return options.map(\.title)
    }

    enum InventoryType: Int {
        case surplus
        case deficit
        case nonInventory
        case inventoried

        var title: String {
            switch self {
            case .surplus: return L10n.assetInventoryList.dropDown.options.surplus.title
            case .deficit: return L10n.assetInventoryList.dropDown.options.deficit.title
            case .nonInventory: return L10n.assetInventoryList.dropDown.options.nonInventory.title
            case .inventoried: return L10n.assetInventoryList.dropDown.options.inventoried.title
            }
        }
    }
}
