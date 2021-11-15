//
//  Siren.swift
//  Siren
//
//  Created by ZhiHui.Li on 2021/4/18.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import UIKit

public protocol APIManager {
    /// Return results or errors obtained from performing a version check with Siren.
    typealias CompletionHandler = (Result<APIModel, VersionError>) -> Void
    func performVersionCheckRequest(completion handler: CompletionHandler?)
}

/// Siren-specific `UserDefaults` Keys
public enum SirenKeys: String {
    /// Key that notifies Siren to perform a version check and present
    /// the Siren alert the next time the user launches the app.
    case PerformVersionCheckOnSubsequentLaunch

    /// Key that stores the timestamp of the last version check.
    case StoredVersionCheckDate

    /// Key that stores the version that a user decided to skip.
    case StoredSkippedVersion
}

/// The Siren Class.
public final class Siren: NSObject {
    /// Return results or errors obtained from performing a version check with Siren.
    public typealias ResultsHandler = (Result<UpdateResults, VersionError>) -> Void

    /// The Siren singleton. The main point of entry to the Siren library.
    public static let shared = Siren()

    /// The manager that controls the update alert's string localization and tint color.
    ///
    /// Defaults the string's lange localization to the user's device localization.
    public lazy var presentationManager: PresentationManager = .default

    /// The manager that controls the type of alert that should be displayed
    /// and how often an alert should be displayed dpeneding on the type
    /// of update that is available relative to the installed version of the app
    /// (e.g., different rules for major, minor, patch and revision updated can be used).
    ///
    /// Defaults to performing a version check once a day with an alert that allows
    /// the user to skip updating the app until the next time the app becomes active or
    /// skipping the update all together until another version is released.
    public lazy var rulesManager: RulesManager = .default

    /// The current installed version of your app.
    lazy var currentInstalledVersion: String? = Bundle.version()

    /// The retained `NotificationCenter` observer that listens for `UIApplication.didBecomeActiveNotification` notifications.
    var applicationDidBecomeActiveObserver: NSObjectProtocol?

    /// The retained `NotificationCenter` observer that listens for `UIApplication.willResignActiveNotification` notifications.
    var applicationWillResignActiveObserver: NSObjectProtocol?

    /// The retained `NotificationCenter` observer that listens for `UIApplication.didEnterBackgroundNotification` notifications.
    var applicationDidEnterBackgroundObserver: NSObjectProtocol?

    /// The last date that an alert was presented to the user.
    @UserDefault(key: SirenKeys.StoredVersionCheckDate, defaultValue: nil)
    private var alertPresentationDate: Date?

    @UserDefault(key: SirenKeys.StoredSkippedVersion, defaultValue: nil)
    private var storedSkippedVersion: String?

    public var apiManager: APIManager?

    /// The completion handler used to return the results or errors returned by Siren.
    private var resultsHandler: ResultsHandler?

    /// The deinitialization method that clears out all observers,
    deinit {
        presentationManager.cleanUp()
        removeForegroundObservers()
        removeBackgroundObservers()
    }
}

// MARK: - Public API Interface

public extension Siren {
    /// This method executes the Siren version checking and alert presentation flow.
    ///
    /// - Parameters:
    ///   - performCheck: Defines how the version check flow is entered. Defaults to `.onForeground`.
    ///   - handler: Returns the metadata around a successful version check and interaction with the update modal or it returns nil.
    func wail(performCheck: PerformCheck = .onForeground,
              isClearHandler: Bool = false,
              completion handler: ResultsHandler? = nil)
    {
        if let handler = handler {
            resultsHandler = handler
        } else if isClearHandler {
            resultsHandler = handler
        }

        switch performCheck {
        case .immediately:
            performVersionCheck()
        case .onDemand:
            removeForegroundObservers()
            performVersionCheck()
        case .onForeground:
            addForegroundObservers()
        }

        // Add background app state change observers.
        addBackgroundObservers()
    }

    /// Launches the AppStore in two situations when the user clicked the `Update` button in the UIAlertController modal.
    ///
    /// This function is marked `public` as a convenience for those developers who decide to build a custom alert modal
    /// instead of using Siren's prebuilt update alert.
    func launchAppStore(url: String) {
        DispatchQueue.main.async {
            guard let url = URL(string: url) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

// MARK: - Version Check and Alert Presentation Flow

private extension Siren {
    /// Initiates the unidirectional version checking flow.
    func performVersionCheck() {
        guard let apiManager = apiManager else { return }

        guard Bundle.main.bundleIdentifier != nil else {
            resultsHandler?(.failure(.missingBundleID))
            return
        }

        apiManager.performVersionCheckRequest { result in
            switch result {
            case .success(let apiModel):
                self.validate(apiModel: apiModel)
            case .failure(let error):
                self.resultsHandler?(.failure(error))
            }
        }
    }

    /// Validates the parsed and mapped iTunes Lookup Model
    /// to guarantee all the relevant data was returned before
    /// attempting to present an alert.
    ///
    /// - Parameter apiModel: The iTunes Lookup Model.
    func validate(apiModel: APIModel) {
        // Check if the latest version is compatible with current device's version of iOS.
        guard DataParser.isUpdateCompatibleWithDeviceOS(for: apiModel) else {
            resultsHandler?(.failure(.appStoreOSVersionUnsupported))
            return
        }

        // Check and store the App ID .
//        guard let results = apiModel.results else {
//            // TODO: ADD ERROR HANDLER
//            // resultsHandler?(.failure(.appStoreAppIDFailure))
//            return
//        }
        let results = apiModel.results
        // Check and store the current App Store version.
//        guard let currentAppStoreVersion = apiModel.results.version else {
//            resultsHandler?(.failure(.appStoreVersionArrayFailure))
//            return
//        }
        let currentAppStoreVersion = apiModel.results.version

        // Check if the App Store version is newer than the currently installed version.
        guard DataParser.isAppStoreVersionNewer(installedVersion: currentInstalledVersion,
                                                appStoreVersion: currentAppStoreVersion)
        else {
            resultsHandler?(.failure(.noUpdateAvailable))
            return
        }

        // Check the release date of the current version.
        let currentVersionReleaseDate = apiModel.results.currentVersionReleaseDate
        
        if let currentVersionReleaseDate = currentVersionReleaseDate,
              let daysSinceRelease = Date.days(since: currentVersionReleaseDate),
              let releasedForDays = rulesManager.releasedForDays
        {
            // Check if applicaiton has been released for the amount of days defined by the app consuming Siren.
            guard daysSinceRelease >= releasedForDays else {
                resultsHandler?(.failure(.releasedTooSoon(daysSinceRelease: daysSinceRelease,
                                                          releasedForDays: releasedForDays)))
                return
            }
        }

        let model = Model(currentVersionReleaseDate: currentVersionReleaseDate,
                          minimumOSVersion: results.minimumOSVersion,
                          releaseNotes: results.releaseNotes,
                          mainfestPlist: results.mainfestPlist,
                          version: results.version)

        determineIfAlertPresentationRulesAreSatisfied(forCurrentAppStoreVersion: currentAppStoreVersion, andModel: model)
    }

    /// Determines if the update alert can be presented based on the
    /// rules set in the `RulesManager` and the the skip version settings.
    ///
    /// - Parameters:
    ///   - currentAppStoreVersion: The curren version of the app in the App Store.
    ///   - model: The iTunes Lookup Model.
    func determineIfAlertPresentationRulesAreSatisfied(forCurrentAppStoreVersion currentAppStoreVersion: String, andModel model: Model) {
        // Did the user:
        // - request to skip being prompted with version update alerts for a specific version
        // - and is the latest App Store update the same version that was requested?
        if let previouslySkippedVersion = storedSkippedVersion,
           let currentInstalledVersion = currentInstalledVersion,
           !currentAppStoreVersion.isEmpty,
           currentAppStoreVersion == previouslySkippedVersion
        {
            resultsHandler?(.failure(.skipVersionUpdate(installedVersion: currentInstalledVersion,
                                                        appStoreVersion: currentAppStoreVersion)))
            return
        }

        let updateType = DataParser.parseForUpdate(forInstalledVersion: currentInstalledVersion,
                                                   andAppStoreVersion: currentAppStoreVersion)
        do {
            let rules = try rulesManager.loadRulesForUpdateType(updateType)

            if rules.frequency == .immediately {
                presentAlert(withRules: rules, forCurrentAppStoreVersion: currentAppStoreVersion, model: model, andUpdateType: updateType)
            } else {
                guard let alertPresentationDate = alertPresentationDate else {
                    presentAlert(withRules: rules, forCurrentAppStoreVersion: currentAppStoreVersion, model: model, andUpdateType: updateType)
                    return
                }
                if Date.days(since: alertPresentationDate) >= rules.frequency.rawValue {
                    presentAlert(withRules: rules, forCurrentAppStoreVersion: currentAppStoreVersion, model: model, andUpdateType: updateType)
                } else {
                    resultsHandler?(.failure(.recentlyPrompted))
                }
            }
        } catch let error as VersionError {
            resultsHandler?(.failure(error))
        } catch { // This path should never be entered, but this silences an error.
            resultsHandler?(.failure(.noUpdateAvailable))
        }
    }

    /// Presents the update alert to the end user.
    /// Upon tapping a value on the alert view, a completion handler will return all relevant metadata to the app.
    ///
    /// - Parameters:
    ///   - rules: The rules for how to present the alert.
    ///   - currentAppStoreVersion: The current version of the app in the App Store.
    ///   - model: The iTunes Lookup Model.
    ///   - updateType: The type of update that is available based on the version found in the App Store.
    func presentAlert(withRules rules: Rules,
                      forCurrentAppStoreVersion currentAppStoreVersion: String,
                      model: Model,
                      andUpdateType updateType: RulesManager.UpdateType)
    {
        presentationManager.presentAlert(withRules: rules, forCurrentAppStoreVersion: currentAppStoreVersion) { [weak self] alertAction, currentAppStoreVersion in
            guard let self = self else { return }
            self.processAlertAction(model: model, alertAction: alertAction, currentAppStoreVersion: currentAppStoreVersion)

            let results = UpdateResults(alertAction: alertAction,
                                        localization: self.presentationManager.localization,
                                        model: model,
                                        updateType: updateType)
            self.resultsHandler?(.success(results))
        }
    }

    func processAlertAction(model: Model, alertAction: AlertAction, currentAppStoreVersion: String?) {
        switch alertAction {
        case .appStore:
            launchAppStore(url: model.mainfestPlist)
        case .skip:
            guard let currentAppStoreVersion = currentAppStoreVersion else { return }
            storedSkippedVersion = currentAppStoreVersion
        default:
            break
        }
    }
}

// MARK: - Add Observers

private extension Siren {
    /// Adds an observer that listens for app launching/relaunching.
    func addForegroundObservers() {
        guard applicationDidBecomeActiveObserver == nil else { return }
        applicationDidBecomeActiveObserver = NotificationCenter
            .default
            .addObserver(forName: UIApplication.didBecomeActiveNotification,
                         object: nil,
                         queue: nil) { [weak self] _ in
                guard let self = self else { return }
                self.performVersionCheck()
            }
    }

    /// Adds an observer that listens for when the user enters the app switcher
    /// and when the app is sent to the background.
    func addBackgroundObservers() {
        if applicationWillResignActiveObserver == nil {
            applicationWillResignActiveObserver = NotificationCenter
                .default
                .addObserver(forName: UIApplication.willResignActiveNotification,
                             object: nil,
                             queue: nil) { [weak self] _ in
                    guard let self = self else { return }
                    self.presentationManager.cleanUp()
                }
        }

        if applicationDidEnterBackgroundObserver == nil {
            applicationDidEnterBackgroundObserver = NotificationCenter
                .default
                .addObserver(forName: UIApplication.didEnterBackgroundNotification,
                             object: nil,
                             queue: nil) { [weak self] _ in
                    guard let self = self else { return }
                    self.presentationManager.cleanUp()
                }
        }
    }
}

// MARK: - Remove Observers

private extension Siren {
    /// Removes the observer that listens for app launching/relaunching.
    func removeForegroundObservers() {
        NotificationCenter.default.removeObserver(applicationDidBecomeActiveObserver as Any)
        applicationDidBecomeActiveObserver = nil
    }

    /// Remove the observers that list to app resignation and app backgrounding.
    func removeBackgroundObservers() {
        NotificationCenter.default.removeObserver(applicationWillResignActiveObserver as Any)
        applicationWillResignActiveObserver = nil

        NotificationCenter.default.removeObserver(applicationDidEnterBackgroundObserver as Any)
        applicationDidEnterBackgroundObserver = nil
    }
}
