//
// Created by Bernard on 2021/6/4.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class TransformSearchViewController: BaseViewController {
    @IBOutlet var locationTextField: IsaoTextField!
    @IBOutlet var taskCodeTextField: IsaoTextField!
    @IBOutlet var radioGroupView: RadioGroupView!

    var searchTask: Int {
        0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func searchTapped(_ sender: UIButton) {}
}
