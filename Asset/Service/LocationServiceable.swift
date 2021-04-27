//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol LocationServiceable {
    associatedtype Manager: LocationManager
    associatedtype O: Optional
    associatedtype L: EAMLocation
    var manager: Manager { get set }
    init(manager: Manager)
    func with(optional: () -> O) -> Self
    func launchService()
    func getGPSLocation(completion: @escaping (Result<L?, Error>) -> Void)
}

protocol LocationManager {}

protocol Optional {}

protocol EAMLocation {}
