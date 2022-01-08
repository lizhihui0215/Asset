//
//  LoginRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol AssetDetailParameterRepresentable: Encodable {
    var assetId: String { get }
    var checkPerson: String { get }
}
