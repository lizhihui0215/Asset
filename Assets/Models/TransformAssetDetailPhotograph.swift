//
// Created by lizhihui on 2021/7/26.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct TransformAssetDetailPhotograph {
    let billLineId: String
    let billLineCode: String
    let billHeadId: String
    let assetLocationId: String
    let assetLocationCode: String
    let assetLocationName: String
    let wbsLocation: String
    let assetId: String
    let assetNumber: String
    let tagNumber: String
    let assetName: String
    let manufactureName: String
    let modelNumber: String
    let quantity: String
    let uom: String
    let typeId: String
    let regionIdDept: String
    let dutyPersonId: String
    let keyId: String
    let taskId: String
    let taskCode: String
    let taskName: String
    let confirmorId: String
    let confirmorCode: String
    let confirmorName: String
    let matchedFlag: String
    let capitalizedDat: String
    let datePlacedInService: String
    let createdBy: String
    let creationDate: String
    let lastUpdatedBy: String
    let lastUpdateDate: String
    let custText01: String
    let custText02: String
    let custText03: String
    let custText04: String
    let custText05: String
    let custText06: String
    let custText07: String
    let custText08: String
    let custText09: String
    let custNumber01: String
    let custNumber02: String
    let custDate01: String
    let custDate02: String
    let remark: String
    let serialNumber: String
    let typeDescriptionName: String
    let typeDescriptionCode: String
    let regionManageSegment: String
    let regionCodeManage: String
    let regionUsedSegment: String
    let regionCodeUsed: String
    let networkLevelName: String
    let networkLevelCode: String
    let networkLevelId: String
    let businessPlatformName: String
    let businessPlatformCode: String
    let businessPlatformId: String
    let invenstmentTypeName: String
    let invenstmentTypeCode: String
    let invenstmentTypeId: String
    let networkElementName: String
    let networkElementCode: String
    let networkElementId: String
    let supportNetDeviceTypeName: String
    let supportNetDeviceTypeCode: String
    let assetsBuild: String
    let assetsShared: String
    let importAssetFlag: String
    let projectId: String
    let regionIdUsed: String
    let regionIdManage: String
    let matchedDesc: String
    let confirmorAccount: String
    let dutyPersonName: String
    let dutyPersonCode: String
    let sourceSystem: String
    let bookTypeCode: String
    let sourceSystemId: String
    let usedPersonId: String
    let usedPersonAccount: String
    let usedPersonName: String
    let operatePersonId: String
    let operatePersonCode: String
    let operatePersonName: String
    let confirmPersonId: String
    let confirmPersonAccount: String
    let confirmPersonName: String
    let confirmFlag: String
    let confirmDate: String
    let confirmDesc: String
    let scanningPersonId: String
    let scanningPersonAccount: String
    let scanningPersonName: String
    let scanningDate: String
    let operatePersonAccount: String
    let newTypeId: String
    let newTypeDescriptionName: String
    let newTypeDescriptionCode: String
    let billLineStatus: String
    let dutyIsChanged: String
    let erpAssetsBuild: String
    let erpSupportCode: String
    let erpSupportName: String
    let erpBusinessPlatformId: String
    let erpBusinessPlatformCode: String
    let erpBusinessPlatformName: String
    let erpNetworkLevelId: String
    let erpNetworkLevelCode: String
    let erpNetworkLevelName: String
    let parentBillCode: String
    let isExpensionAssets: String
    let uomOfTransfer: String
    let quantitiyOfTransfer: String
    let vendorId: String
    let vendorName: String
    let qrcode: String
    let appTaskCode: String
    let isautomatic: String
    let zhLabel: String
    let longitude: String
    let latitude: String
    let mapLocationDesc: String
    let photoRequired: String
    let locationRequired: String
    let assetCheckItem: String
    let assetCheckItemName: String
    let resourceNumber: String
}

extension TransformAssetDetailPhotograph: AutoCodable {
    static var defaultBillLineId = ""
    static var defaultBillLineCode = ""
    static var defaultBillHeadId = ""
    static var defaultAssetLocationId = ""
    static var defaultAssetLocationCode = ""
    static var defaultAssetLocationName = ""
    static var defaultWbsLocation = ""
    static var defaultAssetId = ""
    static var defaultAssetNumber = ""
    static var defaultTagNumber = ""
    static var defaultAssetName = ""
    static var defaultManufactureName = ""
    static var defaultModelNumber = ""
    static var defaultQuantity = ""
    static var defaultUom = ""
    static var defaultTypeId = ""
    static var defaultRegionIdDept = ""
    static var defaultDutyPersonId = ""
    static var defaultKeyId = ""
    static var defaultTaskId = ""
    static var defaultTaskCode = ""
    static var defaultTaskName = ""
    static var defaultConfirmorId = ""
    static var defaultConfirmorCode = ""
    static var defaultConfirmorName = ""
    static var defaultMatchedFlag = ""
    static var defaultCapitalizedDat = ""
    static var defaultDatePlacedInService = ""
    static var defaultCreatedBy = ""
    static var defaultCreationDate = ""
    static var defaultLastUpdatedBy = ""
    static var defaultLastUpdateDate = ""
    static var defaultCustText01 = ""
    static var defaultCustText02 = ""
    static var defaultCustText03 = ""
    static var defaultCustText04 = ""
    static var defaultCustText05 = ""
    static var defaultCustText06 = ""
    static var defaultCustText07 = ""
    static var defaultCustText08 = ""
    static var defaultCustText09 = ""
    static var defaultCustNumber01 = ""
    static var defaultCustNumber02 = ""
    static var defaultCustDate01 = ""
    static var defaultCustDate02 = ""
    static var defaultRemark = ""
    static var defaultSerialNumber = ""
    static var defaultTypeDescriptionName = ""
    static var defaultTypeDescriptionCode = ""
    static var defaultRegionManageSegment = ""
    static var defaultRegionCodeManage = ""
    static var defaultRegionUsedSegment = ""
    static var defaultRegionCodeUsed = ""
    static var defaultNetworkLevelName = ""
    static var defaultNetworkLevelCode = ""
    static var defaultNetworkLevelId = ""
    static var defaultBusinessPlatformName = ""
    static var defaultBusinessPlatformCode = ""
    static var defaultBusinessPlatformId = ""
    static var defaultInvenstmentTypeName = ""
    static var defaultInvenstmentTypeCode = ""
    static var defaultInvenstmentTypeId = ""
    static var defaultNetworkElementName = ""
    static var defaultNetworkElementCode = ""
    static var defaultNetworkElementId = ""
    static var defaultSupportNetDeviceTypeName = ""
    static var defaultSupportNetDeviceTypeCode = ""
    static var defaultAssetsBuild = ""
    static var defaultAssetsShared = ""
    static var defaultImportAssetFlag = ""
    static var defaultProjectId = ""
    static var defaultRegionIdUsed = ""
    static var defaultRegionIdManage = ""
    static var defaultMatchedDesc = ""
    static var defaultConfirmorAccount = ""
    static var defaultDutyPersonName = ""
    static var defaultDutyPersonCode = ""
    static var defaultSourceSystem = ""
    static var defaultBookTypeCode = ""
    static var defaultSourceSystemId = ""
    static var defaultUsedPersonId = ""
    static var defaultUsedPersonAccount = ""
    static var defaultUsedPersonName = ""
    static var defaultOperatePersonId = ""
    static var defaultOperatePersonCode = ""
    static var defaultOperatePersonName = ""
    static var defaultConfirmPersonId = ""
    static var defaultConfirmPersonAccount = ""
    static var defaultConfirmPersonName = ""
    static var defaultConfirmFlag = ""
    static var defaultConfirmDate = ""
    static var defaultConfirmDesc = ""
    static var defaultScanningPersonId = ""
    static var defaultScanningPersonAccount = ""
    static var defaultScanningPersonName = ""
    static var defaultScanningDate = ""
    static var defaultOperatePersonAccount = ""
    static var defaultNewTypeId = ""
    static var defaultNewTypeDescriptionName = ""
    static var defaultNewTypeDescriptionCode = ""
    static var defaultBillLineStatus = ""
    static var defaultDutyIsChanged = ""
    static var defaultErpAssetsBuild = ""
    static var defaultErpSupportCode = ""
    static var defaultErpSupportName = ""
    static var defaultErpBusinessPlatformId = ""
    static var defaultErpBusinessPlatformCode = ""
    static var defaultErpBusinessPlatformName = ""
    static var defaultErpNetworkLevelId = ""
    static var defaultErpNetworkLevelCode = ""
    static var defaultErpNetworkLevelName = ""
    static var defaultParentBillCode = ""
    static var defaultIsExpensionAssets = ""
    static var defaultUomOfTransfer = ""
    static var defaultQuantitiyOfTransfer = ""
    static var defaultVendorId = ""
    static var defaultVendorName = ""
    static var defaultQrcode = ""
    static var defaultAppTaskCode = ""
    static var defaultIsautomatic = ""
    static var defaultZhLabel = ""
    static var defaultLongitude = ""
    static var defaultLatitude = ""
    static var defaultMapLocationDesc = ""
    static var defaultPhotoRequired = ""
    static var defaultLocationRequired = ""
    static var defaultAssetCheckItem = ""
    static var defaultAssetCheckItemName = ""
    static var defaultResourceNumber = ""
}
