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

class AssetInventoryListViewController: BaseTableViewController, TableViewControllerPageable {
    typealias Action = AssetInventoryListViewController
    typealias S = DefaultSection<Asset>
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
            `self`.viewModel.setSelectedInventoryStatus(for: item).onSuccess { [weak self] _ in
                guard let self = self else { return }
                `self`.refreshTable()
            }
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

    @IBAction func inventoryButtonTapped(_ sender: UIButton) {
        dropDown.show()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination() {
        case let destination as ScanViewController:
            destination.viewModel = viewModel.viewModel(for: destination, with: sender)
        default: break
        }
    }

    @IBAction func unwindFromScanSuccess(segue: UIStoryboardSegue) {
        print("unwindFromScanSuccess")
    }
}

extension AssetInventoryListViewController: UISearchBarDelegate {
    public func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        viewModel.appSearchText = searchBar.eam.text
        refreshTable()
    }
}

extension AssetInventoryListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AssetInventoryTableViewCell = tableView.dequeueReusableCell() else {
            return UITableViewCell()
        }
        let viewModel = self.viewModel.assetInventoryCellViewModel(at: indexPath)
        cell.configurationCell(with: viewModel)
        return cell
    }
}
