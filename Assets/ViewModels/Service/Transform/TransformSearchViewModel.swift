//
//  AssetSearchViewModel.swift
//  Assets
//
//  Created by Bernard on 2021/6/6.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class TransformSearchViewModel: BaseViewModel<TransformSearchViewController> {
    enum TaskStatus: String {
        case processing = "0"
        case finished = "1"

        init(intValue: Int) {
            if intValue == 0 {
                self = .processing
            } else {
                self = .finished
            }
        }
    }

    var taskStatus: TaskStatus = .processing
    var location: String = ""
    var taskCode: String = ""
}
