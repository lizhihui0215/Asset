//
//  AssetViewController.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

class TransformAssetListViewController: BaseTableViewController, TableViewControllerPageable {
    typealias Action = TransformAssetListViewController
    typealias S = DefaultSection<TransformAsset>

    var viewModel: TransformAssetListViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        refreshTable()
    }

    // MARK: - Navigation

    @IBAction func unwindToTransformInventoryListController(sender: UIStoryboardSegue) {}

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as TransformDetailViewController:
            guard let sender = sender as? TransformAssetListTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: sender.indexPath)
        case let destination as ScanViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        case let destination as TransformAssetDetailPhotographViewController:
            guard let sender = sender as? TransformAssetListTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: sender.indexPath)
        case let destination as TransformAssetListSearchViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: nil)
        default: break
        }
    }

    @IBAction func scanTapped(_ sender: UIButton) {}

    @IBAction func unwindFromTransformAssetListSearchCompletion(segue: UIStoryboardSegue) {
        guard let source = segue.source as? TransformAssetListSearchViewController else { return }
        viewModel.appSearchText = source.viewModel.searchText
        viewModel.confirmFlag = source.viewModel.selectedConfirmStatus?.status ?? ""
        refreshTable()
    }
}

extension TransformAssetListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TransformAssetListTableViewCell = self.tableView(tableView, cellForRowAt: indexPath) else {
            return UITableViewCell()
        }

        let viewModel: TransformAssetListTableViewCell.ViewData = viewModel.viewData(for: self, with: cell.indexPath)
        cell.configurationCell(with: viewModel)

        return cell
    }
}
