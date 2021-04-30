//
// Created by lizhihui on 2021/4/28.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

private var AssociationObjectKey: UInt8 = 0

public final class ObjectAssociation<T: AnyObject> {
    private var policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC

    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        self.policy = policy
    }

    public subscript(index: AnyObject) -> T? {
        get {
            // swiftlint:disable:next force_cast
            objc_getAssociatedObject(index, &AssociationObjectKey) as! T?
        }
        set {
            objc_setAssociatedObject(index, &AssociationObjectKey, newValue, policy)
        }
    }
}
