//
// Created by lizhihui on 2021/5/5.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class LocationInventoryScanViewModel: ScanViewModel {
    private var tagNumber: String {
        metadataObject?.messageString ?? ""
    }

    private var realLocationCode: String {
        locationDetail.locationCode
    }

    private var checkPerson: String {
        app.credential?.userAccount ?? ""
    }

    private var realLocationName: String {
        locationDetail.locationName
    }

    private var locationDetail: LocationDetail

    public var assetDetail: AssetInventoryListDetail?

    init(request: LocationScanRequest, action: ScanViewController, locationDetail: LocationDetail) {
        self.locationDetail = locationDetail
        super.init(request: request, action: action)
    }

    func fetchAssetDetail() -> ViewModelFuture<AssetInventoryListDetail?> {
        let locationScanParameters = LocationScanParameter(
            tagNumber: tagNumber,
            realLocationCode: realLocationCode,
            checkPerson: checkPerson,
            realLocationName: realLocationName
        )
        return api(of: LocationScanResponse.self, router: .assetDetailByScan(locationScanParameters))
    }

    override func finished() -> ViewModelFuture<SegueIdentifier> {
        fetchAssetDetail().flatMap { [weak self] assetDetail -> ViewModelFuture<String> in
            guard let self = self else { return ViewModelFuture(error: EAMError.weakSelfUnWrapError as Error) }
            `self`.assetDetail = assetDetail
            return ViewModelFuture(value: StoryboardSegue.Common.successToInventory.rawValue)
        }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as AssetDetailViewController:
            guard var assetDetail = assetDetail else { break }
            assetDetail.realLocationName = locationDetail.locationName
            assetDetail.realLocationCode = locationDetail.locationCode
            return AssetInventoryListDetailViewModel(request: AssetInventoryListRequest(),
                                                     action: action,
                                                     viewState: .editing,
                                                     assetDetail: assetDetail) as! T
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }

    // swiftlint:enable force_cast

    override func handApiError(router: APIRouter, error: Error) {
        guard case .assetDetailByInventoryList = router else {
            super.handApiError(router: router, error: error)
            return
        }
    }
}
