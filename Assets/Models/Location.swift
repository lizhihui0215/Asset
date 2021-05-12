//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

struct Location {
    var isCheck: Bool
    var locationCode: String
    var locationName: String
    var assetLocationId: String
    var stLongitude: String
    var strLatitude: String
}

extension Location: Item {}
extension Location: AutoEquatable {}
extension Location: AutoCodable {
    static let defaultIsCheck = false
    static let defaultLocationCode = ""
    static let defaultLocationName = ""
    static let defaultAssetLocationId = ""
    static let defaultStLongitude = ""
    static let defaultStrLatitude = ""
}

struct LocationReGeocode: AutoEncodable {
    /// 国家编码属性
    var countryCode: String

    /// 省份名字属性
    var province: String

    /// 城市名字属性
    var city: String

    /// 区名字属性
    var district: String

    /// 乡镇名字属性
    var town: String

    /// 街道名字属性
    var street: String

    /// 街道号码属性
    var streetNumber: String

    /// 城市编码属性
    var cityCode: String

    /// 行政区划编码属性
    var adCode: String

    /// 位置语义化结果的定位点在什么地方周围的描述信息
    var locationDescribe: String

    /// 国家名字属性
    var country: String

    /// 位置语义化结果的定位点在什么地方周围的描述信息
    var poiRegion: LocationPoiRegion
}

extension LocationReGeocode: EAMExtended {}

struct LocationPoiRegion: AutoEncodable {
    /// BMKLocationPoiRegion的方向属性，如『内』、『外』
    var directionDesc: String
    /// BMKLocationPoiRegion的名字属性
    var name: String
    /// BMKLocationPoiRegion的标签属性
    var tags: String
}
