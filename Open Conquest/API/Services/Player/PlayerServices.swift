//
//  PlayerServices.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

import Foundation
class PlayerServices: BaseAPIServices {
    var publisher:  PlayerServicesPublisher
    var subscriber: Subscriber
    
    override init() {
        publisher   = PlayerServicesPublisher()
        subscriber  = Subscriber()
        
        super.init()
        setupSubscibers()
    }
    
    func setupSubscibers() {
        // game subscribing methods
//        subscriber.subscribe(observingFunction: tryLogin(_:), name: .GameTryLogin)
//        subscriber.subscribe(observingFunction: tryRegister(_:), name: .GameTryRegister)
//        subscriber.subscribe(observingFunction: tryGetUsers(_:), name: .GameTryGetUsers)
//
//        // connection subscribing methods
//        subscriber.subscribe(observingFunction: didLogin(_:), name: .ConnectionLoginSucceed)
//        subscriber.subscribe(observingFunction: loginFailed(_:), name: .ConnectionLoginFailed)
//        subscriber.subscribe(observingFunction: registerSucceed(_:), name: .ConnectionRegisterSucceed)
//        subscriber.subscribe(observingFunction: registerFailed(_:), name: .ConnectionRegisterFailed)
//        subscriber.subscribe(observingFunction: didGetUsers(_:), name: .ConnectionDidGetUsers)
    }
    
    // MARK: GAME SUBSCRIBING METHODS
    
    /* Receive player to create */
    func tryCreatePlayer(_ notification: Notification) {
        print("UserServices receieved GameTryCreatePlayer event.")
        
        // get game entities from notification
//        let tryCreatePlayerData = notification.userInfo!["data"] as! GameTryCreatePlayerData
//
//        // build DTO from game entities
//
//        // publish DTO to connection to send message to server
//        publisher.tryCreatePlayer()
    }
    
    
    // MARK: CONNECTION SUBSCRIBING METHODS
    func createPlayerSucceed(_ notification: Notification) {
        print("UserServices received ConnectionLoginSucceeded event.")

        // convert response to DTO
//        let createPlayerResponse = CreatePlayerResponseDTO(response:
//            notification.userInfo!["data"] as! Response
//        )
//        
//        // map DTO to game entities
//
//        // emit did create player notification with data
//        publisher.loginSucceeded(response: loginUserResponse)
    }
    
    func createdPlayerFailed(_ notification: Notification) {
        print("UserServices received ConnectionLoginFailed event.")
        
//        // convert response to DTO
//        let createPlayerErrorResponse = CreatePlayerErrorResponseDTO(
//            response: notification.userInfo!["data"] as! Response
//        )
//
//        // publish failed login notification
//        publisher.loginFailed(response: loginErrorResponse)
    }
}
