//
//  CDWorld+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/9/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDWorld {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWorld> {
        return NSFetchRequest<CDWorld>(entityName: "CDWorld")
    }

    @NSManaged public var world_id: Int64
    @NSManaged public var world_name: String?
    @NSManaged public var map: CDMap?
    @NSManaged public var users: NSSet?

}

// MARK: Generated accessors for users
extension CDWorld {

    @objc(addUsersObject:)
    @NSManaged public func addToUsers(_ value: CDUser)

    @objc(removeUsersObject:)
    @NSManaged public func removeFromUsers(_ value: CDUser)

    @objc(addUsers:)
    @NSManaged public func addToUsers(_ values: NSSet)

    @objc(removeUsers:)
    @NSManaged public func removeFromUsers(_ values: NSSet)

}
