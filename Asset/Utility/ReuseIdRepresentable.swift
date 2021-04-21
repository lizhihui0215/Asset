//
// Created by lizhihui on 2021/4/21.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

protocol ReuseIdRepresentable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdRepresentable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}

extension ReuseIdRepresentable where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        NSStringFromClass(self).components(separatedBy: ".").last ?? ""
    }
}
