//
//  Created by Jake Lin on 11/19/15.
//  Copyright © 2015 IBAnimatable. All rights reserved.
//

import UIKit

@IBDesignable
open class AnimatableTextView: UITextView, CornerDesignable, FillDesignable, BorderDesignable, Animatable, PlaceholderDesignable {
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

    // MARK: - PlaceholderDesignable

    @IBInspectable open var placeholderText: String? {
        didSet {
            placeholderLabel.text = placeholderText
        }
    }

    @IBInspectable open var placeholderColor: UIColor? {
        didSet {
            placeholderLabel.textColor = placeholderColor
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

    // MARK: Override properties

    override open var font: UIFont! {
        didSet {
            placeholderLabel.font = font
        }
    }

    override open var textAlignment: NSTextAlignment {
        didSet {
            placeholderLabel.textAlignment = textAlignment
        }
    }

    override open var text: String! {
        didSet {
            textDidChange()
        }
    }

    override open var attributedText: NSAttributedString! {
        didSet {
            textDidChange()
        }
    }

    override open var textContainerInset: UIEdgeInsets {
        didSet {
            update(placeholderLabel, using: &placeholderLabelConstraints)
        }
    }

    // MARK: Private properties

    fileprivate let placeholderLabel = UILabel()
    fileprivate var placeholderLabelConstraints = [NSLayoutConstraint]()

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

    deinit {
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: nil)
    }

    // MARK: - Private

    private func configureInspectableProperties() {
        configureAnimatableProperties()
        configure(placeholderLabel: placeholderLabel, placeholderLabelConstraints: &placeholderLabelConstraints)
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }

    @objc
    private func textDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }

    private func configureAfterLayoutSubviews() {
        configureCornerRadius()
        configureBorder()
        placeholderLabel.preferredMaxLayoutWidth = textContainer.size.width - textContainer.lineFragmentPadding * 2.0
    }
}
