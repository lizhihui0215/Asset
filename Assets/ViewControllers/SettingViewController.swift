//
// Created by lizhihui on 2021/4/21.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class SettingViewController: BaseViewController {
    @IBOutlet var schemeOptionsView: RadioGroupView!
    @IBOutlet var environmentOptionsView: RadioGroupView!
    @IBOutlet var domainTextField: AnimatableTextField!
    @IBOutlet var serviceDictionaryTextField: AnimatableTextField!

    lazy var viewModel: SettingViewModel = {
        SettingViewModel(request: SettingRequest(), action: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        schemeOptionsView.selectedIndex = viewModel.scheme.index
        domainTextField.text = viewModel.domain
        serviceDictionaryTextField.text = viewModel.serviceDictionary
    }

    @IBAction func saveTapped(_ sender: AnimatableButton) {
        viewModel.domain = domainTextField.eam.text
        viewModel.serviceDictionary = serviceDictionaryTextField.eam.text
        viewModel.scheme = API.Scheme(integerLiteral: schemeOptionsView.selectedIndex)
        alert(message: "保存成功！")
    }
}
