//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

struct Credential {
    let userToken: String
    let pageSize: String
    let userOrgName: String
    let userCityName: String
    let userOrgId: String
    let userCityId: String
}

extension Credential: AutoEquatable {}

extension Credential: AutoCodable {
    static let defaultUserToken = ""
    static let defaultPageSize = ""
    static let defaultUserOrgName = ""
    static let defaultUserCityName = ""
    static let defaultUserOrgId = ""
    static let defaultUserCityId = ""
}
