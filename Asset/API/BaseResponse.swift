//
//  BaseResponse.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
protocol BaseResponse: Decodable {
    associatedtype Model: Decodable
    var status: Int { get set }
    var msg: String { get set }
    var data: Model? { get set }
}
