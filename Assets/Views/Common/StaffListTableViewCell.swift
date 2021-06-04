//
// Created by lizhihui on 2021/5/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension StaffListTableViewCell: ReuseIdRepresentable {}

class StaffListTableViewCell: BaseTableViewCell, TableViewCellConfigurable {
    struct ViewData: CellDataRepresentable {
        var isCheck: Bool
        var account: String
        var name: String
        var code: String
        var organization: String
    }

    @IBOutlet var accountLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var organizationLabel: UILabel!

    func configurationCell(with viewModel: ViewData) {
        accountLabel.text = viewModel.account
        nameLabel.text = viewModel.name
        codeLabel.text = viewModel.code
        organizationLabel.text = viewModel.organization
    }
}
