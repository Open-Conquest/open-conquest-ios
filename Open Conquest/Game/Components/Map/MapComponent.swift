//
//  Map.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MapComponent: GameComponent {
    var map: Map?
    let subscriber: Subscriber
    let publisher: MapComponentPublisher
    
    init() {
        publisher = MapComponentPublisher()
        subscriber = Subscriber()
        setupSubscribers()
    }
    
    func setupSubscribers() {
        subscriber.subscribe(observingFunction: tryGetMap(_:), name: .SceneTryGetMap)
        subscriber.subscribe(observingFunction: didGetMap(_:), name: .APIDidGetMap)
    }
    
    func update(notification: Notification) {
        /*
            long comment about how this should be implemented
            you need to implement this because i said so..
            might change in the future but for now it seems like a good idea
        */
        
    }
    
    // MARK: SCENE SUBSCRIBING METHODS
    
    func tryGetMap(_ notification: Notification) {
        print("MapComponent recieved scene-try-get-map event...")
        
        // if map is already initialized
        if (map != nil) {
            publisher.didGetMap(map: map!)
        }
        // if map hasn't been initialized
        else {
            publisher.tryGetMap()
        }
        
    }
    
    // MARK: API SUBSCRIBING METHODS
    
    func didGetMap(_ notification: Notification) {
        print("MapComponent recieved api-did-get-map event...")
        let maps = notification.userInfo!["data"] as! [Map]
        map = maps[0]
        publisher.didGetMap(map: map!)
    }
    
//    override func update(notification: Notification) {
//        let data = notification.userInfo
//        let mapData = data!["map"]
//    }
//
//    func setGame(game: Game) {
//        self.game = game
//    }
//
//    func getMap() -> Map {
//        // mock map
//        var tiles: [[Tile]] = [[Tile]]()
//        for row in 0...5 {
//            tiles.append([Tile]())
//            for col in 0...5 {
//                let number = Int.random(in: 0 ..< 10)
//                var type: TileType
//                type = TileType.CASTLE
//                if number < 5 {
//                    type = TileType.GRASS
//                }
//                tiles[row].append(Tile(row: row, col: col, owner: 0, type: type))
//            }
//        }
//
//        let map: Map = Map(tiles: tiles)
//        return map
//    }
    
}
