//
// Created by lizhihui on 2021/5/16.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct IsLogin {
    var loginId: String
    var userToken: String
    var userAccount: String
    var loginDate: String
    var logoutDate: String
    var tokenStatus: String
    var appType: App.Category
}

extension IsLogin: AutoEquatable {}

extension IsLogin: AutoCodable {
    static let defaultLoginId = ""
    static let defaultUserToken = ""
    static let defaultUserAccount = ""
    static let defaultLoginDate = ""
    static let defaultLogoutDate = ""
    static let defaultTokenStatus = ""
    static let defaultAppType: App.Category = .ios
}
