//
//  CDPlayer+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDPlayer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPlayer> {
        return NSFetchRequest<CDPlayer>(entityName: "CDPlayer")
    }

    @NSManaged public var name: String?
    @NSManaged public var armies: NSSet?
    @NSManaged public var city: CDCity?
    @NSManaged public var resources: CDResources?

}

// MARK: Generated accessors for armies
extension CDPlayer {

    @objc(addArmiesObject:)
    @NSManaged public func addToArmies(_ value: CDArmy)

    @objc(removeArmiesObject:)
    @NSManaged public func removeFromArmies(_ value: CDArmy)

    @objc(addArmies:)
    @NSManaged public func addToArmies(_ values: NSSet)

    @objc(removeArmies:)
    @NSManaged public func removeFromArmies(_ values: NSSet)

}
