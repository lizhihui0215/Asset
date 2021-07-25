//
//  AssetTaskInventoryDetailPhotographViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/7/8.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import UIKit

class AssetTaskInventoryDetailPhotographViewController: BaseViewController {
    @IBOutlet var checkStatusNameLabel: UILabel!
    @IBOutlet var assetCheckItemNameLabel: UILabel!
    @IBOutlet var serialLabel: UILabel!
    @IBOutlet var tagNumberLabel: UILabel!
    @IBOutlet var assetNameTextField: AnimatableTextField!
    @IBOutlet var manufactureNameTextField: AnimatableTextField!
    @IBOutlet var modelNameTextField: AnimatableTextField!
    @IBOutlet var systemLocationCodeLabel: UILabel!
    @IBOutlet var locationCodeLabel: UILabel!
    @IBOutlet var systemLocationNameLabel: UILabel!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var quantityTextField: AnimatableTextField!
    @IBOutlet var principalTextField: AnimatableTextField!
    @IBOutlet var userTextField: AnimatableTextField!
    @IBOutlet var systemLongitudeLabel: UILabel!
    @IBOutlet var systemLatitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var principalTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var userTapGestureRecognizer: UITapGestureRecognizer!

    var viewModel: AssetTaskInventoryDetailPhotographViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchTaskInventoryDetailPhotograph().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.updateViews()
        }
    }

    func updateViews() {
        checkStatusNameLabel.text = viewModel.checkStatusName
        assetCheckItemNameLabel.text = viewModel.assertUseName

//        serialLabel.text = viewModel.resourceNumber
        tagNumberLabel.text = viewModel.tagNumber
        assetNameTextField.text = viewModel.assetName
        manufactureNameTextField.text = viewModel.manufactureName
        modelNameTextField.text = viewModel.modelName
//        systemLocationCodeLabel.text = viewModel.systemLocationCode
        locationCodeLabel.text = viewModel.locationCode
//        systemLocationNameLabel.text = viewModel.systemLocationName
        locationNameLabel.text = viewModel.locationName
        quantityTextField.text = viewModel.quantity
        principalTextField.text = viewModel.principalName
        userTextField.text = viewModel.userName
//        systemLongitudeLabel.text = viewModel.systemLongitude
//        systemLatitudeLabel.text = viewModel.systemLatitude
        longitudeLabel.text = viewModel.formattedLongitude
        latitudeLabel.text = viewModel.formattedLatitude
    }

    @IBAction func rightBarButtonItemTapped(_ sender: UIBarButtonItem) {
        save()
        viewModel.submit().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.alert(message: "操作成功！", defaultAction: Self.defaultAlertAction(dismissHandler: {
                `self`.perform(segue: StoryboardSegue.AssetTask.toPhotograph)
            }))
        }
    }

    func save() {
//        viewModel.selectedAssetCheckItem
//        viewModel.resourceNumber = serialLabel.text ?? ""
//        viewModel.assetName = assetNameTextField.eam.text
//        viewModel.manufactureName = manufactureNameTextField.eam.text
//        viewModel.modelName = modelNameTextField.eam.text
//        viewModel.quantity = quantityTextField.eam.text
    }

    // MARK: - Navigation

    @IBAction func unwindToAssetTaskInventoryDetailViewController(sender: UIStoryboardSegue) {
        let source = sender.source
        switch source {
        case _ as StaffListViewController:
            updateViews()
        default: break
        }
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as ScanViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        case let destination as StaffListViewController:
            // swiftlint:disable:next force_cast
            let category: Staff.Category = (sender as! NSObject) == principalTapGestureRecognizer ? .principal : .user
            destination.viewModel = viewModel.viewModel(for: destination, with: category)
        case let destination as PhotographViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        default: break
        }
    }
}
