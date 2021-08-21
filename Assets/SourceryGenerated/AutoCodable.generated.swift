// Generated using Sourcery 1.4.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

extension Asset {
    enum CodingKeys: String, CodingKey {
        case checkStatus
        case tagNumber
        case assetName
        case isCheck
        case assetId
        case checkStatusName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        checkStatus = (try? container.decode(InventoryType.self, forKey: .checkStatus)) ?? Asset.defaultCheckStatus
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? Asset.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? Asset.defaultAssetName
        isCheck = (try? container.decode(String.self, forKey: .isCheck)) ?? Asset.defaultIsCheck
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? Asset.defaultAssetId
        checkStatusName = (try? container.decode(String.self, forKey: .checkStatusName)) ?? Asset.defaultCheckStatusName
    }
}

extension AssetInventoryListDetail {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case assetId
        case tagNumber
        case assetName
        case checkTime
        case checkStatus
        case checkStatusName
        case realLocationCode
        case realLocationName
        case locationCode
        case locationName
        case checkPerson
        case lastCheckPerson
        case manufactureName
        case modelNumber
        case quantity
        case dutyPerson
        case dutyPersonName
        case usePerson
        case usePersonName
        case typeDescriptionCode
        case typeDescriptionName
        case longitude
        case latitude
        case mapLocationDesc
        case assetCheckItem
        case assetCheckItemName
        case resourceNumber
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? AssetInventoryListDetail.defaultIsCheck
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? AssetInventoryListDetail.defaultAssetId
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? AssetInventoryListDetail.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? AssetInventoryListDetail.defaultAssetName
        checkTime = (try? container.decode(String.self, forKey: .checkTime)) ?? AssetInventoryListDetail.defaultCheckTime
        checkStatus = (try? container.decode(String.self, forKey: .checkStatus)) ?? AssetInventoryListDetail.defaultCheckStatus
        checkStatusName = (try? container.decode(String.self, forKey: .checkStatusName)) ?? AssetInventoryListDetail.defaultCheckStatusName
        realLocationCode = (try? container.decode(String.self, forKey: .realLocationCode)) ?? AssetInventoryListDetail.defaultRealLocationCode
        realLocationName = (try? container.decode(String.self, forKey: .realLocationName)) ?? AssetInventoryListDetail.defaultRealLocationName
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? AssetInventoryListDetail.defaultLocationCode
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? AssetInventoryListDetail.defaultLocationName
        checkPerson = (try? container.decode(String.self, forKey: .checkPerson)) ?? AssetInventoryListDetail.defaultCheckPerson
        lastCheckPerson = (try? container.decode(String.self, forKey: .lastCheckPerson)) ?? AssetInventoryListDetail.defaultLastCheckPerson
        manufactureName = (try? container.decode(String.self, forKey: .manufactureName)) ?? AssetInventoryListDetail.defaultManufactureName
        modelNumber = (try? container.decode(String.self, forKey: .modelNumber)) ?? AssetInventoryListDetail.defaultModelNumber
        quantity = (try? container.decode(Int.self, forKey: .quantity)) ?? AssetInventoryListDetail.defaultQuantity
        dutyPerson = (try? container.decode(String.self, forKey: .dutyPerson)) ?? AssetInventoryListDetail.defaultDutyPerson
        dutyPersonName = (try? container.decode(String.self, forKey: .dutyPersonName)) ?? AssetInventoryListDetail.defaultDutyPersonName
        usePerson = (try? container.decode(String.self, forKey: .usePerson)) ?? AssetInventoryListDetail.defaultUsePerson
        usePersonName = (try? container.decode(String.self, forKey: .usePersonName)) ?? AssetInventoryListDetail.defaultUsePersonName
        typeDescriptionCode = (try? container.decode(String.self, forKey: .typeDescriptionCode)) ?? AssetInventoryListDetail.defaultTypeDescriptionCode
        typeDescriptionName = (try? container.decode(String.self, forKey: .typeDescriptionName)) ?? AssetInventoryListDetail.defaultTypeDescriptionName
        longitude = (try? container.decode(String.self, forKey: .longitude)) ?? AssetInventoryListDetail.defaultLongitude
        latitude = (try? container.decode(String.self, forKey: .latitude)) ?? AssetInventoryListDetail.defaultLatitude
        mapLocationDesc = (try? container.decode(String.self, forKey: .mapLocationDesc)) ?? AssetInventoryListDetail.defaultMapLocationDesc
        assetCheckItem = (try? container.decode(String.self, forKey: .assetCheckItem)) ?? AssetInventoryListDetail.defaultAssetCheckItem
        assetCheckItemName = (try? container.decode(String.self, forKey: .assetCheckItemName)) ?? AssetInventoryListDetail.defaultAssetCheckItemName
        resourceNumber = (try? container.decode(String.self, forKey: .resourceNumber)) ?? AssetInventoryListDetail.defaultResourceNumber
    }
}

extension AssetListDetail {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case assetId
        case assetKindId
        case bookTypeCode
        case assetNumber
        case tagNumber
        case assetName
        case manufactureName
        case modelNumber
        case keyId
        case quantity
        case uom
        case regionIdCompany
        case regionIdDept
        case regionIdManage
        case assetLocationId
        case assetLocationCode
        case assetLocationName
        case dutyPersonId
        case dutyPersonCode
        case dutyPersonName
        case usedPersonId
        case usedPersonAccount
        case usedPersonName
        case assetUsedStatus
        case assetStatus
        case erpCreationDate
        case enableDate
        case assetKindName
        case typeDescriptionCode
        case typeDescriptionName
        case assetStatusName
        case keyCode
        case keyName
        case companyName
        case deptName
        case manageDeptName
        case erpType
        case erpTypeName
        case isWlKind
        case queryStatus
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? AssetListDetail.defaultIsCheck
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? AssetListDetail.defaultAssetId
        assetKindId = (try? container.decode(String.self, forKey: .assetKindId)) ?? AssetListDetail.defaultAssetKindId
        bookTypeCode = (try? container.decode(String.self, forKey: .bookTypeCode)) ?? AssetListDetail.defaultBookTypeCode
        assetNumber = (try? container.decode(String.self, forKey: .assetNumber)) ?? AssetListDetail.defaultAssetNumber
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? AssetListDetail.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? AssetListDetail.defaultAssetName
        manufactureName = (try? container.decode(String.self, forKey: .manufactureName)) ?? AssetListDetail.defaultManufactureName
        modelNumber = (try? container.decode(String.self, forKey: .modelNumber)) ?? AssetListDetail.defaultModelNumber
        keyId = (try? container.decode(String.self, forKey: .keyId)) ?? AssetListDetail.defaultKeyId
        quantity = (try? container.decode(Int.self, forKey: .quantity)) ?? AssetListDetail.defaultQuantity
        uom = (try? container.decode(String.self, forKey: .uom)) ?? AssetListDetail.defaultUom
        regionIdCompany = (try? container.decode(String.self, forKey: .regionIdCompany)) ?? AssetListDetail.defaultRegionIdCompany
        regionIdDept = (try? container.decode(String.self, forKey: .regionIdDept)) ?? AssetListDetail.defaultRegionIdDept
        regionIdManage = (try? container.decode(String.self, forKey: .regionIdManage)) ?? AssetListDetail.defaultRegionIdManage
        assetLocationId = (try? container.decode(String.self, forKey: .assetLocationId)) ?? AssetListDetail.defaultAssetLocationId
        assetLocationCode = (try? container.decode(String.self, forKey: .assetLocationCode)) ?? AssetListDetail.defaultAssetLocationCode
        assetLocationName = (try? container.decode(String.self, forKey: .assetLocationName)) ?? AssetListDetail.defaultAssetLocationName
        dutyPersonId = (try? container.decode(String.self, forKey: .dutyPersonId)) ?? AssetListDetail.defaultDutyPersonId
        dutyPersonCode = (try? container.decode(String.self, forKey: .dutyPersonCode)) ?? AssetListDetail.defaultDutyPersonCode
        dutyPersonName = (try? container.decode(String.self, forKey: .dutyPersonName)) ?? AssetListDetail.defaultDutyPersonName
        usedPersonId = (try? container.decode(String.self, forKey: .usedPersonId)) ?? AssetListDetail.defaultUsedPersonId
        usedPersonAccount = (try? container.decode(String.self, forKey: .usedPersonAccount)) ?? AssetListDetail.defaultUsedPersonAccount
        usedPersonName = (try? container.decode(String.self, forKey: .usedPersonName)) ?? AssetListDetail.defaultUsedPersonName
        assetUsedStatus = (try? container.decode(String.self, forKey: .assetUsedStatus)) ?? AssetListDetail.defaultAssetUsedStatus
        assetStatus = (try? container.decode(String.self, forKey: .assetStatus)) ?? AssetListDetail.defaultAssetStatus
        erpCreationDate = (try? container.decode(String.self, forKey: .erpCreationDate)) ?? AssetListDetail.defaultErpCreationDate
        enableDate = (try? container.decode(String.self, forKey: .enableDate)) ?? AssetListDetail.defaultEnableDate
        assetKindName = (try? container.decode(String.self, forKey: .assetKindName)) ?? AssetListDetail.defaultAssetKindName
        typeDescriptionCode = (try? container.decode(String.self, forKey: .typeDescriptionCode)) ?? AssetListDetail.defaultTypeDescriptionCode
        typeDescriptionName = (try? container.decode(String.self, forKey: .typeDescriptionName)) ?? AssetListDetail.defaultTypeDescriptionName
        assetStatusName = (try? container.decode(String.self, forKey: .assetStatusName)) ?? AssetListDetail.defaultAssetStatusName
        keyCode = (try? container.decode(String.self, forKey: .keyCode)) ?? AssetListDetail.defaultKeyCode
        keyName = (try? container.decode(String.self, forKey: .keyName)) ?? AssetListDetail.defaultKeyName
        companyName = (try? container.decode(String.self, forKey: .companyName)) ?? AssetListDetail.defaultCompanyName
        deptName = (try? container.decode(String.self, forKey: .deptName)) ?? AssetListDetail.defaultDeptName
        manageDeptName = (try? container.decode(String.self, forKey: .manageDeptName)) ?? AssetListDetail.defaultManageDeptName
        erpType = (try? container.decode(String.self, forKey: .erpType)) ?? AssetListDetail.defaultErpType
        erpTypeName = (try? container.decode(String.self, forKey: .erpTypeName)) ?? AssetListDetail.defaultErpTypeName
        isWlKind = (try? container.decode(String.self, forKey: .isWlKind)) ?? AssetListDetail.defaultIsWlKind
        queryStatus = (try? container.decode(String.self, forKey: .queryStatus)) ?? AssetListDetail.defaultQueryStatus
    }
}

extension AssetTask {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case checkBillCode
        case taskNumber
        case taskStatus
        case taskStatusName
        case taskName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? AssetTask.defaultIsCheck
        checkBillCode = (try? container.decode(String.self, forKey: .checkBillCode)) ?? AssetTask.defaultCheckBillCode
        taskNumber = (try? container.decode(String.self, forKey: .taskNumber)) ?? AssetTask.defaultTaskNumber
        taskStatus = (try? container.decode(String.self, forKey: .taskStatus)) ?? AssetTask.defaultTaskStatus
        taskStatusName = (try? container.decode(String.self, forKey: .taskStatusName)) ?? AssetTask.defaultTaskStatusName
        taskName = (try? container.decode(String.self, forKey: .taskName)) ?? AssetTask.defaultTaskName
    }
}

extension AssetTaskDetail {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case checkBillCode
        case taskNumber
        case taskName
        case locationCode
        case checkPerson
        case checkCount
        case unCheckCount
        case alreadyCheckCount
        case lessCount
        case moreCount
        case longitude
        case latitude
        case mapLocationDesc
        case taskStatus
        case taskStatusName
        case checkTaskStatus
        case checkTaskStatusName
        case checkTaskTime
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? AssetTaskDetail.defaultIsCheck
        checkBillCode = (try? container.decode(String.self, forKey: .checkBillCode)) ?? AssetTaskDetail.defaultCheckBillCode
        taskNumber = (try? container.decode(String.self, forKey: .taskNumber)) ?? AssetTaskDetail.defaultTaskNumber
        taskName = (try? container.decode(String.self, forKey: .taskName)) ?? AssetTaskDetail.defaultTaskName
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? AssetTaskDetail.defaultLocationCode
        checkPerson = (try? container.decode(String.self, forKey: .checkPerson)) ?? AssetTaskDetail.defaultCheckPerson
        checkCount = (try? container.decode(Int.self, forKey: .checkCount)) ?? AssetTaskDetail.defaultCheckCount
        unCheckCount = (try? container.decode(Int.self, forKey: .unCheckCount)) ?? AssetTaskDetail.defaultUnCheckCount
        alreadyCheckCount = (try? container.decode(Int.self, forKey: .alreadyCheckCount)) ?? AssetTaskDetail.defaultAlreadyCheckCount
        lessCount = (try? container.decode(Int.self, forKey: .lessCount)) ?? AssetTaskDetail.defaultLessCount
        moreCount = (try? container.decode(Int.self, forKey: .moreCount)) ?? AssetTaskDetail.defaultMoreCount
        longitude = (try? container.decode(String.self, forKey: .longitude)) ?? AssetTaskDetail.defaultLongitude
        latitude = (try? container.decode(String.self, forKey: .latitude)) ?? AssetTaskDetail.defaultLatitude
        mapLocationDesc = (try? container.decode(String.self, forKey: .mapLocationDesc)) ?? AssetTaskDetail.defaultMapLocationDesc
        taskStatus = (try? container.decode(String.self, forKey: .taskStatus)) ?? AssetTaskDetail.defaultTaskStatus
        taskStatusName = (try? container.decode(String.self, forKey: .taskStatusName)) ?? AssetTaskDetail.defaultTaskStatusName
        checkTaskStatus = (try? container.decode(String.self, forKey: .checkTaskStatus)) ?? AssetTaskDetail.defaultCheckTaskStatus
        checkTaskStatusName = (try? container.decode(String.self, forKey: .checkTaskStatusName)) ?? AssetTaskDetail.defaultCheckTaskStatusName
        checkTaskTime = (try? container.decode(String.self, forKey: .checkTaskTime)) ?? AssetTaskDetail.defaultCheckTaskTime
    }
}

extension AssetTaskInventory {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case assetId
        case checkBillCode
        case checkStatus
        case checkStatusName
        case tagNumber
        case assetName
        case imageCount
        case locationCode
        case locationName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? AssetTaskInventory.defaultIsCheck
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? AssetTaskInventory.defaultAssetId
        checkBillCode = (try? container.decode(String.self, forKey: .checkBillCode)) ?? AssetTaskInventory.defaultCheckBillCode
        checkStatus = (try? container.decode(String.self, forKey: .checkStatus)) ?? AssetTaskInventory.defaultCheckStatus
        checkStatusName = (try? container.decode(String.self, forKey: .checkStatusName)) ?? AssetTaskInventory.defaultCheckStatusName
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? AssetTaskInventory.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? AssetTaskInventory.defaultAssetName
        imageCount = (try? container.decode(Int.self, forKey: .imageCount)) ?? AssetTaskInventory.defaultImageCount
        locationCode = try container.decodeIfPresent(String.self, forKey: .locationCode)
        locationName = try container.decodeIfPresent(String.self, forKey: .locationName)
    }
}

extension AssetTaskInventoryDetail {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case checkBillCode
        case assetId
        case tagNumber
        case assetName
        case checkTime
        case checkStatus
        case checkStatusName
        case realLocationCode
        case realLocationName
        case locationCode
        case locationName
        case checkPerson
        case manufactureName
        case modelNumber
        case quantity
        case dutyPerson
        case dutyPersonName
        case usePerson
        case usePersonName
        case longitude
        case latitude
        case mapLocationDesc
        case assetCheckItem
        case assetCheckItemName
        case resourceNumber
        case cityId
        case cityName
        case deptId
        case deptName
        case manageDeptId
        case manageDeptName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? AssetTaskInventoryDetail.defaultIsCheck
        checkBillCode = (try? container.decode(String.self, forKey: .checkBillCode)) ?? AssetTaskInventoryDetail.defaultCheckBillCode
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? AssetTaskInventoryDetail.defaultAssetId
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? AssetTaskInventoryDetail.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? AssetTaskInventoryDetail.defaultAssetName
        checkTime = (try? container.decode(String.self, forKey: .checkTime)) ?? AssetTaskInventoryDetail.defaultCheckTime
        checkStatus = (try? container.decode(String.self, forKey: .checkStatus)) ?? AssetTaskInventoryDetail.defaultCheckStatus
        checkStatusName = (try? container.decode(String.self, forKey: .checkStatusName)) ?? AssetTaskInventoryDetail.defaultCheckStatusName
        realLocationCode = (try? container.decode(String.self, forKey: .realLocationCode)) ?? AssetTaskInventoryDetail.defaultRealLocationCode
        realLocationName = (try? container.decode(String.self, forKey: .realLocationName)) ?? AssetTaskInventoryDetail.defaultRealLocationName
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? AssetTaskInventoryDetail.defaultLocationCode
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? AssetTaskInventoryDetail.defaultLocationName
        checkPerson = (try? container.decode(String.self, forKey: .checkPerson)) ?? AssetTaskInventoryDetail.defaultCheckPerson
        manufactureName = (try? container.decode(String.self, forKey: .manufactureName)) ?? AssetTaskInventoryDetail.defaultManufactureName
        modelNumber = (try? container.decode(String.self, forKey: .modelNumber)) ?? AssetTaskInventoryDetail.defaultModelNumber
        quantity = (try? container.decode(Int.self, forKey: .quantity)) ?? AssetTaskInventoryDetail.defaultQuantity
        dutyPerson = (try? container.decode(String.self, forKey: .dutyPerson)) ?? AssetTaskInventoryDetail.defaultDutyPerson
        dutyPersonName = (try? container.decode(String.self, forKey: .dutyPersonName)) ?? AssetTaskInventoryDetail.defaultDutyPersonName
        usePerson = (try? container.decode(String.self, forKey: .usePerson)) ?? AssetTaskInventoryDetail.defaultUsePerson
        usePersonName = (try? container.decode(String.self, forKey: .usePersonName)) ?? AssetTaskInventoryDetail.defaultUsePersonName
        longitude = (try? container.decode(String.self, forKey: .longitude)) ?? AssetTaskInventoryDetail.defaultLongitude
        latitude = (try? container.decode(String.self, forKey: .latitude)) ?? AssetTaskInventoryDetail.defaultLatitude
        mapLocationDesc = (try? container.decode(String.self, forKey: .mapLocationDesc)) ?? AssetTaskInventoryDetail.defaultMapLocationDesc
        assetCheckItem = (try? container.decode(String.self, forKey: .assetCheckItem)) ?? AssetTaskInventoryDetail.defaultAssetCheckItem
        assetCheckItemName = (try? container.decode(String.self, forKey: .assetCheckItemName)) ?? AssetTaskInventoryDetail.defaultAssetCheckItemName
        resourceNumber = (try? container.decode(String.self, forKey: .resourceNumber)) ?? AssetTaskInventoryDetail.defaultResourceNumber
        cityId = (try? container.decode(String.self, forKey: .cityId)) ?? AssetTaskInventoryDetail.defaultCityId
        cityName = (try? container.decode(String.self, forKey: .cityName)) ?? AssetTaskInventoryDetail.defaultCityName
        deptId = (try? container.decode(String.self, forKey: .deptId)) ?? AssetTaskInventoryDetail.defaultDeptId
        deptName = (try? container.decode(String.self, forKey: .deptName)) ?? AssetTaskInventoryDetail.defaultDeptName
        manageDeptId = (try? container.decode(String.self, forKey: .manageDeptId)) ?? AssetTaskInventoryDetail.defaultManageDeptId
        manageDeptName = (try? container.decode(String.self, forKey: .manageDeptName)) ?? AssetTaskInventoryDetail.defaultManageDeptName
    }
}

extension AssetTaskInventoryDetailPhotograph {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case checkBillCode
        case assetId
        case tagNumber
        case assetName
        case checkStatus
        case checkStatusName
        case locationCode
        case locationName
        case checkPerson
        case manufactureName
        case modelNumber
        case quantity
        case dutyPerson
        case dutyPersonName
        case usePerson
        case usePersonName
        case assetCheckItemName
        case deptId
        case deptName
        case manageDeptId
        case manageDeptName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? AssetTaskInventoryDetailPhotograph.defaultIsCheck
        checkBillCode = (try? container.decode(String.self, forKey: .checkBillCode)) ?? AssetTaskInventoryDetailPhotograph.defaultCheckBillCode
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? AssetTaskInventoryDetailPhotograph.defaultAssetId
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? AssetTaskInventoryDetailPhotograph.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? AssetTaskInventoryDetailPhotograph.defaultAssetName
        checkStatus = (try? container.decode(String.self, forKey: .checkStatus)) ?? AssetTaskInventoryDetailPhotograph.defaultCheckStatus
        checkStatusName = (try? container.decode(String.self, forKey: .checkStatusName)) ?? AssetTaskInventoryDetailPhotograph.defaultCheckStatusName
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? AssetTaskInventoryDetailPhotograph.defaultLocationCode
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? AssetTaskInventoryDetailPhotograph.defaultLocationName
        checkPerson = (try? container.decode(String.self, forKey: .checkPerson)) ?? AssetTaskInventoryDetailPhotograph.defaultCheckPerson
        manufactureName = (try? container.decode(String.self, forKey: .manufactureName)) ?? AssetTaskInventoryDetailPhotograph.defaultManufactureName
        modelNumber = (try? container.decode(String.self, forKey: .modelNumber)) ?? AssetTaskInventoryDetailPhotograph.defaultModelNumber
        quantity = (try? container.decode(Int.self, forKey: .quantity)) ?? AssetTaskInventoryDetailPhotograph.defaultQuantity
        dutyPerson = (try? container.decode(String.self, forKey: .dutyPerson)) ?? AssetTaskInventoryDetailPhotograph.defaultDutyPerson
        dutyPersonName = (try? container.decode(String.self, forKey: .dutyPersonName)) ?? AssetTaskInventoryDetailPhotograph.defaultDutyPersonName
        usePerson = (try? container.decode(String.self, forKey: .usePerson)) ?? AssetTaskInventoryDetailPhotograph.defaultUsePerson
        usePersonName = (try? container.decode(String.self, forKey: .usePersonName)) ?? AssetTaskInventoryDetailPhotograph.defaultUsePersonName
        assetCheckItemName = (try? container.decode(String.self, forKey: .assetCheckItemName)) ?? AssetTaskInventoryDetailPhotograph.defaultAssetCheckItemName
        deptId = (try? container.decode(String.self, forKey: .deptId)) ?? AssetTaskInventoryDetailPhotograph.defaultDeptId
        deptName = (try? container.decode(String.self, forKey: .deptName)) ?? AssetTaskInventoryDetailPhotograph.defaultDeptName
        manageDeptId = (try? container.decode(String.self, forKey: .manageDeptId)) ?? AssetTaskInventoryDetailPhotograph.defaultManageDeptId
        manageDeptName = (try? container.decode(String.self, forKey: .manageDeptName)) ?? AssetTaskInventoryDetailPhotograph.defaultManageDeptName
    }
}

extension Credential {
    enum CodingKeys: String, CodingKey {
        case pageSize
        case userOrgId
        case userName
        case userCityId
        case userCityName
        case userToken
        case userAccount
        case userOrgName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        pageSize = (try? container.decode(String.self, forKey: .pageSize)) ?? Credential.defaultPageSize
        userOrgId = (try? container.decode(String.self, forKey: .userOrgId)) ?? Credential.defaultUserOrgId
        userName = (try? container.decode(String.self, forKey: .userName)) ?? Credential.defaultUserName
        userCityId = (try? container.decode(String.self, forKey: .userCityId)) ?? Credential.defaultUserCityId
        userCityName = (try? container.decode(String.self, forKey: .userCityName)) ?? Credential.defaultUserCityName
        userToken = (try? container.decode(String.self, forKey: .userToken)) ?? Credential.defaultUserToken
        userAccount = (try? container.decode(String.self, forKey: .userAccount)) ?? Credential.defaultUserAccount
        userOrgName = (try? container.decode(String.self, forKey: .userOrgName)) ?? Credential.defaultUserOrgName
    }
}

extension IsLogin {
    enum CodingKeys: String, CodingKey {
        case loginId
        case userToken
        case userAccount
        case loginDate
        case logoutDate
        case tokenStatus
        case appType
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        loginId = (try? container.decode(String.self, forKey: .loginId)) ?? IsLogin.defaultLoginId
        userToken = (try? container.decode(String.self, forKey: .userToken)) ?? IsLogin.defaultUserToken
        userAccount = (try? container.decode(String.self, forKey: .userAccount)) ?? IsLogin.defaultUserAccount
        loginDate = (try? container.decode(String.self, forKey: .loginDate)) ?? IsLogin.defaultLoginDate
        logoutDate = (try? container.decode(String.self, forKey: .logoutDate)) ?? IsLogin.defaultLogoutDate
        tokenStatus = (try? container.decode(String.self, forKey: .tokenStatus)) ?? IsLogin.defaultTokenStatus
        appType = (try? container.decode(App.Category.self, forKey: .appType)) ?? IsLogin.defaultAppType
    }
}

extension Location {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case locationCode
        case locationName
        case assetLocationId
        case stLongitude
        case strLatitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? Location.defaultIsCheck
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? Location.defaultLocationCode
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? Location.defaultLocationName
        assetLocationId = (try? container.decode(String.self, forKey: .assetLocationId)) ?? Location.defaultAssetLocationId
        stLongitude = (try? container.decode(String.self, forKey: .stLongitude)) ?? Location.defaultStLongitude
        strLatitude = (try? container.decode(String.self, forKey: .strLatitude)) ?? Location.defaultStrLatitude
    }
}

extension LocationDetail {
    enum CodingKeys: String, CodingKey {
        case assetLocationId
        case strLongitude
        case locationClass
        case regionIdDept
        case locationOwner
        case isCheck
        case regionIdCompany
        case province
        case road
        case regionIdManage
        case enabledFlag
        case locationOwnerName
        case latitude
        case city
        case village
        case locationId
        case town
        case locationCode
        case strLatitude
        case locationType
        case longitude
        case deptName
        case companyName
        case locationClassName
        case county
        case locationTypeName
        case effectiveDate
        case locationName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        assetLocationId = (try? container.decode(String.self, forKey: .assetLocationId)) ?? LocationDetail.defaultAssetLocationId
        strLongitude = (try? container.decode(String.self, forKey: .strLongitude)) ?? LocationDetail.defaultStrLongitude
        locationClass = (try? container.decode(String.self, forKey: .locationClass)) ?? LocationDetail.defaultLocationClass
        regionIdDept = (try? container.decode(String.self, forKey: .regionIdDept)) ?? LocationDetail.defaultRegionIdDept
        locationOwner = (try? container.decode(String.self, forKey: .locationOwner)) ?? LocationDetail.defaultLocationOwner
        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? LocationDetail.defaultIsCheck
        regionIdCompany = (try? container.decode(String.self, forKey: .regionIdCompany)) ?? LocationDetail.defaultRegionIdCompany
        province = (try? container.decode(String.self, forKey: .province)) ?? LocationDetail.defaultProvince
        road = (try? container.decode(String.self, forKey: .road)) ?? LocationDetail.defaultRoad
        regionIdManage = (try? container.decode(String.self, forKey: .regionIdManage)) ?? LocationDetail.defaultRegionIdManage
        enabledFlag = (try? container.decode(String.self, forKey: .enabledFlag)) ?? LocationDetail.defaultEnabledFlag
        locationOwnerName = (try? container.decode(String.self, forKey: .locationOwnerName)) ?? LocationDetail.defaultLocationOwnerName
        latitude = (try? container.decode(CLLocationDegrees.self, forKey: .latitude)) ?? LocationDetail.defaultLatitude
        city = (try? container.decode(String.self, forKey: .city)) ?? LocationDetail.defaultCity
        village = (try? container.decode(String.self, forKey: .village)) ?? LocationDetail.defaultVillage
        locationId = (try? container.decode(String.self, forKey: .locationId)) ?? LocationDetail.defaultLocationId
        town = (try? container.decode(String.self, forKey: .town)) ?? LocationDetail.defaultTown
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? LocationDetail.defaultLocationCode
        strLatitude = (try? container.decode(String.self, forKey: .strLatitude)) ?? LocationDetail.defaultStrLatitude
        locationType = (try? container.decode(String.self, forKey: .locationType)) ?? LocationDetail.defaultLocationType
        longitude = (try? container.decode(CLLocationDegrees.self, forKey: .longitude)) ?? LocationDetail.defaultLongitude
        deptName = (try? container.decode(String.self, forKey: .deptName)) ?? LocationDetail.defaultDeptName
        companyName = (try? container.decode(String.self, forKey: .companyName)) ?? LocationDetail.defaultCompanyName
        locationClassName = (try? container.decode(String.self, forKey: .locationClassName)) ?? LocationDetail.defaultLocationClassName
        county = (try? container.decode(String.self, forKey: .county)) ?? LocationDetail.defaultCounty
        locationTypeName = (try? container.decode(String.self, forKey: .locationTypeName)) ?? LocationDetail.defaultLocationTypeName
        effectiveDate = (try? container.decode(String.self, forKey: .effectiveDate)) ?? LocationDetail.defaultEffectiveDate
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? LocationDetail.defaultLocationName
    }
}

extension Photo {
    enum CodingKeys: String, CodingKey {
        case imageId
        case imagePath
        case imageName
        case uploadTime
        case uploadType
        case uploadPerson
        case longitude
        case latitude
        case url
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        imageId = (try? container.decode(String.self, forKey: .imageId)) ?? Photo.defaultImageId
        imagePath = (try? container.decode(String.self, forKey: .imagePath)) ?? Photo.defaultImagePath
        imageName = (try? container.decode(String.self, forKey: .imageName)) ?? Photo.defaultImageName
        uploadTime = (try? container.decode(String.self, forKey: .uploadTime)) ?? Photo.defaultUploadTime
        uploadType = (try? container.decode(String.self, forKey: .uploadType)) ?? Photo.defaultUploadType
        uploadPerson = (try? container.decode(String.self, forKey: .uploadPerson)) ?? Photo.defaultUploadPerson
        longitude = (try? container.decode(String.self, forKey: .longitude)) ?? Photo.defaultLongitude
        latitude = (try? container.decode(String.self, forKey: .latitude)) ?? Photo.defaultLatitude
        url = (try? container.decode(String.self, forKey: .url)) ?? Photo.defaultUrl
    }
}

extension Staff {
    enum CodingKeys: String, CodingKey {
        case isCheck
        case account
        case userName
        case userCode
        case userOrgName
        case category
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? Staff.defaultIsCheck
        account = (try? container.decode(String.self, forKey: .account)) ?? Staff.defaultAccount
        userName = (try? container.decode(String.self, forKey: .userName)) ?? Staff.defaultUserName
        userCode = (try? container.decode(String.self, forKey: .userCode)) ?? Staff.defaultUserCode
        userOrgName = (try? container.decode(String.self, forKey: .userOrgName)) ?? Staff.defaultUserOrgName
        category = (try? container.decode(Category.self, forKey: .category)) ?? Staff.defaultCategory
    }
}

extension Staff.Category {
    enum CodingKeys: String, CodingKey {
        case principal
        case user
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let enumCase = try container.decode(String.self)
        switch enumCase {
        case CodingKeys.principal.rawValue: self = .principal
        case CodingKeys.user.rawValue: self = .user
        default: throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Unknown enum case '\(enumCase)'"))
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .principal: try container.encode(CodingKeys.principal.rawValue)
        case .user: try container.encode(CodingKeys.user.rawValue)
        }
    }
}

extension Transform {
    enum CodingKeys: String, CodingKey {
        case appTaskId
        case appTaskCode
        case appTaskStatus
        case appTaskStatusName
        case locationCode
        case locationName
        case assetSum
        case assetFinished
        case assetUnfinished
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        appTaskId = (try? container.decode(String.self, forKey: .appTaskId)) ?? Transform.defaultAppTaskId
        appTaskCode = (try? container.decode(String.self, forKey: .appTaskCode)) ?? Transform.defaultAppTaskCode
        appTaskStatus = (try? container.decode(String.self, forKey: .appTaskStatus)) ?? Transform.defaultAppTaskStatus
        appTaskStatusName = (try? container.decode(String.self, forKey: .appTaskStatusName)) ?? Transform.defaultAppTaskStatusName
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? Transform.defaultLocationCode
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? Transform.defaultLocationName
        assetSum = (try? container.decode(Int.self, forKey: .assetSum)) ?? Transform.defaultAssetSum
        assetFinished = (try? container.decode(Int.self, forKey: .assetFinished)) ?? Transform.defaultAssetFinished
        assetUnfinished = (try? container.decode(Int.self, forKey: .assetUnfinished)) ?? Transform.defaultAssetUnfinished
    }
}

extension TransformAsset {
    enum CodingKeys: String, CodingKey {
        case billLineId
        case tagNumber
        case assetName
        case matchedFlag
        case matchedDesc
        case confirmFlag
        case confirmDesc
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        billLineId = (try? container.decode(String.self, forKey: .billLineId)) ?? TransformAsset.defaultBillLineId
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? TransformAsset.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? TransformAsset.defaultAssetName
        matchedFlag = (try? container.decode(String.self, forKey: .matchedFlag)) ?? TransformAsset.defaultMatchedFlag
        matchedDesc = (try? container.decode(String.self, forKey: .matchedDesc)) ?? TransformAsset.defaultMatchedDesc
        confirmFlag = (try? container.decode(String.self, forKey: .confirmFlag)) ?? TransformAsset.defaultConfirmFlag
        confirmDesc = (try? container.decode(String.self, forKey: .confirmDesc)) ?? TransformAsset.defaultConfirmDesc
    }
}

extension TransformAssetDetail {
    enum CodingKeys: String, CodingKey {
        case billLineId
        case billLineCode
        case billHeadId
        case assetLocationId
        case assetLocationCode
        case assetLocationName
        case wbsLocation
        case assetId
        case assetNumber
        case tagNumber
        case assetName
        case manufactureName
        case modelNumber
        case quantity
        case uom
        case typeId
        case regionIdDept
        case dutyPersonId
        case keyId
        case taskId
        case taskCode
        case taskName
        case confirmorId
        case confirmorCode
        case confirmorName
        case matchedFlag
        case capitalizedDat
        case datePlacedInService
        case createdBy
        case creationDate
        case lastUpdatedBy
        case lastUpdateDate
        case custText01
        case custText02
        case custText03
        case custText04
        case custText05
        case custText06
        case custText07
        case custText08
        case custText09
        case custNumber01
        case custNumber02
        case custDate01
        case custDate02
        case remark
        case serialNumber
        case typeDescriptionName
        case typeDescriptionCode
        case regionManageSegment
        case regionCodeManage
        case regionUsedSegment
        case regionCodeUsed
        case networkLevelName
        case networkLevelCode
        case networkLevelId
        case businessPlatformName
        case businessPlatformCode
        case businessPlatformId
        case invenstmentTypeName
        case invenstmentTypeCode
        case invenstmentTypeId
        case networkElementName
        case networkElementCode
        case networkElementId
        case supportNetDeviceTypeName
        case supportNetDeviceTypeCode
        case assetsBuild
        case assetsShared
        case importAssetFlag
        case projectId
        case regionIdUsed
        case regionIdManage
        case matchedDesc
        case confirmorAccount
        case dutyPersonName
        case dutyPersonCode
        case sourceSystem
        case bookTypeCode
        case sourceSystemId
        case usedPersonId
        case usedPersonAccount
        case usedPersonName
        case operatePersonId
        case operatePersonCode
        case operatePersonName
        case confirmPersonId
        case confirmPersonAccount
        case confirmPersonName
        case confirmFlag
        case confirmDate
        case confirmDesc
        case scanningPersonId
        case scanningPersonAccount
        case scanningPersonName
        case scanningDate
        case operatePersonAccount
        case newTypeId
        case newTypeDescriptionName
        case newTypeDescriptionCode
        case billLineStatus
        case dutyIsChanged
        case erpAssetsBuild
        case erpSupportCode
        case erpSupportName
        case erpBusinessPlatformId
        case erpBusinessPlatformCode
        case erpBusinessPlatformName
        case erpNetworkLevelId
        case erpNetworkLevelCode
        case erpNetworkLevelName
        case parentBillCode
        case isExpensionAssets
        case uomOfTransfer
        case quantitiyOfTransfer
        case vendorId
        case vendorName
        case qrcode
        case appTaskCode
        case isautomatic
        case zhLabel
        case longitude
        case latitude
        case mapLocationDesc
        case photoRequired
        case locationRequired
        case assetCheckItem
        case assetCheckItemName
        case resourceNumber
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        billLineId = (try? container.decode(String.self, forKey: .billLineId)) ?? TransformAssetDetail.defaultBillLineId
        billLineCode = (try? container.decode(String.self, forKey: .billLineCode)) ?? TransformAssetDetail.defaultBillLineCode
        billHeadId = (try? container.decode(String.self, forKey: .billHeadId)) ?? TransformAssetDetail.defaultBillHeadId
        assetLocationId = (try? container.decode(String.self, forKey: .assetLocationId)) ?? TransformAssetDetail.defaultAssetLocationId
        assetLocationCode = (try? container.decode(String.self, forKey: .assetLocationCode)) ?? TransformAssetDetail.defaultAssetLocationCode
        assetLocationName = (try? container.decode(String.self, forKey: .assetLocationName)) ?? TransformAssetDetail.defaultAssetLocationName
        wbsLocation = (try? container.decode(String.self, forKey: .wbsLocation)) ?? TransformAssetDetail.defaultWbsLocation
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? TransformAssetDetail.defaultAssetId
        assetNumber = (try? container.decode(String.self, forKey: .assetNumber)) ?? TransformAssetDetail.defaultAssetNumber
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? TransformAssetDetail.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? TransformAssetDetail.defaultAssetName
        manufactureName = (try? container.decode(String.self, forKey: .manufactureName)) ?? TransformAssetDetail.defaultManufactureName
        modelNumber = (try? container.decode(String.self, forKey: .modelNumber)) ?? TransformAssetDetail.defaultModelNumber
        quantity = (try? container.decode(Double.self, forKey: .quantity)) ?? TransformAssetDetail.defaultQuantity
        uom = (try? container.decode(String.self, forKey: .uom)) ?? TransformAssetDetail.defaultUom
        typeId = (try? container.decode(String.self, forKey: .typeId)) ?? TransformAssetDetail.defaultTypeId
        regionIdDept = (try? container.decode(String.self, forKey: .regionIdDept)) ?? TransformAssetDetail.defaultRegionIdDept
        dutyPersonId = (try? container.decode(String.self, forKey: .dutyPersonId)) ?? TransformAssetDetail.defaultDutyPersonId
        keyId = (try? container.decode(String.self, forKey: .keyId)) ?? TransformAssetDetail.defaultKeyId
        taskId = (try? container.decode(String.self, forKey: .taskId)) ?? TransformAssetDetail.defaultTaskId
        taskCode = (try? container.decode(String.self, forKey: .taskCode)) ?? TransformAssetDetail.defaultTaskCode
        taskName = (try? container.decode(String.self, forKey: .taskName)) ?? TransformAssetDetail.defaultTaskName
        confirmorId = (try? container.decode(String.self, forKey: .confirmorId)) ?? TransformAssetDetail.defaultConfirmorId
        confirmorCode = (try? container.decode(String.self, forKey: .confirmorCode)) ?? TransformAssetDetail.defaultConfirmorCode
        confirmorName = (try? container.decode(String.self, forKey: .confirmorName)) ?? TransformAssetDetail.defaultConfirmorName
        matchedFlag = (try? container.decode(String.self, forKey: .matchedFlag)) ?? TransformAssetDetail.defaultMatchedFlag
        capitalizedDat = (try? container.decode(String.self, forKey: .capitalizedDat)) ?? TransformAssetDetail.defaultCapitalizedDat
        datePlacedInService = (try? container.decode(String.self, forKey: .datePlacedInService)) ?? TransformAssetDetail.defaultDatePlacedInService
        createdBy = (try? container.decode(String.self, forKey: .createdBy)) ?? TransformAssetDetail.defaultCreatedBy
        creationDate = (try? container.decode(String.self, forKey: .creationDate)) ?? TransformAssetDetail.defaultCreationDate
        lastUpdatedBy = (try? container.decode(String.self, forKey: .lastUpdatedBy)) ?? TransformAssetDetail.defaultLastUpdatedBy
        lastUpdateDate = (try? container.decode(String.self, forKey: .lastUpdateDate)) ?? TransformAssetDetail.defaultLastUpdateDate
        custText01 = (try? container.decode(String.self, forKey: .custText01)) ?? TransformAssetDetail.defaultCustText01
        custText02 = (try? container.decode(String.self, forKey: .custText02)) ?? TransformAssetDetail.defaultCustText02
        custText03 = (try? container.decode(String.self, forKey: .custText03)) ?? TransformAssetDetail.defaultCustText03
        custText04 = (try? container.decode(String.self, forKey: .custText04)) ?? TransformAssetDetail.defaultCustText04
        custText05 = (try? container.decode(String.self, forKey: .custText05)) ?? TransformAssetDetail.defaultCustText05
        custText06 = (try? container.decode(String.self, forKey: .custText06)) ?? TransformAssetDetail.defaultCustText06
        custText07 = (try? container.decode(String.self, forKey: .custText07)) ?? TransformAssetDetail.defaultCustText07
        custText08 = (try? container.decode(String.self, forKey: .custText08)) ?? TransformAssetDetail.defaultCustText08
        custText09 = (try? container.decode(String.self, forKey: .custText09)) ?? TransformAssetDetail.defaultCustText09
        custNumber01 = (try? container.decode(String.self, forKey: .custNumber01)) ?? TransformAssetDetail.defaultCustNumber01
        custNumber02 = (try? container.decode(String.self, forKey: .custNumber02)) ?? TransformAssetDetail.defaultCustNumber02
        custDate01 = (try? container.decode(String.self, forKey: .custDate01)) ?? TransformAssetDetail.defaultCustDate01
        custDate02 = (try? container.decode(String.self, forKey: .custDate02)) ?? TransformAssetDetail.defaultCustDate02
        remark = (try? container.decode(String.self, forKey: .remark)) ?? TransformAssetDetail.defaultRemark
        serialNumber = (try? container.decode(String.self, forKey: .serialNumber)) ?? TransformAssetDetail.defaultSerialNumber
        typeDescriptionName = (try? container.decode(String.self, forKey: .typeDescriptionName)) ?? TransformAssetDetail.defaultTypeDescriptionName
        typeDescriptionCode = (try? container.decode(String.self, forKey: .typeDescriptionCode)) ?? TransformAssetDetail.defaultTypeDescriptionCode
        regionManageSegment = (try? container.decode(String.self, forKey: .regionManageSegment)) ?? TransformAssetDetail.defaultRegionManageSegment
        regionCodeManage = (try? container.decode(String.self, forKey: .regionCodeManage)) ?? TransformAssetDetail.defaultRegionCodeManage
        regionUsedSegment = (try? container.decode(String.self, forKey: .regionUsedSegment)) ?? TransformAssetDetail.defaultRegionUsedSegment
        regionCodeUsed = (try? container.decode(String.self, forKey: .regionCodeUsed)) ?? TransformAssetDetail.defaultRegionCodeUsed
        networkLevelName = (try? container.decode(String.self, forKey: .networkLevelName)) ?? TransformAssetDetail.defaultNetworkLevelName
        networkLevelCode = (try? container.decode(String.self, forKey: .networkLevelCode)) ?? TransformAssetDetail.defaultNetworkLevelCode
        networkLevelId = (try? container.decode(String.self, forKey: .networkLevelId)) ?? TransformAssetDetail.defaultNetworkLevelId
        businessPlatformName = (try? container.decode(String.self, forKey: .businessPlatformName)) ?? TransformAssetDetail.defaultBusinessPlatformName
        businessPlatformCode = (try? container.decode(String.self, forKey: .businessPlatformCode)) ?? TransformAssetDetail.defaultBusinessPlatformCode
        businessPlatformId = (try? container.decode(String.self, forKey: .businessPlatformId)) ?? TransformAssetDetail.defaultBusinessPlatformId
        invenstmentTypeName = (try? container.decode(String.self, forKey: .invenstmentTypeName)) ?? TransformAssetDetail.defaultInvenstmentTypeName
        invenstmentTypeCode = (try? container.decode(String.self, forKey: .invenstmentTypeCode)) ?? TransformAssetDetail.defaultInvenstmentTypeCode
        invenstmentTypeId = (try? container.decode(String.self, forKey: .invenstmentTypeId)) ?? TransformAssetDetail.defaultInvenstmentTypeId
        networkElementName = (try? container.decode(String.self, forKey: .networkElementName)) ?? TransformAssetDetail.defaultNetworkElementName
        networkElementCode = (try? container.decode(String.self, forKey: .networkElementCode)) ?? TransformAssetDetail.defaultNetworkElementCode
        networkElementId = (try? container.decode(String.self, forKey: .networkElementId)) ?? TransformAssetDetail.defaultNetworkElementId
        supportNetDeviceTypeName = (try? container.decode(String.self, forKey: .supportNetDeviceTypeName)) ?? TransformAssetDetail.defaultSupportNetDeviceTypeName
        supportNetDeviceTypeCode = (try? container.decode(String.self, forKey: .supportNetDeviceTypeCode)) ?? TransformAssetDetail.defaultSupportNetDeviceTypeCode
        assetsBuild = (try? container.decode(String.self, forKey: .assetsBuild)) ?? TransformAssetDetail.defaultAssetsBuild
        assetsShared = (try? container.decode(String.self, forKey: .assetsShared)) ?? TransformAssetDetail.defaultAssetsShared
        importAssetFlag = (try? container.decode(String.self, forKey: .importAssetFlag)) ?? TransformAssetDetail.defaultImportAssetFlag
        projectId = (try? container.decode(String.self, forKey: .projectId)) ?? TransformAssetDetail.defaultProjectId
        regionIdUsed = (try? container.decode(String.self, forKey: .regionIdUsed)) ?? TransformAssetDetail.defaultRegionIdUsed
        regionIdManage = (try? container.decode(String.self, forKey: .regionIdManage)) ?? TransformAssetDetail.defaultRegionIdManage
        matchedDesc = (try? container.decode(String.self, forKey: .matchedDesc)) ?? TransformAssetDetail.defaultMatchedDesc
        confirmorAccount = (try? container.decode(String.self, forKey: .confirmorAccount)) ?? TransformAssetDetail.defaultConfirmorAccount
        dutyPersonName = (try? container.decode(String.self, forKey: .dutyPersonName)) ?? TransformAssetDetail.defaultDutyPersonName
        dutyPersonCode = (try? container.decode(String.self, forKey: .dutyPersonCode)) ?? TransformAssetDetail.defaultDutyPersonCode
        sourceSystem = (try? container.decode(String.self, forKey: .sourceSystem)) ?? TransformAssetDetail.defaultSourceSystem
        bookTypeCode = (try? container.decode(String.self, forKey: .bookTypeCode)) ?? TransformAssetDetail.defaultBookTypeCode
        sourceSystemId = (try? container.decode(String.self, forKey: .sourceSystemId)) ?? TransformAssetDetail.defaultSourceSystemId
        usedPersonId = (try? container.decode(String.self, forKey: .usedPersonId)) ?? TransformAssetDetail.defaultUsedPersonId
        usedPersonAccount = (try? container.decode(String.self, forKey: .usedPersonAccount)) ?? TransformAssetDetail.defaultUsedPersonAccount
        usedPersonName = (try? container.decode(String.self, forKey: .usedPersonName)) ?? TransformAssetDetail.defaultUsedPersonName
        operatePersonId = (try? container.decode(String.self, forKey: .operatePersonId)) ?? TransformAssetDetail.defaultOperatePersonId
        operatePersonCode = (try? container.decode(String.self, forKey: .operatePersonCode)) ?? TransformAssetDetail.defaultOperatePersonCode
        operatePersonName = (try? container.decode(String.self, forKey: .operatePersonName)) ?? TransformAssetDetail.defaultOperatePersonName
        confirmPersonId = (try? container.decode(String.self, forKey: .confirmPersonId)) ?? TransformAssetDetail.defaultConfirmPersonId
        confirmPersonAccount = (try? container.decode(String.self, forKey: .confirmPersonAccount)) ?? TransformAssetDetail.defaultConfirmPersonAccount
        confirmPersonName = (try? container.decode(String.self, forKey: .confirmPersonName)) ?? TransformAssetDetail.defaultConfirmPersonName
        confirmFlag = (try? container.decode(String.self, forKey: .confirmFlag)) ?? TransformAssetDetail.defaultConfirmFlag
        confirmDate = (try? container.decode(String.self, forKey: .confirmDate)) ?? TransformAssetDetail.defaultConfirmDate
        confirmDesc = (try? container.decode(String.self, forKey: .confirmDesc)) ?? TransformAssetDetail.defaultConfirmDesc
        scanningPersonId = (try? container.decode(String.self, forKey: .scanningPersonId)) ?? TransformAssetDetail.defaultScanningPersonId
        scanningPersonAccount = (try? container.decode(String.self, forKey: .scanningPersonAccount)) ?? TransformAssetDetail.defaultScanningPersonAccount
        scanningPersonName = (try? container.decode(String.self, forKey: .scanningPersonName)) ?? TransformAssetDetail.defaultScanningPersonName
        scanningDate = (try? container.decode(String.self, forKey: .scanningDate)) ?? TransformAssetDetail.defaultScanningDate
        operatePersonAccount = (try? container.decode(String.self, forKey: .operatePersonAccount)) ?? TransformAssetDetail.defaultOperatePersonAccount
        newTypeId = (try? container.decode(String.self, forKey: .newTypeId)) ?? TransformAssetDetail.defaultNewTypeId
        newTypeDescriptionName = (try? container.decode(String.self, forKey: .newTypeDescriptionName)) ?? TransformAssetDetail.defaultNewTypeDescriptionName
        newTypeDescriptionCode = (try? container.decode(String.self, forKey: .newTypeDescriptionCode)) ?? TransformAssetDetail.defaultNewTypeDescriptionCode
        billLineStatus = (try? container.decode(String.self, forKey: .billLineStatus)) ?? TransformAssetDetail.defaultBillLineStatus
        dutyIsChanged = (try? container.decode(String.self, forKey: .dutyIsChanged)) ?? TransformAssetDetail.defaultDutyIsChanged
        erpAssetsBuild = (try? container.decode(String.self, forKey: .erpAssetsBuild)) ?? TransformAssetDetail.defaultErpAssetsBuild
        erpSupportCode = (try? container.decode(String.self, forKey: .erpSupportCode)) ?? TransformAssetDetail.defaultErpSupportCode
        erpSupportName = (try? container.decode(String.self, forKey: .erpSupportName)) ?? TransformAssetDetail.defaultErpSupportName
        erpBusinessPlatformId = (try? container.decode(String.self, forKey: .erpBusinessPlatformId)) ?? TransformAssetDetail.defaultErpBusinessPlatformId
        erpBusinessPlatformCode = (try? container.decode(String.self, forKey: .erpBusinessPlatformCode)) ?? TransformAssetDetail.defaultErpBusinessPlatformCode
        erpBusinessPlatformName = (try? container.decode(String.self, forKey: .erpBusinessPlatformName)) ?? TransformAssetDetail.defaultErpBusinessPlatformName
        erpNetworkLevelId = (try? container.decode(String.self, forKey: .erpNetworkLevelId)) ?? TransformAssetDetail.defaultErpNetworkLevelId
        erpNetworkLevelCode = (try? container.decode(String.self, forKey: .erpNetworkLevelCode)) ?? TransformAssetDetail.defaultErpNetworkLevelCode
        erpNetworkLevelName = (try? container.decode(String.self, forKey: .erpNetworkLevelName)) ?? TransformAssetDetail.defaultErpNetworkLevelName
        parentBillCode = (try? container.decode(String.self, forKey: .parentBillCode)) ?? TransformAssetDetail.defaultParentBillCode
        isExpensionAssets = (try? container.decode(String.self, forKey: .isExpensionAssets)) ?? TransformAssetDetail.defaultIsExpensionAssets
        uomOfTransfer = (try? container.decode(String.self, forKey: .uomOfTransfer)) ?? TransformAssetDetail.defaultUomOfTransfer
        quantitiyOfTransfer = (try? container.decode(String.self, forKey: .quantitiyOfTransfer)) ?? TransformAssetDetail.defaultQuantitiyOfTransfer
        vendorId = (try? container.decode(String.self, forKey: .vendorId)) ?? TransformAssetDetail.defaultVendorId
        vendorName = (try? container.decode(String.self, forKey: .vendorName)) ?? TransformAssetDetail.defaultVendorName
        qrcode = (try? container.decode(String.self, forKey: .qrcode)) ?? TransformAssetDetail.defaultQrcode
        appTaskCode = (try? container.decode(String.self, forKey: .appTaskCode)) ?? TransformAssetDetail.defaultAppTaskCode
        isautomatic = (try? container.decode(String.self, forKey: .isautomatic)) ?? TransformAssetDetail.defaultIsautomatic
        zhLabel = (try? container.decode(String.self, forKey: .zhLabel)) ?? TransformAssetDetail.defaultZhLabel
        longitude = (try? container.decode(String.self, forKey: .longitude)) ?? TransformAssetDetail.defaultLongitude
        latitude = (try? container.decode(String.self, forKey: .latitude)) ?? TransformAssetDetail.defaultLatitude
        mapLocationDesc = (try? container.decode(String.self, forKey: .mapLocationDesc)) ?? TransformAssetDetail.defaultMapLocationDesc
        photoRequired = (try? container.decode(String.self, forKey: .photoRequired)) ?? TransformAssetDetail.defaultPhotoRequired
        locationRequired = (try? container.decode(String.self, forKey: .locationRequired)) ?? TransformAssetDetail.defaultLocationRequired
        assetCheckItem = (try? container.decode(String.self, forKey: .assetCheckItem)) ?? TransformAssetDetail.defaultAssetCheckItem
        assetCheckItemName = (try? container.decode(String.self, forKey: .assetCheckItemName)) ?? TransformAssetDetail.defaultAssetCheckItemName
        resourceNumber = (try? container.decode(String.self, forKey: .resourceNumber)) ?? TransformAssetDetail.defaultResourceNumber
    }
}

extension TransformAssetDetailPhotograph {
    enum CodingKeys: String, CodingKey {
        case billLineId
        case billLineCode
        case billHeadId
        case assetLocationId
        case assetLocationCode
        case assetLocationName
        case wbsLocation
        case assetId
        case assetNumber
        case tagNumber
        case assetName
        case manufactureName
        case modelNumber
        case quantity
        case uom
        case typeId
        case regionIdDept
        case dutyPersonId
        case keyId
        case taskId
        case taskCode
        case taskName
        case confirmorId
        case confirmorCode
        case confirmorName
        case matchedFlag
        case capitalizedDat
        case datePlacedInService
        case createdBy
        case creationDate
        case lastUpdatedBy
        case lastUpdateDate
        case custText01
        case custText02
        case custText03
        case custText04
        case custText05
        case custText06
        case custText07
        case custText08
        case custText09
        case custNumber01
        case custNumber02
        case custDate01
        case custDate02
        case remark
        case serialNumber
        case typeDescriptionName
        case typeDescriptionCode
        case regionManageSegment
        case regionCodeManage
        case regionUsedSegment
        case regionCodeUsed
        case networkLevelName
        case networkLevelCode
        case networkLevelId
        case businessPlatformName
        case businessPlatformCode
        case businessPlatformId
        case invenstmentTypeName
        case invenstmentTypeCode
        case invenstmentTypeId
        case networkElementName
        case networkElementCode
        case networkElementId
        case supportNetDeviceTypeName
        case supportNetDeviceTypeCode
        case assetsBuild
        case assetsShared
        case importAssetFlag
        case projectId
        case regionIdUsed
        case regionIdManage
        case matchedDesc
        case confirmorAccount
        case dutyPersonName
        case dutyPersonCode
        case sourceSystem
        case bookTypeCode
        case sourceSystemId
        case usedPersonId
        case usedPersonAccount
        case usedPersonName
        case operatePersonId
        case operatePersonCode
        case operatePersonName
        case confirmPersonId
        case confirmPersonAccount
        case confirmPersonName
        case confirmFlag
        case confirmDate
        case confirmDesc
        case scanningPersonId
        case scanningPersonAccount
        case scanningPersonName
        case scanningDate
        case operatePersonAccount
        case newTypeId
        case newTypeDescriptionName
        case newTypeDescriptionCode
        case billLineStatus
        case dutyIsChanged
        case erpAssetsBuild
        case erpSupportCode
        case erpSupportName
        case erpBusinessPlatformId
        case erpBusinessPlatformCode
        case erpBusinessPlatformName
        case erpNetworkLevelId
        case erpNetworkLevelCode
        case erpNetworkLevelName
        case parentBillCode
        case isExpensionAssets
        case uomOfTransfer
        case quantitiyOfTransfer
        case vendorId
        case vendorName
        case qrcode
        case appTaskCode
        case isautomatic
        case zhLabel
        case longitude
        case latitude
        case mapLocationDesc
        case photoRequired
        case locationRequired
        case assetCheckItem
        case assetCheckItemName
        case resourceNumber
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        billLineId = (try? container.decode(String.self, forKey: .billLineId)) ?? TransformAssetDetailPhotograph.defaultBillLineId
        billLineCode = (try? container.decode(String.self, forKey: .billLineCode)) ?? TransformAssetDetailPhotograph.defaultBillLineCode
        billHeadId = (try? container.decode(String.self, forKey: .billHeadId)) ?? TransformAssetDetailPhotograph.defaultBillHeadId
        assetLocationId = (try? container.decode(String.self, forKey: .assetLocationId)) ?? TransformAssetDetailPhotograph.defaultAssetLocationId
        assetLocationCode = (try? container.decode(String.self, forKey: .assetLocationCode)) ?? TransformAssetDetailPhotograph.defaultAssetLocationCode
        assetLocationName = (try? container.decode(String.self, forKey: .assetLocationName)) ?? TransformAssetDetailPhotograph.defaultAssetLocationName
        wbsLocation = (try? container.decode(String.self, forKey: .wbsLocation)) ?? TransformAssetDetailPhotograph.defaultWbsLocation
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? TransformAssetDetailPhotograph.defaultAssetId
        assetNumber = (try? container.decode(String.self, forKey: .assetNumber)) ?? TransformAssetDetailPhotograph.defaultAssetNumber
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? TransformAssetDetailPhotograph.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? TransformAssetDetailPhotograph.defaultAssetName
        manufactureName = (try? container.decode(String.self, forKey: .manufactureName)) ?? TransformAssetDetailPhotograph.defaultManufactureName
        modelNumber = (try? container.decode(String.self, forKey: .modelNumber)) ?? TransformAssetDetailPhotograph.defaultModelNumber
        quantity = (try? container.decode(String.self, forKey: .quantity)) ?? TransformAssetDetailPhotograph.defaultQuantity
        uom = (try? container.decode(String.self, forKey: .uom)) ?? TransformAssetDetailPhotograph.defaultUom
        typeId = (try? container.decode(String.self, forKey: .typeId)) ?? TransformAssetDetailPhotograph.defaultTypeId
        regionIdDept = (try? container.decode(String.self, forKey: .regionIdDept)) ?? TransformAssetDetailPhotograph.defaultRegionIdDept
        dutyPersonId = (try? container.decode(String.self, forKey: .dutyPersonId)) ?? TransformAssetDetailPhotograph.defaultDutyPersonId
        keyId = (try? container.decode(String.self, forKey: .keyId)) ?? TransformAssetDetailPhotograph.defaultKeyId
        taskId = (try? container.decode(String.self, forKey: .taskId)) ?? TransformAssetDetailPhotograph.defaultTaskId
        taskCode = (try? container.decode(String.self, forKey: .taskCode)) ?? TransformAssetDetailPhotograph.defaultTaskCode
        taskName = (try? container.decode(String.self, forKey: .taskName)) ?? TransformAssetDetailPhotograph.defaultTaskName
        confirmorId = (try? container.decode(String.self, forKey: .confirmorId)) ?? TransformAssetDetailPhotograph.defaultConfirmorId
        confirmorCode = (try? container.decode(String.self, forKey: .confirmorCode)) ?? TransformAssetDetailPhotograph.defaultConfirmorCode
        confirmorName = (try? container.decode(String.self, forKey: .confirmorName)) ?? TransformAssetDetailPhotograph.defaultConfirmorName
        matchedFlag = (try? container.decode(String.self, forKey: .matchedFlag)) ?? TransformAssetDetailPhotograph.defaultMatchedFlag
        capitalizedDat = (try? container.decode(String.self, forKey: .capitalizedDat)) ?? TransformAssetDetailPhotograph.defaultCapitalizedDat
        datePlacedInService = (try? container.decode(String.self, forKey: .datePlacedInService)) ?? TransformAssetDetailPhotograph.defaultDatePlacedInService
        createdBy = (try? container.decode(String.self, forKey: .createdBy)) ?? TransformAssetDetailPhotograph.defaultCreatedBy
        creationDate = (try? container.decode(String.self, forKey: .creationDate)) ?? TransformAssetDetailPhotograph.defaultCreationDate
        lastUpdatedBy = (try? container.decode(String.self, forKey: .lastUpdatedBy)) ?? TransformAssetDetailPhotograph.defaultLastUpdatedBy
        lastUpdateDate = (try? container.decode(String.self, forKey: .lastUpdateDate)) ?? TransformAssetDetailPhotograph.defaultLastUpdateDate
        custText01 = (try? container.decode(String.self, forKey: .custText01)) ?? TransformAssetDetailPhotograph.defaultCustText01
        custText02 = (try? container.decode(String.self, forKey: .custText02)) ?? TransformAssetDetailPhotograph.defaultCustText02
        custText03 = (try? container.decode(String.self, forKey: .custText03)) ?? TransformAssetDetailPhotograph.defaultCustText03
        custText04 = (try? container.decode(String.self, forKey: .custText04)) ?? TransformAssetDetailPhotograph.defaultCustText04
        custText05 = (try? container.decode(String.self, forKey: .custText05)) ?? TransformAssetDetailPhotograph.defaultCustText05
        custText06 = (try? container.decode(String.self, forKey: .custText06)) ?? TransformAssetDetailPhotograph.defaultCustText06
        custText07 = (try? container.decode(String.self, forKey: .custText07)) ?? TransformAssetDetailPhotograph.defaultCustText07
        custText08 = (try? container.decode(String.self, forKey: .custText08)) ?? TransformAssetDetailPhotograph.defaultCustText08
        custText09 = (try? container.decode(String.self, forKey: .custText09)) ?? TransformAssetDetailPhotograph.defaultCustText09
        custNumber01 = (try? container.decode(String.self, forKey: .custNumber01)) ?? TransformAssetDetailPhotograph.defaultCustNumber01
        custNumber02 = (try? container.decode(String.self, forKey: .custNumber02)) ?? TransformAssetDetailPhotograph.defaultCustNumber02
        custDate01 = (try? container.decode(String.self, forKey: .custDate01)) ?? TransformAssetDetailPhotograph.defaultCustDate01
        custDate02 = (try? container.decode(String.self, forKey: .custDate02)) ?? TransformAssetDetailPhotograph.defaultCustDate02
        remark = (try? container.decode(String.self, forKey: .remark)) ?? TransformAssetDetailPhotograph.defaultRemark
        serialNumber = (try? container.decode(String.self, forKey: .serialNumber)) ?? TransformAssetDetailPhotograph.defaultSerialNumber
        typeDescriptionName = (try? container.decode(String.self, forKey: .typeDescriptionName)) ?? TransformAssetDetailPhotograph.defaultTypeDescriptionName
        typeDescriptionCode = (try? container.decode(String.self, forKey: .typeDescriptionCode)) ?? TransformAssetDetailPhotograph.defaultTypeDescriptionCode
        regionManageSegment = (try? container.decode(String.self, forKey: .regionManageSegment)) ?? TransformAssetDetailPhotograph.defaultRegionManageSegment
        regionCodeManage = (try? container.decode(String.self, forKey: .regionCodeManage)) ?? TransformAssetDetailPhotograph.defaultRegionCodeManage
        regionUsedSegment = (try? container.decode(String.self, forKey: .regionUsedSegment)) ?? TransformAssetDetailPhotograph.defaultRegionUsedSegment
        regionCodeUsed = (try? container.decode(String.self, forKey: .regionCodeUsed)) ?? TransformAssetDetailPhotograph.defaultRegionCodeUsed
        networkLevelName = (try? container.decode(String.self, forKey: .networkLevelName)) ?? TransformAssetDetailPhotograph.defaultNetworkLevelName
        networkLevelCode = (try? container.decode(String.self, forKey: .networkLevelCode)) ?? TransformAssetDetailPhotograph.defaultNetworkLevelCode
        networkLevelId = (try? container.decode(String.self, forKey: .networkLevelId)) ?? TransformAssetDetailPhotograph.defaultNetworkLevelId
        businessPlatformName = (try? container.decode(String.self, forKey: .businessPlatformName)) ?? TransformAssetDetailPhotograph.defaultBusinessPlatformName
        businessPlatformCode = (try? container.decode(String.self, forKey: .businessPlatformCode)) ?? TransformAssetDetailPhotograph.defaultBusinessPlatformCode
        businessPlatformId = (try? container.decode(String.self, forKey: .businessPlatformId)) ?? TransformAssetDetailPhotograph.defaultBusinessPlatformId
        invenstmentTypeName = (try? container.decode(String.self, forKey: .invenstmentTypeName)) ?? TransformAssetDetailPhotograph.defaultInvenstmentTypeName
        invenstmentTypeCode = (try? container.decode(String.self, forKey: .invenstmentTypeCode)) ?? TransformAssetDetailPhotograph.defaultInvenstmentTypeCode
        invenstmentTypeId = (try? container.decode(String.self, forKey: .invenstmentTypeId)) ?? TransformAssetDetailPhotograph.defaultInvenstmentTypeId
        networkElementName = (try? container.decode(String.self, forKey: .networkElementName)) ?? TransformAssetDetailPhotograph.defaultNetworkElementName
        networkElementCode = (try? container.decode(String.self, forKey: .networkElementCode)) ?? TransformAssetDetailPhotograph.defaultNetworkElementCode
        networkElementId = (try? container.decode(String.self, forKey: .networkElementId)) ?? TransformAssetDetailPhotograph.defaultNetworkElementId
        supportNetDeviceTypeName = (try? container.decode(String.self, forKey: .supportNetDeviceTypeName)) ?? TransformAssetDetailPhotograph.defaultSupportNetDeviceTypeName
        supportNetDeviceTypeCode = (try? container.decode(String.self, forKey: .supportNetDeviceTypeCode)) ?? TransformAssetDetailPhotograph.defaultSupportNetDeviceTypeCode
        assetsBuild = (try? container.decode(String.self, forKey: .assetsBuild)) ?? TransformAssetDetailPhotograph.defaultAssetsBuild
        assetsShared = (try? container.decode(String.self, forKey: .assetsShared)) ?? TransformAssetDetailPhotograph.defaultAssetsShared
        importAssetFlag = (try? container.decode(String.self, forKey: .importAssetFlag)) ?? TransformAssetDetailPhotograph.defaultImportAssetFlag
        projectId = (try? container.decode(String.self, forKey: .projectId)) ?? TransformAssetDetailPhotograph.defaultProjectId
        regionIdUsed = (try? container.decode(String.self, forKey: .regionIdUsed)) ?? TransformAssetDetailPhotograph.defaultRegionIdUsed
        regionIdManage = (try? container.decode(String.self, forKey: .regionIdManage)) ?? TransformAssetDetailPhotograph.defaultRegionIdManage
        matchedDesc = (try? container.decode(String.self, forKey: .matchedDesc)) ?? TransformAssetDetailPhotograph.defaultMatchedDesc
        confirmorAccount = (try? container.decode(String.self, forKey: .confirmorAccount)) ?? TransformAssetDetailPhotograph.defaultConfirmorAccount
        dutyPersonName = (try? container.decode(String.self, forKey: .dutyPersonName)) ?? TransformAssetDetailPhotograph.defaultDutyPersonName
        dutyPersonCode = (try? container.decode(String.self, forKey: .dutyPersonCode)) ?? TransformAssetDetailPhotograph.defaultDutyPersonCode
        sourceSystem = (try? container.decode(String.self, forKey: .sourceSystem)) ?? TransformAssetDetailPhotograph.defaultSourceSystem
        bookTypeCode = (try? container.decode(String.self, forKey: .bookTypeCode)) ?? TransformAssetDetailPhotograph.defaultBookTypeCode
        sourceSystemId = (try? container.decode(String.self, forKey: .sourceSystemId)) ?? TransformAssetDetailPhotograph.defaultSourceSystemId
        usedPersonId = (try? container.decode(String.self, forKey: .usedPersonId)) ?? TransformAssetDetailPhotograph.defaultUsedPersonId
        usedPersonAccount = (try? container.decode(String.self, forKey: .usedPersonAccount)) ?? TransformAssetDetailPhotograph.defaultUsedPersonAccount
        usedPersonName = (try? container.decode(String.self, forKey: .usedPersonName)) ?? TransformAssetDetailPhotograph.defaultUsedPersonName
        operatePersonId = (try? container.decode(String.self, forKey: .operatePersonId)) ?? TransformAssetDetailPhotograph.defaultOperatePersonId
        operatePersonCode = (try? container.decode(String.self, forKey: .operatePersonCode)) ?? TransformAssetDetailPhotograph.defaultOperatePersonCode
        operatePersonName = (try? container.decode(String.self, forKey: .operatePersonName)) ?? TransformAssetDetailPhotograph.defaultOperatePersonName
        confirmPersonId = (try? container.decode(String.self, forKey: .confirmPersonId)) ?? TransformAssetDetailPhotograph.defaultConfirmPersonId
        confirmPersonAccount = (try? container.decode(String.self, forKey: .confirmPersonAccount)) ?? TransformAssetDetailPhotograph.defaultConfirmPersonAccount
        confirmPersonName = (try? container.decode(String.self, forKey: .confirmPersonName)) ?? TransformAssetDetailPhotograph.defaultConfirmPersonName
        confirmFlag = (try? container.decode(String.self, forKey: .confirmFlag)) ?? TransformAssetDetailPhotograph.defaultConfirmFlag
        confirmDate = (try? container.decode(String.self, forKey: .confirmDate)) ?? TransformAssetDetailPhotograph.defaultConfirmDate
        confirmDesc = (try? container.decode(String.self, forKey: .confirmDesc)) ?? TransformAssetDetailPhotograph.defaultConfirmDesc
        scanningPersonId = (try? container.decode(String.self, forKey: .scanningPersonId)) ?? TransformAssetDetailPhotograph.defaultScanningPersonId
        scanningPersonAccount = (try? container.decode(String.self, forKey: .scanningPersonAccount)) ?? TransformAssetDetailPhotograph.defaultScanningPersonAccount
        scanningPersonName = (try? container.decode(String.self, forKey: .scanningPersonName)) ?? TransformAssetDetailPhotograph.defaultScanningPersonName
        scanningDate = (try? container.decode(String.self, forKey: .scanningDate)) ?? TransformAssetDetailPhotograph.defaultScanningDate
        operatePersonAccount = (try? container.decode(String.self, forKey: .operatePersonAccount)) ?? TransformAssetDetailPhotograph.defaultOperatePersonAccount
        newTypeId = (try? container.decode(String.self, forKey: .newTypeId)) ?? TransformAssetDetailPhotograph.defaultNewTypeId
        newTypeDescriptionName = (try? container.decode(String.self, forKey: .newTypeDescriptionName)) ?? TransformAssetDetailPhotograph.defaultNewTypeDescriptionName
        newTypeDescriptionCode = (try? container.decode(String.self, forKey: .newTypeDescriptionCode)) ?? TransformAssetDetailPhotograph.defaultNewTypeDescriptionCode
        billLineStatus = (try? container.decode(String.self, forKey: .billLineStatus)) ?? TransformAssetDetailPhotograph.defaultBillLineStatus
        dutyIsChanged = (try? container.decode(String.self, forKey: .dutyIsChanged)) ?? TransformAssetDetailPhotograph.defaultDutyIsChanged
        erpAssetsBuild = (try? container.decode(String.self, forKey: .erpAssetsBuild)) ?? TransformAssetDetailPhotograph.defaultErpAssetsBuild
        erpSupportCode = (try? container.decode(String.self, forKey: .erpSupportCode)) ?? TransformAssetDetailPhotograph.defaultErpSupportCode
        erpSupportName = (try? container.decode(String.self, forKey: .erpSupportName)) ?? TransformAssetDetailPhotograph.defaultErpSupportName
        erpBusinessPlatformId = (try? container.decode(String.self, forKey: .erpBusinessPlatformId)) ?? TransformAssetDetailPhotograph.defaultErpBusinessPlatformId
        erpBusinessPlatformCode = (try? container.decode(String.self, forKey: .erpBusinessPlatformCode)) ?? TransformAssetDetailPhotograph.defaultErpBusinessPlatformCode
        erpBusinessPlatformName = (try? container.decode(String.self, forKey: .erpBusinessPlatformName)) ?? TransformAssetDetailPhotograph.defaultErpBusinessPlatformName
        erpNetworkLevelId = (try? container.decode(String.self, forKey: .erpNetworkLevelId)) ?? TransformAssetDetailPhotograph.defaultErpNetworkLevelId
        erpNetworkLevelCode = (try? container.decode(String.self, forKey: .erpNetworkLevelCode)) ?? TransformAssetDetailPhotograph.defaultErpNetworkLevelCode
        erpNetworkLevelName = (try? container.decode(String.self, forKey: .erpNetworkLevelName)) ?? TransformAssetDetailPhotograph.defaultErpNetworkLevelName
        parentBillCode = (try? container.decode(String.self, forKey: .parentBillCode)) ?? TransformAssetDetailPhotograph.defaultParentBillCode
        isExpensionAssets = (try? container.decode(String.self, forKey: .isExpensionAssets)) ?? TransformAssetDetailPhotograph.defaultIsExpensionAssets
        uomOfTransfer = (try? container.decode(String.self, forKey: .uomOfTransfer)) ?? TransformAssetDetailPhotograph.defaultUomOfTransfer
        quantitiyOfTransfer = (try? container.decode(String.self, forKey: .quantitiyOfTransfer)) ?? TransformAssetDetailPhotograph.defaultQuantitiyOfTransfer
        vendorId = (try? container.decode(String.self, forKey: .vendorId)) ?? TransformAssetDetailPhotograph.defaultVendorId
        vendorName = (try? container.decode(String.self, forKey: .vendorName)) ?? TransformAssetDetailPhotograph.defaultVendorName
        qrcode = (try? container.decode(String.self, forKey: .qrcode)) ?? TransformAssetDetailPhotograph.defaultQrcode
        appTaskCode = (try? container.decode(String.self, forKey: .appTaskCode)) ?? TransformAssetDetailPhotograph.defaultAppTaskCode
        isautomatic = (try? container.decode(String.self, forKey: .isautomatic)) ?? TransformAssetDetailPhotograph.defaultIsautomatic
        zhLabel = (try? container.decode(String.self, forKey: .zhLabel)) ?? TransformAssetDetailPhotograph.defaultZhLabel
        longitude = (try? container.decode(String.self, forKey: .longitude)) ?? TransformAssetDetailPhotograph.defaultLongitude
        latitude = (try? container.decode(String.self, forKey: .latitude)) ?? TransformAssetDetailPhotograph.defaultLatitude
        mapLocationDesc = (try? container.decode(String.self, forKey: .mapLocationDesc)) ?? TransformAssetDetailPhotograph.defaultMapLocationDesc
        photoRequired = (try? container.decode(String.self, forKey: .photoRequired)) ?? TransformAssetDetailPhotograph.defaultPhotoRequired
        locationRequired = (try? container.decode(String.self, forKey: .locationRequired)) ?? TransformAssetDetailPhotograph.defaultLocationRequired
        assetCheckItem = (try? container.decode(String.self, forKey: .assetCheckItem)) ?? TransformAssetDetailPhotograph.defaultAssetCheckItem
        assetCheckItemName = (try? container.decode(String.self, forKey: .assetCheckItemName)) ?? TransformAssetDetailPhotograph.defaultAssetCheckItemName
        resourceNumber = (try? container.decode(String.self, forKey: .resourceNumber)) ?? TransformAssetDetailPhotograph.defaultResourceNumber
    }
}

extension TransformDetail {
    enum CodingKeys: String, CodingKey {
        case appTaskId
        case appTaskCode
        case appTaskSource
        case appTaskStatus
        case billCode
        case operatorId
        case operatorCode
        case operatorName
        case locationId
        case locationCode
        case locationName
        case taskType
        case createdBy
        case lastUpdateDate
        case deliveryDate
        case urgeTimes
        case assetSum
        case assetFinished
        case assetUnfinished
        case treatmentStatus
        case longitude
        case latitude
        case mapLocationDesc
        case photoRequired
        case locationRequired
        case appTaskStatusName
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        appTaskId = (try? container.decode(String.self, forKey: .appTaskId)) ?? TransformDetail.defaultAppTaskId
        appTaskCode = (try? container.decode(String.self, forKey: .appTaskCode)) ?? TransformDetail.defaultAppTaskCode
        appTaskSource = (try? container.decode(String.self, forKey: .appTaskSource)) ?? TransformDetail.defaultAppTaskSource
        appTaskStatus = (try? container.decode(String.self, forKey: .appTaskStatus)) ?? TransformDetail.defaultAppTaskStatus
        billCode = (try? container.decode(String.self, forKey: .billCode)) ?? TransformDetail.defaultBillCode
        operatorId = (try? container.decode(String.self, forKey: .operatorId)) ?? TransformDetail.defaultOperatorId
        operatorCode = (try? container.decode(String.self, forKey: .operatorCode)) ?? TransformDetail.defaultOperatorCode
        operatorName = (try? container.decode(String.self, forKey: .operatorName)) ?? TransformDetail.defaultOperatorName
        locationId = (try? container.decode(String.self, forKey: .locationId)) ?? TransformDetail.defaultLocationId
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? TransformDetail.defaultLocationCode
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? TransformDetail.defaultLocationName
        taskType = (try? container.decode(String.self, forKey: .taskType)) ?? TransformDetail.defaultTaskType
        createdBy = (try? container.decode(String.self, forKey: .createdBy)) ?? TransformDetail.defaultCreatedBy
        lastUpdateDate = (try? container.decode(String.self, forKey: .lastUpdateDate)) ?? TransformDetail.defaultLastUpdateDate
        deliveryDate = (try? container.decode(String.self, forKey: .deliveryDate)) ?? TransformDetail.defaultDeliveryDate
        urgeTimes = (try? container.decode(Int.self, forKey: .urgeTimes)) ?? TransformDetail.defaultUrgeTimes
        assetSum = (try? container.decode(Int.self, forKey: .assetSum)) ?? TransformDetail.defaultAssetSum
        assetFinished = (try? container.decode(Int.self, forKey: .assetFinished)) ?? TransformDetail.defaultAssetFinished
        assetUnfinished = (try? container.decode(Int.self, forKey: .assetUnfinished)) ?? TransformDetail.defaultAssetUnfinished
        treatmentStatus = (try? container.decode(String.self, forKey: .treatmentStatus)) ?? TransformDetail.defaultTreatmentStatus
        longitude = (try? container.decode(String.self, forKey: .longitude)) ?? TransformDetail.defaultLongitude
        latitude = (try? container.decode(String.self, forKey: .latitude)) ?? TransformDetail.defaultLatitude
        mapLocationDesc = (try? container.decode(String.self, forKey: .mapLocationDesc)) ?? TransformDetail.defaultMapLocationDesc
        photoRequired = (try? container.decode(String.self, forKey: .photoRequired)) ?? TransformDetail.defaultPhotoRequired
        locationRequired = (try? container.decode(String.self, forKey: .locationRequired)) ?? TransformDetail.defaultLocationRequired
        appTaskStatusName = (try? container.decode(String.self, forKey: .appTaskStatusName)) ?? TransformDetail.defaultAppTaskStatusName
    }
}

extension Version {
    enum CodingKeys: String, CodingKey {
        case appType
        case appVersionCode
        case appVersionName
        case appName
        case appPath
        case appDownloadUrl
        case appDesc
        case appExt
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        appType = (try? container.decode(App.Category.self, forKey: .appType)) ?? Version.defaultAppType
        appVersionCode = (try? container.decode(String.self, forKey: .appVersionCode)) ?? Version.defaultAppVersionCode
        appVersionName = (try? container.decode(String.self, forKey: .appVersionName)) ?? Version.defaultAppVersionName
        appName = (try? container.decode(String.self, forKey: .appName)) ?? Version.defaultAppName
        appPath = (try? container.decode(String.self, forKey: .appPath)) ?? Version.defaultAppPath
        appDownloadUrl = (try? container.decode(String.self, forKey: .appDownloadUrl)) ?? Version.defaultAppDownloadUrl
        appDesc = (try? container.decode(String.self, forKey: .appDesc)) ?? Version.defaultAppDesc
        appExt = (try? container.decode(String.self, forKey: .appExt)) ?? Version.defaultAppExt
    }
}
