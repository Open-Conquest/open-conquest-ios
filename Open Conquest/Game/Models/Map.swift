//
//  Map.swift
//  Open Conquest
//
//  Created by Zach Wild on 5/31/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation

class Map
{
    
    var tiles: [[Tile]]
    var numRows: Int
    var numCols: Int
    
    init(tiles: [[Tile]])
    {
        self.tiles = tiles
        
        // assuming uniform row length
        self.numRows = tiles.count
        self.numCols = tiles[0].count
    }
    
    init()
    {
        self.tiles = [[Tile]]()
        
        self.numRows = 0
        self.numCols = 0
    }
    
}
