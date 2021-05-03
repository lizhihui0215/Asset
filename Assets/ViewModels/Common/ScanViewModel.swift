//
// Created by lizhihui on 2021/5/2.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class ScanViewModel: BaseViewModel<ScanViewController> {
    public var metadataObject: MetadataObject?

    public var apiErrorAction: UIAlertAction?

    public var apiErrorDismissHandler: (() -> Void)?

    private var tagNumber: String {
        metadataObject?.messageString ?? ""
    }

    private var realLocationCode: String {
        "" // FIXME: where it from
    }

    private var checkPerson: String {
        app.credential?.username ?? ""
    }

    private var realLocationName: String {
        "" // FIXME: where it from
    }

    func fetchAssetDetail(completionHandler: @escaping ViewModelCompletionHandler<AssetDetail?>) {
        let loginParameter = AssetDetailParameter(
            tagNumber: tagNumber,
            realLocationCode: realLocationCode,
            checkPerson: checkPerson,
            realLocationName: realLocationName
        )
        api(of: AssetDetailResponse.self,
            router: .assetDetail(loginParameter)) { result in
            completionHandler(result)
        }
    }

    override func handApiError(router: APIRouter, error: Error) {
        guard case let .assetDetail = router else {
            super.handApiError(router: router, error: error)
            return
        }

        action.alert(title: "否", message: "扫描失败，是否继续扫描", otherAction: apiErrorAction, dismissHandler: apiErrorDismissHandler)
    }
}
