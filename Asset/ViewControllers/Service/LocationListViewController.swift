//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import MJRefresh
import UIKit

class LocationListViewController: BaseTableViewController {
    @IBOutlet var pagingInformationLabel: UILabel!

    lazy var viewModel: LocationListViewModel = {
        LocationListViewModel(request: LocationListRequest(), action: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        refreshTable()
    }

    func refreshTable(isPaging: Bool = false) {
        viewModel.fetchList(isPaging: isPaging) { [weak self] _ in
            guard let self = self else { return }
            `self`.tableView.reloadData()
        }
    }

    func updatePagingInformation() {
        pagingInformationLabel.text = "第\(viewModel.page)共有任务\(viewModel.total)条"
    }
}

extension LocationListViewController: TableViewHeaderRefreshing {
    func header(_ header: MJRefreshNormalHeader, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void) {
        refreshTable()
        completionBlock()
    }

    func footer(_ header: MJRefreshBackNormalFooter, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void) {
        refreshTable(isPaging: true)
        completionBlock()
    }
}

extension LocationListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: LocationListTableViewCell = tableView.dequeueReusableCell() else {
            return UITableViewCell()
        }

        let viewModel = self.viewModel.locationViewModelAtIndexPath(indexPath: indexPath)

        cell.configurationCell(with: viewModel)

        return cell
    }
}
