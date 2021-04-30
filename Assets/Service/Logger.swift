//
// Created by lizhihui on 2021/4/26.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import Foundation
import SwiftyBeaver

let log = Logger.shared.log

class Logger {
    public static let shared = Logger()
    let console = ConsoleDestination()
    let file = FileDestination()
    let log = SwiftyBeaver.self

    init() {
        console.format = "$DHH:mm:ss.SSS$d $C$L$c $N.$F:$l - $M $X"
        log.addDestination(console)
        log.addDestination(file)
    }
}
