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
    public var isAEMServerError: Bool {
        if case .responseSerializationFailed(let reason) = self,
           case .customSerializationFailed(let customError) = reason,
           case AEMError.ServerError.responseFailed = customError
        {
            return true
        }

        return false
    }

    func asAEMError() -> Error {
        if case .responseSerializationFailed(let reason) = self,
           case .customSerializationFailed(let customError) = reason,
           case AEMError.ServerError.responseFailed = customError
        {
            return customError
        }

        return self
    }
}

public extension Error {
    var asAEMServerError: AEMError.ServerError? {
        self as? AEMError.ServerError
    }

    var asAEMUIError: AEMError.UIError? {
        self as? AEMError.UIError
    }

    var recoverySuggestion: String? {
        if let suggestion = asAFError?.recoverySuggestion {
            return suggestion
        }

        if let suggestion = asAEMServerError?.recoverySuggestion {
            return suggestion
        }

        if let suggestion = asAEMUIError?.recoverySuggestion {
            return suggestion
        }
        return nil
    }
}

public enum AEMError: Error {
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

extension AEMError: LocalizedError {
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

extension AEMError.UIError: LocalizedError {
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

extension AEMError.ServerError: LocalizedError {
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
