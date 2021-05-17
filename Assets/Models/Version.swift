//
// Created by lizhihui on 2021/5/16.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct Version {
    let appType: App.Category
    let appVersionCode: String
    let appVersionName: String
    let appName: String
    let appPath: String
    let appDownloadUrl: String
    let appDesc: String
    let appExt: String
}

extension Version: AutoEquatable {}

extension Version: AutoCodable {
    static let defaultAppType: App.Category = .ios
    static let defaultAppVersionCode = ""
    static let defaultAppVersionName = ""
    static let defaultAppName = ""
    static let defaultAppPath = ""
    static let defaultAppDownloadUrl = ""
    static let defaultAppDesc = ""
    static let defaultAppExt = ""
}
