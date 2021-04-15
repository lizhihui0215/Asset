//
//  BaseResponse.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
protocol BaseResponse: Decodable {
    associatedtype Model
    var status: Int { get }
    var msg: String { get }
    var data: Model? { get }
}
