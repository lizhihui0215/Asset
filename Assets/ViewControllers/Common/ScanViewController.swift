//
// Created by lizhihui on 2021/5/1.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class ScanViewController: BaseViewController {
    @IBOutlet var scanAnimationImageView: ScanAnimationImageView!
    let scanner = ScanService.shared
    lazy var viewModel: ScanViewModel = {
        ScanViewModel(request: AssetDetailRequest(), action: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.insertSublayer(scanner.previewLayer, at: 0)
        scanner.previewLayer.frame = UIScreen.main.bounds
        scanner.startRunning()
        scanAnimationImageView.startAnimation()
        scanner.didReceivedMetadataObject = { [weak self] object in
            guard let self = self else { return true }
            `self`.viewModel.metadataObject = object
            `self`.scanAnimationImageView.stopAnimation()
            return false
        }
    }

    @IBAction func flashTapped(_ sender: AnimatableButton) {}

    @IBAction func finishedTapped(_ sender: AnimatableButton) {
        scanner.startRunning()
        scanAnimationImageView.startAnimation()
    }

    @IBAction func albumTapped(_ sender: AnimatableButton) {}
}
