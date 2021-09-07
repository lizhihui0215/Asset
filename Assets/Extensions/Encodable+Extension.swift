//
//  Encodable+Extension.swift
//  Assets
//
//  Created by lizhihui on 2021/9/1.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension Encodable {
    var JSONString: String {
        guard let content = try? JSONEncoder().encode(self) else {
            return App.Constants.Default.string
        }

        return String(data: content, encoding: .utf8) ?? App.Constants.Default.string
    }

    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }
}
