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

    mutating func append(contentsOf: [Item])
}

extension Section {
    mutating func append(contentsOf items: [Item]) {
        self.items.append(contentsOf: items)
    }
}

protocol Item {}

final class DefaultItem: Item {
    var title = ""
    var image = UIImage()
}

final class DefaultSection<T: Item>: Section {
    var header: Void
    var items: [T]

    init(items: [T] = [T]()) {
        header = ()
        self.items = items
    }
}

protocol Pageable: AnyObject {
    var page: Int { get set }
    var size: Int { get set }
    var total: Int { get set }
    var isPaging: Bool { get set }
}

extension Pageable {
    var isPaging: Bool {
        get {
            fatalError("isPaging has not been implemented")
        }
        set {
            if newValue { page += 1 } else { page = 1 }
        }
    }
}

class ListViewModel<T: UIViewController, S: Section>: BaseViewModel<T> {
    private var dataSource: [S]

    init(request: RequestRepresentable, action: T, dataSource: [S]) {
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

    var first: S {
        guard let first = dataSource.first else {
            let defaultSection: S = .defaultValue
            dataSource = [defaultSection]
            return defaultSection
        }

        return first
    }
}

class PageableViewModel<T: UIViewController, S: Section>: ListViewModel<T, S>, Pageable {
    var total: Int = 0
    var page: Int = 0
    var size = Int(app.credential?.pageSize ?? "") ?? 10

    func api<T: PageableResponse>(of type: T.Type = T.self,
                                  router: APIRouter,
                                  completionHandler: @escaping ViewModelCompletionHandler<[T.Model]>)
    {
        beforeApi(router: router)
        request.listRequest(of: type, router: router) { [weak self] result in
            guard let self = self else { return }
            `self`.total = (try? result.get().total) ?? 0
            `self`.afterApi(router: router, result: result) { result in
                completionHandler(.success(result.data))
            }
        }
    }
}
