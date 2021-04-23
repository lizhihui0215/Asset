//
// Created by ZhiHui.Li on 2021/4/18.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol Convertible {
    associatedtype T
    func convert() -> T
}

extension ServiceConfiguration.Service: Convertible {}

extension Convertible where Self == ServiceConfiguration.Service {
    func convert() -> ServiceCollectionViewCell.ViewModel.CellType {
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
