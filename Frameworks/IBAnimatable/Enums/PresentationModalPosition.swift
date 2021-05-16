//
//  Created by Tom Baranes on 17/07/16.
//  Copyright © 2016 Jake Lin. All rights reserved.
//

import UIKit

public enum PresentationModalPosition: IBEnum {
    case center
    case topCenter
    case bottomCenter
    case leftCenter
    case rightCenter
    case customCenter(centerPoint: CGPoint)
    case customOrigin(origin: CGPoint)

    func modalCenter(in containerFrame: CGRect, modalSize: CGSize) -> CGPoint? {
        let xCenter = containerFrame.origin.x + (containerFrame.width / 2)
        let yCenter = containerFrame.origin.y + (containerFrame.height / 2)
        switch self {
        case .center:
            return CGPoint(x: xCenter, y: yCenter)
        case .topCenter:
            return CGPoint(x: xCenter, y: containerFrame.minY + (modalSize.height / 2))
        case .bottomCenter:
            return CGPoint(x: xCenter, y: containerFrame.maxY - (modalSize.height / 2))
        case .leftCenter:
            return CGPoint(x: containerFrame.minX + (modalSize.width / 2), y: yCenter)
        case .rightCenter:
            return CGPoint(x: containerFrame.maxX - (modalSize.width / 2), y: yCenter)
        case .customCenter(let point):
            return point
        case .customOrigin:
            return nil
        }
    }

    func calculateOrigin() -> CGPoint? {
        switch self {
        case .customOrigin(let origin):
            return origin
        default:
            return nil
        }
    }
}

public extension PresentationModalPosition {
    /**
     Initializes a swift `PresentationModalPosition` with provided optional string

     - Parameter string: The optional string to be converted into `PresnetationModalPosition`.
     */
    init(string: String?) {
        guard let string = string else {
            self = .center
            return
        }

        guard let (name, params) = string.extractNameAndParams() else {
            self = .center
            return
        }

        let point = CGPoint(x: params.toDouble(0) ?? 0, y: params.toDouble(1) ?? 0)

        switch name {
        case "center":
            self = .center
        case "topcenter":
            self = .topCenter
        case "bottomcenter":
            self = .bottomCenter
        case "leftcenter":
            self = .leftCenter
        case "rightcenter":
            self = .rightCenter
        case "customcenter" where params.count > 2:
            self = .customCenter(centerPoint: point)
        case "customorigin" where params.count > 2:
            self = .customOrigin(origin: point)
        default:
            self = .center
        }
    }
}
