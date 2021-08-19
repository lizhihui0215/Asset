//
//  AssetSearchViewController.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import UIKit

class TransformSearchViewController: BaseViewController {
    typealias TaskStatus = TransformSearchViewModel.TaskStatus
    @IBOutlet var taskStatusRadioGroup: RadioGroupView!
    @IBOutlet var locationTextField: UITextField!
    @IBOutlet var taskCodeTextField: UITextField!
    var viewModel: TransformSearchViewModel!
    let dropDown = DropDown()

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        viewModel.taskStatus = TaskStatus(intValue: taskStatusRadioGroup.selectedIndex)
        viewModel.taskCode = taskCodeTextField.eam.text
        viewModel.location = locationTextField.eam.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
