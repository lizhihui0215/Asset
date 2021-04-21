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
    struct ViewModel {
        let name: String
        let image: UIImage?
    }

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!

    func configurationCell(with viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        imageView.image = viewModel.image
    }
}
