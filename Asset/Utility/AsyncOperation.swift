//
// Created by lizhihui on 2021/4/23.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation

class AsyncOperation: Operation {
    enum State: String {
        case ready = "isReady"
        case executing = "isExecuting"
        case finished = "isFinished"
    }

    private(set) var state: State = .ready {
        willSet {
            willChangeValue(forKey: state.key)
            willChangeValue(forKey: newValue.key)
        }
        didSet {
            didChangeValue(forKey: oldValue.key)
            didChangeValue(forKey: state.key)
        }
    }

    override var isExecuting: Bool {
        state == .executing
    }

    override var isFinished: Bool {
        state == .finished
    }

    override var isAsynchronous: Bool {
        true
    }

    override var isReady: Bool {
        state == .ready
    }

    public final func finished() {
        state = .finished
    }

    override func start() {
        state = .executing
        execute()
    }

    func execute() {
        state = .finished
    }
}
