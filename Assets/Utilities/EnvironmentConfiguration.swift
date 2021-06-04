//
//  Environment.swift
//  Assets
//
//  Created by Bernard on 2021/5/28.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class EnvironmentConfiguration {
    enum Environment {
        case mock
        case prod
        case debug
    }

    var environment: Environment {
        didSet {
            Self.configuration = EnvironmentConfiguration(environment: environment)
        }
    }

    private static var configuration = EnvironmentConfiguration(environment: .prod)

    init(environment: Environment) {
        self.environment = environment
    }

    func load(environment: Environment) {
        self.environment = environment
    }

//    var isMock: Bool {
//        guard let mock = environment["IS_MOCK"] else { return false }
//        return Bool(mock) ?? false
//    }
}
