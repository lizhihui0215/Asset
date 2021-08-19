// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length



// swiftlint:disable identifier_name line_length type_body_length
internal enum MockerDataSource {
  internal enum AssetDetailByInventoryListResponse {
    public static let data = objectFromJSON(at: "AssetDetailByInventoryListResponse.json")
  }
  internal enum AssetDetailByLocationScanResponse {
    public static let data = objectFromJSON(at: "AssetDetailByLocationScanResponse.json")
  }
  internal enum AssetInventoryListResponse {
    public static let data = objectFromJSON(at: "AssetInventoryListResponse.json")
  }
  internal enum AssetListDetailResponse {
    public static let data = objectFromJSON(at: "AssetListDetailResponse.json")
  }
  internal enum AssetListResponse {
    public static let data = objectFromJSON(at: "AssetListResponse.json")
  }
  internal enum AssetStatusResponse {
    public static let data = objectFromJSON(at: "AssetStatusResponse.json")
  }
  internal enum AssetTaskDetailResponse {
    public static let data = objectFromJSON(at: "AssetTaskDetailResponse.json")
  }
  internal enum AssetTaskInventoryDetailPhotographResponse {
    public static let data = objectFromJSON(at: "AssetTaskInventoryDetailPhotographResponse.json")
  }
  internal enum AssetTaskInventoryListResponse {
    public static let data = objectFromJSON(at: "AssetTaskInventoryListResponse.json")
  }
  internal enum AssetTaskInventoryListScanResponse {
    public static let data = objectFromJSON(at: "AssetTaskInventoryListScanResponse.json")
  }
  internal enum AssetTaskListResponse {
    public static let data = objectFromJSON(at: "AssetTaskListResponse.json")
  }
  internal enum InventoryListDetailSubmitedResponse {
    public static let data = objectFromJSON(at: "InventoryListDetailSubmitedResponse.json")
  }
  internal enum InventoryStatusResponse {
    public static let data = objectFromJSON(at: "InventoryStatusResponse.json")
  }
  internal enum IsLoginResponse {
    public static let data = objectFromJSON(at: "IsLoginResponse.json")
  }
  internal enum LocationDetailResponse {
    public static let data = objectFromJSON(at: "LocationDetailResponse.json")
  }
  internal enum LocationImagesResponse {
    public static let data = objectFromJSON(at: "LocationImagesResponse.json")
  }
  internal enum LocationListResponse {
    public static let data = objectFromJSON(at: "LocationListResponse.json")
  }
  internal enum LoginResponse {
    public static let data = objectFromJSON(at: "LoginResponse.json")
  }
  internal enum PhotographUploadResponse {
    public static let data = objectFromJSON(at: "PhotographUploadResponse.json")
  }
  internal enum PrincipalStaffListResponse {
    public static let data = objectFromJSON(at: "PrincipalStaffListResponse.json")
  }
  internal enum TransformAssetListResponse {
    public static let data = objectFromJSON(at: "TransformAssetListResponse.json")
  }
  internal enum TransformDetailResponse {
    public static let data = objectFromJSON(at: "TransformDetailResponse.json")
  }
  internal enum TransformListResponse {
    public static let data = objectFromJSON(at: "TransformListResponse.json")
  }
  internal enum TransformListResponseCopy {
    public static let data = objectFromJSON(at: "TransformListResponsecopy.json")
  }
  internal enum UpdateLocationResponse {
    public static let data = objectFromJSON(at: "UpdateLocationResponse.json")
  }
  internal enum UserStaffListResponse {
    public static let data = objectFromJSON(at: "UserStaffListResponse.json")
  }
  internal enum VersionCheckResponse {
    public static let data = objectFromJSON(at: "VersionCheckResponse.json")
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
