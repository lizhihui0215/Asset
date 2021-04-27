//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import CoreLocation
import Foundation
import JZLocationConverter
import SwiftLocation

class LocationDetailViewModel: BaseViewModel<LocationDetailViewController> {
    private let locationId: String
    private var locationDetail: LocationDetail?
    private var location: CLLocation?

    public var code: String {
        locationDetail?.locationCode ?? ""
    }

    public var name: String {
        locationDetail?.locationName ?? ""
    }

    public var originalLatitude: String {
        locationDetail?.strLatitude ?? ""
    }

    public var originalLongitude: String {
        locationDetail?.strLongitude ?? ""
    }

    public var latitude: String {
        guard let latitude = location?.coordinate.latitude else { return "" }
        return String(latitude)
    }

    public var longitude: String {
        guard let longitude = location?.coordinate.longitude else { return "" }
        return String(longitude)
    }

    init(request: RequestRepresentable, action: LocationDetailViewController, locationId: String) {
        self.locationId = locationId
        super.init(request: request, action: action)
    }

    func fetchLocationDetail(completionHandler: @escaping ViewModelCompletionHandler<LocationDetail?>) {
        api(of: LocationDetailResponse.self,
            router: .locationDetail(LocationDetailParameter(locationId: locationId))) { [weak self] result in
            guard let self = self else { return }
            `self`.locationDetail = try? result.get()
            completionHandler(result)
        }
    }

    func update(location: CLLocation?, refresh: Bool = false) {
        self.location = location
    }
}

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
