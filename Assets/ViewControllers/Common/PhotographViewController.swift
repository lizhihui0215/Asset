//
//  PhotographViewController.swift
//  Assets
//
//  Created by lizhihui on 2021/4/25.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import AlamofireImage
import UIKit
import ZLPhotoBrowser

class PhotographViewController: BaseViewController {
    enum ViewState: Equatable {
        case viewing(url: URL? = nil, info: String? = nil) // 查看照片
        case prepare // 没有照片
        case ready(UIImage) // 照片选好了
        case finished(url: URL, info: String) // 上传完毕
    }

    enum EditingView {
        var containerStackView: UIStackView {
            switch self {
            case .first(let controller): return controller.firstContainerStackView
            case .second(let controller): return controller.secondContainerStackView
            }
        }

        var imageView: UIImageView {
            switch self {
            case .first(let controller): return controller.firstImageView
            case .second(let controller): return controller.secondImageView
            }
        }

        var buttonStackView: UIStackView {
            switch self {
            case .first(let controller): return controller.firstButtonStackView
            case .second(let controller): return controller.secondButtonStackView
            }
        }

        var photographButton: AnimatableButton {
            switch self {
            case .first(let controller): return controller.firstPhotographButton
            case .second(let controller): return controller.secondPhotographButton
            }
        }

        var photoAlbumButton: AnimatableButton {
            switch self {
            case .first(let controller): return controller.firstPhotoAlbumButton
            case .second(let controller): return controller.secondPhotoAlbumButton
            }
        }

        var submitButton: AnimatableButton {
            switch self {
            case .first(let controller): return controller.firstSubmitButton
            case .second(let controller): return controller.secondSubmitButton
            }
        }

        var informationLabel: UILabel {
            switch self {
            case .first(let controller): return controller.firstInformationLabel
            case .second(let controller): return controller.secondInformationLabel
            }
        }

        var deleteButton: AnimatableButton {
            switch self {
            case .first(let controller): return controller.firstDeleteButton
            case .second(let controller): return controller.secondDeleteButton
            }
        }

        var index: Int {
            switch self {
            case .first: return 0
            case .second: return 1
            }
        }

        func update(viewState: ViewState) {
            switch self {
            case .first(let controller): controller.viewStates.first = viewState
            case .second(let controller): controller.viewStates.second = viewState
            }
        }

        case first(PhotographViewController)
        case second(PhotographViewController)
    }

    var viewModel: PhotographViewModel!

    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var firstContainerStackView: UIStackView!
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var firstButtonStackView: UIStackView!
    @IBOutlet var firstPhotographButton: AnimatableButton!
    @IBOutlet var firstPhotoAlbumButton: AnimatableButton!
    @IBOutlet var firstSubmitButton: AnimatableButton!
    @IBOutlet var firstInformationLabel: UILabel!
    @IBOutlet var firstDeleteButton: AnimatableButton!

    @IBOutlet var secondContainerStackView: UIStackView!
    @IBOutlet var secondImageView: UIImageView!
    @IBOutlet var secondButtonStackView: UIStackView!
    @IBOutlet var secondPhotographButton: AnimatableButton!
    @IBOutlet var secondPhotoAlbumButton: AnimatableButton!
    @IBOutlet var secondSubmitButton: AnimatableButton!
    @IBOutlet var secondDeleteButton: AnimatableButton!
    @IBOutlet var secondInformationLabel: UILabel!

    var viewStates: PhotographViewModel.ViewStates = (first: .prepare, second: .prepare) {
        willSet {
            update(view: .first(self), for: newValue.first)
            update(view: .second(self), for: newValue.second)
        }
    }

    func update(view: EditingView, for state: ViewState) {
        let containerStackView: UIStackView = view.containerStackView
        let imageView: UIImageView = view.imageView
        let buttonStackView: UIStackView = view.buttonStackView
        let photographButton: AnimatableButton = view.photographButton
        let photoAlbumButton: AnimatableButton = view.photoAlbumButton
        let submitButton: AnimatableButton = view.submitButton
        let informationLabel: UILabel = view.informationLabel
        let deleteButton: AnimatableButton = view.deleteButton
        clean(view: view, for: state)
        switch state {
        case .viewing(let url, let info):
            if let url = url {
                imageView.af.setImage(withURL: url)
            }

            if let info = info {
                informationLabel.text = info
                containerStackView.insertArrangedSubview(informationLabel, at: 1)
            }
        case .prepare:
            buttonStackView.addArrangedSubview(photographButton)
            buttonStackView.addArrangedSubview(photoAlbumButton)
            imageView.image = nil
        case .ready(let image):
            imageView.image = image
            buttonStackView.addArrangedSubview(photographButton)
            buttonStackView.addArrangedSubview(photoAlbumButton)
            buttonStackView.addArrangedSubview(submitButton)
        case .finished(let url, let info):
            imageView.af.setImage(withURL: url)
            informationLabel.text = info
            containerStackView.insertArrangedSubview(informationLabel, at: 1)
            buttonStackView.addArrangedSubview(deleteButton)
        }
    }

    func clean(view: EditingView, for state: ViewState) {
        let containerStackView: UIStackView = view.containerStackView
        let buttonStackView: UIStackView = view.buttonStackView
        let photographButton: AnimatableButton = view.photographButton
        let photoAlbumButton: AnimatableButton = view.photoAlbumButton
        let submitButton: AnimatableButton = view.submitButton
        let informationLabel: UILabel = view.informationLabel
        let deleteButton: AnimatableButton = view.deleteButton
        containerStackView.removeArrangedSubview(informationLabel)
        buttonStackView.removeArrangedSubview(photographButton)
        buttonStackView.removeArrangedSubview(photoAlbumButton)
        buttonStackView.removeArrangedSubview(submitButton)
        buttonStackView.removeArrangedSubview(deleteButton)
        informationLabel.removeFromSuperview()
        photographButton.removeFromSuperview()
        photoAlbumButton.removeFromSuperview()
        submitButton.removeFromSuperview()
        deleteButton.removeFromSuperview()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        keyLabel.text = viewModel.key
        valueLabel.text = viewModel.value
        viewStates = viewModel.viewStates
        viewModel.fetchImages().onSuccess { [weak self] _ in
            guard let self = self else { return }
            `self`.viewStates = `self`.viewModel.viewStates
        }
    }

    @IBAction func firstPhotographTapped(_ sender: AnimatableButton) {
        photographTapped(for: .first(self))
    }

    @IBAction func firstPhotoAlbumTapped(_ sender: AnimatableButton) {
        photoAlbumTapped(for: .first(self))
    }

    @IBAction func firstSubmitTapped(_ sender: AnimatableButton) {
        submitTapped(for: .first(self))
    }

    @IBAction func firstDeleteTapped(_ sender: AnimatableButton) {
        deleteTapped(for: .first(self))
    }

    @IBAction func secondPhotographTapped(_ sender: AnimatableButton) {
        photographTapped(for: .second(self))
    }

    @IBAction func secondPhotoAlbumTapped(_ sender: AnimatableButton) {
        photoAlbumTapped(for: .second(self))
    }

    @IBAction func secondSubmitTapped(_ sender: AnimatableButton) {
        submitTapped(for: .second(self))
    }

    @IBAction func secondDeleteTapped(_ sender: AnimatableButton) {
        deleteTapped(for: .second(self))
    }

    func photographTapped(for editingView: EditingView) {
        let camera = ZLCustomCamera()
        camera.takeDoneBlock = { [weak self] image, videoUrl in
            guard let self = self, let image = image else { return }
            `self`.update(view: editingView, for: .ready(image))
            log.info("image: ", context: image)
            log.info("videoUrl: ", context: videoUrl)
        }
        showDetailViewController(camera, sender: nil)
    }

    func photoAlbumTapped(for editingView: EditingView) {
        let photoPreviewSheet = ZLPhotoPreviewSheet()
        photoPreviewSheet.selectImageBlock = { [weak self] images, assets, isOriginal in
            guard let self = self, let image = images.first else { return }
            `self`.update(view: editingView, for: .ready(image))
            log.info("image: ", context: images)
            log.info("assets: ", context: assets)
            log.info("isOriginal: ", context: isOriginal)
        }
        photoPreviewSheet.showPhotoLibrary(sender: self)
    }

    func deleteTapped(for editingView: EditingView) {
        viewModel.delete(for: editingView.index)
            .onSuccess { result in
                editingView.update(viewState: result)
            }
    }

    func submitTapped(for editingView: EditingView) {
        guard let image = editingView.imageView.image else { return }
        viewModel.upload(image, at: editingView.index).onSuccess { result in
            editingView.update(viewState: result)
        }
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
