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
    struct ViewData: CellDataRepresentable {
        var statusName: String
        var name: String
        var code: String
    }

    var viewModel: ViewData!
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
    func configurationCell(with viewData: ViewData) {
        viewModel = viewData
        nameLabel.text = viewData.name
        codeLabel.text = viewData.code
        statusLabel.text = viewData.statusName
    }
}
