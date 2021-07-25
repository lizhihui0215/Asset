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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let enumCase = try container.decode(String.self)
        switch enumCase {
        case CodingKeys.principal.rawValue: self = .principal
        case CodingKeys.user.rawValue: self = .user
        default: throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Unknown enum case '\(enumCase)'"))
        }
    }

    internal func encode(to encoder: Encoder) throws {
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

    internal init(from decoder: Decoder) throws {
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

    internal init(from decoder: Decoder) throws {
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
