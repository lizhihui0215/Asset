// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Image {
  internal enum Backup {
    internal static let iconBusinessOff = ImageAsset(name: "icon_business_off")
    internal static let iconBusinessOn = ImageAsset(name: "icon_business_on")
    internal static let intoline = ImageAsset(name: "intoline")
    internal static let locationEd = ImageAsset(name: "location_ed")
  }
  internal enum Common {
    internal enum Checkbox {
      internal static let selected = ImageAsset(name: "selected")
      internal static let unselected = ImageAsset(name: "unselected")
    }
    internal static let refresh = ImageAsset(name: "refresh")
    internal static let search = ImageAsset(name: "search")
  }
  internal enum LaunchScreen {
    internal static let `default` = ImageAsset(name: "Default")
  }
  internal enum Login {
    internal static let passwordIcon = ImageAsset(name: "passwordIcon")
    internal static let usernameIcon = ImageAsset(name: "usernameIcon")
  }
  internal enum Mine {
    internal static let key = ImageAsset(name: "key")
    internal static let profile = ImageAsset(name: "profile")
    internal static let searchnew = ImageAsset(name: "searchnew")
  }
  internal enum Service {
    internal enum LocationList {
      internal static let cellBackgroundImage = ImageAsset(name: "cellBackgroundImage")
    }
    internal static let assetInspection = ImageAsset(name: "assetInspection")
    internal static let assetInventory = ImageAsset(name: "assetInventory")
    internal static let baseData = ImageAsset(name: "baseData")
    internal static let companyTransfer = ImageAsset(name: "companyTransfer")
    internal static let cycleInventory = ImageAsset(name: "cycleInventory")
    internal static let externalDepartmentTransfer = ImageAsset(name: "externalDepartmentTransfer")
    internal static let internalDepartmentTransfer = ImageAsset(name: "internalDepartmentTransfer")
    internal static let location = ImageAsset(name: "location")
    internal static let locationModify = ImageAsset(name: "locationModify")
    internal static let notification = ImageAsset(name: "notification")
    internal static let projectTransfer = ImageAsset(name: "projectTransfer")
  }
  internal enum Tab {
    internal static let grzc = ImageAsset(name: "grzc")
    internal static let grzcBlue = ImageAsset(name: "grzc_blue")
    internal static let grzx = ImageAsset(name: "grzx")
    internal static let grzxBlue = ImageAsset(name: "grzx_blue")
    internal static let ywg = ImageAsset(name: "ywg")
    internal static let ywgBlue = ImageAsset(name: "ywg_blue")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
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
