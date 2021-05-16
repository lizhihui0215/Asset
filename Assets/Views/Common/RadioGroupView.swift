//
//  RadioGroupView.swift
//  Assets
//
//  Created by lizhihui on 2021/4/21.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class RadioButtonStack: UIStackView {
    init(title: String) {
        super.init(frame: .zero)
        let label = UILabel()
        label.textColor = XCAssets.Colors.primaryTextColor.color
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = title
        let radioButton = RadioButton()
        addArrangedSubview(radioButton)
        radioButton.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentHuggingPriority(.required, for: .horizontal)
        addArrangedSubview(label)
        spacing = 10
        axis = .horizontal
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }

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
        initViews()
    }

    init() {
        super.init(frame: .zero)
        initViews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func initViews() {
        setImage(XCAssets.Assets.Common.Checkbox.selected.image, for: .selected)
        setImage(XCAssets.Assets.Common.Checkbox.unselected.image, for: .normal)
        addTarget(self, action: #selector(buttonTapped), for: .touchDown)
    }

    @objc func buttonTapped(sender: RadioButton) {
        isSelected = !isSelected
    }
}

@IBDesignable
class RadioGroupView: UIView {
    typealias DidSelectedAction = (Int) -> Void
    var radioButtonStacks: [RadioButtonStack]!
    var containerStackView: UIStackView!
    var titles = ["", ""]

    var selectedIndex: Int {
        get {
            guard let index = radioButtonStacks.firstIndex(where: { $0.button.isSelected }) else { return 0 }

            return index
        }
        set {
            selectedRadioButton(at: newValue)
        }
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
        configurationTitles()
    }

    init(titles: String ...) {
        super.init(frame: .zero)
        heightAnchor ~ 40
        self.titles = titles
        initViews()
        configurationTitles()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    func initViews() {
        radioButtonStacks = titles.map { [weak self] in
            let radioButtonStack = RadioButtonStack(title: $0)
            radioButtonStack.button.addTarget(self, action: #selector(radioButtonTapped(_:)), for: .touchUpInside)
            return radioButtonStack
        }
        containerStackView = UIStackView(arrangedSubviews: radioButtonStacks)
        containerStackView.axis = .horizontal
        containerStackView.distribution = .fill
        addSubview(containerStackView)
        addLayoutConstraints()
    }

    func addLayoutConstraints() {
        containerStackView.leadingAnchor ~ leadingAnchor
        containerStackView.trailingAnchor ~ trailingAnchor
        containerStackView.topAnchor ~ topAnchor
        containerStackView.bottomAnchor ~ bottomAnchor
    }

    func configurationTitles() {
        radioButtonStacks.first?.button.isSelected = true
        for (index, radioButtonStack) in radioButtonStacks.enumerated() {
            guard index < titles.count else { break }
            let title = titles[index]
            radioButtonStack.label.text = title
        }
        containerStackView.spacing = spacing
    }

    @objc func radioButtonTapped(_ sender: RadioButton) {
        guard sender.isSelected else {
            radioButtonStacks.first?.button.isSelected = true
            guard let action = selectedAction, let index = index(of: sender) else { return }
            action(index)
            return
        }

        for radioButtonStack in radioButtonStacks where sender != radioButtonStack.button {
            radioButtonStack.button.isSelected = false
        }

        guard let action = selectedAction, let index = index(of: sender) else { return }
        action(index)
    }

    func selectedRadioButton(at index: Int) {
        let selectedRadioButton = radioButtonStacks[index].button
        selectedRadioButton.buttonTapped(sender: selectedRadioButton)
        radioButtonTapped(selectedRadioButton)
    }

    func index(of selected: RadioButton) -> Int? {
        guard let index = radioButtonStacks.firstIndex(where: { $0.button == selected }) else {
            return nil
        }

        return index
    }

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        initViews()
        configurationTitles()
    }
}
