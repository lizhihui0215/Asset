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
    var locationService: BDLocationService = .shared

    @IBOutlet var inventoryStatusLabel: UILabel!
    @IBOutlet var tagNumberLabel: UILabel!
    @IBOutlet var nameTextField: AnimatableTextField!
    @IBOutlet var manufactureTextField: AnimatableTextField!
    @IBOutlet var modelTextField: AnimatableTextField!
    @IBOutlet var systemLocationCodeLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var systemLocationNameLabel: UILabel!
    @IBOutlet var locationNameLabel: UILabel!
    @IBOutlet var amountTextField: AnimatableTextField!
    @IBOutlet var responsiblePersonTextField: AnimatableTextField!
    @IBOutlet var userTextField: AnimatableTextField!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var updateLocationCoordinateButton: AnimatableButton!
    @IBOutlet var photographButton: AnimatableButton!

    var state: ViewState = .viewing {
        didSet {
            update(for: state)
        }
    }

    private func update(for state: ViewState) {
        if state == .viewing {}
    }

    @IBAction func updateLocationCoordinateTapped(_ sender: AnimatableButton) {
        updateLocationCoordinates()
    }

    @IBAction func photographTapped(_ sender: AnimatableButton) {}

    func updateLocationCoordinates() {
        locationService.getGPSLocation { [weak self] in
            guard let self = self, let result = try? $0.get() else { return }
            `self`.viewModel.update(location: result.location)
            log.info("GPS Location: ", context: result.location)
        }
    }
}
