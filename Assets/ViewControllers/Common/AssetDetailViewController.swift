//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import Foundation

class AssetDetailViewController: BaseViewController {
    public typealias Configuration = ViewState.Configuration

    enum ViewState: Equatable {
        struct Configuration: Equatable {
            let isHiddenCoordinate: Bool
            let isHiddenInventoryStatus: Bool
            let isHiddenStatus: Bool
            let isHiddenDeviceSerial: Bool
            let isHiddenCategoryCode: Bool
            let isHiddenCategoryName: Bool
            let isHiddenLocationCode: Bool
            let isHiddenLocationName: Bool
            let isHiddenPrincipalCode: Bool
            let isHiddenUserAccount: Bool
            let isHiddenPrincipal: Bool
            let isHiddenUser: Bool
            let locationCodeTitle: String
            let locationNameTitle: String

            public static let `default` = Configuration(isHiddenCoordinate: false,
                                                        isHiddenInventoryStatus: false,
                                                        isHiddenStatus: false,
                                                        isHiddenDeviceSerial: false,
                                                        isHiddenCategoryCode: false,
                                                        isHiddenCategoryName: false,
                                                        isHiddenLocationCode: false,
                                                        isHiddenLocationName: false,
                                                        isHiddenPrincipalCode: true,
                                                        isHiddenUserAccount: true,
                                                        isHiddenPrincipal: false,
                                                        isHiddenUser: false,
                                                        locationCodeTitle: "实际地点编码:",
                                                        locationNameTitle: "实际地点名称:")
        }

        case editing
        case viewing(configuration: Configuration = .default)
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
    @IBOutlet var userSearchImageView: UIImageView!

    @IBOutlet var userAccountLabel: UILabel!
    @IBOutlet var principalCodeLabel: UILabel!

    @IBOutlet var userTitleLabel: UILabel!
    @IBOutlet var principalTitleLabel: UILabel!
    @IBOutlet var longitudeDivideView: UIView!

    @IBOutlet var hiddenViewsForViewing: [UIView]!
    @IBOutlet var inventoryStatusViews: [UIView]!
    @IBOutlet var statusViews: [UIView]!
    @IBOutlet var deviceSerialViews: [UIView]!
    @IBOutlet var categoryCodeViews: [UIView]!
    @IBOutlet var categoryNameViews: [UIView]!
    @IBOutlet var locationCodeViews: [UIView]!
    @IBOutlet var locationNameViews: [UIView]!
    @IBOutlet var principalCodeViews: [UIView]!
    @IBOutlet var userAccountViews: [UIView]!
    @IBOutlet var principalViews: [UIView]!
    @IBOutlet var userViews: [UIView]!

    @IBOutlet var scanButton: UIButton!
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
        case .viewing(let configuration):
            for view in hiddenViewsForViewing where isHidden(for: configuration, for: view) {
                containerStackView.removeArrangedSubview(view)
                view.removeFromSuperview()
            }
            scanButton.removeFromSuperview()
            updateLocationCoordinateButton.removeFromSuperview()
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
            locationCodeTitleLabel.text = configuration.locationCodeTitle
            locationNameTitleLabel.text = configuration.locationNameTitle
            rightBarButtonItem.title = "查看照片"
            statusButton.titleLabel?.textAlignment = .left
            statusButton.setTitleColor(XCColor.primaryColor.color, for: .normal)
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

    func isHidden(for configuration: Configuration, for view: UIView) -> Bool {
        if hiddenForCoordinateViews.contains(view) { return configuration.isHiddenCoordinate }
        if inventoryStatusViews.contains(view) { return configuration.isHiddenInventoryStatus }
        if statusViews.contains(view) { return configuration.isHiddenStatus }
        if deviceSerialViews.contains(view) { return configuration.isHiddenDeviceSerial }
        if categoryCodeViews.contains(view) { return configuration.isHiddenCategoryCode }
        if categoryNameViews.contains(view) { return configuration.isHiddenCategoryName }
        if locationCodeViews.contains(view) { return configuration.isHiddenLocationCode }
        if locationNameViews.contains(view) { return configuration.isHiddenLocationName }
        if principalCodeViews.contains(view) { return configuration.isHiddenPrincipalCode }
        if userAccountViews.contains(view) { return configuration.isHiddenUserAccount }
        if principalViews.contains(view) { return configuration.isHiddenPrincipal }
        if userViews.contains(view) { return configuration.isHiddenUser }
        return false
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
        principalCodeLabel.text = viewModel.principalCode
        userAccountLabel.text = viewModel.userAccount
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
