//
//  Model.swift
//  Siren
//
//  Created by ZhiHui.Li on 2021/4/18.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

/// The validated and unwrapped `APIModel`.
/// This model is presented to the end user in Siren's completion handler.
public struct Model {
    /// The release date for the latest version of the app.
    public let currentVersionReleaseDate: String?

    /// The minimum version of iOS that the current version of the app requires.
    public let minimumOSVersion: String

    /// The releases notes from the latest version of the app.
    public let releaseNotes: String?
    
    public let mainfestPlist: String

    /// The latest version of the app.
    public let version: String
}
