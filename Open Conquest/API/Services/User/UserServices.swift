//
//  UserService.swift
//  Open Conquest
//
//  Created by Zach Wild on 9/30/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
class UserServices: BaseAPIServices {
    var publisher:  UserServicesPublisher
    var subscriber: Subscriber
    
    override init() {
        publisher   = UserServicesPublisher()
        subscriber  = Subscriber()
        
        super.init()
        setupSubscibers()
    }
    
    func setupSubscibers() {
        // game subscribing methods
        subscriber.subscribe(observingFunction: tryLogin(_:), name: .GameTryLogin)
        subscriber.subscribe(observingFunction: tryRegister(_:), name: .GameTryRegister)
        subscriber.subscribe(observingFunction: tryGetUsers(_:), name: .GameTryGetUsers)
        
        // connection subscribing methods
        subscriber.subscribe(observingFunction: didLogin(_:), name: .ConnectionLoginSucceed)
        subscriber.subscribe(observingFunction: loginFailed(_:), name: .ConnectionLoginFailed)
        subscriber.subscribe(observingFunction: registerSucceed(_:), name: .ConnectionRegisterSucceed)
        subscriber.subscribe(observingFunction: registerFailed(_:), name: .ConnectionRegisterFailed)
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
        
        // save token from response to keychain
        do {
            try saveTokenToKeychain(value: loginUserResponse.getToken().getValue())
        } catch {
            print("UserServices error saving token in keychain")
//            publisher.loginFailed(response: "Error saving toke in client, please report this bug")
            return
        }
        
        // emit did login notification
        publisher.loginSucceeded(response: loginUserResponse)
    }
    
    func loginFailed(_ notification: Notification) {
        print("UserServices received ConnectionLoginFailed event.")
        
        // parse response
        let loginErrorResponse = LoginUserErrorResponseDTO(
            response: notification.userInfo!["data"] as! Response
        )
        
        // publish failed login notification
        publisher.loginFailed(response: loginErrorResponse)
    }
    
    func registerSucceed(_ notification: Notification) {
        print("UserServices received ConnectionRegisterSucceed event.")
        
        // parse response
        let registerUserResponse = RegisterUserResponseDTO(
            response: notification.userInfo!["data"] as! Response
        )
        // save token from response to keychain
        do {
            try saveTokenToKeychain(value: registerUserResponse.getToken().getValue())
        } catch {
            print("UserServices error saving token in keychain")
            return
        }
        
        // publish failed register notification
        publisher.registerSucceed(response: registerUserResponse)
    }
    
    func registerFailed(_ notification: Notification) {
        print("UserServices received ConnectionRegisterFailed event.")
        
        // parse response
        let registerErrorResponse = RegisterUserErrorResponseDTO(
            response: notification.userInfo!["data"] as! Response
        )
        
        // publish failed register notification
        publisher.registerFailed(response: registerErrorResponse)
    }
    
    func didGetUsers(_ notification: Notification) {
        print("UserServices received ConnectionGotUsers event.")
        
        let response = notification.userInfo!["data"] as! Response
        let getUsersReponse = GetUsersResponse(response: response)
        publisher.didGetUsers(response: getUsersReponse)
     }
}
