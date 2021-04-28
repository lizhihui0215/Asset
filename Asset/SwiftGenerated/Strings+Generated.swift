// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum locationDetail {
    internal enum saveLocationCoordinate {
      internal enum success {
        internal enum alert {
          /// 更新成功！
          internal static let message = L10n.tr("Localizable", "locationDetail.saveLocationCoordinate.success.alert.message")
        }
      }
    }
  }

  internal enum locationList {
    internal enum pagingInformation {
      internal enum label {
        /// 第%d共有任务%d条
        internal static func text(_ p1: Int, _ p2: Int) -> String {
          return L10n.tr("Localizable", "locationList.pagingInformation.label.text", p1, p2)
        }
      }
    }
  }

  internal enum service {
    internal enum error {
      internal enum inDevelopment {
        /// 本App不能使用！
        internal static let message = L10n.tr("Localizable", "service.error.inDevelopment.message")
      }
    }
    internal enum name {
      /// 资产巡检
      internal static let assetInspection = L10n.tr("Localizable", "service.name.assetInspection")
      /// 资产盘点
      internal static let assetInventory = L10n.tr("Localizable", "service.name.assetInventory")
      /// 基础数据
      internal static let baseData = L10n.tr("Localizable", "service.name.baseData")
      /// 公司间调拨
      internal static let companyTransfer = L10n.tr("Localizable", "service.name.companyTransfer")
      /// 循环盘点
      internal static let cycleInventory = L10n.tr("Localizable", "service.name.cycleInventory")
      /// 部门间调拨
      internal static let externalDepartmentTransfer = L10n.tr("Localizable", "service.name.externalDepartmentTransfer")
      /// 部门内调拨
      internal static let internalDepartmentTransfer = L10n.tr("Localizable", "service.name.internalDepartmentTransfer")
      /// 地点信息修改
      internal static let locationModify = L10n.tr("Localizable", "service.name.locationModify")
      /// 通知
      internal static let notification = L10n.tr("Localizable", "service.name.notification")
      /// 工程转资
      internal static let projectTransfer = L10n.tr("Localizable", "service.name.projectTransfer")
    }
  }
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
