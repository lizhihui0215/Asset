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
