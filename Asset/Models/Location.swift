//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

struct Location: Codable {
    var isCheck: Bool = false
    var locationCode = App.Constants.Default.string
    var locationName = App.Constants.Default.string
    var assetLocationId = ""
}

extension Location: Item {}
extension Location: AutoEquatable {}
