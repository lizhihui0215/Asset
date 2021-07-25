//
//  AssetViewController.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

class AssetTaskListViewController: BaseTableViewController, TableViewControllerPageable {
    typealias Action = AssetTaskListViewController
    typealias S = DefaultSection<AssetTask>

    var viewModel: AssetTaskListViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = AssetTaskListViewModel(request: AssetTaskListRequest(), action: self)
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
            guard let sender = sender as? AssetTaskListTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: sender.indexPath)
        case let destination as AssetTaskSearchViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: nil)
        default: break
        }
    }

    @IBAction func unwindFromAssetSearchCompletion(segue: UIStoryboardSegue) {
        guard let assetTaskSearchViewController = segue.source as? AssetTaskSearchViewController else { return }
        viewModel.taskStatus = assetTaskSearchViewController.viewModel.selectedTaskStatus?.status ?? ""
        viewModel.appSearchText = assetTaskSearchViewController.locationTextField.text ?? ""

        refreshTable()
    }
}

extension AssetTaskListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AssetTaskListTableViewCell = self.tableView(tableView, cellForRowAt: indexPath) else {
            return UITableViewCell()
        }

        let viewModel: AssetTaskListTableViewCell.ViewData = viewModel.viewData(for: self, with: cell.indexPath)
        cell.configurationCell(with: viewModel)

        return cell
    }
}
