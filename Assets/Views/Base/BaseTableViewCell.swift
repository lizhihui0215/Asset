//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

protocol ViewDataRepresentable {}

protocol CellDataRepresentable: ViewDataRepresentable {}

protocol TableViewCellConfigurable {
    associatedtype ViewData: CellDataRepresentable
    func configurationCell(with viewData: ViewData)
}

class BaseTableViewCell: UITableViewCell {
    var indexPath = IndexPath(item: 0, section: 0)
}
