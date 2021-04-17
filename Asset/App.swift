//
//  App.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

public struct App {
    private var infoDictionary = Bundle.main.infoDictionary

    public enum `Type`: String, Encodable {
        case ios = "2"
    }

    @Info
    static var info: App = App()

    public var version: String {
        return infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    }

    public var build: String {
        infoDictionary?[kCFBundleVersionKey as String] as? String ?? "Unknown"
    }

    public var identifier: String {
        infoDictionary?[kCFBundleIdentifierKey as String] as? String ?? "Unknown"
    }

    public var osName: String {
        return "iOS"
    }

    public var osVersion: String {
        let version = ProcessInfo.processInfo.operatingSystemVersion
        return "\(version.majorVersion).\(version.minorVersion).\(version.patchVersion)"
    }
}
