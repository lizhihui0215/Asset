//
// Created by lizhihui on 2021/5/16.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class MineViewModel: BaseViewModel<MineViewController> {
    var name: String {
        app.credential?.userName ?? ""
    }

    var department: String {
        app.credential?.userOrgName ?? ""
    }
}
