//
//  MineViewController.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var departmentLabel: UILabel!

    lazy var viewModel: MineViewModel = {
        MineViewModel(request: MineRequest(), action: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = viewModel.name
        departmentLabel.text = viewModel.department
    }

    @IBAction func logout(_ sender: UITapGestureRecognizer) {
        app.cleanCredential()
        window?.rootViewController = StoryboardScene.Login.initialScene.instantiate()
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
