//
//  ASTError.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import Alamofire

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

    public var recoverySuggestion: String? {
        if let suggestion = self.asAFError?.recoverySuggestion {
            return suggestion
        }

        if let suggestion = self.asAEMServerError?.recoverySuggestion {
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
        
    }
}

extension AFError {
    public var recoverySuggestion: String? {
        return self.errorDescription
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
