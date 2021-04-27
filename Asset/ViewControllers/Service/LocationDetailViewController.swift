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

    override func viewDidLoad() {
        super.viewDidLoad()
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
        SwiftLocation.gpsLocation().eam.then { [weak self] in
            guard let self = self else { return }
            `self`.viewModel.update(location: $0.location)
            `self`.refreshPage()
            log.info("GPS Location: ", context: $0.location)
        }
    }

    @IBAction func saveLocationCoordinatesTapped(_ sender: UIButton) {}

    @IBAction func photographTapped(_ sender: UIBarButtonItem) {}

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
