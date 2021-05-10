//
// Created by lizhihui on 2021/5/9.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetInventoryListDetailViewModel: AssetDetailViewModel {
    override func fetchAssetDetail() -> ViewModelFuture<AssetDetailed?> {
        api(of: AssetInventoryListDetailResponse.self, router: .assetDetailByInventoryList(parameters)).flatMap {
            ViewModelFuture(value: $0)
        }.onSuccess { [weak self] assetDetail in
            guard let self = self else { return }
            `self`.handleAssetDetailResult(assetDetail: assetDetail)
        }
    }
}

extension AssetInventoryListDetail: AssetDetailed {
    var principalCode: String {
        ""
    }

    var userAccount: String {
        ""
    }
}
