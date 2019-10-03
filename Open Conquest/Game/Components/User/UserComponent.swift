//
//  UserComponent.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class UserComponent: GameComponent {
    var user:       User?
    var users:      [User]?
    var publisher:  UserComponentPublisher
    var subscriber: Subscriber
    
    init() {
        self.publisher  = UserComponentPublisher()
        self.subscriber = Subscriber()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        // subscribe to scene notifications
        subscriber.subscribe(observingFunction: tryLogin(_:), name: .SceneTryLogin)
        subscriber.subscribe(observingFunction: tryGetUsers(_:), name: .SceneTryGetUsers)
        
        // subscribe to api notifications
        subscriber.subscribe(observingFunction: loginSucceed(_:), name: .APILoginSucceed)
        subscriber.subscribe(observingFunction: didGetUsers(_:), name: .APIDidGetUsers)
    }

    func update(notification: Notification) {
        fatalError("not implemented")
    }
    
    // scene
    func tryLogin(_ notification: Notification) {
        print("UserComponent recieved SceneTryLogin event.")

        if (user != nil) {
            // user is already logged in
            // do nothing
        }
        else {
            // user is not logged in
            print("UserComponent found that user is not logged in.")
            let tryLoginData = notification.userInfo!["data"] as! SceneTryLoginData
            publisher.tryLogin(data: tryLoginData)
        }
        
    }
    
    // api
    func loginSucceed(_ notification: Notification) {
        print("UserComponent recieved APILoginSucceed event.")
        
        // initialize user from notification
        let loginSucceedData = notification.userInfo!["data"] as! APILoginSucceedData
        user = User(apiLoginSucceedData: loginSucceedData)
        
        print("UserComponent publishing GameLoginSucceeded event...")
        publisher.loginSucceed()
    }
    
    // scene
    func tryGetUsers(_ notification: Notification) {
        print("UserComponent received SceneGetUsers event")
        
        if (users != nil) {
            publisher.didGetUsers(users: self.users!)
        }
        else {
            publisher.tryGetUsers()
        }
    }
    
    // api
    func didGetUsers(_ notification: Notification) {
        print("UserComponent received APIDidGetUsers event.")
        
        let users = notification.userInfo!["data"] as! [User]
        self.users = users

        publisher.didGetUsers(users: users)
    }
}

