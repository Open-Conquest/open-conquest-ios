//
//  Map.swift
//  Open Conquest
//
//  Created by Zach Wild on 10/2/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class Map: GameComponentModel {
    
    func toJSON() -> JSON {
        fatalError()
    }
    
    var tiles: [[Tile]]
    var numRows: Int
    var numCols: Int

    init(tiles: [[Tile]]) {
        self.tiles = tiles

        // assuming uniform row length
        self.numRows = tiles.count
        self.numCols = tiles[0].count
    }

    required init(json: JSON) {
        tiles = [[Tile]]()
        numRows = 0
        numCols = 0
    }
    
    init() {
       self.tiles = [[Tile]]()
       
       self.numRows = 0
       self.numCols = 0
    }
    
    func update() {
        
    }
}


