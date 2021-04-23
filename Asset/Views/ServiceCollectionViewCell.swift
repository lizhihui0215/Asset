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
        enum CellType {
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

        let cellType: CellType
        let name: String
        let image: UIImage?
    }

    var type: ViewModel.CellType = .projectTransfer
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
}

extension ServiceCollectionViewCell: CollectionViewCellConfigurable {
    func configurationCell(with viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        imageView.image = viewModel.image
        type = viewModel.cellType
    }
}
