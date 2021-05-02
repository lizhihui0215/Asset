//
// Created by lizhihui on 2021/5/2.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class ScanViewModel: BaseViewModel<ScanViewController> {
    public var metadataObject: MetadataObject?

    func fetchAssetDetail(completionHandler: @escaping ViewModelCompletionHandler<AssetDetail?>) {
        let loginParameter = AssetDetailParameter(userAccount: "as", userPwd: "password.md5()")
        api(of: AssetDetailResponse.self,
            router: .assetDetail(loginParameter)) { result in
            completionHandler(result)
        }
    }
}
