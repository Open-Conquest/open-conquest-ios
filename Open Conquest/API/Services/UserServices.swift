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
    
    func didLogin(_ notification: Notification) {
        print("UserServices received ConnectionLoginSucceeded event.")
        
//        var response = notification.userInfo!["data"] as! Response
        let username = "zach"
//        response = LoginResponse(response: response)
//        let username = response.getUsername()
        publisher.loginSucceeded(username: username)
    }
    
    func didGetUsers(_ notification: Notification) {
        print("UserServices received ConnectionGotUsers event.")
        
        let response = notification.userInfo!["data"] as! Response
        let getUsersReponse = GetUsersResponse(response: response)
        publisher.didGetUsers(response: getUsersReponse)
     }
}
