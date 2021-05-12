//
// Created by lizhihui on 2021/4/21.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import MJRefresh
import UIKit

protocol TableViewControllerPageable: TableViewHeaderRefreshing where ViewModel: PageableViewModel<Action, S> {
    associatedtype Action: BaseTableViewController
    associatedtype S: Section
    associatedtype ViewModel

    var viewModel: ViewModel! { get set }
}

extension TableViewControllerPageable where Self: BaseTableViewController {
    func tableView<T: BaseTableViewCell & ReuseIdRepresentable>(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> T? {
        let cell: T? = tableView.dequeueReusableCell()
        cell?.indexPath = indexPath
        return cell
    }
}

extension TableViewControllerPageable where Self: BaseTableViewController {
    func header(_ header: MJRefreshNormalHeader, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void) {
        refreshTable()
        completionBlock()
    }

    func footer(_ header: MJRefreshBackNormalFooter, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void) {
        refreshTable(isPaging: true)
        completionBlock()
    }
}

extension TableViewControllerPageable where Self: BaseTableViewController {
    var page: Int {
        viewModel.page
    }

    var total: Int {
        viewModel.total
    }

    @discardableResult
    func refreshTable(isPaging: Bool = false) -> ViewModelFuture<[S.Item]> {
        viewModel.fetchList(isPaging: isPaging).onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.tableView.reloadData()
            `self`.updatePagingInformation()
        }
    }

    func updatePagingInformation() {
        pagingInformationLabel.text = L10n.locationList.pagingInformation.label.text(page, total)
    }
}

protocol TableViewHeaderRefreshing: AnyObject {
    func header(_ header: MJRefreshNormalHeader, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void)
    func footer(_ header: MJRefreshBackNormalFooter, didStartRefreshingWith tableView: UITableView, completionBlock: @escaping () -> Void)
}

class BaseTableViewController: BaseViewController {
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var pagingInformationLabel: UILabel!

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

    override func awakeFromNib() {
        super.awakeFromNib()
        isFooterRefreshingEnabled = true
        isHeaderRefreshingEnabled = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self as? UITableViewDataSource
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.mj_header = header
        tableView.mj_footer = footer
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

        tableView.keyboardDismissMode = .onDrag
    }
}

extension BaseTableViewController: UITableViewDelegate {}
