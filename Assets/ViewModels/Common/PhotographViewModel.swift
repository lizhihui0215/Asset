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

    public var value: String {
        switch parameter.category {
        case .asset(tagNumber: let tagNumber): return tagNumber
        case .location(locationCode: let locationCode): return locationCode
        }
    }

    var parameter: PhotographUploadParameter
    var viewStates: ViewStates
    var photos: [Photo] = [Photo(), Photo()]
    init(title: String,
         key: String,
         viewStates: ViewStates,
         parameter: PhotographUploadParameter,
         request: RequestRepresentable,
         action: PhotographViewController)
    {
        self.viewStates = viewStates
        self.title = title
        self.key = key
        self.parameter = parameter
        super.init(request: request, action: action)
    }

    func upload(_ image: UIImage, at index: Int) -> ViewModelFuture<ViewState> {
        guard let imageData = image.jpegData(compressionQuality: 1) else {
            return ViewModelFuture(error: .unwrapOptionalValue("imageData should not be nil"))
        }

        parameter.data = imageData

        func viewState(for url: URL, person: String, at time: String) -> ViewModelFuture<ViewState> {
            ViewModelFuture(value: .finished(url: url, info: info(for: person, at: time)))
        }

        return upload().onSuccess { [weak self] result in
            guard let self = self, let photo = result else { return }
            `self`.photos[index] = photo
        }.flatMap { result -> ViewModelFuture<ViewState> in
            guard let photo = result, let url = URL(string: photo.url) else {
                return ViewModelFuture(error: .unwrapOptionalValue("imageData should not be nil"))
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
            self.viewStates = viewStates
            return ViewModelFuture(value: viewStates)
        }

        return imageList()
            .onSuccess { [weak self] photos in
                guard let self = self else { return }
                `self`.photos = photos
            }.flatMap { photos -> ViewModelFuture<ViewStates> in
                viewStates(from: photos)
            }
    }

    func upload() -> ViewModelFuture<Photo?> {
        fatalError("sub class must implement 'upload' method to provide upload function")
    }

    func imageList() -> ViewModelFuture<[Photo]> {
        fatalError("sub class must implement 'imageList' method to provide upload function")
    }

    func delete(photo: Photo) -> ViewModelFuture<String?> {
        fatalError("sub class must implement 'delete' method to provide upload function")
    }

    func delete(for index: Int) -> ViewModelFuture<ViewState> {
        let photo = photos[index]
        return delete(photo: photo)
            .onSuccess { [weak self] result in
                guard let self = self else { return }
                `self`.action.alert(message: result ?? "")
            }
            .flatMap { _ -> ViewModelFuture<ViewState> in
                ViewModelFuture(value: .prepare)
            }
    }
}
