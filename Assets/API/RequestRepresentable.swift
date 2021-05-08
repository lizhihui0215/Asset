//
//  BaseRequest.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/14.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import BrightFutures
import Foundation

typealias APIFuture<Success> = Future<Success, Error>

public extension HTTPHeader {
    enum Keys: String {
        case AppInfo = "appInfo"
        case UserToken = "userToken"
    }

    static func appInfo(_ value: [String: String]) -> HTTPHeader {
        HTTPHeader(key: .AppInfo, value: value.eam.JSONString)
    }

    static func userToken(_ value: String) -> HTTPHeader {
        HTTPHeader(key: .UserToken, value: value)
    }

    init(key: Keys, value: String) {
        self.init(name: key.rawValue, value: value)
    }
}

// TODO: enhancement request init with parameter
//       add more behavior for request handler
protocol RequestRepresentable {
    var apiClient: NetworkManager { get }

    func dataRequest<T: DataResponse>(of type: T.Type, router: APIRouter) -> APIFuture<T.Model?>

    func listRequest<T: PageableResponse>(of type: T.Type, router: APIRouter) -> APIFuture<T>
}

extension RequestRepresentable {
    var apiClient: NetworkManager {
        NetworkManager.default
    }

    func dataRequest<T: DataResponse>(of type: T.Type, router: APIRouter) -> APIFuture<T.Model?> {
        apiClient.sendRequest(of: type, router: router).flatMap { response in
            APIFuture { complete in
                do {
                    let data = try response.result.get()
                    complete(.success(data.data))
                } catch {
                    complete(.failure(error))
                }
            }
        }
    }

    func listRequest<T: PageableResponse>(of type: T.Type, router: APIRouter) -> APIFuture<T> {
        apiClient.sendRequest(of: type, router: router).flatMap { response in
            APIFuture { complete in
                do {
                    let data = try response.result.get()
                    complete(.success(data))
                } catch {
                    complete(.failure(error))
                }
            }
        }
    }
}
