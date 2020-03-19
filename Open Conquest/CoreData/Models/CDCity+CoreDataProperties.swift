//
//  CDCity+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 3/12/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDCity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCity> {
        return NSFetchRequest<CDCity>(entityName: "CDCity")
    }

    @NSManaged public var col: Int16
    @NSManaged public var level: Int16
    @NSManaged public var name: String?
    @NSManaged public var row: Int16
    @NSManaged public var player: CDPlayer?

}
