//
//  LoginScreenModel.swift
//  AssetsUITests
//
//  Created by lizhihui on 2021/5/17.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UITestHelper
import XCTest

class LoginScreen: Screen {
    required init?(rawValue: Screen.RawValue) {
        super.init(rawValue: rawValue)
    }

    override var identifiableElement: XCUIElement {
        ScreenElements.loginButton.element
    }

    enum ScreenElements: String {
        case usernameTextField
        case passwordTextField
        case loginButton
        case serverSettingButton
    }

    func enterUsername(_ text: String, into textField: ScreenElements = .usernameTextField) {
        textField.clear().tapAndType(text)
    }

    func enterPassword(_ text: String, into textField: ScreenElements = .passwordTextField) {
        textField.clear().tapAndType(text)
    }

    func tapLoginButton() {
        ScreenElements.loginButton.tap()
    }
}
