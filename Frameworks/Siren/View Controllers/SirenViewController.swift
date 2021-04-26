//
//  SirenViewController.swift
//  Siren
//
//  Created by ZhiHui.Li on 2021/4/18.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

/// `UIViewController` Extension for Siren
final class SirenViewController: UIViewController {
    /// This creates a retain cycle.
    /// This is needed to retain the UIAlertController in iOS 13.0+
    var retainedWindow: UIWindow?

    deinit {
        retainedWindow = nil
    }
}
