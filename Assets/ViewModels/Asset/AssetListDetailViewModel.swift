//
// Created by lizhihui on 2021/5/9.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetListDetailViewModel: AssetDetailViewModel {
    override func fetchAssetDetail() -> ViewModelFuture<AssetDetailed?> {
        api(of: AssetListDetailResponse.self, router: .assetDetailByAssetList(parameters)).flatMap {
            ViewModelFuture(value: $0)
        }.onSuccess { [weak self] assetDetail in
            guard let self = self else { return }
            `self`.handleAssetDetailResult(assetDetail: assetDetail)
        }
    }
}

extension AssetListDetail: AssetDetailed {
    var resourceNumber: String {
        get { "" }
        set {}
    }

    var dutyPerson: String {
        get { "" }
        set {}
    }

    var usePerson: String {
        get { "" }
        set {}
    }

    var usePersonName: String {
        get { "" }
        set {}
    }

    var principalCode: String {
        dutyPersonCode
    }

    var userAccount: String {
        usedPersonAccount
    }

    var locationCode: String {
        ""
    }

    var locationName: String {
        ""
    }

    var realLocationCode: String {
        assetLocationCode
    }

    var realLocationName: String {
        assetLocationName
    }

    var longitude: String {
        ""
    }

    var latitude: String {
        ""
    }

    var checkStatus: String {
        ""
    }

    var checkStatusName: String {
        ""
    }

    var assetCheckItemName: String {
        ""
    }
}
