//
//  AssetSearchViewController.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import UIKit

class AssetTaskSearchViewController: BaseViewController {
    @IBOutlet var taskStatusButton: UIButton!
    @IBOutlet var locationTextField: UITextField!
    var viewModel: AssetTaskSearchViewModel!
    let dropDown = DropDown()

    @IBAction func taskStatusButton(_ sender: UIButton) {}

    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.anchorView = taskStatusButton
        dropDown.cellNib = UINib(nibName: "DropDownOptionCell", bundle: nil)
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.selectionAction = { [weak self] _, item in
            guard let self = self else { return }
            `self`.viewModel.setAssetStatus(for: item)
            `self`.taskStatusButton.setTitle(item, for: .normal)
        }

        viewModel.fetchDictionary(for: .taskStatus).onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.refreshDropDown()
        }
    }

    private func refreshDropDown() {
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.reloadAllComponents()
    }

    @IBAction func taskStatusButtonTapped(_ sender: UIButton) {
        dropDown.show()
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
