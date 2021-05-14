//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class PhotographViewModel: BaseViewModel<PhotographViewController> {
    typealias ViewState = PhotographViewController.ViewState

    typealias ViewStates = (first: ViewState, second: ViewState)

    public let title: String
    public let key: String
    public let value: String
    let viewStates: ViewStates = (first: .prepare, second: .prepare)
    var photos: [Photo] = []

    init(title: String,
         key: String,
         value: String,
         request: RequestRepresentable,
         action: PhotographViewController)
    {
        self.title = title
        self.key = key
        self.value = value
        super.init(request: request, action: action)
    }

    func upload(_ image: UIImage) -> ViewModelFuture<ViewState> {
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return ViewModelFuture(error: EAMError.unwrapOptionalValueError("imageData should not be nil"))
        }

        func viewState(for url: URL, person: String, at time: String) -> ViewModelFuture<ViewState> {
            ViewModelFuture(value: .finished(url: url, info: info(for: person, at: time)))
        }

        let parameters = PhotographUploadParameter(locationCode: "", longitude: "", latitude: "", file: "", data: imageData)

        return upload(of: PhotographUploadResponse.self, router: .uploadPhoto(parameters)).flatMap { result -> ViewModelFuture<ViewState> in
            guard let photo = result, let url = URL(string: photo.url) else {
                return ViewModelFuture(error: EAMError.unwrapOptionalValueError("imageData should not be nil"))
            }
            return viewState(for: url, person: photo.uploadPerson, at: photo.uploadTime)
        }
    }

    func info(for person: String, at time: String) -> String {
        "上传人:\(person) 上传时间:\(time)"
    }

    func fetchImages() -> ViewModelFuture<ViewStates> {
        func viewStates(from photos: [Photo]) -> ViewModelFuture<ViewStates> {
            var viewStates: ViewStates = (first: .prepare, second: .prepare)

            if let first = photos.first, let url = URL(string: first.url) {
                viewStates.first = .finished(url: url, info: info(for: first.uploadPerson, at: first.uploadTime))
            }

            if let second = photos.last, let url = URL(string: second.url) {
                viewStates.second = .finished(url: url, info: info(for: second.uploadPerson, at: second.uploadTime))
            }

            return ViewModelFuture(value: viewStates)
        }

        let parameter = LocationImagesParameter(locationCode: value)

        return listApi(of: LocationImagesResponse.self,
                       router: APIRouter.imagesByLocation(parameter))
            .onSuccess { [weak self] photos in
                guard let self = self else { return }
                `self`.photos = photos
            }.flatMap { photos -> ViewModelFuture<ViewStates> in
                viewStates(from: photos)
            }
    }

    func delete(for index: Int) -> ViewModelFuture<ViewState> {
        let photo = photos[index]
        let parameter = LocationImageOperatorByDeleteParameter(imageId: photo.imageId, locationCode: value)
        return api(of: LocationImageOperatorByDeleteResponse.self,
                   router: APIRouter.locationImageOperatorByDelete(parameter))
            .onSuccess { [weak self] result in
                guard let self = self else { return }
                `self`.action.alert(message: result)
            }
            .flatMap { _ -> ViewModelFuture<ViewState> in
                ViewModelFuture(value: .prepare)
            }
    }
}
