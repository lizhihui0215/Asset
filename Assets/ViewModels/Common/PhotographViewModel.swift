//
// Created by lizhihui on 2021/4/27.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class PhotographViewModel: BaseViewModel<PhotographViewController> {
    typealias ViewState = PhotographViewController.ViewState

    public let title: String
    public let key: String
    public let value: String

    let initViewState: ViewState

    init(title: String,
         key: String,
         value: String,
         viewState: ViewState,
         request: RequestRepresentable,
         action: PhotographViewController)
    {
        self.title = title
        self.key = key
        self.value = value
        initViewState = viewState
        super.init(request: request, action: action)
    }
}
