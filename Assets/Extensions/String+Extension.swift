//
// Created by lizhihui on 2021/4/23.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import CryptoSwift
import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: APIRouter.Constants) {}
}

enum Crypto {
    case encrypt(String = API.AESKey.request.rawValue)
    case decrypt(String = API.AESKey.response.rawValue)
}

extension String {
    /// Encrypts message with AES algorithm
    func aes(_ crypto: Crypto) throws -> String {
        switch crypto {
        case .decrypt(let key):
            let filterdString = replacingOccurrences(of: "\\r", with: "").replacingOccurrences(of: "\\n", with: "")
            guard let encryptedData = Data(base64Encoded: filterdString, options: .ignoreUnknownCharacters) else { throw EAMError.CryptoError.decryptoErrpr }
            let aes = try AES(key: key)
            let decryptedData = Data(try aes.decrypt(encryptedData.bytes))
            guard let decryptedString = String(data: decryptedData, encoding: .utf8) else {
                throw EAMError.CryptoError.decryptoErrpr
            }
            return decryptedString
        case .encrypt(let key):
            guard let inputData = data(using: .utf8) else { throw EAMError.CryptoError.encryptoError }
            let aes = try AES(key: key)
            return try aes.encrypt(inputData.bytes).toBase64()
        }
    }
}

// TODO: enhancement move String extension encrypt into this Data
extension Data {
    func aes(_ crypt: Crypto) throws -> Data {
        switch crypt {
        case .decrypt:
            fatalError("aes(_ crypt: Crypto) was not implemented")
        case .encrypt:
            fatalError("aes(_ crypt: Crypto) was not implemented")
        }
    }
}

public extension AES {
    /// Initialize with ECB block mode.
    ///
    /// - Parameters:
    ///   - key: Key as a String.
    ///   - padding: Padding
    /// - Throws: Error
    ///
    /// The input is a String, that is treat as sequence of bytes made directly out of String.
    /// If input is Base64 encoded data (which is a String technically) it is not decoded automatically for you.
    convenience init(key: String, padding: Padding = .pkcs7) throws {
        try self.init(key: key.bytes, blockMode: ECB(), padding: padding)
    }
}

// private extension Data {
//    func crypt(operation: CCOperation, key: String, iv: String) -> Data? {
//        let algorithm = kCCAlgorithmDES
//        let options = kCCOptionPKCS7Padding
//        let keyData = [UInt8](key.data(using: .utf8) ?? Data())
//        let ivData = [UInt8](iv.data(using: .utf8) ?? Data())
//        let keyLength = kCCKeySizeDES
//        let dataIn = [UInt8](self)
//        let dataInLength = count
//        let dataOutAvailable = dataInLength + kCCBlockSizeDES
//        let dataOut = UnsafeMutablePointer<UInt8>.allocate(capacity: dataOutAvailable)
//        var dataOutMoved = 0
//
//        let cryptStatus = CCCrypt(
//            CCOperation(operation), // 加密(解密)模式 kCCEncrypt:加密, kCCDecrypt:解密
//            CCAlgorithm(algorithm), // 加密(解密)方式
//            CCOptions(options), // 填充算法
//            keyData, // 密钥(超出密钥长度的部分将被忽略)
//            keyLength, // 密钥长度
//            ivData, // 初始化向量
//            dataIn, // 待加密(待解密)的数据
//            dataInLength, // 待加密(待解密)的数据长度
//            dataOut, // 将输出的已加密(已解密)数据的缓冲区
//            dataOutAvailable, // 将输出的已加密(已解密)数据的缓冲区长度
//            &dataOutMoved
//        ) // 将输出的已加密(已解密)数据的实际长度
//
//        if cryptStatus == kCCSuccess {
//            let result = Data(bytes: dataOut, count: dataOutMoved)
//            dataOut.deallocate()
//            return result
//        } else {
//            print("\(#function) error = \(cryptStatus)")
//            dataOut.deallocate()
//            return nil
//        }
//    }
// }
//
// private extension Data {
//    var toHexString: String {
//        toHexString()
//    }
//
//    var toHexLowercasedString: String {
//        toHexString(isLowercased: true)
//    }
//
//    private func toHexString(isLowercased: Bool = false) -> String {
//        map { String(format: "%02\(isLowercased ? "x" : "X")", $0) }.joined(separator: "")
//    }
// }
//
// private extension String {
//    /// 16进制字符串转为Data
//    var hexToData: Data {
//        let bytes = hexToBytes
//        #if swift(>=4.2)
//            return Data(bytes)
//        #else
//            return Data(bytes: bytes)
//        #endif
//    }
//
//    /// 16进制字符串转为 [UInt8]
//    var hexToBytes: [UInt8] {
//        assert(count % 2 == 0, "输入字符串格式不对，8位代表一个字符")
//        var bytes = [UInt8]()
//        var sum = 0
//        // 整形 utf8 编码范围
//        let intRange = 48 ... 57
//        // 小写 a~f 的 utf8 的编码范围
//        let lowercaseRange = 97 ... 102
//        // 大写 A~F 的 utf8 的编码范围
//        let uppercasedRange = 65 ... 70
//        for (index, c) in utf8CString.enumerated() {
//            var intC = Int(c.byteSwapped)
//            if intC == 0 {
//                break
//            } else if intRange.contains(intC) {
//                intC -= 48
//            } else if lowercaseRange.contains(intC) {
//                intC -= 87
//            } else if uppercasedRange.contains(intC) {
//                intC -= 55
//            } else {
//                assertionFailure("输入字符串格式不对，每个字符都需要在0~9，a~f，A~F范围内")
//            }
//            sum = sum * 16 + intC
//            // 每两个十六进制字母代表8位，即一个字节
//            if index % 2 != 0 {
//                bytes.append(UInt8(sum))
//                sum = 0
//            }
//        }
//        return bytes
//    }
// }
