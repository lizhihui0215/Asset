//
// Created by lizhihui on 2021/5/6.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension AssetTaskInventoryListTableViewCell: ReuseIdRepresentable {}

class AssetTaskInventoryListTableViewCell: BaseTableViewCell {
    struct ViewData: CellDataRepresentable {
        var assetId: String
        var tagNumber: String
        var checkStatusName: String
        var assetName: String
        var isCheck: Bool
        var checkStatus: String
        var checkBillCode: String
        var imageCount: Int

        var imageCountText: String {
            imageCountText(for: imageCount)
        }

        func imageCountText(for imageCount: Int) -> String {
            guard imageCount != 0 else { return "未拍照" }
            return "\(imageCount)张"
        }
    }

    @IBOutlet var checkStatusNameLabel: UILabel!
    @IBOutlet var imageCountLabel: UILabel!
    @IBOutlet var targetNumberLabel: UILabel!
    @IBOutlet var assetNameLabel: UILabel!
}

extension AssetTaskInventoryListTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewData: ViewData) {
        checkStatusNameLabel.text = viewData.checkStatusName
        imageCountLabel.text = viewData.imageCountText
        targetNumberLabel.text = viewData.tagNumber
        assetNameLabel.text = viewData.assetName
    }
}
