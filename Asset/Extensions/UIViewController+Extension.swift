//
// Created by ZhiHui.Li on 2021/4/16.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import PKHUD
import UIKit

extension UIViewController {
    enum Constants {
        static let alertTitle = ""
    }

    func startLoadingIndicator() {
        HUD.show(.systemActivity)
    }

    func stopLoadingIndicator() {
        HUD.hide(animated: true)
    }

    func alert(title: String = App.Constants.Default.string, message: String? = nil, handler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismiss = UIAlertAction(title: Constants.alertTitle, style: .default) { _ in
            guard let handler = handler else { return }
            handler()
        }
        alertController.addAction(dismiss)
        present(alertController, animated: true)
    }

    func handler(error: Error) {}
}
