// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length implicit_return

// MARK: - Storyboard Scenes

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardScene {
  internal enum Asset: StoryboardType {
    internal static let storyboardName = "Asset"

    internal static let initialScene = InitialSceneType<Assets.AssetListViewController>(storyboard: Asset.self)
  }
  internal enum AssetTask: StoryboardType {
    internal static let storyboardName = "AssetTask"

    internal static let initialScene = InitialSceneType<Assets.AssetTaskDetailViewController>(storyboard: AssetTask.self)

    internal static let assetTaskInventoryDetailPhotographViewController = SceneType<Assets.AssetTaskInventoryDetailPhotographViewController>(storyboard: AssetTask.self, identifier: "AssetTaskInventoryDetailPhotographViewController")

    internal static let assetTaskInventoryDetailViewController = SceneType<Assets.AssetTaskInventoryDetailViewController>(storyboard: AssetTask.self, identifier: "AssetTaskInventoryDetailViewController")

    internal static let assetTaskInventoryListViewController = SceneType<Assets.AssetTaskInventoryListViewController>(storyboard: AssetTask.self, identifier: "AssetTaskInventoryListViewController")
  }
  internal enum Common: StoryboardType {
    internal static let storyboardName = "Common"

    internal static let assetDetailViewController = SceneType<Assets.AssetDetailViewController>(storyboard: Common.self, identifier: "AssetDetailViewController")

    internal static let photographViewController = SceneType<Assets.PhotographViewController>(storyboard: Common.self, identifier: "PhotographViewController")

    internal static let scanViewController = SceneType<Assets.ScanViewController>(storyboard: Common.self, identifier: "ScanViewController")

    internal static let staffListViewController = SceneType<Assets.StaffListViewController>(storyboard: Common.self, identifier: "StaffListViewController")
  }
  internal enum LaunchScreen: StoryboardType {
    internal static let storyboardName = "LaunchScreen"

    internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
  }
  internal enum Location: StoryboardType {
    internal static let storyboardName = "Location"

    internal static let initialScene = InitialSceneType<Assets.LocationDetailViewController>(storyboard: Location.self)

    internal static let assetInventoryListViewController = SceneType<Assets.AssetInventoryListViewController>(storyboard: Location.self, identifier: "AssetInventoryListViewController")
  }
  internal enum Login: StoryboardType {
    internal static let storyboardName = "Login"

    internal static let initialScene = InitialSceneType<Assets.NavigationViewController>(storyboard: Login.self)

    internal static let loginViewController = SceneType<Assets.LoginViewController>(storyboard: Login.self, identifier: "LoginViewController")

    internal static let navigationViewController = SceneType<Assets.NavigationViewController>(storyboard: Login.self, identifier: "NavigationViewController")
  }
  internal enum Mine: StoryboardType {
    internal static let storyboardName = "Mine"

    internal static let initialScene = InitialSceneType<Assets.MineViewController>(storyboard: Mine.self)
  }
  internal enum Service: StoryboardType {
    internal static let storyboardName = "Service"

    internal static let initialScene = InitialSceneType<Assets.ServiceViewController>(storyboard: Service.self)
  }
  internal enum Tab: StoryboardType {
    internal static let storyboardName = "Tab"

    internal static let initialScene = InitialSceneType<Assets.TabBarViewController>(storyboard: Tab.self)
  }
  internal enum Transform: StoryboardType {
    internal static let storyboardName = "Transform"

    internal static let initialScene = InitialSceneType<Assets.TransformDetailViewController>(storyboard: Transform.self)

    internal static let assetTaskInventoryListViewController = SceneType<Assets.TransformAssetListViewController>(storyboard: Transform.self, identifier: "AssetTaskInventoryListViewController")

    internal static let transformAssetDetailPhotographViewController = SceneType<Assets.TransformAssetDetailPhotographViewController>(storyboard: Transform.self, identifier: "TransformAssetDetailPhotographViewController")

    internal static let transformAssetDetailViewController = SceneType<Assets.TransformAssetDetailViewController>(storyboard: Transform.self, identifier: "TransformAssetDetailViewController")
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol StoryboardType {
  static var storyboardName: String { get }
}

internal extension StoryboardType {
  static var storyboard: UIStoryboard {
    let name = self.storyboardName
    return UIStoryboard(name: name, bundle: BundleToken.bundle)
  }
}

internal struct SceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type
  internal let identifier: String

  internal func instantiate() -> T {
    let identifier = self.identifier
    guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
      fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
  }
}

internal struct InitialSceneType<T: UIViewController> {
  internal let storyboard: StoryboardType.Type

  internal func instantiate() -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
      fatalError("ViewController is not of the expected class \(T.self).")
    }
    return controller
  }

  @available(iOS 13.0, tvOS 13.0, *)
  internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
    guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
      fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
    }
    return controller
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
