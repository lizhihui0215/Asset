//
// Created by lizhihui on 2021/4/21.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

protocol TableViewHeaderRefreshing: AnyObject {
    func header(_ header: MJRefreshNormalHeader, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void)
    func footer(_ header: MJRefreshBackNormalFooter, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void)
}

extension BaseTableViewController: UITableViewDelegate {}

class BaseTableViewController: BaseViewController {
    @IBOutlet var tableView: UITableView!

    var isHeaderRefreshingEnabled: Bool {
        get {
            header != nil
        }
        set {
            header = newValue ? MJRefreshNormalHeader() : nil
        }
    }

    var isFooterRefreshingEnabled: Bool {
        get {
            footer != nil
        }
        set {
            footer = newValue ? MJRefreshBackNormalFooter() : nil
        }
    }

    var header: MJRefreshNormalHeader? = MJRefreshNormalHeader()
    var footer: MJRefreshBackNormalFooter? = MJRefreshBackNormalFooter()
    weak var headerRefreshingDelegate: TableViewHeaderRefreshing?

    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.mj_header?.refreshingBlock = { [weak self] in
            guard let self = self,
                  let header = self.header,
                  let headerRefreshingDelegate = self.headerRefreshingDelegate
            else {
                return
            }

            headerRefreshingDelegate.header(header, didStartRefreshingWith: `self`.tableView) {
                header.endRefreshing()
            }
        }

        tableView.mj_footer?.refreshingBlock = { [weak self] in
            guard let self = self,
                  let footer = self.footer,
                  let headerRefreshingDelegate = self.headerRefreshingDelegate
            else {
                return
            }

            headerRefreshingDelegate.footer(footer, didStartRefreshingWith: `self`.tableView) {
                footer.endRefreshing()
            }
        }
    }
}
