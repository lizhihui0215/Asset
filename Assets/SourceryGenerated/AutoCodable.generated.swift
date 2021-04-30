// Generated using Sourcery 1.4.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

extension Asset {

    enum CodingKeys: String, CodingKey {
        case status
        case code
        case name
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        status = (try? container.decode(InventoryType.self, forKey: .status)) ?? Asset.defaultStatus
        code = (try? container.decode(String.self, forKey: .code)) ?? Asset.defaultCode
        name = (try? container.decode(String.self, forKey: .name)) ?? Asset.defaultName
    }

}

extension Credential {

    enum CodingKeys: String, CodingKey {
        case userToken
        case pageSize
        case userOrgName
        case userCityName
        case userOrgId
        case userCityId
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        userToken = (try? container.decode(String.self, forKey: .userToken)) ?? Credential.defaultUserToken
        pageSize = (try? container.decode(String.self, forKey: .pageSize)) ?? Credential.defaultPageSize
        userOrgName = (try? container.decode(String.self, forKey: .userOrgName)) ?? Credential.defaultUserOrgName
        userCityName = (try? container.decode(String.self, forKey: .userCityName)) ?? Credential.defaultUserCityName
        userOrgId = (try? container.decode(String.self, forKey: .userOrgId)) ?? Credential.defaultUserOrgId
        userCityId = (try? container.decode(String.self, forKey: .userCityId)) ?? Credential.defaultUserCityId
    }

}

extension InventoryType {

    enum CodingKeys: String, CodingKey {
        case all
        case surplus
        case deficit
        case nonInventory
        case inventoried
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let enumCase = try container.decode(String.self)
        switch enumCase {
        case CodingKeys.all.rawValue: self = .all
        case CodingKeys.surplus.rawValue: self = .surplus
        case CodingKeys.deficit.rawValue: self = .deficit
        case CodingKeys.nonInventory.rawValue: self = .nonInventory
        case CodingKeys.inventoried.rawValue: self = .inventoried
        default: throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Unknown enum case '\(enumCase)'"))
        }
    }

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case .all: try container.encode(CodingKeys.all.rawValue)
        case .surplus: try container.encode(CodingKeys.surplus.rawValue)
        case .deficit: try container.encode(CodingKeys.deficit.rawValue)
        case .nonInventory: try container.encode(CodingKeys.nonInventory.rawValue)
        case .inventoried: try container.encode(CodingKeys.inventoried.rawValue)
        }
    }

}

extension Location {

    enum CodingKeys: String, CodingKey {
        case isCheck
        case locationCode
        case locationName
        case assetLocationId
    }

    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        isCheck = (try? container.decode(Bool.self, forKey: .isCheck)) ?? Location.defaultIsCheck
        locationCode = (try? container.decode(String.self, forKey: .locationCode)) ?? Location.defaultLocationCode
        locationName = (try? container.decode(String.self, forKey: .locationName)) ?? Location.defaultLocationName
        assetLocationId = (try? container.decode(String.self, forKey: .assetLocationId)) ?? Location.defaultAssetLocationId
    }

}

extension LocationDetail {

    enum CodingKeys: String, CodingKey {
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
