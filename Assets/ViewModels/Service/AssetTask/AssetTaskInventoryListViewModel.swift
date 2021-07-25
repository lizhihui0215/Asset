//
//  AssetListViewModel.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskInventoryListViewModel: PageableViewModel<AssetTaskInventoryListViewController, DefaultSection<AssetTaskInventory>>, Searchable {
    var appSearchText: String = ""
    let checkPerson = app.credential?.userAccount ?? ""
    var taskStatus: String = ""
    var checkStatus = ""
    var appCheckStatus: String = ""
    private var assetTaskDetail: AssetTaskDetail
    public var pageNumber: Int { page + 1 }
    private var locationCode: String { assetTaskDetail.locationCode }
    private var checkBillCode: String { assetTaskDetail.checkBillCode }

    init(assetTaskDetail: AssetTaskDetail, request: RequestRepresentable, action: AssetTaskInventoryListViewController) {
        self.assetTaskDetail = assetTaskDetail
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchList(isPaging: Bool = false) -> ViewModelFuture<[AssetTaskInventory]> {
        self.isPaging = isPaging

        let parameter = AssetTaskInventoryListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            appSearchText: appSearchText,
            checkPerson: checkPerson,
            checkBillCode: checkBillCode,
            locationCode: locationCode,
            checkStatus: checkStatus,
            appCheckStatus: appCheckStatus,
            total: String(total)
        )

        return pageableApi(of: AssetTaskInventoryListResponse.self, router: .assetTaskInventoryList(parameter))
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
            return AssetTaskInventoryListScanViewModel(request: AssetTaskInventoryListScanRequest(), action: action, assetTaskDetail: assetTaskDetail) as! T
        case let action as AssetTaskInventoryDetailPhotographViewController:
            guard let indexPath = sender as? IndexPath else { break }
            var assetTaskInventory = itemAtIndexPath(indexPath: indexPath)
            assetTaskInventory.locationCode = assetTaskDetail.locationCode
            assetTaskInventory.locationName = assetTaskDetail.locationCode
            return AssetTaskInventoryDetailPhotographViewModel(request: AssetTaskInventoryDetailPhotographRequest(), action: action, assetTaskInventory: assetTaskInventory) as! T

        default: break
        }

        return super.viewModel(for: action, with: sender)
    }

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as AssetTaskInventoryListViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let assetTask = itemAtIndexPath(indexPath: indexPath)

            return AssetTaskInventoryListTableViewCell.ViewData(assetId: assetTask.assetId,
                                                                tagNumber: assetTask.tagNumber,
                                                                checkStatusName: assetTask.checkStatusName, assetName: assetTask.assetName,
                                                                isCheck: assetTask.isCheck, checkStatus: assetTask.checkStatus, checkBillCode: assetTask.checkBillCode, imageCount: assetTask.imageCount) as! T

        default: break
        }

        return super.viewData(for: action, with: sender)
    }

    // swiftlint:enable force_cast
}
