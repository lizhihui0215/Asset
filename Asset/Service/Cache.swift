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

    init(key: K, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            guard let obj = value(for: key.rawValue) else {
                return defaultValue
            }
            return obj
        }
        set {
            add(data: newValue, to: key.rawValue)
        }
    }

    func add(data: T, to key: String) {
        let data = try? JSONEncoder().encode(data)
        UserDefaults.standard.set(data, forKey: key)
    }

    func value(for key: String) -> T? {
        guard let data = UserDefaults.standard.object(forKey: key) as? Data else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }
}
