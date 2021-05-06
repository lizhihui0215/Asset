//
// Created by lizhihui on 2021/5/1.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import BrightFutures
import Foundation
import ZLPhotoBrowser

class ScanViewController: BaseViewController {
    enum ScanAction {
        case abnegatedContinue
        case discern(MetadataObject)
    }

    @IBOutlet var scanAnimationImageView: ScanAnimationImageView!
    @IBOutlet var torchButton: AnimatableButton!
    @IBOutlet var finishedButton: AnimatableButton!

    @IBOutlet var buttonStackView: UIStackView!
    var viewModel: ScanViewModel!

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopScanning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.insertSublayer(viewModel.previewLayer, at: 0)
        viewModel.previewLayer.frame = UIScreen.main.bounds
        launchScanner()
        if !viewModel.isTorchAvailable {
            buttonStackView.removeArrangedSubview(torchButton)
            torchButton.removeFromSuperview()
        }
    }

    func launchScanner() {
        scanAnimationImageView.startAnimation()
        viewModel.launchScanner().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.finishedButton.isEnabled = true
        }.onFailure { _ in
            `self`.finishedButton.isEnabled = false
        }
    }

    private func stopScanning() {
        viewModel.stopScanning()
        scanAnimationImageView.stopAnimation()
    }

    private func startScanning() {
        viewModel.startScanning()
        scanAnimationImageView.startAnimation()
    }

    @IBAction func flashTapped(_ sender: AnimatableButton) {
        sender.isSelected = !sender.isSelected
        viewModel.torchMode = sender.isSelected ? .on : .off
    }

    @IBAction func finishedTapped(_ sender: AnimatableButton) {
        viewModel.finished().onSuccess { [weak self] identifier in
            guard let self = self else { return }
            `self`.performSegue(withIdentifier: identifier, sender: self)
        }.onFailure { _ in
            // TODO: add missing handler
        }
    }

    @IBAction func albumTapped(_ sender: AnimatableButton) {
        let photoPreviewSheet = ZLPhotoPreviewSheet()
        photoPreviewSheet.selectImageBlock = { [weak self] images, assets, isOriginal in
            guard let self = self, let image = images.first else { return }
            let success = `self`.viewModel.discernMetadataObject(from: image)
            `self`.finishedButton.isEnabled = success
            log.info("image: ", context: images)
            log.info("assets: ", context: assets)
            log.info("isOriginal: ", context: isOriginal)
        }
        photoPreviewSheet.showPhotoLibrary(sender: self)
    }
}
