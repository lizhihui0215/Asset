//
// Created by lizhihui on 2021/5/1.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import AVFoundation
import Foundation

public struct MetadataObject {
    /// 码内容
    public var metadataObject: AVMetadataMachineReadableCodeObject

    public init(metadataObject: AVMetadataMachineReadableCodeObject) {
        self.metadataObject = metadataObject
    }
}

class ScanService: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    typealias DidReceivedMetadataObject = (_ metadataObject: MetadataObject) -> Bool
    public static let shared = ScanService()!

    let device: AVCaptureDevice
    var input: AVCaptureDeviceInput
    var output = AVCaptureMetadataOutput()
    let session = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer
    var stillImageOutput: AVCapturePhotoOutput
    private let outputQueue: DispatchQueue
    var didReceivedMetadataObject: DidReceivedMetadataObject?
    private var shouldProcessingToNext = true

    init?(support scanTypes: [AVMetadataObject.ObjectType] = [.qr, .code128],
          rectOfInterest: CGRect = .zero,
          outputQueue: DispatchQueue = .main)
    {
        stillImageOutput = AVCapturePhotoOutput()
        self.outputQueue = outputQueue
        guard let device = AVCaptureDevice.default(for: .video) else { return nil }
        guard let input = try? AVCaptureDeviceInput(device: device) else { return nil }
        self.device = device
        self.input = input
        if session.canAddInput(input) { session.addInput(input) }
        if session.canAddOutput(output) { session.addOutput(output) }
        if session.canAddOutput(stillImageOutput) { session.addOutput(stillImageOutput) }
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        super.init()
        output.metadataObjectTypes = scanTypes
        output.setMetadataObjectsDelegate(self, queue: outputQueue)
        session.sessionPreset = .high
        if !rectOfInterest.equalTo(.zero) { output.rectOfInterest = rectOfInterest }

        if device.isFocusPointOfInterestSupported, device.isFocusModeSupported(.continuousAutoFocus) {
            do {
                try input.device.lockForConfiguration()
                input.device.focusMode = .continuousAutoFocus
                input.device.unlockForConfiguration()
            } catch let error as NSError {
                print("device.lockForConfiguration(): \(error)")
            }
        }
    }

    public func metadataOutput(_ output: AVCaptureMetadataOutput,
                               didOutput metadataObjects: [AVMetadataObject],
                               from connection: AVCaptureConnection)
    {
        guard shouldProcessingToNext else { return }

        for metadataObject in metadataObjects {
            guard let code = metadataObject as? AVMetadataMachineReadableCodeObject else {
                continue
            }

            let object = MetadataObject(metadataObject: code)
            log.debug("scanning received object output: \(output) metadataObjects: \(metadataObjects) connection: \(connection) ")

            guard let didReceivedMetadataObject = didReceivedMetadataObject else { return }
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                `self`.shouldProcessingToNext = didReceivedMetadataObject(object)
            }
        }
    }

    func startRunning() {
        shouldProcessingToNext = true
        guard !session.isRunning else { return }
        session.startRunning()
    }

    func stopRunning(shouldProcessingToNext: Bool? = nil) {
        guard let shouldProcessingToNext = shouldProcessingToNext else {
            guard session.isRunning else { return }
            session.stopRunning()
            return
        }

        self.shouldProcessingToNext = shouldProcessingToNext
    }

    // MARK: - ---拍照

//    open func captureImage() {
//        guard let stillImageConnection = connectionWithMediaType(mediaType: AVMediaType.video as AVMediaType,
//                connections: stillImageOutput.connections as [AnyObject]) else {
//            return
//        }
//        stillImageOutput.captureStillImageAsynchronously(from: stillImageConnection, completionHandler: { (imageDataSampleBuffer, _) -> Void in
//            self.stop()
//            if let imageDataSampleBuffer = imageDataSampleBuffer,
//               let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(imageDataSampleBuffer) {
//
//                let scanImg = UIImage(data: imageData)
//                for idx in 0 ... self.results.count - 1 {
//                    self.results[idx].imgScanned = scanImg
//                }
//            }
//            self.successBlock(self.results)
//        })
//    }

    open func connectionWithMediaType(mediaType: AVMediaType, connections: [AnyObject]) -> AVCaptureConnection? {
        log.debug("scanning received object mediaType: \(mediaType) connections: \(connections)")
        for connection in connections {
            guard let connectionTmp = connection as? AVCaptureConnection else {
                continue
            }
            for port in connectionTmp.inputPorts where port.mediaType == mediaType {
                return connectionTmp
            }
        }
        return nil
    }

    open func isGetFlash() -> Bool {
        device.hasFlash
    }

    /**
     打开或关闭闪关灯
     - parameter torch: true：打开闪关灯 false:关闭闪光灯
     */
    open func setTorch(torch: Bool) {
        guard isGetFlash() else {
            return
        }
        do {
            try input.device.lockForConfiguration()
            input.device.torchMode = torch ? AVCaptureDevice.TorchMode.on : AVCaptureDevice.TorchMode.off
            input.device.unlockForConfiguration()
        } catch let error as NSError {
            print("device.lockForConfiguration(): \(error)")
        }
    }

    /// 闪光灯打开或关闭
    open func changeTorch() {
        let torch = input.device.torchMode == .off
        setTorch(torch: torch)
    }

    // MARK: - -----获取系统默认支持的码的类型

    var defaultMetaDataObjectTypes: [AVMetadataObject.ObjectType] {
        [.upce, .code39, .code39Mod43, .ean13, .ean8, .code93, .code128,
         .pdf417, .aztec, .interleaved2of5, .itf14, .dataMatrix]
    }

//    public static func recognizeQRImage(image: UIImage) -> [MetadataObject] {
//        guard let cgImage = image.cgImage else {
//            return []
//        }
//        let detector = CIDetector(ofType: CIDetectorTypeQRCode,
//                                  context: nil,
//                                  options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])!
//        let img = CIImage(cgImage: cgImage)
//        let features = detector.features(in: img, options: [CIDetectorAccuracy: CIDetectorAccuracyHigh])
//        return features.filter {
//            $0.isKind(of: CIQRCodeFeature.self)
//        }.map {
//            $0 as! CIQRCodeFeature
//        }.map {
//            MetadataObject(content: $0.messageString,
//                     image: image,
//                     codeType: AVMetadataObject.ObjectType.qr.rawValue,
//                     positions: nil)
//        }
//    }

    // MARK: - - - 生成二维码，背景色及二维码颜色设置

    public static func createCode(codeType: String, codeString: String, size: CGSize, qrColor: UIColor, bkColor: UIColor) -> UIImage? {
        let stringData = codeString.data(using: .utf8)

        // 系统自带能生成的码
        //        CIAztecCodeGenerator
        //        CICode128BarcodeGenerator
        //        CIPDF417BarcodeGenerator
        //        CIQRCodeGenerator
        let qrFilter = CIFilter(name: codeType)
        qrFilter?.setValue(stringData, forKey: "inputMessage")
        qrFilter?.setValue("H", forKey: "inputCorrectionLevel")

        // 上色
        let colorFilter = CIFilter(name: "CIFalseColor",
                                   parameters: [
                                       "inputImage": qrFilter!.outputImage!,
                                       "inputColor0": CIColor(cgColor: qrColor.cgColor),
                                       "inputColor1": CIColor(cgColor: bkColor.cgColor),
                                   ])

        guard let qrImage = colorFilter?.outputImage,
              let cgImage = CIContext().createCGImage(qrImage, from: qrImage.extent)
        else {
            return nil
        }

        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        context.interpolationQuality = CGInterpolationQuality.none
        context.scaleBy(x: 1.0, y: -1.0)
        context.draw(cgImage, in: context.boundingBoxOfClipPath)
        let codeImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return codeImage
    }

//    public static func createCode128(codeString: String, size: CGSize, qrColor: UIColor, bkColor: UIColor) -> UIImage? {
//        let stringData = codeString.data(using: String.Encoding.utf8)
//
//        // 系统自带能生成的码
//        //        CIAztecCodeGenerator 二维码
//        //        CICode128BarcodeGenerator 条形码
//        //        CIPDF417BarcodeGenerator
//        //        CIQRCodeGenerator     二维码
//        let qrFilter = CIFilter(name: "CICode128BarcodeGenerator")
//        qrFilter?.setDefaults()
//        qrFilter?.setValue(stringData, forKey: "inputMessage")
//
//        guard let outputImage = qrFilter?.outputImage else {
//            return nil
//        }
//        let context = CIContext()
//        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {
//            return nil
//        }
//        let image = UIImage(cgImage: cgImage, scale: 1.0, orientation: UIImage.Orientation.up)
//
//        // Resize without interpolating
//        return resizeImage(image: image, quality: CGInterpolationQuality.none, rate: 20.0)
//    }
}
