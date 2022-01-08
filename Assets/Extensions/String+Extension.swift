//
// Created by lizhihui on 2021/4/23.
// Copyright (c) 2021 ZhiHui.Li. All rights reserved.
//

import CommonCrypto
import Foundation

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: APIRouter.Constants) {}
}

extension String {
    enum Crypto {
        case encrypt
        case decrypt
    }

    var hex: String {
        let data = Data(utf8)
        return data.map { String(format: "%02x", $0) }.joined()
    }

    /// Encrypts message with DES algorithm

    func des(_ crypto: Crypto, key: String) throws -> String {
        switch crypto {
        case .decrypt: return try desDecrypt(key: key)
        case .encrypt: return try desEncrypt(key: key)
        }
    }

    private func desEncrypt(key: String) throws -> String {
        try symetricEncrypt(key: key, blockSize: kCCBlockSizeDES, keyLength: size_t(kCCKeySizeDES), algorithm: UInt32(kCCAlgorithmDES))
    }

    /// Encrypts message with 3DES algorithm
    private func tripleDesEncrypt(key: String) throws -> String {
        try symetricEncrypt(key: key, blockSize: kCCBlockSize3DES, keyLength: size_t(kCCKeySize3DES), algorithm: UInt32(kCCAlgorithm3DES))
    }

    /// Encrypts a message with symmetric algorithm
    private func symetricEncrypt(key: String, blockSize: Int, keyLength: size_t, algorithm: CCAlgorithm, options: Int = kCCOptionPKCS7Padding) throws -> String {
        let keyData = key.data(using: String.Encoding.utf8)! as NSData
        let data = self.data(using: String.Encoding.utf8)! as NSData

        let cryptData = NSMutableData(length: Int(data.length) + blockSize)!

        let operation: CCOperation = UInt32(kCCEncrypt)

        var numBytesEncrypted: size_t = 0

        let cryptStatus = CCCrypt(operation,
                                  algorithm,
                                  UInt32(options),
                                  keyData.bytes,
                                  keyLength,
                                  keyData.bytes,
                                  data.bytes, data.length,
                                  cryptData.mutableBytes, cryptData.length,
                                  &numBytesEncrypted)

        if UInt32(cryptStatus) == UInt32(kCCSuccess) {
            cryptData.length = Int(numBytesEncrypted)
            let base64cryptString = cryptData.base64EncodedString(options: .lineLength64Characters)
            return base64cryptString
        }

        throw EAMError.CryptoError.encryptoError
    }

    /// Decrypts message with DES algorithm
    private func desDecrypt(key: String) throws -> String {
        try symetricDecrypt(key: key, blockSize: kCCBlockSizeDES, keyLength: size_t(kCCKeySizeDES), algorithm: UInt32(kCCAlgorithmDES))
    }

    /// Decrypts message with 3DES algorithm
    private func tripleDesDecrypt(key: String) throws -> String {
        try symetricDecrypt(key: key, blockSize: kCCBlockSize3DES, keyLength: size_t(kCCKeySize3DES), algorithm: UInt32(kCCAlgorithm3DES))
    }

    /// Decrypts a message with symmetric algorithm
    private func symetricDecrypt(key: String, blockSize: Int, keyLength: size_t, algorithm: CCAlgorithm, options: Int = kCCOptionPKCS7Padding) throws -> String {
        if let keyData = key.data(using: String.Encoding.utf8),
           let data = NSData(base64Encoded: self, options: .ignoreUnknownCharacters),
           let cryptData = NSMutableData(length: Int(data.length) + blockSize)
        {
            let operation: CCOperation = UInt32(kCCDecrypt)
            var numBytesEncrypted: size_t = 0

            let cryptStatus = CCCrypt(operation,
                                      algorithm,
                                      UInt32(options),
                                      (keyData as NSData).bytes, keyLength,
                                      keyData.bytes,
                                      data.bytes, data.length,
                                      cryptData.mutableBytes, cryptData.length,
                                      &numBytesEncrypted)

            if UInt32(cryptStatus) == UInt32(kCCSuccess) {
                cryptData.length = Int(numBytesEncrypted)
                let unencryptedMessage = String(data: cryptData as Data, encoding: String.Encoding.utf8)
                return unencryptedMessage ?? ""
            }

            throw EAMError.CryptoError.decryptoErrpr
        }

        throw EAMError.CryptoError.decryptoErrpr
    }
}
