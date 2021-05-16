//
//  Created by Tom Baranes on 28/06/16.
//  Copyright © 2015 IBAnimatable. All rights reserved.
//

import UIKit

@IBDesignable
open class AnimatableScrollView: UIScrollView, CornerDesignable, FillDesignable, BorderDesignable,
    RotationDesignable, ShadowDesignable, BlurDesignable,
    TintDesignable, GradientDesignable, MaskDesignable,
    Animatable
{
    // MARK: - CornerDesignable

    @IBInspectable open var cornerRadius = CGFloat.nan {
        didSet {
            configureCornerRadius()
        }
    }

    open var cornerSides: CornerSides = .allSides {
        didSet {
            configureCornerRadius()
        }
    }

    @IBInspectable var _cornerSides: String? {
        didSet {
            cornerSides = CornerSides(rawValue: _cornerSides)
        }
    }

    // MARK: - FillDesignable

    @IBInspectable open var fillColor: UIColor? {
        didSet {
            configureFillColor()
        }
    }

    open var predefinedColor: ColorType? {
        didSet {
            configureFillColor()
        }
    }

    @IBInspectable var _predefinedColor: String? {
        didSet {
            predefinedColor = ColorType(string: _predefinedColor)
        }
    }

    @IBInspectable open var opacity = CGFloat.nan {
        didSet {
            configureOpacity()
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

    // MARK: - BlurDesignable

    open var blurEffectStyle: UIBlurEffect.Style? {
        didSet {
            configureBlurEffectStyle()
        }
    }

    @IBInspectable var _blurEffectStyle: String? {
        didSet {
            blurEffectStyle = UIBlurEffect.Style(string: _blurEffectStyle)
        }
    }

    open var vibrancyEffectStyle: UIBlurEffect.Style? {
        didSet {
            configureBlurEffectStyle()
        }
    }

    @IBInspectable var _vibrancyEffectStyle: String? {
        didSet {
            vibrancyEffectStyle = UIBlurEffect.Style(string: _vibrancyEffectStyle)
        }
    }

    @IBInspectable open var blurOpacity = CGFloat.nan {
        didSet {
            configureBlurEffectStyle()
        }
    }

    // MARK: - TintDesignable

    @IBInspectable open var tintOpacity = CGFloat.nan
    @IBInspectable open var shadeOpacity = CGFloat.nan
    @IBInspectable open var toneColor: UIColor?
    @IBInspectable open var toneOpacity = CGFloat.nan

    // MARK: - GradientDesignable

    open var gradientMode: GradientMode = .linear
    @IBInspectable var _gradientMode: String? {
        didSet {
            gradientMode = GradientMode(string: _gradientMode) ?? .linear
        }
    }

    @IBInspectable open var startColor: UIColor?
    @IBInspectable open var endColor: UIColor?
    open var predefinedGradient: GradientType?
    @IBInspectable var _predefinedGradient: String? {
        didSet {
            predefinedGradient = GradientType(string: _predefinedGradient)
        }
    }

    open var startPoint: GradientStartPoint = .top
    @IBInspectable var _startPoint: String? {
        didSet {
            startPoint = GradientStartPoint(string: _startPoint, default: .top)
        }
    }

    // MARK: - MaskDesignable

    open var maskType: MaskType = .none {
        didSet {
            configureMask(previousMaskType: oldValue)
            configureBorder()
        }
    }

    /// The mask type used in Interface Builder. **Should not** use this property in code.
    @IBInspectable var _maskType: String? {
        didSet {
            maskType = MaskType(string: _maskType)
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
        configureTintedColor()
    }

    fileprivate func configureAfterLayoutSubviews() {
        configureMask(previousMaskType: maskType)
        configureCornerRadius()
        configureBorder()
        configureGradient()
    }
}
