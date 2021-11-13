//
//  Formatter.swift
//  Assets
//
//  Created by lizhihui on 2021/11/13.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct DefaultCoordinateFormatter {
    static func format(_ value: String?, default: String? = nil) -> String {
        guard let value = value, !value.isEmpty else { return `default` ?? "" }
        return String(format: "%.6f", value)
    }

    static func format(_ value: Float?, default: String? = nil) -> String {
        guard let value = value, value != 0 else { return `default` ?? "" }
        return String(format: "%.6f", value)
    }

    static func format(_ value: Double?, default: String? = nil) -> String {
        guard let value = value, value != 0 else { return `default` ?? "" }
        return String(format: "%.6f", value)
    }
}
