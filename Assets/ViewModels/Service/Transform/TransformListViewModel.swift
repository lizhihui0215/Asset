//
//  AssetListViewModel.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformListResponse: PageableResponse {
    var total: Int = 0
    var records: Int = 0
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var page: Int = 0
    var data: [Transform] = []
}

class TransformListViewModel: PageableViewModel<TransformListViewController, DefaultSection<Transform>> {
    var location: String = ""
    var taskCode: String = ""
    let checkPerson = app.credential?.userAccount ?? ""
    var taskStatus: String = ""

    public var pageNumber: Int {
        page + 1
    }

    init(request: RequestRepresentable, action: TransformListViewController) {
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchList(isPaging: Bool = false) -> ViewModelFuture<[Transform]> {
        self.isPaging = isPaging
        let parameter = TransformListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            operatorCode: checkPerson,
            appTaskStatus: taskStatus,
            appSearchLocation: location,
            appSearchTask: taskCode
        )

        return pageableApi(of: TransformListResponse.self, router: .transformList(parameter))
            .onSuccess { [weak self] locations in
                guard let first = self?.first else { return }
                guard isPaging else { first.items = locations; return }
                first.items.append(contentsOf: locations)
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as TransformDetailViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let transform = itemAtIndexPath(indexPath: indexPath)
            return TransformDetailViewModel(request: TransformDetailRequest(), action: action, transform: transform) as! T
        case let action as TransformSearchViewController:
            return TransformSearchViewModel(request: TransformSearchRequest(),
                                            action: action) as! T
        default: break
        }

        return super.viewModel(for: action, with: sender)
    }

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as TransformListViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let assetTask = itemAtIndexPath(indexPath: indexPath)

            return TransformListTableViewCell.ViewData(taskCode: assetTask.appTaskCode,
                                                       taskStatusName: assetTask.appTaskStatusName, locationCode: assetTask.locationCode, locationName: assetTask.locationName, sum: assetTask.assetSum, finished: assetTask.assetFinished) as! T

        default: break
        }

        return super.viewData(for: action, with: sender)
    }

    // swiftlint:enable force_cast
}
