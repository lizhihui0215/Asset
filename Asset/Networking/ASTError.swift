//
//  ASTError.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

public enum ASTError: Error {
    public enum ServerError: Error {
        case responseFailed(reason: String)
    }
    
    public enum UIError: Error {
        
    }
}

extension ASTError: LocalizedError {
    
}
