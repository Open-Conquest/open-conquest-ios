//
//  Game.swift
//  Open Conquest
//
//  Created by zach on 6/27/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class Game {
    var observer: GameObserver  // registers methods of Game that should listen for notifications
    var poster: GamePoster      // used to build and post messages to scenes about game events
    var api: API                // used for the game to make calls to the api
    
    init() {
        api = API()
        observer = GameObserver()
        poster = GamePoster()
        setupObserver()
    }
    
    func setupObserver() {
        observer.setupObservers(game: self)
    }
    
    // TODO: remove this crap
    func getMap() -> Map {
        // mock map
        var tiles: [[Tile]] = [[Tile]]()
        for var row in 0...5 {
            tiles.append([Tile]())
            for var col in 0...5 {
                let number = Int.random(in: 0 ..< 10)
                var type: TileType
                type = TileType.CASTLE
                if number < 5 {
                    type = TileType.GRASS
                }
                tiles[row].append(Tile(row: row, col: col, owner: 0, type: type))
            }
        }
        
        var map: Map = Map(tiles: tiles)
        return map
    }
    
    // MARK: OBSERVING METHODS
    @objc func tryLogin(_ notification: Notification) {
        print("--returning mock response for try login--")
        poster.didLogin()
    }
    
    @objc func didLogin(_ notification: Notification) {
        print("login receieved from api")
    }
}
