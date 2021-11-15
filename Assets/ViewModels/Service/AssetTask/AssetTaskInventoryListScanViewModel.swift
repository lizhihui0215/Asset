//
//  AssetTaskInventoryListScanViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/6/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskInventoryListScanViewModel: ScanViewModel {
    private var realLocationCode: String { assetTaskDetail.locationCode }
    private var checkBillCode: String { assetTaskDetail.checkBillCode }
    private var realLocationName: String { assetTaskDetail.locationCode }
    private var tagNumber: String { metadataObject?.messageString ?? "" }
    private var checkPerson: String { app.credential?.userAccount ?? "" }
    private var longitude: String { DefaultCoordinateFormatter.format(assetTaskDetail.longitude) }
    private var latitude: String { DefaultCoordinateFormatter.format(assetTaskDetail.latitude) }
    private var assetTaskDetail: AssetTaskDetail
    private var assetTaskInventoryDetail: AssetTaskInventoryDetail?

    init(request: AssetTaskInventoryListScanRequest, action: ScanViewController, assetTaskDetail: AssetTaskDetail) {
        self.assetTaskDetail = assetTaskDetail
        super.init(request: request, action: action)
    }

    func fetchAssetTaskInventoryDetail() -> ViewModelFuture<AssetTaskInventoryDetail?> {
        let assetInventoryListScanParameters = AssetTaskInventoryListScanParameter(
            realLocationCode: realLocationCode,
            checkBillCode: checkBillCode,
            checkPerson: checkPerson,
            realLocationName: realLocationName,
            tagNumber: tagNumber,
            longitude: longitude,
            latitude: latitude
        )
        return api(of: AssetTaskInventoryListScanResponse.self, router: .assetTaskInventoryDetailByScan(assetInventoryListScanParameters))
    }

    override func finished() -> ViewModelFuture<SegueIdentifier> {
        fetchAssetTaskInventoryDetail().flatMap { [weak self] assetTaskInventoryDetail -> ViewModelFuture<String> in
            guard let self = self else { return ViewModelFuture(error: .weakSelfUnWrapError) }
            `self`.assetTaskInventoryDetail = assetTaskInventoryDetail
            return ViewModelFuture(value: StoryboardSegue.Common.successToAssetTaskInventoryDetail.rawValue)
        }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as AssetTaskInventoryDetailViewController:
            guard let assetTaskInventoryDetail = assetTaskInventoryDetail else { break }
            return AssetTaskInventoryDetailViewModel(request: AssetTaskInventoryDetailRequest(),
                                                     action: action, assetTaskInventoryDetail: assetTaskInventoryDetail) as! T
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
