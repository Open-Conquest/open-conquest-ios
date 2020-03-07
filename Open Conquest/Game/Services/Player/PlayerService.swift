//
//  PlayerService.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class PlayerService: GameService {
    var player:       Player?
    var publisher:  UserServicePublisher
    var subscriber: Subscriber
    
    init() {
        self.publisher  = PlayerServicePublisher()
        self.subscriber = Subscriber()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        // subscribe to scene notifications
        subscriber.subscribe(observingFunction: tryCreatePlayer(_:), name: .SceneTryCreatePlayer)
        
        // subscribe to api notifications
//        subscriber.subscribe(observingFunction: createPlayerSucceed(_:), name: .APICreatePlayerSucceed)
//        subscriber.subscribe(observingFunction: createPlayerFailed(_:), name: .APICreatePlayerFailed)
    }

    func update(notification: Notification) {
        fatalError("not implemented")
    }
    
    // listening to scene
    func tryCreatePlayer(_ notification: Notification) {
        print("PlayerService recieved SceneTryCreatePlayer event.")

        if (player != nil) {
            // already are playing as a player
        }
        else {
            // user is not logged in
            print("PlayerService found that a player has not been initialized")
            let incomingNotifData = notification.userInfo!["data"] as! SceneTryCreatePlayerData
            
            // create a player from incoming data
            let player = Player(id: nil, name: incomingNotifData.getName())
            
            // post outgoing notification to try to create player to API
            publisher.tryCreatePlayer(player: player)
        }
        
    }
    
//    // listening to api
//    func loginSucceed(_ notification: Notification) {
//        print("UserService recieved APILoginSucceed event.")
//
//        // initialize user from notification
//        let loginSucceedData = notification.userInfo!["data"] as! APILoginSucceedData
//        user = User(apiLoginSucceedData: loginSucceedData)
//
//        print("UserService publishing GameLoginSucceeded event...")
//        publisher.loginSucceed()
//    }
//
//    // listening to api
//    func loginFailed(_ notification: Notification) {
//        print("UserService received APILoginFailed event.")
//
//        // notify scene of error
//        let loginErrorData = notification.userInfo!["data"] as! APILoginFailedData
//        let errorMessage = loginErrorData.getMessage()
//
//        publisher.loginFailed(message: errorMessage)
//    }
}

