//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import Foundation

class AssetDetailViewController: BaseViewController {
    enum ViewState {
        case editing
        case viewing
    }

    var viewModel: AssetDetailViewModel!

    @IBOutlet var containerStackView: UIStackView!
    @IBOutlet var inventoryStatusLabel: UILabel!
    @IBOutlet var statusLabel: AnimatableButton!
    @IBOutlet var deviceSerialTextField: AnimatableTextField!
    @IBOutlet var tagNumberLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var manufactureTextField: AnimatableTextField!
    @IBOutlet var modelTextField: AnimatableTextField!
    @IBOutlet var systemLocationCodeLabel: UILabel!
    @IBOutlet var locationCodeLabel: UILabel!
    @IBOutlet var systemLocationNameLabel: UILabel!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var amountTextField: AnimatableTextField!
    @IBOutlet var principalTextField: AnimatableTextField!
    @IBOutlet var userTextField: AnimatableTextField!
    @IBOutlet var systemLongitudeLabel: UILabel!
    @IBOutlet var systemLatitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var updateLocationCoordinateButton: AnimatableButton!
    @IBOutlet var photographButton: AnimatableButton!
    @IBOutlet var categoryLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var hiddenViewsForViewing: [UIView]!
    @IBOutlet var hiddenViewsForEditing: [UIView]!
    @IBOutlet var locationCodeTitleLabel: UILabel!
    @IBOutlet var locationNameTitleLabel: UILabel!

    var state: ViewState = .viewing {
        didSet {
            update(for: state)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewState().onSuccess { [weak self] state in
            guard let self = self else { return }
            `self`.update(for: state)
        }
    }

    private func update(for state: ViewState) {
        switch state {
        case .editing:
            hiddenViewsForEditing.forEach { [weak self] in
                guard let self = self else { return }
                `self`.containerStackView.removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
        case .viewing:
            hiddenViewsForViewing.forEach { [weak self] in
                guard let self = self else { return }
                `self`.containerStackView.removeArrangedSubview($0)
                $0.removeFromSuperview()
            }
            photographButton.heightAnchor ~ 0
            locationCodeTitleLabel.text = "地点编码"
            locationCodeTitleLabel.text = "地点名称"
        }
        refreshViews()
    }

    func refreshViews() {
        inventoryStatusLabel.text = viewModel.inventoryStatus
        statusLabel.setTitle(viewModel.status, for: .normal)
        deviceSerialTextField.text = viewModel.deviceSerial
        tagNumberLabel.text = viewModel.tagNumber
        nameLabel.text = viewModel.name
        manufactureTextField.text = viewModel.manufacture
        modelTextField.text = viewModel.model
        systemLocationCodeLabel.text = viewModel.systemLocationCode
        systemLocationNameLabel.text = viewModel.systemLocationName
        locationCodeLabel.text = viewModel.locationCode
        locationNameLabel.text = viewModel.locationName
        amountTextField.text = viewModel.amount
        principalTextField.text = viewModel.principalName
        userTextField.text = viewModel.userName
        systemLongitudeLabel.text = viewModel.systemLongitude
        systemLatitudeLabel.text = viewModel.systemLatitude
        longitudeLabel.text = viewModel.longitude
        latitudeLabel.text = viewModel.latitude
        categoryLabel.text = viewModel.category
        descriptionLabel.text = viewModel.description
    }

    @IBAction func updateLocationCoordinateTapped(_ sender: AnimatableButton) {
        updateLocationCoordinates()
    }

    @IBAction func photographTapped(_ sender: AnimatableButton) {}

    func updateLocationCoordinates() {
        viewModel.getGPSLocation().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.longitudeLabel.text = `self`.viewModel.longitude
            `self`.latitudeLabel.text = `self`.viewModel.latitude
        }
    }

    @IBAction func unwindFromStaffSelected(segue: UIStoryboardSegue) {
        update(for: .editing)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as StaffListViewController:
            // swiftlint:disable:next force_cast
            let category: Staff.Category = (sender as! NSObject) == principalTextField ? .principal : .user
            destination.viewModel = viewModel.viewModel(for: destination, with: category)
        default: break
        }
    }
}
