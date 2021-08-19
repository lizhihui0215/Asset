//
//  TransformInventoryListScanViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/6/27.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformInventoryDetailRequest: RequestRepresentable {}

struct TransformAssetListScanResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: TransformAssetDetail?
}

class TransformAssetListScanViewModel: ScanViewModel {
    private var appTaskCode: String { transformDetail.appTaskCode }
    private var tagNumber: String { metadataObject?.messageString ?? "" }
    private var checkPerson: String { app.credential?.userAccount ?? "" }
    private var transformDetail: TransformDetail
    private var transformAssetDetail: TransformAssetDetail?

    init(request: TransformInventoryListScanRequest,
         action: ScanViewController,
         transformDetail: TransformDetail)
    {
        self.transformDetail = transformDetail
        super.init(request: request, action: action)
    }

    func fetchTransformInventoryDetail() -> ViewModelFuture<TransformAssetDetail?> {
        let transformAssetListScanParameters = TransformAssetListScanParameter(
            tagNumber: tagNumber,
            appTaskCode: appTaskCode,
            checkPerson: checkPerson
        )
        return api(of: TransformAssetListScanResponse.self, router: .transformAssetDetailByScan(transformAssetListScanParameters))
    }

    override func finished() -> ViewModelFuture<SegueIdentifier> {
        fetchTransformInventoryDetail().flatMap { [weak self] transformAssetDetail -> ViewModelFuture<String> in
            guard let self = self else { return ViewModelFuture(error: .weakSelfUnWrapError) }
            `self`.transformAssetDetail = transformAssetDetail
            return ViewModelFuture(value: StoryboardSegue.Common.successToTransformAssetDetail.rawValue)
        }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as TransformAssetDetailViewController:
            guard let transformAssetDetail = transformAssetDetail else { break }
            return TransformAssetDetailViewModel(request: TransformInventoryDetailRequest(),
                                                 action: action,
                                                 transformAssetDetail: transformAssetDetail) as! T
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
