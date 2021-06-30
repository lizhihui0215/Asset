//
//  TransformDetailViewController.swift
//  Assets
//
//  Created by Bernard on 2021/6/4.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class AssetTaskInventoryDetailViewController: BaseViewController {
    @IBOutlet var checkStatusNameLabel: UILabel!
    @IBOutlet var assetUseButton: UIButton!
    @IBOutlet var serialTextField: AnimatableTextField!
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

    var viewModel: AssetTaskInventoryDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLocationCoordinates()
        updateViews()
    }

    func updateViews() {
        checkStatusNameLabel.text = viewModel.checkStatusName
        assetUseButton.setTitle(viewModel.assertUseName, for: .normal)
        serialTextField.text = viewModel.serial
        tagNumberLabel.text = viewModel.tagNumber
        assetNameTextField.text = viewModel.assetName
        manufactureNameTextField.text = viewModel.manufactureName
        modelNameTextField.text = viewModel.modelName
        systemLocationCodeLabel.text = viewModel.systemLocationCode
        locationCodeLabel.text = viewModel.locationCode
        systemLocationNameLabel.text = viewModel.systemLocationName
        locationNameLabel.text = viewModel.locationName
        quantityTextField.text = viewModel.quantity
        principalTextField.text = viewModel.principalName
        userTextField.text = viewModel.userName
        systemLongitudeLabel.text = viewModel.systemLongitude
        systemLatitudeLabel.text = viewModel.systemLatitude
        longitudeLabel.text = viewModel.formattedLongitude
        latitudeLabel.text = viewModel.formattedLatitude
    }
    
    @IBAction func rightBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
    }

    @IBAction func updateLocationCoordinatesTapped(_ sender: UIButton) {
        updateLocationCoordinates()
    }

    func updateLocationCoordinates() {
        viewModel.getGPSLocation().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.longitudeLabel.text = `self`.viewModel.formattedLongitude
            `self`.latitudeLabel.text = `self`.viewModel.formattedLatitude
        }
    }

    // MARK: - Navigation

    @IBAction func unwindToAssetTaskInventoryDetailViewController(sender: UIStoryboardSegue) {
        let source = sender.source
        switch source {
        case let source as ScanViewController:
            guard let messageString = source.viewModel.metadataObject.messageString else {
                return
            }
            viewModel.serial = messageString
            serialTextField.text = viewModel.serial
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
        default: break
        }
    }
}
