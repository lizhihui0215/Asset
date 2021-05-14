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
            enum RightBarButtonItemAction {
                case view
                case photograph
            }

            public static let `default` = Configuration()

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
            let longitudeTitle: String
            let latitudeTitle: String
            let rightBarButtonItemTitle: String
            let rightBarButtonItemAction: RightBarButtonItemAction

            init(isHiddenCoordinate: Bool = false,
                 isHiddenInventoryStatus: Bool = false,
                 isHiddenStatus: Bool = false,
                 isHiddenDeviceSerial: Bool = false,
                 isHiddenCategoryCode: Bool = false,
                 isHiddenCategoryName: Bool = false,
                 isHiddenLocationCode: Bool = false,
                 isHiddenLocationName: Bool = false,
                 isHiddenPrincipalCode: Bool = true,
                 isHiddenUserAccount: Bool = true,
                 isHiddenPrincipal: Bool = false,
                 isHiddenUser: Bool = false,
                 locationCodeTitle: String = "实际地点编码:",
                 locationNameTitle: String = "实际地点名称:",
                 longitudeTitle: String = "经度:",
                 latitudeTitle: String = "纬度:",
                 rightBarButtonItemTitle: String = "查看照片",
                 rightBarButtonItemAction: RightBarButtonItemAction = .view)
            {
                self.isHiddenCoordinate = isHiddenCoordinate
                self.isHiddenInventoryStatus = isHiddenInventoryStatus
                self.isHiddenStatus = isHiddenStatus
                self.isHiddenDeviceSerial = isHiddenDeviceSerial
                self.isHiddenCategoryCode = isHiddenCategoryCode
                self.isHiddenCategoryName = isHiddenCategoryName
                self.isHiddenLocationCode = isHiddenLocationCode
                self.isHiddenLocationName = isHiddenLocationName
                self.isHiddenPrincipalCode = isHiddenPrincipalCode
                self.isHiddenUserAccount = isHiddenUserAccount
                self.isHiddenPrincipal = isHiddenPrincipal
                self.isHiddenUser = isHiddenUser
                self.locationCodeTitle = locationCodeTitle
                self.locationNameTitle = locationNameTitle
                self.longitudeTitle = longitudeTitle
                self.latitudeTitle = latitudeTitle
                self.rightBarButtonItemTitle = rightBarButtonItemTitle
                self.rightBarButtonItemAction = rightBarButtonItemAction
            }
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
    @IBOutlet var nameTextField: AnimatableTextField!
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

    @IBOutlet var hiddenViewsForEditing: [UIView]!
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
                containerStackView.removeArrangedSubview(view)
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
            nameTextField.isUserInteractionEnabled = false
            deviceSerialTextField.isUserInteractionEnabled = false
            statusButton.isUserInteractionEnabled = false
            longitudeTitleLabel.text = configuration.longitudeTitle
            latitudeTitleLabel.text = configuration.latitudeTitle
            photographButton.heightAnchor ~ 0
            locationCodeTitleLabel.text = configuration.locationCodeTitle
            locationNameTitleLabel.text = configuration.locationNameTitle
            rightBarButtonItem.title = configuration.rightBarButtonItemTitle
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
        nameTextField.text = viewModel.name
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

    @IBAction func rightBarButtonItemTapped(_ sender: UIBarButtonItem) {
        switch state {
        case .editing: save()
        case .viewing(configuration: _): break
        }

        let future: ViewModelFuture<StoryboardSegue.Common> = viewModel.rightBarButtonTapped()

        future.onSuccess { [weak self] result in
            guard let self = self else { return }
            `self`.perform(segue: result, sender: `self`)
        }
    }

    private func save() {
        if case .editing = state {
            viewModel.deviceSerial = deviceSerialTextField.eam.text
            viewModel.name = nameTextField.eam.text
            viewModel.manufacture = manufactureTextField.eam.text
            viewModel.model = modelTextField.eam.text
            viewModel.amount = amountTextField.eam.text
        }
    }

    func updateLocationCoordinates() {
        startLoadingIndicator()
        viewModel.getGPSLocation().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.longitudeLabel.text = `self`.viewModel.longitude
            `self`.latitudeLabel.text = `self`.viewModel.latitude
            `self`.stopLoadingIndicator()
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
