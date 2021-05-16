//
//  Created by Jake Lin on 12/16/15.
//  Copyright © 2015 IBAnimatable. All rights reserved.
//

import UIKit

@IBDesignable
open class AnimatableBarButtonItem: UIBarButtonItem, BarButtonItemDesignable, Animatable {
    // MARK: - BarButtonItemDesignable

    @IBInspectable open var roundedImage: UIImage?

    // MARK: - Lifecycle

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureInspectableProperties()
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        configureInspectableProperties()
    }

    // TODO: animations
    //  public override func layoutSubviews() {
//    super.layoutSubviews()
//
//    autoRunAnimation()
    //  }

    // MARK: - Animatable

    open var animationType: AnimationType = .none
    @IBInspectable var _animationType: String? {
        didSet {
            animationType = AnimationType(string: _animationType)
        }
    }

    @IBInspectable open var autoRun: Bool = true
    @IBInspectable open var duration = Double.nan
    @IBInspectable open var delay = Double.nan
    @IBInspectable open var damping = CGFloat.nan
    @IBInspectable open var velocity = CGFloat.nan
    @IBInspectable open var force = CGFloat.nan
    @IBInspectable var _timingFunction: String = "" {
        didSet {
            timingFunction = TimingFunctionType(string: _timingFunction)
        }
    }

    open var timingFunction: TimingFunctionType = .none

    // MARK: - Private

    fileprivate func configureInspectableProperties() {
        configureBarButtonItemImage()
    }
}
