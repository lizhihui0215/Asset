//
// Created by lizhihui on 2021/5/1.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

enum InventoryType: Int {
    case all = 0
    case surplus = 1
    case deficit = 2
    case nonInventory = 3
    case inventoried = 4

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

extension InventoryType: Codable {}
