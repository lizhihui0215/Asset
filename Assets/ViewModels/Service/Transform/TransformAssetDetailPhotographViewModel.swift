//
//  TransformAssetDetailPhotographViewModel.swift
//  Assets
//
//  Created by lizhihui on 2021/7/9.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class TransformAssetDetailPhotographViewModel: BaseViewModel<TransformAssetDetailPhotographViewController> {
    var longitude: String = ""

    var latitude: String = ""

    var formattedLongitude: String { String(format: "%.6f", Double(longitude) ?? 0) }

    var formattedLatitude: String { String(format: "%.6f", Double(latitude) ?? 0) }

    var checkStatusName: String { transformAssetDetailPhotograph.confirmDesc }

    var assertUseName: String { transformAssetDetailPhotograph.assetCheckItemName }

    var checkPerson: String { app.credential?.userAccount ?? "" }

    var tagNumber: String { transformAssetDetailPhotograph.tagNumber }
    var assetName: String { transformAssetDetailPhotograph.assetName }

    var manufactureName: String { transformAssetDetailPhotograph.manufactureName }

    var modelName: String { transformAssetDetailPhotograph.modelNumber }

    var locationCode: String { transformAssetDetailPhotograph.assetLocationCode }
    var locationName: String { transformAssetDetailPhotograph.assetLocationName }
    var quantity: String { transformAssetDetailPhotograph.quantity }

    public var principalName: String { transformAssetDetailPhotograph.dutyPersonName }

    private var transformAssetDetailPhotograph: TransformAssetDetailPhotograph!

    private var transformAsset: TransformAsset

    private var billLineId: String { transformAsset.billLineId }

    public var resourceNumber: String { transformAssetDetailPhotograph.resourceNumber }

    init(request: RequestRepresentable,
         action: TransformAssetDetailPhotographViewController,
         transformAsset: TransformAsset)
    {
        self.transformAsset = transformAsset
        super.init(request: request, action: action)
    }

    func fetchTransformAssetDetailPhotograph() -> ViewModelFuture<TransformAssetDetailPhotograph?> {
        api(of: TransformAssetDetailPhotographResponse.self,
            router: .transformAssetDetailPhotograph(
                TransformAssetDetailPhotographParameter(billLineId: billLineId,
                                                        checkPerson: checkPerson)))
            .onSuccess { [weak self] result in
                guard let self = self else { return }
                `self`.transformAssetDetailPhotograph = result
            }
    }

    // swiftlint:disable force_cast
    override func viewModel<T: ViewModelRepresentable>(for action: UIKit.UIViewController, with sender: Any?) -> T {
        switch action {
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
