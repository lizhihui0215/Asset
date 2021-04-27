//
//  NativeLocationService.swift
//  Asset
//
//  Created by lizhihui on 2021/4/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import JZLocationConverter
import SwiftLocation
// FIXME: need to refectory confirm LocationServiceable
// JZLocationConverter.start { [weak self] error in
//    guard let `self` = self, let error = error else {
//        log.info("LocationConvert start successfully")
//        return
//    }
//    log.error(error)
// }
// SwiftLocation.gpsLocation().eam.then { [weak self] in
//    guard let self = self else { return }
//    `self`.viewModel.update(location: $0.location)
//    `self`.refreshPage()
//    log.info("GPS Location: ", context: $0.location)
// }

extension GPSLocationRequest: EAMExtended {}

public extension EAMExtension where ExtendedType == GPSLocationRequest {
    @discardableResult
    func then(queue: DispatchQueue = .main, _ callback: @escaping (Result<CLLocation, LocationError>) -> Void) -> Identifier {
        type.then { result in
            switch result {
            case .success(let result):
                JZLocationConverter.default.wgs84ToBd09(result.coordinate) { coordinate in
                    var location: CLLocation
                    if #available(iOS 13.4, *) {
                        location = CLLocation(coordinate: coordinate,
                                              altitude: result.altitude,
                                              horizontalAccuracy: result.horizontalAccuracy,
                                              verticalAccuracy: result.verticalAccuracy,
                                              course: result.course,
                                              courseAccuracy: result.courseAccuracy,
                                              speed: result.speed,
                                              speedAccuracy: result.speedAccuracy,
                                              timestamp: result.timestamp)
                    } else {
                        location = CLLocation(coordinate: coordinate,
                                              altitude: result.altitude,
                                              horizontalAccuracy: result.horizontalAccuracy,
                                              verticalAccuracy: result.verticalAccuracy,
                                              course: result.course,
                                              speed: result.speed,
                                              timestamp: result.timestamp)
                    }
                    callback(.success(location))
                }
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
}
