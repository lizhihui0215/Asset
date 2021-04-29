//
//  ServiceCollectionViewCell.swift
//  Asset
//
//  Created by lizhihui on 2021/4/21.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

extension ServiceCollectionViewCell: ReuseIdRepresentable {}

class ServiceCollectionViewCell: BaseCollectionViewCell {
    struct ViewModel: ViewModelRepresentable {
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
        }

        let service: Service
        let name: String
        let image: UIImage?
    }

    var service: ViewModel.Service = .projectTransfer
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
}

extension ServiceCollectionViewCell: CollectionViewCellConfigurable {
    func configurationCell(with viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        imageView.image = viewModel.image
        service = viewModel.service
    }
}

extension ServiceCollectionViewCell.ViewModel.Service {
    var isInDevelopment: Bool {
        switch self {
        case .projectTransfer: return true
        case .cycleInventory: return false
        case .assetInventory: return false
        case .internalDepartmentTransfer: return true
        case .externalDepartmentTransfer: return true
        case .companyTransfer: return true
        case .assetInspection: return true
        case .locationModify: return true
        case .notification: return true
        case .baseData: return true
        }
    }
}
