//
// Created by lizhihui on 2021/4/21.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

final class ServiceViewModel: ListViewModel<ServiceViewController, DefaultSection<ServiceConfiguration.Service>> {
    let serviceConfiguration = ServiceConfiguration()

    init(request: RequestRepresentable, action: ServiceViewController) {
        let dataSource: [DefaultSection<ServiceConfiguration.Service>] = [.defaultValue]
        dataSource[0].items.append(contentsOf: serviceConfiguration.services)
        super.init(request: request, action: action, dataSource: dataSource)
    }

    func serviceViewModelAt(indexPath: IndexPath) -> ServiceCollectionViewCell.ViewModel {
        let item = itemAtIndexPath(indexPath: indexPath)
        return .init(service: item.convert(), name: item.name, image: item.image)
    }
}

struct ServiceConfiguration {
    enum Service {
        case projectTransfer
        case cycleInventory
        case assetInventory
        case internalDepartmentTransfer
        case externalDepartmentTransfer
        case companyTransfer
        case assetInspection
        case locationModify
        case notification
        case baseData

        var name: String {
            switch self {
            case .projectTransfer: return L10n.service.name.projectTransfer
            case .cycleInventory: return L10n.service.name.cycleInventory
            case .assetInventory: return L10n.service.name.assetInventory
            case .internalDepartmentTransfer: return L10n.service.name.internalDepartmentTransfer
            case .externalDepartmentTransfer: return L10n.service.name.externalDepartmentTransfer
            case .companyTransfer: return L10n.service.name.companyTransfer
            case .assetInspection: return L10n.service.name.assetInspection
            case .locationModify: return L10n.service.name.locationModify
            case .notification: return L10n.service.name.notification
            case .baseData: return L10n.service.name.baseData
            }
        }

        var image: UIImage {
            switch self {
            case .projectTransfer: return XCImage.Service.projectTransfer.image
            case .cycleInventory: return XCImage.Service.cycleInventory.image
            case .assetInventory: return XCImage.Service.assetInventory.image
            case .internalDepartmentTransfer: return XCImage.Service.internalDepartmentTransfer.image
            case .externalDepartmentTransfer: return XCImage.Service.externalDepartmentTransfer.image
            case .companyTransfer: return XCImage.Service.companyTransfer.image
            case .assetInspection: return XCImage.Service.assetInspection.image
            case .locationModify: return XCImage.Service.locationModify.image
            case .notification: return XCImage.Service.notification.image
            case .baseData: return XCImage.Service.baseData.image
            }
        }
    }

    let services: [Service] = [
        .projectTransfer,
        .cycleInventory,
        .assetInspection,
        .internalDepartmentTransfer,
        .externalDepartmentTransfer,
        .companyTransfer,
        .assetInspection,
        .locationModify,
        .notification,
        .baseData,
    ]
}

extension ServiceConfiguration.Service: Item {}