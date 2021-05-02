//
// Created by lizhihui on 2021/5/1.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import ZLPhotoBrowser

class ScanViewController: BaseViewController {
    @IBOutlet var scanAnimationImageView: ScanAnimationImageView!
    @IBOutlet var torchButton: AnimatableButton!
    @IBOutlet var buttonStackView: UIStackView!
    let scanner = ScanService.shared
    lazy var viewModel: ScanViewModel = {
        ScanViewModel(request: AssetDetailRequest(), action: self)
    }()

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopScanning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        launchScanner()
        startScanning()

        viewModel.apiErrorAction = UIAlertAction(title: "继续", style: .default) { [weak self] _ in
            guard let self = self else { return }
            `self`.scanner.startRunning()
            `self`.scanAnimationImageView.stepAnimation()
        }

        viewModel.apiErrorDismissHandler = {
            self.navigationController?.popViewController(animated: true)
        }

        if !scanner.isTorchAvailable {
            buttonStackView.removeArrangedSubview(torchButton)
            torchButton.removeFromSuperview()
        }
    }

    private func stopScanning() {
        scanner.stopRunning()
        scanAnimationImageView.stopAnimation()
    }

    private func launchScanner() {
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.insertSublayer(scanner.previewLayer, at: 0)
        scanner.previewLayer.frame = UIScreen.main.bounds
        scanner.didReceivedMetadataObject = { [weak self] metadataObject, completionHandler in
            guard let self = self else { return }
            `self`.viewModel.metadataObject = metadataObject
            `self`.scanAnimationImageView.stopAnimation()
            `self`.viewModel.fetchAssetDetail { _ in
                completionHandler(false)
            }
        }
    }

    @IBAction func flashTapped(_ sender: AnimatableButton) {
        sender.isSelected = !sender.isSelected
        scanner.torchMode = sender.isSelected ? .on : .off
    }

    @IBAction func finishedTapped(_ sender: AnimatableButton) {
        startScanning()
    }

    private func startScanning() {
        scanner.startRunning()
        scanAnimationImageView.startAnimation()
    }

    @IBAction func albumTapped(_ sender: AnimatableButton) {
        stopScanning()
        let photoPreviewSheet = ZLPhotoPreviewSheet()
        photoPreviewSheet.selectImageBlock = { [weak self] images, assets, isOriginal in
            guard let self = self else { return }
            guard let image = images.first,
                  let metadataObject = `self`.scanner.discernMetadataObject(from: image)
            else {
                `self`.alert(message: "扫描失败！")
                `self`.startScanning()
                return
            }

            self.viewModel.metadataObject = metadataObject

            let otherAction = UIAlertAction(title: "否", style: .default) { [weak self] _ in
                guard let self = self else { return }
                `self`.navigationController?.popViewController(animated: true)
            }

            `self`.alert(title: "是",
                         message: "扫描成功！ \n 资产编码：\(metadataObject.messageString ?? "null") \n 是否继续扫描",
                         otherAction: otherAction) { [weak self] in
                guard let self = self else { return }
                `self`.startScanning()
            }
            log.info("image: ", context: images)
            log.info("assets: ", context: assets)
            log.info("isOriginal: ", context: isOriginal)
        }
        photoPreviewSheet.showPhotoLibrary(sender: self)
    }
}
