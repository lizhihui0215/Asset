//
//  ServiceViewController.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class ServiceViewController: BaseViewController {
    enum Constants {
        static let column = 3
    }

    @IBOutlet var collectionView: UICollectionView!

    lazy var viewModel: ServiceViewModel = {
        ServiceViewModel(request: ServiceRequest(), action: self)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ServiceViewController {
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {}

    override open func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let segue = StoryboardSegue.Service(rawValue: identifier) else { return false }

        guard let cell: ServiceCollectionViewCell = segue.associatedCollectionViewCell(from: sender) else { return false }

        guard cell.service.isInDevelopment else { return true }

        alert(message: L10n.service.error.inDevelopment.message)

        return false
    }
}

extension ServiceViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / CGFloat(Constants.column)
        return CGSize(width: width, height: width)
    }
}

extension ServiceViewController: UICollectionViewDelegate {}

extension ServiceViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let serviceCell: ServiceCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath) else {
            return UICollectionViewCell()
        }

        let viewModel = self.viewModel.serviceViewModelAt(indexPath: indexPath)

        serviceCell.configurationCell(with: viewModel)

        return serviceCell
    }
}
