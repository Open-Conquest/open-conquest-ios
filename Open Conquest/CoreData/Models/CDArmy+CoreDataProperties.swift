//
//  CDArmy+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDArmy {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDArmy> {
        return NSFetchRequest<CDArmy>(entityName: "CDArmy")
    }

    @NSManaged public var armyUnits: NSSet?
    @NSManaged public var player: CDPlayer?

}

// MARK: Generated accessors for armyUnits
extension CDArmy {

    @objc(addArmyUnitsObject:)
    @NSManaged public func addToArmyUnits(_ value: CDArmyUnits)

    @objc(removeArmyUnitsObject:)
    @NSManaged public func removeFromArmyUnits(_ value: CDArmyUnits)

    @objc(addArmyUnits:)
    @NSManaged public func addToArmyUnits(_ values: NSSet)

    @objc(removeArmyUnits:)
    @NSManaged public func removeFromArmyUnits(_ values: NSSet)

}
