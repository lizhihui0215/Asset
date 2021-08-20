//
//  TransformAssetDetailPhotographViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/7/8.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import UIKit

class TransformAssetDetailPhotographViewController: BaseViewController {
    @IBOutlet var checkStatusNameLabel: UILabel!
    @IBOutlet var assetCheckItemNameLabel: UILabel!
    @IBOutlet var serialLabel: UILabel!
    @IBOutlet var tagNumberLabel: UILabel!
    @IBOutlet var assetNameTextField: AnimatableTextField!
    @IBOutlet var manufactureNameTextField: AnimatableTextField!
    @IBOutlet var modelNameTextField: AnimatableTextField!
    @IBOutlet var locationCodeLabel: UILabel!
    @IBOutlet var systemLocationNameLabel: UILabel!
    @IBOutlet var quantityTextField: AnimatableTextField!
    @IBOutlet var principalTextField: AnimatableTextField!
    @IBOutlet var systemLongitudeLabel: UILabel!
    @IBOutlet var systemLatitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!

    var viewModel: TransformAssetDetailPhotographViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchTransformAssetDetailPhotograph().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.updateViews()
        }
    }

    func updateViews() {
        checkStatusNameLabel.text = viewModel.checkStatusName
        assetCheckItemNameLabel.text = viewModel.assertUseName
        serialLabel.text = viewModel.resourceNumber
        tagNumberLabel.text = viewModel.tagNumber
        assetNameTextField.text = viewModel.assetName
        manufactureNameTextField.text = viewModel.manufactureName
        modelNameTextField.text = viewModel.modelName
        locationCodeLabel.text = viewModel.locationCode
        quantityTextField.text = viewModel.quantity
        principalTextField.text = viewModel.principalName
        longitudeLabel.text = viewModel.formattedLongitude
        latitudeLabel.text = viewModel.formattedLatitude
        systemLocationNameLabel.text = viewModel.locationName
    }

    // MARK: - Navigation

    @IBAction func unwindToTransformInventoryDetailViewController(sender: UIStoryboardSegue) {
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
        case let destination as PhotographViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        default: break
        }
    }
}
