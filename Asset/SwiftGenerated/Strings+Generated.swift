// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// 资产巡检
  internal static let assetInspection = L10n.tr("Localizable", "assetInspection")
  /// 资产盘点
  internal static let assetInventory = L10n.tr("Localizable", "assetInventory")
  /// 基础数据
  internal static let baseData = L10n.tr("Localizable", "baseData")
  /// 公司间调拨
  internal static let companyTransfer = L10n.tr("Localizable", "companyTransfer")
  /// 循环盘点
  internal static let cycleInventory = L10n.tr("Localizable", "cycleInventory")
  /// 部门间调拨
  internal static let externalDepartmentTransfer = L10n.tr("Localizable", "externalDepartmentTransfer")
  /// 部门内调拨
  internal static let internalDepartmentTransfer = L10n.tr("Localizable", "internalDepartmentTransfer")
  /// 地点信息修改
  internal static let locationModify = L10n.tr("Localizable", "locationModify")
  /// 通知
  internal static let notification = L10n.tr("Localizable", "notification")
  /// 第%d共有任务%d条
  internal static func pagingInformationLabelText(_ p1: Int, _ p2: Int) -> String {
    return L10n.tr("Localizable", "pagingInformationLabelText", p1, p2)
  }
  /// 工程转资
  internal static let projectTransfer = L10n.tr("Localizable", "projectTransfer")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
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
