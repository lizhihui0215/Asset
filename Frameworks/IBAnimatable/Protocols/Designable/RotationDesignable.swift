//
//  Created by Jake Lin on 12/5/15.
//  Copyright © 2015 IBAnimatable. All rights reserved.
//

import Darwin
import UIKit

/**
 It is not able to preview the rotation in IB.
 */
public protocol RotationDesignable: AnyObject {
    var rotate: CGFloat { get set }
}

// MARK: - UIView

public extension RotationDesignable where Self: UIView {
    func configureRotate() {
        configureRotate(in: self)
    }
}

// MARK: - Common

extension RotationDesignable {
    func configureRotate(in view: UIView) {
        if !rotate.isNaN, rotate > -360, rotate < 360 {
            view.transform = CGAffineTransform(rotationAngle: .pi * rotate / 180)
        }
    }
}
