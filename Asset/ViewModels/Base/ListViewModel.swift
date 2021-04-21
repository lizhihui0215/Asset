//
// Created by lizhihui on 2021/4/21.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

protocol Section: Defaultable {
    associatedtype Item
    associatedtype Header

    var header: Header { get set }

    var items: [Item] { get set }
}

protocol Item {}

struct DefaultItem: Item {
    var title = ""
    var image = UIImage()
}

struct DefaultSection<T: Item>: Section {
    var header: Void
    var items: [T]

    init(items: [T] = [T]()) {
        header = ()
        self.items = items
    }
}

class ListViewModel<T: UIViewController, S: Section>: BaseViewModel<T> {
    private var dataSource: [S]

    init(request: BaseRequest, action: T, dataSource: [S]) {
        self.dataSource = dataSource
        super.init(request: request, action: action)
    }

    func numberOfItemsInSection(section: Int) -> Int {
        dataSource[section].items.count
    }

    func itemAtIndexPath(indexPath: IndexPath) -> S.Item {
        dataSource[indexPath.section].items[indexPath.row]
    }

    func sectionAt(index: Int) -> S {
        dataSource[index]
    }
}
