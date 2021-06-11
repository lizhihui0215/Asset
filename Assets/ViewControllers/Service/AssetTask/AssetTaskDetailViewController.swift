//
//  AssetTaskDetailViewController.swift
//  Assets
//
//  Created by Bernard on 2021/6/8.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class AssetTaskDetailViewController: BaseViewController {
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var systemLongitudeLabel: UILabel!
    @IBOutlet var systemLatitudeLabel: UILabel!
    @IBOutlet var checkBillCodeLabel: UILabel!
    @IBOutlet var taskNumberLabel: UILabel!
    @IBOutlet var taskNameLabel: UILabel!
    @IBOutlet var locationCodeLabel: UILabel!
    @IBOutlet var checkPersonLabel: UILabel!
    @IBOutlet var taskStatusNameLabel: UILabel!
    @IBOutlet var checkTaskStatusNameLabel: UILabel!
    @IBOutlet var lastCheckPersonLabel: UILabel!
    @IBOutlet var checkTaskTimeLabel: UILabel!
    @IBOutlet var checkCountLabel: UILabel!
    @IBOutlet var unCheckCountLabel: UILabel!
    @IBOutlet var alreadyCheckCountLabel: UILabel!
    @IBOutlet var lessCountLabel: UILabel!
    @IBOutlet var moreCountLabel: UILabel!

    var viewModel: AssetTaskDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchAssetTaskDetail().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.updateViews()
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */

    private func updateViews() {
        longitudeLabel.text = viewModel.longitude
        latitudeLabel.text = viewModel.latitude
        systemLongitudeLabel.text = viewModel.systemLongitude
        systemLatitudeLabel.text = viewModel.systemLatitude
        checkBillCodeLabel.text = viewModel.checkBillCode
        taskNumberLabel.text = viewModel.taskNumber
        taskNameLabel.text = viewModel.taskName
        locationCodeLabel.text = viewModel.locationCode
        checkPersonLabel.text = viewModel.checkPerson
        taskStatusNameLabel.text = viewModel.taskStatusName
        checkTaskStatusNameLabel.text = viewModel.checkTaskStatusName
        lastCheckPersonLabel.text = viewModel.lastCheckPerson
        checkTaskTimeLabel.text = viewModel.checkTaskTime
        checkCountLabel.text = viewModel.checkCount
        unCheckCountLabel.text = viewModel.unCheckCount
        alreadyCheckCountLabel.text = viewModel.alreadyCheckCount
        lessCountLabel.text = viewModel.lessCount
        moreCountLabel.text = viewModel.moreCount
    }

    @IBAction func uploadLocationTapped(_ sender: AnimatableButton) {
        updateLocationCoordinates()
    }

    @IBAction func uploadCoordinateTapped(_ sender: AnimatableButton) {
        viewModel.updateCoordinate()
    }

    func updateLocationCoordinates() {
        viewModel.getGPSLocation().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.longitudeLabel.text = `self`.viewModel.longitude
            `self`.latitudeLabel.text = `self`.viewModel.latitude
        }
    }

    func submit() {
        let a: ViewModelFuture<AssetTaskDetail?> = viewModel.submit()
    }
}
