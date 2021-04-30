// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length



// swiftlint:disable identifier_name line_length type_body_length
internal enum MockerDataSource {
  internal enum AssetInventoryListResponse {
    public static let data = objectFromJSON(at: "AssetInventoryListResponse.json")
  }
  internal enum LocationDetailResponse {
    public static let data = objectFromJSON(at: "LocationDetailResponse.json")
  }
  internal enum LocationListResponse {
    public static let data = objectFromJSON(at: "LocationListResponse.json")
  }
  internal enum LoginResponse {
    public static let data = objectFromJSON(at: "LoginResponse.json")
  }
  internal enum UpdateLocationCoordinateResponse {
    public static let data = objectFromJSON(at: "UpdateLocationCoordinateResponse.json")
  }
}

// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

private func objectFromJSON(at path: String) -> Data {
  guard let url = BundleToken.bundle.url(forResource: path, withExtension: nil),
    let data = try? Data(contentsOf: url) else {
    fatalError("Unable to load JSON at path: \(path)")
  }
  return data
}


// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
