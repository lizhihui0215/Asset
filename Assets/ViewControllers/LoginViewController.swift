//
//  ViewController.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    @IBOutlet var usernameTextField: UITextField!

    @IBOutlet var passwordTextField: UITextField!

    lazy var viewModel: LoginViewModel = {
        LoginViewModel(request: LoginRequest(), action: self)
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        #if DEBUG
            usernameTextField.text = "wangwenwensh"
            passwordTextField.text = "1"
        #endif
    }

    @IBAction func loginButtonTapped(_: UIButton) {
        viewModel.login(username: usernameTextField.eam.text,
                        password: passwordTextField.eam.text)
            .onSuccess { [weak self] _ in
                guard let self = self else { return }
                `self`.perform(segue: StoryboardSegue.Login.toTab, sender: self)
            }
    }
}
