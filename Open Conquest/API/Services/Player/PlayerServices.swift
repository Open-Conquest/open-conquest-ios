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
    
    /*
        Subscribe listening methods to notifications from Connection & Game controllers.
     */
    func setupSubscibers() {
        subscriber.subscribe(observingFunction: tryCreatePlayer(_:), name: .GameTryCreatePlayer)

        subscriber.subscribe(observingFunction: createPlayerSucceed(_:), name: .ConnectionCreatePlayerSucceed)
        subscriber.subscribe(observingFunction: createdPlayerFailed(_:), name: .ConnectionCreatePlayerFailed)
    }
    
    // MARK: GAME SUBSCRIBING METHODS
    
    /*
        Listening for Game's GameTryCreatePlayer notification for trying to create a new player.
        Its expected that this notification will have a GameTryCreatePlayerData object that contains
        the player's name that the game wants to try to create.
     */
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
    
    /*
        Listening to Connection's ConnectionCreatePlayerSucced notification for receiving
        a create player succeed message from the world server. Should create a notification
        with a player entity from the json in the message. The expected json is defined in the
        CreatePlayerResponse schema.
     */
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
        
        // set player's resources, city, and army
        player.addArmy(army: army)
        player.setCity(city: city)
        player.setResources(resources: resources)
        
        // emit did create player notification with data
        publisher.createPlayerSucceed(player: player)
    }
    
    /*
        Listening to Connection's notification for receiving a create player failed
        message from the world server. Should post a notification containing the error
        message from the message. The Response data thats expected is defined in the
        CreatePlayerErrorResponse schema.
     */
    func createdPlayerFailed(_ notification: Notification) {
        print("PlayerServices received ConnectionCreatePlayerFailed event.")
        
        let createPlayerErrorResponse = CreatePlayerErrorResponseDTO(
            response: notification.userInfo!["data"] as! Response
        )
        
        publisher.createPlayerFailed(message: createPlayerErrorResponse.getMessage())
    }
}
