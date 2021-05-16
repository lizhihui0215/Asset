//
//  Created by Tom Baranes on 25/06/16.
//  Copyright © 2016 IBAnimatable. All rights reserved.
//

import UIKit

@IBDesignable
open class AnimatableSlider: UISlider, SliderImagesDesignable, BorderDesignable, RotationDesignable, ShadowDesignable, Animatable {
    // MARK: - SliderImagesDesignable

    @IBInspectable open var thumbImage: UIImage? {
        didSet {
            configureThumbImage()
        }
    }

    @IBInspectable open var thumbHighlightedImage: UIImage? {
        didSet {
            configureThumbImage()
        }
    }

    @IBInspectable open var minimumTrackImage: UIImage? {
        didSet {
            configureMinimumTrackImage()
        }
    }

    @IBInspectable open var minimumTrackHighlightedImage: UIImage? {
        didSet {
            configureMinimumTrackImage()
        }
    }

    @IBInspectable open var maximumTrackImage: UIImage? {
        didSet {
            configureMaximumTrackImage()
        }
    }

    @IBInspectable open var maximumTrackHighlightedImage: UIImage? {
        didSet {
            configureMaximumTrackImage()
        }
    }

    // MARK: - BorderDesignable

    open var borderType: BorderType = .solid {
        didSet {
            configureBorder()
        }
    }

    @IBInspectable var _borderType: String? {
        didSet {
            borderType = BorderType(string: _borderType)
        }
    }

    @IBInspectable open var borderColor: UIColor? {
        didSet {
            configureBorder()
        }
    }
    
    /**
     The color of the border when it has content.

     This property applies a color to the lower edge of the control. The default value for this property is a clear color.
     */
    @IBInspectable open var activeColor: UIColor? {
        didSet {
            configureBorder()
        }
    }

    @IBInspectable open var borderWidth = CGFloat.nan {
        didSet {
            configureBorder()
        }
    }

    open var borderSides: BorderSides = .AllSides {
        didSet {
            configureBorder()
        }
    }

    @IBInspectable var _borderSides: String? {
        didSet {
            borderSides = BorderSides(rawValue: _borderSides)
        }
    }

    // MARK: - RotationDesignable

    @IBInspectable open var rotate = CGFloat.nan {
        didSet {
            configureRotate()
        }
    }

    // MARK: - ShadowDesignable

    @IBInspectable open var shadowColor: UIColor? {
        didSet {
            configureShadowColor()
        }
    }

    @IBInspectable open var shadowRadius = CGFloat.nan {
        didSet {
            configureShadowRadius()
        }
    }

    @IBInspectable open var shadowOpacity = CGFloat.nan {
        didSet {
            configureShadowOpacity()
        }
    }

    @IBInspectable open var shadowOffset = CGPoint(x: CGFloat.nan, y: CGFloat.nan) {
        didSet {
            configureShadowOffset()
        }
    }

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

    // MARK: - Lifecycle

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        configureInspectableProperties()
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        configureInspectableProperties()
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        configureAfterLayoutSubviews()
        autoRunAnimation()
    }

    // MARK: - Private

    fileprivate func configureInspectableProperties() {
        configureAnimatableProperties()
    }

    fileprivate func configureAfterLayoutSubviews() {
        configureBorder()
    }
}
