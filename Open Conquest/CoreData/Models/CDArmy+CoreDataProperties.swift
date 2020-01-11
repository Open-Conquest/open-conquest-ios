//
//  CDArmy+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/11/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDArmy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDArmy> {
        return NSFetchRequest<CDArmy>(entityName: "CDArmy")
    }

    @NSManaged public var army_id: Int64
    @NSManaged public var user_id: Int64
    @NSManaged public var units: NSSet?
    @NSManaged public var user: CDUser?

}

// MARK: Generated accessors for units
extension CDArmy {

    @objc(addUnitsObject:)
    @NSManaged public func addToUnits(_ value: CDArmy_Units)

    @objc(removeUnitsObject:)
    @NSManaged public func removeFromUnits(_ value: CDArmy_Units)

    @objc(addUnits:)
    @NSManaged public func addToUnits(_ values: NSSet)

    @objc(removeUnits:)
    @NSManaged public func removeFromUnits(_ values: NSSet)

}
