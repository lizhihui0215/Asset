//
//  AssetsSnapshotTests_BDD_Tests.swift
//  AssetsSnapshotTests_BDD_Tests
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Cucumberish
import Foundation

@objc(AssetsSnapshotTests_BDD_Tests)
public class AssetsSnapshotTests_BDD_Tests: UITestCase {
    private var loginScreen: LoginScreen?
    private var serviceScreen: ServiceScreen?

    override public func setUp() {
        super.setUp()
        continueAfterFailure = true
    }

    @objc public func setUpSteps() {
        setupLoginFeatures()

        let bundle = Bundle(for: AssetsSnapshotTests_BDD_Tests.self)
        Cucumberish.executeFeatures(forHost: self, inDirectory: "Features", from: bundle, includeTags: nil, excludeTags: nil)
    }

    private func setupLoginFeatures() {
        Given("User has launched app") { _, _ in
            self.tryLaunch()
        }

        Given("User stay in \"([^\\\"]*)\" screen") { args, _ in
            guard let screen = args?.first else { XCTFail("screen not appear"); return }
            let screens = Screens(rawValue: screen)
            switch screens {
            case .login:
                self.loginScreen = screens?.screen(testable: self)
                self.loginScreen?.verifyView()
            default: break
            }
        }

        When("User enter \"([^\\\"]*)\" into the \"([^\\\"]*)\"") { args, _ in
            guard let text = args?.first else { XCTFail("input text not appear"); return }
            guard let textFieldElement = args?.last else { XCTFail("text field element not appear"); return }
            if let loginScreenElement = LoginScreen.ScreenElements(rawValue: textFieldElement) {
                switch loginScreenElement {
                case .usernameTextField:
                    self.loginScreen?.enterUsername(text)
                case .passwordTextField:
                    self.loginScreen?.enterPassword(text)
                default: break
                }
            }
        }

        Then("User tap \"([^\\\"]*)\" Button") { args, _ in
            guard let buttonElement = args?.first else { XCTFail("button not appear"); return }
            if let loginScreenElement = LoginScreen.ScreenElements(rawValue: buttonElement) {
                switch loginScreenElement {
                case .loginButton:
                    self.loginScreen?.tapLoginButton()
                default: break
                }
            }
        }

        Then("User should be navigated to \"([^\\\"]*)\" screen") { args, _ in
            guard let screen = args?.first else { XCTFail("screen not appear"); return }
            let screens = Screens(rawValue: screen)
            switch screens {
            case .service:
                self.serviceScreen = screens?.screen(testable: self)
                self.serviceScreen?.verifyView()
            default: break
            }
        }
    }
}
