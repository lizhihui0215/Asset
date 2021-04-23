//
//  ServiceViewController.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class ServiceViewController: BaseViewController {
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
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }

    override open func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        super.shouldPerformSegue(withIdentifier: identifier, sender: sender)
    }
}

extension ServiceViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3.0
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
