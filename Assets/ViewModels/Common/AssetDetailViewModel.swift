//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetDetailViewModel {
    private var location: CLLocation?

    func update(location: CLLocation?, refresh: Bool = false) {
        self.location = location
    }
}
