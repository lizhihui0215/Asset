//
//  AutoProtocol.swift
//  Asset
//
//  Created by lizhihui on 2021/4/29.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol AutoEquatable {}
protocol AutoDecodable: Decodable {}
protocol AutoEncodable: Encodable {}
protocol AutoCodable: AutoDecodable, AutoEncodable {}
