//
//  TransformDetailViewController.swift
//  Assets
//
//  Created by Bernard on 2021/6/8.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class TransformDetailViewController: BaseViewController {
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var systemLongitudeLabel: UILabel!
    @IBOutlet var systemLatitudeLabel: UILabel!
    @IBOutlet var billCodeLabel: UILabel!
    @IBOutlet var locationCodeLabel: UILabel!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var taskStatusNameLabel: UILabel!
    @IBOutlet var assetSumLabel: UILabel!
    @IBOutlet var assetUnFinishedLabel: UILabel!
    @IBOutlet var assetFinishedLabel: UILabel!
    @IBOutlet var operatorNameLabel: UILabel!
    @IBOutlet var principalTextField: AnimatableTextField!
    @IBOutlet var transformListButton: AnimatableButton!

    var viewModel: TransformDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchTransformDetail().flatMap { [weak self] _ -> ViewModelFuture<CLLocation?> in
            guard let self = self else {
                return ViewModelFuture(error: .unwrapOptionalValue("\(String(describing: self)) should not be nil"))
            }
            return `self`.viewModel.getGPSLocation()
        }.onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.updateViews()
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as TransformAssetListViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        case let destination as PhotographViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        case let destination as StaffListViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        default: break
        }
    }

    private func updateViews() {
        longitudeLabel.text = viewModel.formattedLongitude
        latitudeLabel.text = viewModel.formattedLatitude
        systemLongitudeLabel.text = viewModel.systemLongitude
        systemLatitudeLabel.text = viewModel.systemLatitude
        billCodeLabel.text = viewModel.billCode
        locationCodeLabel.text = viewModel.locationCode
        locationNameLabel.text = viewModel.locationName
        taskStatusNameLabel.text = viewModel.taskStatusName
        assetSumLabel.text = viewModel.assetSum
        assetUnFinishedLabel.text = viewModel.assetUnFinished
        assetFinishedLabel.text = viewModel.assetFinished
        operatorNameLabel.text = viewModel.operatorName
        principalTextField.text = viewModel.principalText
        transformListButton.isHidden = viewModel.isHiddenTransformListButton
    }

    @IBAction func uploadLocationTapped(_ sender: AnimatableButton) {
        updateLocationCoordinates()
    }

    @IBAction func uploadTaskLocationCoordinateTapped(_ sender: AnimatableButton) {
        submitLocationCoordination()
    }

    @IBAction func changeChekPersonTapped(_ sender: AnimatableButton) {
        changeCheckPerson()
    }

    func changeCheckPerson() {
        viewModel.changeCheckPerson()
            .onSuccess { [weak self] msg in
                guard let self = self else { return }
                `self`.alert(message: msg, defaultAction: Self.defaultAlertAction(title: "OK") { [weak self] in
                    guard let self = self else { return }
                    `self`.perform(segue: StoryboardSegue.Transform.unwindFromFromTransformDetailChangeCheckPerson)
                })
            }
    }

    func updateLocationCoordinates() {
        viewModel.getGPSLocation().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.longitudeLabel.text = `self`.viewModel.formattedLongitude
            `self`.latitudeLabel.text = `self`.viewModel.formattedLatitude
        }
    }

    func submitLocationCoordination() {
        viewModel.updateLocationCoordination().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.updateViews()
            `self`.alert(message: "更新成功！")
        }
    }

    @IBAction func unwindFromStaffListToTransformDetailViewController(segue: UIStoryboardSegue) {
        switch segue.source {
        case _ as StaffListViewController:
            updateViews()
        default: break
        }
    }
}
