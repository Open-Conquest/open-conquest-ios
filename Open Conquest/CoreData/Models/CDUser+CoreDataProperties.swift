//
//  CDUser+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/20/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDUser> {
        return NSFetchRequest<CDUser>(entityName: "CDUser")
    }

    @NSManaged public var user_id: Int64
    @NSManaged public var user_name: String?
    @NSManaged public var world_id: Int64
    @NSManaged public var armies: NSSet?
    @NSManaged public var cities: NSSet?
    @NSManaged public var marches: NSSet?
    @NSManaged public var world: CDWorld?

}

// MARK: Generated accessors for armies
extension CDUser {

    @objc(addArmiesObject:)
    @NSManaged public func addToArmies(_ value: CDArmy)

    @objc(removeArmiesObject:)
    @NSManaged public func removeFromArmies(_ value: CDArmy)

    @objc(addArmies:)
    @NSManaged public func addToArmies(_ values: NSSet)

    @objc(removeArmies:)
    @NSManaged public func removeFromArmies(_ values: NSSet)

}

// MARK: Generated accessors for cities
extension CDUser {

    @objc(addCitiesObject:)
    @NSManaged public func addToCities(_ value: CDCity)

    @objc(removeCitiesObject:)
    @NSManaged public func removeFromCities(_ value: CDCity)

    @objc(addCities:)
    @NSManaged public func addToCities(_ values: NSSet)

    @objc(removeCities:)
    @NSManaged public func removeFromCities(_ values: NSSet)

}

// MARK: Generated accessors for marches
extension CDUser {

    @objc(addMarchesObject:)
    @NSManaged public func addToMarches(_ value: CDMarch)

    @objc(removeMarchesObject:)
    @NSManaged public func removeFromMarches(_ value: CDMarch)

    @objc(addMarches:)
    @NSManaged public func addToMarches(_ values: NSSet)

    @objc(removeMarches:)
    @NSManaged public func removeFromMarches(_ values: NSSet)

}
