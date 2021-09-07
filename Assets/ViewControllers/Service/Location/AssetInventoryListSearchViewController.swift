//
//  AssetSearchViewController.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import UIKit

class AssetInventoryListSearchViewController: BaseViewController {
    @IBOutlet var confirmStatusButton: UIButton!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var principalTextField: AnimatableTextField!
    @IBOutlet var userTextField: AnimatableTextField!

    @IBOutlet var principalTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var userTapGestureRecognizer: UITapGestureRecognizer!

    var viewModel: AssetInventoryListSearchViewModel!
    let dropDown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()

        dropDown.anchorView = confirmStatusButton
        dropDown.cellNib = UINib(nibName: "DropDownOptionCell", bundle: nil)
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.selectionAction = { [weak self] _, item in
            guard let self = self else { return }
            `self`.viewModel.setConfirmStatus(for: item)
            `self`.confirmStatusButton.setTitle(item, for: .normal)
        }

        viewModel.fetchDictionary(for: .inventory).onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.refreshDropDown()
        }
    }

    private func refreshDropDown() {
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.reloadAllComponents()
    }

    @IBAction func confirmStatusButtonTapped(_ sender: UIButton) {
        dropDown.show()
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        viewModel.searchText = searchTextField.eam.text
        perform(segue: StoryboardSegue.Location.unwindToAssetInventoryListViewControllerFromSearch)
    }

    func updateViews() {
        userTextField.text = viewModel.userName
        principalTextField.text = viewModel.principalName
    }

    @IBAction func unwindFromStaffSelectedToAssetInventoryListSearchViewController(segue: UIStoryboardSegue) {
        switch segue.source {
        case _ as StaffListViewController:
            updateViews()
        default: break
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination() {
        case let destination as StaffListViewController:
            // swiftlint:disable:next force_cast
            let category: Staff.Category = (sender as! NSObject) == principalTapGestureRecognizer ? .principal : .user
            destination.viewModel = viewModel.viewModel(for: destination, with: category)
        default: break
        }
    }
}
