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

    // TODO: create view model from source controller
    // = StaffListViewModel(request: StaffListRequest(), action: self)

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
//        let segue = StoryboardSegue.Service(segue)
//        switch segue {
//        case .toLocationDetail:
//            guard let locationListCell: LocationListTableViewCell = segue?.associatedTableViewCell(from: sender),
//                  let destination = destination as? LocationDetailViewController
//            else {
//                break
//            }
//            destination.viewModel = viewModel.locationDetailViewModelAtIndexPath(action: destination, indexPath: locationListCell.viewModel.indexPath)
//        default: break
//        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}

extension StaffListViewController: UISearchBarDelegate {
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
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

        return cell
    }
}
