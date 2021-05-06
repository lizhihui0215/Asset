//
// Created by lizhihui on 2021/5/2.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import AVFoundation
import Foundation
import UIKit

class ScanViewModel: BaseViewModel<ScanViewController> {
    var metadataObject: MetadataObject!
    typealias SegueIdentifier = String

    let scanner = ScanService.shared

    public var previewLayer: AVCaptureVideoPreviewLayer {
        scanner.previewLayer
    }

    var isTorchAvailable: Bool {
        scanner.isTorchAvailable
    }

    public var torchMode: AVCaptureDevice.TorchMode {
        get {
            scanner.torchMode
        }
        set {
            scanner.torchMode = newValue
        }
    }

    final func launchScanner() -> ViewModelFuture<MetadataObject> {
        ViewModelFuture<MetadataObject> { completion in
            scanner.didReceivedMetadataObject = { [weak self] metadataObject, completionHandler in
                guard let self = self else { return }
                `self`.metadataObject = metadataObject
                completionHandler(false)
                completion(.success(metadataObject))
            }
            startScanning()
        }
    }

    func discernMetadataObject(from image: UIImage) -> Bool {
        guard let metadataObject = scanner.discernMetadataObject(from: image) else { return false }
        self.metadataObject = metadataObject
        return true
    }

    func finished() -> ViewModelFuture<SegueIdentifier> {
        fatalError("sub class must implement this method to handler finished")
    }

    func startScanning() {
        scanner.startRunning()
    }

    func stopScanning() {
        scanner.stopRunning()
    }
}
