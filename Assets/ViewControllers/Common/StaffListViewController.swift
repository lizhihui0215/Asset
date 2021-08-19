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
        guard let indexPath = sender as? IndexPath else { return }

        switch segue.destination {
        case let destination as AssetDetailViewController:
            prepareSelectedStaff(for: destination.viewModel, with: indexPath)
        case let destination as AssetTaskInventoryDetailViewController:
            prepareSelectedStaff(for: destination.viewModel, with: indexPath)
        case let destination as TransformDetailViewController:
            prepareSelectedStaff(for: destination.viewModel, with: indexPath)
        default: break
        }
    }

    func prepareSelectedStaff(for destination: StaffSelectable, with indexPath: IndexPath) {
        var destination = destination
        switch viewModel.category {
        case .principal:
            destination.principal = viewModel.itemAtIndexPath(indexPath: indexPath)
        case .user:
            destination.user = viewModel.itemAtIndexPath(indexPath: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        perform(segue: viewModel.segue, sender: indexPath)
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

        let viewModel: StaffListTableViewCell.ViewData = viewModel.viewData(for: self, with: cell)

        cell.configurationCell(with: viewModel)

        return cell
    }
}
