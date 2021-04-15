//
//  BaseViewModel.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

public typealias ViewCompletionHandler = () -> Void

class BaseViewModel {
    let cache = CacheManager.default
}
