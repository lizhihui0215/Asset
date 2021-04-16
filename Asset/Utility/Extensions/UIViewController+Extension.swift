//
// Created by ZhiHui.Li on 2021/4/16.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import UIKit
import PKHUD

extension UIViewController {
    func startLoadingIndicator() {
        HUD.show(.progress)
    }

    func stopLoadingIndicator() {
        HUD.hide(animated: true)
    }

    func alert(title: String = "", message: String? = nil, handler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default) { action in
            guard let handler = handler else { return }
            handler()
        }
        alertController.addAction(dismiss)
        present(alertController, animated: true)
    }
}
