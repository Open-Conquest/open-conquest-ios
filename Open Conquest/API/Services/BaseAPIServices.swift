//
//  BaseAPIServices.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/2/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

enum KeychainError: Error {
    case tokenNotFound
    case tokenNotSaved
    case tokenNotUpdated
}

enum KeychainTokenValues: String {
    case server = "server"
    case account = "account"
}

struct TokenStruct {
    var value: String
}

class BaseAPIServices {
    init() {}
    
    func getTokenFromKeychain() -> String {
        let server = KeychainTokenValues.server.rawValue
        let account = KeychainTokenValues.account.rawValue
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: account,
            kSecAttrServer as String: server,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        // if a token wasn't found return an empty string
        guard status == errSecSuccess else { return "" }

        let responseItem = item as! [String: Any]
        let tokenData = responseItem[String(kSecValueData)] as! Data
        let token = String(data: tokenData, encoding: .utf8)!
        
        return token
    }
    
    func saveTokenToKeychain(value: String) throws {
        let server = KeychainTokenValues.server.rawValue
        let account = KeychainTokenValues.account.rawValue
        
        // get token value in utf8
        let tokenStruct = TokenStruct(value: value)
        let tokenValue = tokenStruct.value.data(using: String.Encoding.utf8)!
        
        let tokenExists = doesTokenExist()
        if (tokenExists) {
            // if token already exists update token in keychain
            let query: [String: Any] = [
                kSecClass as String: kSecClassInternetPassword,
                kSecAttrAccount as String: account,
                kSecAttrServer as String: server
            ]
            
            let attributes: [String: Any] = [
                kSecValueData as String: tokenValue
            ]
            
            let updatestatus = SecItemUpdate(query as CFDictionary, attributes as CFDictionary)
            guard updatestatus == errSecSuccess else {
                throw KeychainError.tokenNotUpdated
            }
            
        } else {
            // if token doesnt exist add token to keychain
            let attributes: [String: Any] = [
                kSecClass as String: kSecClassInternetPassword,
                kSecAttrAccount as String: account,
                kSecAttrServer as String: server,
                kSecValueData as String: tokenValue
            ]
            
            let addstatus = SecItemAdd(attributes as CFDictionary, nil)
            guard addstatus == errSecSuccess else {
                throw KeychainError.tokenNotSaved
            }
        }
    }
    
    func doesTokenExist() -> Bool {
        let server = KeychainTokenValues.server.rawValue
        let account = KeychainTokenValues.account.rawValue
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: account,
            kSecAttrServer as String: server,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnAttributes as String: true,
            kSecReturnData as String: true
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status == errSecSuccess else {
            return false
        }
        return true
    }
}

