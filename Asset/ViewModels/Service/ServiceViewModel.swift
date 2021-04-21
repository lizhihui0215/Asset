//
// Created by lizhihui on 2021/4/21.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

final class ServiceViewModel: ListViewModel<ServiceViewController, DefaultSection<ServiceConfiguration.Service>> {
    let serviceConfiguration = ServiceConfiguration()

    init(request: BaseRequest, action: ServiceViewController) {
        var dataSource: [DefaultSection<ServiceConfiguration.Service>] = [.defaultValue]
        dataSource[0].items.append(contentsOf: serviceConfiguration.services)
        super.init(request: request, action: action, dataSource: dataSource)
    }

    func serviceViewModelAt(indexPath: IndexPath) -> ServiceCollectionViewCell.ViewModel {
        let item = itemAtIndexPath(indexPath: indexPath)
        return .init(name: item.title, image: item.image)
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

        var title: String {
            switch self {
            case .projectTransfer: return L10n.projectTransfer
            case .cycleInventory: return L10n.cycleInventory
            case .assetInventory: return L10n.assetInventory
            case .internalDepartmentTransfer: return L10n.internalDepartmentTransfer
            case .externalDepartmentTransfer: return L10n.externalDepartmentTransfer
            case .companyTransfer: return L10n.companyTransfer
            case .assetInspection: return L10n.assetInspection
            case .locationModify: return L10n.locationModify
            case .notification: return L10n.notification
            case .baseData: return L10n.baseData
            }
        }

        var image: UIImage {
            switch self {
            case .projectTransfer: return Image.Service.projectTransfer.image
            case .cycleInventory: return Image.Service.cycleInventory.image
            case .assetInventory: return Image.Service.assetInventory.image
            case .internalDepartmentTransfer: return Image.Service.internalDepartmentTransfer.image
            case .externalDepartmentTransfer: return Image.Service.externalDepartmentTransfer.image
            case .companyTransfer: return Image.Service.companyTransfer.image
            case .assetInspection: return Image.Service.assetInspection.image
            case .locationModify: return Image.Service.locationModify.image
            case .notification: return Image.Service.notification.image
            case .baseData: return Image.Service.baseData.image
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
