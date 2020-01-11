//
//  CDTile+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/11/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDTile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTile> {
        return NSFetchRequest<CDTile>(entityName: "CDTile")
    }

    @NSManaged public var map_id: Int64
    @NSManaged public var tile_col: Int64
    @NSManaged public var tile_id: Int64
    @NSManaged public var tile_row: Int64
    @NSManaged public var tile_type: Int64
    @NSManaged public var city: CDCity?
    @NSManaged public var map: CDMap?

}
