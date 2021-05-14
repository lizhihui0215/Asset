//
//  RadioGroupView.swift
//  Assets
//
//  Created by lizhihui on 2021/4/21.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class RadioButtonStack: UIStackView {
    var button: RadioButton {
        // swiftlint:disable:next force_cast
        arrangedSubviews.first as! RadioButton
    }

    var label: UILabel {
        // swiftlint:disable:next force_cast
        arrangedSubviews.last as! UILabel
    }
}

class RadioButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        addTarget(self, action: #selector(buttonTapped), for: .allEvents)
    }

    @objc func buttonTapped(sender: RadioButton) {
        isSelected = !isSelected
    }
}

@IBDesignable
class RadioGroupView: NibView {
    typealias DidSelectedAction = (Int) -> Void
    @IBOutlet var radioButtonStacks: [RadioButtonStack]!
    @IBOutlet var containerStackView: UIStackView!
    var titles = [String]()

    var selectedIndex: Int {
        guard let index = radioButtonStacks.firstIndex(where: { $0.button.isSelected }) else { return 0 }

        return index
    }

    var selectedAction: DidSelectedAction?

    @IBInspectable open var texts: String? {
        didSet {
            guard let titleString = texts, !titleString.isEmpty else {
                return
            }

            titles = titleString.split(separator: ",").map(String.init)
        }
    }

    @IBInspectable open var spacing: CGFloat = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        initViews()
    }

    func initViews() {
        radioButtonStacks.first?.button.isSelected = true
        for (index, radioButtonStack) in radioButtonStacks.enumerated() {
            guard index < titles.count else { break }
            let title = titles[index]
            radioButtonStack.label.text = title
        }
        containerStackView.spacing = spacing
    }

    @IBAction func radioButtonTapped(_ sender: RadioButton) {
        for radioButtonStack in radioButtonStacks where sender != radioButtonStack.button {
            radioButtonStack.button.isSelected = !radioButtonStack.button.isSelected
        }

        guard let action = selectedAction,
              let index = radioButtonStacks.firstIndex(where: { $0.button == sender })
        else {
            return
        }

        action(index)
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initViews()
        radioButtonStacks.first?.button.isSelected = true
    }
}
