//
//  CacheManager.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct Cache {
    enum Option {
        case userDefault
    }

    private let option: Option

    init(option: Option) {
        self.option = option
    }

    func put(key: String, value: Encodable) {
        switch option {
        case .userDefault:
            UserDefaults.standard.setValue(value, forKey: key)
        }
    }

    func get<T>(key: String) -> T? {
        switch option {
        case .userDefault:
            return UserDefaults.standard.value(forKey: key) as? T
        }
    }
}

@propertyWrapper
struct UserDefault<T: Codable, K: Keys> {
    let key: K
    let defaultValue: T

    var wrappedValue: T {
        get {
            guard let data = UserDefaults.standard.object(forKey: key.rawValue) as? Data,
                  let obj = try? JSONDecoder().decode(T.self, from: data)
            else {
                return defaultValue
            }

            return obj
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                return
            }

            UserDefaults.standard.set(data, forKey: key.rawValue)
        }
    }
}
