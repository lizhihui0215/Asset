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
