//
//  CDMap+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/9/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDMap {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMap> {
        return NSFetchRequest<CDMap>(entityName: "CDMap")
    }

    @NSManaged public var map_id: Int64
    @NSManaged public var world_id: Int64
    @NSManaged public var tiles: NSSet?
    @NSManaged public var world: CDWorld?

}

// MARK: Generated accessors for tiles
extension CDMap {

    @objc(addTilesObject:)
    @NSManaged public func addToTiles(_ value: CDTile)

    @objc(removeTilesObject:)
    @NSManaged public func removeFromTiles(_ value: CDTile)

    @objc(addTiles:)
    @NSManaged public func addToTiles(_ values: NSSet)

    @objc(removeTiles:)
    @NSManaged public func removeFromTiles(_ values: NSSet)

}
