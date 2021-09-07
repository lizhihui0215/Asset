//
//  AssetSearchViewController.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import UIKit

class AssetTaskInventoryListSearchViewController: BaseViewController {
    @IBOutlet var inventoryStatusButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    var viewModel: AssetTaskInventoryListSearchViewModel!
    let dropDown = DropDown()

    @IBAction func inventoryStatusButtonTapped(_ sender: UIButton) {
        dropDown.show()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        dropDown.anchorView = inventoryStatusButton
        dropDown.cellNib = UINib(nibName: "DropDownOptionCell", bundle: nil)
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.selectionAction = { [weak self] _, item in
            guard let self = self else { return }
            `self`.viewModel.setConfirmStatus(for: item)
            `self`.inventoryStatusButton.setTitle(item, for: .normal)
        }

        viewModel.fetchDictionary(for: .checkStatus).onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.refreshDropDown()
        }
    }

    private func refreshDropDown() {
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.reloadAllComponents()
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        viewModel.searchText = searchTextField.eam.text
        perform(segue: StoryboardSegue.AssetTask.unwindToAssetTaskInventoryListViewControllerFromSearch)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination() {
        default: break
        }
    }
}
