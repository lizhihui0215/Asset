//
// Created by lizhihui on 2021/4/25.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import CoreLocation
import Foundation

class LocationDetailViewModel: BaseViewModel<LocationDetailViewController> {
    private var assetLocationId: String
    private var locationDetail: LocationDetail?
    private var location: CLLocation?
    private var rgcData: BMKLocationReGeocode?

    public var code: String {
        locationDetail?.locationCode ?? ""
    }

    private var mapLocationDesc: String {
        let encoder = JSONEncoder()
        guard let rgcData = rgcData?.convert(), let data = try? encoder.encode(rgcData) else { return "" }
        return String(data: data, encoding: .utf8) ?? ""
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

    init(request: RequestRepresentable, action: LocationDetailViewController, assetLocationId: String) {
        self.assetLocationId = assetLocationId
        super.init(request: request, action: action)
    }

    func fetchLocationDetail() -> ViewModelFuture<LocationDetail?> {
        let locationDetailParameter = LocationDetailParameter(locationId: assetLocationId)
        return api(of: LocationDetailResponse.self, router: .locationDetailById(locationDetailParameter))
            .onSuccess { locationDetail in
                self.locationDetail = locationDetail
            }
    }

    func updateLocation() -> ViewModelFuture<UpdateLocation?> {
        let updateLocationParameter = UpdateLocationParameter(
            locationId: assetLocationId,
            locationCode: code,
            longitude: longitude,
            latitude: latitude,
            mapLocationDesc: mapLocationDesc
        )
        return api(of: UpdateLocationResponse.self,
                   router: .updateLocation(updateLocationParameter))
            .onSuccess { [weak self] _ in
                guard let self = self,
                      let longitude = `self`.location?.coordinate.longitude,
                      let latitude = `self`.location?.coordinate.latitude
                else {
                    return
                }
                `self`.locationDetail?.strLongitude = String(longitude)
                `self`.locationDetail?.strLatitude = String(latitude)
            }
    }

    func update(location: CLLocation?, rgcData: BMKLocationReGeocode?, refresh: Bool = false) {
        self.location = location
        self.rgcData = rgcData
    }

    func assetInventoryListViewModel(action: AssetInventoryListViewController) -> AssetInventoryListViewModel! {
        .init(request: AssetInventoryListRequest(), action: action, locationDetail: locationDetail!)
    }

    override func valid(router: APIRouter) throws {
        if case .updateLocation(let coordinate) = router {
            guard validator.not(type: .empty(string: coordinate.latitude)),
                  validator.not(type: .empty(string: coordinate.locationCode))
            else {
                throw EAMError.LocationServiceError.coordinateEmpty
            }

            guard validator.not(type: .same(lhs: coordinate.latitude, rhs: locationDetail?.strLatitude)),
                  validator.not(type: .same(lhs: coordinate.longitude, rhs: locationDetail?.strLongitude))
            else {
                throw EAMError.LocationServiceError.coordinateNeedsUpdate
            }
        }
    }

    func photographViewModel(viewState: PhotographViewModel.ViewState, action: PhotographViewController) -> PhotographViewModel! {
        .init(title: "地点照片采集",
              key: "地点编码",
              value: locationDetail?.locationCode ?? "",
              viewState: .prepare,
              request: PhotographRequest(),
              action: action)
    }
}
