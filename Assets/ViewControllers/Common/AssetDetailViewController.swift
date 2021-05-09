//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import Foundation

class AssetDetailViewController: BaseViewController {
    enum ViewState: Equatable {
        case editing
        case viewing(isHiddenCoordinate: Bool = false)
    }

    var viewModel: AssetDetailViewModel!

    @IBOutlet var containerStackView: UIStackView!
    @IBOutlet var inventoryStatusLabel: UILabel!
    @IBOutlet var statusButton: AnimatableButton!
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
    @IBOutlet var principalTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet var userTapGestureRecognizer: UITapGestureRecognizer!
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
    @IBOutlet var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet var longitudeContainerStackView: UIStackView!
    @IBOutlet var latitudeContainerStackView: UIStackView!
    @IBOutlet var longitudeStackView: UIStackView!
    @IBOutlet var latitudeStackView: UIStackView!
    @IBOutlet var latitudeTitleLabel: UILabel!
    @IBOutlet var longitudeTitleLabel: UILabel!
    @IBOutlet var latitudeDivideView: UIView!
    @IBOutlet var principalSearchImageView: UIImageView!
    @IBOutlet var longitudeDivideView: UIView!
    @IBOutlet var userSearchImageView: UIImageView!
    let dropDown = DropDown()

    var state: ViewState = .viewing() {
        didSet {
            update(for: state)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.anchorView = statusButton
        dropDown.cellNib = UINib(nibName: "DropDownOptionCell", bundle: nil)
        dropDown.selectionAction = { [weak self] _, item in
            guard let self = self else { return }
            `self`.viewModel.setAssetStatus(for: item)
            `self`.statusButton.setTitle(item, for: .normal)
        }
        viewModel.viewState(isFetch: state == .editing).onSuccess { [weak self] state in
            guard let self = self else { return }
            `self`.update(for: state)
            `self`.refreshDropDown()
            guard let item = self.viewModel.selectedAssetStatus?.name else { return }
            guard let index = self.dropDown.dataSource.firstIndex(of: item) else { return }
            `self`.dropDown.selectRow(index)
        }
    }

    private func refreshDropDown() {
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.reloadAllComponents()
    }

    private func update(for state: ViewState) {
        switch state {
        case .editing:
            for view in hiddenViewsForEditing {
                `self`.containerStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
        case .viewing(let isHiddenCoordinate):
            for view in hiddenViewsForViewing where !`is`(hidden: isHiddenCoordinate, for: view) {
                `self`.containerStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }

            longitudeStackView.removeFromSuperview()
            latitudeStackView.removeFromSuperview()
            principalSearchImageView.removeFromSuperview()
            userSearchImageView.removeFromSuperview()
            manufactureTextField.isUserInteractionEnabled = false
            modelTextField.isUserInteractionEnabled = false
            amountTextField.isUserInteractionEnabled = false
            principalTextField.superview?.isUserInteractionEnabled = false
            userTextField.superview?.isUserInteractionEnabled = false
            longitudeTitleLabel.text = "经度:"
            latitudeTitleLabel.text = "纬度:"
            photographButton.heightAnchor ~ 0
            locationCodeTitleLabel.text = "地点编码:"
            locationCodeTitleLabel.text = "地点名称:"
            rightBarButtonItem.title = "查看照片"
        }
        refreshViews()
    }

    lazy var hiddenForCoordinateViews: [UIView] = {
        [
            longitudeContainerStackView,
            latitudeContainerStackView,
            longitudeDivideView,
            latitudeDivideView,
        ]
    }()

    func `is`(hidden coordinate: Bool, for view: UIView) -> Bool {
        guard !hiddenForCoordinateViews.contains(view) else { return false }
        return coordinate
    }

    func refreshViews() {
        inventoryStatusLabel.text = viewModel.inventoryStatus
        statusButton.setTitle(viewModel.status, for: .normal)
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

    @IBAction func rightBarButtonItemTapped(_ sender: UIBarButtonItem) {}

    func updateLocationCoordinates() {
        viewModel.getGPSLocation().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.longitudeLabel.text = `self`.viewModel.longitude
            `self`.latitudeLabel.text = `self`.viewModel.latitude
        }
    }

    @IBAction func unwindFromStaffSelected(segue: UIStoryboardSegue) {
        refreshViews()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as StaffListViewController:
            // swiftlint:disable:next force_cast
            let category: Staff.Category = (sender as! NSObject) == principalTapGestureRecognizer ? .principal : .user
            destination.viewModel = viewModel.viewModel(for: destination, with: category)
        default: break
        }
    }
}
