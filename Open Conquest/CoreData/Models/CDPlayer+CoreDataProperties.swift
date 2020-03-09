//
//  CDPlayer+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/9/20.
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
    @NSManaged public var resources: CDResources?

}
