//
//  CDUnit+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
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
    @NSManaged public var goldCost: Int64
    @NSManaged public var name: String?
    @NSManaged public var type: Int16
    @NSManaged public var armyUnits: NSSet?

}

// MARK: Generated accessors for armyUnits
extension CDUnit {

    @objc(addArmyUnitsObject:)
    @NSManaged public func addToArmyUnits(_ value: CDArmyUnits)

    @objc(removeArmyUnitsObject:)
    @NSManaged public func removeFromArmyUnits(_ value: CDArmyUnits)

    @objc(addArmyUnits:)
    @NSManaged public func addToArmyUnits(_ values: NSSet)

    @objc(removeArmyUnits:)
    @NSManaged public func removeFromArmyUnits(_ values: NSSet)

}
