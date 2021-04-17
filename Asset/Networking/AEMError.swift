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
            case AEMError.ServerError.responseFailed = customError {
            return true
        }

        return false
    }

    func asAEMError() -> Error {
        if case .responseSerializationFailed(let reason) = self,
            case .customSerializationFailed(let customError) = reason,
            case AEMError.ServerError.responseFailed = customError {
            return customError
        }

        return self
    }
}

extension Error {
    public var asAEMServerError: AEMError.ServerError? {
        self as? AEMError.ServerError
    }

    public var asAEMUIError: AEMError.UIError? {
        self as? AEMError.UIError
    }

    public var recoverySuggestion: String? {
        if let suggestion = self.asAFError?.recoverySuggestion {
            return suggestion
        }

        if let suggestion = self.asAEMServerError?.recoverySuggestion {
            return suggestion
        }

        if let suggestion = self.asAEMUIError?.recoverySuggestion {
            return suggestion
        }
        return nil
    }
}

public enum AEMError: Error {
    public enum ServerError: Error {
        case responseFailed(reason: String)
    }

    public enum UIError: Error {
        case usernameEmpty
        case passwordEmpty
    }
}

extension AFError {
    public var recoverySuggestion: String? {
        return errorDescription
    }
}

extension AEMError.UIError: LocalizedError {
    public var errorDescription: String? {
        return failureReason
    }

    public var recoverySuggestion: String? {
        return failureReason
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
