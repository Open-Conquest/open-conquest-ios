//
//  PlayerServices.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

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
        let player = createPlayerResponse.getPlayer().toEntity()
        let resources = createPlayerResponse.getResources().toEntity()
        let army = createPlayerResponse.getArmy().toEntity()
        let city = createPlayerResponse.getCity().toEntity()
        // let mapDTO = createPlayerResponse.getMap().toEntity()
        
        // set player's resources, city, and army
        player.addArmy(army: army)
        player.addCity(city: city)
        player.setResources(resources: resources)
        
        // emit did create player notification with data
        publisher.createPlayerSucceed(player: player)
    }
    
    func createdPlayerFailed(_ notification: Notification) {
        print("PlayerServices received ConnectionCreatePlayerFailed event.")
        
        let createPlayerErrorResponse = CreatePlayerErrorResponseDTO(
            response: notification.userInfo!["data"] as! Response
        )
        
        publisher.createPlayerFailed(message: createPlayerErrorResponse.getMessage())
    }
}
