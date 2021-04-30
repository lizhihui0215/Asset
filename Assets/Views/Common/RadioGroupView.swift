//
//  RadioGroupView.swift
//  Assets
//
//  Created by lizhihui on 2021/4/21.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

class RadioButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        addTarget(self, action: #selector(buttonTapped), for: .allEvents)
    }

    @objc func buttonTapped(sender: RadioButton) {
        isSelected = !isSelected
    }
}

// @IBDesignable
class RadioGroupView: NibView {
    @IBOutlet var radioButtons: [RadioButton]!

    override func awakeFromNib() {
        super.awakeFromNib()
        radioButtons.first?.isSelected = true
    }

    @IBAction func radioButtonTapped(_ sender: RadioButton) {
        for radioButton in radioButtons where sender != radioButton {
            radioButton.isSelected = !sender.isSelected
        }
    }
}
