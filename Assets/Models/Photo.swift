//
// Created by lizhihui on 2021/5/13.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct Photo {
    var imageId: String
    var imagePath: String
    var imageName: String
    var uploadTime: String
    var uploadType: String
    var uploadPerson: String
    var longitude: String
    var latitude: String
    var url: String
}

extension Photo: AutoEquatable {}

extension Photo: AutoCodable {
    static let defaultImageId = ""
    static let defaultImagePath = ""
    static let defaultImageName = ""
    static let defaultUploadTime = ""
    static let defaultUploadType = ""
    static let defaultUploadPerson = ""
    static let defaultLongitude = ""
    static let defaultLatitude = ""
    static let defaultUrl = ""
}
