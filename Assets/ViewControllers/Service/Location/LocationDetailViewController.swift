//
//  LocationDetailViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/4/25.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import SwiftLocation
import UIKit

class LocationDetailViewController: BaseViewController {
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var originalLongitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var originalLatitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!

    var viewModel: LocationDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLocationCoordinates()
        viewModel.fetchLocationDetail().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.refreshPage()
        }
    }

    func refreshPage() {
        codeLabel.text = viewModel.code
        nameLabel.text = viewModel.name
        originalLatitudeLabel.text = viewModel.systemLatitude
        originalLongitudeLabel.text = viewModel.systemLongitude
        latitudeLabel.text = viewModel.latitude
        longitudeLabel.text = viewModel.longitude
    }

    @IBAction func updateLocationCoordinatesTapped(_ sender: UIButton) {
        updateLocationCoordinates()
    }

    func updateLocationCoordinates() {
        viewModel.getGPSLocation().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.longitudeLabel.text = `self`.viewModel.longitude
            `self`.latitudeLabel.text = `self`.viewModel.latitude
        }
    }

    @IBAction func saveLocationCoordinatesTapped(_ sender: UIButton) {
        viewModel.updateLocation().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.alert(message: L10n.locationDetail.saveLocationCoordinate.success.alert.message)
            `self`.refreshPage()
        }
    }

    @IBAction func photographTapped(_ sender: UIBarButtonItem) {}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination() {
        case let destination as PhotographViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        case let destination as AssetInventoryListViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        default: break
        }
    }
}
