//
//  Device.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct Device {
    
    enum AppType: String {
        case ios = "2"
    }
    
    public static let current = Device()
    
    public let type = AppType.ios
    
    
}
