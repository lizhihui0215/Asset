//
//  AssetViewController.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

class AssetListViewController: BaseTableViewController, TableViewControllerPageable {
    typealias Action = AssetListViewController
    typealias S = DefaultSection<Asset>

    @IBOutlet var radioGroupView: RadioGroupView!
    var viewModel: AssetListViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel = AssetListViewModel(request: AssetTaskListRequest(), action: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        searchBar.delegate = self
        refreshTable()
        radioGroupView.selectedAction = { [weak self] index in
            guard let self = self else { return }
            `self`.viewModel.userType = AssetListViewModel.UserType(integerLiteral: index)
            `self`.refreshTable()
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case let destination as AssetDetailViewController:
            guard let sender = sender as? AssetListTableViewCell else { break }
            destination.viewModel = viewModel.viewModel(for: destination, with: sender.indexPath)
        default: break
        }
    }
}

extension AssetListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() // hides the keyboard.
        viewModel.appSearchText = searchBar.eam.text
        refreshTable()
    }
}

extension AssetListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AssetListTableViewCell = self.tableView(tableView, cellForRowAt: indexPath) else {
            return UITableViewCell()
        }

        let viewModel: AssetListTableViewCell.ViewData = viewModel.viewData(for: self, with: cell.indexPath)
        cell.configurationCell(with: viewModel)

        return cell
    }
}
