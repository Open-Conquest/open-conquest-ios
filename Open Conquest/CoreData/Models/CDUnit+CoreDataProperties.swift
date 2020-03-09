//
//  CDUnit+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/9/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDUnit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUnit> {
        return NSFetchRequest<CDUnit>(entityName: "CDUnit")
    }

    @NSManaged public var attack: Int64
    @NSManaged public var defense: Int64
    @NSManaged public var gold_cost: Int64
    @NSManaged public var level: Int64
    @NSManaged public var name: String?
    @NSManaged public var unit_id: Int64
    @NSManaged public var army_units: NSSet?

}

// MARK: Generated accessors for army_units
extension CDUnit {

    @objc(addArmy_unitsObject:)
    @NSManaged public func addToArmy_units(_ value: CDArmy_Units)

    @objc(removeArmy_unitsObject:)
    @NSManaged public func removeFromArmy_units(_ value: CDArmy_Units)

    @objc(addArmy_units:)
    @NSManaged public func addToArmy_units(_ values: NSSet)

    @objc(removeArmy_units:)
    @NSManaged public func removeFromArmy_units(_ values: NSSet)

}
