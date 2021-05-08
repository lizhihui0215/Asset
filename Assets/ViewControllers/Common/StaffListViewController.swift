//
//  StaffListViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/5/5.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

class StaffListViewController: BaseTableViewController, TableViewControllerPageable {
    typealias Action = StaffListViewController
    typealias S = DefaultSection<Staff>

    var viewModel: StaffListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        searchBar.delegate = self
        refreshTable()
    }

    func refreshTable(isPaging: Bool = false) {
        viewModel.fetchList(isPaging: isPaging).onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.tableView.reloadData()
            `self`.updatePagingInformation()
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as AssetDetailViewController:
            guard let indexPath = (sender as? StaffListTableViewCell)?.indexPath else { break }
            prepareSelectedStaff(for: destination, with: indexPath)
        default: break
        }
    }

    func prepareSelectedStaff(for destination: AssetDetailViewController, with indexPath: IndexPath) {
        switch viewModel.category {
        case .principal:
            destination.viewModel.principal = viewModel.itemAtIndexPath(indexPath: indexPath)
        case .user:
            destination.viewModel.principal = viewModel.itemAtIndexPath(indexPath: indexPath)
        }
    }
}

extension StaffListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // hides the keyboard.
        viewModel.appSearchText = searchBar.eam.text
        refreshTable()
    }
}

extension StaffListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: StaffListTableViewCell = self.tableView(tableView, cellForRowAt: indexPath) else {
            return UITableViewCell()
        }

        let viewModel: StaffListTableViewCell.ViewModel = viewModel.viewModel(for: self, with: cell)

        cell.configurationCell(with: viewModel)

        return cell
    }
}
