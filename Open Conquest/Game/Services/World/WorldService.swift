//
//  WorldService.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation

class WorldService {
    var publisher: WorldServicePublisher
    var subscriber: Subscriber
    var playerRepository: PlayerRepository
    var mapRepository: MapRepository
    var cityRepository: CityRepository
    var world: World?
    
    init(playerRepository: PlayerRepository, mapRepository: MapRepository, cityRepository: CityRepository) {
        publisher = WorldServicePublisher()
        subscriber = Subscriber()
        self.playerRepository = playerRepository
        self.mapRepository = mapRepository
        self.cityRepository = cityRepository
        setupSubscribers()
    }
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: tryGetWorld(_:), name: .SceneTryGetWorld)
        subscriber.subscribe(observingFunction: didGetWorld(_:), name: .APIDidGetWorld)
        subscriber.subscribe(observingFunction: didGetWorldFailed(_:), name: .APIDidGetWorldFailed)
    }
    
    func teardownSubscribers() {
        subscriber.unsubscribe(observingFunction: tryGetWorld(_:))
        subscriber.unsubscribe(observingFunction: didGetWorld(_:))
        subscriber.unsubscribe(observingFunction: didGetWorldFailed(_:))
    }
    
    // try get world from scene
    func tryGetWorld(_ notification: Notification) {
        print("WorldService received scene-try-get-world event")
        if (self.world == nil) {
            publisher.tryGetWorld()
        } else {
            publisher.didGetWorld(world: self.world!)
        }
    }
    
    // did get world from api
    func didGetWorld(_ notification: Notification) {
        print("WorldService received api-did-get-world event")
        // get world entity from notification
        world = notification.userInfo!["data"] as! World
        // save map to core data
        mapRepository.saveMap(map: world!.map)
        // save players to core data
        playerRepository.savePlayers(players: world!.players)
        // save cities to core data
        cityRepository.saveCities(cities: world!.cities)
        
        // publish notification with world data
        publisher.didGetWorld(world: world!)
    }
    
    // get world error from api
    func didGetWorldFailed(_ notification: Notification) {
        print("WorldService received api-did-get-world-failed event")
    }
}
