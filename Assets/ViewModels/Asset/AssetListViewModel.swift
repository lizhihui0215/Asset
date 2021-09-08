//
// Created by lizhihui on 2021/5/5.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetListViewModel: PageableViewModel<AssetListViewController, DefaultSection<Asset>>, Searchable {
    enum UserType: String {
        case use
        case duty
    }

    var appSearchText: String = ""
    let regionIdCompany = app.credential?.userCityId ?? ""
    let checkPerson = app.credential?.userAccount ?? ""
    var userType: UserType = .duty

    public var pageNumber: Int {
        page + 1
    }

    init(request: RequestRepresentable, action: AssetListViewController) {
        super.init(request: request, action: action, dataSource: [.defaultValue])
    }

    override func fetchList(isPaging: Bool = false) -> ViewModelFuture<[Asset]> {
        self.isPaging = isPaging
        let parameter = AssetListParameter(
            pageNumber: String(page),
            pageSize: String(size),
            regionIdCompany: regionIdCompany,
            appSearchText: appSearchText,
            personType: userType.rawValue
        )

        return pageableApi(of: AssetListResponse.self, router: .personalAssetList(parameter))
            .onSuccess { [weak self] locations in
                guard let first = self?.first else { return }
                guard isPaging else { first.items = locations; return }
                first.items.append(contentsOf: locations)
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as AssetDetailViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let asset = itemAtIndexPath(indexPath: indexPath)

            let configuration = AssetDetailViewController.Configuration(isHiddenCoordinate: true,
                                                                        isHiddenInventoryStatus: true,
                                                                        isHiddenStatus: true,
                                                                        isHiddenDeviceSerial: true,
                                                                        isHiddenCategoryCode: false,
                                                                        isHiddenCategoryName: false,
                                                                        isHiddenLocationCode: true,
                                                                        isHiddenLocationName: true,
                                                                        isHiddenPrincipalCode: false,
                                                                        isHiddenUserAccount: false,
                                                                        isHiddenPrincipal: false,
                                                                        isHiddenUser: false,
                                                                        locationCodeTitle: "地点编码:",
                                                                        locationNameTitle: "地点名称:")

            return AssetListDetailViewModel(request: AssetListDetailRequest(),
                                            action: action,
                                            viewState: .viewing(configuration: configuration),
                                            parameters: AssetListDetailParameter(assetId: asset.assetId, checkPerson: checkPerson)) as! T
        default: break
        }

        return super.viewModel(for: action, with: sender)
    }

    override func viewData<T: CellDataRepresentable>(for action: UIViewController, with sender: Any?) -> T {
        switch action {
        case _ as AssetListViewController:
            guard let indexPath = sender as? IndexPath else { break }
            let asset = itemAtIndexPath(indexPath: indexPath)
            return AssetListTableViewCell.ViewData(status: asset.checkStatus,
                                                   tagNumber: asset.tagNumber,
                                                   name: asset.assetName,
                                                   isCheck: asset.isCheck,
                                                   identifier: asset.assetId,
                                                   statusName: asset.checkStatusName) as! T
        default: break
        }

        return super.viewData(for: action, with: sender)
    }

    // swiftlint:enable force_cast
}

extension AssetListViewModel.UserType: ExpressibleByIntegerLiteral {
    var index: Int {
        self == .duty ? 0 : 1
    }

    typealias IntegerLiteralType = Int

    init(integerLiteral value: Int) {
        self = value == 0 ? .duty : .use
    }
}
