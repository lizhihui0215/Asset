//
// Created by lizhihui on 2021/5/9.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetInventoryListDetailViewModel: AssetDetailViewModel {
    func submit() -> ViewModelFuture<AssetDetailed?> {
        guard let assetDetail = assetDetail, let checkPerson = app.credential?.userAccount else {
            return ViewModelFuture(error: .unwrapOptionalValue("AssetDetail and checkPerson could not be nil"))
        }

        let parameters = AssetInventoryListDetailSubmitParameter(realLocationCode: assetDetail.realLocationCode,
                                                                 quantity: String(assetDetail.quantity),
                                                                 checkPerson: checkPerson,
                                                                 latitude: latitude,
                                                                 dutyPersonName: assetDetail.dutyPersonName,
                                                                 assetCheckItem: selectedAssetStatus?.status ?? "",
                                                                 resourceNumber: assetDetail.resourceNumber,
                                                                 usePersonName: assetDetail.usePersonName,
                                                                 tagNumber: assetDetail.tagNumber,
                                                                 mapLocationDesc: rgcData?.JSONString ?? "",
                                                                 dutyPerson: assetDetail.dutyPerson,
                                                                 assetId: assetDetail.assetId,
                                                                 manufactureName: assetDetail.manufactureName,
                                                                 usePerson: assetDetail.usePerson,
                                                                 assetName: assetDetail.assetName,
                                                                 realLocationName: assetDetail.realLocationName,
                                                                 modelNumber: assetDetail.modelNumber,
                                                                 longitude: longitude)

        return api(of: AssetInventoryListDetailSubmitResponse.self,
                   router: APIRouter.assetDetailInventoryListDetailSubmit(parameters))
            .flatMap {
                ViewModelFuture(value: $0)
            }
            .onSuccess { [weak self] assetDetail in
                guard let self = self else { return }
                `self`.handleAssetDetailResult(assetDetail: assetDetail)
            }
    }

    override func rightBarButtonTapped() -> ViewModelFuture<StoryboardSegue.Common> {
        guard state == .editing else {
            return ViewModelFuture { complete in
                complete(.success(.toPhotograph))
            }
        }

        return ViewModelFuture { complete in
            submit().onSuccess { [weak self] _ in
                guard let self = self else { return }
                `self`.action.alert(message: "操作成功！", defaultAction: UIViewController.defaultAlertAction {
                    complete(.success(.toPhotograph))
                })
            }
        }
    }

    override func fetchAssetDetail() -> ViewModelFuture<AssetDetailed?> {
        api(of: AssetInventoryListDetailResponse.self, router: .assetDetailByInventoryList(parameters)).flatMap {
            ViewModelFuture(value: $0)
        }.onSuccess { [weak self] assetDetail in
            guard let self = self else { return }
            `self`.handleAssetDetailResult(assetDetail: assetDetail)
        }
    }
}

extension AssetInventoryListDetail: AssetDetailed {
    var principalCode: String {
        ""
    }

    var userAccount: String {
        ""
    }
}
