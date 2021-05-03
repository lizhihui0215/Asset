//
// Created by lizhihui on 2021/5/1.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import BrightFutures
import Foundation
import ZLPhotoBrowser

class ScanViewController: BaseViewController {
    @IBOutlet var scanAnimationImageView: ScanAnimationImageView!
    @IBOutlet var torchButton: AnimatableButton!
    @IBOutlet var buttonStackView: UIStackView!
    let scanner = ScanService.shared
    var viewModel: ScanViewModel!

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
            `self`.scanAnimationImageView.stopAnimation()
            `self`.viewModel.fetchAssetDetail()
                .mapError {
                    EAMError.ScanServiceError.apiFailure($0)
                }.flatMap { [weak self] assetDetail -> Future<MetadataObject, Error> in
                    guard let self = self else { return Future(error: EAMError.weakSelfUnWrapError) }
                    `self`.viewModel.assetDetail = assetDetail
                    return `self`.handleScanResult(metadataObject: metadataObject)
                }.onFailure { [weak self] error in
                    guard let self = self else { return }
                    switch error.asScanServiceError {
                    case .apiFailure:
                        `self`.alert(message: "无效的资产标签号！请继续扫描！")
                        fallthrough
                    case .cancel,
                         .undiscerning:
                        `self`.scanAnimationImageView.startAnimation()
                        completionHandler(true)
                    default: break
                    }
                }.onSuccess { [weak self] metadataObject in
                    guard let self = self else { return }
                    `self`.viewModel.metadataObject = metadataObject
                    completionHandler(false)
                    // TODO: to inventory asset
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

    func handleScanResult(metadataObject: MetadataObject?) -> Future<MetadataObject, Error> {
        Future { complete in
            guard let metadataObject = metadataObject else {
                alert(message: "无效的资产标签号！请继续扫描！") {
                    complete(.failure(EAMError.ScanServiceError.undiscerning))
                }
                return
            }

            let otherAction = UIAlertAction(title: "否", style: .default) { _ in
                complete(.failure(EAMError.ScanServiceError.cancel))
            }

            alert(title: "是",
                  message: "扫描成功！ \n 资产编码：\(metadataObject.messageString ?? "null") \n 是否开始盘点资产",
                  otherAction: otherAction) {
                complete(.success(metadataObject))
            }
        }
    }

    @IBAction func albumTapped(_ sender: AnimatableButton) {
        stopScanning()
        let photoPreviewSheet = ZLPhotoPreviewSheet()
        photoPreviewSheet.selectImageBlock = { [weak self] images, assets, isOriginal in
            guard let self = self else { return }
            guard let image = images.first
            else {
                `self`.alert(message: "无效的资产标签号！请继续扫描！")
                `self`.startScanning()
                return
            }

            let metadataObject = `self`.scanner.discernMetadataObject(from: image)

            `self`.handleScanResult(metadataObject: metadataObject).onFailure { error in
                switch error.asScanServiceError {
                case .cancel, .undiscerning: `self`.startScanning()
                default: break
                }
            }.onSuccess { [weak self] _ in
                guard let self = self else { return }
                `self`.viewModel.metadataObject = metadataObject
                // TODO: to inventory asset
            }

            log.info("image: ", context: images)
            log.info("assets: ", context: assets)
            log.info("isOriginal: ", context: isOriginal)
        }
        photoPreviewSheet.showPhotoLibrary(sender: self)
    }
}
