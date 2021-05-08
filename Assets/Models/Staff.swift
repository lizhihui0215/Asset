//
// Created by lizhihui on 2021/5/5.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct Staff {
    enum Category: String {
        case principal
        case user
    }

    var isCheck: Bool
    var account: String
    var userName: String
    var userCode: String
    var userOrgName: String
    var category: Category = .user
}

extension Staff: Item {}
extension Staff: AutoEquatable {}
extension Staff: AutoCodable {
    static var defaultCategory = Category.user
    static var defaultIsCheck = false
    static var defaultAccount = ""
    static var defaultUserName = ""
    static var defaultUserCode = ""
    static var defaultUserOrgName = ""
}

extension Staff.Category: AutoCodable {}
