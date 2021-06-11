//
// Created by lizhihui on 2021/5/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension AssetTaskListTableViewCell: ReuseIdRepresentable {}

class AssetTaskListTableViewCell: BaseTableViewCell {
    struct ViewData: CellDataRepresentable {
        var isCheck: Bool
        var checkBillCode: String
        var taskNumber: String
        var taskStatusName: String
        var taskName: String
    }

    @IBOutlet var checkBillCodeLabel: UILabel!
    @IBOutlet var taskNumberLabel: UILabel!
    @IBOutlet var taskStatusNameLabel: UILabel!
    @IBOutlet var taskNameLabel: UILabel!
}

extension AssetTaskListTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewData: ViewData) {
        taskNumberLabel.text = viewData.taskNumber
        taskStatusNameLabel.text = viewData.taskStatusName
        checkBillCodeLabel.text = viewData.checkBillCode
        taskNumberLabel.text = viewData.taskName
    }
}
