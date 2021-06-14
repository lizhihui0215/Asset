//
//  AssetViewController.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

class AssetTaskInventoryListViewController: BaseTableViewController, TableViewControllerPageable {
    typealias Action = AssetTaskInventoryListViewController
    typealias S = DefaultSection<AssetTask>

    var viewModel: AssetTaskInventoryListViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = AssetTaskInventoryListViewModel(request: AssetTaskInventoryListRequest(), action: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        refreshTable()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as AssetTaskDetailViewController:
            guard let sender = sender as? AssetTaskInventoryListTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: sender.indexPath)
        default: break
        }
    }

    @IBAction func unwindFromAssetSearchCompletion(segue: UIStoryboardSegue) {
        guard let source = segue.source as? AssetTaskSearchViewController else { return }

        refreshTable()
    }
}

extension AssetTaskInventoryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AssetTaskInventoryListTableViewCell = self.tableView(tableView, cellForRowAt: indexPath) else {
            return UITableViewCell()
        }

        let viewModel: AssetTaskInventoryListTableViewCell.ViewData = viewModel.viewData(for: self, with: cell.indexPath)
        cell.configurationCell(with: viewModel)

        return cell
    }
}
