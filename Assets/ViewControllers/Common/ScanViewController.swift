//
// Created by lizhihui on 2021/5/1.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import AVFoundation
import BrightFutures
import Foundation
import ZLPhotoBrowser

class ScanViewController: BaseViewController {
    @IBOutlet var scanAnimationImageView: ScanAnimationImageView!
    @IBOutlet var torchButton: AnimatableButton!
    @IBOutlet var finishedButton: AnimatableButton!
    @IBOutlet var informationLabel: UILabel!
    @IBOutlet var QRImageView: UIImageView!

    @IBOutlet var buttonStackView: UIStackView!
    var viewModel: ScanViewModel!

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopScanning()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startScanning()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.backgroundColor = UIColor.clear.cgColor
        view.layer.insertSublayer(viewModel.previewLayer, at: 0)
        viewModel.previewLayer.frame = UIScreen.main.bounds
        startScanning()
        if !viewModel.isTorchAvailable {
            buttonStackView.removeArrangedSubview(torchButton)
            torchButton.removeFromSuperview()
        }
    }

    private func stopScanning() {
        viewModel.stopScanning()
        scanAnimationImageView.stopAnimation()
    }

    private func startScanning() {
        QRImageView.isHidden = true
        `self`.finishedButton.isEnabled = false
        scanAnimationImageView.startAnimation()
        viewModel.startScanning().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.informationLabel.text = `self`.viewModel.information
            `self`.scanAnimationImageView.stopAnimation()
            `self`.viewModel.captureImage(delegate: self)
            `self`.finishedButton.isEnabled = true
        }.onFailure { _ in
            `self`.finishedButton.isEnabled = false
        }
    }

    @IBAction func flashTapped(_ sender: AnimatableButton) {
        sender.isSelected = !sender.isSelected
        viewModel.torchMode = sender.isSelected ? .on : .off
    }

    @IBAction func finishedTapped(_ sender: AnimatableButton) {
        viewModel.finished().onSuccess { [weak self] identifier in
            guard let self = self else { return }
            `self`.performSegue(withIdentifier: identifier, sender: self)
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

    override func prepare(for segue: UIKit.UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as AssetDetailViewController:
            destination.viewModel = viewModel.viewModel(for: destination)
        case let destination as AssetTaskInventoryDetailViewController where segue.identifier != StoryboardSegue.Common.unwindToAssetTaskInventoryDetail.rawValue:
            destination.viewModel = viewModel.viewModel(for: destination)
        case let destination as TransformAssetDetailViewController where segue.identifier != StoryboardSegue.Common.unwindFromScanViewControllerToTransformAssetDetailController.rawValue:
            destination.viewModel = viewModel.viewModel(for: destination)
        default: break
        }
    }
}

extension ScanViewController: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        func cropImage(image: UIImage, rect: CGRect, scale: CGFloat) -> UIImage? {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: rect.size.width * scale, height: rect.size.height * scale), true, 0.0)
            image.draw(at: CGPoint(x: -rect.origin.x * scale, y: -rect.origin.y * scale))
            let croppedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return croppedImage
        }

        guard let imageData = photo.fileDataRepresentation() else {
            log.debug("Error while generating image from photo capture data.")
            return
        }
        guard var qrImage = UIImage(data: imageData) else {
            log.debug("Unable to generate UIImage from image data.")
            return
        }

        if qrImage.imageOrientation != .up {
            UIGraphicsBeginImageContextWithOptions(qrImage.size, false, qrImage.scale)
            qrImage.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: qrImage.size))
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            if let image = image {
                qrImage = image
            }
        }

        let frame = QRImageView.convert(QRImageView.frame, to: view)

        let scale = qrImage.size.width / UIScreen.main.bounds.width

        guard let croppingImage = cropImage(image: qrImage, rect: frame, scale: scale) else {
            QRImageView.image = qrImage
            QRImageView.isHidden = false
            return
        }

        QRImageView.image = croppingImage
        QRImageView.isHidden = false
    }
}
