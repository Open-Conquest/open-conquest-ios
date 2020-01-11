//
//  CDMarch+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/11/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDMarch {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMarch> {
        return NSFetchRequest<CDMarch>(entityName: "CDMarch")
    }

    @NSManaged public var army_id: Int64
    @NSManaged public var end_tile_id: Int64
    @NSManaged public var end_time: Date?
    @NSManaged public var march_id: Int64
    @NSManaged public var speed_modifier: Float
    @NSManaged public var start_tile_id: Int64
    @NSManaged public var start_time: Date?
    @NSManaged public var army: CDArmy?
    @NSManaged public var end_tile: CDTile?
    @NSManaged public var start_tile: CDTile?

}
