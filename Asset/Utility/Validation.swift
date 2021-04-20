//
// Created by ZhiHui.Li on 2021/4/17.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol Validation {
    associatedtype V: Validator
    var validator: V { get set }
    func valid(router: APIRouter) throws
}

struct StringValidator: Validator {
    enum `Type` {
        case empty(string: String?)

        func validate() -> Bool {
            switch self {
            case .empty(let string):
                guard let string = string else { return true }
                return string.isEmpty
            }
        }
    }

    func `is`(type: Type) -> Bool {
        type.validate()
    }

    func not(type: Type) -> Bool {
        !type.validate()
    }
}
