
//
//  File.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/16.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

public struct AEMExtension<ExtendedType> {
    /// Stores the type or meta-type of any extended type.
    public private(set) var type: ExtendedType

    /// Create an instance from the provided value.
    ///
    /// - Parameter type: Instance being extended.
    public init(_ type: ExtendedType) {
        self.type = type
    }
}

/// Protocol describing the `af` extension points for AEM extended types.
public protocol AEMExtended {
    /// Type being extended.
    associatedtype ExtendedType

    /// Static AEM extension point.
    static var aem: AEMExtension<ExtendedType>.Type { get set }
    /// Instance AEM extension point.
    var aem: AEMExtension<ExtendedType> { get set }
}

extension AEMExtended {
    /// Static AEM extension point.
    public static var aem: AEMExtension<Self>.Type {
        get { AEMExtension<Self>.self }
        set {}
    }

    /// Instance AEM extension point.
    public var aem: AEMExtension<Self> {
        get { AEMExtension(self) }
        set {}
    }
}
