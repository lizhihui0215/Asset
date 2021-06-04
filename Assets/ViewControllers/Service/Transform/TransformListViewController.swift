//
// Created by Bernard on 2021/6/3.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class TransformListViewController: BaseTableViewController, TableViewControllerPageable {
    var viewModel: LocationListViewModel!
    typealias Action = LocationListViewController
    typealias S = DefaultSection<Location>

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        refreshTable()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination() {
        case let destination as LocationDetailViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        default: break
        }
    }
}

extension TransformListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: LocationListTableViewCell = self.tableView(tableView, cellForRowAt: indexPath) else {
            return UITableViewCell()
        }

        let viewModel: LocationListTableViewCell.ViewData = viewModel.viewData(for: self, with: cell)

        cell.configurationCell(with: viewModel)

        return cell
    }
}
