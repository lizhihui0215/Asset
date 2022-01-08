//
//  ASTError.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

func unwrapOptionalValueError(description: String) -> EAMError {
    EAMError.unwrapOptionalValueError(description)
}

extension ViewModelFuture {
    public enum ErrorType: Convertible {
        case unwrapOptionalValue(String)
        case weakSelfUnWrapError

        func convert() -> EAMError {
            switch self {
            case .unwrapOptionalValue(let description): return unwrapOptionalValueError(description: description)
            case .weakSelfUnWrapError: return EAMError.weakSelfUnWrapError
            }
        }
    }

    convenience init(error type: ErrorType = .unwrapOptionalValue("unknow")) {
        guard let error = type.convert() as? E else {
            fatalError("error type not supported!")
        }

        self.init(error: error)
    }
}

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

    var asLocationServiceError: EAMError.LocationServiceError? {
        self as? EAMError.LocationServiceError
    }

    var asLocationServiceAuthError: EAMError.LocationServiceError.AuthError? {
        self as? EAMError.LocationServiceError.AuthError
    }

    var asScanServiceError: EAMError.ScanServiceError? {
        self as? EAMError.ScanServiceError
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

        if let suggestion = asLocationServiceError?.recoverySuggestion {
            return suggestion
        }

        if let suggestion = asLocationServiceAuthError?.recoverySuggestion {
            return suggestion
        }

        return nil
    }
}

public enum EAMError: Error {
    case unknown
    case weakSelfUnWrapError
    case unwrapOptionalValueError(String)

    public enum ServerError: Error, Equatable {
        case responseFailed(reason: String)
        case tokenRequiredError
        case updateRequired
    }

    public enum APIError: Error, Equatable {
        case parametersIsNil
        case tokenRequiredError
        case updateRequired
    }

    public enum UIError: Error {
        case usernameEmpty
        case passwordEmpty
        case transformChangePersonNotSelected
        case assetTaskChangePersonNotSelected
    }

    public enum CryptoError: Error {
        case encryptoError
        case decryptoErrpr
    }

    public enum LocationServiceError: Error {
        case coordinateEmpty
        case coordinateNeedsUpdate

        public enum AuthError: Int, Error {
            case unknown = -1
            case networkFailed = 1
            case invalidKey = 2
        }
    }

    public enum ScanServiceError: Error {
        case undiscerning
        case cancel
        case apiFailure(Error)
    }

    public enum PrintServiceError: Error {
        /// 未知异常
        case unknowError
        /// >连接操作异常
        case connectError
        /// 连接设备异常
        case connectDeviceError
        /// 创建标签异常
        case createLabelError
        /// 打印异常
        case printError
        /// 打印机被占用（或正在打印）
        case printingError
        /// 预览异常
        case previewError
        /// 标签类型错误
        case labelTypeError
        /// API Error
        case apiFailure(Error)

        init?(printResult: WwPrintResult) {
            switch printResult {
            case .wwUnknowError: self = .unknowError
            case .wwConnectError: self = .connectError
            case .wwConnectDeviceError: self = .connectDeviceError
            case .wwCreateLabelError: self = .createLabelError
            case .wwPrintError: self = .printError
            case .wwPrintingError: self = .printingError
            case .wwPreviewError: self = .previewError
            case .wwLabelTypeError: self = .labelTypeError
            default: self = .unknowError
            }
        }
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
        case .unknown, .weakSelfUnWrapError: return "未知错误，请稍后再尝试！"
        case .unwrapOptionalValueError(let `class`):
            return "unwrap optional value \(`class`) is nil"
        }
    }
}

public extension EAMError.PrintServiceError {
    var errorDescription: String? {
        failureReason
    }

    var recoverySuggestion: String? {
        failureReason
    }

    var failureReason: String? {
        switch self {
        case .unknowError: return "未知异常"
        case .connectError: return "连接操作异常"
        case .connectDeviceError: return "连接设备异常"
        case .createLabelError: return "创建标签异常"
        case .printError: return "打印异常"
        case .printingError: return "打印机被占用（或正在打印）"
        case .previewError: return "预览异常"
        case .labelTypeError: return "标签类型错误"
        case .apiFailure(let error): return error.localizedDescription
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
        case .usernameEmpty: return "用户名不能为空！"
        case .passwordEmpty: return "密码不能为空！"
        case .transformChangePersonNotSelected: return "请选择新的执行人！"
        case .assetTaskChangePersonNotSelected: return "请选择新的执行人！"
        }
    }
}

extension EAMError.ServerError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .responseFailed(let reason):
            return reason
        case .tokenRequiredError:
            return "token is required"
        case .updateRequired:
            return "update is required"
        }
    }

    public var failureReason: String? {
        switch self {
        case .responseFailed(let reason):
            return reason
        case .tokenRequiredError:
            return "token is required"
        case .updateRequired:
            return "update is required"
        }
    }

    public var recoverySuggestion: String? {
        switch self {
        case .responseFailed(let reason):
            return reason
        case .tokenRequiredError:
            return "token is required"
        case .updateRequired:
            return "update is required"
        }
    }
}

/// Enumerates all potentials errors that Siren can handle.
public enum VersionError: LocalizedError {
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
        case .missingBundleID:
            return "\(VersionError.sirenError) Please make sure that you have set a `Bundle Identifier` in your project."
        case .appStoreOSVersionUnsupported:
            return "\(VersionError.sirenError) The version of iOS on the device is lower than that of the one required by the app version update."
        case .appStoreVersionArrayFailure:
            return "\(VersionError.sirenError) Error retrieving App Store verson number as the JSON does not contain a `version` key."
        case .currentVersionReleaseDate:
            return "\(VersionError.sirenError) The `currentVersionReleaseDate` key is missing in the JSON payload. Please leave an issue on https://github.com/ArtSabintsev/Siren with as many details as possible."
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

extension EAMError.LocationServiceError: LocalizedError {
    public var errorDescription: String? {
        failureReason
    }

    public var recoverySuggestion: String? {
        failureReason
    }

    public var failureReason: String? {
        switch self {
        case .coordinateEmpty, .coordinateNeedsUpdate: return "请更新地点经纬度！"
        }
    }
}

extension EAMError.LocationServiceError.AuthError: LocalizedError {
    public var errorDescription: String? {
        failureReason
    }

    public var recoverySuggestion: String? {
        failureReason
    }

    public var failureReason: String? {
        switch self {
        case .unknown: return "未知错误，请稍后再尝试！"
        case .networkFailed: return "因网络鉴权失败"
        case .invalidKey: return "KEY非法鉴权失败"
        }
    }
}
