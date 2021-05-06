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
    struct ViewModel: ViewModelRepresentable {
        let code: String
        let name: String
        let isCheck: Bool
    }

    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    var viewModel: ViewModel!

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
    func configurationCell(with viewModel: ViewModel) {
        self.viewModel = viewModel
        nameLabel.text = viewModel.name
        codeLabel.text = viewModel.code
    }
}
