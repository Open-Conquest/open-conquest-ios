//
//  CDArmy_Units+CoreDataProperties.swift
//  Open Conquest
//
//  Created by Zach Wild on 1/11/20.
//  Copyright © 2020 Zach Wild. All rights reserved.
//
//

import Foundation
import CoreData


extension CDArmy_Units {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDArmy_Units> {
        return NSFetchRequest<CDArmy_Units>(entityName: "CDArmy_Units")
    }

    @NSManaged public var army_id: Int64
    @NSManaged public var army_units_id: Int64
    @NSManaged public var unit_count: Int64
    @NSManaged public var unit_id: Int64
    @NSManaged public var army: CDArmy?
    @NSManaged public var unit: CDUnit?

}
