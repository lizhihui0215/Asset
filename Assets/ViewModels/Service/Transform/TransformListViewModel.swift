//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

class TransformListViewModel: PageableViewModel<TransformListViewController, DefaultSection<Transform>> {
    var operatorCode: String = app.credential?.userAccount ?? ""
    var appTaskStatus: String = ""
    var appSearchLocation: String = ""
    var appSearchTask: String = ""

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
            operatorCode: operatorCode,
            appTaskStatus: appTaskStatus,
            appSearchLocation: appSearchLocation,
            appSearchTask: appSearchTask
        )

        return pageableApi(of: TransformResponse.self, router: .transformList(parameter))
            .onSuccess { [weak self] transforms in
                guard let first = self?.first else { return }
                guard isPaging else { first.items = transforms; return }
                first.items.append(contentsOf: transforms)
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIViewController, with sender: Any? = nil) -> T {
        switch action {
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as TransformListViewController:
            guard let sender = sender as? TransformListTableViewCell else { break }
            let transform = itemAtIndexPath(indexPath: sender.indexPath)
            return TransformListTableViewCell.ViewData(taskCode: transform.appTaskCode,
                                                       taskStatusName: transform.appTaskStatusName,
                                                       locationCode: transform.locationName,
                                                       locationName: transform.locationCode,
                                                       sum: transform.assetSum,
                                                       finished: transform.assetFinished) as! T
        default: break
        }
        return super.viewData(for: action, with: sender)
    }

    // swiftlint:enable force_cast
}
