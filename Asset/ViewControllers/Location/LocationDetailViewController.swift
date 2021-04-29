//
//  LocationDetailViewController.swift
//  Asset
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
    var locationService: BDLocationService = .shared

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLocationCoordinates()
        viewModel.fetchLocationDetail { [weak self] _ in
            guard let self = self else { return }
            `self`.refreshPage()
        }
    }

    func refreshPage() {
        codeLabel.text = viewModel.code
        nameLabel.text = viewModel.name
        originalLatitudeLabel.text = viewModel.originalLatitude
        originalLongitudeLabel.text = viewModel.originalLongitude
        latitudeLabel.text = viewModel.latitude
        longitudeLabel.text = viewModel.longitude
    }

    @IBAction func updateLocationCoordinatesTapped(_ sender: UIButton) {
        updateLocationCoordinates()
    }

    func updateLocationCoordinates() {
        locationService.getGPSLocation { [weak self] in
            guard let self = self, let result = try? $0.get() else { return }
            `self`.viewModel.update(location: result.location)
            `self`.refreshPage()
            log.info("GPS Location: ", context: result.location)
        }
    }

    @IBAction func saveLocationCoordinatesTapped(_ sender: UIButton) {
        viewModel.updateLocationCoordinate { [weak self] _ in
            guard let self = self else { return }
            `self`.alert(message: L10n.locationDetail.saveLocationCoordinate.success.alert.message)
            `self`.refreshPage()
        }
    }

    @IBAction func photographTapped(_ sender: UIBarButtonItem) {}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        let segue = StoryboardSegue.Location(segue)
        switch segue {
        case .toPhotograph:
            guard let destination = destination as? PhotographViewController
            else {
                break
            }
            destination.viewModel = viewModel.photographViewModel(action: destination)
        default: break
        }
    }
}