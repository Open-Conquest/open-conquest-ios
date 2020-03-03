//
//  UserService.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class UserService: GameService {
    var user:       User?
    var users:      [User]?
    var publisher:  UserServicePublisher
    var subscriber: Subscriber
    
    init() {
        self.publisher  = UserServicePublisher()
        self.subscriber = Subscriber()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        // subscribe to scene notifications
        subscriber.subscribe(observingFunction: tryLogin(_:), name: .SceneTryLogin)
        subscriber.subscribe(observingFunction: tryRegister(_:), name: .SceneTryRegister)
        subscriber.subscribe(observingFunction: tryGetUsers(_:), name: .SceneTryGetUsers)
        
        // subscribe to api notifications
//        subscriber.subscribe(observingFunction: registerSucceed(_:), name: .APIRegisterSucceed)
        subscriber.subscribe(observingFunction: registerFailed(_:), name: .APIRegisterFailed)
        subscriber.subscribe(observingFunction: loginSucceed(_:), name: .APILoginSucceed)
        subscriber.subscribe(observingFunction: loginFailed(_:), name: .APILoginFailed)
        subscriber.subscribe(observingFunction: didGetUsers(_:), name: .APIDidGetUsers)
    }

    func update(notification: Notification) {
        fatalError("not implemented")
    }
    
    // scene
    func tryLogin(_ notification: Notification) {
        print("UserService recieved SceneTryLogin event.")

        if (user != nil) {
            // user is already logged in
            // do nothing
        }
        else {
            // user is not logged in
            print("UserService found that user is not logged in.")
            let tryLoginData = notification.userInfo!["data"] as! SceneTryLoginData
            publisher.tryLogin(data: tryLoginData)
        }
        
    }
    
    // scene
    func tryRegister(_ notification: Notification) {
        print("UserService recieved SceneTryRegister event.")
        
        let tryRegisterData = notification.userInfo!["data"] as! SceneTryRegisterData
        publisher.tryRegister(data: tryRegisterData)
    }

    // api
    func registerSucceed(_ notification: Notification) {
        print("UserService recieved APIRegisterSucceed event.")

        // initialize user from notification
        let registerSucceedData = notification.userInfo!["data"] as! APIRegisterSucceedData
        // create a user from username
        let username = registerSucceedData.getUsername()

        print("UserService publishing GameLoginSucceeded event...")
        publisher.loginSucceed()
    }

    // api
    func registerFailed(_ notification: Notification) {
        print("UserService recieved APIRegisterFailed event.")

        // initialize user from notification
        let registerFailedData = notification.userInfo!["data"] as! APIRegisterFailedData
        publisher.registerFailed(message: registerFailedData.getMessage())
    }
    
    // api
    func loginSucceed(_ notification: Notification) {
        print("UserService recieved APILoginSucceed event.")
        
        // initialize user from notification
        let loginSucceedData = notification.userInfo!["data"] as! APILoginSucceedData
        user = User(apiLoginSucceedData: loginSucceedData)
        
        print("UserService publishing GameLoginSucceeded event...")
        publisher.loginSucceed()
    }
    
    func loginFailed(_ notification: Notification) {
        print("UserService received APILoginFailed event.")
        
        // notify scene of error
        let loginErrorData = notification.userInfo!["data"] as! APILoginFailedData
        let errorMessage = loginErrorData.getMessage()
        
        publisher.loginFailed(message: errorMessage)
    }
    
    // scene
    func tryGetUsers(_ notification: Notification) {
        print("UserService received SceneGetUsers event")
        
        if (users != nil) {
            publisher.didGetUsers(users: self.users!)
        }
        else {
            publisher.tryGetUsers()
        }
    }
    
    // api
    func didGetUsers(_ notification: Notification) {
        print("UserService received APIDidGetUsers event.")
        
        let users = notification.userInfo!["data"] as! [User]
        self.users = users

        publisher.didGetUsers(users: users)
    }
}

