//
//  LocationListTableViewCell.swift
//  Assets
//
//  Created by lizhihui on 2021/4/22.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

extension LocationListTableViewCell: ReuseIdRepresentable {}

class LocationListTableViewCell: BaseTableViewCell {
    struct ViewData: CellDataRepresentable {
        let code: String
        let name: String
        let isCheck: Bool
    }

    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    var viewModel: ViewData!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension LocationListTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewData: ViewData) {
        viewModel = viewData
        nameLabel.text = viewData.name
        codeLabel.text = viewData.code
    }
}
