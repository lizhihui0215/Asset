//
//  AssetInvertoryListViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/4/25.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
import MJRefresh
import UIKit

class AssetInventoryListViewController: BaseTableViewController {
    @IBOutlet var pagingInformationLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var inventoryStatusButton: UIButton!

    var viewModel: AssetInventoryListViewModel!

    let dropDown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()
        dropDown.anchorView = inventoryStatusButton
        dropDown.cellNib = UINib(nibName: "DropDownOptionCell", bundle: nil)
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.textColor = XCColor.dropdownTextColor.color
        dropDown.selectedTextColor = XCColor.primaryTextColor.color
        dropDown.selectionAction = { [weak self] _, item in
            guard let self = self else { return }
            `self`.viewModel.setSelectedInventoryStatus(for: item)
            `self`.inventoryStatusButton.setTitle(item, for: .normal)
        }

        headerRefreshingDelegate = self
        searchBar.delegate = self
        refreshTable(isFetchInventoryStatus: true)
    }

    func refreshTable(isPaging: Bool = false, isFetchInventoryStatus: Bool = false) {
        let fetchList = viewModel.fetchList(isPaging: isPaging)
        let fetchInventoryStatus = viewModel.fetchInventoryStatus()

        let fetchListSuccess: ([Asset]) -> Void = { [weak self] _ in
            guard let self = self else { return }
            `self`.tableView.reloadData()
            `self`.updatePagingInformation()
        }

        guard isFetchInventoryStatus else {
            fetchList.onSuccess(callback: fetchListSuccess)
            return
        }

        fetchInventoryStatus.onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.refreshDropDown()
        }.flatMap { _ in
            fetchList
        }.onSuccess(callback: fetchListSuccess)
    }

    private func refreshDropDown() {
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.reloadAllComponents()
    }

    @IBAction func scanTapped(_ sender: AnimatableButton) {}

    func updatePagingInformation() {
        pagingInformationLabel.text = L10n.locationList.pagingInformation.label.text(viewModel.page, viewModel.total)
    }

    @IBAction func inventoryButtonTapped(_ sender: UIButton) {
        dropDown.show()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        let locationSegue = StoryboardSegue.Location(rawValue: identifier)

        switch locationSegue {
        case .toScan:
            guard let scanViewController: ScanViewController = segue.destination() else { break }
            scanViewController.viewModel = viewModel.scanViewModel(action: scanViewController)
        default: break
        }
    }
}

extension AssetInventoryListViewController: TableViewHeaderRefreshing {
    func header(_ header: MJRefreshNormalHeader, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void) {
        refreshTable()
        completionBlock()
    }

    func footer(_ header: MJRefreshBackNormalFooter, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void) {
        refreshTable(isPaging: true)
        completionBlock()
    }
}

extension AssetInventoryListViewController: UISearchBarDelegate {
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        viewModel.appSearchText = searchBar.eam.text
        refreshTable()
    }
}

extension AssetInventoryListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AssetInventoryTableViewCell = tableView.dequeueReusableCell() else {
            return UITableViewCell()
        }
        let viewModel = self.viewModel.assetInventoryCellViewModel(at: indexPath)
        cell.configurationCell(with: viewModel)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }
}
