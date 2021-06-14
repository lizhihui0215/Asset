//
// Created by lizhihui on 2021/5/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension AssetTaskInventoryListTableViewCell: ReuseIdRepresentable {}

class AssetTaskInventoryListTableViewCell: BaseTableViewCell {
    struct ViewData: CellDataRepresentable {
        var isCheck: Bool
        var checkBillCode: String
        var taskNumber: String
        var taskStatusName: String
        var taskName: String
    }

}

extension AssetTaskInventoryListTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewData: ViewData) {
        
    }
}
