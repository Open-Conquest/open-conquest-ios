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

        // connection subscribing methods
        subscriber.subscribe(observingFunction: createPlayerSucceed(_:), name: .ConnectionCreatePlayerSucceed)
        subscriber.subscribe(observingFunction: createdPlayerFailed(_:), name: .ConnectionCreatePlayerFailed)
    }
    
    // MARK: GAME SUBSCRIBING METHODS
    
    /* Receive player to create */
    func tryCreatePlayer(_ notification: Notification) {
        print("PlayerServices receieved GameTryCreatePlayer event.")
        
        // get game entities from notification
        let tryCreatePlayerData = notification.userInfo!["data"] as! GameTryCreatePlayerData

        // build DTO from game entities
        let playerDTO = PlayerDTO(player: tryCreatePlayerData.getPlayer())
        
        // get token from keychain
        let token = Token(value: getTokenFromKeychain())
        
        // publish DTO to connectiion to send message to server
        publisher.tryCreatePlayer(token: token, player: playerDTO)
    }
    
    
    // MARK: CONNECTION SUBSCRIBING METHODS
    func createPlayerSucceed(_ notification: Notification) {
        print("PlayerServices received ConnectionCreatePlayerSucceed event.")

        // convert response to DTO
        let createPlayerResponse = CreatePlayerResponseDTO(response:
            notification.userInfo!["data"] as! Response
        )
        
        // get entities from response
        let playerDTO = createPlayerResponse.getPlayer()
        let resouresDTO = createPlayerResponse.getResources()
        let armyDTO = createPlayerResponse.getResources()
        let cityDTO = createPlayerResponse.getCity()
        // let mapDTO = createPlayerResponse.getMap()

        print("did convert and get all dtos")
        print(createPlayerResponse)
        // emit did create player notification with data
//        publisher.loginSucceeded(response: loginUserResponse)
    }
    
    func createdPlayerFailed(_ notification: Notification) {
        print("PlayerServices received ConnectionCreatePlayerFailed event.")
        
        // convert response to DTO
//        let createPlayerErrorResponse = CreatePlayerErrorResponseDTO(
//            response: notification.userInfo!["data"] as! Response
//        )
//
//        // publish failed login notification
//        publisher.loginFailed(response: loginErrorResponse)
    }
}
