//
// Created by lizhihui on 2021/5/1.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

enum InventoryType: String {
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
