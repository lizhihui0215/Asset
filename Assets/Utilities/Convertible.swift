//
// Created by ZhiHui.Li on 2021/4/18.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol Convertible {
    associatedtype T
    func convert() -> T
}

extension ServiceConfiguration.Service: Convertible {
    func convert() -> ServiceCollectionViewCell.ViewModel.Service {
        switch self {
        case .projectTransfer: return .projectTransfer
        case .cycleInventory: return .cycleInventory
        case .assetInventory: return .assetInventory
        case .internalDepartmentTransfer: return .internalDepartmentTransfer
        case .externalDepartmentTransfer: return .externalDepartmentTransfer
        case .companyTransfer: return .companyTransfer
        case .assetInspection: return .assetInspection
        case .locationModify: return .locationModify
        case .notification: return .notification
        case .baseData: return .baseData
        }
    }
}

extension BMKLocationReGeocode: Convertible {
    func convert() -> LocationReGeocode {
        LocationReGeocode(
            countryCode: countryCode,
            province: province,
            city: city,
            district: district,
            town: town,
            street: street,
            streetNumber: streetNumber,
            cityCode: cityCode,
            adCode: adCode,
            locationDescribe: locationDescribe,
            country: country,
            poiRegion: poiRegion.convert()
        )
    }
}

extension BMKLocationPoiRegion: Convertible {
    func convert() -> LocationPoiRegion {
        LocationPoiRegion(
            directionDesc: directionDesc,
            name: name,
            tags: tags
        )
    }
}
