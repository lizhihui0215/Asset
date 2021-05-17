//
//  VersionCheckRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct VersionCheckRequest: RequestRepresentable {}

struct VersionCheckParameter: Encodable {
    let appType: App.Category
    let currentVersion: String
}

struct VersionCheckResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: Version?
}
