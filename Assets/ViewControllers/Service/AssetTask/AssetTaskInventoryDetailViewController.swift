//
//  TransformDetailViewController.swift
//  Assets
//
//  Created by Bernard on 2021/6/4.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import UIKit

class AssetTaskInventoryDetailViewController: BaseViewController {
    @IBOutlet var checkStatusNameLabel: UILabel!
    @IBOutlet var assetCheckItemNameButton: UIButton!
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

    let dropDown = DropDown()

    var viewModel: AssetTaskInventoryDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.anchorView = assetCheckItemNameButton
        dropDown.cellNib = UINib(nibName: "DropDownOptionCell", bundle: nil)
        dropDown.dataSource = viewModel.dropDownOptions

        dropDown.selectionAction = { [weak self] _, item in
            guard let self = self else { return }
            `self`.viewModel.setAssetStatus(for: item)
            `self`.assetCheckItemNameButton.setTitle(item, for: .normal)
        }

        viewModel.fetchDictionary(for: .inventory).onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.refreshDropDown()
        }

        updateLocationCoordinates()
        updateViews()
    }

    private func refreshDropDown() {
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.reloadAllComponents()
    }

    func updateViews() {
        checkStatusNameLabel.text = viewModel.checkStatusName
        assetCheckItemNameButton.setTitle(viewModel.assertUseName, for: .normal)
        serialTextField.text = viewModel.resourceNumber
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
        save()
        viewModel.submit().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.alert(message: "操作成功！", defaultAction: Self.defaultAlertAction {
                `self`.perform(segue: StoryboardSegue.AssetTask.toPhotograph)
            })
        }
    }

    @IBAction func assetStatusButtonTapped(_ sender: UIButton) {
        dropDown.show()
    }

    func save() {
//        viewModel.selectedAssetCheckItem
        viewModel.resourceNumber = serialTextField.eam.text
        viewModel.assetName = assetNameTextField.eam.text
        viewModel.manufactureName = manufactureNameTextField.eam.text
        viewModel.modelName = modelNameTextField.eam.text
        viewModel.quantity = quantityTextField.eam.text
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
            viewModel.resourceNumber = messageString
            serialTextField.text = viewModel.resourceNumber
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
