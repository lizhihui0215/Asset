//
// Created by Bernard on 2021/6/3.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class TransformListViewController: BaseTableViewController, TableViewControllerPageable {
    lazy var viewModel: TransformListViewModel! = {
        TransformListViewModel(request: TransformListRequest(), action: self)
    }()

    typealias Action = TransformListViewController
    typealias S = DefaultSection<Transform>

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

    @IBAction func unwindFromSearchCompletion(segue: UIStoryboardSegue) {
        guard let source = segue.source as? TransformSearchViewController else { return }

        viewModel.appSearchLocation = source.locationTextField.eam.text
        viewModel.appSearchTask = source.taskCodeTextField.eam.text
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

        let viewModel: TransformListTableViewCell.ViewData = viewModel.viewData(for: self, with: cell)

        cell.configurationCell(with: viewModel)

        return cell
    }
}
