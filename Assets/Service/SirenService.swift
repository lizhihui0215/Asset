//
// Created by lizhihui on 2021/5/4.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import UIKit

class SirenService: NSObject, AppService {
    lazy var viewModel: SirenViewModel = {
        SirenViewModel(request: VersionRequest(), action: self)
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let siren = Siren.shared
        siren.apiManager = self
        siren.rulesManager = RulesManager(globalRules: .critical,
                                          showAlertAfterCurrentVersionHasBeenReleasedForDays: 0)

        siren.wail { results in
            switch results {
            case .success(let updateResults):
                log.info("AlertAction ", context: updateResults.alertAction)
                log.info("Localization ", context: updateResults.localization)
                log.info("Model ", context: updateResults.model)
                log.info("UpdateType ", context: updateResults.updateType)
                SirenService.downloadApp()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        return true
    }

    static func downloadApp() {
        UIApplication.shared.open(app.appUpdateURL, options: [:])
    }
}

class SirenViewModel: BaseViewModel<SirenService> {
    func fetchVersion() -> ViewModelFuture<APIModel?> {
        api(of: VersionResponse.self, router: .version)
    }
}

extension SirenService: Action {
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
        window?.rootViewController?.present(viewControllerToPresent, animated: flag, completion: completion)
    }
}

extension SirenService: APIManager, WindowAble {
    var presentationManager: PresentationManager {
        PresentationManager.default
    }

    var request: VersionRequest {
        VersionRequest()
    }

    func performVersionCheckRequest(completion handler: CompletionHandler?) {
        viewModel.fetchVersion()
            .flatMap { result -> Result<APIModel, Error> in
                guard let result: APIModel = result else { return Result(error: EAMError.unknown) }
                return Result(value: result)
            }
            .onSuccess { result in
                guard let handler = handler else { return }
                handler(.success(result))
            }
    }
}
