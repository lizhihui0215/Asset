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

    func configurationCell(with viewData: ViewData) {
        accountLabel.text = viewData.account
        nameLabel.text = viewData.name
        codeLabel.text = viewData.code
        organizationLabel.text = viewData.organization
    }
}
