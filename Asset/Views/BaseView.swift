//
//  BaseView.swift
//  Asset
//
//  Created by lizhihui on 2021/4/21.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class BaseView: UIView {}

class NibView: BaseView {
    var contentView: UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupContentView()
    }

    func setupContentView() {
        contentView = loadNib()
        addSubview(contentView!)
        contentView?.fillSuperview()
    }

    func loadNib() -> UIView {
        let typeOfSelf = type(of: self)
        guard let nibName = String(describing: typeOfSelf).components(separatedBy: ".").last else {
            return UIView()
        }

        let bundle = Bundle(for: typeOfSelf)
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return UIView()
        }

        return view
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupContentView()
    }
}
