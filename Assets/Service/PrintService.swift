//
//  PrintService.swift
//  Assets
//
//  Created by lizhihui on 2021/11/10.
//  Copyright © 2021 ZhiHui.Li. All rights reserved.
//

import BrightFutures
import Foundation

class PrintService: WindowAble {
    public static let shared = PrintService()

    let printer = WwPrintUtils.getInstance()

    var request = PrintTemplateRequest()

    init() {
        printer?.previewFollowPaperDirection = false
    }

    func template(tagNumber: String) -> Future<String?, Error> {
        let parameter = PrintTemplateParameter(tagNumber: tagNumber)

        return request.dataRequest(of: PrintTemplateResponse.self,
                                   router: .printTemplate(parameter))
    }

    func preview(tagNumber: String) -> Future<WwPrintResult, EAMError.PrintServiceError> {
        let template = template(tagNumber: tagNumber)

        return template.mapError { error in
            EAMError.PrintServiceError.apiFailure(error)
        }
        .flatMap { template in
            Future { [weak self] complete in
                guard let self = self, let template = template else {
                    complete(.failure(.createLabelError))
                    return
                }

                let labels = WwTABUtil.labelArray(withXml: template)
                `self`.printer?.previewPrint(labels) { result in

                    guard result != .wwPrintSuccess else {
                        complete(.success(.wwPrintSuccess))
                        return
                    }

                    complete(.failure(result.convert()))
                }
            }
        }
    }
}
