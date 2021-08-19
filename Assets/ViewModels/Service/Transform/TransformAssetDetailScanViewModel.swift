//
//  TransformInventoryListScanViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/6/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class TransformInventoryDetailScanViewModel: ScanViewModel {
    init(request: TransformInventoryDetailScanRequest, action: ScanViewController) {
        super.init(request: request, action: action)
    }

    override func finished() -> ViewModelFuture<SegueIdentifier> {
        fatalError("not implementd")
//        ViewModelFuture(value: StoryboardSegue.Common.unwindToTransformInventoryDetail.rawValue)
    }
}
