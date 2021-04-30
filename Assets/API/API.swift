//
//  API.swift
//  Assets
//
//  Created by lizhihui on 2021/4/20.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
struct API {
    enum Keys: String {
        case Schema
        case Domain
        case ServiceDictionary
    }

    enum Constants {
        static let defaultSchema = "https"
        static let defaultDomain = "152.136.255.61"
        static let defaultServiceDictionary = "eam-ms"
    }

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = true

    /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = true

    @UserDefault(key: Keys.Schema, defaultValue: Constants.defaultSchema)
    static var schema: String

    @UserDefault(key: Keys.Domain, defaultValue: Constants.defaultDomain)
    static var domain: String

    @UserDefault(key: Keys.ServiceDictionary, defaultValue: Constants.defaultServiceDictionary)
    static var serviceDictionary: String

    static func isAuthorizationRequired(url: URL?) -> Bool {
        guard let url = url else { return false }
        return !unAuthorizations.contains { url.path.hasPrefix($0) }
    }

    private static var unAuthorizations: [String] {
        ["\(API.serviceDictionary)/\(APIRouter.Constants.login)"]
    }
}
