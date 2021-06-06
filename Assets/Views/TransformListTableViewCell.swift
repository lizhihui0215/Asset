//
// Created by Bernard on 2021/6/4.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

extension TransformListTableViewCell: ReuseIdRepresentable {}

class TransformListTableViewCell: BaseTableViewCell {
    struct ViewData: CellDataRepresentable {
        let taskCode: String
        let taskStatusName: String
        let locationCode: String
        let locationName: String
        let sum: Int
        let finished: Int
    }

    @IBOutlet var taskCodeLabel: UILabel!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var locationCodeLabel: UILabel!

    @IBOutlet var statusNameLabel: UILabel!
    @IBOutlet var sumLabel: UILabel!
}

extension TransformListTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewData: ViewData) {
        taskCodeLabel.text = viewData.taskCode
        locationNameLabel.text = viewData.locationName
        locationCodeLabel.text = viewData.locationCode

        statusNameLabel.text = viewData.taskStatusName
        sumLabel.text = "\(viewData.finished)/\(viewData.sum)"
    }
}
