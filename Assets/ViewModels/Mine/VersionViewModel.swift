//
//  VersionModel.swift
//  Assets
//
//  Created by lizhihui on 2021/5/24.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class VersionViewModel: BaseViewModel<VersionViewController> {
    var version: String = app.version

    var targetVersion: String = ""

    var filename: String = ""

    var notes: String = ""

    var model: APIModel?

    var updateType: RulesManager.UpdateType?

    func fetchVersion() -> ViewModelFuture<APIModel?> {
        api(of: VersionResponse.self, router: .version).onSuccess { [weak self] model in
            guard let self = self, let version = model?.results else { return }
            `self`.model = model
            self.version = app.version
            self.targetVersion = version.version
            self.notes = version.releaseNotes ?? ""
            self.filename = version.mainfestPlist
            self.updateType = DataParser.parseForUpdate(forInstalledVersion: app.version, andAppStoreVersion: self.targetVersion)
        }
    }
}
