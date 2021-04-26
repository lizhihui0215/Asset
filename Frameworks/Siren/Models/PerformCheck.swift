//
//  PerformCheck.swift
//  Siren
//
//  Created by ZhiHui.Li on 2021/4/18.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

/// The type of check to perform when Siren's `wail` method is performed.
///
/// - Note: Alert presentation will still respct the settings that are set
///   for `UpdatePromptFrequency` and `showAlertAfterCurrentVersionHasBeenReleasedForDays`
public enum PerformCheck {
    /// Performs a version check only when Siren's `wail` method is called,
    /// as the `UIApplication.didBecomeActiveNotification` is ignored.
    case onDemand

    /// (DEFAULT) Perform a version check whenever the app enters the foreground.
    /// This value must be set when Siren's `wail` method is called to enable the
    /// `UIApplication.didBecomeActiveNotification` observer.
    case onForeground
}
