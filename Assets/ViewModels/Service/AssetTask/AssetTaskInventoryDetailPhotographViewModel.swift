//
//  AssetTaskInventoryDetailPhotographViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/7/9.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetTaskInventoryDetailPhotographViewModel: BaseViewModel<AssetTaskInventoryDetailPhotographViewController>, StaffSelectable {
    var locationService: BDLocationService = .shared
    typealias AssetStatus = [String: String]
    typealias SelectedAssetStatus = (status: AssetStatus.Key, name: AssetStatus.Value)
    var assetStatus: AssetStatus?
    var selectedAssetStatus: SelectedAssetStatus?

    var rgcData: LocationReGeocode?

    var longitude: String = ""

    var latitude: String = ""

    public var principal: Staff?
    public var user: Staff?

    var formattedLongitude: String { String(format: "%.6f", Double(longitude) ?? 0) }

    var formattedLatitude: String { String(format: "%.6f", Double(latitude) ?? 0) }

    var checkStatusName: String { assetTaskInventoryDetailPhotograph.checkStatusName }

    var assertUseName: String { assetTaskInventoryDetailPhotograph.assetCheckItemName }

    var checkPerson: String { app.credential?.userAccount ?? "" }

//    var resourceNumber: String { assetTaskInventoryDetail. }

    var tagNumber: String { assetTaskInventoryDetailPhotograph.tagNumber }
    var assetName: String { assetTaskInventoryDetailPhotograph.assetName }

    var manufactureName: String { assetTaskInventoryDetailPhotograph.manufactureName }

    var modelName: String { assetTaskInventoryDetailPhotograph.modelNumber }

    var locationCode: String { assetTaskInventoryDetailPhotograph.locationCode }
    var locationName: String { assetTaskInventoryDetailPhotograph.locationName }
    var quantity: String { String(assetTaskInventoryDetailPhotograph.quantity) }

    public var principalName: String { assetTaskInventoryDetailPhotograph.dutyPersonName }

    public var userName: String { assetTaskInventoryDetailPhotograph.usePersonName }

//    var systemLongitude: String { String(format: "%.6f", Double(assetTaskInventoryDetail.) ?? 0) }

    public var selectedAssetCheckItem: String = ""
//    var systemLatitude: String { String(format: "%.6f", Double(assetTaskInventoryDetail.latitude) ?? 0) }

    private var assetTaskInventoryDetailPhotograph: AssetTaskInventoryDetailPhotograph!

    private var assetTaskInventory: AssetTaskInventory

    init(request: RequestRepresentable, action: AssetTaskInventoryDetailPhotographViewController,
         assetTaskInventory: AssetTaskInventory)
    {
        self.assetTaskInventory = assetTaskInventory
        super.init(request: request, action: action)
    }

    override func fetchDictionary(for status: APIRouter.DictionaryStatus) -> ViewModelFuture<AssetStatus?> {
        super.fetchDictionary(for: status).onSuccess { [weak self] status in
            guard let self = self else { return }
            `self`.assetStatus = status
        }
    }

    func submit() -> ViewModelFuture<AssetTaskInventoryDetail?> {
        fatalError("not support")
//        api(of: AssetTaskInventoryDetailSubmitResponse.self,
//            router: .assetTaskInventoryDetailSubmit(
//                AssetTaskInventoryDetailSubmitParameter(
//                    realLocationCode: assetTaskInventoryDetail.realLocationCode,
//                    quantity: quantity,
//                    checkPerson: checkPerson,
//                    latitude: latitude,
//                    dutyPersonName: principal?.userName ?? "",
//                    assetCheckItem: selectedAssetStatus?.status ?? "",
//                    resourceNumber: resourceNumber,
//                    usePersonName: userName,
//                    tagNumber: tagNumber,
//                    mapLocationDesc: rgcData?.eam.JSONString ?? "",
//                    dutyPerson: principal?.account ?? "",
//                    assetId: assetTaskInventoryDetail.assetId,
//                    checkBillCode: assetTaskInventoryDetail.checkBillCode,
//                    manufactureName: manufactureName,
//                    usePerson: principalName,
//                    assetName: assetName,
//                    realLocationName: assetTaskInventoryDetail.realLocationName,
//                    modelNumber: modelName,
//                    longitude: longitude
//                )))
//                .onSuccess { [weak self] result in
//            guard let self = self else { return }
//            `self`.assetTaskInventoryDetail.latitude = result?.latitude ?? ""
//            `self`.assetTaskInventoryDetail.longitude = result?.longitude ?? ""
//        }
    }

    func fetchTaskInventoryDetailPhotograph() -> ViewModelFuture<AssetTaskInventoryDetailPhotograph?> {
        api(of: AssetTaskInventoryDetailPhotographResponse.self,
            router: .assetTaskInventoryDetailPhotograph(
                AssetTaskInventoryDetailPhotographParameter(checkStatus: assetTaskInventory.checkStatus,
                                                            assetId: assetTaskInventory.assetId, checkPerson: checkPerson, checkBillCode: assetTaskInventory.checkBillCode)))
            .onSuccess { [weak self] result in
                guard let self = self else { return }
                `self`.assetTaskInventoryDetailPhotograph = result
            }
    }

//    func handleAssetDetailResult(assetTaskInventoryDetail: AssetTaskInventoryDetail) {
//        let checkStatusName = assetTaskInventoryDetail.assetCheckItemName
//        let checkStatus = assetStatus?.key(from: checkStatusName) ?? "0"
//        selectedAssetStatus = (status: checkStatus, name: checkStatusName)
//        let dutyPerson = assetTaskInventoryDetail.dutyPerson
//        let dutyPersonName = assetTaskInventoryDetail.dutyPersonName
//        let usePerson = assetTaskInventoryDetail.usePerson
//        let usePersonName = assetTaskInventoryDetail.usePersonName
//
//        principal = Staff(isCheck: false,
//                          account: dutyPerson,
//                          userName: dutyPersonName,
//                          userCode: "",
//                          userOrgName: "")
//
//        user = Staff(isCheck: false,
//                     account: usePerson,
//                     userName: usePersonName,
//                     userCode: "",
//                     userOrgName: "")
//    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
        case let action as StaffListViewController:
            return StaffListViewModel(request: StaffListRequest(),
                                      action: action,
                                      category: sender as! Staff.Category, segue: .unwindFromStaffSelectedToAssetTaskInventoryDetail) as! T
        case let action as PhotographViewController:

            let parameters = PhotographUploadParameter(category: .asset(tagNumber: tagNumber),
                                                       longitude: longitude,
                                                       latitude: latitude)
            return AssetPhotographViewModel(title: "资产照片采集",
                                            key: "资产标签号",
                                            viewStates: (first: .prepare, second: .prepare),
                                            parameter: parameters,
                                            request: PhotographRequest(),
                                            action: action) as! T
        default: break
        }
        return super.viewModel(for: action, with: sender)
    }
    // swiftlint:enable force_cast
}
