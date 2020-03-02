//
//  UserService.swift
//  Open Conquest
//
//  Created by Zach Wild on 9/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class UserServices {
    var publisher:  UserServicesPublisher
    var subscriber: Subscriber
    
    init() {
        publisher   = UserServicesPublisher()
        subscriber  = Subscriber()
        
        setupSubscibers()
    }
    
    func setupSubscibers() {
        // game subscribing methods
        subscriber.subscribe(observingFunction: tryLogin(_:), name: .GameTryLogin)
        subscriber.subscribe(observingFunction: tryRegister(_:), name: .GameTryRegister)
        subscriber.subscribe(observingFunction: tryGetUsers(_:), name: .GameTryGetUsers)
        
        // connection subscribing methods
        subscriber.subscribe(observingFunction: didLogin(_:), name: .ConnectionLoginSucceed)
        subscriber.subscribe(observingFunction: didGetUsers(_:), name: .ConnectionDidGetUsers)
    }
    
    // MARK: GAME SUBSCRIBING METHODS
    
    func tryLogin(_ notification: Notification) {
        print("UserServices receieved GameTryLogin event.")
        
        let tryLoginData = notification.userInfo!["data"] as! GameTryLoginData
        publisher.tryLogin(gameTryLoginData: tryLoginData)
    }
    
    func tryRegister(_ notification: Notification) {
        print("UserServices receieved GameTryRegister event.")
        
        let tryRegisterData = notification.userInfo!["data"] as! GameTryRegisterData
        publisher.tryRegister(gameTryRegisterData: tryRegisterData)
    }
    
    func tryGetUsers(_ notifcation: Notification) {
        print("UserServices received GameLoadUsers event.")
        
        publisher.getUsers()
    }
    
    
    // MARK: CONNECTION SUBSCRIBING METHODS
    struct TokenStruct {
        var value: String
    }
    func didLogin(_ notification: Notification) {
        print("UserServices received ConnectionLoginSucceeded event.")

        // parse response
        let loginUserResponse = LoginUserResponseDTO(response:
            notification.userInfo!["data"] as! Response
        )
        
        // save token value
        let tokenStruct = TokenStruct(value: loginUserResponse.getToken().getValue())
        let tokenValue = tokenStruct.value.data(using: String.Encoding.utf8)!
        let server = "server"
        let account = "account"
        let attributes: [String: Any] = [
            kSecClass as String: kSecClassInternetPassword,
            kSecAttrAccount as String: account,
            kSecAttrServer as String: server,
            kSecValueData as String: tokenValue
        ]
        let addstatus = SecItemAdd(attributes as CFDictionary, nil)
        guard addstatus == errSecSuccess else {
            print("Error in UserServices didLogin")
            // emit login failed notification
            publisher.loginFailed()
            return
        }
        
        // emit did login notification
        publisher.loginSucceeded(response: loginUserResponse)
    }
    
    func didGetUsers(_ notification: Notification) {
        print("UserServices received ConnectionGotUsers event.")
        
        let response = notification.userInfo!["data"] as! Response
        let getUsersReponse = GetUsersResponse(response: response)
        publisher.didGetUsers(response: getUsersReponse)
     }
}
