//
// Created by ZhiHui.Li on 2021/4/17.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol Defaultable {
    static var defaultValue: Self { get }
}

protocol Validator: Defaultable {}

extension Validator {
    public static var defaultValidator: StringValidator { StringValidator() }
    static var defaultValue: Self {
        // swiftlint:disable:next force_cast
        return Self.defaultValidator as! Self
    }
}
