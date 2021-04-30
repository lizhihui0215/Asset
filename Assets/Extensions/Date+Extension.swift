//
//  Date+Extension.swift
//  Siren
//
//  Created by ZhiHui.Li on 2021/4/18.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

// `Date` Extension for Siren.
extension Date {
    /// The amount of days passed from a specific source date.
    ///
    /// - Parameter date: The source date.
    /// - Returns: The amount of days passed since the source date.
    static func days(since date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date, to: Date())
        return components.day ?? 0
    }

    /// The amount of days passed from a specific source date string.
    ///
    /// - Parameters:
    ///   - dateString: The source date string.
    /// - Returns: The amount of days passed since the source date.
    static func days(since dateString: String) -> Int? {
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "en_US_POSIX")
        dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateformatter.timeZone = TimeZone(secondsFromGMT: 0)

        guard let date = dateformatter.date(from: dateString) else {
            return nil
        }

        return days(since: date)
    }
}
