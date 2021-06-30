//
//  AssetListViewModel.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskListViewModel: PageableViewModel<AssetTaskListViewController, DefaultSection<AssetTask>>, Searchable {
    var appSearchText: String = ""
    let checkPerson = app.credential?.userAccount ?? ""
    var taskStatus: String = ""

    public var pageNumber: Int {
        page + 1
    }

    init(request: RequestRepresentable, action: AssetTaskListViewController) {
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchList(isPaging: Bool = false) -> ViewModelFuture<[AssetTask]> {
        self.isPaging = isPaging
        let parameter = AssetTaskListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            appSearchText: appSearchText,
            checkPerson: checkPerson,
            taskStatus: taskStatus,
            total: String(total)
        )

        return pageableApi(of: AssetTaskListResponse.self, router: .assetTaskList(parameter))
            .onSuccess { [weak self] locations in
                guard let first = self?.first else { return }
                guard isPaging else { first.items = locations; return }
                first.items.append(contentsOf: locations)
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as AssetTaskDetailViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let asset = itemAtIndexPath(indexPath: indexPath)
            return AssetTaskDetailViewModel(request: AssetTaskDetailRequest(),
                                            action: action, checkBillCode: asset.checkBillCode, taskNumber: asset.taskNumber) as! T
        default: break
        }

        return super.viewModel(for: action, with: sender)
    }

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as AssetTaskListViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let assetTask = itemAtIndexPath(indexPath: indexPath)

            return AssetTaskListTableViewCell.ViewData(isCheck: assetTask.isCheck,
                                                       checkBillCode: assetTask.checkBillCode,
                                                       taskNumber: assetTask.taskNumber,
                                                       taskStatusName: assetTask.taskStatusName,
                                                       taskName: assetTask.taskName) as! T

        default: break
        }

        return super.viewData(for: action, with: sender)
    }

    // swiftlint:enable force_cast
}
