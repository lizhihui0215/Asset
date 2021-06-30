//
//  AssetTaskInventoryListScanViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/6/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskInventoryDetailScanViewModel: ScanViewModel {
    init(request: AssetTaskInventoryDetailScanRequest, action: ScanViewController) {
        super.init(request: request, action: action)
    }

    override func finished() -> ViewModelFuture<SegueIdentifier> {
        ViewModelFuture(value: StoryboardSegue.Common.unwindToAssetTaskInventoryDetail.rawValue)
    }
}
