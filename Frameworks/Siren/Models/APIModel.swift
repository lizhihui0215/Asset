//
//  APIModel.swift
//  Siren
//
//  Created by ZhiHui.Li on 2021/4/18.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

/// Model representing a selection of results from the iTunes Lookup API.
struct APIModel: Decodable {

    /// The array of results objects from the iTunes Lookup API.
    let results: Results
   
   init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: Results.CodingKeys.self)
      
      let appID = try container.decode(Int.self, forKey: .appID)
      let currentVersionReleaseDate = try? container.decode(String.self, forKey: .currentVersionReleaseDate)
      let minimumOSVersion = try? container.decode(String.self, forKey: .minimumOSVersion)
      let releaseNotes = try? container.decode(String.self, forKey: .releaseNotes)
      let version = try? container.decode(String.self, forKey: .version)
      let mainfestPlist = try? container.decode(String.self, forKey: .mainfestPlist)

      
      results = Results(appID: appID,
                        currentVersionReleaseDate: currentVersionReleaseDate,
                        minimumOSVersion: minimumOSVersion ?? "",
                        releaseNotes: releaseNotes,
                        version: version ?? "",
                        mainfestPlist: mainfestPlist ?? "")
   }

    /// The Results object from the the iTunes Lookup API.
    struct Results: Decodable {
        ///  Codable Coding Keys for the Results array in the iTunes Lookup API JSON response.
      enum CodingKeys: String, CodingKey {
            /// The appID JSON key.
            case appID = "appId"
            /// The current version release date JSON key.
            case currentVersionReleaseDate
            /// The minimum device iOS version compatibility JSON key.
            case minimumOSVersion = "minimumOsVersion"
            /// The release notes JSON key.
            case releaseNotes
            /// The current App Store version JSON key.
            case version
            /// The mainfest plist file for download the app
            case mainfestPlist
        }

        /// The app's App ID.
        let appID: Int

        /// The release date for the latest version of the app.
        let currentVersionReleaseDate: String?

        /// The minimum version of iOS that the current version of the app requires.
        let minimumOSVersion: String

        /// The releases notes from the latest version of the app.
        let releaseNotes: String?

        /// The latest version of the app.
        let version: String
        
        /// The mainfest plist file for download the app
        let mainfestPlist: String
        
    }
}
