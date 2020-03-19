//
//  GetMapResponse.swift
//  Open Conquest
//
//  Created by Zach Wild on 12/18/19.
//  Copyright © 2019 Zach Wild. All rights reserved.
//

import Foundation
import SwiftyJSON

class GetMapResponse: Response {
    
    var map: [Map]
    
    init(response: Response) {
        
        map = [Map]()
        var tiles = [[Tile]]()
        
        var last_row = 0

        var tileRow = [Tile]()
        let mapData = response.getData()
        for tile in mapData.array! {

            let row = tile["tile_row"].int!
            let col = tile["tile_col"].int!
            let type = tile["tile_type"].int!
            let tileType = TileType.init(rawValue: type)!
            let thisTile = Tile(row: row, col: col, owner: 0, type: tileType)
            
            if row > last_row {
                tiles.append(tileRow)
                tileRow = [Tile]()
                last_row = row
            } else {
                tileRow.append(thisTile)
            }
        }
        map.append(Map(tiles: tiles))
        
        print(map)
        
        super.init(service: APIServices(rawValue: response.getService().rawValue)!, operation: APIOperations(rawValue: response.getOperation().rawValue)!, data: response.getData())
    }
    
    func getMap() -> [Map] {
        return map
    }
    
}
