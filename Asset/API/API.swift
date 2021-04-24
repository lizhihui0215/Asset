//
//  API.swift
//  Asset
//
//  Created by lizhihui on 2021/4/20.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
struct API {
    enum Keys: String {
        case schema
        case baseURL
        case serviceDictionary
    }

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = true

    /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = true

    @UserDefault(key: Keys.schema, defaultValue: "https")
    static var schema: String

    @UserDefault(key: Keys.baseURL, defaultValue: "152.136.255.61")
    static var domain: String

    @UserDefault(key: Keys.serviceDictionary, defaultValue: "eam-ms")
    static var serviceDictionary: String

    static func isAuthorizationRequired(url: URL?) -> Bool {
        guard let url = url else { return false }
        return !unAuthorizations.contains { url.path.hasPrefix($0) }
    }

    private static var unAuthorizations: [String] {
        ["\(API.serviceDictionary)/\(APIRouter.Keys.loginPathComponents)"]
    }
}
