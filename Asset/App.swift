//
//  App.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

var app: App = App()

public struct App {
    enum Keys: String {
        case credential
        case baseURL
    }

    private var infoDictionary = Bundle.main.infoDictionary

    public enum `Type`: String, Encodable {
        case ios = "2"
    }

    @Info(app)
    var info: App

    @UserDefault(key: Keys.credential, defaultValue: nil)
    private(set) var credential: Credential?

    @UserDefault(key: Keys.baseURL, defaultValue: "https://152.136.255.61/eam-ms")
    private(set) var baseURL: String

    public var version: String {
        infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }

    public var build: String {
        infoDictionary?[kCFBundleVersionKey as String] as? String ?? "Unknown"
    }

    public var identifier: String {
        infoDictionary?[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
    }

    public var brand: String {
        "Apple"
    }

    public var model: String {
        Device.current.description
    }

    public var osName: String {
        "iOS"
    }

    public var executableName: String {
        (infoDictionary?[kCFBundleExecutableKey as String] as? String) ??
            (ProcessInfo.processInfo.arguments.first?.split(separator: "/").last.map(String.init)) ??
            "Unknown"
    }

    public var appLanguage: String {
        Locale.preferredLanguages[0]
    }

    public var systemLanguage: String {
        Locale.current.languageCode ?? "en"
    }

    public var osVersion: String {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        return "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
    }
}

extension App {
    mutating func add(credential: Credential) {
        self.credential = credential
    }
}
