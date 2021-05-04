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
        locationDetail.locationCode
    }

    private var checkPerson: String {
        app.credential?.username ?? ""
    }

    private var realLocationName: String {
        locationDetail.locationName
    }

    private var locationDetail: LocationDetail

    public var assetDetail: AssetDetail?

    init(request: AssetDetailRequest, action: ScanViewController, locationDetail: LocationDetail) {
        self.locationDetail = locationDetail
        super.init(request: request, action: action)
    }

    func fetchAssetDetail() -> ViewModelFuture<AssetDetail?> {
        let loginParameter = AssetDetailParameter(
            tagNumber: tagNumber,
            realLocationCode: realLocationCode,
            checkPerson: checkPerson,
            realLocationName: realLocationName
        )
        return api(of: AssetDetailResponse.self, router: .assetDetail(loginParameter))
    }

    override func handApiError(router: APIRouter, error: Error) {
        guard case .assetDetail = router else {
            super.handApiError(router: router, error: error)
            return
        }
    }
}
