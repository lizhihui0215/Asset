//
//  CacheManager.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct CacheManager {
    enum Cache {
        case userDefault
    }
    public static let `default` = CacheManager()
    
    func cache(key: String, for type: Cache = .userDefault, value: Encodable) {
        switch type {
        case .userDefault:
            UserDefaults.standard.setValue(value, forKey: key)
        }
    }
    
    func cache<T>(key: String, for type: Cache) -> T? {
        switch type {
        case .userDefault:
            return UserDefaults.standard.value(forKey: key) as? T
        }
    }
}
