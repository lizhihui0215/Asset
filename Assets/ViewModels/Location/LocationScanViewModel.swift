//
// Created by lizhihui on 2021/5/5.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class LocationScanViewModel: ScanViewModel {
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
        let assetDetailParameter = AssetDetailParameter(
            tagNumber: tagNumber,
            realLocationCode: realLocationCode,
            checkPerson: checkPerson,
            realLocationName: realLocationName
        )
        return api(of: AssetDetailResponse.self, router: .assetDetail(assetDetailParameter))
    }

    override func finished() -> ViewModelFuture<SegueIdentifier> {
        `self`.fetchAssetDetail().flatMap { [weak self] assetDetail -> ViewModelFuture<String> in
            guard let self = self else { return ViewModelFuture(error: EAMError.weakSelfUnWrapError as Error) }
            `self`.assetDetail = assetDetail
            return ViewModelFuture(value: StoryboardSegue.Common.successToInventory.rawValue)
        }
    }

    override func handApiError(router: APIRouter, error: Error) {
        guard case .assetDetail = router else {
            super.handApiError(router: router, error: error)
            return
        }
    }
}
