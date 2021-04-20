//
// Created by ZhiHui.Li on 2021/4/18.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

@propertyWrapper
struct Info<T> {
    private var info: T

    init(_ value: T) {
        info = value
    }

    /// The contained value. Unsafe for anything more than direct read or write.
    var wrappedValue: T {
        get { info }
        set { info = newValue }
    }

    var projectedValue: Info<T> { self }

    init(wrappedValue: T) {
        info = wrappedValue
    }
}

extension Info where T == App {
    var value: [String: String] {
        ["appVersionCode": info.version,
         "appVersionName": info.build,
         "deviceBrand": info.brand,
         "systemLanguage": info.systemLanguage,
         "systemModel": info.build,
         "systemVersion": info.osVersion]
    }
}
