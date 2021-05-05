//
//  StaffListViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/5/5.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

class StaffListViewController: BaseTableViewController {
    @IBOutlet var pagingInformationLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!

    lazy var viewModel: StaffListViewModel = {
        StaffListViewModel(request: StaffListRequest(), action: self)
    }()

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

    func updatePagingInformation() {
//        pagingInformationLabel.text = L10n.locationList.pagingInformation.label.text(viewModel.pageNumber, viewModel.total)
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

extension StaffListViewController: TableViewHeaderRefreshing {
    func header(_ header: MJRefreshNormalHeader, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void) {
        refreshTable()
        completionBlock()
    }

    func footer(_ header: MJRefreshBackNormalFooter, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void) {
        refreshTable(isPaging: true)
        completionBlock()
    }
}

extension StaffListViewController: UISearchBarDelegate {
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        viewModel.appSearchText = searchBar.eam.text
        refreshTable()
    }
}

extension StaffListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.numberOfItemsInSection(section: section)
        0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: LocationListTableViewCell = tableView.dequeueReusableCell() else {
            return UITableViewCell()
        }

//        let viewModel = self.viewModel.locationViewModelAtIndexPath(indexPath: indexPath)
//
//        cell.configurationCell(with: viewModel)

        return cell
    }
}
