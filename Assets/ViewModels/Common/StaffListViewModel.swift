//
// Created by lizhihui on 2021/5/5.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

class StaffListViewModel: PageableViewModel<StaffListViewController, DefaultSection<Staff>>, Searchable {
    var appSearchText: String = ""
    var category: Staff.Category
    let regionIdCompany = app.credential?.userCityId ?? ""

    public var pageNumber: Int {
        page + 1
    }

    init(request: RequestRepresentable, action: StaffListViewController, category: Staff.Category) {
        self.category = category
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchList(isPaging: Bool = false) -> ViewModelFuture<[Staff]> {
        self.isPaging = isPaging
        let parameter = StaffListParameter(pageNumber: String(page),
                                           pageSize: String(size),
                                           regionIdCompany: regionIdCompany,
                                           appSearchText: appSearchText,
                                           category: category)

        return pageableApi(of: StaffListResponse.self, router: .staffList(parameter))
            .onSuccess { [weak self] staffs in
                guard let first = self?.first, let self = self else { return }

                let staffs: [Staff] = staffs.map {
                    var staff = $0
                    staff.category = `self`.category
                    return staff
                }

                guard isPaging else { first.items = staffs; return }
                first.items.append(contentsOf: staffs)
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }

    // swiftlint:enable force_cast

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as StaffListViewController:
            guard let sender = sender as? StaffListTableViewCell else { break }
            let staff = itemAtIndexPath(indexPath: sender.indexPath)
            return StaffListTableViewCell.ViewData(isCheck: staff.isCheck,
                                                   account: staff.account,
                                                   name: staff.userName,
                                                   code: staff.userCode,
                                                   organization: staff.userOrgName) as! T
        default: break
        }

        return super.viewData(for: action, with: sender)
    }
}
