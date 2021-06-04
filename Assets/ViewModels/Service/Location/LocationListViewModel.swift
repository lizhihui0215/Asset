//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

class LocationListViewModel: PageableViewModel<LocationListViewController, DefaultSection<Location>>, Searchable {
    var appSearchText: String = ""
    let regionIdCompany = app.credential?.userCityId ?? ""

    public var pageNumber: Int {
        page + 1
    }

    init(request: RequestRepresentable, action: LocationListViewController) {
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchList(isPaging: Bool = false) -> ViewModelFuture<[Location]> {
        self.isPaging = isPaging
        let parameter = LocationListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            regionIdCompany: regionIdCompany,
            appSearchText: appSearchText
        )

        return pageableApi(of: LocationListResponse.self, router: .locationList(parameter))
            .onSuccess { [weak self] locations in
                guard let first = self?.first else { return }
                guard isPaging else { first.items = locations; return }
                first.items.append(contentsOf: locations)
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIViewController, with sender: Any? = nil) -> T {
        switch action {
        case let action as LocationDetailViewController:
            guard let sender = sender as? LocationListTableViewCell else { break }
            let assetLocationId = itemAtIndexPath(indexPath: sender.indexPath).assetLocationId
            return LocationDetailViewModel(request: LocationDetailRequest(),
                                           action: action,
                                           assetLocationId: assetLocationId) as! T

        default: break
        }
        return super.viewModel(for: action, with: sender)
    }

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as LocationListViewController:
            guard let sender = sender as? LocationListTableViewCell else { break }
            let location = itemAtIndexPath(indexPath: sender.indexPath)
            return LocationListTableViewCell.ViewData(code: location.locationCode,
                                                      name: location.locationName,
                                                      isCheck: location.isCheck) as! T
        default: break
        }
        return super.viewData(for: action, with: sender)
    }

    // swiftlint:enable force_cast

    func locationDetailViewModelAtIndexPath(action: LocationDetailViewController, indexPath: IndexPath) -> LocationDetailViewModel {
        let location = itemAtIndexPath(indexPath: indexPath)
        return .init(request: LocationDetailRequest(),
                     action: action,
                     assetLocationId: location.assetLocationId)
    }
}
