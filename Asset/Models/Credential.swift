//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

struct Credential: Codable {
    let userToken: String
    let pageSize: String
    let userOrgName: String
    let userCityName: String
    let userOrgId: String
    let userCityId: String
}

extension Credential: AutoEquatable {}
