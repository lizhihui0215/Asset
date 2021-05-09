//
// Created by lizhihui on 2021/5/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension AssetListTableViewCell: ReuseIdRepresentable {}

class AssetListTableViewCell: BaseTableViewCell {
    struct ViewModel: ViewModelRepresentable {
        var status: InventoryType
        var tagNumber: String
        var name: String
        var isCheck: String
        var identifier: String
        var statusName: String
    }

    @IBOutlet var tagNumberLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
}

extension AssetListTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        tagNumberLabel.text = viewModel.tagNumber
    }
}
