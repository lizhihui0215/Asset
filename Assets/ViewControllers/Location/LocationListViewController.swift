//
// Created by lizhihui on 2021/4/22.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import MJRefresh
import UIKit

class LocationListViewController: BaseTableViewController, TableViewControllerPageable {
    var viewModel: LocationListViewModel!
    typealias Action = LocationListViewController
    typealias S = DefaultSection<Location>

    override func viewDidLoad() {
        super.viewDidLoad()
        headerRefreshingDelegate = self
        searchBar.delegate = self
        refreshTable()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        let segue = StoryboardSegue.Service(segue)
        switch segue {
        case .toLocationDetail:
            guard let locationListCell: LocationListTableViewCell = segue?.associatedTableViewCell(from: sender),
                  let destination = destination as? LocationDetailViewController
            else {
                break
            }
            destination.viewModel = viewModel.locationDetailViewModelAtIndexPath(action: destination, indexPath: locationListCell.viewModel.indexPath)
        default: break
        }
    }
}

extension LocationListViewController: UISearchBarDelegate {}

extension LocationListViewController {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: LocationListTableViewCell = tableView.dequeueReusableCell() else {
            return UITableViewCell()
        }

        let viewModel = self.viewModel.locationViewModelAtIndexPath(indexPath: indexPath)

        cell.configurationCell(with: viewModel)

        return cell
    }
}
