//
//  MapDTO.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class TileDTO {
    let row: Int
    let col: Int
    let type: Int
    
    init(json: JSON) {
        row = json["row"].int!
        col = json["col"].int!
        type = json["type"].int!
    }
    
    func toJSON() -> JSON {
        return JSON([
            "row": row,
            "col": col,
            "type": type
        ])
    }
    
    func toEntity() -> Tile {
        return Tile(row: row, col: col, owner: 0, type: TileType(rawValue: type)!)
    }
}

class MapDTO {
    var tiles = [[TileDTO]]()
    
    /* Assemble Map dto from Map json schema */
    init(json: JSON) {
        let tilesJSON = json["tiles"].array!
        for row in 0..<tilesJSON.count {
            tiles.append([TileDTO]())
            let tileRow = tilesJSON[row].array!
            for tile in tileRow {
                tiles[row].append(TileDTO(json: tile))
            }
        }
    }
    
    func toEntity() -> Map {
        var tileEntities = [[Tile]]()
        for row in 0..<tiles.count {
            tileEntities.append([Tile]())
            let tileRow = tiles[row]
            for tile in tileRow {
                tileEntities[row].append(tile.toEntity())
            }
        }
        
        return Map(tiles: tileEntities)
    }
}
