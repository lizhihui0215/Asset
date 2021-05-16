//
//  IB.swift
//  IBAnimatableApp
//
//  Created by Tom Baranes on 17/01/2018.
//  Copyright © 2018 IBAnimatable. All rights reserved.
//

import Foundation
import UIKit

public final class IB: NSObject, CornerDesignable, FillDesignable, BorderDesignable,
    RotationDesignable, ShadowDesignable, BlurDesignable,
    GradientDesignable, MaskDesignable
{
    private let view: UIView

    // MARK: Life cycle

    fileprivate init(view: UIView) {
        self.view = view
        super.init()
    }

    public func reload() {
        configureMask(in: view, previousMaskType: maskType)
        configureCornerRadius(in: view)
        configureBorder(in: view)
        configureMaskShadow(in: view)
    }

    // MARK: - CornerDesignable

    public var cornerRadius = CGFloat.nan {
        didSet {
            configureCornerRadius(in: view)
        }
    }

    public var cornerSides: CornerSides = .allSides {
        didSet {
            configureCornerRadius(in: view)
        }
    }

    // MARK: - FillDesignable

    public var fillColor: UIColor? {
        didSet {
            configureFillColor(in: view)
        }
    }

    public var predefinedColor: ColorType? {
        didSet {
            configureFillColor(in: view)
        }
    }

    public var opacity = CGFloat.nan {
        didSet {
            configureOpacity(in: view)
        }
    }

    // MARK: - BorderDesignable

    public var borderType: BorderType = .solid {
        didSet {
            configureBorder(in: view)
        }
    }

    public var borderColor: UIColor? {
        didSet {
            configureBorder(in: view)
        }
    }
    
    /**
     The color of the border when it has content.

     This property applies a color to the lower edge of the control. The default value for this property is a clear color.
     */
    public var activeColor: UIColor? {
        didSet {
            configureBorder(in: view)
        }
    }

    public var borderWidth = CGFloat.nan {
        didSet {
            configureBorder(in: view)
        }
    }

    public var borderSides: BorderSides = .AllSides {
        didSet {
            configureBorder(in: view)
        }
    }

    // MARK: - RotationDesignable

    public var rotate = CGFloat.nan {
        didSet {
            configureRotate(in: view)
        }
    }

    // MARK: - ShadowDesignable

    public var shadowColor: UIColor? {
        didSet {
            configureShadowColor(in: view)
        }
    }

    public var shadowRadius = CGFloat.nan {
        didSet {
            configureShadowRadius(in: view)
        }
    }

    public var shadowOpacity = CGFloat.nan {
        didSet {
            configureShadowOpacity(in: view)
        }
    }

    public var shadowOffset = CGPoint(x: CGFloat.nan, y: CGFloat.nan) {
        didSet {
            configureShadowOffset(in: view)
        }
    }

    // MARK: - BlurDesignable

    public var blurEffectStyle: UIBlurEffect.Style? {
        didSet {
            configureBlurEffectStyle(in: view)
        }
    }

    public var vibrancyEffectStyle: UIBlurEffect.Style? {
        didSet {
            configureBlurEffectStyle(in: view)
        }
    }

    public var blurOpacity = CGFloat.nan {
        didSet {
            configureBlurEffectStyle(in: view)
        }
    }

    // MARK: - GradientDesignable

    public var gradientMode: GradientMode = .linear {
        didSet {
            configureGradient(in: view)
        }
    }

    public var startColor: UIColor? {
        didSet {
            configureGradient(in: view)
        }
    }

    public var endColor: UIColor? {
        didSet {
            configureGradient(in: view)
        }
    }

    public var predefinedGradient: GradientType? {
        didSet {
            configureGradient(in: view)
        }
    }

    public var startPoint: GradientStartPoint = .top {
        didSet {
            configureGradient(in: view)
        }
    }

    // MARK: - MaskDesignable

    public var maskType: MaskType = .none {
        didSet {
            configureMask(in: view, previousMaskType: oldValue)
            configureBorder(in: view)
            configureMaskShadow(in: view)
        }
    }
}

// MARK: -

private enum AssociatedKeys {
    static var ib = "IBAnimatable"
}

public extension UIView {
    var ib: IB {
        get {
            var ibValue = objc_getAssociatedObject(self, &AssociatedKeys.ib) as? IB
            if ibValue == nil {
                ibValue = IB(view: self)
                self.ib = ibValue!
            }
            return ibValue!
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ib, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
