//
//  Tile.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

/**
 Enum to represent a tile type. This enum corresponds with the `tile` entity's `tile_type` coding in the database.
 */
enum TileType: Int
{
    case GRASS = 0
    case CASTLE = 1
}

/**
 Model class for storing a tile's properties. Based of the `tile` entity.
 */
class Tile {
    var row: Int
    var col: Int
    var owner: Int
    var type: TileType
    
    init(row: Int, col: Int, owner: Int, type: TileType) {
        self.row = row
        self.col = col
        self.owner = owner
        self.type = type
    }
}
