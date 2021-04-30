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
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)

                    if let prettyString = String(data: prettyData, encoding: .utf8) {
                        log.debug("Body: \n", context: prettyString)
                    }
                } catch {
                    if let string = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                        log.debug("Body: \n", context: string)
                    }
                }
            }
        }
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
