//
//  AssetInventoryTableViewCell.swift
//  Assets
//
//  Created by lizhihui on 2021/4/25.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

extension AssetInventoryTableViewCell: ReuseIdRepresentable {}

class AssetInventoryTableViewCell: BaseTableViewCell {
    struct ViewModel: ViewModelRepresentable {
        var status: InventoryType
        var name: String
        var code: String
    }

    var viewModel: ViewModel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var codeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension AssetInventoryTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewModel: ViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        codeLabel.text = viewModel.code
        statusLabel.text = viewModel.status.title
    }
}
