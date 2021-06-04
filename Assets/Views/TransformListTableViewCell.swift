//
// Created by Bernard on 2021/6/4.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

extension TransformListTableViewCell: ReuseIdRepresentable {}

class TransformListTableViewCell: BaseTableViewCell {
    struct ViewData: CellDataRepresentable {
        let appTaskCode: String
        let appTaskStatusName: String
        let locationName: String
        let assetSum: String
    }
}

extension TransformListTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewModel: ViewData) {}
}
