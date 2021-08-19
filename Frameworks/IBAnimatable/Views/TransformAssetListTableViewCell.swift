//
// Created by lizhihui on 2021/7/26.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

extension TransformAssetListTableViewCell: ReuseIdRepresentable {}
extension TransformAssetListTableViewCell: TableViewCellConfigurable {
    func configurationCell(with viewData: ViewData) {
        self.viewData = viewData
        self.tagNumberLabel.text = viewData.tagNumber
        self.assetNameLabel.text = viewData.assetName
        self.confirmDescriptionLabel.text = viewData.confirmDesc
        // FIXME: which filed should be
        // self.photographStatusLabel.text = ??
    }

    struct ViewData: CellDataRepresentable {
        let billLineId: String
        let tagNumber: String
        let assetName: String
        let matchedFlag: String
        let matchedDesc: String
        let confirmFlag: String
        let confirmDesc: String
    }
}

class TransformAssetListTableViewCell: BaseTableViewCell {
    @IBOutlet weak var tagNumberLabel: UILabel!
    @IBOutlet weak var assetNameLabel: UILabel!
    @IBOutlet weak var confirmDescriptionLabel: UILabel!
    @IBOutlet weak var photographStatusLabel: UILabel!
    var viewData: ViewData!
}
