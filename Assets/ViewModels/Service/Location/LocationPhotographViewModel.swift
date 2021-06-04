//
// Created by lizhihui on 2021/5/15.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class LocationPhotographViewModel: PhotographViewModel {
    override func upload() -> ViewModelFuture<Photo?> {
        upload(of: PhotographUploadResponse.self, router: .uploadPhoto(parameter))
    }

    override func imageList() -> ViewModelFuture<[Photo]> {
        let parameter = LocationImagesParameter(locationCode: value)
        return listApi(of: LocationImagesResponse.self,
                       router: APIRouter.imagesByLocation(parameter))
    }

    override func delete(photo: Photo) -> ViewModelFuture<String?> {
        let parameter = LocationImageOperatorByDeleteParameter(imageId: photo.imageId, locationCode: value)
        return api(of: LocationImageOperatorByDeleteResponse.self,
                   router: .locationImageOperatorByDelete(parameter))
    }
}
