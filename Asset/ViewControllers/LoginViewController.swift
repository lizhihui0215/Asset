//
//  ViewController.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    lazy var viewModel: LoginViewModel = {
        return LoginViewModel(request: .init(), action: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        self.viewModel.login(username: self.usernameTextField.aem.text,
                             password: self.usernameTextField.aem.text) { result in
                             }
    }
}

