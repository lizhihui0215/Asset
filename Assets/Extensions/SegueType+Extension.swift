//
// Created by lizhihui on 2021/4/24.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

extension SegueType {
    func associatedTableViewCell<T: UITableViewCell>(from sender: Any?) -> T? {
        guard let sender = sender as? T else { return nil }
        return sender
    }

    func associatedCollectionViewCell<T: UICollectionViewCell>(from sender: Any?) -> T? {
        guard let sender = sender as? T else { return nil }
        return sender
    }
}
