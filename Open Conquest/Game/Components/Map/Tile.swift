//
//  Tile.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/1/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

enum TileType: Int
{
    case GRASS = 0
    case FOREST = 1
    case CASTLE = 2
    case TOWN = 3
}

class Tile
{
    var row: Int
    var col: Int
    var owner: Int
    var type: TileType
    
    init(row: Int, col: Int, owner: Int, type: TileType)
    {
        self.row = row
        self.col = col
        self.owner = owner
        self.type = type
    }
}
