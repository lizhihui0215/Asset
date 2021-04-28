//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class PhotographViewModel: BaseViewModel<PhotographViewController> {
    public let title: String
    public let key: String
    public let value: String

    init(title: String,
         key: String,
         value: String,
         request: RequestRepresentable,
         action: PhotographViewController)
    {
        self.title = title
        self.key = key
        self.value = value
        super.init(request: request, action: action)
    }
}
