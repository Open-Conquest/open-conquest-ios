//
//  PlayerService.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/7/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class PlayerService: GameService {
    var player: Player?
    var publisher: PlayerServicePublisher
    var subscriber: Subscriber
    let playerRepository: PlayerRepository
    
    init(playerRepository: PlayerRepository) {
        self.publisher  = PlayerServicePublisher()
        self.subscriber = Subscriber()
        self.playerRepository = playerRepository
        setupSubscribers()
    }
    
    func setupSubscribers() {
        // subscribe to scene notifications
        subscriber.subscribe(observingFunction: tryCreatePlayer(_:), name: .SceneTryCreatePlayer)
        
        // subscribe to api notifications
        subscriber.subscribe(observingFunction: createPlayerSucceed(_:), name: .APICreatePlayerSucceed)
        subscriber.subscribe(observingFunction: createPlayerFailed(_:), name: .APICreatePlayerFailed)
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
    
    // listening to api
    func createPlayerSucceed(_ notification: Notification) {
        print("PlayerService recieved APICreatePlayerSucceed event.")

        // get player entity from notification
        let createdPlayer = notification.userInfo!["data"] as! Player
        
        // save player to core data
        playerRepository.savePlayer(player: createdPlayer)
        
        // post notifcation for scene to transition
        publisher.createPlayerSucceed()
    }
    
    func createPlayerFailed(_ notification: Notification) {
        print("PlayerService received APICreatePlayerFailed event")
        
        let message = notification.userInfo!["data"] as! String
        
        publisher.createPlayerFailed(message: message)
    }
}

