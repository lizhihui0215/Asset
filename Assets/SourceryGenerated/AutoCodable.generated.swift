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

extension AssetDetail {

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

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? AssetDetail.defaultIsCheck
        assetId = (try? container.decode(String.self, forKey: .assetId)) ?? AssetDetail.defaultAssetId
        tagNumber = (try? container.decode(String.self, forKey: .tagNumber)) ?? AssetDetail.defaultTagNumber
        assetName = (try? container.decode(String.self, forKey: .assetName)) ?? AssetDetail.defaultAssetName
        checkTime = (try? container.decode(String.self, forKey: .checkTime)) ?? AssetDetail.defaultCheckTime
        checkStatus = (try? container.decode(String.self, forKey: .checkStatus)) ?? AssetDetail.defaultCheckStatus
        checkStatusName = (try? container.decode(String.self, forKey: .checkStatusName)) ?? AssetDetail.defaultCheckStatusName
        realLocationCode = (try? container.decode(String.self, forKey: .realLocationCode)) ?? AssetDetail.defaultRealLocationCode
        realLocationName = (try? container.decode(String.self, forKey: .realLocationName)) ?? AssetDetail.defaultRealLocationName
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? AssetDetail.defaultLocationCode
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? AssetDetail.defaultLocationName
        checkPerson = (try? container.decode(String.self, forKey: .checkPerson)) ?? AssetDetail.defaultCheckPerson
        lastCheckPerson = (try? container.decode(String.self, forKey: .lastCheckPerson)) ?? AssetDetail.defaultLastCheckPerson
        manufactureName = (try? container.decode(String.self, forKey: .manufactureName)) ?? AssetDetail.defaultManufactureName
        modelNumber = (try? container.decode(String.self, forKey: .modelNumber)) ?? AssetDetail.defaultModelNumber
        quantity = (try? container.decode(String.self, forKey: .quantity)) ?? AssetDetail.defaultQuantity
        dutyPerson = (try? container.decode(String.self, forKey: .dutyPerson)) ?? AssetDetail.defaultDutyPerson
        dutyPersonName = (try? container.decode(String.self, forKey: .dutyPersonName)) ?? AssetDetail.defaultDutyPersonName
        usePerson = (try? container.decode(String.self, forKey: .usePerson)) ?? AssetDetail.defaultUsePerson
        usePersonName = (try? container.decode(String.self, forKey: .usePersonName)) ?? AssetDetail.defaultUsePersonName
        typeDescriptionCode = (try? container.decode(String.self, forKey: .typeDescriptionCode)) ?? AssetDetail.defaultTypeDescriptionCode
        typeDescriptionName = (try? container.decode(String.self, forKey: .typeDescriptionName)) ?? AssetDetail.defaultTypeDescriptionName
        longitude = (try? container.decode(String.self, forKey: .longitude)) ?? AssetDetail.defaultLongitude
        latitude = (try? container.decode(String.self, forKey: .latitude)) ?? AssetDetail.defaultLatitude
        mapLocationDesc = (try? container.decode(String.self, forKey: .mapLocationDesc)) ?? AssetDetail.defaultMapLocationDesc
        assetCheckItem = (try? container.decode(String.self, forKey: .assetCheckItem)) ?? AssetDetail.defaultAssetCheckItem
        assetCheckItemName = (try? container.decode(String.self, forKey: .assetCheckItemName)) ?? AssetDetail.defaultAssetCheckItemName
        resourceNumber = (try? container.decode(String.self, forKey: .resourceNumber)) ?? AssetDetail.defaultResourceNumber
    }

}

extension Credential {

    enum CodingKeys: String, CodingKey {
        case userToken
        case pageSize
        case username
        case userOrgName
        case userCityName
        case userOrgId
        case userCityId
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        userToken = (try? container.decode(String.self, forKey: .userToken)) ?? Credential.defaultUserToken
        pageSize = (try? container.decode(String.self, forKey: .pageSize)) ?? Credential.defaultPageSize
        username = (try? container.decode(String.self, forKey: .username)) ?? Credential.defaultUsername
        userOrgName = (try? container.decode(String.self, forKey: .userOrgName)) ?? Credential.defaultUserOrgName
        userCityName = (try? container.decode(String.self, forKey: .userCityName)) ?? Credential.defaultUserCityName
        userOrgId = (try? container.decode(String.self, forKey: .userOrgId)) ?? Credential.defaultUserOrgId
        userCityId = (try? container.decode(String.self, forKey: .userCityId)) ?? Credential.defaultUserCityId
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



