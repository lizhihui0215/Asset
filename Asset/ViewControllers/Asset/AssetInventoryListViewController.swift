//
//  AssetInvertoryListViewController.swift
//  Asset
//
//  Created by lizhihui on 2021/4/25.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import DropDown
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
        dropDown.textColor = .blue
        dropDown.dataSource = viewModel.dropDownOptions
        dropDown.selectionAction = {[weak self] index, s in
            print("index: \(index) item:\(s)")
            guard let `self` = self else { return }
            `self`.dropDown.hide()
        }
    }

    @IBAction func inventoryButtonTapped(_ sender: UIButton) {
        dropDown.show()
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

extension AssetInventoryListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: AssetInventoryTableViewCell = tableView.dequeueReusableCell() else {
            return UITableViewCell()
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
}
