//
// Created by lizhihui on 2021/5/15.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AssetPhotographViewModel: PhotographViewModel {
    override func upload() -> ViewModelFuture<Photo?> {
        upload(of: PhotographUploadResponse.self, router: .uploadPhoto(parameter))
    }

    override func imageList() -> ViewModelFuture<[Photo]> {
        let parameter = AssetImagesParameter(tagNumber: value)
        return listApi(of: AssetImagesResponse.self,
                       router: .imagesByAsset(parameter))
    }

    override func delete(photo: Photo) -> ViewModelFuture<String?> {
        let parameter = AssetImageOperatorByDeleteParameter(imageId: photo.imageId, tagNumber: value)
        return api(of: AssetImageOperatorByDeleteResponse.self,
                   router: .assetImageOperatorByDelete(parameter))
    }
}
