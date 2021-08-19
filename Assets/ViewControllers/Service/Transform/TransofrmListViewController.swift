//
//  AssetViewController.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

class TransformListViewController: BaseTableViewController, TableViewControllerPageable {
    typealias Action = TransformListViewController
    typealias S = DefaultSection<Transform>

    var viewModel: TransformListViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = TransformListViewModel(request: TransformListRequest(), action: self)
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
        case let destination as TransformDetailViewController:
            guard let sender = sender as? TransformListTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: sender.indexPath)
        case let destination as TransformSearchViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: nil)
        default: break
        }
    }

    @IBAction func unwindFromTransformSearchCompletion(segue: UIStoryboardSegue) {
        guard let search = segue.source as? TransformSearchViewController else { return }
        viewModel.taskStatus = search.viewModel.taskStatus.rawValue
        viewModel.location = search.viewModel.location
        viewModel.taskCode = search.viewModel.taskCode
        refreshTable()
    }

    @IBAction func unwindFromFromTransformDetailChangeCheckPerson(segue: UIStoryboardSegue) {
        refreshTable()
    }
}

extension TransformListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TransformListTableViewCell = self.tableView(tableView, cellForRowAt: indexPath) else {
            return UITableViewCell()
        }

        let viewModel: TransformListTableViewCell.ViewData = viewModel.viewData(for: self, with: cell.indexPath)
        cell.configurationCell(with: viewModel)

        return cell
    }
}
