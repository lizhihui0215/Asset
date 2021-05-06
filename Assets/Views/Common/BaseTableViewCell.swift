//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewCellConfigurable {
    associatedtype ViewModel: ViewModelRepresentable
    func configurationCell(with viewModel: ViewModel)
}

class BaseTableViewCell: UITableViewCell {
    var indexPath = IndexPath(item: 0, section: 0)
}
