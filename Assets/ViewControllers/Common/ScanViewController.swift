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
                        `self`.alert(message: L10n.scan.error.invalidAssetTagNumber.alert.message)
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
                    `self`.perform(segue: StoryboardSegue.Common.successToInventory)
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
        Future { [weak self] complete in

            guard let metadataObject = metadataObject else {
                guard let self = self else { return }
                let dismissHandler = Self.defaultAlertAction {
                    complete(.failure(EAMError.ScanServiceError.undiscerning))
                }

                `self`.alert(message: L10n.scan.error.invalidAssetTagNumber.alert.message,
                             defaultAction: dismissHandler)
                return
            }

            let otherAction = UIAlertAction(title: L10n.scan.success.toInventoryAsset.alert.action.cancel,
                                            style: .default) { _ in
                complete(.failure(EAMError.ScanServiceError.cancel))
            }

            let inventoryAction = UIAlertAction(title: L10n.scan.success.toInventoryAsset.alert.action.default,
                                                style: .cancel) { _ in
                complete(.success(metadataObject))
            }

            alert(message: L10n.scan.success.toInventoryAsset.alert.message(metadataObject.messageString ?? "null"),
                  defaultAction: inventoryAction,
                  otherAction: otherAction)
        }
    }

    @IBAction func albumTapped(_ sender: AnimatableButton) {
        stopScanning()
        let photoPreviewSheet = ZLPhotoPreviewSheet()
        photoPreviewSheet.selectImageBlock = { [weak self] images, assets, isOriginal in
            guard let self = self else { return }
            guard let image = images.first
            else {
                `self`.alert(message: L10n.scan.error.invalidAssetTagNumber.alert.message)
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
                `self`.perform(segue: StoryboardSegue.Common.successToInventory)
            }

            log.info("image: ", context: images)
            log.info("assets: ", context: assets)
            log.info("isOriginal: ", context: isOriginal)
        }
        photoPreviewSheet.showPhotoLibrary(sender: self)
    }
}
