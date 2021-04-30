//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import CoreLocation
import Foundation

class LocationDetailViewModel: BaseViewModel<LocationDetailViewController> {
    private let locationCode: String
    private var locationDetail: LocationDetail?
    private var location: CLLocation?

    public var code: String {
        locationDetail?.locationCode ?? ""
    }

    public var name: String {
        locationDetail?.locationName ?? ""
    }

    public var originalLatitude: String {
        guard let latitude = locationDetail?.strLatitude else { return "" }
        return latitude
    }

    public var originalLongitude: String {
        guard let longitude = locationDetail?.strLongitude else { return "" }
        return longitude
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
        locationCode = locationId
        super.init(request: request, action: action)
    }

    func fetchLocationDetail(completionHandler: @escaping ViewModelCompletionHandler<LocationDetail?>) {
        api(of: LocationDetailResponse.self,
            router: .locationDetailByCode(LocationDetailParameter(locationCode: locationCode))) { [weak self] result in
            guard let self = self else { return }
            `self`.locationDetail = try? result.get()
            completionHandler(result)
        }
    }

    func updateLocationCoordinate(completionHandler: @escaping ViewModelCompletionHandler<UpdateLocationCoordinate?>) {
        api(of: UpdateLocationCoordinateResponse.self,
            router: .updateLocationCoordinate(UpdateLocationCoordinateParameter(locationCode: locationCode,
                                                                                longitude: longitude,
                                                                                latitude: latitude))) { [weak self] result in
            guard let self = self,
                  let longitude = `self`.location?.coordinate.longitude,
                  let latitude = `self`.location?.coordinate.latitude
            else {
                completionHandler(result)
                return
            }
            `self`.locationDetail?.strLongitude = String(longitude)
            `self`.locationDetail?.strLatitude = String(latitude)
            completionHandler(result)
        }
    }

    func update(location: CLLocation?, refresh: Bool = false) {
        self.location = location
    }

    func assetInventoryListViewModel(action: AssetInventoryListViewController) -> AssetInventoryListViewModel! {
        .init(request: AssetInventoryListRequest(), action: action, locationId: locationDetail?.locationId ?? "")
    }

    override func valid(router: APIRouter) throws {
        if case .updateLocationCoordinate(let coordinate) = router {
            guard validator.not(type: .empty(string: coordinate.latitude)),
                  validator.not(type: .empty(string: coordinate.locationCode))
            else {
                throw EAMError.LocationServiceError.coordinateEmpty
            }

            guard validator.not(type: .same(lhs: coordinate.latitude, rhs: self.locationDetail?.strLatitude)),
                  validator.not(type: .same(lhs: coordinate.longitude, rhs: self.locationDetail?.strLongitude))
            else {
                throw EAMError.LocationServiceError.coordinateEmpty
            }
        }
    }

    func photographViewModel(action: PhotographViewController) -> PhotographViewModel! {
        .init(title: "地点照片采集",
              key: "地点编码",
              value: locationDetail?.locationCode ?? "",
              request: PhotographRequest(),
              action: action)
    }
}
