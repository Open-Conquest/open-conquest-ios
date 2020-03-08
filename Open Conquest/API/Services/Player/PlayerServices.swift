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
    var publisher: PlayerServicesPublisher
    var subscriber: Subscriber
    
    override init() {
        publisher = PlayerServicesPublisher()
        subscriber = Subscriber()
        
        super.init()
        setupSubscibers()
    }
    
    func setupSubscibers() {
        // game subscribing methods
        subscriber.subscribe(observingFunction: tryCreatePlayer(_:), name: .GameTryCreatePlayer)
//
//        // connection subscribing methods
//        subscriber.subscribe(observingFunction: didLogin(_:), name: .ConnectionLoginSucceed)
//        subscriber.subscribe(observingFunction: loginFailed(_:), name: .ConnectionLoginFailed)
    }
    
    // MARK: GAME SUBSCRIBING METHODS
    
    /* Receive player to create */
    func tryCreatePlayer(_ notification: Notification) {
        print("UserServices receieved GameTryCreatePlayer event.")
        
        // get game entities from notification
        let tryCreatePlayerData = notification.userInfo!["data"] as! GameTryCreatePlayerData

        // build DTO from game entities
        let playerDTO = PlayerDTO(player: tryCreatePlayerData.getPlayer())
        
        // get token from keychain
        let token = Token(value: getTokenFromKeychain())
        
        // publish DTO to connection to send message to server
        publisher.tryCreatePlayer(token: token, player: playerDTO)
    }
    
    
    // MARK: CONNECTION SUBSCRIBING METHODS
    func createPlayerSucceed(_ notification: Notification) {
        print("UserServices received ConnectionCreatePlayerSucceed event.")

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
        print("UserServices received ConnectionCreatePlayerFailed event.")
        
//        // convert response to DTO
//        let createPlayerErrorResponse = CreatePlayerErrorResponseDTO(
//            response: notification.userInfo!["data"] as! Response
//        )
//
//        // publish failed login notification
//        publisher.loginFailed(response: loginErrorResponse)
    }
}
