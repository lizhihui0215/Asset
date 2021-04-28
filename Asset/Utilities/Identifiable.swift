//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol Identifiable {
    associatedtype ID: Hashable
    var identifier: ID { get set }
}
