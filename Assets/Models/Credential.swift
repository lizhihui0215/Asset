//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

struct Credential {
    var pageSize: String
    var userOrgId: String
    var userName: String
    var userCityId: String
    var userCityName: String
    var userToken: String
    var userAccount: String
    var userOrgName: String
}

extension Credential: AutoEquatable {}

extension Credential: AutoCodable {
    static let defaultPageSize = ""
    static let defaultUserOrgId = ""
    static let defaultUserName = ""
    static let defaultUserCityId = ""
    static let defaultUserCityName = ""
    static let defaultUserToken = ""
    static let defaultUserAccount = ""
    static let defaultUserOrgName = ""
}
