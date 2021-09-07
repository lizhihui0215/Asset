//
//  AssetInvertoryListViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/4/25.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import MJRefresh
import UIKit

class AssetInventoryListViewController: BaseTableViewController, TableViewControllerPageable {
    typealias Action = AssetInventoryListViewController
    typealias S = DefaultSection<Asset>
    @IBOutlet var inventoryStatusButton: UIButton!

    var viewModel: AssetInventoryListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        refreshTable()
    }

    func refreshTable(isPaging: Bool = false) {
        viewModel.fetchList(isPaging: isPaging).onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.tableView.reloadData()
            `self`.updatePagingInformation()
        }
    }

    @IBAction func scanTapped(_ sender: AnimatableButton) {}

    @IBAction func inventoryButtonTapped(_ sender: UIButton) {}

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination() {
        case let destination as ScanViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        case let destination as AssetDetailViewController:
            guard let cell = sender as? AssetInventoryTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: cell.indexPath)
        case let destination as AssetInventoryListSearchViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: nil)
        default: break
        }
    }

    @IBAction func unwindFromScanSuccess(segue: UIStoryboardSegue) {}

    @IBAction func unwindFromAssetSubmited(segue: UIStoryboardSegue) {}

    @IBAction func unwindToAssetInventoryListViewControllerFromSearch(segue: UIStoryboardSegue) {
        switch segue.source {
        case let source as AssetInventoryListSearchViewController:
            viewModel.appSearchText = source.viewModel.searchText
            viewModel.selectedInventoryStatus = source.viewModel.selectedInventoryStatus
            viewModel.principal = source.viewModel.principal
            viewModel.user = source.viewModel.user
            refreshTable()
        default: break
        }
    }
}

extension AssetInventoryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AssetInventoryTableViewCell = tableView.dequeueReusableCell() else {
            return UITableViewCell()
        }
        let viewModel: AssetInventoryTableViewCell.ViewData = viewModel.viewData(for: self, with: indexPath)
        cell.configurationCell(with: viewModel)
        return cell
    }
}
