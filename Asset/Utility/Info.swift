//
// Created by ZhiHui.Li on 2021/4/18.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

@propertyWrapper
final class Info<T> {
    private var value: T

    init(_ value: T) {
        self.value = value
    }

    /// The contained value. Unsafe for anything more than direct read or write.
    var wrappedValue: T {
        get { value }
        set { value = newValue }
    }

    var projectedValue: Info<T> { self }

    init(wrappedValue: T) {
        value = wrappedValue
    }
}

extension Info where T == App {
    var value: [String: String] {
        return ["version": value.version,
                "osName": value.osName]
    }
}
