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

        return api(of: LocationListResponse.self, router: .locationList(parameter))
            .onSuccess { [weak self] locations in
                guard var first = self?.first else { return }
                first.append(contentsOf: locations)
            }
    }

    func locationViewModelAtIndexPath(indexPath: IndexPath) -> LocationListTableViewCell.ViewModel {
        let location = itemAtIndexPath(indexPath: indexPath)
        return .init(
            code: location.locationCode,
            name: location.locationName,
            isCheck: location.isCheck,
            indexPath: indexPath
        )
    }

    func locationDetailViewModelAtIndexPath(action: LocationDetailViewController, indexPath: IndexPath) -> LocationDetailViewModel {
        let location = itemAtIndexPath(indexPath: indexPath)
        return .init(request: LocationDetailRequest(),
                     action: action,
                     assetLocationId: location.assetLocationId)
    }
}
