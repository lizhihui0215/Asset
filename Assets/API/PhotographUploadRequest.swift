//
//  PhotographUploadRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

struct PhotographUploadRequest: RequestRepresentable {}

struct PhotographUploadParameter: Encodable {
    enum Category {
        case asset(tagNumber: String)
        case location(locationCode: String)
    }

    enum CodingKeys: String, CodingKey {
        enum Category: String, CodingKey {
            case tagNumber
            case locationCode
        }

        case category
        case longitude
        case latitude
        case file
    }

    let category: Category
    let longitude: String
    let latitude: String
    let file: String?
    var data: Data

    init(category: Category, longitude: String, latitude: String, file: String? = "\(UUID()).jpg", data: Data = Data()) {
        self.category = category
        self.longitude = longitude
        self.latitude = latitude
        self.file = file
        self.data = data
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(longitude, forKey: .longitude)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(file, forKey: .file)

        var categoryContainer = encoder.container(keyedBy: CodingKeys.Category.self)

        switch category {
        case .asset(tagNumber: let tagNumber):
            try categoryContainer.encode(tagNumber, forKey: .tagNumber)
        case .location(locationCode: let locationCode):
            try categoryContainer.encode(locationCode, forKey: .locationCode)
        }
    }
}

struct PhotographUploadResponse: DataResponse {
    var status: Int = 0
    var msg: String = App.Constants.Default.string
    var data: Photo?
}
