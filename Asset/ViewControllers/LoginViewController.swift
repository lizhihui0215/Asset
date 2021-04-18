//
//  ViewController.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!

    lazy var viewModel: LoginViewModel = {
        LoginViewModel(request: .init(), action: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginButtonTapped(_: UIButton) {
        viewModel.login(username: usernameTextField.aem.text,
                        password: passwordTextField.aem.text) { _ in
        }
    }
}
