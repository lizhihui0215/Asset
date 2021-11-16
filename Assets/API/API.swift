//
//  API.swift
//  Assets
//
//  Created by lizhihui on 2021/4/20.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import SwiftyRSA

struct API {
    enum Keys: String {
        case Schema
        case Domain
        case ServiceDictionary
        case DictionaryName = "dictName"
    }

    enum Scheme: String, Codable {
        case http
        case https
    }

    enum Constants {
        static let defaultSchema: Scheme = .http
        static let defaultDomain = "223.99.142.6"
        static let defaultServiceDictionary = "eam-phone"
    }

    /// Whether to discard any errors when decoding optional properties
    public static var safeOptionalDecoding = true

    /// Whether to remove invalid elements instead of throwing when decoding arrays
    public static var safeArrayDecoding = true

    public static var publicKey: PublicKey {
        // swiftlint:disable:next force_try
        try! PublicKey(pemNamed: "eam-server-public")
    }

    public static var privateKey: PrivateKey {
        // swiftlint:disable:next force_try
        try! PrivateKey(pemNamed: "eam-client-private")
    }

    static func randomAESKey(length: Int = 16) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0 ..< length).map { _ in letters.randomElement()! })
    }

    @UserDefault(key: Keys.Schema, defaultValue: Constants.defaultSchema)
    static var schema: Scheme

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
