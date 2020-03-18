//
//  MapRepository.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/18/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//

import Foundation
import CoreData

class MapRepository {
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func saveMap(map: Map) {
        let mapEntity = NSEntityDescription.entity(forEntityName: "CDMap", in: context)
        let cdMap = CDMap(entity: mapEntity!, insertInto: context)
        cdMap.setValue(map.numRows, forKey: "maxRows")
        cdMap.setValue(map.numCols, forKey: "maxCols")
        cdMap.setValue("Map #001", forKey: "name")
        cdMap.setValue(1, forKey: "map_id")
        
        let tiles = map.tiles
        for row in 0..<tiles.count {
            let tileRow = tiles[row]
            for tile in tileRow {
                let tileEntity = NSEntityDescription.entity(forEntityName: "CDTile", in: context)
                let cdTile = CDTile(entity: tileEntity!, insertInto: context)
                cdTile.setValue(tile.row, forKey: "row")
                cdTile.setValue(tile.col, forKey: "col")
                cdTile.setValue(tile.type.rawValue, forKey: "type")
            }
        }

        do {
            try context.save()
        } catch {
            print("FUCKKKKKK")
        }
    }
}
