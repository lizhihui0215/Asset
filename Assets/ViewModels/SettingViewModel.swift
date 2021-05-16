//
//  SettingViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/5/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class SettingViewModel: BaseViewModel<SettingViewController> {
    var scheme: API.Scheme {
        get { API.schema }
        set { API.schema = newValue }
    }

    public var domain: String {
        get { API.domain }
        set { API.domain = newValue }
    }

    public var serviceDictionary: String {
        get { API.serviceDictionary }
        set { API.serviceDictionary = newValue }
    }
}

extension API.Scheme: ExpressibleByIntegerLiteral {
    var index: Int {
        self == .http ? 0 : 1
    }

    typealias IntegerLiteralType = Int

    init(integerLiteral value: Int) {
        self = value == 0 ? .http : .https
    }
}
