//
//  CDTile+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/20/20.
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
    @NSManaged public var ending_marches: NSSet?
    @NSManaged public var starting_marches: NSSet?

}

// MARK: Generated accessors for ending_marches
extension CDTile {

    @objc(addEnding_marchesObject:)
    @NSManaged public func addToEnding_marches(_ value: CDMarch)

    @objc(removeEnding_marchesObject:)
    @NSManaged public func removeFromEnding_marches(_ value: CDMarch)

    @objc(addEnding_marches:)
    @NSManaged public func addToEnding_marches(_ values: NSSet)

    @objc(removeEnding_marches:)
    @NSManaged public func removeFromEnding_marches(_ values: NSSet)

}

// MARK: Generated accessors for starting_marches
extension CDTile {

    @objc(addStarting_marchesObject:)
    @NSManaged public func addToStarting_marches(_ value: CDMarch)

    @objc(removeStarting_marchesObject:)
    @NSManaged public func removeFromStarting_marches(_ value: CDMarch)

    @objc(addStarting_marches:)
    @NSManaged public func addToStarting_marches(_ values: NSSet)

    @objc(removeStarting_marches:)
    @NSManaged public func removeFromStarting_marches(_ values: NSSet)

}
