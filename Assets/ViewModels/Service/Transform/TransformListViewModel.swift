//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

class TransformListViewModel: PageableViewModel<TransformListViewController, DefaultSection<Transform>> {
    var operatorCode: String = app.credential?.userAccount ?? ""
    var appTaskStatus: Int = 1
    var appSearchLocation: String = ""
    var appSearchTask: Int = 1

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
//        switch action {
//        case let action as LocationDetailViewController:
//            guard let sender = sender as? LocationListTableViewCell else { break }
//            let assetLocationId = itemAtIndexPath(indexPath: sender.indexPath).assetLocationId
//            return LocationDetailViewModel(request: LocationDetailRequest(),
//                                           action: action,
//                                           assetLocationId: assetLocationId) as! T
//        case _ as LocationListViewController:
//            guard let sender = sender as? LocationListTableViewCell else { break }
//            let location = itemAtIndexPath(indexPath: sender.indexPath)
//            return LocationListTableViewCell.ViewModel(code: location.locationCode,
//                                                       name: location.locationName,
//                                                       isCheck: location.isCheck) as! T
//        default: break
//        }
        super.viewModel(for: action, with: sender)
    }

    // swiftlint:enable force_cast
}
