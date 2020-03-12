//
//  CDResources+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDResources {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDResources> {
        return NSFetchRequest<CDResources>(entityName: "CDResources")
    }

    @NSManaged public var gold: Int64
    @NSManaged public var player: CDPlayer?

}
