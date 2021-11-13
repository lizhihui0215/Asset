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
    typealias S = DefaultSection<AssetTaskInventory>

    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var latitudeLabel: UILabel!

    var viewModel: AssetTaskInventoryListViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        refreshTable()
        longitudeLabel.text = viewModel.longitude
        latitudeLabel.text = viewModel.latitude
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as AssetTaskDetailViewController:
            guard let sender = sender as? AssetTaskInventoryListTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: sender.indexPath)
        case let destination as ScanViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        case let destination as AssetTaskInventoryDetailPhotographViewController:
            guard let sender = sender as? AssetTaskInventoryListTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: sender.indexPath)
        case let destination as AssetTaskInventoryListSearchViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: nil)
        default: break
        }
    }

    @IBAction func scanTapped(_ sender: UIButton) {}

    @IBAction func unwindToAssetTaskInventoryListControllerFromSearch(segue: UIStoryboardSegue) {
        guard let source = segue.source as? AssetTaskInventoryListSearchViewController else { return }
        viewModel.checkStatus = source.viewModel.selectedInventoryStatus?.status ?? ""
        viewModel.appCheckStatus = viewModel.checkStatus
        viewModel.appSearchText = source.viewModel.searchText
        refreshTable()
    }

    @IBAction func unwindToAssetTaskInventoryListControllerFromChangeInventoryPerson(segue: UIStoryboardSegue) {
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
