//
//  Dictionary+Extension.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/18.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension Dictionary: EAMExtended {}

extension Dictionary where Value: Equatable {
    func key(from value: Value) -> Key? {
        first { $0.value == value }?.key
    }
}

extension Dictionary where Key: Assets.Keys, Value == String {
    // FIXME: seems it's not working now, need more research in future
    subscript<T: Assets.Keys>(_ args: KeyValuePairs<T, String>) -> [String: String] {
        var dic = [String: String]()
        for item in args {
            dic[item.key.rawValue] = item.value
        }
        return dic
    }
}
