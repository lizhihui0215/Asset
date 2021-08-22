// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

// swiftlint:disable sorted_imports
import Foundation
import UIKit

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Storyboard Segues

// swiftlint:disable explicit_type_interface identifier_name line_length type_body_length type_name
internal enum StoryboardSegue {
  internal enum Asset: String, SegueType {
    case toAssetDetail
  }
  internal enum AssetTask: String, SegueType {
    case toPhotograph
    case toSearch
  }
  internal enum Common: String, SegueType {
    case submitted
    case successToAssetTaskInventoryDetail
    case successToInventory
    case successToTransformAssetDetail
    case toScan
    case toSelectPrincipal
    case toSelectUser
    case unwindFromScanViewControllerToTransformAssetDetailController
    case unwindFromStaffListToTransformDetailViewController
    case unwindFromStaffSelected
    case unwindFromStaffSelectedToAssetTaskInventoryDetail
    case unwindFromStaffSelectedToTransformInventoryDetail
    case unwindToAssetTaskInventoryDetail
  }
  internal enum Location: String, SegueType {
    case toAssetInventoryList
    case toPhotograph
    case toScan
  }
  internal enum Login: String, SegueType {
    case toSetting
    case toTab
  }
  internal enum Service: String, SegueType {
    case toAssetInventoryDetail
    case toAssetList
    case toLocationDetail
    case toLocationList
    case toSearch
    case toTransformList
  }
  internal enum Transform: String, SegueType {
    case toPhotograph
    case toSearch
    case unwindFromFromTransformDetailChangeCheckPerson
    case unwindFromTransformAssetListSearchCompletion
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length type_body_length type_name

// MARK: - Implementation Details

internal protocol SegueType: RawRepresentable {}

internal extension UIViewController {
  func perform<S: SegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    let identifier = segue.rawValue
    performSegue(withIdentifier: identifier, sender: sender)
  }
}

internal extension SegueType where RawValue == String {
  init?(_ segue: UIStoryboardSegue) {
    guard let identifier = segue.identifier else { return nil }
    self.init(rawValue: identifier)
  }
}
