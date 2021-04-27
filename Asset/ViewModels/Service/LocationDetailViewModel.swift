//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import CoreLocation
import Foundation

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
            router: .locationDetailByCode(LocationDetailParameter(locationCode: locationId))) { [weak self] result in
            guard let self = self else { return }
            `self`.locationDetail = try? result.get()
            completionHandler(result)
        }
    }

    func update(location: CLLocation?, refresh: Bool = false) {
        self.location = location
    }
}
