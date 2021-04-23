//
//  BaseResponse.swift
//  Asset
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

protocol ResponseRepresentable: Decodable {
    var status: Int { get set }
    var msg: String { get set }
}

protocol DataResponse: ResponseRepresentable {
    associatedtype Model: Decodable
    var data: Model? { get set }
    init()
}

protocol PageableResponse: ResponseRepresentable {
    associatedtype Model: Decodable
    var page: Int { get set }
    var total: Int { get set }
    var records: Int { get set }
    var data: [Model] { get set }
    init()
}

enum CodingKeys {
    enum Base: String, CodingKey {
        case status
        case msg
        case data
    }

    enum List: String, CodingKey {
        case status
        case msg
        case data = "rows"
        case page
        case total
        case records
    }
}

extension PageableResponse {
    public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.List.self)
        let status: Int = try container.decodeIfPresent(.status) ?? 0
        let msg: String = try container.decodeIfPresent(.msg) ?? AEMError.unknown.recoverySuggestion ?? ""
        let data: [Model] = try container.decodeIfPresent(.data) ?? []
        let page: String = try container.decodeIfPresent(.page) ?? ""
        let total: String = try container.decodeIfPresent(.total) ?? ""
        let records: String = try container.decodeIfPresent(.records) ?? ""
        self.status = status
        self.msg = msg
        self.data = data
        self.page = Int(page) ?? 0
        self.total = Int(total) ?? 0
        self.records = Int(records) ?? 0
    }
}

extension DataResponse {
    public init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.Base.self)
        let status: Int = try container.decodeIfPresent(.status) ?? 0
        let msg: String = try container.decodeIfPresent(.msg) ?? AEMError.unknown.recoverySuggestion ?? ""
        let data: Model? = try container.decodeIfPresent(.data)
        self.status = status
        self.msg = msg
        self.data = data
    }
}
