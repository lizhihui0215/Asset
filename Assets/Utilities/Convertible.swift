//
// Created by ZhiHui.Li on 2021/4/18.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import BrightFutures
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
        let poiRegion = poiRegion == nil ? nil : poiRegion.convert()
        let district = district ?? nil
        let town = town ?? nil
        let street = street ?? nil
        let streetNumber = streetNumber ?? nil
        let locationDescribe = locationDescribe ?? nil

        return LocationReGeocode(
            countryCode: countryCode,
            province: province,
            city: city,
            district: district,
            town: town,
            street: street,
            streetNumber: streetNumber,
            cityCode: cityCode ?? "",
            adCode: adCode ?? "",
            locationDescribe: locationDescribe ?? "",
            country: country ?? "",
            poiRegion: poiRegion
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

extension WwPrintResult: Convertible {
    func convert() -> EAMError.PrintServiceError {
        guard self != .wwPrintSuccess else {
            fatalError("wwPrintSuccess could not convert to EAMError.PrintServiceError")
        }

        guard let error = EAMError.PrintServiceError(printResult: self) else {
            fatalError("WwPrintResult error could not convert to EAMError.PrintServiceError")
        }

        return error
    }
}
