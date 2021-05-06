//
// Created by lizhihui on 2021/5/5.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetDetailScanViewModel: ScanViewModel {
    override func finished() -> ViewModelFuture<SegueIdentifier> {
        guard metadataObject != nil else {
            return ViewModelFuture(error: EAMError.unwrapOptionalValueError("MetadataObject") as Error)
        }
        return ViewModelFuture(value: StoryboardSegue.Common.successToInventory.rawValue)
    }
}
