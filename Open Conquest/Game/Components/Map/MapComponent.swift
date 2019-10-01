//
//  Map.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class MapComponent {
    
    var map: Map
    
    init() {
        map = Map()
    }
    
    func getMap() -> Map {
        // mock map
        var tiles: [[Tile]] = [[Tile]]()
        for row in 0...5 {
            tiles.append([Tile]())
            for col in 0...5 {
                let number = Int.random(in: 0 ..< 10)
                var type: TileType
                type = TileType.CASTLE
                if number < 5 {
                    type = TileType.GRASS
                }
                tiles[row].append(Tile(row: row, col: col, owner: 0, type: type))
            }
        }
        
        let map: Map = Map(tiles: tiles)
        return map
    }
    
}
