//
//  NetworkActivityLogger.swift
//  Assets
//
//  Created by ZhiHui.Li on 2021/4/15.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Alamofire
import Foundation

/// `NetworkActivityLogger` logs requests and responses made by Alamofire.SessionManager, with an adjustable level of detail.
public class NetworkActivityLogger {
    // MARK: - Properties

    /// The shared network activity logger for the system.
    public static let shared = NetworkActivityLogger()

    /// Omit requests which match the specified predicate, if provided.
    public var filterPredicate: NSPredicate?

    private let queue = DispatchQueue(label: "\(NetworkActivityLogger.self) Queue")

    // MARK: - Internal - Initialization

    init() {}

    deinit {
        stopLogging()
    }

    // MARK: - Logging

    /// Start logging requests and responses.
    public func startLogging() {
        stopLogging()

        let notificationCenter = NotificationCenter.default

        notificationCenter.addObserver(
            self,
            selector: #selector(NetworkActivityLogger.requestDidStart(notification:)),
            name: Request.didResumeNotification,
            object: nil
        )

        notificationCenter.addObserver(
            self,
            selector: #selector(NetworkActivityLogger.requestDidFinish(notification:)),
            name: Request.didFinishNotification,
            object: nil
        )
    }

    /// Stop logging requests and responses.
    public func stopLogging() {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Private - Notifications

    @objc private func requestDidStart(notification: Notification) {
        queue.async {
            guard let dataRequest = notification.request as? DataRequest,
                  let task = dataRequest.task,
                  let request = task.originalRequest,
                  let httpMethod = request.httpMethod,
                  let requestURL = request.url
            else {
                return
            }

            if let filterPredicate = self.filterPredicate, filterPredicate.evaluate(with: request) {
                return
            }

            let cURL = dataRequest.cURLDescription()
            log.info("\(httpMethod) '\(requestURL.absoluteString)':")
            log.debug("cURL:\n", context: cURL)
        }
    }

    @objc private func requestDidFinish(notification: Notification) {
        queue.async {
            guard let dataRequest = notification.request as? DataRequest,
                  let task = dataRequest.task,
                  let metrics = dataRequest.metrics,
                  let request = task.originalRequest,
                  let httpMethod = request.httpMethod,
                  let requestURL = request.url
            else {
                return
            }

            if let filterPredicate = self.filterPredicate, filterPredicate.evaluate(with: request) {
                return
            }

            let elapsedTime = metrics.taskInterval.duration

            if let error = task.error {
                log.error("[Error] \(httpMethod) '\(requestURL.absoluteString)' [\(String(format: "%.04f", elapsedTime)) s]:")
                log.error(error)
            } else {
                guard let response = task.response as? HTTPURLResponse else {
                    return
                }

                log.info("\(String(response.statusCode)) '\(requestURL.absoluteString)' [\(String(format: "%.04f", elapsedTime)) s]:")
                self.logHeaders(headers: response.allHeaderFields)
                guard let data = dataRequest.data else { return }
                do {
                    if let dataString = String(data: data, encoding: .utf8),
                       let decrypt = try? dataString.aes(.decrypt()).data(using: .utf8),
                       let prettyData = try? self.prettyPrinted(data: decrypt),
                       let prettyString = String(data: prettyData, encoding: .utf8)
                    {
                        log.debug("Body: \n", context: prettyString)
                    }

                    let prettyData = try self.prettyPrinted(data: data)

                    if let prettyString = String(data: prettyData, encoding: .utf8) {
                        log.debug("Body encrypt: \n", context: prettyString)
                    }
                } catch {
                    if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                        log.debug("Body: \n", context: string)
                    }
                }
            }
        }
    }

    func prettyPrinted(data: Data) throws -> Data {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        return try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
    }
}

public extension Request {
    /// cURL representation of the instance.
    ///
    /// - Returns: The cURL equivalent of the instance.
    func cURLDescription() -> String {
        guard
            let request = lastRequest,
            let url = request.url,
            let host = url.host,
            let method = request.httpMethod else { return "$ curl command could not be created" }

        var components = ["$ curl -v"]

        components.append("-X \(method)")

        if let credentialStorage = delegate?.sessionConfiguration.urlCredentialStorage {
            let protectionSpace = URLProtectionSpace(host: host,
                                                     port: url.port ?? 0,
                                                     protocol: url.scheme,
                                                     realm: host,
                                                     authenticationMethod: NSURLAuthenticationMethodHTTPBasic)

            if let credentials = credentialStorage.credentials(for: protectionSpace)?.values {
                for credential in credentials {
                    guard let user = credential.user, let password = credential.password else { continue }
                    components.append("-u \(user):\(password)")
                }
            } else {
                if let credential = credential, let user = credential.user, let password = credential.password {
                    components.append("-u \(user):\(password)")
                }
            }
        }

        if let configuration = delegate?.sessionConfiguration, configuration.httpShouldSetCookies {
            if
                let cookieStorage = configuration.httpCookieStorage,
                let cookies = cookieStorage.cookies(for: url), !cookies.isEmpty
            {
                let allCookies = cookies.map { "\($0.name)=\($0.value)" }.joined(separator: ";")

                components.append("-b \"\(allCookies)\"")
            }
        }

        var headers = HTTPHeaders()

        if let sessionHeaders = delegate?.sessionConfiguration.headers {
            for header in sessionHeaders where header.name != "Cookie" {
                headers[header.name] = header.value
            }
        }

        for header in request.headers where header.name != "Cookie" {
            headers[header.name] = header.value
        }

        for header in headers {
            let escapedValue = header.value.replacingOccurrences(of: "\"", with: "\\\"")
            components.append("-H \"\(header.name): \(escapedValue)\"")
        }

        if let httpBodyData = request.httpBody {
            let httpBody = String(decoding: httpBodyData, as: UTF8.self)
            var escapedBody = httpBody.replacingOccurrences(of: "\\\"", with: "\\\\\"")
            escapedBody = escapedBody.replacingOccurrences(of: "\"", with: "\\\"")

            if let decrypt = try? escapedBody.aes(.decrypt(API.AESKey.request.rawValue)) {
                components.append("-d \"\(decrypt)\"")
            }
            escapedBody = escapedBody.replacingOccurrences(of: "\r", with: "\\r")
            components.append("#E \"\(escapedBody)\"")
        }

        components.append("\"\(url.absoluteString)\"")

        return components.joined(separator: " \\\n\t")
    }
}

private extension NetworkActivityLogger {
    func logHeaders(headers: [AnyHashable: Any]) {
        var headerString = "[\n"
        for (key, value) in headers {
            headerString.append("    \(key): \(value) \n")
        }
        headerString.append(" ]")
        log.debug("Headers:\n", context: headerString)
    }
}
