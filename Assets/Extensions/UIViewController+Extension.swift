//
// Created by ZhiHui.Li on 2021/4/16.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import PKHUD
import UIKit

extension UIViewController {
    enum Constants {
        static let alertTitle = "Ok"
    }

    func startLoadingIndicator() {
        HUD.show(.systemActivity)
    }

    func stopLoadingIndicator() {
        HUD.hide(animated: true)
    }

    var window: UIWindow? {
        UIApplication.shared.appDelegate.windowService?.window
    }

    func alert(title: String = App.Constants.Default.string,
               message: String? = nil,
               defaultAction: UIAlertAction = defaultAlertAction(),
               otherAction: UIAlertAction? = nil)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if let otherAction = otherAction {
            alertController.addAction(otherAction)
        }

        alertController.addAction(defaultAction)
        present(alertController, animated: true)
    }

    static func defaultAlertAction(title: String = Constants.alertTitle, dismissHandler: (() -> Void)? = nil) -> UIAlertAction {
        UIAlertAction(title: title, style: .cancel) { _ in
            guard let handler = dismissHandler else { return }
            handler()
        }
    }

    func handler(error: Error) {}
}
