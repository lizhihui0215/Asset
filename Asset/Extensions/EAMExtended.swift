//
//  File.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/16.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

public struct EAMExtension<ExtendedType> {
    /// Stores the type or meta-type of any extended type.
    public private(set) var type: ExtendedType

    /// Create an instance from the provided value.
    ///
    /// - Parameter type: Instance being extended.
    public init(_ type: ExtendedType) {
        self.type = type
    }
}

/// Protocol describing the `af` extension points for EAM extended types.
public protocol EAMExtended {
    /// Type being extended.
    associatedtype ExtendedType

    /// Static EAM extension point.
    static var eam: EAMExtension<ExtendedType>.Type { get set }
    /// Instance EAM extension point.
    var eam: EAMExtension<ExtendedType> { get set }
}

public extension EAMExtended {
    /// Static EAM extension point.
    static var eam: EAMExtension<Self>.Type {
        get { EAMExtension<Self>.self }
        set {}
    }

    /// Instance EAM extension point.
    var eam: EAMExtension<Self> {
        get { EAMExtension(self) }
        set {}
    }
}

public extension EAMExtension where ExtendedType: Encodable {
    var jsonString: String {
        guard let content = try? JSONEncoder().encode(type) else {
            return ""
        }

        return String(data: content, encoding: .utf8) ?? ""
    }
}
