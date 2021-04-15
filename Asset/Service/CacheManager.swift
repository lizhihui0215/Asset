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
    public static let `default` = CacheManager(cache: .userDefault)
    
    private let cache: Cache
    
    init(cache: Cache) {
        self.cache = cache
    }
    
    func put(key: String, value: Encodable) {
        switch cache {
        case .userDefault:
            UserDefaults.standard.setValue(value, forKey: key)
        }
    }
    
    func get<T>(key: String) -> T? {
        switch cache {
        case .userDefault:
            return UserDefaults.standard.value(forKey: key) as? T
        }
    }
}
