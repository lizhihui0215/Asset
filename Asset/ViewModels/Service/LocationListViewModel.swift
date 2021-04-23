//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

class LocationListViewModel: PageableViewModel<LocationListViewController, DefaultSection<Location>> {
    let regionIdCompany = app.credential?.userOrgId ?? ""

    init(request: RequestRepresentable, action: LocationListViewController) {
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    func fetchList(isPaging: Bool = false, completionHandler: @escaping ViewModelCompletionHandler<Location>)
    {
        self.isPaging = isPaging
        let parameter = LocationListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            regionIdCompany: regionIdCompany
        )

        api(of: LocationListResponse.self,
            router: .locationList(parameter)) { (_: ViewModelResult<[Location]>) in
        }
    }

    func locationViewModelAtIndexPath(indexPath: IndexPath) -> LocationListTableViewCell.ViewModel {
        let location = itemAtIndexPath(indexPath: indexPath)
        return .init(code: location.locationCode, name: location.locationName, isCheck: location.isCheck)
    }
}
