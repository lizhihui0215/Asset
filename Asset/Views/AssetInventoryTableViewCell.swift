//
//  AssetInventoryTableViewCell.swift
//  Asset
//
//  Created by lizhihui on 2021/4/25.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

extension AssetInventoryTableViewCell: ReuseIdRepresentable {}

class AssetInventoryTableViewCell: BaseTableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
