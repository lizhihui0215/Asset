//
//  BDLocationService.swift
//  Asset
//
//  Created by lizhihui on 2021/4/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension BMKLocation: EAMLocation {}

extension BMKLocationManager: LocationManager {}

final class BDLocationService: NSObject, LocationServiceable {
    typealias Manager = BMKLocationManager

    typealias O = DBOptional

    typealias L = BMKLocation

    struct DBOptional: Optional {
        var coordinateType: BMKLocationCoordinateType = .BMK09LL
        // 设置距离过滤参数
        var distanceFilter = kCLDistanceFilterNone
        // 设置预期精度参数
        var desiredAccuracy = kCLLocationAccuracyBest
        // 设置应用位置类型
        var activityType: CLActivityType = .automotiveNavigation
        // 设置是否自动停止位置更新
        var pausesLocationUpdatesAutomatically = false
        // 设置是否允许后台定位
        var allowsBackgroundLocationUpdates = false
        // 设置位置获取超时时间
        var locationTimeout = 10
        // 设置获取地址信息超时时间
        var reGeocodeTimeout = 10
    }

    private var optional = DBOptional() {
        didSet {
            manager.coordinateType = optional.coordinateType
            manager.distanceFilter = optional.distanceFilter
            manager.desiredAccuracy = optional.desiredAccuracy
            manager.activityType = optional.activityType
            manager.pausesLocationUpdatesAutomatically = optional.pausesLocationUpdatesAutomatically
            manager.allowsBackgroundLocationUpdates = optional.allowsBackgroundLocationUpdates
            manager.locationTimeout = optional.locationTimeout
            manager.reGeocodeTimeout = optional.reGeocodeTimeout
        }
    }

    private static let `default` = BDLocationService()

    public static var shared: Self {
        // swiftlint:disable:next force_cast
        `default` as! Self
    }

    var manager: BMKLocationManager

    required init(manager: BMKLocationManager = .init()) {
        self.manager = manager
        super.init()
        self.manager.delegate = self
    }

    func launchService() {
        BMKLocationAuth.sharedInstance().checkPermision(withKey: "A6PHX4uUtqLAckqPwTVgRKt2EGs3GEzN", authDelegate: self)
    }

    func with(optional: () -> DBOptional) -> Self {
        self.optional = optional()
        return self
    }

    func getGPSLocation(completion: @escaping (Result<BMKLocation?, Error>) -> Void) {
        manager.requestLocation(withReGeocode: false, withNetworkState: false) {
            if let error = $2 {
                completion(.failure(error))
                return
            }
            completion(.success($0))
        }
    }
}

extension BDLocationService: BMKLocationAuthDelegate {
    func onCheckPermissionState(_ iError: BMKLocationAuthErrorCode) {
        guard let error = EAMError.LocationServiceError.AuthError(rawValue: iError.rawValue) else {
            log.info("BDLocationService success status: \(iError)"); return
        }
        log.error("BDLocationService failed error: \(String(describing: error.errorDescription))")
    }
}

extension BDLocationService: BMKLocationManagerDelegate {
    public func bmkLocationManager(_ manager: BMKLocationManager, doRequestAlwaysAuthorization locationManager: CLLocationManager) {
        log.info("bmkLocationManager doRequestAlwaysAuthorization")
    }

    public func bmkLocationManager(_ manager: BMKLocationManager, didFailWithError error: Error?) {
        log.error("bmkLocationManager didFailWithError \(String(describing: error))")
    }

    public func bmkLocationManager(_ manager: BMKLocationManager, didUpdate location: BMKLocation?, orError error: Error?) {
        if let location = location {
            log.info("bmkLocationManager didUpdate location: \(location)")
        }

        if let error = error {
            log.error("bmkLocationManager didUpdate error: \(error)")
        }
    }

    public func bmkLocationManager(_ manager: BMKLocationManager, didChange status: CLAuthorizationStatus) {
        log.info("bmkLocationManager didChange status: \(status)")
    }

    public func bmkLocationManagerDidChangeAuthorization(_ manager: BMKLocationManager) {
        log.info("bmkLocationManager idChangeAuthorization")
    }

    public func bmkLocationManager(_ manager: BMKLocationManager, didUpdate heading: CLHeading?) {
        log.info("bmkLocationManager didUpdate heading \(String(describing: heading))")
    }

    public func bmkLocationManager(_ manager: BMKLocationManager, didUpdate state: BMKLocationNetworkState, orError error: Error?) {
        log.info("bmkLocationManager didUpdate state \(state)")

        if let error = error {
            log.error("bmkLocationManager didUpdate error: \(error)")
        }
    }
}
