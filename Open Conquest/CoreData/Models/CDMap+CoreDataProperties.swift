//
//  CDMap+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/11/20.
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
    @NSManaged public var tiles: CDTile?
    @NSManaged public var world: CDWorld?

}
