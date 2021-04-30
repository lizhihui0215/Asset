//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

struct Location: Codable {
    var isCheck: Bool
    var locationCode: String
    var locationName: String
    var assetLocationId: String
}

extension Location: Item {}
extension Location: AutoEquatable {}
extension Location: AutoCodable {
    static let defaultIsCheck = false
    static let defaultLocationCode = ""
    static let defaultLocationName = ""
    static let defaultAssetLocationId = ""
}
