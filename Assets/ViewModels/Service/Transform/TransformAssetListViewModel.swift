//
//  AssetListViewModel.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformAssetListParameter: Encodable {
    let pageNumber: String
    let pageSize: String
    let appSearchText: String
    let checkPerson: String
    let appTaskCode: String
    let confirmFlag: String
    let total: String
}

struct TransformAssetListResponse: PageableResponse {
    var total: Int = 0
    var records: Int = 0
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var page: Int = 0
    var data: [TransformAsset] = []
}

struct TransformInventoryDetailPhotographRequest: RequestRepresentable {}

class TransformAssetListViewModel: PageableViewModel<TransformAssetListViewController, DefaultSection<TransformAsset>>, Searchable {
    var appSearchText: String = ""
    let checkPerson = app.credential?.userAccount ?? ""
    var taskStatus: String = ""
    var checkStatus = ""
    var appCheckStatus: String = ""
    private var transformDetail: TransformDetail
    public var pageNumber: Int { page + 1 }
    public var confirmFlag: String = ""
    private var appTaskCode: String { transformDetail.appTaskCode }

    init(assetTaskDetail: TransformDetail, request: RequestRepresentable, action: TransformAssetListViewController) {
        transformDetail = assetTaskDetail
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchList(isPaging: Bool = false) -> ViewModelFuture<[TransformAsset]> {
        self.isPaging = isPaging

        let parameter = TransformAssetListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            appSearchText: appSearchText,
            checkPerson: checkPerson,
            appTaskCode: appTaskCode,
            confirmFlag: confirmFlag,
            total: String(total)
        )

        return pageableApi(of: TransformAssetListResponse.self, router: .transformAssetList(parameter))
            .onSuccess { [weak self] assetTaskInventories in
                guard let first = self?.first else { return }
                guard isPaging else { first.items = assetTaskInventories; return }
                first.items.append(contentsOf: assetTaskInventories)
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as ScanViewController:
            return TransformAssetListScanViewModel(request: TransformInventoryListScanRequest(), action: action, transformDetail: transformDetail) as! T
        case let action as TransformAssetDetailPhotographViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let transformAsset = itemAtIndexPath(indexPath: indexPath)
            return TransformAssetDetailPhotographViewModel(request: TransformInventoryDetailPhotographRequest(),
                                                           action: action, transformAsset: transformAsset) as! T
        case let action as TransformAssetListSearchViewController:
            return TransformAssetListSearchViewModel(request: TransformAssetListSearchRequest(), action: action) as! T

        default: break
        }

        return super.viewModel(for: action, with: sender)
    }

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as TransformAssetListViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let transformAsset = itemAtIndexPath(indexPath: indexPath)

            return TransformAssetListTableViewCell.ViewData(billLineId: transformAsset.billLineId,
                                                            tagNumber: transformAsset.tagNumber,
                                                            assetName: transformAsset.assetName,
                                                            matchedFlag: transformAsset.matchedFlag,
                                                            matchedDesc: transformAsset.matchedDesc,
                                                            confirmFlag: transformAsset.confirmFlag,
                                                            confirmDesc: transformAsset.confirmDesc) as! T

        default: break
        }

        return super.viewData(for: action, with: sender)
    }

    // swiftlint:enable force_cast
}
