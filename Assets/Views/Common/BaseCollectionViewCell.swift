//
// Created by lizhihui on 2021/4/21.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionViewCellConfigurable {
    associatedtype ViewModel: ViewModelRepresentable
    func configurationCell(with viewModel: ViewModel)
}

class BaseCollectionViewCell: UICollectionViewCell {
    var indexPath = IndexPath(item: 0, section: 0)
}
