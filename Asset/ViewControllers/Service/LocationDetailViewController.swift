//
//  LocationDetailViewController.swift
//  Asset
//
//  Created by lizhihui on 2021/4/25.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class LocationDetailViewController: BaseViewController {
    @IBOutlet var codeLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var originalLongitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var originalLatitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!

    lazy var viewModel: LocationDetailViewModel = {
        LocationDetailViewModel(request: LocationDetailRequest(), action: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func updateLocationCoordinatesTapped(_ sender: UIButton) {}

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
