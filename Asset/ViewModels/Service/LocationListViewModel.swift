//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

class LocationListViewModel: PageableViewModel<LocationListViewController, DefaultSection<Location>>, Searchable {
    var appSearchText: String = ""
    let regionIdCompany = app.credential?.userCityId ?? ""

    init(request: RequestRepresentable, action: LocationListViewController) {
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    func fetchList(isPaging: Bool = false, completionHandler: @escaping ViewModelCompletionHandler<[Location]>)
    {
        self.isPaging = isPaging
        let parameter = LocationListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            regionIdCompany: regionIdCompany,
            appSearchText: appSearchText
        )

        api(of: LocationListResponse.self,
            router: .locationList(parameter)) { [weak self] (result: ViewModelResult<[Location]>) in
            guard var first = self?.first, let locations = try? result.get() else { return }
            first.append(contentsOf: locations)
            completionHandler(.success(locations))
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
                     locationId: location.locationCode)
    }
}
