//
//  ASTError.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

extension AFError {
    public var isEAMServerError: Bool {
        if case .responseSerializationFailed(let reason) = self,
           case .customSerializationFailed(let customError) = reason,
           case EAMError.ServerError.responseFailed = customError
        {
            return true
        }

        return false
    }

    func asEAMError() -> Error {
        if case .responseSerializationFailed(let reason) = self,
           case .customSerializationFailed(let customError) = reason,
           case EAMError.ServerError.responseFailed = customError
        {
            return customError
        }

        return self
    }
}

public extension Error {
    var asEAMServerError: EAMError.ServerError? {
        self as? EAMError.ServerError
    }

    var asEAMUIError: EAMError.UIError? {
        self as? EAMError.UIError
    }

    var recoverySuggestion: String? {
        if let suggestion = asAFError?.recoverySuggestion {
            return suggestion
        }

        if let suggestion = asEAMServerError?.recoverySuggestion {
            return suggestion
        }

        if let suggestion = asEAMUIError?.recoverySuggestion {
            return suggestion
        }
        return nil
    }
}

public enum EAMError: Error {
    case unknown

    public enum ServerError: Error {
        case responseFailed(reason: String)
    }

    public enum UIError: Error {
        case usernameEmpty
        case passwordEmpty
    }
}

public extension AFError {
    var recoverySuggestion: String? {
        errorDescription
    }
}

extension EAMError: LocalizedError {
    public var errorDescription: String? {
        failureReason
    }

    public var recoverySuggestion: String? {
        failureReason
    }

    public var failureReason: String? {
        switch self {
        case .unknown:
            return "未知错误，请稍后再尝试！"
        }
    }
}

extension EAMError.UIError: LocalizedError {
    public var errorDescription: String? {
        failureReason
    }

    public var recoverySuggestion: String? {
        failureReason
    }

    public var failureReason: String? {
        switch self {
        case .usernameEmpty:
            return "用户名不能为空！"
        case .passwordEmpty:
            return "密码不能为空！"
        }
    }
}

extension EAMError.ServerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .responseFailed(let reason):
            return reason
        }
    }

    public var failureReason: String? {
        switch self {
        case .responseFailed(let reason):
            return reason
        }
    }

    public var recoverySuggestion: String? {
        switch self {
        case .responseFailed(let reason):
            return reason
        }
    }
}

/// Enumerates all potentials errors that Siren can handle.
public enum VersionError: LocalizedError {
    /// Error retrieving App Store data as JSON results were empty. Is your app available in the US? If not, change the `countryCode` variable to fix this error.
    case appStoreDataRetrievalEmptyResults
    /// Error retrieving App Store data as an error was returned.
    case appStoreDataRetrievalFailure(underlyingError: Error?)
    /// Error parsing App Store JSON data.
    case appStoreJSONParsingFailure(underlyingError: Error)

    /// The version of iOS on the device is lower than that of the one required by the app version update.
    case appStoreOSVersionUnsupported
    /// Error retrieving App Store verson number as the JSON does not contain a `version` key.
    case appStoreVersionArrayFailure
    /// The `currentVersionReleaseDate` key is missing in the JSON payload. Please leave an issue on https://github.com/ArtSabintsev/Siren with as many details as possible.
    case currentVersionReleaseDate
    /// Please make sure that you have set a `Bundle Identifier` in your project.
    case missingBundleID
    /// No new update available.
    case noUpdateAvailable
    /// Siren will not present an update alert if it performed one too recently. If you would like to present an alert every time Siren is called, please consider setting the `UpdatePromptFrequency.immediately` rule in `RulesManager`
    case recentlyPrompted
    /// The app has been released for X days, but Siren cannot prompt the user until Y (where Y > X) days have passed.
    case releasedTooSoon(daysSinceRelease: Int, releasedForDays: Int)
    /// The user has opted to skip updating their current version of the app to the current App Store version.
    case skipVersionUpdate(installedVersion: String, appStoreVersion: String)

    /// The localized description for each error handled by Siren.
    public var localizedDescription: String {
        switch self {
        case .appStoreDataRetrievalFailure(let error?):
            return "\(VersionError.sirenError) Error retrieving App Store data as an error was returned\nAlso, the following system level error was returned: \(error)"
        case .appStoreDataRetrievalEmptyResults:
            return "\(VersionError.sirenError) Error retrieving App Store data as the JSON results were empty. Is your app available in the US? If not, change the `countryCode` variable to fix this error."
        case .appStoreDataRetrievalFailure(.none):
            return "\(VersionError.sirenError) Error retrieving App Store data as an error was returned."
        case .appStoreJSONParsingFailure(let error):
            return "\(VersionError.sirenError) Error parsing App Store JSON data.\nAlso, the following system level error was returned: \(error)"
        case .appStoreOSVersionUnsupported:
            return "\(VersionError.sirenError) The version of iOS on the device is lower than that of the one required by the app version update."
        case .appStoreVersionArrayFailure:
            return "\(VersionError.sirenError) Error retrieving App Store verson number as the JSON does not contain a `version` key."
        case .currentVersionReleaseDate:
            return "\(VersionError.sirenError) The `currentVersionReleaseDate` key is missing in the JSON payload. Please leave an issue on https://github.com/ArtSabintsev/Siren with as many details as possible."
        case .missingBundleID:
            return "\(VersionError.sirenError) Please make sure that you have set a `Bundle Identifier` in your project."
        case .noUpdateAvailable:
            return "\(VersionError.sirenError) No new update available."
        case .recentlyPrompted:
            return "\(VersionError.sirenError) Siren will not present an update alert if it performed one too recently. If you would like to present an alert every time Siren is called, please consider setting the `\(Rules.UpdatePromptFrequency.self).immediately` rule in `\(RulesManager.self)`"
        case .releasedTooSoon(let daysSinceRelease, let releasedForDays):
            return "\(VersionError.sirenError) The app has been released for \(daysSinceRelease) days, but Siren cannot prompt the user until \(releasedForDays) days have passed."
        case .skipVersionUpdate(let installedVersion, let appStoreVersion):
            return "\(VersionError.sirenError) The user has opted to skip updating their current version of the app (\(installedVersion)) to the current App Store version (\(appStoreVersion))."
        }
    }

    /// An easily identifiable prefix for all errors thrown by Siren.
    private static var sirenError: String {
        "[Siren Error]"
    }
}
